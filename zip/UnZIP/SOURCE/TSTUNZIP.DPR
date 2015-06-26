program tstunzip;

{$ifdef win32}
{$apptype console}
uses wintypes,winprocs,sysutils,packdefs,zipread,unzip,zipinter;
{$else}
uses wintypes,winprocs,sysutils,packdefs,zipread,unzip,wincrt;
{$endif}

const methods:array[0..8] of pchar=
  ('stored','shrunk','reduced 1','reduced 2','reduced 3',
   'reduced 4','imploded','tokenized','deflated');
const action:array[0..8] of pchar=
  ('copying','unshrinking','unreducing 1','unreducing 2','unreducing 3',
   'unreducing 4','exploding','un-tokenizing','inflating');

var rc:integer;
    r:tpackrec;
    buf,thename,target:tdirtype;
    i:word;

begin
  Writeln('Supported ZIP methods:');
  for i:=0 to 8 do     {8 because of array above}
    if ((1 shl i) and GetSupportedMethods)<>0
      then writeln(methods[i]);
  Writeln;

  write('Please enter ZIP filename:');
  readln(thename);
  write('Please enter target directory:');
  readln(target);
  if (target[0]<>#0) and (target[strlen(target)-1]<>'\')
    then strcat(target,'\');
  if not iszip(thename) then writeln('The specified file is not found or not a ZIP file!')
  else begin
    writeln('Press ESC to abort!');
    rc:=getfirstinzip(thename,r);
    while rc=zip_ok do begin
      write(r.filename);
      write(' ... ');
      for i:=strlen(r.filename) to 20 do write(' ');
      write(action[r.packmethod],' ... ');
      strcopy(buf,target);
      strcat(buf,r.filename);
      rc:=unzipfile(thename,buf,r.attr,r.headeroffset,0,vk_escape); {Escape interrupts}
      if rc=unzip_ok then
        writeln('Ok')
      else case rc of
        unzip_CRCErr:writeln('CRC-Error!');
        unzip_WriteErr:writeln('Write error!');
        unzip_ReadErr:writeln('Read error!');
        unzip_ZipFileErr:writeln('Error in Zip file structure!');
        unzip_UserAbort:writeln('Aborted by user!');
        unzip_NotSupported:if r.packmethod<=8 then
          writeln('Format ',methods[r.packmethod],' not supported!')
        else
          writeln('Unknown pack method ',r.packmethod,'!');
        unzip_Encrypted:writeln('File encrypted, skipped!');
        unzip_InUse:writeln('DLL already in use, try later or use pkunzip!');
      end;
      if (rc=unzip_ReadErr) or (rc=unzip_Userabort) or
         (rc=unzip_InUse)   or (rc=unzip_ZipFileErr) then
        rc:=-100   {Serious error, force abort}
      else
        rc:=getnextinzip(r);
    end;
    closezipfile(r);               {Free memory used for central directory info}
    case rc of
      zip_FileError:writeln('Error reading Zipfile!');
      zip_InternalError:writeln('Error in Zip file structure!');
      -100:writeln('Unzipping aborted!');
    end;
  end;
  writeln('All done! Press ENTER to close the program!');
  readln;
end.

