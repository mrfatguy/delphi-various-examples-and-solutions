{
SAMPLE SFX STUB PROGRAM TO DEMONSTRATE THE USE OF THE CHIEFLZ SFX
functions.

THIS PROGRAM WILL COMPILE FOR THE FOLLOWING PLATFORMS;
     Dos Real mode - TP7, BP7
     Dos DPMI      - BP7, BPW
     Win16         - BPW, TPW, Delphi 1.x
     Win32         - Delphi 2.x
     Win32         - Delphi 3.x
     Win32         - Virtual Pascal 2.x

     Dr Abimbola A Olowofoyeku (The African Chief);
     Email:  laa12@keele.ac.uk
     http://ourworld.compuserve.com/homepages/African_Chief/
}
PROGRAM STUB;

{ *** this program should not use the ChiefLZ DLL!!! ***

 ()
USAGE:
* to create an SFX archive using this program as the STUB,
  supply
    [1] "-SFX" as the first parameter
    [2] the file specifications as the second parameter
    [3] the name of the SFX as the third parameter
    [4] optionally, "-R" as the fourth parameter (to recurse)
  (e.g., "STUB -SFX *.PAS TEST.EXE" )

* to decompress the SFX archive, supply a target directory
  as the parameter (e.g., "TEST.EXE C:\TEMP\SFX")

* to extract the LZ archive from the SFX archive,
  supply "-XA" as the first parameter
   (e.g., "TEST.EXE -XA"  - this will produce "TEST.LZA")
}

{$ifdef ver80}
  {$define Win16}
{$endif Ver80}

{$ifdef ver70}
 {$ifdef Windows}
  {$define Win16}
 {$endif Windows}
{$endif Ver70}

{$ifdef Win32}
  {$ifndef VirtualPascal}
    {$define Delphi32}
  {$endif VirtualPascal}
{$endif Win32}

{$ifndef Delphi32}
  {$define UseCrt}
{$endif Delphi32}

USES
{$ifdef win16}WinCRT, {$endif Win16}
ChfTypes,
ChfHash,
{$ifdef UseCrt}LZInput, {$endif UseCrt}
ChiefLZ;

{$ifdef Delphi32}
  {$apptype console}
{$endif Delphi32}

VAR
AutoReplaceAll : boolean;

FUNCTION CheckPassWord ( CONST Header : TLZArchiveHeader; CONST Code : TLZCount ) : TLZCount;
{$ifdef Win32}STDCALL;{$endif Win32}
{$IFDEF Win16} {$ifdef aDLL} EXPORT {$else} FAR {$endif}; {$ENDIF}
VAR
s : TLZString;
BEGIN
      CheckPassWord := LZCode_WrongPassWord;
      {$ifdef UseCrt}
      s := GetString ( 'Please supply the password: ', 80, True );
      {$else}
      Write ( 'Please supply the password: ' );
      Readln ( s );
      {$endif UseCrt}
      IF s = ''
      THEN BEGIN
           Writeln ( 'No password supplied.' );
           exit;
      END;
      IF CheckHeaderPassWord ( s, Header ) = LZCode_CorrectPassWord
        THEN CheckPassWord := LZCode_CorrectPassWord
          ELSE Writeln ( 'Hmmm ... try again.' );
END;

FUNCTION Uppercase ( s : TLZString ) : TLZString;
{return uppercase of string}
VAR
i : Integer;
BEGIN
   FOR i := 1 TO Length ( s ) DO s [ i ] := UpCase ( s [ i ] );
   Uppercase := s;
END;

FUNCTION GetParam ( CONST aParm : TLZString ) : TLZString;
BEGIN
     GetParam := '';
     IF Length ( aParm ) = 0 THEN exit;

     IF ( aParm [1] = '-' ) OR  ( aParm [1] = '/' )
     THEN GetParam := Copy ( UpperCase ( aParm ), 2, Length ( aParm ) );
END;

FUNCTION Confirm ( CONST fRec : TLZReportRec; CONST aDest : TLZReportRec ) : TLZReply;
{$ifdef Win32}STDCALL;{$endif Win32}
{$IFDEF Win16} {$ifdef aDLL} EXPORT {$else} FAR {$endif}; {$ENDIF}
{procedure to ask question if target file exists already}
VAR
Ch : Char;
BEGIN
  IF AutoReplaceAll
  THEN BEGIN
      Confirm := LZYes;
      Exit;
  END;

  { check if the files are the same, and if so, skip }
  WITH FRec
  DO BEGIN
     IF  ( uSizes = aDest.uSizes )
     AND ( Times  = aDest.Times )
     AND ( CRCs   = aDest.CRCs  )
     AND ( FileVersion = aDest.FileVersion )
     THEN BEGIN
          Confirm := LZNo;
          Writeln ( 'Skipping identical file  : ', aDest.Names );
          Exit;
     END;
  END;

  REPEAT
    Write ( 'OVERWRITE FILE: ', aDest.Names, ' ? (Yes/No/All/Quit) [Y/N/A/Q] : ' );
    Readln ( Ch );
  UNTIL Upcase ( Ch ) IN [ 'Y', 'N', 'A', 'Q' ];

  CASE UpCase ( Ch ) OF
  'A' : BEGIN
          Confirm := LZYes;
          AutoReplaceAll := TRUE {overwrite all others}
        END;
  'N' : BEGIN
           Confirm := LZNo;
        END;
  'Q' : Confirm := LZQuit { stop all processing and Exit }
  ELSE
    Confirm := LZYes { Ch = 'Y' }
  END; {Case}
END;
{///////////////////////////////////////////}
FUNCTION DeMyRep ( CONST aName : TLZReportRec; CONST aSize : TLZCount ) : TLZCount ;
{$ifdef Win32}STDCALL;{$endif Win32}
{$IFDEF Win16} {$ifdef aDLL} EXPORT {$else} FAR {$endif}; {$ENDIF}
{procedure to show progress}
BEGIN
   DemyRep := 1;
   IF ( Length ( aName.Names ) > 0 ) AND ( aSize = LZCode_CallBackStartFile ) THEN
     Write ( 'Processing file: ', aName.Names, ' ' )
   ELSE IF ( asize = LZCode_CallBackEndFile ) THEN
     Writeln
   ELSE IF aSize > 0 THEN
     Write ( '.' )
END;
{///////////////////////////////////////////}
VAR
InName, Dest : TLZString;
Header : TLZArchiveHeader;
i, j  : TLZCount;
BEGIN
   AutoReplaceAll := False;
   InName := ParamStr ( 0 ) + #0;

 {$ifdef win16}
    ScreenSize.x := 80;
    ScreenSize.y := 250;
    WindowOrg.x := 1;
    WindowOrg.y := 1;
 {$endif Win16}
   SetArchiveCheckPassWordFunc ( CheckPassWord );
   Dest := ParamStr ( 1 );
   j := IsChiefLZSfxArchive ( @InName [1], Header );
   IF j < 1 THEN Halt ( 200 );

   Writeln ( '** ChiefLZ Self-Extracting Executable **' );
   IF GetParam ( Dest ) = 'XA'
   THEN BEGIN
      Dest := InName + #0;
      i := Pos ( '.', InName );
      Dest [i + 1] := 'L';
      Dest [i + 2] := 'Z';
      Dest [i + 3] := 'A';
      i := LZArchiveFromLZSFXArchive
          ( 
          @InName [1],
          @Dest [1]
          );
      IF i > 0 THEN
      Writeln ( i, ' bytes extracted.' )
      ELSE Writeln ( 'ReturnCode = ', i );
   END
   ELSE BEGIN
      IF Dest = '' THEN BEGIN
         Write ( 'Output Directory: ' );
         Readln ( Dest );
         IF Dest = '' THEN Halt ( 201 );
      END;

      Dest := Dest + #0;
      i := LZSfxDearchive ( 
                    @InName [1],
                    @Dest [1],
                    Confirm,
                    DeMyRep,
                    Nil,
                    True,
                    False );
      IF i >= 0 THEN
      Writeln ( i, ' file(s) extracted.' )
      ELSE Writeln ( 'ReturnCode = ', i );

   END;

  {$ifdef win16}
  Writeln;
  Write ( 'Press any key to close ... ' );
  ReadKey;
  DoneWinCrt;
  {$else win16}
  IF i > 0 THEN Halt ( 0 ) ELSE Halt ( 202 );
  {$endif win16}
END.
