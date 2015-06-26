{
test program for unzip, using a simple Pascal object
}
PROGRAM test2;
{$I unzip.Inc}

{$ifdef windows}
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

TYPE
UnZipObject = OBJECT
   CONSTRUCTOR Init ( CONST ZipFile, Directory, FileSpecs : String;Report : UnzipReportProc );
   DESTRUCTOR  Done;VIRTUAL;
   FUNCTION    Run : integer;VIRTUAL;
   FUNCTION    View : integer;VIRTUAL;
   {$ifndef __GPC__}PRIVATE{$endif}
      NoRecurse : Boolean;
      aName,
      aDir,
      aSpec : TDirType;
      ZipReport : UnzipReportProc;
END;

{/////////////////////////////////////////////////////}
PROCEDURE Report ( Retcode : longint;R : pReportRec );
{$ifdef USE_STDCALL}STDCALL;{$else}
{$ifdef Windows}EXPORT;{$endif}{$endif}
BEGIN
  WITH r^ DO
  CASE Status OF
  file_failure : BEGIN
     writeln ( 'ERROR extracting file: ', strpas ( filename ), '; Errorcode=', retcode );
  END;

  file_completed :
   Writeln
   ( 
   UnzipMethods [ packmethod ] : 9,
   '  ', Size : 9,
   '  ', CompressSize : 9,
   '  ', Ratio : 5, '%',
   '  ', strpas ( filename )
   );
   unzip_completed :
   Writeln
   ( 
   'Archived' : 9,
   '  ', Size : 9,
   '  ', CompressSize : 9,
   '  ', Ratio : 5, '%',
   '  ', strpas ( filename )
   );

 END {case}
END; {Report}
{/////////////////////////////////////////////////////}
PROCEDURE Report2 ( Retcode : longint;R : pReportRec );
{$ifdef USE_STDCALL}STDCALL;{$else}
{$ifdef Windows}EXPORT;{$endif}{$endif}
BEGIN
   WITH r^ DO
   Writeln
   ( 
   UnzipMethods [ packmethod ] : 9,
   '  ', Size : 9,
   '  ', CompressSize : 9,
   '  ', Ratio : 5, '%',
   '  ', strpas ( filename )
   );
END; {Report2}
{/////////////////////////////////////////////////////}
CONSTRUCTOR UnZipObject.Init;
BEGIN
  ZipReport := Report;
  NoRecurse := Upper ( paramstr ( ParamCount ) ) = '/D-'; {/D- = don't recurse}
  IF ( NoRecurse ) AND ( ParamCount < 4 )
  THEN StrPcopy ( aSpec, '*.*' ) ELSE StrPcopy ( aSpec, FileSpecs );
  StrPcopy ( aName, ZipFile );
  IF pos ( '.', Strpas ( aName ) ) = 0 THEN StrCat ( aName, '.zip' );
  StrPcopy ( adir, Directory );
END;

DESTRUCTOR  UnZipObject.Done;
BEGIN
  SetNoRecurseDirs ( FALSE );
END;

FUNCTION    UnZipObject.Run : integer;
VAR
x : UnzipQuestionProc;
BEGIN
  SetNoRecurseDirs ( NoRecurse );
  {$ifndef FPC}@{$endif}x := NIL;
  Run := FileUnzip ( aName, aDir, aSpec, ZipReport, x );
END;

FUNCTION    UnZipObject.View : integer;
VAR
i : longint;
BEGIN
  i := ViewZip ( aName, aSpec, Report2 );
  {$ifdef ver70}View{$else}Result{$endif} := i;
END;

VAR
Zip : UnZipObject;
i : integer;
p : pchar;
BEGIN
  IF ( paramcount < 2 )
  THEN BEGIN
    getmem ( p, 512 );
    strcopy ( p, 'Syntax=TEST2 <filename.ZIP> <[target dir] or [/v]> [specs] [/D-]'#13#10#13#10 );
    Strcat ( p, 'Examples: '#13#10 );
    Strcat ( p, '    TEST2 TEST.ZIP C:\TEMP'#13#10 );
    Strcat ( p, '    TEST2 TEST.ZIP C:\TEMP *.PAS'#13#10 );
    Strcat ( p, '    TEST2 TEST.ZIP C:\TEMP ZIP*.*'#13#10 );
    Strcat ( p, '    TEST2 TEST.ZIP C:\TEMP /D-'#13#10 );
    Strcat ( p, '    TEST2 TEST.ZIP /V'#13#10 );
    Strcat ( p, '    TEST2 TEST.ZIP /V *.EXE'#13#10 );

  {$ifdef Windows}
     Messagebox ( 0, p, 'Chief''s UNZIP', 0 );
  {$else Windows}
     Writeln ( p );
  {$endif Windows}
     freemem ( p, 512 );
     halt;
  END;

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

  WITH Zip DO BEGIN
      Init ( ParamStr ( 1 ), ParamStr ( 2 ), ParamStr ( 3 ), Report );
      IF ( upper ( paramstr ( 2 ) ) = '/V' )
      OR ( upper ( paramstr ( 2 ) ) = '-V' )
      THEN Writeln ( Zip.View ) ELSE Writeln ( Zip.Run );
      Done;
  END;
END.
