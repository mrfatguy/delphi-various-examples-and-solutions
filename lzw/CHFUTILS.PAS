UNIT ChfUtils;
{some miscellaneous routines for the ChiefLZ package}
{
THIS CODE WILL COMPILE FOR THE FOLLOWING PLATFORMS;
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

INTERFACE
{$i LZDefine.inc}

USES
ChfTypes
{$ifdef Delphi}
, SysUtils
{$else Delphi}
{$ifndef Windows}
, Dos
{$endif Windows}
{$endif Delphi}
;

CONST
  fmOpenRead       = $00;
  fmOpenWrite      = $01;
  fmOpenReadWrite  = $02;
  fmShareCompat    = $00;
  fmShareExclusive = $10;
  fmShareDenyWrite = $20;
  fmShareDenyRead  = $30;
  fmShareDenyNone  = $40;

FUNCTION ShortFileName ( {$ifndef Win32}CONST {$endif}s : TLZString ) : TLZString;

{add a Pascal TLZString to a pChar}
FUNCTION strpcat ( p : pChar; s : TLZString ) : pchar;

{Return the compression ratio}
FUNCTION GetCompressionRatio ( CONST Comp, UnComp : TLZCount ) : TLZCount;

{Return the hex TLZString for a word}
FUNCTION HexW ( W : Word ) : TLZstring;

{Return the hex TLZString for a TLZCount}
FUNCTION HexL ( L : TLZCount ) : TLZstring;

{ generic file name matching function }
FUNCTION MatchStrings ( CONST FileSpec, StringToSearch : TLZString ) : Boolean;

FUNCTION AddBackSlash ( CONST DirName : TLZstring ) : TLZstring;
FUNCTION RemoveBackSlash ( CONST S : TLZstring ) : TLZstring;
FUNCTION Min ( CONST I1, I2 : TLZCount ) : TLZCount;

FUNCTION FirstDirectoryBetween ( CONST s1, s2 : TLZstring ) : TLZstring;
FUNCTION DirectoryExists ( {$ifndef Win32}CONST{$endif Win32} s : TLZString ) : Boolean;
FUNCTION FSize ( CONST S : TLZString ) : TLZCount;
FUNCTION sFTime ( CONST s : TLZstring ) : TLZCount;
FUNCTION lFTime ( VAR f : file ) : TLZCount;

{ convert a string to a pChar }
FUNCTION Str2PChar ( VAR s : TLZString ) : PChar;

{ wrapper round DiskSize }
FUNCTION SizeofDisk ( CONST s : TLZString ) : longint;

{ wrapper round DiskFree }
FUNCTION FreeOnDisk ( CONST s : TLZString ) : longint;

{$ifdef Windows}
FUNCTION GetEnv ( CONST Env : TLZString ) : TLZString;
{$endif Windows}

{$ifdef Win32}

{$IFDEF Debug}
TYPE
  EChiefLZDebug = CLASS ( Exception );
{
  AddrOfCaller ***MUST*** be called by a routine that has a stack frame!!
}
FUNCTION AddrOfCaller : Pointer;
{$ENDIF Debug}

PROCEDURE RaiseError ( CONST EClass : ExceptClass; CONST Res : Integer );
PROCEDURE RaiseErrorStr ( CONST EClass : ExceptClass;
                        CONST Res :    Integer;
                        CONST Mes :    TLZstring );
PROCEDURE RaiseIOError ( CONST EMess, ECode : Integer );
FUNCTION CreateIOError ( CONST EMess, ECode : Integer ) : EInOutError;

FUNCTION FileVersionInfo ( CONST fName, StringToGet : TLZstring ) : TLZString;

{$else Win32}

TYPE
  PString = ^TLZString;

FUNCTION  GetCurrentDir : TLZstring;
FUNCTION  AnsiCompareText ( CONST s1, s2 : TLZString ) : integer;
FUNCTION  ExtractFileDir ( CONST aName : TLZString ) : TLZString;

{$ifdef Win16}
{$ifndef DPMI}
FUNCTION FileVersionInfo ( Fname, StringToGet : PChar ) : TLZString;
{$endif DPMI}
{$endif Win16}

{$IFDEF Debug}
PROCEDURE RunErrorMessage ( CONST Mes : TLZstring );
PROCEDURE RunErrorMessageAt ( CONST Mes : TLZstring; CONST ErrorLoc : Pointer );
{
  AddrOfCaller **MUST** be called by a FAR routine that has a stack frame!!
}
FUNCTION AddrOfCaller : Pointer; INLINE ( $8B / $46 / $02 /   { mov ax, [bp+2] }
                                       $8B / $56 / $04 );  { mov dx, [bp+4] }
{$ENDIF Debug}

{$endif Win32}

FUNCTION CurrentDirectory : TLZString;

{$ifndef Delphi}
FUNCTION ExtractFilePath ( CONST aName : TLZString ) : TLZString;
FUNCTION ExtractFileName ( CONST s : TLZString ) : TLZString;
FUNCTION ExtractFileExt ( CONST aName : TLZString ) : TLZString;
FUNCTION ChangeFileExt ( CONST aName, aExt : TLZString ) : TLZString;
FUNCTION Uppercase ( S : TLZString ) : TLZString;
FUNCTION IntToStr ( CONST i : TLZCount ) : TLZString;
FUNCTION FileExists ( CONST S : TLZString ) : Boolean;
FUNCTION FileSetAttr ( CONST S : TLZString; CONST Attr : Word ) : Integer;
FUNCTION FileGetAttr ( CONST S : TLZString ) : Word;
{$endif Delphi}

{$ifdef VirtualPascal} { VP2's function does not find hidden and system files! }
FUNCTION FileExists ( CONST S : TLZString ) : Boolean;
{$endif VirtualPascal}

{$ifndef Windows}
CONST
faDirectory = Directory;
faArchive = Archive;
{$endif Windows}

IMPLEMENTATION
USES
{$ifdef Win32}
Windows
{$else Win32}
{$ifdef Windows}
{$ifndef Delphi}
WinDos, Strings,
{$endif Delphi}
{$ifdef DPMI}
WinAPI
{$else DPMI}
WinTypes,
WinProcs,
Ver
{$endif DPMI}
{$else Windows}
Strings
{$endif Windows}
{$endif Win32};

{$IFDEF Debug}
{$ifdef Win32}
{
  This function has no stack frame of its own, hence EBP is its caller's
  stack frame. This means that EAX is loaded with the RETurn address of
  the calling function ...
}
{$W-}

FUNCTION AddrOfCaller : Pointer;ASSEMBLER;
ASM
  MOV EAX, [ EBP + 4 ]  // DWord at [ EBP ] IS old EBP
{
  Quick and dirty fix to overcome a *BUG* in ShowException()...
  Add an `anti-correction' to the address so that Delphi will return
  the absolute address of the exception, rather than a relative one.

  Remove this once ShowException() has been fixed ...
}
{$ifndef VP2} ADD EAX, OFFSET TextStart {$endif VP2}
END;

{$W+}
{$else Win32}

TYPE
  THexStr = String [ 4 ];

FUNCTION Hex4 ( X : Word ) : THexStr;
VAR
  i, j : byte;
BEGIN
  Hex4 [ 0 ] := chr ( 4 );
  FOR i := 4 DOWNTO 1 DO
    BEGIN
      j := lo ( X ) AND $F;
      IF j > 9 THEN
        inc ( j, ord ( 'A' ) - $A )
      ELSE
        inc ( j, ord ( '0' ) );
      X := X SHR 4;
      Hex4 [ i ] := chr ( j )
    END
END;

PROCEDURE RunErrorMessageAt ( CONST Mes : TLZString; CONST ErrorLoc : Pointer );
TYPE
  PtrRec = RECORD
             Ofs, Seg : word
           END;
{$ifdef Windows}
VAR
  NewMes : ARRAY [ 0..255 ] OF Char;
  HexNum : ARRAY [ 0..4 ] OF Char;
{$endif}
BEGIN
{$ifdef Windows}
{
  This is untested: I have no idea whether the address here will function
  correctly in the IDE. This address is the undoctored location of the
  error ...
}
  WITH PtrRec ( ErrorLoc ) DO
    StrCat ( StrCat ( StrCat ( StrCat ( 
               StrPCopy ( NewMes, Mes ),
               #13#10'Address for "Search|Find Error" is ' ),
               StrPCopy ( HexNum, Hex4 ( Seg ) ) ),
               ':' ),
               StrPCopy ( HexNum, Hex4 ( Ofs ) ) );
  {$ifndef DPMI}WinProcs.{$endif}MessageBox ( HInstance, NewMes,
                                             'ChiefLZ Error', MB_OK );
{$else Windows}
{
  Perform Real-Mode segment-arithmetic to calculate logical address for
  IDE. The IDE expects the segment number to be relative to the main
  program's code segment. This is located immediately after the PSP,
  and the PSP is 16 paragraphs long.
}
  Writeln;
  Writeln ( 'ChiefLZ Error: ', Mes );
  WITH PtrRec ( ErrorLoc ) DO
    Writeln ( 'Address for "Search|Find Error" is ',
                                  Hex4 ( Seg - PrefixSeg - 16 ), ':', Hex4 ( Ofs ) );
{$endif Windows}
  Halt
END;

PROCEDURE RunErrorMessage ( CONST Mes : TLZString );
BEGIN
  RunErrorMessageAt ( Mes, AddrOfCaller )
END;

{$endif Win32}
{$ENDIF}

{/////////////////////////////////////////////////}
{
  These are general-purpose functions used by all versions ...
}
{/////////////////////////////////////////////////}
FUNCTION AddBackSlash ( CONST DirName : TLZstring ) : TLZstring;
{-Add a default backslash to a directory name}
BEGIN
{$ifdef Win32}
{
  Win32 version uses ExpandFileName() ... ':' ***shouldn't*** appear ...
}
  IF ( Length ( DirName ) = 0 ) OR ( DirName [ Length ( DirName ) ] = '\' ) THEN
    AddBackSlash := DirName
  ELSE
    BEGIN
    {$IFDEF Debug}
      IF DirName [ Length ( DirName ) ] = ':' THEN
        RAISE EChiefLZDebug.Create ( 'Directory name "' + DirName +
                                   '" terminated by '':'' character' )
          at AddrOfCaller;  // Error will NOT be reported at THIS address,
    {$ENDIF}                // but where AddBackSlash (  ) was called.
      AddBackSlash := DirName + '\'
    END;
{$else}
  IF DirName [ Length ( DirName ) ] IN [ '\', ':', #0 ] THEN
    AddBackSlash := DirName
  ELSE
    AddBackSlash := DirName + '\'
{$endif}
END;

FUNCTION RemoveBackSlash ( CONST S : TLZstring ) : TLZstring;
{$ifdef Win32}
VAR
  i : Integer;
{$endif}
{$ifndef Delphi}
VAR
  Result : TLZstring;
{$endif}
BEGIN
  Result := s;
{$ifdef Win32}
  i := Length ( s );
  IF s [ i ] = '\' THEN
    SetLength ( Result, i - 1 );
{$else Win32}
  IF s [ Length ( s ) ] = '\' THEN
    dec ( Result [ 0 ] );
{$ifndef Delphi}
  RemoveBackSlash := Result;
{$endif Delphi}
{$endif Win32}
{$IFDEF Debug}
  IF Pos ( '\', Result ) = 0 THEN
  {$ifdef Win32}
    RAISE EChiefLZDebug.Create ( 'Removed ''\'' from root directory!' )
      at AddrOfCaller
  {$else Win32}
    RunErrorMessageAt ( 'Removed ''\'' from root directory!', AddrOfCaller )
  {$endif Win32};
{$ENDIF}
END;
{/////////////////////////////////////////////////////////}
FUNCTION FSize ( CONST S : TLZString ) : TLZCount;
{return the file size of filename "S"}
VAR
f : file;
OldFMode : byte;

BEGIN
    FSize := 0;
    IF not FileExists ( s ) THEN Exit;
    OldFMode := FileMode;

  {$ifdef Win32}
    AssignFile ( f, s );
    FileMode := fmOpenRead {$ifndef Ver90} OR fmShareDenyWrite{$endif Ver90}; { D2 only allows 0 <= FileMode <= 2 }
    TRY
    Reset ( f, 1 );             { However, share access is FILE_SHARE_READ }
    TRY
      Result := FileSize ( f )
    FINALLY
      CloseFile ( f );
    END;
    EXCEPT END;
    FileMode := OldFMode;
  {$else}
    FSize := 0;
    Assign ( f, s );
    FileMode := ( fmOpenRead OR fmShareDenyWrite );
    Reset ( f, 1 );
    FileMode := OldFMode;
    IF IOResult = 0 THEN BEGIN
        FSize := FileSize ( f );
        Close ( f );  { Reset() successful and ReadOnly - Close() cannot fail }
    END
  {$endif}
END;

{/////////////////////////////////////////////////////////}
FUNCTION sFTime ( CONST s : TLZstring ) : TLZCount;
{get the date/time stamp of a file}
VAR
{$ifdef Delphi}
Handle  : TLZCount;
{$else}
f       : file;
OldFMode : byte;
Result  : TLZCount;
{$endif}

BEGIN
   sFtime := 0;
   IF not FileExists ( s ) THEN Exit;
   {$ifdef Delphi}
    Handle := FileOpen ( s, fmOpenRead OR fmShareDenyNone );
    IF Handle <> - 1 THEN BEGIN
     sFTime := FileGetDate ( Handle );
     FileClose ( Handle );
    END;
   {$else}
   OldFMode := FileMode;
   FileMode := ( fmOpenRead OR fmShareDenyNone );
   Assign ( f, s );
   Reset ( f, 1 );
   FileMode := OldFMode;
   IF IOResult = 0 THEN BEGIN
      GetFTime ( f, Result );
      sfTime := Result;
      Close ( f )
   END;
   {$endif}
END;

{/////////////////////////////////////////////////////////}
FUNCTION lFTime ( VAR f : file ) : TLZCount;
{get the date/time stamp of a file}
{$ifndef Delphi}
VAR
Result : TLZCount;
{$endif}
BEGIN
{$ifdef Delphi}
  Result := FileGetDate ( TFileRec ( f ) .Handle );
{$else}
  GetFTime ( f, Result );
  lfTime := Result;
{$endif}
END;

{/////////////////////////////////////////////////////////}
FUNCTION DirectoryExists{ ( CONST s : TLZString ) : Boolean};
{does a directory exist?}
VAR
{$ifdef Win32}
Attr : DWORD;
{$else Win32}
{$ifdef Delphi}
Attr : Integer;
{$else Delphi}
f   : file;
Attr : word;
{$endif Delphi}
{$endif Win32}
BEGIN
{$ifdef Win32}
  s := s + #0;
  Attr := Windows.GetFileAttributes ( PChar ( @s [1] ) );
  Result := ( Attr <> $FFFFFFFF ) AND                  // Success ...
            ( Attr AND FILE_ATTRIBUTE_DIRECTORY <> 0 ) // Directory...
{$else Win32}
   Attr := FileGetAttr ( s );
   DirectoryExists := ( Attr >= 0 ) AND ( Attr AND faDirectory <> 0 );
{$endif Win32}
END;

FUNCTION FirstDirectoryBetween ( CONST s1, s2 : TLZstring ) : TLZstring;
VAR
  i : Integer;
BEGIN
{$IFDEF Debug}
  IF Pos ( s1, s2 ) = 0 THEN
  {$ifdef Win32}
    RAISE EChiefLZDebug.Create ( 'FirstDirectoryBetween: ' + s1 +
                               ' not a substring of ' + s2 )
      at AddrOfCaller
  {$else Win32}
    RunErrorMessageAt ( 'FirstDirectoryBetween: ' + s1 +
                       ' not a substring of ' + s2,
                       AddrOfCaller )
  {$endif Win32};
{$ENDIF}
  i := Length ( s1 );
  REPEAT
    inc ( i )
  UNTIL ( i > Length ( s2 ) ) OR ( s2 [ i ] = '\' );
  FirstDirectoryBetween := Copy ( s2, 1, i )
END;

{/////////////////////////////////////////////////}
FUNCTION Str2PChar ( VAR s : TLZString ) : PChar;
{convert TLZString to pChar type}
VAR
  i : integer;
  s1 : TLZstring;
BEGIN
  i := Length ( s );
  IF i = 0 THEN Str2PChar := #0
  ELSE BEGIN
      s1 := s;
      IF s [ i ] <> #0 THEN s := s + #0;
      Str2PChar := @s [ 1 ];
      s := s1;
  END
END;

{$ifdef Win32}

PROCEDURE RaiseError ( CONST EClass : ExceptClass; CONST Res : Integer );
BEGIN
  RAISE EClass.CreateRes ( Res )
END;

PROCEDURE RaiseErrorStr ( CONST EClass : ExceptClass;
                        CONST Res :    Integer;
                        CONST Mes :    TLZstring );
BEGIN
  RAISE EClass.CreateResFmt ( Res, [ Mes ] )
END;

{
  These functions enable IO-errors to be raised artificially ...
}
FUNCTION CreateIOError ( CONST EMess, ECode : Integer ) : EInOutError;
BEGIN
  Result := EInOutError.CreateRes ( EMess );
  Result.ErrorCode := ECode
END;

PROCEDURE RaiseIOError ( CONST EMess, ECode : Integer );
BEGIN
  RAISE CreateIOError ( EMess, ECode )
END;

FUNCTION Min ( CONST I1, I2 : TLZCount ) : TLZCount;
BEGIN
  IF I2 < I1 THEN
    Result := I2
  ELSE
    Result := I1
END;

{$else Win32}

FUNCTION  AnsiCompareText ( CONST s1, s2 : TLZString ) : integer;
VAR
p1, p2 : pChar;
BEGIN
    Getmem ( p1, 255 );
    Getmem ( p2, 255 );
    Strpcopy ( p1, s1 );
    Strpcopy ( p2, s2 );
    AnsiCompareText := StriComp ( p1, p2 );
    Freemem ( p1, 255 );
    Freemem ( p2, 255 );
END;

FUNCTION ExtractFileDir ( CONST aName : TLZString ) : TLZString;
{return the pathname only - strip filename out}
VAR
i : Word;
BEGIN
  i := Length ( aName );
  WHILE NOT ( aName [ i ] IN [ '\', ':' ] ) AND ( i <> 0 ) DO
     Dec ( i );
  IF i = 0 THEN
    ExtractFileDir := ''
  ELSE IF i = 1 THEN
    ExtractFileDir := Copy ( CurrentDirectory, 1, 3 )
  ELSE
    ExtractFileDir := Copy ( aName, 1, i )
END;
{////////////////////////////////////////}

{
  These functions provide tools not required in Delphi 2 ...
}
TYPE
  LongRec = RECORD
              Lo, Hi : Word
            END;

FUNCTION Min ( CONST I1, I2 : TLZCount ) : TLZCount; ASSEMBLER;
ASM
{$ifdef Delphi}
  DB $66; MOV AX, [ BP + OFFSET I1 ]  {* mov eax, I1       *}
  DB $66; MOV DX, [ BP + OFFSET I2 ]  {* mov edx, I2       *}
  DB $66; CMP AX, DX                  {* cmp eax, edx      *}
  JLE @Exit
  DB $66; MOV AX, DX                  {* mov eax, edx      *}
@Exit :
  DB $66, $0F, $A4, 11000010b, 16     {* shld edx, eax, 16 *}
{$else}
  MOV AX, LongRec [ BP + OFFSET I1 ].Lo
  MOV DX, LongRec [ BP + OFFSET I1 ].Hi
  MOV CX, LongRec [ BP + OFFSET I2 ].Lo
  MOV BX, LongRec [ BP + OFFSET I2 ].Hi
  CMP DX, BX
  JL @Exit
  JG @Swap
  CMP AX, CX
  JBE @Exit
@Swap :
  MOV AX, CX
  MOV DX, BX
@Exit :
{$endif}
END;
{/////////////////////////////////////////////////////////}
FUNCTION GetCurrentDir : TLZString;
{return the current directory}
{$ifndef Delphi}
VAR
  Result : TLZString;
{$endif Delphi}
BEGIN
  GetDir ( 0, Result );
{$ifndef Delphi}
  GetCurrentDir := Result
{$endif Delphi}
END;
{$endif Win32}

{$ifndef Delphi}
{/////////////////////////////////////////////////}
{
  These functions provide String and file-handling services that
  Delphi offers in SysUtils ...
}
{/////////////////////////////////////////////////}
FUNCTION Uppercase ( s : TLZString ) : TLZString;
{return uppercase of TLZString}
VAR
i : Integer;
BEGIN
   FOR i := 1 TO Length ( s ) DO s [ i ] := UpCase ( s [ i ] );
   Uppercase := s;
END;
{/////////////////////////////////////////////////////////}
FUNCTION ChangeFileExt ( CONST aName, aExt : TLZString ) : TLZString;
VAR
i, j : Integer;
BEGIN
  i := Length ( aName );
  j := i;
  WHILE ( i > 0 ) AND ( aName [ i ] <> '\' ) AND ( aName [ i ] <> ':' ) DO
    BEGIN
      IF aName [ i ] = '.' THEN
        BEGIN
          j := i - 1;
          break
        END;
      dec ( i )
    END;
  ChangeFileExt := Copy ( aName, 1, j ) + aExt
END;
{/////////////////////////////////////////////////////////}
FUNCTION IntToStr ( CONST i : TLZCount ) : TLZString;
VAR
s : String [80];
BEGIN
  Str ( i, s );
  IntToStr := s;
END;
{/////////////////////////////////////////////////////////}
FUNCTION IsUNC ( CONST s : TLZString ) : boolean;
{// look for UNC name in one TLZString (at beginning only) //}
BEGIN
  IsUNC := ( Length ( s ) > 3 ) AND ( s [ 1 ] = '\' ) AND ( s [ 2 ] = '\' );
END;
{/////////////////////////////////////////////////////////}
FUNCTION ExtractFilePath ( CONST aName : TLZString ) : TLZString;
{return the pathname only - strip filename out}
VAR
i : Word;
BEGIN
  i := Length ( aName );
  WHILE NOT ( aName [ i ] IN [ '\', ':' ] ) AND ( i <> 0 ) DO
     Dec ( i );
  IF i = 0 THEN
    ExtractFilePath := ''
  ELSE IF i = 1 THEN
    ExtractFilePath := aName [ 1 ]
  ELSE
    ExtractFilePath := AddBackSlash ( Copy ( aName, 1, i ) )
END;
{////////////////////////////////////////}
FUNCTION ExtractFileExt ( CONST aName : TLZString ) : TLZString;
{return the fileextension}
VAR
  i : Word;
BEGIN
   i := Length ( aName );
   WHILE ( i > 0 ) AND ( aName [ i ] <> '\' ) AND ( aName [ i ] <> ':' ) DO
     BEGIN
       IF aName [ i ] = '.' THEN
         BEGIN
           ExtractFileExt := Copy ( aName, i, Length ( aName ) );
           Exit
         END;
       Dec ( i )
     END;
   ExtractFileExt := ''
END;
{/////////////////////////////////////////////////////////}
FUNCTION ExtractFileName ( CONST s : TLZString ) : TLZString;
{return the filename only - strip path out}
VAR
i : Word;
BEGIN
   FOR i := Length ( s ) DOWNTO 1 DO
     IF s [ i ] IN [ ':', '\' ] THEN
     BEGIN
       ExtractFileName := Copy ( s, i + 1, Length ( s ) );
       Exit
     END; {s[i] in [':','\']}
   ExtractFileName := s
END;
{/////////////////////////////////////////////////////////}
FUNCTION FileExists ( CONST S : TLZString ) : Boolean;
VAR
  f : file;
  Attr : word;
BEGIN
  Assign ( f, s );
  GetFAttr ( f, Attr );
  FileExists := ( DosError = 0 )
END;
{/////////////////////////////////////////////////////////}
FUNCTION FileSetAttr ( CONST S : TLZString; CONST Attr : Word ) : Integer;
VAR
  f : file;
BEGIN
  Assign ( f, s );
  SetFAttr ( f, Attr );
  FileSetAttr := DosError;
END;
{/////////////////////////////////////////////////////////}
FUNCTION FileGetAttr;
VAR
  f : file;
  Attr : Word;
BEGIN
  FileGetAttr := 0;
  Assign ( f, s );
  GetFAttr ( f, Attr );
  IF DosError = 0 THEN FileGetAttr := Attr;
END;
{/////////////////////////////////////////////////////////}
{$endif Delphi}

{$ifdef VirtualPascal} { VP2's function does not find hidden and system files! }
FUNCTION FileExists ( CONST S : TLZString ) : Boolean;
VAR
Attr : longint;
BEGIN
   Attr := FileGetAttr ( s );
   Result := ( Attr >= 0 ) AND ( Attr AND faDirectory = 0 );
END;
{$endif VirtualPascal}

{$ifDef Windows}
{////////////////////////////////////////////////////////}
{$ifdef Win32}
FUNCTION FileVersionInfo ( CONST fName, StringToGet : TLZstring ) : TLZString;
{get the version information from inside a Win32 binary}
CONST
  DefaultLangInfo : LongRec = ( Lo : $0409;
                                Hi : $04E4 );
VAR
  VSize           : TLZCount;
  VHandle         : THandle;
  Buffer          : Pointer;
  TranslationInfo : Pointer;
  LangCharSetID   : LongRec;
  Length          : DWORD;
  fNameEx,
  StringFileInfo  : AnsiString;
  aResult         : PChar;

BEGIN
  FileVersionInfo := '';
  FNameEx := FName;
  { Get size of version info }
  VSize := GetFileVersionInfoSize ( PChar ( fNameEx ), VHandle );
  IF VSize > 0 THEN
    BEGIN
    {$IFDEF Debug}
      IF VHandle <> 0 THEN
        RAISE EChiefLZDebug.Create ( 'FileVersionInfo() has failed!' );
    {$ENDIF}
  { Allocate version info buffer }
      GetMem ( Buffer, VSize );
      TRY { finally }
  { Get version info }
        IF GetFileVersionInfo ( PChar ( fNameEx ), VHandle, VSize, Buffer ) THEN
          TRY { except }
  { Get translation info for Language / CharSet IDs }
            IF NOT VerQueryValue ( Buffer,
                                '\VarFileInfo\Translation',
                                 TranslationInfo,
                                 Length ) THEN
              LangCharSetID := DefaultLangInfo {no translation info - use defaults}
            ELSE
              LangCharSetID := LongRec ( TranslationInfo^ );
{
  N.B. If cannot get Translation info, (because there ISN'T any ...???)
       will the default values mean anything anyway ...?
}
            WITH LangCharSetID DO
              StringFileInfo :=
                    Format ( '\StringFileInfo\%4.4x%4.4x\' + StringToGet,
                            [ Lo, Hi ] );
            IF VerQueryValue ( Buffer, PChar ( StringFileInfo ),
                             Pointer ( aResult ), Length ) THEN
            BEGIN
               Result := StrPas ( pChar ( aResult ) );
               {SetString ( Result, aResult, Length );}
            END;
          EXCEPT
{
  WinNT does not support the version-information functions for 16 bit
  executable files (although Win95 seems to). Therefore we `handle'
  any EAccessViolation exceptions that VerQueryValue() might raise,
  ensuring that FileVersionInfo() returns an empty TLZString-value ...
}
            on EAccessViolation DO;
          END
      FINALLY
        FreeMem ( Buffer, VSize )
      END
    END
END;
{$else Win32}
{$ifndef DPMI}
FUNCTION FileVersionInfo ( Fname, StringToGet : PChar ) : TLZString;
{get the version information from inside a Windows binary}
TYPE
  TLangArray = ARRAY [ 1..2 ] OF Word;
VAR
  VSize, VHandle : TLZCount;
  Buffer : PChar;
  Length : Word;
  TranslationInfo, aResult : Pointer;
  StringFileInfo : ARRAY [ 0..255 ] OF Char;
  LangCharSetIDArray : TLangArray;
CONST
  DefaultLangInfo : TLangArray = ( $0409, $04E4 );

BEGIN
  FileVersionInfo := '';
  { Get size of version info }
  VSize := GetFileVersionInfoSize ( fName, VHandle );
  IF VSize < 1 THEN Exit;

  StrCopy ( StringFileInfo, '\StringFileInfo\%04x%04x\' );
  { Allocate version info buffer }
  GetMem ( Buffer, VSize + 1 );
  { Get version info }
  IF Buffer <> NIL THEN
  BEGIN
    IF GetFileVersionInfo ( fName, VHandle, VSize, Buffer ) THEN
    BEGIN
      { Get translation info for Language / CharSet IDs }
      IF NOT VerQueryValue ( Buffer, '\VarFileInfo\Translation',
                                          TranslationInfo, Length )
      THEN BEGIN
        LangCharSetIDArray := DefaultLangInfo {no translation info - use defaults}
      END
      ELSE
        BEGIN
          LangCharSetIDArray [ 1 ] := LoWord ( TLZCount ( TranslationInfo^ ) );
          LangCharSetIDArray [ 2 ] := HiWord ( TLZCount ( TranslationInfo^ ) )
        END;
      wvsPrintf ( StringFileInfo, StrCat ( StringFileInfo, StringToGet ),
                                                    LangCharSetIDArray );
      IF VerQueryValue ( Buffer, StringFileInfo, aResult, Length ) THEN
        FileVersionInfo := StrPas ( PChar ( aResult ) );
    END;
    FreeMem ( Buffer, VSize + 1 );
  END;
END;
{$endif DPMI}
{$endif Win32}
{///////////////////////////////////////////////}
{$endif Windows}

FUNCTION ShortFileName ( {$ifndef Win32}CONST {$endif}s : TLZString ) : TLZString;
VAR
  p : ARRAY [ 0..79 ] OF char;
BEGIN
    ShortFileName := s;
    {$ifdef Win32}
    s := s + #0;
    IF GetShortPathName ( @s [ 1 ], p, 80 ) > 0 THEN Result := strpas ( p );
    {$endif Win32}
END;
{///////////////////////////////////////////////}
FUNCTION strpcat ( p : pChar;s : TLZString ) : pchar;
BEGIN
   s := s + #0;
   strpcat := strcat ( p, @s [1] );
END;
{///////////////////////////////////////////////}
FUNCTION GetCompressionRatio ( CONST Comp, UnComp : TLZCount ) : TLZCount;
VAR
r, r2 : Real;
BEGIN
  IF ( UnComp = 0 )
  OR ( UnComp = Comp )
  THEN GetCompressionRatio := 0  { 0%, on the grounds that the file }
  ELSE                           { is still its original size ...   }
  BEGIN
    r2 := Comp / UnComp;
    r  := r2 * 100;
    r  := 100 - r;
    GetCompressionRatio :=  Round ( r );
  END;
END;
{///////////////////////////////////////////}
FUNCTION MatchStrings ( CONST FileSpec, StringToSearch : TLZString ) : Boolean;
VAR
pStringToSearch,
pFileSpec : pChar;
b1 : boolean;

FUNCTION MatchPattern ( Element, FileSpec : PChar ) : Boolean;

FUNCTION IsPatternWild ( FileSpec : PChar ) : Boolean;
VAR
  b : Boolean;
BEGIN
  b := StrScan ( FileSpec, '*' ) <> nil;
  IF not b THEN b := StrScan ( FileSpec, '?' ) <> nil;
  IsPatternWild := b;
END;

BEGIN
  b1 := False;
  IF 0 = StrComp ( FileSpec, '*' ) THEN
    b1 := True
  ELSE IF ( element^ = Chr ( 0 ) ) AND ( FileSpec^ <> Chr ( 0 ) ) THEN
    b1 := False
  ELSE IF element^ = Chr ( 0 ) THEN
    b1 := True
  ELSE BEGIN
    CASE FileSpec^ OF
    '*' : IF MatchPattern ( element, @FileSpec [1] ) THEN
           b1 := True
         ELSE
           b1 := MatchPattern ( @element [1], FileSpec );
    '?' : b1 := MatchPattern ( @element [1], @FileSpec [1] );

    ELSE
      IF element^ = FileSpec^ THEN
        b1 := MatchPattern ( @element [1], @FileSpec [1] )
      ELSE
        b1 := False;
    END;  { case }
  END; { else begin }
  MatchPattern := b1;
END; { MatchPattern }

BEGIN{ MatchStrings }
  Getmem ( pStringToSearch, 255 );
  Getmem ( pFileSpec, 255 );
  StrPCopy ( pStringToSearch, StringToSearch );
  StrPCopy ( pFileSpec, FileSpec );
  MatchStrings := MatchPattern ( pStringToSearch, pFileSpec );
  Freemem ( pFileSpec, 255 );
  Freemem ( pStringToSearch, 255 );
END; { MatchStrings }
{///////////////////////////////////////////}
{///////////////////////////////////////////}
{//////// HEX functions ////////////////////}
{///////////////////////////////////////////}
TYPE
LRec = RECORD
  LW, HW : Word;
END;

CONST
Digits : ARRAY [0..$F] OF Char = '0123456789ABCDEF';

FUNCTION HexW ( W : Word ) : TLZstring;
BEGIN
    HexW [0] := #4;
    HexW [1] := Digits [hi ( W ) SHR 4];
    HexW [2] := Digits [hi ( W ) AND $F];
    HexW [3] := Digits [lo ( W ) SHR 4];
    HexW [4] := Digits [lo ( W ) AND $F];
END;
{///////////////////////////////////////////}
FUNCTION HexL ( L : TLZCount ) : TLZstring;
BEGIN
    WITH LRec ( L ) DO HexL := HexW ( HW ) + HexW ( LW );
END;
{///////////////////////////////////////////}
{$ifdef Windows}
FUNCTION GetEnv ( CONST Env : TLZString ) : TLZString;
VAR
p2 : pChar;
i  : Word;
s  : TLZString;
BEGIN
    GetEnv := '';
    {$ifdef Win32}
    p2 := GetEnvironmentStrings;
    {$else}
    p2 := GetDOSEnvironment;
    {$endif}
    WHILE p2 [0] <> #0 DO
    BEGIN
      s := StrPas ( p2 );
      IF ( Pos ( UpperCase ( Env ), UpperCase ( s ) ) = 1 ) THEN
      BEGIN
        i := Pos ( '=', s );
        IF i = 0 THEN i := pos ( #32, s );
        Delete ( s, 1, i );
        GetEnv := s;
        Exit;
      END;
      WHILE ( p2 [0] <> #0 ) DO Inc ( p2 ); { goto end of current }
      Inc ( p2 ); { point to next }
    END;
    {$ifdef Win32}
      FreeEnvironmentStrings ( p2 );
    {$endif}
END {GetEnv};
{$endif Windows}
{///////////////////////////////////////////}
FUNCTION CurrentDirectory : TLZString;
{$ifndef Delphi}
VAR
Result : String [80];
{$endif}
BEGIN
    GetDir ( 0, Result );
    {$ifndef Delphi}
    CurrentDirectory := Result;
    {$endif}
END;
{///////////////////////////////////////////}
FUNCTION FreeOnDisk ( CONST s : TLZString ) : longint;
VAR
i : byte;
Ch : Char;
BEGIN
      Ch := Upcase ( s [1] );
      i := Ord ( ch ) - 64;
      FreeOnDisk := DiskFree ( i );
END;
{////////////////////////////////////////////////////}
FUNCTION SizeofDisk ( CONST s : TLZString ) : longint;
VAR
i : byte;
Ch : Char;
BEGIN
      Ch := Upcase ( s [1] );
      i := Ord ( ch ) - 64;
      SizeofDisk := DiskSize ( i );
END;
{////////////////////////////////////////////////////}

END.
