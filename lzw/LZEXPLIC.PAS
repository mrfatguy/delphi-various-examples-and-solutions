{$I LZDefine.inc}
UNIT LZExplic;
{ sample "explicit" or "dynamic" import unit for ChiefLZ.dll ... }
{
THIS CODE WILL COMPILE FOR THE FOLLOWING PLATFORMS;
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
{&Stdcall+}    { Virtual Pascal directive }
USES
{$ifdef Win32}
Windows,
SysUtils,
LZ_Link,
{$else Win32}
{$ifdef dpmi}
WinAPI,
{$else dpmi}
WinTypes,
WinProcs,
{$endif dpmi}
{$ifdef Delphi}
Messages,
SysUtils,
{$else Delphi}
{$ifndef dpmi}
Win31,
{$endif dpmi}
Strings,
{$endif Delphi}
{$endif Win32}
ChfTypes,
ChfUtils;


{ exported functions (not DLL imports) }
FUNCTION LoadChiefLZDLL ( DLLName : PChar ) : TLZCount;
{load the ChiefLZ DLL - Win16 returns 0 if successful,
                        and something else if not successful
                      - Win32 returns True if successful and False otherwise
                        If False, the error code is obtained by calling
                        GetLastError()
                      - you can supply a new DLL name to use instead of
                        the default "ChiefLZ.DLL".
Call this first, before doing anything}

FUNCTION UnloadChiefLZDLL : Boolean;
{unload the DLL - call this last, after doing the LZ functions}

FUNCTION GetChiefLZDLLHandle : TLZCount;
{return the value of the ChiefLZDLLHandle}

{//////////////////////////////////////////}
{imported DLL functions}
VAR IsChiefLZArchive : FUNCTION ( fName : PChar ) :  TLZCount
{$ifdef Win32} STDCALL {$endif Win32};

VAR GetChiefLZFileName : FUNCTION ( fName, Dest : PChar ) : boolean;

VAR GetChiefLZFileSize : FUNCTION ( fName : PChar ) : TLZCount
{$ifdef Win32} STDCALL {$endif Win32};

VAR GetChiefLZArchiveInfo : FUNCTION ( ArchName : PChar;
                                      VAR Header : TChiefLZArchiveHeader ) : TLZCount
{$ifdef Win32} STDCALL {$endif Win32};

VAR GetChiefLZArchiveSize : FUNCTION ( ArchName : PChar ) : TLZCount
{$ifdef Win32} STDCALL {$endif Win32};

VAR LZCompress : FUNCTION ( aSource, aDest : pChar;
                         LZQuestion : TLZQuestionFunc;
                         aProc :      TLZReportProc;
                         CompMethod : TLZCompressionChoices ) : TLZCount
{$ifdef Win32} STDCALL {$endif Win32};

VAR LZDecompress : FUNCTION ( aSource, aDest : PChar;
                           LZQuestion : TLZQuestionFunc;
                           aProc :      TLZReportProc ) : TLZCount
{$ifdef Win32} STDCALL {$endif Win32};


VAR IsChiefLZFile : FUNCTION ( fName : PChar ) : boolean
{$ifdef Win32} STDCALL {$endif Win32};

VAR IsChiefLZFileEx : FUNCTION ( fName : PChar; VAR Header : TLZHeader ) : boolean
{$ifdef Win32} STDCALL {$endif Win32};


VAR LZArchive : FUNCTION ( fSpec, ArchName : PChar;
                        LZRecurseDirs : TLZRecurse;
                        aProc :         TLZReportProc;
                        CompMethod : TLZCompressionChoices ) : TLZCount
{$ifdef Win32} STDCALL {$endif Win32};


VAR LZDearchive : FUNCTION ( ArchName : PChar; aDefDir : PChar;
                          LZQuestion : TLZQuestionFunc;
                          aProc :      TLZReportProc;
                          aRename :    TLZRenameFunc;
                          RecurseDirs,
                          ExtractAsCompressed : Boolean
                           ) : TLZCount
{$ifdef Win32} STDCALL {$endif Win32};

VAR LZArchiveEx : FUNCTION ( fSpec, ArchName : PChar;
                             LZRecurseDirs : TLZCount ) : TLZCount
{$ifdef Win32} STDCALL {$endif Win32};

VAR LZDearchiveEx : FUNCTION ( ArchName, DefDir : PChar ) : TLZCount
{$ifdef Win32} STDCALL {$endif Win32};

VAR LZListArchive : FUNCTION ( ArchName : PChar; pHeader : pLZArchiveHeader; ListFunc : TLZReportProc ) :
TLZCount
{$ifdef Win32} STDCALL {$endif Win32};

VAR LZCompressEx : FUNCTION ( aName : PChar;
                           ReplaceQuestion : TLZQuestionFunc;
                           aProc :           TLZReportProc ) : TLZCount
{$ifdef Win32} STDCALL {$endif Win32};


VAR LZDecompressEx : FUNCTION ( aName : PChar;
                             ReplaceQuestion : TLZQuestionFunc;
                             aProc :           TLZReportProc ) : TLZCount
{$ifdef Win32} STDCALL {$endif Win32};

VAR SetIgnoreExtensions : PROCEDURE ( IgnoreExtensions : pChar )
{$ifdef Win32} STDCALL {$endif Win32};

VAR GetIgnoreExtensions : FUNCTION : pChar
{$ifdef Win32} STDCALL {$endif Win32};

VAR SetDecompressMask : PROCEDURE ( Mask : pChar )
{$ifdef Win32} STDCALL {$endif Win32};

VAR GetDecompressMask : FUNCTION : pChar
{$ifdef Win32} STDCALL {$endif Win32};

VAR ChiefLZ_Init : PROCEDURE  {$ifdef Win32} STDCALL {$endif Win32};

VAR GetLZMarkerChar : FUNCTION : Char {$ifdef Win32} STDCALL {$endif};

VAR SetLZMarkerChar : PROCEDURE ( CONST NewChar : Char )
{$ifdef Win32} STDCALL {$endif};

VAR ChiefLZDLLVersion : FUNCTION : TLZCount {$ifdef Win32} STDCALL {$endif};

VAR IsChiefLZArchiveEx : FUNCTION
( fName : PChar; VAR Hed : TLZArchiveHeader ) : TLZCount
{$ifdef Win32} STDCALL {$endif};

VAR SetCheckFileCRCs : FUNCTION   ( ToCheck : Boolean ) : Boolean
{$ifdef Win32} STDCALL {$endif};

VAR SetArchiveHeaderBegin : FUNCTION ( NewOffset : TLZCount ) : TLZCount
{$ifdef Win32} STDCALL {$endif};

VAR SetArchiveSetPassWordFunc : FUNCTION  ( aProc : TLZSetPassWordFunc ) : Pointer
{$ifdef Win32} STDCALL {$endif};

VAR SetArchiveCheckPassWordFunc : FUNCTION  ( aProc : TLZCheckPassWordFunc ) : Pointer
{$ifdef Win32} STDCALL {$endif};

VAR ResetPassWordFlag : PROCEDURE
{$ifdef Win32} STDCALL {$endif};

VAR FreePassWordFlag : PROCEDURE  ( CONST Code : TLZCount )
{$ifdef Win32} STDCALL {$endif};

VAR IsChiefLZSfxArchive : FUNCTION
( fName : PChar; VAR Hed : TLZArchiveHeader ) : TLZCount
{$ifdef Win32} STDCALL {$endif Win32};

VAR LZSfxArchive : FUNCTION ( CONST
         Stub, fSpec, ArchName : PChar;
         LZRecurseDirs : TLZRecurse;
         aProc : TLZReportProc;
         CompMethod : TLZCompressionChoices ) : TLZCount
{$ifdef Win32} STDCALL {$endif Win32};

VAR LZSfxDearchive : FUNCTION ( 
         SfxArchiveName, DefDir : PChar;
         LZQuestion : TLZQuestionFunc;
         aProc : TLZReportProc;
         aRename : TLZRenameFunc;
         RecurseDirs,
         ExtractAsCompressed : Boolean
          ) : TLZCount
{$ifdef Win32} STDCALL {$endif Win32};

VAR LZArchiveFromLZSFXArchive  : FUNCTION ( SfxArchiveName, ArchName : pChar ) : TLZCount
{$ifdef Win32} STDCALL {$endif Win32};

VAR FileMatch : FUNCTION  ( FileSpec, TheFName : pChar; ArchiveID : TLZCount ) : Boolean
{$ifdef Win32} STDCALL {$endif Win32};

VAR SetFileMatchFunc : FUNCTION  ( CONST aProc : TLZFileMatchFunc ) : Pointer
{$ifdef Win32} STDCALL {$endif Win32};

VAR GetFileMatchFunc : FUNCTION : Pointer
{$ifdef Win32} STDCALL {$endif Win32};

VAR LocalArchiveHeaderPtr : FUNCTION : PChiefLZArchiveHeader
{$ifdef Win32} STDCALL {$endif Win32};

VAR GetChiefLZFileInfo : FUNCTION  ( fName : PChar; VAR Rec : TLZReportRec ) : TLZCount
{$ifdef Win32} STDCALL {$endif};

VAR HasPassWord : FUNCTION ( fName : PChar ) : TLZCount
{$ifdef Win32} STDCALL {$endif};

VAR ExtractArchiveCommentFile : FUNCTION ( ArchName, DestDir, RetValue : pChar ) : TLZCount
{$ifdef Win32} STDCALL {$endif};

VAR MarkArchiveCommentFile : FUNCTION  ( fName : pChar ) : TLZCount
{$ifdef Win32} STDCALL {$endif};

VAR SetSpanDiskPromptFunc : FUNCTION ( aProc : TLZSpanPromptProc ) : Pointer
{$ifdef Win32} STDCALL {$endif Win32};

VAR IsChiefLZSpannedHeader : FUNCTION ( CONST Header : TLZArchiveHeader ) : Boolean
{$ifdef Win32} STDCALL {$endif Win32};

VAR IsChiefLZSpannedArchiveEx : FUNCTION ( ArchName : pChar; VAR Hed : TLZArchiveHeader ) : TLZCount
{$ifdef Win32} STDCALL {$endif Win32};

VAR IsChiefLZSpannedArchive : FUNCTION ( ArchName : pChar ) : TLZCount
{$ifdef Win32} STDCALL {$endif Win32};

VAR LZArchiveSpan : FUNCTION ( 
                   fSpec,
                   ArchName      : pChar;
                   LZRecurseDirs : TLZRecurse;
                   aProc         : TLZReportProc;
                   CompMethod    : TLZCompressionChoices;
                   pSpanInfo     : PLZSpanConfig
                    ) : TLZCount
{$ifdef Win32} STDCALL {$endif Win32};

VAR LZDearchive_ : FUNCTION ( ArchName : PChar; aDefDir : PChar;
                     LZQuestion : TLZQuestionFunc;
                     aProc :      TLZReportProc;
                     aRename :    TLZRenameFunc;
                     RecurseDirs,
                     ExtractAsCompressed : Boolean
                      ) : TLZCount
{$ifdef Win32} STDCALL {$endif Win32};

IMPLEMENTATION

{$ifdef Win32}
VAR
{$else Win32}
CONST
{$endif Win32}
ChiefLZDLLHandle : TLZCount = 0;

CONST
ChiefLZDLLDefaultName : PChar = 'ChiefLZ.DLL';  {DLL Name}
{ This is the default in the DLL "load" function; we will use this pointer
  if no other is passed in LoadChiefLZDLL() }

FUNCTION LoadChiefLZProc ( VAR   FuncAddr : Pointer;
                           CONST FuncName : pChar ) : boolean;
VAR
  LocalAddr : Pointer;
  b         : boolean;
BEGIN
  LocalAddr := GetProcAddress ( ChiefLZDLLHandle, FuncName );
  b := LocalAddr <> NIL;
  LoadChiefLZProc := b;
  IF b THEN FuncAddr := LocalAddr;
END;
{/////////////////////////////////////////////}
{/////////////////////////////////////////////}
FUNCTION LoadChiefLZDLL ( DLLName : PChar ) : TLZCount;
VAR
{$ifndef DPMI}
  OldWError : TLZCount;
{$endif DPMI}
b : boolean;

BEGIN

  {see if we supplied another DLL name; use default if we didn't ...}
   IF StrLen ( DLLName ) = 0 THEN DLLName := ChiefLZDLLDefaultName;

   LoadChiefLZDLL := - 1; {DLL can't be loaded}
   {$ifndef DPMI}
   OldWError := SetErrorMode ( sem_NoOpenFileErrorBox );
   {$endif DPMI}

   ChiefLZDLLHandle := LoadLibrary ( DLLName );

   {$ifndef DPMI}
   SetErrorMode ( OldWError );
   {$endif DPMI}
   IF ChiefLZDLLHandle <= 32 THEN Exit;

   LoadChiefLZDLL := - 2; {undefined dyna-link}
   b :=
         { DLL version }
         LoadChiefLZProc ( @ChiefLZDLLVersion, 'ChiefLZDLLVersion' ) AND

         { general initialization - don't call this manually! }
         LoadChiefLZProc ( @ChiefLZ_Init, 'ChiefLZ_Init' ) AND

         { single file compression }
         LoadChiefLZProc ( @LZCompress, 'LZCompress' ) AND
         LoadChiefLZProc ( @LZDecompress, 'LZDecompress' ) AND
         LoadChiefLZProc ( @IsChiefLZFile, 'IsChiefLZFile' ) AND
         LoadChiefLZProc ( @LZCompressEx, 'LZCompressEx' ) AND
         LoadChiefLZProc ( @LZDecompressEx, 'LZDecompressEx' ) AND
         LoadChiefLZProc ( @GetLZMarkerChar, 'GetLZMarkerChar' ) AND
         LoadChiefLZProc ( @SetLZMarkerChar, 'SetLZMarkerChar' ) AND
         LoadChiefLZProc ( @GetChiefLZFileName, 'GetChiefLZFileName' ) AND
         LoadChiefLZProc ( @GetChiefLZFileSize, 'GetChiefLZFileSize' ) AND

         { archives }
         LoadChiefLZProc ( @LZArchive, 'LZArchive' ) AND
         LoadChiefLZProc ( @LZArchiveSpan, 'LZArchiveSpan' ) AND
         LoadChiefLZProc ( @LZDearchive, 'LZDearchive' ) AND
         LoadChiefLZProc ( @LZDearchive_, 'LZDearchive_' ) AND
         LoadChiefLZProc ( @IsChiefLZArchive, 'IsChiefLZArchive' ) AND
         LoadChiefLZProc ( @GetChiefLZArchiveInfo, 'GetChiefLZArchiveInfo' ) AND

         LoadChiefLZProc ( @GetChiefLZArchiveSize, 'GetChiefLZArchiveSize' ) AND
         LoadChiefLZProc ( @SetIgnoreExtensions, 'SetIgnoreExtensions' ) AND
         LoadChiefLZProc ( @GetIgnoreExtensions, 'GetIgnoreExtensions' ) AND
         LoadChiefLZProc ( @SetDecompressMask, 'SetDecompressMask' ) AND
         LoadChiefLZProc ( @GetDecompressMask, 'GetDecompressMask' ) AND
         LoadChiefLZProc ( @LZArchiveEx, 'LZArchiveEx' ) AND
         LoadChiefLZProc ( @LZDearchiveEx, 'LZDearchiveEx' ) AND
         LoadChiefLZProc ( @IsChiefLZArchiveEx, 'IsChiefLZArchiveEx' ) AND
         LoadChiefLZProc ( @SetCheckFileCRCs, 'SetCheckFileCRCs' ) AND
         LoadChiefLZProc ( @IsChiefLZFileEx, 'IsChiefLZFileEx' ) AND
         LoadChiefLZProc ( @GetChiefLZFileInfo, 'GetChiefLZFileInfo' ) AND
         LoadChiefLZProc ( @LZListArchive,  'LZListArchive' ) AND
         LoadChiefLZProc ( @SetArchiveHeaderBegin, 'SetArchiveHeaderBegin' ) AND
         LoadChiefLZProc ( @SetArchiveSetPassWordFunc, 'SetArchiveSetPassWordFunc' ) AND
         LoadChiefLZProc ( @SetArchiveCheckPassWordFunc, 'SetArchiveCheckPassWordFunc' ) AND
         LoadChiefLZProc ( @IsChiefLZSfxArchive, 'IsChiefLZSfxArchive' ) AND
         LoadChiefLZProc ( @LZSfxArchive, 'LZSfxArchive' ) AND
         LoadChiefLZProc ( @LZSfxDearchive, 'LZSfxDearchive' ) AND
         LoadChiefLZProc ( @LZArchiveFromLZSFXArchive, 'LZArchiveFromLZSFXArchive' ) AND
         LoadChiefLZProc ( @FreePassWordFlag, 'FreePassWordFlag' ) AND
         LoadChiefLZProc ( @ResetPassWordFlag, 'ResetPassWordFlag' ) AND
         LoadChiefLZProc ( @SetFileMatchFunc, 'SetFileMatchFunc' ) AND
         LoadChiefLZProc ( @GetFileMatchFunc, 'GetFileMatchFunc' ) AND
         LoadChiefLZProc ( @LocalArchiveHeaderPtr, 'LocalArchiveHeaderPtr' ) AND
         LoadChiefLZProc ( @FileMatch, 'FileMatch' ) AND
         LoadChiefLZProc ( @ExtractArchiveCommentFile, 'ExtractArchiveCommentFile' ) AND
         LoadChiefLZProc ( @MarkArchiveCommentFile, 'MarkArchiveCommentFile' ) AND
         LoadChiefLZProc ( @HasPassWord, 'HasPassWord' ) AND
         LoadChiefLZProc ( @SetSpanDiskPromptFunc,      'SetSpanDiskPromptFunc' ) AND
         LoadChiefLZProc ( @IsChiefLZSpannedArchive,    'IsChiefLZSpannedArchive' ) AND
         LoadChiefLZProc ( @IsChiefLZSpannedArchiveEx,  'IsChiefLZSpannedArchiveEx' ) AND
         LoadChiefLZProc ( @IsChiefLZSpannedHeader,     'IsChiefLZSpannedHeader' );

         IF b
         THEN LoadChiefLZDLL := 0 {success}
         ELSE UnloadChiefLZDLL;
END;
{/////////////////////////////////////////////}
FUNCTION UnloadChiefLZDLL : Boolean;
BEGIN
   UnloadChiefLZDLL := FALSE; {invalid handle}
   IF ChiefLZDLLHandle > 32
   THEN BEGIN
      FreeLibrary ( ChiefLZDLLHandle );
      UnloadChiefLZDLL := TRUE;
   END;
   ChiefLZDLLHandle := 0;
END;
{/////////////////////////////////////////////}

FUNCTION GetChiefLZDLLHandle : TLZCount;
{return the value of the ChiefLZDLLHandle}
BEGIN
  GetChiefLZDLLHandle := ChiefLZDLLHandle
END;
{/////////////////////////////////////////////}
{/////////////////////////////////////////////}
{/////////////////////////////////////////////}
{/////////////////////////////////////////////}
VAR SaveProc : Pointer;
PROCEDURE FreeThisDLL; far;
BEGIN
   ExitProc := SaveProc;
   UnloadChiefLZDLL;
END;
{/////////////////////////////////////////////}
VAR
i : TLZCount;
BEGIN
    SaveProc := ExitProc;
    ExitProc := @FreeThisDLL;
    i := LoadChiefLZDLL ( '' );
    IF i <> 0 THEN BEGIN
       {$ifdef DPMI}
        Writeln
        ( 'I am unable to load the ChiefLZ DLL functions. Errorcode = ', i );
       {$else}
        MessageBox
        ( 0, 'I am unable to load the ChiefLZ DLL functions', 'DLL Load Error',
        mb_ok + mb_IconHand );
       {$endif}
        Halt ( i );
    END;
END.
{////////////////////////}
