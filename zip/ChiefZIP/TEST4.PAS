PROGRAM test4;
{$I unzip.Inc}

{$ifdef Windows}
USES
wintypes,
winprocs,
{$ifdef Delphi}sysutils, {$else}windos, strings, {$endif Delphi}
unzip,
ziptypes,
wincrt;
{$else}
USES
{$ifdef __GPC__}
gpc,
{$endif}
strings,
unzip,
ziptypes;
{$endif}

{$ifdef Win16}
  {$M 8192,8192}
{$endif Win16}


VAR rc : integer;
    r : tziprec;
    buf, thename, target : TDirType;
    i : word;
    s : string [255];

BEGIN
   {$ifdef Windows}
   WITH ScreenSize DO BEGIN
        x := 75;
        y := 800;
   END;
   WITH WindowOrg DO BEGIN
        x := 1;
        y := 1
   END;
  {$endif}
  Writeln ( 'Supported ZIP unzipmethods:' );
  FOR i := 0 TO 8 DO     {8 because of array above}
    IF ( ( 1 SHL i ) AND GetSupportedMethods ) <> 0
      THEN writeln ( unzipmethods [ i ] );

  Writeln;
  write ( 'Please enter ZIP filename: ' );
  readln ( s );
  IF s = '' THEN Halt;
  strpcopy ( thename, s );

  write ( 'Please enter target directory: ' );
  readln ( s );
  IF s = '' THEN Halt;
  strpcopy ( target, s );

  IF ( target [ 0 ] <> #0 ) AND NOT ( target [ strlen ( target ) - 1 ] IN ['\', '/'] ) THEN
  strcat ( target, OS_Path_Separator );

  IF NOT iszip ( thename ) THEN writeln ( 'The specified file is not found or not a ZIP file!' )
  ELSE BEGIN
    writeln ( 'Press ESC to abort!' );
    rc := getfirstinzip ( thename, r );
    WHILE rc = unzip_ok DO BEGIN
      write ( strpas ( r.filename ) );
      write ( ' ... ' );
      FOR i := strlen ( r.filename ) TO 20 DO write ( ' ' );
      write ( unzipactions [ r.packmethod ], ' ... ' );
      strcopy ( buf, target );
      strcat ( buf, r.filename );
      rc := unzipfile ( thename, buf, r.headeroffset, 0,
      {$ifdef Windows}vk_escape{$else}27{$endif} ); {Escape interrupts}
      IF rc = unzip_ok THEN
        writeln ( 'Ok' )
      ELSE CASE rc OF
        unzip_CRCErr : writeln ( 'CRC-Error!' );
        unzip_WriteErr : writeln ( 'Write error!' );
        unzip_ReadErr : writeln ( 'Read error!' );
        unzip_ZipFileErr : writeln ( 'Error in Zip file structure!' );
        unzip_UserAbort : writeln ( 'Aborted by user!' );
        unzip_NotSupported : IF r.packmethod <= 8 THEN
          writeln ( 'Format ', unzipmethods [ r.packmethod ], ' not supported!' )
        ELSE
          writeln ( 'Unknown pack method ', r.packmethod, '!' );
        unzip_Encrypted : writeln ( 'File encrypted, skipped!' );
        unzip_InUse : writeln ( 'DLL already in use, try later or use pkunzip!' );
      END;
      IF ( rc = unzip_ReadErr ) OR ( rc = unzip_Userabort ) OR
         ( rc = unzip_InUse )   OR ( rc = unzip_ZipFileErr ) THEN
        rc := unzip_SeriousError   {Serious error, force abort}
      ELSE
        rc := getnextinzip ( r );
    END;
    closezipfile ( r );               {Free memory used for central directory info}
    CASE rc OF
      unzip_FileError : writeln ( 'Error reading Zipfile!' );
      unzip_InternalError : writeln ( 'Error in Zip file structure!' );
      unzip_SeriousError : writeln ( 'Unzipping aborted!' );
    END;
  END;
END.
