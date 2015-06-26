program TstToMem;

{$ifdef win32}
{$apptype console}
uses wintypes,winprocs,sysutils,packdefs,unzip,zipread;
{$else}
uses wintypes,winprocs,sysutils,packdefs,unzip,zipread,wincrt;
{$endif}

const methods:array[0..8] of pchar=
  ('stored','shrunk','reduced 1','reduced 2','reduced 3',
   'reduced 4','imploded','tokenized','deflated');
const action:array[0..8] of pchar=
  ('copying','unshrinking','unreducing 1','unreducing 2','unreducing 3',
   'unreducing 4','exploding','un-tokenizing','inflating');

var rc:integer;
    r:tpackrec;
    thename:tdirtype;
    i:word;

const buf_size=256;
var out_buf:array[0..buf_size-1] of char;
    thesize:longint;

begin
  writeln('Unzip first 256 bytes of each file in ZIP to memory and show on screen');
  write('Please enter ZIP filename:');
  readln(thename);
  if not iszip(thename) then writeln('The specified file is not found or not a ZIP file!')
  else begin
    writeln('Press ESC to abort!');
    rc:=getfirstinzip(thename,r);
    while rc=zip_ok do begin
      write(r.filename);
      write(' ... ');
      for i:=strlen(r.filename) to 20 do write(' ');
      write(action[r.packmethod],' ... ');
      fillchar(out_buf[0],buf_size,#0);
      thesize:=buf_size;
      rc:=unzipfiletomemory(thename,out_buf,thesize,r.headeroffset,0,vk_escape);
      if rc=unzip_ok then begin
        writeln('Ok');
        out_buf[buf_size-1]:=#0;
        writeln(out_buf);
      end else case rc of
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
      for i:=1 to 79 do write('-');  writeln;
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

