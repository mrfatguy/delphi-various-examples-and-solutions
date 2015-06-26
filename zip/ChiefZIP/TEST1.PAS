{
Test program for UNZIP;
  Under Windows and OS/2, it uses the DLL (in UNZIPDLL.PAS), which must be
  compiled first
}

PROGRAM Test1;
{$I unzip.Inc}

{$ifdef Windows}
USES
wintypes,
winprocs,
{$ifdef Delphi} sysutils, {$else Delphi}windos, strings, {$endif Delphi}
zipinter,
Ziptypes,
wincrt;
{$else}{Windows}
USES
{$ifdef __GPC__}
gpc,
{$endif} {__GPC__}
{$ifdef OS2}
Windows,
Sysutils,
{$else OS2}
strings,
{$endif}{OS2}
Ziptypes,
{$ifdef BP_DPMI}
ZipInter;
{$else BP_DPMI}
{$ifdef OS2}
ZipInter;
{$else}{OS2}
unzip;
{$endif}{OS2}
{$endif}{BP_DPMI}
{$endif}{Windows}

VAR
SkipAll : Boolean;

PROCEDURE Report ( Retcode : longint;R : pReportRec );
{$ifdef USE_STDCALL}STDCALL;{$else}{$ifndef NO_EXPORTS}EXPORT;{$endif}{$endif}
BEGIN
  WITH r^ DO
  CASE Status OF
  file_completed :
   Writeln
   ( 
   UnzipMethods [ packmethod ] : 9,
   '  ', Size : 9,
   '  ', CompressSize : 9,
   '  ', Ratio : 5, '%',
   '  ', Strpas ( filename )
   );
   unzip_completed :
   Writeln
   ( 
   'Archived' : 9,
   '  ', Size : 9,
   '  ', CompressSize : 9,
   '  ', Ratio : 5, '%',
   '  ', Strpas ( filename )
   );

 END {case}
END; {Report}
{/////////////////////////////////////////////////////}
FUNCTION Ask ( R : pReportRec ) : Boolean;
{$ifdef USE_STDCALL}STDCALL;{$else}{$ifndef NO_EXPORTS}EXPORT;{$endif}{$endif}
VAR
s : string [ 1 ];
i : integer;
BEGIN
   Ask := FALSE;

   IF SkipAll THEN BEGIN
      Exit;
   END;

   WITH r^
   DO BEGIN
     {$ifdef Windows}
       i := Messagebox
       ( 0,
       'The above file already exists! Should I overwrite it?',
       filename,
       mb_YESNOCancel );
       CASE i OF
          id_Yes : Ask := TRUE;
          id_No  : Ask := FALSE;
          id_Cancel :
          BEGIN
             Ask := FALSE;
             SkipAll := TRUE;
          END;
       END; {Case}
     {$else}
      Ask := FALSE;
      Writeln ( strpas ( filename ), ': (', Size, ' bytes)' );
      Write ( 'This file already exists! Overwrite? ([Y]es [N]o [S]kip all): ' );
      Readln ( s );
      CASE Upcase ( s [ 1 ] ) OF
       'Y' : Ask := TRUE;
       'S' : BEGIN
              Ask := FALSE;
              Skipall := TRUE;
            END;
       END; {Case}
     {$endif Windows}
   END;
END; {Report}
{/////////////////////////////////////////////////////}
VAR
thename, target : TDirType;
DLLVersion, i : word;
NoRecursion : Boolean;
s           : TString;

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
  SkipAll := FALSE;
  NoRecursion := FALSE;

 {$ifdef UseWin}
  DLLVersion := GetUnzipDLLVersion;
  write ( 'DLL Version ', Hi ( DLLVersion ), '.' );
  IF lo ( DLLVersion ) < 10 THEN write ( '0' );
  writeln ( LO ( DLLVersion ) );
  {$endif}

  Writeln ( 'Supported ZIP Unzipmethods:' );
  FOR i := 0 TO 8 DO     {8 because of array above}
    IF ( ( 1 SHL i ) AND GetSupportedmethods ) <> 0
      THEN writeln ( Unzipmethods [ i ] );
  Writeln ( '--------------------------' );
  IF paramcount >= 2 THEN BEGIN
      Strpcopy ( thename, paramstr ( 1 ) );
      Strpcopy ( target, paramstr ( 2 ) );
      NoRecursion := Upper ( paramstr ( 3 ) ) = '/D-'; {/D- = don't recurse}
  END ELSE BEGIN
      Writeln;
      write ( 'Please enter ZIP filename:' );
      readln ( s );
      if s = '' THEN halt;
      strpcopy ( thename, s );
      write ( 'Please enter target directory:' );
      readln ( s );
      if s = '' THEN halt;
      strpcopy ( target, s );
  END;

  SetNoRecurseDirs ( NoRecursion );
  Writeln ( FileUnzip ( thename, target, '*.*', Report, Ask ), ' files processed.' );
END.
