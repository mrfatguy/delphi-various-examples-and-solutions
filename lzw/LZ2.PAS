{
SAMPLE PROGRAM TO DEMONSTRATE THE USE OF THE CHIEFLZ PACKAGE;
THIS TEST PROGRAM USES THE "OBJECT" IN CHFLZSS.PAS.

THIS PROGRAM WILL COMPILE FOR THE FOLLOWING PLATFORMS;
     Dos Real mode - TP7, BP7
     Dos DPMI      - BP7, BPW
     Win16         - BPW, TPW, Delphi 1.x
     Win32         - Delphi 2.0x
     Win32         - Delphi 3.0x
     Win32         - Virtual Pascal 2.x
}

PROGRAM LZ2;

{$I LZDefine.inc}

{this (aDLL) is now defined (or not) in LZDEFINE.INC}
{$ifdef aDLL}
  {.$define ExplicitLink}  {use explicit linking of DLL}
{$endif aDLL}


{$ifdef Windows}
{$ifdef Win32}
{$ifdef Delphi32}
  {$MINSTACKSIZE $00004000}
  {$MAXSTACKSIZE $00100000}
  {$IMAGEBASE    $00400000}
  {$APPTYPE      Console}
{$endif Delphi32}
{$else Win32}
  {$M 20000, 1024}
  {$F+}        { Force Far-Calls }
  {$K+}        { Use smart call-backs for LZReport, etc. }
{$endif Win32}
{$endif Windows}

{$ifdef MSDOS}
 {$M 16384,0,655360}
{$endif}


USES
{$ifdef Delphi}
SysUtils,
{$else}
Objects,
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
{$ifdef aDLL}
  LZExplic,
{$else}
  ChiefLZ,
{$endif aDLL}
  ChfLZSS,
  ChfUtils;

{descendant of TChiefLZObj; we override some methods to provide for
 our own callbacks}
TYPE
NewLZ = {$ifdef Delphi}CLASS{$else}OBJECT{$endif} ( TChiefLZObj )
  FUNCTION  ConfirmOverwrite ( Sender : pObject; CONST fRec : TLZReportRec;
  CONST aDest : TLZReportRec ) : TLZReply;
  {$ifdef Delphi}OVERRIDE{$else}VIRTUAL{$endif Delphi};

  FUNCTION ProgressReport ( Sender : pObject; CONST CurrentRec : TLZReportRec; CONST Number : TLZCount ) : TLZCount ;
  {$ifdef Delphi}OVERRIDE{$else}VIRTUAL{$endif Delphi};

  FUNCTION RequestNewName ( Sender : pObject;VAR NewFileName : TLZString ) : boolean;
  {$ifdef Delphi}OVERRIDE{$else}VIRTUAL{$endif Delphi};

  FUNCTION  ViewArchiveContents ( Sender : pObject; CONST X : PChiefLZArchiveHeader; CONST i : TLZCount ) : TLZCount;
  {$ifdef Delphi}OVERRIDE{$else}VIRTUAL{$endif Delphi};

  FUNCTION ListArchiveContents ( Sender : pObject; CONST X : TLZReportRec; CONST i : TLZCount ) : TLZCount ;
  {$ifdef Delphi}OVERRIDE{$else}VIRTUAL{$endif Delphi};

  FUNCTION SetPassWord ( Sender : pObject; VAR Header : TLZArchiveHeader ) : TLZCount;
  {$ifdef Delphi}OVERRIDE{$else}VIRTUAL{$endif Delphi};

  FUNCTION CheckPassWord
  ( Sender : pObject; CONST Header : TLZArchiveHeader; CONST Code : TLZCount ) : TLZCount;
  {$ifdef Delphi}OVERRIDE{$else}VIRTUAL{$endif Delphi};

   FUNCTION MatchFileName
   ( Sender : PObject; FileSpec : TLZString; TheFName : TLZstring; ArchiveID : TLZCount ) : Boolean;
  {$ifdef Delphi}OVERRIDE{$else}VIRTUAL{$endif Delphi};

END;

{ Globals }
VAR
PassWord : TLZString;
AutoReplaceAll : boolean;
MyLZ : NewLZ;
j, k, l : TLZCount;
inFName, OutFName : TLZPathStr;
{ Globals end }


FUNCTION Num2Str ( i : TLZCount ) : TLZString;
VAR
s : TLZString;
BEGIN
  Str ( i, s );
  Num2Str := s;
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
  ElementStr = String [10];

PROCEDURE FormatElement ( Num : word; VAR EStr : ElementStr );
BEGIN
  Str ( Num : 2, EStr );
  IF Num < 10 THEN
    EStr [1] := '0'
END;

VAR
Result : String [25];
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
   Result := Dd + '/' + Mm + '/' + Yy + '  ' + Hr + ':' + Min;
   TimeToStr := Result;
END;
{$endif Delphi}
{///////////////////////////////////////////}
{///////////////////////////////////////////}
{///////////////////////////////////////////}
{ask for password, and set it}
FUNCTION NewLZ.SetPassWord ( Sender : pObject; VAR Header : TLZArchiveHeader ) : TLZCount;
VAR
s : TLZString;
BEGIN
   IF PassWord > ''
   THEN s := PassWord {password supplied from command line}
   ELSE s := GetStringValue  ( 'Archive Password (or ENTER): ' );
   SetPassWord := SetHeaderPassWord  ( s, Header );
END;
{///////////////////////////////////////////}
{check whether password is correct}
FUNCTION NewLZ.CheckPassWord
( Sender : pObject; CONST Header : TLZArchiveHeader; CONST Code : TLZCount ) : TLZCount;
VAR
s : TLZString;
i : TLZCount;
BEGIN
     IF PassWord > ''
     THEN s := PassWord
     ELSE  s := GetStringValue ( 'Please supply the password: ' );

     i := CheckHeaderPassWord ( s, Header );
     CheckPassWord := i;
     IF i <> LZCode_CorrectPassWord THEN BEGIN
        IF s = ''THEN Writeln ( 'No password supplied. Process aborted.' )
        ELSE Writeln ( 'Hmmm ... try again.' );
     END;
END;
{///////////////////////////////////////////}
{ask question if target file exists already}
FUNCTION NewLZ.ConfirmOverwrite ( Sender : pObject;
CONST fRec : TLZReportRec; CONST aDest : TLZReportRec ) : TLZReply;
VAR
Ch : Char;
BEGIN
  IF AutoReplaceAll THEN
    BEGIN
      ConfirmOverwrite := LZYes;
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
          ConfirmOverwrite := LZNo;
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
    Writeln ( '32-bit CRC: ', HexL ( CRCs ) );
    Writeln ( 'Archive ID: ', FileIDs );
  END;

  REPEAT
    Write ( 'OVERWRITE FILE : ', aDest.Names, ' ? (Yes/No/All/Quit) [Y/N/A/Q] : ' );
    Readln ( Ch );
  UNTIL Upcase ( Ch ) IN ['Y', 'N', 'A', 'Q'];
  CASE UpCase ( Ch ) OF
  'A' : BEGIN
          ConfirmOverwrite := LZYes;
          AutoReplaceAll := True {overwrite all others}
        END;
  'N' : BEGIN
           ConfirmOverwrite := LZNo;
           Writeln ( 'Skipping file  : ', aDest.Names )
        END;
  'Q' : ConfirmOverwrite := LZQuit { stop all processing and Exit }
  ELSE
    ConfirmOverwrite := LZYes { Ch = 'Y' }
  END; {Case}
END;
{///////////////////////////////////////////}
{procedure to show progress}
FUNCTION NewLZ.ProgressReport
( Sender : pObject;CONST CurrentRec : TLZReportRec; CONST Number : TLZCount ) : TLZCount ;
BEGIN
   ProgressReport := 1;
   IF ( Number = LZCode_CallBackProcessingDirs ) THEN
     Write ( 'Scanning directories. Please wait ... ' )
   ELSE IF ( Number = LZCode_CallBackStartArchive ) THEN
     Writeln
   ELSE IF ( Length ( CurrentRec.Names ) > 0 ) AND ( Number = LZCode_CallBackStartFile ) THEN
     Write ( 'Processing file: ', CurrentRec.Names, ' ' )
   ELSE IF ( Number = LZCode_CallBackEndFile ) THEN
     Writeln
   ELSE IF Number > 0 THEN
     Write ( '.' )
END;
{///////////////////////////////////////////}
FUNCTION aMatches ( FileSpec, TheFName : TLZString; ArchiveID : TLZCount ) : Boolean;
{$ifdef win32}STDCALL;{$else win32}{$ifdef aDLL}EXPORT;{$endif aDLL}{$endif win32}
BEGIN
   aMatches := True;
END;
{///////////////////////////////////////////}
FUNCTION LeftPadCh ( s : TLZstring; ch : Char; len : Byte ) : TLZstring;
VAR
i, j : integer;
BEGIN
   j := length ( s );
   IF j < len THEN BEGIN
      j := ( len - j );
      FOR i := 1 TO j DO
      s := ch + s;
   END;
   LeftPadCh := s;
END;

FUNCTION LeftPad ( CONST s : TLZstring; len : integer ) : TLZstring;
BEGIN
   LeftPad := LeftPadCh ( s, Chr ( 32 ), len );
END;

FUNCTION PadCh ( s : TLZstring; ch : Char; len : integer ) : TLZstring;
VAR
i, j : integer;
BEGIN
   j := length ( s );
   IF j < len THEN BEGIN
      FOR i := Succ ( j ) TO len DO BEGIN
       s := s + ch;
      END;
   END;
   PadCh := s;
END;

FUNCTION Pad ( CONST s : TLZstring; len : integer ) : TLZstring;
BEGIN
   Pad := PadCh ( s, Chr ( 32 ), Len );
END;

{basic, limited matching function to illustrate how a different
 one can be used
 }
FUNCTION MatchFile
( FileSpec : TLZString; TheFName : TLZstring; ArchiveID : TLZCount ) : Boolean;
{$ifdef win32}STDCALL;{$else win32}{$ifdef aDLL}EXPORT;{$endif aDLL}{$endif win32}
BEGIN
   MatchFile :=
      ( FileSpec = '*.*' )    { - all files match - }
   OR ( FileSpec = '*' )      { - ditto - }
   OR ( FileSpec = '' )       { - ditto - }
   OR ( AnsiCompareText ( FileSpec, TheFName ) = 0 ) { full names match }
   OR ( AnsiCompareText ( FileSpec, ExtractFileName ( TheFName ) ) = 0 ); { file names match }
END;
{///////////////////////////////////////////}
{overridden file match method}
FUNCTION NewLZ.MatchFileName
( Sender : PObject; FileSpec : TLZString; TheFName : TLZstring; ArchiveID : TLZCount ) : Boolean;
BEGIN
   MatchFileName := MatchFile ( FileSpec, TheFName, ArchiveID );
END;
{///////////////////////////////////////////}
{one method of listing archive contents - to use this,
call ViewArchive() }
FUNCTION NewLZ.ViewArchiveContents
( Sender : pObject; CONST X : PChiefLZArchiveHeader; CONST i : TLZCount ) : TLZCount;
BEGIN
    ViewArchiveContents := 1;
    IF ( i = LZCode_CallBackStartArchive ) { begin }
    THEN BEGIN
       j := 0; k := 0; l := 0;
       Writeln ( 'ChiefLZ Archive file: ', inFName );
       Writeln ( 'ChiefLZ Archive size: ', GetArchiveSize, ' bytes' );
       Writeln ( '   Length  Method  Size  Ratio   Date     Time   CRC-32     ID Name' );
       Writeln ( '----------------------------------------------------------------------------' );
    END
    ELSE IF ( i = LZCode_CallBackEndArchive ) { end }
    THEN BEGIN
       Writeln;
       Writeln ( 'Number of Files   = ', l );
       Writeln ( 'Compressed Size   = ', j, ' bytes' );
       Writeln ( 'Expanded Size     = ', k, ' bytes' );
       Writeln ( 'Compression Ratio = ', GetCompressionRatio ( j, k ), '%' );
    END ELSE
    IF MatchFileName ( NIL, StrPas ( GetDecompressMask ), FullLZName ( i ), i ) THEN
    WITH X^.Files [i]^
    DO BEGIN
          inc ( l );
          inc ( j, Sizes );
          inc ( k, uSizes );
          IF IsDir THEN
            Write ( 
                   '-' : 8,
                   LeftPad ( StrPas ( TLZCompressionTypeStrings [CompressedType] ), 7 ),
                   0 : 8,
                   0 : 4 )
          ELSE
            Write ( 
                   uSizes : 8,
                   LeftPad ( StrPas ( TLZCompressionTypeStrings [CompressedType] ), 7 ),
                   Sizes  : 8,
                   GetCompressionRatio ( Sizes, uSizes ) : 4 );

            Write ( '%  ',
                  TimeToStr ( Times ),
                  '  ',
                  HexL ( CRCs ) : 8,
                  '  ',
                  FileID : 3,
                  ' ',
                  FullLZName ( i ) );
          IF IsDir THEN Writeln ( '\' ) ELSE Writeln;
        END {for i};
END; {ViewArchiveContents}
{///////////////////////////////////////////}
{another method of listing archive contents - to use this,
call ListArchive() }
FUNCTION NewLZ.ListArchiveContents
( Sender : pObject; CONST X : TLZReportRec; CONST i : TLZCount ) : TLZCount ;
VAR
Matches : TLZFileMatchFunc;
s : TLZString;
BEGIN
   @Matches := GetFileMatchFunc; { Matches can be assigned to another callback }
   ListArchiveContents := 1;
   WITH X DO BEGIN
   s    := Names;
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
    ELSE IF Matches ( GetDecompressMask, Str2pChar ( s ), i )
    THEN BEGIN  { progressing }
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
                  TimeToStr ( Times ),
                  '  ', FileVersion : 8,
                  '   ', Names );
          IF IsDir THEN Writeln ( '\' ) ELSE Writeln;
        END {for i};
    END;
END;
{///////////////////////////////////////////}
{ask for new name for file}
FUNCTION NewLZ.RequestNewName ( Sender : pObject;VAR NewFileName : TLZString ) : boolean;
VAR
Ch : Char;
{$ifndef Delphi}
Result : boolean;
{$endif}
BEGIN
  Write ( 'Cannot overwrite ', NewFileName, ' - Rename? [Y/N]' );
  Readln ( Ch );
  Result := UpCase ( Ch ) = 'Y';
  IF Result THEN
    BEGIN
      Write ( 'New name: ' );
      Readln ( NewFileName )
    END;
{$ifndef Delphi}
  RequestNewName := Result
{$endif Delphi}
END;
{///////////////////////////////////////////}
PROCEDURE Syntax;
BEGIN
  Write ( 'LZSS Compressor, #2 ' );
  Write ( {$ifdef Win32}'(32 bit)'{$else}'(16 bit)'{$endif} );
  Writeln ( ' by Dr A Olowofoyeku (the African Chief).' );
  Writeln ( 'Usage: LZ <Src> [Dest] [/U /A[/R[1] /C[0,1] /X[/F:spec [/R-]] /V [/S:passwd]' );
  Writeln ( 'no switch = Compress a single file (Src) to Dest' );
  Writeln ( '              e.g.  LZ2 BIG.EXE SMALL.LZZ' );
  Writeln ( ' /U       = Decompress a single file (Src) to Dest' );
  Writeln ( '              e.g.  LZ2 SMALL.LZZ BIG.EXE /U' );
  Writeln ( ' /A       = Compress and Archive the files (Src) into Archive (Dest)' );
  Writeln ( '              e.g.  LZ2 C:\TEMP\*.* TEMP.LZA /A' );
  Writeln ( '            (Max = ' +  Num2Str ( MaxChiefLZArchiveSize ) + ' files in Archive)' );
  Writeln ( ' /R       = Recurse through directory structure (for archives)' );
  Writeln ( ' /R1      = Recurse into 1st level directories (for archives)' );
  Writeln ( '              e.g.  LZ2 C:\TEMP\*.* TEMP.LZA /A /R' );
  Writeln ( ' /C[0,1]  = Use No compression/Fast (but limited) compression for archives)' );
  Writeln ( '              e.g.  LZ2 C:\TEMP\*.* TEMP.LZA /A /C1' );
  Writeln ( ' /X       = Decompress an LZ Archive (Src) into directory (Dest)' );
  Writeln ( ' /X /R-   = Decompress an LZ Archive - don''t recursively create directories' );
  Writeln ( '              e.g.  LZ2 TEMP.LZA C:\TEMP /X' );
  Writeln ( ' /V       = Show contents of an LZ Archive (Src)' );
  Writeln ( '              e.g.  LZ2 TEMP.LZA /V' );
  Writeln ( ' /F:      = Process only these file specifications' );
  Writeln ( '              e.g.  LZ2 TEMP.LZA /V /F:*.txt' );
  Writeln ( ' /S:      = Supply a password for the archive' );
  Writeln ( '              e.g.  LZ2 *.EXE TEMP.LZA /A /R /S:MyPaSswoRd' );

  {$ifdef Windows}
   {$ifndef DPMI}
   {$ifndef Win32}
    ReadKey;
    DoneWincrt;
   {$endif DPMI}
   {$endif Win32}
  {$endif Windows}

   Halt ( 1 );
END;
{///////////////////////////////////////////}
FUNCTION GetParam ( CONST aParm : TLZString ) : TLZString;
BEGIN
     GetParam := '';
     IF Length ( aParm ) = 0 THEN exit;

     IF ( aParm [1] = '-' ) OR  ( aParm [1] = '/' )
     THEN GetParam := Copy ( UpperCase ( aParm ), 2, Length ( aParm ) );
END;
{///////////////////////////////////////////}
 VAR
  UserParam,
  UserParam2,
  UserParam3 : TLZString;
  i : integer;
  LZCompressionChoices : TLZCompressionChoices;
  LZRecurseDirs : TLZRecurse;
  b : boolean;
{!!!!!!!!!!!!!!!!!!!!!!!}
BEGIN

   b := false;
   { check for password passed on command line: e.g., /S:MyPassWord}
   FOR i := 1 TO paramcount
   DO BEGIN
       PassWord := paramstr ( i );
       IF GetParam ( Copy ( PassWord, 1, 3 ) ) = 'S:'
       THEN BEGIN
          delete ( PassWord, 1, 3 ); { remove "/S:" }
          b := true;
          Break;
       END ELSE PassWord := '';
   END;
   IF NOT b THEN PassWord := '';

   { check for setting of compression type }
   LZCompressionChoices := LZMaxCompression; {default = LZH6 compression}
   FOR i := 1 TO paramcount
   DO BEGIN { /C0 = no compression; /C1 = fast compression }
      UserParam  := paramstr ( i );
      IF GetParam ( UserParam ) = 'C0' THEN LZCompressionChoices := LZNoCompression
      ELSE
      IF GetParam ( UserParam ) = 'C1' THEN LZCompressionChoices := LZFastCompression
   END;

  {$ifdef Windows}
   {$ifdef Win32}
   {$ifdef WinCrt}
    StrPCopy ( WindowTitle, 'Sample ChiefLZ program (32-bit)' );
    ScreenSize.x := 80;
    ScreenSize.y := 250;
    WindowOrg.x := 1;
    WindowOrg.y := 1;
    {$endif WinCrt}
   {$else  Win32}
   {$ifndef DPMI}
    StrPCopy ( WindowTitle, 'Sample ChiefLZ program (16-bit)' );
    ScreenSize.x := 250;
    ScreenSize.y := 250;
    WindowOrg.x := 1;
    WindowOrg.y := 1;
    {$endif DPMI}
   {$endif Win32}
  {$endif Windows}

{--- help --}
  IF GetParam ( ParamStr ( 1 ) ) = '?' THEN Syntax;

{ --- create object ---- }
  MyLZ
  {$ifdef Delphi}  := NewLZ{$endif Delphi}.Create ( NIL );

{//////////////////////////////////////////////}
{//// CHECK FIRST FOR WHETHER WE ARE //////////}
{///// A SELF EXTRACTING LZ Archive ///////////}
{//////////////////////////////////////////////}
  IF ( ParamCount < 2 )
  THEN BEGIN
     j := - 1;
     inFName := ParamStr ( 0 );  {we are the source file!}
     OutFName := ParamStr ( 1 ); {extract to paramstr(1)}
     AutoReplaceAll := False;    {ConfirmOverwrite for each file}

     WITH MyLZ
     DO BEGIN
       SetSFXArchiveName ( inFName );
       SetTargetDirectory ( OutFName );
     {now check - are we a self-extractor?}
       IF IsSFXArchive > 0
       THEN BEGIN
            IF GetParam ( OutFName ) = 'XA' { /XA = extract LZ archive from SFX }
            THEN BEGIN
               OutFName := ChangeFileExt ( inFName, '.LZA' ) ;
               SetArchiveName ( OutFName );
               Writeln ( ExtractArchiveFromSFX, ' bytes extracted into archive: ', OutFName );
            END
            ELSE BEGIN
              IF OutFName = ''
              THEN BEGIN
                   Write ( 'Extract files to Directory : ' );
                   Readln ( OutFName );
                   IF OutFName = '' THEN BEGIN
                     {$ifdef Delphi}Free{$else}Done{$endif Delphi};
                     Syntax;
                   END;
              END;
              SetTargetDirectory ( OutFName );
              j := DecompressSFXArchive;
              Writeln ( j , ' files extracted.' );
            END;
            {$ifdef Delphi}Free{$else}Done{$endif Delphi};
            Halt ( 0 );
       END;  { if }
     END; { with MyLZ }

   {$ifdef Windows}
   {$ifndef DPMI}
    IF j > 0 THEN BEGIN
       {$ifndef Win32}
       ReadKey;
       DoneWincrt;
       {$endif Win32}
    END;
   {$endif DPMI}
   {$endif Windows}
     IF  j > 0 THEN Halt ( 0 );
  END; { if paramcount < 2 }
{//////////////////////////////////////////////}
{// end of check for self extracting file /////}
{//////////////////////////////////////////////}

  IF ParamCount < 2 THEN Syntax;

  InFName   := ParamStr ( 1 );
  OutFName  := ParamStr ( 2 );
  UserParam  := Uppercase ( ParamStr ( 3 ) );
  UserParam2 := Uppercase ( ParamStr ( 4 ) );
  UserParam3 := Uppercase ( ParamStr ( 5 ) );
  AutoReplaceAll := False; {ConfirmOverwrite for each file}

  WITH MyLZ
  DO BEGIN
    SetInputName ( InFName );
    SetOutputName ( OutFName );
    { may be changed later! }
    SetArchiveName ( InFName );
    SetTargetDirectory ( OutFName );

    SetSFXStub ( ParamStr ( 0 ) );  {EXE file}

  {* filespecs *}
   IF GetParam ( Copy ( UserParam2, 1, 3 ) ) = 'F:'
   THEN BEGIN
     Delete ( UserParam2, 1, 3 );
     SetDeArchiveMask ( UserParam2 );
     UserParam2 := '';
   END ELSE
   IF GetParam ( Copy ( UserParam, 1, 3 ) ) = 'F:'
   THEN BEGIN
     Delete ( UserParam, 1, 3 );
     SetDeArchiveMask ( UserParam );
     UserParam := '';
   END ELSE
   IF GetParam ( Copy ( UserParam3, 1, 3 ) ) = 'F:'
   THEN BEGIN
     Delete ( UserParam3, 1, 3 );
     SetDeArchiveMask ( UserParam3 );
     UserParam3 := '';
   END;
  {* filespecs *}

  { view/list Archive: "/V" }
  IF GetParam ( ParamStr ( 2 ) ) = 'V'
  THEN BEGIN
     {ListArchive;}  {* results in a call to ListArchiveContents }
     ViewArchive; {* results in a call to ViewArchiveContents }
     IF IsChiefLZSpannedHeader ( MainArchiveHeader )
     THEN Writeln ( 'The archive spans across ', MainArchiveHeader.Parts, ' disks.' );
  END
  ELSE
  { decompress Archive: "/X" }
  IF GetParam ( UserParam ) = 'X'
  THEN BEGIN
     FOR i := 1 TO ParamCount
     DO BEGIN
         IF GetParam ( ParamStr ( i ) ) = 'R-'   {/R-}
         THEN BEGIN
             SetDearchiveRecurse ( FALSE )
         END
         ELSE
         IF GetParam ( ParamStr ( i ) ) = 'CRC+' {/CRC+}
         THEN SetCheckFileCRC ( TRUE );
     END;
     writeln ( DecompressArchive, ' file(s) extracted.' );
  END
  ELSE
  { create Archive: "/A" }
  IF GetParam ( UserParam ) = 'A'
  THEN BEGIN
     SetArchiveFileSpecs ( InFName );
     SetArchiveName ( OutFName );
     SetCompressionChoices ( LZCompressionChoices );

     UserParam := Uppercase ( ParamStr ( ParamCount ) );
     IF  GetParam ( UserParam ) = 'R' THEN LZRecurseDirs := LZFullRecurse
     ELSE
     IF  GetParam ( UserParam ) = 'R1' THEN LZRecurseDirs := LZRecurseOnce
     ELSE LZRecurseDirs := LZNoRecurse;

     SetRecurseDirs ( LZRecurseDirs );
     SetSpanDisks ( True );  {  try to create a spanned archive in every case }
     Writeln ( CreateArchive );
  END ELSE
  { decompress single file: "/U" }
  IF GetParam ( UserParam ) = 'U' THEN writeln ( DecompressFile )
  ELSE
  IF  GetParam ( ParamStr ( 2 ) ) = '1' { "/1" } THEN writeln ( CompressFileEx )
  ELSE
  IF GetParam ( ParamStr ( 2 ) ) = '2'  { "/2 } THEN writeln ( DecompressFileEx )
  ELSE writeln ( CompressFile );

  {$ifdef Windows}
   {$ifdef Win32}
   {$ifdef WinCrt}
   ReadKey;
   DoneWincrt;
   {$endif WinCrt}
   {$else}
   {$ifndef DPMI}
   ReadKey;
   DoneWincrt;
    {$endif DPMI}
   {$endif Win32}
  {$endif Windows}

  {$ifdef Delphi}Free{$else}Done{$endif Delphi};
 END; { with MyLZ }
END.


