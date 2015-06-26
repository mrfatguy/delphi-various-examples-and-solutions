{
SAMPLE PROGRAM TO DEMONSTRATE THE USE OF THE CHIEFLZ v2.x PACKAGE.
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

PROGRAM LZ;

{$I LZDefine.inc}

{this (aDLL) is now defined (or not) in LZDEFINE.INC}
{$ifdef aDLL}
  {$define ExplicitLink}  {use explicit linking of DLL}
{$endif aDLL}

{$ifdef Windows}
{$ifdef Win32}
{$ifndef VP2}
  {$MINSTACKSIZE $00004000}
  {$MAXSTACKSIZE $00100000}
  {$IMAGEBASE    $00400000}
  {$APPTYPE      Console}
{$endif VP2}
{$else Win32}
  {.$M 20000, 1024}
  {$F+}        { Force Far-Calls }
  {$K+}        { Use smart call-backs for LZReport, etc. }
{$endif Win32}
{$endif Windows}

{$ifdef Delphi}
{
  Link in the Delphi-generated resource file ...
}
  {.$R *.RES}
{$endif Delphi}

{$ifdef MSDOS}
 {.$M 16384,0,655360}
{$endif}

USES
{$ifdef Win32}
 {$ifdef aDLL}
  {$ifndef VP2}{ShareMem,} {$endif VP2} { ChiefLZ.DLL exports long-strings ...!!! }
  {$ifdef ExplicitLink}
  LZExplic IN 'LZExplic.pas',
  {$else ExplicitLink}
  LZImplic IN 'LZImplic.pas',
  {$endif ExplicitLink}
  {$else aDLL}
  ChiefLZ IN 'ChiefLZ.pas',
  {$endif aDLL}
{$else Win32}
 {$ifdef aDLL}
  {$ifdef ExplicitLink}
  LZExplic,
  {$else ExplicitLink}
  LZImplic,
  {$endif ExplicitLink}
 {$else aDLL}
  ChiefLZ,
 {$endif aDLL}
{$endif Win32}

{$ifdef Delphi}
  SysUtils,
{$endif Delphi}
{$ifdef Win32}
  Windows,
{$else Win32}
{$ifdef Windows}
{$ifndef DPMI}
  WinCRT,
{$endif DPMI}
{$ifndef Delphi}
  WinDOS, Strings,
{$endif Delphi}
{$else Windows}
  Dos, Strings,
{$endif Windows}
{$endif Win32}
  ChfTypes,
  ChfHash,
  ChfUtils;

VAR
AutoReplaceAll : boolean;
j, k, l, m : TLZCount;

FUNCTION GetParam ( CONST aParm : TLZString ) : TLZString;
BEGIN
     GetParam := '';
     IF Length ( aParm ) = 0 THEN exit;

     IF ( aParm [1] = '-' ) OR  ( aParm [1] = '/' )
     THEN GetParam := Copy ( UpperCase ( aParm ), 2, Length ( aParm ) );
END;
{///////////////////////////////////////////}
FUNCTION SetPassWord ( VAR Header : TLZArchiveHeader ) : TLZCount;
{$ifdef Win32}STDCALL;{$endif Win32}
{$IFDEF Win16} {$ifdef aDLL} EXPORT {$else} FAR {$endif}; {$ENDIF}
BEGIN
   SetPassWord :=
     SetHeaderPassWord
       ( GetStringValue  ( 'Archive Password (or ENTER): ' ), Header );
END;

FUNCTION CheckPassWord ( CONST Header : TLZArchiveHeader; CONST Code : TLZCount ) : TLZCount;
{$ifdef Win32}STDCALL;{$endif Win32}
{$IFDEF Win16} {$ifdef aDLL} EXPORT {$else} FAR {$endif}; {$ENDIF}
VAR
i : TLZCount;
BEGIN
   i := CheckHeaderPassWord
     ( GetStringValue  ( 'Please supply the password: ' ), Header );

   CheckPassWord := i;
   IF i <> LZCode_CorrectPassWord THEN Writeln ( 'Hmmm ... try again.' );
END;

{$ifdef Win32}
PROCEDURE FlushInputBuffer;
BEGIN
  FlushConsoleInputBuffer ( GetStdHandle ( STD_INPUT_HANDLE ) )
END;

FUNCTION ReadKey32 : Char;
VAR
  NumRead :  {$ifdef Ver120}Cardinal{$else}Integer{$endif};
  HConsoleInput : THandle;
  InputRec :      TInputRecord;
BEGIN
  HConsoleInput := GetStdHandle ( STD_INPUT_HANDLE );
  WHILE NOT ReadConsoleInput ( HConsoleInput,
                             InputRec,
                             1,
                             NumRead ) OR
           ( InputRec.EventType <> KEY_EVENT ) DO;
 Result := InputRec.{$ifdef Ver120}Event.{$endif}KeyEvent.AsciiChar;
END;
{$endif Win32}

{$ifdef Delphi}
FUNCTION TimeToStr ( CONST l : TLZCount ) : TLZstring;
BEGIN
  Result := FormatDateTime ( 'dd/mm/yy  hh:nn', FileDateToDateTime ( l ) )
END;
{$else}
FUNCTION TimeToStr ( CONST L : TLZCount ) : TLZString;
TYPE
  ElementStr = String [ 10 ];

PROCEDURE FormatElement ( Num : word; VAR EStr : ElementStr );
BEGIN
  Str ( Num : 2, EStr );
  IF Num < 10 THEN
    EStr [ 1 ] := '0'
END;

VAR
Result : String [ 25 ];
{$ifdef Windows}
VAR
T : TDateTime;
{$else}
VAR
T : DateTime;
{$endif Windows}
VAR
Dd, Mm, Yy,
Hr, Min : ElementStr;

BEGIN
   UnpackTime ( L, T );
   FormatElement ( T.Day, Dd );
   FormatElement ( T.Month, Mm );
   Str ( T.Year : 4, Yy );
   FormatElement ( T.Hour, Hr );
   FormatElement ( T.Min, Min );
   Result := Dd + '/' + Mm + '/' + Yy + '  ' + Hr + ':' + Min{+':'+Sec};
   TimeToStr := Result;
END;
{$endif Delphi}
{------------------------------------------------------------}
{///////////////////////////////////////////}
FUNCTION Confirm ( CONST fRec : TLZReportRec; CONST aDest : TLZReportRec ) : TLZReply;
{$ifdef Win32}STDCALL;{$endif Win32}
{$IFDEF Win16} {$ifdef aDLL} EXPORT {$else} FAR {$endif}; {$ENDIF}
{procedure to ask question if target file exists already}
VAR
Ch : Char;
BEGIN
  IF AutoReplaceAll THEN
    BEGIN
      Confirm := LZYes;
      Exit
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

  WITH fRec
  DO BEGIN
    Writeln ( 'Target File ' + '"' + aDest.Names + '"' + ' Exists!!!' );
    Writeln ( '------- Source file Details ------ ' );
    Writeln ( 'File Name : ', Names );
    Writeln ( 'File Date : ', TimeToStr ( Times ) );

    Writeln ( 'Compressed: ', Sizes );
    Writeln ( 'Real Size : ', uSizes );
    Writeln ( 'Version   : ', FileVersion );
    Writeln ( 'Attributes: ', FAttrs );
    Writeln ( 'Archive ID: ', FileIDs );
  END;

  REPEAT
    Write ( 'OVERWRITE FILE : ', aDest.Names, ' ? (Yes/No/All/Quit) [Y/N/A/Q] : ' );
    Readln ( Ch );
  UNTIL Upcase ( Ch ) IN [ 'Y', 'N', 'A', 'Q' ];
  CASE UpCase ( Ch ) OF
  'A' : BEGIN
          Confirm := LZYes;
          AutoReplaceAll := TRUE {overwrite all others}
        END;
  'N' : BEGIN
           Confirm := LZNo;
           Writeln ( 'Skipping file  : ', aDest.Names )
        END;
  'Q' : Confirm := LZQuit { stop all processing and Exit }
  ELSE
    Confirm := LZYes { Ch = 'Y' }
  END; {Case}
END;
{///////////////////////////////////////////}
FUNCTION DeMyRep ( CONST CurrentRec : TLZReportRec; CONST Number : TLZCount ) : TLZCount ;
{$ifdef Win32}STDCALL;{$endif Win32}
{$IFDEF Win16} {$ifdef aDLL} EXPORT {$else} FAR {$endif}; {$ENDIF}
{procedure to show progress}
BEGIN
   DemyRep := 1;
   IF ( Length ( CurrentRec.Names ) > 0 ) AND ( Number = LZCode_CallBackStartFile ) THEN
     Write ( 'Processing file: ', CurrentRec.Names, ' (ID=', CurrentRec.FileIDs, ') ' )
   ELSE IF ( Number = LZCode_CallBackEndFile ) THEN
     Writeln
   ELSE IF ( Number = LZCode_CallBackEndFile )
        OR ( Number = LZCode_CallBackEndSpanningPart )
   THEN Writeln
   ELSE IF ( Number = LZCode_CallBackStartSpanningPart )
   THEN WITH CurrentRec DO
   BEGIN
      IF Times > 1 THEN
      Writeln ( 'Processing file: ', Names, ' (part ', uSizes, ' of ', Times, ', Size=', Sizes, ' bytes)' );
   END
   ELSE IF ( Number > 0 )
        OR ( Number = LZCode_CallBackStillSpanningPart ) THEN
     Write ( '.' )
END;
{///////////////////////////////////////////}
FUNCTION MyListFunc ( CONST X : TLZReportRec; CONST i : TLZCount ) : TLZCount ;
{$ifdef Win32}STDCALL;{$endif Win32}
{$IFDEF Win16} {$ifdef aDLL} EXPORT {$else} FAR {$endif}; {$ENDIF}
{procedure to list contents}
VAR
Matches : TLZFileMatchFunc;
s : TLZString;
{p : PChiefLZArchiveHeader; (using this also works!)}
BEGIN
   @Matches := GetFileMatchFunc;{NewMatch; }
   {p := LocalArchiveHeaderPtr;}
   MyListFunc := 1;
   WITH X DO BEGIN
   s := Names;
   IF ( i = LZCode_CallBackStartArchive ) { begin }
    THEN BEGIN
       j := 0; k := 0; l := 0;
       Writeln ( 'ChiefLZ Archive file: ', Names );
       Writeln ( 'ChiefLZ Archive size: ', uSizes, ' bytes' );

       Writeln ( '  Real Size   LZ Size  Ratio   Date      Time    Version   FileName' );
       Writeln ( '------------------------------------------------------------------' );
    END
    ELSE IF ( i = LZCode_CallBackEndArchive ) { end }
    THEN BEGIN
       Writeln;
       Writeln ( 'Number of Files   = ', l );
       Writeln ( 'Compressed Size   = ', j, ' bytes' );
       Writeln ( 'Expanded Size     = ', k, ' bytes' );
       Writeln ( 'Compression Ratio = ', GetCompressionRatio ( j, k ), '%' );
    END
    ELSE
    IF Matches ( GetDecompressMask, Str2pChar ( s ), i )
    THEN { &&&}
    BEGIN  { progressing }
          inc ( l );
          inc ( j, Sizes );
          inc ( k, uSizes );
          IF IsDir THEN
            Write ( 
                   '<DIR>' : 10,
                   0 : 10,
                   0 : 6 )
          ELSE
            Write ( 
                   uSizes : 10,
                   Sizes : 10,
                   GetCompressionRatio ( Sizes, uSizes ) : 6 );
          Write ( '%  ',
                  TimeToStr ( Times ), '  ' );
          IF fattrs AND faComment <> 0 THEN
          Write ( 'Comment' : 8 )
          ELSE
          Write ( FileVersion : 8 );
          Write ( '   ', Names );
          IF IsDir THEN Writeln ( '\' ) ELSE Writeln;
        END {for i};
    END;
END;
{///////////////////////////////////////////}
FUNCTION MyRename ( VAR FName : TLZstring ) : boolean;
{$ifdef Win32}STDCALL;{$endif Win32}
{$ifdef Win16} {$ifdef aDLL} EXPORT {$else} FAR {$endif}; {$endif}
VAR
  Ch : Char;
{$ifndef Delphi}
VAR Result : boolean;
{$endif}
BEGIN
  Write ( 'Cannot overwrite ', FName, ' - Rename? [Y/N]' );
  Readln ( Ch );
  Result := UpCase ( Ch ) = 'Y';
  IF Result THEN
    BEGIN
      Write ( 'New name: ' );
      Readln ( FName )
    END;
{$ifndef Delphi}
  MyRename := Result
{$endif}
END;
{///////////////////////////////////////////}
PROCEDURE Syntax;
BEGIN
  Writeln ( 'LZSS Compressor: by Dr A Olowofoyeku (the African Chief), and Chris Rankin' );
  (* writeln ( {$ifdef Win32}'(Win32 version).'{$else}'(16-bit version).'{$endif} );*)
  WriteLn ( 'Usage: LZ <InSpec> [OutSpec] [Switches]' );
  Writeln ( 'Switches: [[/U /A [/SFX <STUB>] [/SPAN /S /R[1]] /XA /XC /X[/F:Specs [/R-]] /V]]' );
  Writeln ( 'no switch  =  compress a single file (InSpec) to OutSpec' );
  Writeln ( '              e.g.    LZ BIG.EXE SMALL.LZZ' );
  Writeln ( ' /U        =  decompress a single file (InSpec) to OutSpec' );
  Writeln ( '              e.g.    LZ SMALL.LZZ BIG.EXE /U' );
  Writeln ( ' /A        =  compress and archive the files (InSpec) into archive (OutSpec)' );
  Writeln ( ' /S        =  password protect the archive' );
  Writeln ( ' /SFX      =  archive files to a self-extracting .EXE, supplying the SFX stub' );
  Writeln ( '              e.g.    LZ C:\TEMP\*.* TEMP.LZA /A' );
  Writeln ( '              e.g.    LZ C:\TEMP\*.* TEMP.EXE /SFX C:\LZ\STUB.EXE /R /S' );
  Writeln ( '              (Max = ', MaxChiefLZArchiveSize, ' files in archive)' );
  Writeln ( ' /R        =  recurse through directory structure (for archives)' );
  Writeln ( ' /R1       =  recurse into 1st level directories (for archives)' );
  Writeln ( '              e.g.    LZ C:\TEMP\*.* TEMP.LZA /A /R' );
  Writeln ( ' /SPAN     =  Create an archive that spans across (floppy) disks' );
  Writeln ( '              e.g.    LZ C:\TEMP\*.* A:\TEMP.LZA /A /SPAN' );
  Writeln ( '              e.g.    LZ C:\TEMP\*.* TEMP.EXE /SFX C:\LZ\STUB.EXE /SPAN /R ' );
  Writeln ( ' /DS:      =  Set the size (in bytes) of the (floppy) disks for spanned archive' );
  Writeln ( '              e.g.    LZ C:\TEMP\*.* A:\TEMP.LZA /A /SPAN /DS:728000' );
  Writeln ( ' /X        =  decompress an LZ archive (InSpec) into directory (OutSpec)' );
  Writeln ( ' /X /R-    =  decompress an LZ Archive - don''t recursively create directories' );
  Writeln ( '              e.g.    LZ TEMP.LZA C:\TEMP /X' );
  Writeln ( '                      LZ TEMP.LZA C:\TEMP /X /F:*.PAS /R-' );
  Writeln ( ' /XA       =  extract the LZ archive (OutSpec) from SFX file (InSpec)' );
  Writeln ( '              e.g.    LZ TEST.EXE TEST.LZA /XA' );
  Writeln ( ' /XC       =  extract the comment file from LZ archive (InSpec) to OutSpec' );
  Writeln ( '              e.g.    LZ TEST.LZA C:\TEMP /XC' );

  Writeln ( ' /V        =  show contents of an LZ archive (InSpec)' );
  Writeln ( '              e.g.    LZ TEMP.LZA /V' );

  {$ifdef Windows}
   {$ifndef DPMI}
   {$ifndef win32}
    ReadKey;
    DoneWincrt;
    {$endif Win32}
    {$endif DPMI}
  {$endif Windows}
    Halt ( 1 );
END;
{///////////////////////////////////////////}
{///////////////////////////////////////////}
{///////////////////////////////////////////}
VAR
  InFSpec, OutFSpec, UserParam, UserParam2,
  UserParam3 : TLZPathStr;
  p : ARRAY [ 0..255 ] OF Char;
  LZRecurseDirs : TLZRecurse;
  Header : TLZArchiveHeader;
  Spanned,
  DeArchiveRecurseDirs,
  WeAreSFX : Boolean;
  Code : integer;

  i : TLZCount;
  Si : TLZSpanConfig;

BEGIN
   Spanned := False;

  {$ifdef Windows}
   {$ifndef Win32}
   {$ifndef DPMI}
    StrPCopy ( WindowTitle, 'Sample ChiefLZ program ' );
    ScreenSize.x := 80;
    ScreenSize.y := 550;
    WindowOrg.x := 1;
    WindowOrg.y := 1;
    {$endif DPMI}
   {$endif Win32}
  {$endif Windows}

  FillChar ( Header, Sizeof ( Header ), #0 );
  DeArchiveRecurseDirs := True;

  { password callbacks }
  FOR i := 1 TO ParamCount DO
   IF GetParam ( ParamStr ( i ) ) = 'S' {/s = password}
    THEN BEGIN
      SetArchiveSetPassWordFunc ( SetPassWord );
      Break;
    END;

  SetArchiveCheckPassWordFunc ( CheckPassWord );
  { }

  { check whether we are an SFX stub }
  UserParam  := ParamStr ( 0 );
  WeAreSFX := IsChiefLZSfxArchive
    ( Str2pchar ( UserParam ), Header ) > 0;

  IF Not WeAreSFX THEN
  IF ParamCount < 2 THEN
  BEGIN
    Syntax;
  END;

  { the rest }
  InFSpec   := ParamStr ( 1 );
  OutFSpec  := ParamStr ( 2 );
  UserParam  := Uppercase ( ParamStr ( 3 ) );
  UserParam2 := Uppercase ( ParamStr ( 4 ) );
  UserParam3 := Uppercase ( ParamStr ( 5 ) );
  AutoReplaceAll := FALSE; {confirm for each file}

  IF ( GetParam ( Copy ( UserParam2, 1, 3 ) ) = 'F:' )
  THEN BEGIN
     Delete ( UserParam2, 1, 3 );
     SetDecompressMask ( Str2PChar ( UserParam2 ) );
     UserParam2 := '';
  END ELSE
  IF ( GetParam ( Copy ( UserParam, 1, 3 ) ) = 'F:' )
  THEN BEGIN
     Delete ( UserParam, 1, 3 );
     SetDecompressMask ( Str2PChar ( UserParam ) );
     UserParam := '';
  END;
  {}
  IF WeAreSFX THEN BEGIN
       Spanned := IsChiefLZSpannedHeader ( Header );
       InFSpec := ParamStr ( 0 );
       OutFSpec := ParamStr ( 1 );
       IF ( GetParam ( OutFSpec ) = 'V' ) {/V}
       THEN BEGIN
          SetArchiveHeaderBegin ( Header.Reserved.S_OffSet );
          InFSpec := InFSpec + #0;
          LZListArchive ( @InFSpec [ 1 ], @Header, MyListFunc );
          IF IsChiefLZSpannedHeader ( Header )
          THEN Writeln ( 'The archive spans across ', Header.Parts, ' disks.' );
       END ELSE
       IF ( GetParam ( OutFSpec ) = 'XA' ) {/XA}
       THEN BEGIN
          InFSpec := ParamStr ( 0 );
          OutFSpec := ChangeFileExt ( InFSpec, '.LZA' );
          i := LZArchiveFromLZSFXArchive
               ( Str2PChar ( InFSpec ), Str2PChar ( OutFSpec ) );
          Writeln ( i, ' bytes extracted.' );
       END
       ELSE BEGIN
         m := Header.Count;
         IF OutFSpec = '' THEN BEGIN
            Write ( 'Output Directory: ' );
            Readln ( OutFSpec );
            IF OutFSpec = '' THEN m := 0;
         END;
         IF m > 0
         THEN BEGIN
            IF ( GetParam ( UserParam2 ) = 'R-' )
            OR ( GetParam ( ParamStr ( ParamCount ) ) = 'R-' )
            THEN DeArchiveRecurseDirs := FALSE;

            IF NOT Spanned THEN SetArchiveHeaderBegin ( Header.Reserved.S_OffSet );
            writeln ( LZDearchive ( Str2PChar ( InFSpec ), Str2PChar ( OutFSpec ),
                         Confirm, DeMyRep, MyRename, DeArchiveRecurseDirs, False ) );
         END ELSE Writeln ( 'Process aborted.' );
      END;
  END
  ELSE
  IF ( GetParam ( ParamStr ( 3 ) ) = 'XC' ) { /XC}
  THEN BEGIN
     i := ExtractArchiveCommentFile ( Str2PChar ( infspec ), Str2PChar ( outfspec ), p );
     Writeln ( 'Comment file, ID: ', i, ' extracted.' );
     IF i > 0 THEN Writeln ( 'Full name = ', p );
  END
  ELSE
  IF ( GetParam ( ParamStr ( 2 ) ) = 'V' ) {/v}
  THEN BEGIN
    m := IsChiefLZSfxArchive ( @InFSpec [ 1 ], Header );
    IF m < 0
    THEN BEGIN
        Writeln ( InFSpec, ' is not a ChiefLZ archive!' );
        Halt ( 1 );
    END;
    IF m > 0 THEN SetArchiveHeaderBegin ( Header.Reserved.S_OffSet );

    LZListArchive ( @InFSpec [ 1 ], @Header, MyListFunc );

     IF IsChiefLZSpannedHeader ( Header )
     THEN Writeln ( 'The archive was split across ', Header.Parts, ' disks.' );
  END
 ELSE
  IF ( GetParam ( UserParam ) = 'X' ) {/x}
  THEN BEGIN
     IF ( GetParam ( UserParam2 ) = 'R-' )
     OR ( GetParam ( ParamStr ( ParamCount ) ) = 'R-' )
     THEN DeArchiveRecurseDirs := False;

     m := IsChiefLZSfxArchive ( @InFSpec [ 1 ], Header );
     Spanned := IsChiefLZSpannedHeader ( Header );

     IF NOT Spanned
     THEN IF m > 0 THEN SetArchiveHeaderBegin ( Header.Reserved.S_OffSet );

     writeln ( LZDearchive ( Str2PChar ( InFSpec ), Str2PChar ( OutFSpec ),
                   Confirm, DeMyRep, MyRename, DeArchiveRecurseDirs, False ) );
  END ELSE
  IF ( GetParam ( UserParam ) = 'XA' ) {/XA}
  THEN BEGIN
       i := LZArchiveFromLZSFXArchive
       ( Str2PChar ( InFSpec ), Str2PChar ( OutFSpec ) );
       Writeln ( i, ' bytes extracted.' );
  END
  ELSE
  IF ( GetParam ( UserParam ) = 'A' ) {/a}
  THEN BEGIN
     FOR i := 4 TO ParamCount
     DO BEGIN
         Spanned := GetParam ( Uppercase ( ParamStr ( i ) ) ) = 'SPAN'; { /a /span }
         IF Spanned THEN Break;
     END;

     WITH Si DO BEGIN
       DiskSize := Floppy1440;  { 1.44mb }
     END;

     { check whether a disksize is supplied, e.g., /DS:733000 }
     FOR i := 4 TO ParamCount
     DO BEGIN
       UserParam := Copy ( ParamStr ( i ), 1, 4 );
       IF  GetParam ( UserParam ) = 'DS:' { /DS:}
       THEN BEGIN
          UserParam := ParamStr ( i );
          Delete ( UserParam, 1, 4 );
          Val ( UserParam, j, Code );
          IF Code = 0 THEN Si.DiskSize := j;
          Break;
       END;
     END;

     {}
     UserParam := Uppercase ( ParamStr ( ParamCount ) );
     IF ( GetParam ( UserParam ) = 'R' )
     THEN
       LZRecurseDirs := LZFullRecurse
     ELSE IF ( GetParam ( UserParam ) = 'R1' )
     THEN
       LZRecurseDirs := LZRecurseOnce
     ELSE
       LZRecurseDirs := LZNoRecurse;
       IF Spanned
       THEN
       writeln ( LZArchiveSpan ( Str2PChar ( InFSpec ), Str2PChar ( OutFSpec ),
                 LZRecurseDirs, DeMyRep, LZFastCompression, @Si ),
                 ' file(s) archived.' )
       ELSE
       writeln ( LZArchive ( Str2PChar ( InFSpec ), Str2PChar ( OutFSpec ),
                 LZRecurseDirs, DeMyRep, LZFastCompression ),
                 ' file(s) archived.' );
  END ELSE
  IF ( GetParam ( UserParam ) = 'SFX' ) {/sfx}
  { e.g., "LZ3 *.pas TEST.EXE /SFX STUB.EXE" [/R [/R1] /SPAN]}
  THEN BEGIN
     FOR i := 1 TO ParamCount
     DO BEGIN
         Spanned := GetParam ( Uppercase ( ParamStr ( i ) ) ) = 'SPAN'; { /span }
         IF Spanned THEN Break;
     END;

     IF Spanned THEN
     WITH Si DO BEGIN
          DiskSize := 400000{Floppy144};  { 1.44mb }
          IF Spanned THEN BEGIN
             ToSfx := True;
             Strpcopy ( sfxstub, UserParam2 );
          END;
     END;
     UserParam := Uppercase ( ParamStr ( ParamCount ) );
     IF ( GetParam ( UserParam ) = 'R' )
     THEN
       LZRecurseDirs := LZFullRecurse
     ELSE IF ( GetParam ( UserParam ) = 'R1' )
     THEN
       LZRecurseDirs := LZRecurseOnce
     ELSE
       LZRecurseDirs := LZNoRecurse;

       IF Spanned
       THEN
       writeln ( LZArchiveSpan ( Str2PChar ( InFSpec ), Str2PChar ( OutFSpec ),
                 LZRecurseDirs, DeMyRep, LZFastCompression, @Si ),
                 ' file(s) archived.' )
       ELSE
       writeln ( LZSfxArchive ( Str2PChar ( UserParam2 ), Str2PChar ( InFSpec ), Str2PChar ( OutFSpec ),
                 LZRecurseDirs, DeMyRep, LZFastCompression ) )
  END ELSE
  IF ( GetParam ( UserParam ) = 'U' ) {/u}
  THEN BEGIN
     writeln ( LZDecompress ( Str2PChar ( InFSpec ), Str2PChar ( OutFSpec ),
                              Confirm, DemyRep ) );
     GetChiefLZFileName ( Str2PChar ( InFSpec ), p );
     Writeln ( 'Filename in header: ', p );
     writeln ( 'FileSize in header: ',
                  GetChiefLZFileSize ( Str2PChar ( InFSpec ) ) );
  END
  ELSE
  IF GetParam ( ParamStr ( 2 ) ) = '1' {/1}
  THEN BEGIN
    LZCompressEx ( Str2PChar ( InFSpec ), Confirm, DeMyRep );
  END ELSE
  IF GetParam ( ParamStr ( 2 ) ) = '2' {/2}
  THEN BEGIN
    LZDecompressEx ( Str2PChar ( InFSpec ), Confirm, DeMyRep );
  END
  ELSE BEGIN
     writeln ( LZCompress ( Str2PChar ( InFSpec ), Str2PChar ( OutFSpec ),
                            Confirm, DeMyRep, LZFastCompression ) );
END;

    Writeln;
  {$ifdef Windows}
   {$ifndef DPMI}
   {$ifndef Win32}
    ReadKey;
    DoneWincrt;
   {$endif Win32}
    {$endif DPMI}
  {$endif Windows}
    Halt ( 0 );
END.

