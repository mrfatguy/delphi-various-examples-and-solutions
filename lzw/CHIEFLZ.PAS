{
   CHIEFLZ UNIT/DLL, by Dr A Olowofoyeku (the African Chief);
   internet: laa12@keele.ac.uk
   http://ourworld.compuserve.com/homepages/African_Chief/

   USES the original LZSSUNIT source, as amended by the Chief,
   and Chris J Rankin.

   First ported to Win32 (Delphi 2.0) by Chris Rankin.

   // -----------------------------------------------------------//
    * 16-bit ASM functions converted to 32-bit ASM by Chris J Rankin
    * Win32 (Delphi 2.0) code: first added by Chris J Rankin
    * Win32 porting extended and maintained by Dr A Olowofoyeku

  Package assembled together for first public release: 5th September 1996.

  The routines in this package are already being used in some famous
  programs!

}


{----------------------------------------------------------------------}
{
to compile to a DLL in Delphi you need to rename this with the
extension .DPR
}

{$I LZDefine.inc}   {// defines various things, including "aDLL" //}

{$ifDef aDLL}
 LIBRARY ChiefLZ;

 USES
 {$ifdef Win32}
   {$ifndef VP2}
   {ShareMem, }
   {$endif VP2}   // Because the LIBRARY EXPORTS functions that have
                // longstring results / parameters, we need TO use
                // the ShareMem UNIT. All apps that use this LIBRARY
                // * must also use ShareMem * - Put DelphiMM.dll on the
                // Path too ...
   Windows,
   LZSS32,
   LZ_Const,
   LZ_DLL,
 {$else Win32}
   LZSS16,
 {$ifdef Windows}
 {$ifdef DPMI}
   WinAPI,
 {$else DPMI}
   WinTypes,
   WinProcs,
 {$endif DPMI}
 {$endif Windows}
 {$endif Win32}

 {$ifDef Delphi}
   Wintypes,
   SysUtils,
 {$else Delphi}
   WinDos,
   Strings,
 {$endif Delphi}
   ChfCRC,
   LHSix,
   ChfTypes,
   ChfHash,
   ChfUtils;

{$else aDLL}
 UNIT ChiefLZ;
{$endif aDLL}

{------------------------------------------------------------}

{$ifNDef aDLL}
INTERFACE
USES
{$ifdef Delphi}
  Wintypes,
  SysUtils,
{$else Delphi}
  {$ifdef Windows}
  Wintypes,
  {$endif Windows}
{$endif Delphi}
  ChfCRC,
  ChfUtils,
  ChfHash,
  ChfTypes;
{$endif aDLL}

 CONST ChiefLZVersionNumber = 3 * 256 + 0; { version 3.00 }

{$ifdef Win32} VAR
{$else}        CONST
{$endif} MyLZMarker : Char = '~'; {last char in filenames created automatically}

{exported INTERFACE functions}
{$ifnDef aDLL}
FUNCTION SetWin16FCreateThunk ( aProc : ThunkFCreateFunc ) : Pointer;
{ point to the Win16 thunking file create function }

FUNCTION SetWin16FNameThunk ( aProc : ThunkFNameFunc ) : Pointer;
{ point to the Win16 thunking long filename function }

FUNCTION SetWin16FReNameThunk ( aProc : ThunkFReNameFunc ) : Pointer;
{ point to the Win16 thunking long filename renaming function }


FUNCTION LZCompress ( CONST aSource, aDest : PChar;
                    LZQuestion : TLZQuestionFunc;
                    aProc      : TLZReportProc;
                    CompMethod : TLZCompressionChoices ) : TLZCount;
{ This Function is used for compression.
  Source     = Source file name
  Dest       = target file name
  LZQuestion = procedural type to ask for overwrite permission
  aProc      = procedural type to return progress information
}


FUNCTION LZDecompress ( aSource, aDest : PChar;
                      LZQuestion : TLZQuestionFunc;
                      aProc      : TLZReportProc ) : TLZCount;
{ This functione is used for decompression.
  Source     = Source file name
  Dest       = target file name
  LZQuestion = procedural type to ask for overwrite permission
  aProc      = procedural type to return progress information
}

FUNCTION IsChiefLZFile ( fName : pChar ) : boolean;
{is this a single LZ file compressed with this unit?}

FUNCTION IsChiefLZFileEx ( fName : pChar; VAR h : TLZHeader ) : boolean;
{ditto - but returns header information in "h"}

FUNCTION GetChiefLZFileInfo (  fName : pChar; VAR Rec : TLZReportRec ) : TLZCount;
{get file details; report the details in "Rec"
 Return value:
   -1 = file not found
   0  = file found - not LZ compressed file; report normal file details
   1  = file found - its LZ compressed file; report file details from LZ header
}

{$ifndef Win32}  {&&& another directoryexists function: to cater for thunking &&& }
FUNCTION DirectoryExists ( CONST s : TLZString ) : Boolean; { &&& }
{$endif Win32}

FUNCTION LZArchive ( 
                   fSpec,
                   ArchName      : pChar;
                   LZRecurseDirs : TLZRecurse;
                   aProc         : TLZReportProc;
                   CompMethod    : TLZCompressionChoices
                    ) : TLZCount;
{
archive all the files matching "fSpec" into archive "ArchName";
RETURNS: the number of files archived, or a negative error code

 fSpec = a file specification (e.g., "*.PAS", or a filename containing a list
 of files to be archived - in which case, use "/F=<listfilename>" as
 the fSpec.
 * LZRecurseDirs = whether to recurse into subdirectories for matching
                   files
 * CompMethod = the type of compression method to use;
      * for maximum compression, use LZMaxCompression

EXAMPLE:
  i := LZArchive
  ('c:\data\*.*', 'c:\temp\mydata.lza', LZNoRecurse, NIL, LZFastCompression);
}

FUNCTION LZArchiveSpan ( 
                   fSpec,
                   ArchName      : pChar;
                   LZRecurseDirs : TLZRecurse;
                   aProc         : TLZReportProc;
                   CompMethod    : TLZCompressionChoices;
                   pSpanInfo     : pLZSpanConfig
                    ) : TLZCount;
{ create a multi-disk spanned LZ archive
RETURNS: the number of files archived, or a negative error code

 * same parameters as LZArchive
 * but supply extra information about the target disk/drive, and about SFX
   in the structure pointed to by pSpanInfo
 * if pSpanInfo is NIL - just create a normal LZ archive
 * when spanning, the archive can only be created in the ROOT directory
   of a drive. Any attempt to create it elsewhere will still result in the
   archive being created in the ROOT directory. !!! NOTE THIS POINT !!!

EXAMPLE:
VAR
Cfg : TLZSpanConfig;
  begin
    With Cfg do begin
         DiskSize := Floppy1440;
         ToSfx    := False;
         Count    := 0;
         StrpCopy ( SfxStub, '' );
         StrpCopy ( SpanName, '' );
    end;
    i := LZArchiveSpan
    ('c:\data\*.*', 'a:\mydata.lza', LZFullRecurse, NIL, LZMaxCompression, @Cfg);
  end;

}


FUNCTION LZDearchive ( 
                     ArchName : PChar;
                     aDefDir  : PChar;
                     LZQuestion : TLZQuestionFunc;
                     aProc :      TLZReportProc;
                     aRename :    TLZRenameFunc;
                     RecurseDirs,
                     ExtractAsCompressed : Boolean
                      ) : TLZCount;
{
De-Arc a ChiefLZ archive, whether spanned across disks or not
 * the same parameters as LZDearchive_, which it serves as a shell to

RETURNS: the number of files extracted from the archive, or a negative error code

EXAMPLE:
  i := LZDearchive('a:\data.lza', 'c:\temp', NIL, NIL, NIL, TRUE, FALSE);
}

FUNCTION LZDearchive_ ( ArchName   : pChar;
                       aDefDir    : PChar;
                       LZQuestion : TLZQuestionFunc;
                       aProc      : TLZReportProc;
                       aRename    : TLZRenameFunc;
                       RecurseDirs,
                       ExtractAsCompressed : Boolean
                     ) : TLZCount;
{
De-Arc a ChiefLZ archive (low level access)
   * should not normally be called directly except where performance
     is critical
   * does not cater for spanned archives
   * ExtractAsCompressed = whether to extract files from archive without
                         decompressing them
                         * this parameter should normally be FALSE
}


FUNCTION IsChiefLZSpannedArchive ( ArchName : pChar ) : TLZCount;
{ is this a multi-disk spanned LZ archive?
  returns;
   < 0 if not an LZ archive
   > 0 if SFX archive
   = 0 if normal LZ archive
   >= ChiefSpanMagicNumber if spanned LZ archive
}

FUNCTION IsChiefLZSpannedArchiveEx ( ArchName : pChar; VAR Hed : TLZArchiveHeader ) : TLZCount;
{  -- ditto -- }

FUNCTION IsChiefLZSpannedHeader ( CONST Header : TLZArchiveHeader ) : Boolean;
{ return whether the header contains correct disk-span information
  representing a multi-disk spanned archive
}

FUNCTION LZArchiveEx ( fSpec, ArchName : PChar;
                       LZRecurseDirs : TLZCount ) : TLZCount;
{shell to LZArchive - no callbacks
 passes NIL for the callback
 LZRecurseDirs;
   0 = LZNORecurse
   1 = LZRecurseOnce
   2 = LZFullRecurse
   any other value = LZNORecurse;
}

FUNCTION LZDearchiveEx ( ArchName, DefDir : PChar ) : TLZCount;
{
shell to LZDearchive - no callbacks; passes NIL for all the callbacks
}

FUNCTION LZListArchive ( ArchName : pChar;
                       pHeader : pLZArchiveHeader; ListFunc : TLZReportProc ) : TLZCount;
{list the contents of an archive -
 - reads the header, and iterates through the records,
   passing each one's details to the callback function: ListFunc
 - the main header details are passed in: pHeader (if it is not NIL)
 - returns the number of file records processed, or an error code if
   the file is not a Chief LZ archive
}

FUNCTION ExtractArchiveCommentFile ( ArchName, DestDir, RetValue : pChar ) : TLZCount;
{
 extracts the comment file from an archive (if there is one) and
 * returns the ID number of the file - otherwise returns an error
   code
 * returns the full name of the extracted file in "RetValue", if "RetValue" <> NIL
 * you must ensure that the buffer pointed to by RetValue has enough space for
   a filename (e.g., 255 character buffer), since no checking is done
}

FUNCTION MarkArchiveCommentFile ( fName : pChar ) : TLZCount;
{ marks a disk file as an LZ archive comment file
  returns the new attribute of the file, or -1 in case of error
}

FUNCTION IsChiefLZArchive ( fName : pChar ) : TLZCount;
{is this an LZ archive which has been archived with this unit?
 returns;
 * the number of files in the archive (i.e., > 0)
 * less than 1 = not Chief LZ Archive
}
FUNCTION IsChiefLZArchiveEx
( fName : pChar; VAR Hed : TLZArchiveHeader ) : TLZCount;
{
same as IsChiefLZArchive, but returns the contents of the main header
in "Hed"
}

FUNCTION HasPassWord ( fName : PChar ) : TLZCount;
{Is the archive password protected?
}

FUNCTION GetChiefLZFileName ( fName, Dest : PChar ) : boolean;
{if LZ file, then return name (in dest, if not Win32) - else return
 fname (in dest, if not Win32) }

FUNCTION GetChiefLZFileSize ( fName : pChar ) : TLZCount;
{if LZ file then return uncompressed size - else
 return actual filesize. On error, Win32 throws exception; Win16 returns -1 }

FUNCTION GetChiefLZArchiveInfo ( ArchName : pChar;
                               VAR Header : TChiefLZArchiveHeader ) : TLZCount;
{ if LZ-Archive then this function returns True, with the header info
  in Header. Otherwise the function returns False }

FUNCTION GetChiefLZArchiveSize ( ArchName : pChar ) : TLZCount;
{ If ArchName is LZArchive, returns sum of uncompressed file-sizes in archive.
  If not LZArchive then returns size of file ArchName }

FUNCTION SetArchiveSetPassWordFunc ( aProc : TLZSetPassWordFunc ) : Pointer;
{specify the callback function that sets the archive password}

FUNCTION SetArchiveCheckPassWordFunc ( aProc : TLZCheckPassWordFunc ) : Pointer;
{specify the callback function that checks the archive password}

FUNCTION SetSpanDiskPromptFunc ( aProc : TLZSpanPromptProc ) : Pointer;
{specify callback function that asks for disks }

PROCEDURE ResetPassWordFlag;
{ reset the internal "password=ok" flag;
  call this each time you finish processing an archive which
  is password-protected;
 }

PROCEDURE FreePassWordFlag ( CONST Code : TLZCount );
{disable password checking temporarily;
 this procedure will call the password checking function "code" as the
 parameter; it is up to you to check the value of "Code" in that function,
 and respond appropriately
}

FUNCTION FileMatch ( aFileSpec, aTheFName : pChar; ArchiveID : TLZCount ) : Boolean;
{$ifdef Win32} STDCALL;{$else Win32}{$ifdef aDLL} EXPORT;{$endif Win32}{$endif aDLL}

{ default file mask/name matching function
does filename:TheFName match the file specification:FileSpec?
}


FUNCTION SetFileMatchFunc ( CONST aProc : TLZFileMatchFunc ) : Pointer;
{
set the function to check filenames for matches
(for LZDearchive, and LZ archive information)
Returns: the old callback;
The default is to use "FileMatch" - but here you can specify another
function
}

FUNCTION GetFileMatchFunc : Pointer;
{return a pointer to the current filematch function }


FUNCTION LocalArchiveHeaderPtr : PChiefLZArchiveHeader;
{ return a pointer to the local internal structure storing the archive
  the returned address is only valid for the duration of LZArchive and
  LZDearchive: when those functions return, it is too late to use the
  address because it will be invalid
}

FUNCTION IsChiefLZSfxArchive ( fName : pChar; VAR Hed : TLZArchiveHeader ) : TLZCount;
{ is this a ChiefLZ Self-Extracting archive?
returns
= 0 = ordinary ChiefLZ archive
< 0 = neither ordinary nor SFX ChiefLZ archive
> 0 = ChiefLZ SFX archive
}

FUNCTION LZSfxArchive ( 
         Stub,
         fSpec,
         ArchName : pChar;
         LZRecurseDirs : TLZRecurse;
         aProc : TLZReportProc;
         CompMethod : TLZCompressionChoices ) : TLZCount;
{create an SFX archive, using the EXE program "stub" as the SFX stub
- parameters: other than "Stub", the parameters are the same as LZArchive
- RETURNS: same value as LZArchive;

EXAMPLE:
  i := LZSfxArchive
  ('c:\lz\lzstub.exe','c:\data\*.*', 'c:\temp\mydata.exe',
  LZNoRecurse, NIL, LZMaxCompression);
}

FUNCTION LZSfxDearchive ( 
         SfxArchiveName, DefDir : pChar;
         LZQuestion             : TLZQuestionFunc;
         aProc                  : TLZReportProc;
         aRename                : TLZRenameFunc;
         RecurseDirs,
         ExtractAsCompressed    : Boolean
          ) : TLZCount;
{dearchive an SFX archive
- parameters: same as LZDeArchive
- RETURNS: same as LZDeArchive
* if the archive "SfxArchiveName" is not an SFX archive, but it is an
  ordinary ChiefLZ archive, it will still be dearchived - so this
  function can be used for all types of ChiefLZ archives
}

FUNCTION LZArchiveFromLZSFXArchive ( SfxArchiveName, ArchName : pChar ) : TLZCount;
{extract the ordinary ChiefLZ archive from a ChiefLZ SFX archive
- returns = the number of bytes extracted - or a negative error code
}


PROCEDURE SetIgnoreExtensions ( IgnoreExtensions : pChar );
{set the list of file extensions to ignore - i.e., store in the archive
without compressing them; this procedure changes the value of the
FIgnoreExtensions variable (below). You would want to add the extensions
of files that are already compressed. By default, the extensions are
set below in the "FIgnoreExtensions" variable

e.g.,
  SetIgnoreExtensions('.PKK|.PAK|.ZIP|.ZOO');
}

FUNCTION GetIgnoreExtensions : pChar;
{get the list of file extensions to ignore - i.e., store in the archive
without compressing them; this function returns the value of the
FIgnoreExtensions variable (below).
}

PROCEDURE SetDecompressMask ( Mask : pChar );
{
set a new mask for the files to extract from archives;
remains operative until changed again;
e.g., SetDecompressMask('*.PAS');

default mask is: "*.*"
}

FUNCTION  GetDecompressMask : pChar;
{
get the current file mask for dearchiving
}

FUNCTION  SetCheckFileCRCs ( ToCheck : Boolean ) : Boolean;
{
set the flag for LZdearchive's checking of file CRCs
 - return the current value
 * note that setting "ToCheck" to TRUE will result in every file
   that is being extracted from an archive going through a CRC check;
   this may result in a loss of speed with large files, thus the CRC
   checking on dearchiving is turned OFF by default
}

FUNCTION  SetArchiveHeaderBegin ( NewOffset : TLZCount ) : TLZCount;
{set the value of the start of the archive header;
 this is normally zero, and should not be changed unless
 special functions are written to handle the changes;
 * if it is ever changed, it must be restored to 0 after use
 - returns: the current offset
 - send a negative value in "NewOffSet" to just obtain the value of the
   current offset without changing it;
 }

PROCEDURE ChiefLZ_Init;
{ initialise this unit/library}

FUNCTION LZCompressEx ( aName : PChar;
                        ReplaceQuestion : TLZQuestionFunc;
                        aProc :           TLZReportProc ) : TLZCount;
{compress the file aName, and use the filename,
 with the last character replaced by a '~' as the output file
 If target file exists, and autoreplace=false then the
 function exits and returns -100 else the target file
 will be overwritten
}

FUNCTION LZDecompressEx ( aName : PChar;
                        ReplaceQuestion : TLZQuestionFunc;
                        aProc :           TLZReportProc ) : TLZCount;
{decompress the file aName, obtaining the output name from
the header automatically
If target file exists, and autoreplace=false then the
function exits and returns -100 else the target file
will be overwritten
}


{$endif aDLL}

{////////////////////////////////////////////////////}

{$ifNDef aDLL}
IMPLEMENTATION

USES
   LHSix,
{$ifdef Win32}
  LZSS32, Windows, LZ_Const
{$else Win32}
  LZSS16,           { All 16-bit code }
{$ifdef Windows}
  WinProcs          { Win16 }
{$ifndef Delphi}
 , WinDos, Strings   { TPW / BPW }
{$endif Delphi}
{$else Windows}
  Dos, Strings      { TP / BP }
{$endif Windows}
{$endif Win32};

{$else aDLL}
FUNCTION IsChiefLZSpannedHeader ( CONST Header : TLZArchiveHeader ) : Boolean;
{$ifdef Win32} STDCALL{$else Win32}EXPORT{$endif Win32};FORWARD;

FUNCTION LZDearchive ( 
                     ArchName : PChar;
                     aDefDir  : PChar;
                     LZQuestion : TLZQuestionFunc;
                     aProc :      TLZReportProc;
                     aRename :    TLZRenameFunc;
                     RecurseDirs,
                     ExtractAsCompressed : Boolean
                      ) : TLZCount;
{$ifdef Win32} STDCALL{$else Win32}  EXPORT{$endif Win32};FORWARD;

{$endif aDLL}

{$ifdef Win32}
{
  These constants taken from SysUtils.inc ...
}
CONST SInOutError   = 65416;
CONST SFileNotFound = 65417;
CONST SEndOfFile    = 65421;
{$endif Win32}

CONST ChiefLZSig = 'aChiefM#';
CONST NulFileDate = 2162688;   { 01/01/1980 12:00a }

{////////////////////////////////////////////////////}

{ file extensions to be stored and not compressed }
{$ifdef Win32}VAR{$else}CONST {$endif}
FIgnoreExtensions : TLZString  =
'.ZIP|.PKK|.ZPA|.GIF|.CAB|.GZ|.LZH|.LZA|.LZZ|.LZ|.PAK|.ZOO|.Z|.ARC|.ARJ|.AR7' + #0;



TYPE
pLZBigFileRec = ^TLZBigFileRec;
TLZBigFileRec = PACKED RECORD
{is it a directory}
       IsBigDir : Boolean;
{its directory ID}
       BigDirID : Word;
{its parent directory ID}
       BigParentDir : Word;
{is it compressed?}
       BigCompressed : Boolean;
{any version information?}
       BigFileVersion : TLZVerStr;
{compressed sizes}
       BigSizes  : TLZCount;
{uncompressed sizes}
       uBigSizes : TLZCount;
{date/time stamps}
       BigTimes  : TLZCount;
{file names}
       BigNames  : pLZString;
{file attributes}
       BigfAttrs : {$ifdef Win32}TLZCount{$else}Byte{$endif};
{32-bit CRC}
       BigCRCs   : TLZCount;
{ 32-bit ID }
       BigFileID : {$ifdef Win32}TLZCount{$else}Word{$endif};
{ compression type}
       BigCompressedType : Byte;
END;

PLZArchiveFiles = ^TLZArchiveFiles;
TLZArchiveFiles = ARRAY [ 1..MaxChiefLZArchiveSize ] OF pLZBigFileRec;

CONST
CopyBufSize =
{$ifdef Win32}128000{$else Win32}{$ifdef MSDOS}16384{$else}64000{$endif MSDOS}{$endif Win32};

TYPE
PBufType = ^TBufType;
TBufType = ARRAY [ 1..CopyBufSize ] OF byte;

{////////////////////////////////////////////////////}

TYPE  {don't want to use collections or StringLists because of other versions of TPascal}
PLZDirArray = ^TLZDirArray;
TLZDirArray = ARRAY [ 0..MaxChiefLZDirectories ] OF {$ifdef Win32} PLZString
                                                 {$else Win32}  PLZString
                                                 {$endif Win32};

{////////////////////////////////////////////////////}

CONST
LZCode_Archiving = 0;

VAR
ArchiveStartOffSet : TLZCount;
PrestoChangoMagic : TLZCount;

VAR
SetPassWordFunc   : TLZSetPassWordFunc;
CheckPassWordFunc : TLZCheckPassWordFunc;
FileMatchFunc     : TLZFileMatchFunc;

VAR
CheckFileCRCs :  Boolean;
buf : PBufType;
jR  : PLZArchiveFiles;
jR2 : PChiefLZArchiveHeader;
fDecompressMask : TLZString;
ReadThunkFunc   : ThunkFNameFunc;
WriteThunkFunc  : ThunkFCreateFunc;
RenameThunkFunc : ThunkFReNameFunc;

VAR
BlankRec : TLZReportRec {$ifdef Win32} = (  ) {$endif Win32};
PWordRec : TLZReserved  {$ifdef Win32} = (  ) {$endif Win32};
{/////////////////////////////////////////////////////////}
VAR aRead, aWrite : TLZCount;
{
  This global variable ensures that MyReadProc() calls LZReportProc()
  only during compression, and that MyWriteProc() calls LZReportProc()
  only during decompression. This is done by setting Decompressing
  to the appropriate value immediately before calling LZEncode() or
  LZDecode().
}
VAR
LZReportProc : TLZReportProc {$ifdef Win32} = NIL {$endif Win32};
LZSpanPromptProc : TLZSpanPromptProc;

Decompressing : Boolean;
LZInFile, LZOutFile : file;

{ try to thunk to return a longname }
FUNCTION Win16FThunker ( CONST s : TLZString; ToShortName : Boolean ) : TLZString;
{$ifndef Win32}
VAR
s1 : TLZString;
{$endif Win32}
BEGIN
  {$ifdef Win32}
      Result := s; { no thunking under Win32 - just return the filename }
  {$else Win32}
      IF ( @ReadThunkFunc = NIL ) THEN s1 := s  { no thunking }
      ELSE BEGIN
         s1 := ReadThunkFunc ( s, ToShortName );
         IF ExtractFileDir ( s ) = ''  { no path supplied in filename }
           THEN s1 := ExtractFileName ( s1 ); { so just return the filename part }
      END;
      Win16FThunker := s1;
   {$endif Win32}
END;
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{ /// new functions to allow for thunking: 16-bit only ///}
{$ifndef Win32}
FUNCTION DirectoryExists ( CONST s : TLZString ) : Boolean; { &&& }
BEGIN
   DirectoryExists := ChfUtils.DirectoryExists ( Win16FThunker ( s, True ) );
END;

FUNCTION FileExists ( CONST s : TLZString ) : Boolean; { &&& }
BEGIN
   FileExists := {$ifndef Delphi}ChfUtils.{$endif}FileExists ( Win16FThunker ( s, True ) );
END;

FUNCTION FSize ( CONST S : TLZString ) : TLZCount;
BEGIN
   FSize := ChfUtils.FSize ( Win16FThunker ( s, True ) );
END;

FUNCTION sFTime ( CONST s : TLZstring ) : TLZCount;
BEGIN
   sFTime := ChfUtils.sFTime ( Win16FThunker ( s, True ) );
END;
{$endif Win32}
{///////////// thunk overrides end ///////////////////////}
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{//////////// helper routines ////////////////////////////}
{/////////////////////////////////////////////////////////}
FUNCTION DeleteaFile ( s : TLZString ) : Boolean;
VAR
f : file;
BEGIN
   s := Win16FThunker ( s, True ); { &&& }
   DeleteaFile := False;
   IF NOT FileExists ( s ) THEN Exit;
   FileSetAttr ( s, faArchive );
   {$i-}
   Assign ( f, s );
   Erase ( f );
   {$ifdef Win32}{$i+}{$endif Win32}
   DeleteaFile := IoResult = 0;
END;
{/////////////////////////////////////////////////////////}
FUNCTION RenameaFile ( CONST Oldf : TLZString; CONST  Newf : TLZString ) : Boolean;
VAR
f : file;
BEGIN
   IF @RenameThunkFunc <> NIL THEN RenameaFile := RenameThunkFunc ( OldF, NewF )
   ELSE BEGIN
     RenameaFile := False;
     IF NOT FileExists ( Oldf ) THEN Exit;
     {$i-}
     Assign ( f, Oldf );
     Rename ( f, Newf );
     {$ifdef Win32}{$i+}{$endif Win32}
     RenameaFile := IoResult = 0;
   END;
END;
{/////////////////////////////////////////////////////////}
PROCEDURE DummifyHeaderReserved ( VAR Res : TLZReserved );
BEGIN
   {fill with dummy values; manipulate these at your leisure}
   WITH Res DO BEGIN
        MagicN [3] := - 100;
        MagicN [4] := - 400;
        MagicN [5] := - 500;
        MagicN [6] := - 800;
        MagicN [7] := - 900;
        MagicR     := #255#14#16#34#70#68#54#22#66#14#128#135;
   END;
END;
{/////////////////////////////////////////////////////////}
FUNCTION HasPassWordEx ( CONST Header : TLZArchiveHeader ) : Boolean;
BEGIN
    WITH Header.Reserved DO BEGIN
         HasPassWordEx := N_OffSet <> 0;
    END;
END;
{/////////////////////////////////////////////////////////}
FUNCTION HeaderReservedMatches ( CONST This, That : TLZReserved ) : Boolean;
BEGIN
    HeaderReservedMatches := True;
    IF This.N_OffSet = 0 {there is no password}
    THEN Exit;

    HeaderReservedMatches :=
    ( This.N_Code = That.N_Code ) AND
    ( This.S_OffSet = That.S_OffSet ) AND
    ( This.N_OffSet = That.N_OffSet ) AND
    ( This.MagicN [3] = That.MagicN [3] ) AND
    ( This.MagicN [4] = That.MagicN [4] ) AND
    ( This.MagicN [5] = That.MagicN [5] ) AND
    ( This.MagicN [6] = That.MagicN [6] ) AND
    ( This.MagicN [7] = That.MagicN [7] ) AND
    ( This.S_Code     = That.S_Code )    AND
    ( This.MagicR [0] = That.MagicR [0] ) AND
    ( This.MagicR [1] = That.MagicR [1] );
END;
{/////////////////////////////////////////////////////////}
FUNCTION SafePassWord ( CONST Header : TLZArchiveHeader ) : Boolean;
VAR
b : boolean;
i : TLZCount;
BEGIN
    SafePassWord := True;
    IF Not HasPassWordEx ( Header ) THEN Exit;
    IF HeaderReservedMatches ( Header.Reserved, pWordRec ) THEN Exit;
    SafePassWord := False;
    IF Not Assigned ( CheckPassWordFunc ) THEN Exit;
    i := CheckPassWordFunc ( Header, 0 );
    b := ( i = LZCode_NoPassWord ) OR ( i = LZCode_CorrectPassWord );
    IF b THEN PrestoChangoMagic := i;
    SafePassWord := b;
END;
{/////////////////////////////////////////////////////////}
{allocate memory for archive files array}
PROCEDURE SetupArchiveFiles ( VAR p : PLZArchiveFiles; Count : TLZCount );
VAR
i : TLZCount;
BEGIN
   New ( p );
   IF Count > MaxChiefLZArchiveSize THEN Count := MaxChiefLZArchiveSize;
   FOR i := 1 TO Count
   DO BEGIN
      New ( p^ [i] );
      WITH p^ [i]^ DO BEGIN
           BigNames := NIL;
           BigFileVersion [0] := #0;
      END;
   END;
END;
{/////////////////////////////////////////////////////////}
{free memory used for archive files array}
PROCEDURE FreeupArchiveFiles ( VAR p : PLZArchiveFiles; Count : TLZCount );
VAR
i : TLZCount;
BEGIN
   IF Count > MaxChiefLZArchiveSize THEN Count := MaxChiefLZArchiveSize;
   FOR i := Count DOWNTO 1
   DO BEGIN
       {$ifdef Delphi}TRY{$endif}
       DisposeString ( p^ [i]^.BigNames );
       Dispose ( p^ [i] );
       p^ [i] := NIL;
       {$ifdef Delphi}EXCEPT END;{$endif}
   END;
   {$ifdef Delphi}TRY{$endif}
   Dispose ( p );
   p := NIL;
   {$ifdef Delphi}EXCEPT END;{$endif}
END;
{/////////////////////////////////////////////////////////}
PROCEDURE ResetPassWordFlag;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
BEGIN
   PrestoChangoMagic := - 1;
END;
{////////////////////////////////////////////////}
{////////////////////////////////////////////////}
{////////////////////////////////////////////////}
VAR
CurrentCompType : integer;  { internal flag for type of compression being used }
{other versions of these routines here, in case we want to do some
internal cleaning up, and for compatibility}
FUNCTION IsLZInitialized : boolean;
VAR
b : Boolean;
BEGIN
   b := False;
   CASE CurrentCompType OF
      Ord ( LZMaxCompression ) : b := IsLH6Initialized;
      Ord ( LZFastCompression ) : b :=
                        {$ifdef Win32}
                        LZSS32.IsLZInitialized;
                        {$else Win32}
                        LZSS16.IsLZInitialized;
                        {$endif Win32}
      Ord ( LZNoCompression ) : b := True;
   END; {case}
   IsLZInitialized := b;
END;

FUNCTION LZInit ( CompMethod : TLZCompressionChoices ) : boolean;
VAR
b : Boolean;
BEGIN
   b := False;
   CurrentCompType := Ord ( CompMethod );
   CASE CurrentCompType OF
      Ord ( LZMaxCompression ) : b := LHSix.LZInit;
      Ord ( LZFastCompression ) : b := {$ifdef Win32}LZSS32.LZInit{$else Win32}LZSS16.LZInit{$endif Win32};
      Ord ( LZNoCompression ) : b := True;
   END; {case}
   LZInit := b;
END;

{/////////////////////////////////////////////////////////}
PROCEDURE LZDone;
BEGIN
   CASE CurrentCompType OF
      Ord ( LZMaxCompression ) : LHSix.LZDone;
      Ord ( LZFastCompression ) : {$ifdef Win32}LZSS32.LZDone;{$else Win32}LZSS16.LZDone;{$endif Win32}
      Ord ( LZNoCompression ) : ;
   END; {case}
   CurrentCompType := - 1;
   ResetPassWordFlag;
END;
{////////////////////////////////////////////////}
{////////////////////////////////////////////////}
{////////////////////////////////////////////////}

{$ifdef Win32}
{
  These are Win32-specific functions that cannot be moved into the more
  general ChfUtils due to their dependence on types defined in ChfTypes
}
FUNCTION GetTempChiefFileName : TLZstring;
VAR
  RetBuf : PChar;
BEGIN
  GetMem ( RetBuf, MAX_PATH );
  TRY
    IF ( GetTempPath ( MAX_PATH, RetBuf ) = 0 ) OR
       ( GetTempFileName ( RetBuf, 'CHF', 0, RetBuf ) = 0 ) THEN
      RaiseError ( EChiefLZError, SNoTempFileName );
    SetString ( Result, RetBuf, StrLen ( RetBuf ) )
  FINALLY
    FreeMem ( RetBuf, MAX_PATH )
  END
END;

FUNCTION GetFoundFileName ( CONST Dir : TLZString; CONST Search : TSearchRec ) : TLZstring;
BEGIN
  Result := Search.Name
END;

{$else Win32}

FUNCTION GetTempChiefFileName ( CONST FName : PChar ) : boolean; ASSEMBLER;
ASM
{
  Create a temporary file- FName must specify a path + '\', with enough
  room afterwards to append 12 characters.
}
  PUSH DS
  LDS DX, FName
  MOV AH, $5A
  MOV CX, faArchive
{$ifdef Windows}
  CALL DOS3Call
{$else Windows}
  INT $21
{$endif Windows}
  POP DS
  JC @Fail
{
  The file handle refers to an OPEN file; close it so we can open it
  the Pascal way ...
}
  MOV BX, AX
  MOV AH, $3E
{$ifdef Windows}
  CALL DOS3Call
{$else Windows}
  INT $21
{$endif Windows}
{
  Return True if successful, False otherwise ...
}
@Fail :
{$ifdef Delphi}
  DB $0F, $93, $C0  (* setnc al *)
{$else Delphi}
  MOV AL, FALSE
  JC @END
  INC AX
@END :
{$endif Delphi}
END;

{$endif Win32}

{/////////////////////////////////////////////////////////}
{///// is this an LZ compressed file using this unit? ////}
FUNCTION IsMyLZFile ( VAR InFile : file; VAR f : TLZHeader ) : boolean;
VAR
  OldPos  :  TLZCount;
  NumRead : Integer;
  b       : boolean;
BEGIN
  FillChar ( f, Sizeof ( f ), #0 );
  OldPos := FilePos ( InFile );
  Seek ( InFile, 0 );
  BlockRead ( InFile, f, SizeOf ( f ), NumRead );
  b  := ( NumRead = SizeOf ( f ) )
    AND ( Length ( f.FName ) <> 0 )
    AND ( f.Signature = ChiefLZSig );
  IsMyLZFile := b;
  Seek ( InFile, OldPos );
END;

{/////////////////////////////////////////////////////////}
{////: normal file copy if not LZ file}
CONST LZ_UNKNOWN_LENGTH = LZCode_GeneralErrorCode;

TYPE TReporting = ( doNoReport, doReportOnRead, doReportOnWrite );

FUNCTION MyFCopy ( VAR InFile, OutFile : file;
                   CONST CopyLength : TLZCount;
                   CONST doReport :   TReporting ) : TLZCount;
{$ifndef Win32} FAR; {$endif}
VAR
p : PBufType;
{
  Turn the enumerated type doReport into a Boolean:
    doReportOnRead  -> False
    doReportOnWrite -> True

  Decompression routines will call MyFCopy() using doReportOnWrite,
  whereas Compression routines will call using doReportOnRead
}
VAR
ReportingOnWrite : TReporting;

NumRead, BRead : TLZSSWord;
{$ifndef Win32}
NumWrit : TLZSSword;
{$endif}

{$ifndef Delphi}
Result : TLZCount;
{$endif}

BEGIN
    ReportingOnWrite := doReport;
{$IFDEF Debug}
   IF CopyLength < LZ_UNKNOWN_LENGTH THEN
   {$ifdef Win32}
     RAISE EChiefLZDebug.Create ( 'Negative copy-length passed to MyFCopy' )
       at AddrOfCaller
   {$else Win32}
     RunErrorMessageAt ( 'Negative copy-length passed to MyFCopy',
                        AddrOfCaller )
   {$endif Win32};
{$ENDIF}
   Result := 0;
   New ( p );
 {$ifdef Win32}
   TRY {finally}
 {$else Win32}
   IF p = NIL THEN
     BEGIN
     {$ifndef Delphi}
       MyFCopy := 0;
     {$endif}
       Exit  { ERROR !!! Failed Memory Allocation! }
     END;
 {$endif Win32}

   REPEAT
     IF CopyLength <> LZ_UNKNOWN_LENGTH THEN
       BRead := Min ( CopyLength - Result, SizeOf ( p^ ) )
     ELSE
       BRead := SizeOf ( p^ );
     BlockRead ( InFile, p^, BRead, NumRead );

     {compressing - return number of bytes read}
     IF ( Assigned ( LZReportProc ) ) AND
     ( ReportingOnWrite = doReportOnRead ) THEN
       LZReportProc ( BlankRec, NumRead );
{
  If CopyLength <> LZ_UNKNOWN_LENGTH, we know how many bytes we EXPECT
  to be able to read from this file. If BRead <> NumRead, then the
  file must be corrupt ...
}
   {$ifdef Win32}
     IF ( CopyLength <> LZ_UNKNOWN_LENGTH ) AND ( BRead <> NumRead ) THEN
       RaiseIOError ( SEndOfFile, 100 ); { Will exit via `finally...end' }
   {$endif}
{
  This is the EOF condition for when we DON'T know how long the copy is ...
}
     IF NumRead = 0 THEN
       break;
{
  Without the NumWrit parameter, BlockWrite will cause an IO-Error if the disc
  doesn't have room for SizeOf(p) bytes. This is good in Win32, as an exception
  will then be raised.
}
     BlockWrite ( OutFile, p^, NumRead {$ifndef Win32}, NumWrit {$endif} );
{
  If Win32 version gets this far, then all NumRead chars must have
  been written ...
}
     inc ( Result, {$ifdef Win32} NumRead {$else} NumWrit {$endif} );

     {de-compressing - return number of bytes written}
     IF ( Assigned ( LZReportProc ) ) AND
     ( ReportingOnWrite = doReportonWrite ) THEN
       LZReportProc ( BlankRec, {$ifdef Win32} NumRead {$else} NumWrit {$endif} )

   UNTIL {$ifndef Win32} ( NumWrit <> NumRead ) OR {$endif}
         ( ( CopyLength <> LZ_UNKNOWN_LENGTH ) AND
           ( Result >= CopyLength ) );
 {$ifndef Delphi}
   MyFCopy := Result;
 {$endif}
 {$ifdef Win32}
   FINALLY
 {$endif}
     Dispose ( p );
 {$ifdef Win32}
   END;
 {$endif}
END;

{/////////////////////////////////////////////////////////}
FUNCTION MyReadProc ( VAR ReadBuf ) : TLZSSWord; {$ifndef Win32} FAR; {$endif}
{to read from files}
{$ifndef Delphi}
VAR
  Result : TLZSSWord;
{$endif}

BEGIN
  BlockRead ( LZInFile, ReadBuf, LZRWBufSize, Result );
  Inc ( aRead, Result );

 {compressing - return bytes read}
  IF ( Assigned ( LZReportProc ) ) AND ( NOT Decompressing ) THEN
    LZReportProc ( BlankRec, Result );

{$ifndef Delphi}
  MyReadProc := Result
{$endif}
END; { MyReadProc }

{/////////////////////////////////////////////////////////}
FUNCTION MyWriteProc ( VAR WriteBuf; Count : TLZSSWord ) : TLZSSWord;
{$ifndef Win32} FAR; {$endif Win32}
{$ifndef Delphi}
VAR
  Result : TLZSSWord;
{$endif}
{to write to files}
BEGIN
  BlockWrite ( LZOutFile, WriteBuf, Count, Result );
  Inc ( aWrite, Result );

 {de-compressing - return bytes written}
  IF ( Assigned ( LZReportProc ) ) AND ( Decompressing ) THEN
    LZReportProc ( BlankRec, Result );

{$ifndef Delphi}
  MyWriteProc := Result
{$endif}
END; { MyWriteProc }

FUNCTION LH6ReadCallBack ( CONST Count : Longint; Decompressing : Boolean ) : Longint;
{ callback for LZSix compression }
BEGIN
   LH6ReadCallBack := Count;
   Inc ( aRead, Count );
   {compressing - return bytes read}
  IF ( Assigned ( LZReportProc ) ) AND ( NOT Decompressing ) THEN
    LZReportProc ( BlankRec, Count );
END;

FUNCTION LH6WriteCallBack ( CONST Count : Longint; Decompressing : Boolean ) : Longint;
{ callback for LZSix decompression }
BEGIN
   LH6WriteCallBack := Count;
   Inc ( aWrite, Count );
   {de-compressing - return bytes written}
   IF ( Assigned ( LZReportProc ) ) AND ( Decompressing ) THEN
    LZReportProc ( BlankRec, Count );
END;


{/////////////////////////////////////////////////////////}
FUNCTION GetDirIndex ( aDir : TLZPathStr; CONST DirList : PLZDirArray;
                                       CONST Max : TLZSSWord ) : TLZCount;
{find the index of a directory within an array}
VAR
  i : TLZSSWord;
BEGIN
{$ifndef Win32}
  aDir := UpperCase ( aDir );
{$endif Win32}
  FOR i := 0 TO Max DO
    IF {$ifdef Win32} AnsiCompareText ( aDir, DirList^ [ i ]^ ) = 0
       {$else Win32}  aDir = DirList^ [ i ]^
       {$endif Win32} THEN
      BEGIN
        GetDirIndex := i;
        Exit
      END;
  GetDirIndex := LZCode_GeneralErrorCode
END;

{/////////////////////////////////////////////////////////}
FUNCTION CreatePath ( Path : TLZPathStr ) : Integer;
{Iteratively create a directory path}
VAR
  i      : Integer;
  NewDir : TLZString;
{$ifndef Delphi}
{$ifdef Windows}
  P :  ARRAY [ 0..128 ] OF Char;
{$endif Windows}
  Result : Integer;
{$endif Delphi}
BEGIN
 IF ( @WriteThunkFunc = Nil )
 THEN BEGIN
{$ifdef Delphi}
     Path := ExpandFileName ( Path );
{$else Delphi}
  {$ifdef Windows}
     FileExpand ( P, Str2PChar ( Path ) );
     Path := StrPas ( p );
  {$else Windows}
     Path := FExpand ( Path );
  {$endif Windows}
{$endif Delphi}
 END;{IF}

 i := 3;
 Result := 0;
 REPEAT
    REPEAT
      Inc ( i )
    UNTIL ( i > Length ( Path ) ) OR ( Path [ i ] = '\' );

    NewDir := Copy ( Path, 1, Pred ( i ) );
    IF NOT DirectoryExists ( NewDir )
    THEN BEGIN
        {$ifndef Win32}
        IF ( @WriteThunkFunc <> Nil ) THEN WriteThunkFunc ( NewDir, True );
        IF not DirectoryExists ( NewDir ) THEN
        {$endif Win32}
        {$i-}MkDir ( NewDir );{$ifdef Win32}{$i+}{$endif}
        IF IOResult <> 0
        THEN BEGIN
            CreatePath := LZCode_GeneralErrorCode;
            Exit
        END;
        Inc ( Result )
      END
  UNTIL i > Length ( Path );
{$ifndef Delphi}
  CreatePath := Result;
{$endif}
END;
{/////////////////////////////////////////////////////////}
FUNCTION GetFileVersion ( {$ifdef Win32} CONST
                        {$endif} fName : TLZString ) : TLZVerStr;
{$ifndef DPMI}
{$ifdef TPW}
VAR
Result : TLZVerStr;
{$endif TPW}
{$endif DPMI}
BEGIN
  {$ifdef DPMI}
    GetFileVersion := '0'
  {$else DPMI}
  {$ifdef Windows}
  {$ifdef Win32}
    Result := FileVersionInfo ( fName, 'FileVersion' );
  {$else Win32}
    Result := FileVersionInfo ( Str2PChar ( fName ), 'FileVersion' );
  {$endif Win32}
    IF Length ( Result ) = 0 THEN
      GetFileVersion := '0'
  {$ifndef Delphi}
    ELSE
      GetFileVersion := Result
  {$endif Delphi}
  {$else Windows}
    GetFileVersion := '0'
  {$endif Windows}
  {$endif DPMI}
END;

{/////////////////////////////////////////////////////////}
FUNCTION GetLZMarkedName ( CONST FName : TLZstring ) : TLZstring;
VAR
  i :   Integer;
  Ext : TLZExtStr;
BEGIN
  Ext := ExtractFileExt ( FName );
  i := Length ( Ext );
  IF i < 2 THEN             { Ext is either '' or '.' }
    Ext := '.' + MyLZMarker
  ELSE
    Ext [ i ] := MyLZMarker;
  GetLZMarkedName := ChangeFileExt ( FName, Ext )
END;

{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
FUNCTION HasPassWord ( fName : PChar ) : TLZCount;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
VAR
f       : file;
NumRead : TLZSSWord;
OldFMode : byte;
b       : boolean;
Hed     : TLZArchiveHeader;

BEGIN
     HasPassWord := LZCode_GeneralErrorCode;
     FillChar ( Hed, Sizeof ( Hed ), #0 );
     IF ( StrLen ( FName ) = 0 ) OR ( NOT FileExists ( StrPas ( FName  ) ) )
     THEN Exit;
     HasPassWord := LZCode_NotLZArchive;
     OldFMode := FileMode;
     Assign ( f, StrPas ( fName ) );
     FileMode := fmOpenRead {$ifndef Ver90}OR fmShareDenyWrite{$endif Ver90};
     {$i-} Reset ( f, 1 ); {$ifdef Win32}{$i+}{$endif Win32}
     FileMode := OldFMode;
     IF IOResult = 0
     THEN BEGIN
        IF ArchiveStartOffSet <> 0
        THEN BEGIN
           {$i-}Seek ( f, ArchiveStartOffSet );{$ifdef Win32}{$i+}{$endif Win32}
           IF IoResult <> 0 THEN BEGIN
              Close ( f );
              Exit;
           END;
        END;
        BlockRead ( f, Hed, SizeOf ( Hed ), NumRead );
        Close ( f );
        b := ( NumRead = SizeOf ( Hed ) ) AND
                            ( Hed.Signature = MyLZSignature ) AND
                            ( Hed.Count > 0 );
        IF b THEN BEGIN
            IF CheckHeaderPassWord ( '', Hed ) = LZCode_NoPassWord
              THEN HasPassWord := 0 ELSE HasPassWord := 1;
        END;  { if b }
      END { if ioresult }
       ELSE HasPassWord := LZCode_AccessDenied;
END;
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
FUNCTION IsChiefLZArchiveEx
( fName : pChar; VAR Hed : TLZArchiveHeader ) : TLZCount;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
VAR
f       : file;
NumRead : TLZSSWord;
OldFMode : byte;
b       : boolean;
i       : TLZCount;
BEGIN
     IsChiefLZArchiveEx := LZCode_GeneralErrorCode;
     FillChar ( Hed, Sizeof ( Hed ), #0 );
     IF ( StrLen ( FName ) = 0 ) OR ( NOT FileExists ( StrPas ( FName  ) ) )
     THEN Exit;

     IsChiefLZArchiveEx := LZCode_NotLZArchive;
     OldFMode := FileMode;
     Assign ( f, Win16FThunker ( StrPas ( fName ), True ) );
     FileMode := fmOpenRead {$ifndef Ver90}OR fmShareDenyWrite{$endif Ver90};
     {$i-} Reset ( f, 1 ); {$ifdef Win32}{$i+}{$endif Win32}
     FileMode := OldFMode;
     IF IOResult = 0
     THEN BEGIN
        IF ArchiveStartOffSet <> 0 THEN BEGIN
           {$i-}Seek ( f, ArchiveStartOffSet );{$ifdef Win32}{$i+}{$endif Win32}
           IF IoResult <> 0 THEN BEGIN
              Close ( f );
              Exit;
           END;
        END;
        BlockRead ( f, Hed, SizeOf ( Hed ), NumRead );
        Close ( f );
        b := ( NumRead = SizeOf ( Hed ) ) AND
                            ( Hed.Signature = MyLZSignature ) AND
                            ( Hed.Count > 0 );

        IF b
        THEN BEGIN
          IF Hed.Reserved.N_OffSet <> 0 {there is a password}
          THEN BEGIN
             PWordRec := Hed.Reserved;
             IF ( PrestoChangoMagic = - 1 )
             THEN BEGIN
               IsChiefLZArchiveEx := LZCode_WrongPassWord;
               IF NOT Assigned ( CheckPassWordFunc ) THEN EXIT;
               i := CheckPassWordFunc ( Hed, 0 );
               b := ( i = LZCode_NoPassWord ) OR ( i = LZCode_CorrectPassWord );
               IF b THEN PrestoChangoMagic := i;
            END;
           END;
        END; {if b}

        IF b THEN IsChiefLZArchiveEx := Hed.Count;
      END ELSE IsChiefLZArchiveEx := LZCode_AccessDenied;
END;
{/////////////////////////////////////////////////////////}
FUNCTION IsChiefLZArchive ( fName : pChar ) : TLZCount;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
VAR
Hed : TLZArchiveHeader;
BEGIN
   IsChiefLZArchive := IsChiefLZArchiveEx ( FName, Hed );
END;
{/////////////////////////////////////////////////////////}
FUNCTION IsChiefLZFileEx ( fName : PChar; VAR h : TLZHeader ) : boolean;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
VAR
f : file;
OldFMode : byte;
s : TLZString;

BEGIN
  IsChiefLZFileEx := FALSE;
  FillChar ( h, Sizeof ( h ), #0 );
  s := Win16FThunker ( StrPas ( FName ), True );
  IF ( Length ( s ) = 0 ) OR ( NOT FileExists ( s ) ) THEN Exit;
  Assign ( f, s );
  OldFMode := FileMode;
  FileMode := fmOpenRead {$ifndef Ver90}OR fmShareDenyWrite{$endif Ver90}; { Delphi2 only allows 0 <= FileMode <= 2 }
  {$i-}Reset ( f, 1 );{$ifdef Win32}{$i+}{$endif Win32}
  FileMode := OldFMode;
  IF IOResult = 0
  THEN BEGIN
     IsChiefLZFileEx := IsMyLZFile ( f, h );
     Close ( f );
  END;
END;
{/////////////////////////////////////////////////////////}
FUNCTION IsChiefLZFile ( fName : PChar ) : boolean;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
VAR
h : TLZHeader;
BEGIN
  IsChiefLZFile := IsChiefLZFileEx ( fName, h );
END;
{/////////////////////////////////////////////////////////}
FUNCTION GetChiefLZFileName ( fName, Dest : PChar ) : boolean;
{$ifdef aDLL} {$ifdef Win32} STDCALL;{$else}EXPORT; {$endif Win32}{$endif aDLL}
VAR
h : TLZHeader;
b : Boolean;
BEGIN
     b := IsChiefLZFileEx ( FName, h );
     GetChiefLZFileName := b;
     Strcopy ( Dest, fName );
     IF b THEN Strpcopy ( Dest, h.fName );
END;
{/////////////////////////////////////////////////////////}
FUNCTION GetChiefLZFileSize ( fName : PChar ) : TLZCount;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
VAR
h : TLZHeader;
b : Boolean;
BEGIN
    b := IsChiefLZFileEx ( FName, h );
    IF b
    THEN GetChiefLZFileSize := h.uSize
    ELSE GetChiefLZFileSize := FSize ( StrPas ( FName ) );
END;
{/////////////////////////////////////////////////////////}
FUNCTION GetChiefLZFileInfo (  fName : PChar; VAR Rec : TLZReportRec ) : TLZCount;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
VAR
h : TLZHeader;
b : boolean;
Source : TLZString;
BEGIN
   GetChiefLZFileInfo := LZCode_ArchiveNotFound;  {non-existent file}
   FillChar ( Rec, Sizeof ( Rec ), #0 );
   Source := Strpas ( FName );
   {$ifndef Win32}
   Source := Win16FThunker ( Source, True );
   {$endif Win32}
   IF ( Source = '' ) OR ( NOT FileExists ( Source ) ) THEN Exit;
   b := IsChiefLZFileEx ( Str2pChar ( Source ), h );
   GetChiefLZFileInfo := Ord ( b ); {0=not LZ file; 1= LZ file}
   IF b THEN
   WITH Rec, h DO BEGIN
        IsDir  := False;
        Names  := h.fName;
        Sizes  := cSize;
        uSizes := uSize;
        Times  := fTime;
        fAttrs := fAttr;
        CRCs   := CRC;
        FileVersion := Version;
        Rec.FileIDs := h.ID;
        Rec.CompressedTypes := h.CompType;
   END
   ELSE
   WITH Rec DO BEGIN
        IsDir  := False;
        Names  := Source;
        Sizes  := fSize ( Source );
        uSizes := Sizes;
        Times  := sfTime ( Source );
        fAttrs := FileGetAttr ( Source );
        CRCs   := GetFileCRC ( Source );
        FileVersion := GetFileVersion ( Source );
        Rec.FileIDs := 0;
        Rec.CompressedTypes := Ord ( LZUnknown );
   END;
END;
{/////////////////////////////////////////////////////////}
FUNCTION GetChiefLZArchiveInfo ( ArchName : PChar;
                               VAR   Header : TChiefLZArchiveHeader ) : TLZCount;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
VAR
  f        : file;
  OldFMode : byte;
  j        : TLZCount;

BEGIN
  OldFMode := FileMode;
  WITH Header
  DO BEGIN
   {$i-}
    GetChiefLZArchiveInfo := LZCode_GeneralErrorCode;
    IF IsChiefLZArchiveEx ( ArchName, MainHeader ) > 0
    THEN BEGIN

        WITH Mainheader.Reserved
        DO BEGIN
           j := S_OffSet;
        END;

        Assign ( f, Win16FThunker ( StrPas ( ArchName ), True ) );
        FileMode := ( fmOpenRead {$ifndef Ver90}OR fmShareDenyWrite{$endif Ver90} );
        Reset ( f, 1 );
        FileMode := OldFMode;
        IF IOResult = 0 THEN
        BEGIN
            Seek ( f, j + SizeOf ( MainHeader ) );  {seek the end of the main header block}
            IF IOResult = 0
            THEN BEGIN
               Count := MainHeader.Count;
               GetChiefLZArchiveInfo := ReadFileHeaders ( f, Header, MainHeader );
            END;
            Close ( f );
        END {Ioresult}
      END; {if IsChiefLZArchiveEx}
    {$ifdef Win32} {$i+} {$endif Win32}
  END; {with Header}
END;
{/////////////////////////////////////////////////////////}
FUNCTION GetChiefLZArchiveSize ( ArchName : PChar ) : TLZCount;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
{get uncompressed size of archive}
VAR
Header : TLZArchiveHeader;
BEGIN
  GetChiefLZArchiveSize := 0;
  IF IsChiefLZArchiveEx ( ArchName, Header ) < 1 THEN Exit;
  GetChiefLZArchiveSize := Header.uSize;
END;
{/////////////////////////////////////////////////////////}
FUNCTION DoEncodeIt
( VAR InFile, OutFile : file; CONST aProc : TLZReportProc;
  CompMethod : TLZCompressionChoices ) : TLZCount;
BEGIN
    Decompressing := FALSE;
    IF CompMethod = LZMaxCompression THEN BEGIN
       aWrite := LH6Encode ( InFile, OutFile );
       DoEncodeIt := aWrite;
   END
   ELSE BEGIN
         LZReportProc := aProc;
         InBufPtr     := LZRWBufSize;
         InBufSize    := LZRWBufSize;
         OutBufPtr    := 0;
         Height       := 0;
         MatchPos     := 0;
         MatchLen     := 0;
         LastLen      := 0;
         aWrite       := 0;
         FillChar ( BinaryTree^, SizeOf ( TBinaryTree ), 0 );
         FillChar ( CodeBuf, SizeOf ( CodeBuf ), 0 );
         LZEncode;
         DoEncodeIt := aWrite;
    END;
END;
{/////////////////////////////////////////////////////////}
FUNCTION LZCompress ( CONST aSource, aDest : pChar;
                    LZQuestion  : TLZQuestionFunc;
                    aProc : TLZReportProc;
                    CompMethod  : TLZCompressionChoices ) : TLZCount;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
VAR
Source,
Dest     : TLZString;
OldFMode : byte;
f        : TLZHeader;
RepRec,
DestRec  : TLZReportRec;
hT       : TLZCount;

BEGIN
{$ifDef Shared_Buffers}
  IF IsLZInitialized THEN BEGIN
      LZCompress := LZCode_BusyDll;  {already busy}
      Exit
  END;
{$endif Shared_Buffers}
  aRead := 0;
  aWrite := 0;
  FillChar ( f, sizeof ( f ), #0 );
  FillChar ( RepRec, sizeof ( RepRec ), #0 );
  FillChar ( DestRec, sizeof ( DestRec ), #0 );

  IF NOT LZInit ( CompMethod ) THEN
  {$ifdef Win32}
    RaiseError ( EChiefLZError, SInitFailed );
  {$else}
    BEGIN
      LZCompress := LZCode_InitFailure;  {unable to init}
      Exit
    END;
  {$endif}

{$ifdef Win32}
  TRY { finally }
{$endif}

  Source := StrPas ( aSource );
  Dest   := StrPas ( aDest );
  IF ( Length ( Source ) = 0 ) OR ( Length ( Dest ) = 0 ) OR
                                  ( Uppercase ( Source ) = Uppercase ( Dest ) )
  THEN BEGIN
    LZCompress := LZCode_SourceIsTarget;  {same source and target}
    LZDone;
    Exit
  END;

  { can't find source file }
  IF Not FileExists ( Source ) THEN BEGIN
     LZCompress := LZCode_SourceFileNotFound;
     LZDone;
     Exit
  END;

  hT := sFTime ( Source );
  WITH RepRec
  DO BEGIN   {get details of Source}
     Names  := Source;
     uSizes := FSize ( Source );
     Times  := hT;
     fAttrs := FileGetAttr ( Win16FThunker ( Source, True ) );
     CRCs   := GetFileCRC ( Win16FThunker ( Source, True ) );
     FileVersion := GetFileVersion ( Win16FThunker ( Source, True ) );
  END;

{||| does target file exist already? ||||}
  IF FileExists ( Dest )
  THEN BEGIN
    WITH RepRec
    DO BEGIN   {send details of Source}
       Sizes := uSizes;
       CompressedTypes :=  Ord ( LZUnknown );
    END;

    IF Assigned ( LZQuestion )
    THEN BEGIN
      GetChiefLZFileInfo ( Str2pChar ( Dest ), DestRec );
      IF LZQuestion ( RepRec, DestRec ) <> LZYes
      THEN BEGIN
         LZCompress := LZCode_UserSkippedFile; {target exists - don't overwrite}
         {$ifndef Win32}
          LZDone;
         {$endif}
          Exit;
      END;
    END; {if assigned}
  END  {if FileExists(Dest) }
  ELSE {dest does not exist}
  WITH RepRec
  DO BEGIN
     Sizes  := - 1;
     CompressedTypes := Ord ( LZSS );
  END;

  BlankRec := RepRec;

{$ifdef Win32}
  AssignFile ( LZInFile, Source );
  OldFMode := FileMode;
  FileMode := fmOpenRead {$ifndef Ver90}OR fmShareDenyWrite{$endif Ver90}; { Delphi2 only allows 0 <= FileMode <= 2 }
  Reset ( LZInFile, 1 );        { However, share access is FILE_SHARE_READ }
  FileMode := OldFMode;
  TRY { finally }
    AssignFile ( LZOutFile, Dest );
    Rewrite ( LZOutFile, 1 );
    TRY { finally }

      IF Assigned ( aProc ) THEN aProc ( RepRec, LZCode_CallBackStartFile );
      LZReportProc := aProc;

      IF IsMyLZFile ( LZInFile, f ) THEN
        LZCompress := MyFCopy ( LZInFile, LZOutFile,
                               LZ_UNKNOWN_LENGTH, doReportOnRead )
      ELSE                               {already compressed: just copy}
        BEGIN
          FillChar ( f, SizeOf ( f ), 0 );
          WITH f DO
            BEGIN
              fName     := ExtractFileName ( Source );
              fTime     := hT;
              Signature := ChiefLZSig;
              uSize     := RepRec.USizes;
              fAttr     := RepRec.fAttrs;
              Version   := RepRec.FileVersion;
              CRC       := RepRec.CRCs;
              ID        := RepRec.FileIDs;
              CompType  := Ord ( LZSS );
              CASE CompMethod OF
                   LZNoCompression : CompType   := Ord ( LZStored );
                   LZMaxCompression : CompType   := Ord ( LH6 );
              END; {case}
            END;

          {write header}
          BlockWrite ( LZOutFile, f, SizeOf ( f ) );

          {encode and compress}
          f.cSize := DoEncodeIt ( LZInFile, LZOutFile, aProc, CompMethod );

          {go back and rewrite header}
          Seek ( LZOutFile, 0 );
          BlockWrite ( LZOutFile, f, SizeOf ( f ) );

          {return}
          LZCompress := aWrite + SizeOf ( TLZHeader )
        END

    FINALLY
      FileSetDate ( TFileRec ( LZOutFile ) .Handle, f.fTime );
      CloseFile ( LZOutFile );
      IF Assigned ( aProc ) THEN
        BEGIN
          RepRec.Names := '';
          RepRec.Sizes := aWrite;
          aProc ( RepRec, LZCode_CallBackEndFile )
        END
    END
  FINALLY
    CloseFile ( LZInFile )
  END
  FINALLY
    LZDone
  END

{$else Win32}
  Assign ( LZInFile, Source );
  OldFMode := FileMode;
{
  Open file: we need Read-access, don't need Write-access and *INSIST*
  that no one else can write to it (i.e. corrupt it) 'til we're done ...
}
  FileMode := ( fmOpenRead OR fmShareDenyWrite );
  Reset ( LZInFile, 1 );
  FileMode := OldFMode;
  IF IOResult <> 0 THEN
    LZCompress := LZCode_CantOpenFile
  ELSE BEGIN

  IF @WriteThunkFunc <> Nil THEN WriteThunkFunc ( Dest, False ); {&&& }
  Assign ( LZOutFile, Dest );
  Rewrite ( LZOutFile, 1 );
  IF IOResult <> 0 THEN
    LZCompress := LZCode_CantCreateFile
  ELSE BEGIN

  IF Assigned ( aProc ) THEN aProc ( RepRec, LZCode_CallBackStartFile );
  LZReportProc := aProc;

  IF IsMyLZFile ( LZInFile, f )
  THEN BEGIN
    {
    With f do begin
       Writeln(fname);
       Writeln(Csize);
       Writeln(usize);
       Writeln(CompType);
       Halt;
    end;
    }
    LZCompress := MyFCopy ( LZInFile, LZOutFile, LZ_UNKNOWN_LENGTH, doReportOnRead );
  END
  ELSE                                   {already compressed: just copy}
    BEGIN
     FillChar ( f, SizeOf ( f ), 0 );
     WITH f DO
       BEGIN
         fName   := ExtractFileName ( Source );
         fTime   := hT;
         uSize   := FileSize ( LZInFile );
         Version := RepRec.FileVersion;
         fAttr   := RepRec.fAttrs;
         CRC     := RepRec.CRCs;
         Id      := RepRec.FileIDs;
         Signature := ChiefLZSig;
         CompType := Ord ( LZSS );
         CASE CompMethod OF
              LZNoCompression : CompType := Ord ( LZStored );
              LZMaxCompression : CompType := Ord ( LH6 );
         END; {case}
       END;
     BlockWrite ( LZOutFile, f, SizeOf ( f ) ); {write header}

     IF IOResult <> 0 THEN
       LZCompress := LZCode_HeaderWriteFailure
     ELSE
       BEGIN
         f.cSize := DoEncodeIt ( LZInFile, LZOutFile, aProc, CompMethod );
         {go back and rewrite header}
         Seek ( LZOutFile, 0 );IF IOResult = 0 THEN;
         BlockWrite ( LZOutFile, f, SizeOf ( f ) ); {write header}
         LZCompress := aWrite + SizeOf ( TLZHeader )
       END
    END;

  IF Assigned ( aProc ) THEN
    BEGIN
      RepRec.Names := '';
      RepRec.Sizes := aWrite;
      aProc ( RepRec, LZCode_CallBackEndFile )
    END;

  { set date/time stamp }
{$ifdef Delphi}
  FileSetDate ( TFileRec ( LZOutFile ) .Handle, f.fTime );
{$else}
  SetFTime ( LZOutFile, f.fTime );
{$endif}

  Close ( LZOutFile );IF IOResult <> 0 THEN;
  END; { IOResult = 0 }

  Close ( LZInFile );IF IOResult <> 0 THEN;
  END; { IOResult = 0 }

  LZDone
{$endif}
END; { LZCompress }
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
FUNCTION LZDecompress ( aSource, aDest : PChar;
                      LZQuestion : TLZQuestionFunc;
                      aProc :      TLZReportProc ) : TLZCount;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}

VAR
f     : TLZHeader;
hT    : TLZCount;
DestRec,
RepRec : TLZReportRec;
IsComp : Boolean;
OldFMode : Byte;
Source,
Dest    : TLZString;

{$ifndef Win32}
UpSource : TLZString;
LZReply : TLZReply;
{$endif}
p    : ARRAY [ 0..{$ifdef Win32}255{$else}128{$endif} ] OF Char;

BEGIN

{$ifDef Shared_Buffers}
  IF IsLZInitialized THEN BEGIN
      LZDecompress := LZCode_BusyDll;  {already busy}
      Exit
  END;
{$endif Shared_Buffers}

  FillChar ( RepRec, sizeof ( RepRec ), #0 );
  FillChar ( DestRec, sizeof ( DestRec ), #0 );
  aRead := 0;
  aWrite := 0;
  FillChar ( f, Sizeof ( f ), #0 );

  IF NOT LZInit ( LZFastCompression ) THEN
  {$ifdef Win32}
    RaiseError ( EChiefLZError, SInitFailed );
  {$else}
    BEGIN
      LZDecompress := LZCode_InitFailure;  {unable to init}
      Exit
    END;
  {$endif}

{$ifdef Win32}
  TRY { finally }
  Source   := StrPas ( aSource );
  Dest     := StrPas ( aDest );

  IF ( Length ( Source ) = 0 ) OR ( Length ( Dest ) = 0 ) THEN
    RaiseError ( EChiefLZCompress, SInvalidParams );

  Source := ExpandFileName ( Source );
  Dest   := ExpandFileName ( Dest );
{
  Do case-insensitive comparison of full pathnames ...
}
  IF AnsiCompareText ( Source, Dest ) = 0 THEN
    RaiseErrorStr ( EChiefLZCompress, SSameFileName, Source );

{$else Win32}
  Source   := Win16FThunker ( StrPas ( aSource ), True );
  UpSource := Uppercase ( Source );
  Dest     := StrPas ( aDest );
  IF ( Length ( Source ) = 0 ) OR ( Length ( Dest ) = 0 )
        OR ( UpSource = Uppercase ( Dest ) )
  THEN
    LZDecompress := LZCode_SourceIsTarget
  ELSE BEGIN

{$endif Win32}

  {see if source file exists}
    p [ 0 ] := #0;
    IF NOT FileExists ( Source ) THEN {look for name ending with MyLZMarker}
    BEGIN
       Source := GetLZMarkedName ( Source );
{
  Win32 will raise the correct exception automatically when
  GetChiefLZFileName() attempts to open Source ...
}
     {$ifdef Win32}

       GetChiefLZFileName ( Str2pChar ( Source ), p );
       IF AnsiCompareText ( ExtractFileName ( StrPas ( p ) ),
                          ExtractFileName ( Source ) ) <> 0 THEN
         RaiseErrorStr ( EChiefLZCompress, SWrongCompressedFile, StrPas ( p ) );

     {$else}

       IF NOT FileExists ( Source ) THEN {source file not found}
         BEGIN
           LZDecompress := LZCode_SourceFileNotFound;
           LZDone;
           Exit
         END;

       GetChiefLZFileName ( Str2PChar ( Source ), p ); {read header}
       IF ( ExtractFileName ( Uppercase ( StrPas ( p ) ) )
            <> ExtractFileName ( UpSource ) ) {wrong uncompressed file}
       THEN BEGIN
          LZDecompress := LZCode_NotLZFile; {wrong file}
          LZDone;
          Exit
        END;
     {$endif}
    END;

    {not FileExists}
  {||||||||}
  hT := sFTime ( Source );

  {$ifdef Win32}
  AssignFile ( LZInFile, Source );
  OldFMode := FileMode;
  FileMode := fmOpenRead {$ifndef Ver90}OR fmShareDenyWrite{$endif Ver90}; { Delphi2 only allows 0 <= FileMode <= 2 }
  Reset ( LZInFile, 1 );       { However, share access is FILE_SHARE_READ }
  FileMode := OldFMode;
  TRY { finally }
  {$else Win32}
  Assign ( LZInFile, Source );
  OldFMode := FileMode;
  FileMode := ( fmOpenRead OR fmShareDenyWrite ); {using these constants causes problems!}
  Reset ( LZInFile, 1 );                         { Only if file is already open for       }
  FileMode := OldFMode;                     { *writing* to by another process.       }
                                            { If a write happens during decomression }
  IF IOResult <> 0 THEN                     { then the decompressed file is worthless}
    LZDecompress := LZCode_CantOpenFile {can't open source}
  ELSE BEGIN
  {$endif Win32}

  IsComp := IsMyLZFile ( LZInFile, f );

{||| does target file exist already? ||||}
  IF FileExists ( Dest )
  THEN BEGIN
    IF Assigned ( LZQuestion )
      THEN GetChiefLZFileInfo ( Str2pChar ( Dest ), DestRec );

    WITH RepRec DO
      IF IsComp THEN
        BEGIN {send details of Source(compressed) file}
          Names  := f.FName;
          Sizes  := f.cSize;
          uSizes := f.uSize;
          Times  := f.fTime;
          fAttrs := f.fAttr;
          FileVersion := f.Version;
          CRCs        := f.CRC;
          FileIDs     := f.Id;
          CompressedTypes := f.CompType;
        END
      ELSE BEGIN
        Names  := Source;
        Sizes  := FileSize ( LZInFile );
        uSizes := Sizes;
        Times  := hT;
        fAttrs := FileGetAttr ( Win16FThunker ( Source, True ) );
        CRCs   := GetFileCRC ( Win16FThunker ( Source, True )  );
        FileVersion := GetFileVersion ( Win16FThunker ( Source, True )  );
        FileIDs := 0;
        CompressedTypes := Ord ( LZUnknown );
      END;

    IF Assigned ( LZQuestion ) THEN    { and send name of existing target file}
    {$ifdef Win32}
      CASE LZQuestion ( RepRec, DestRec ) OF
        LZNo :   BEGIN
                  LZDecompress := LZCode_UserSkippedFile; {target exists - don't overwrite}
                  Exit
                 END;
        LZQuit : BEGIN
                  LZDecompress := LZCode_UserAborted; {User Abort}
                  Exit
                 END;
      END {Case}       { out of entire application unless caught... :-) }
    {$else Win32}
      BEGIN
        LZReply := LZQuestion ( RepRec, DestRec );
        IF LZReply <> LZYes THEN
          BEGIN
            IF LZReply = LZNo THEN
              LZDecompress := LZCode_UserSkippedFile  { Exit nicely ... }
            ELSE
              LZDecompress := LZCode_UserAborted;  { ABORT!!!!!!!    }
            Close ( LZInFile ); { Reset() successful; Close() cannot fail }
            LZDone;
            Exit
          END
      END
    {$endif Win32}

  END;

  {report on target file}
  WITH RepRec DO BEGIN
     Names := Dest;
     IF IsComp THEN BEGIN
        Sizes  := f.cSize;
        uSizes := f.uSize;
        Times  := f.fTime;
        fAttrs := f.fAttr;
        CRCs   := f.CRC;
        FileVersion := f.Version;
        FileIDs     := f.Id;
        CompressedTypes := f.CompType;
     END ELSE BEGIN
        Sizes  := fSize ( Source );
        fAttrs := FileGetAttr ( Win16FThunker ( Source, True ) );
        CRCs   := GetFileCRC ( Win16FThunker ( Source, True ) );
        uSizes := Sizes;
        Times  := hT;
        FileVersion := '0';
        FileIDs     := 0;
        CompressedTypes := Ord ( LZUnknown );
     END;
  END;

  BlankRec := RepRec;

{$ifdef Win32}
    DeleteaFile ( Dest ); { if a copy exists, remove it }
    AssignFile ( LZOutFile, Dest );
    Rewrite ( LZOutFile, 1 );
    TRY { finally }

      {//////////}
      IF Assigned ( aProc ) THEN aProc ( RepRec, LZCode_CallBackStartFile );
      LZReportProc := aProc;
      {//////////}
      IF NOT IsComp THEN
        BEGIN {normal copy}
          f.fTime := hT;
          LZDecompress := MyFCopy ( LZInFile, LZOutFile,
                                  LZ_UNKNOWN_LENGTH, doReportOnWrite )
        END
      ELSE
        BEGIN
          Decompressing := TRUE;
          Seek ( LZInFile, SizeOf ( TLZHeader ) );
          IF f.Comptype = Ord ( LH6 )
          THEN BEGIN
              aWrite := LH6Decode ( LZInFile, LZOutFile );
          END ELSE BEGIN
              InBufPtr  := LZRWBufSize;
              InBufSize := LZRWBufSize;
              OutBufPtr := 0;
              FillChar ( BinaryTree^.TextBuf, SizeOf ( TLZTextBuf ), 0 );
              LZDecode;
          END;
          LZDecompress := aWrite
        END

    FINALLY
      { set date/time stamp }
      FileSetDate ( TFileRec ( LZOutFile ) .Handle, f.fTime );
      CloseFile ( LZOutFile );

      {reset attributes}
      FileSetAttr ( Dest, f.fAttr );
      IF CheckFileCRCs
      THEN BEGIN
         IF  ( GetFileCRC ( Dest ) <> f.CRC )
         THEN LZDecompress := LZCode_BadFileCRC;
      END;

      IF Assigned ( aProc ) THEN
        BEGIN
          RepRec.Names := '';
          aProc ( RepRec, LZCode_CallBackEndFile )
        END
    END

  FINALLY
    CloseFile ( LZInFile )
  END
  FINALLY
    LZDone
  END;
{$else Win32}
  IF @WriteThunkFunc <> Nil THEN WriteThunkFunc ( Dest, False );  { &&& }
  Assign ( LZOutFile, Dest );
  DeleteaFile ( Dest ); { if a copy exists, remove it }
  Rewrite ( LZOutFile, 1 );
  IF IOResult <> 0 THEN
    LZDecompress := LZCode_CantCreateFile  {can't open target}
  ELSE BEGIN

  {//////////}
  IF Assigned ( aProc ) THEN aProc ( RepRec, LZCode_CallBackStartFile );
  LZReportProc := aProc;
  {//////////}
  IF NOT IsComp THEN
    BEGIN {normal copy}
      f.fTime := hT;
      LZDecompress := MyFCopy ( LZInFile, LZOutFile,
                              LZ_UNKNOWN_LENGTH, doReportOnWrite )
    END
  {//////////}
  ELSE
    BEGIN
      Decompressing := TRUE;
      Seek ( LZInFile, SizeOf ( TLZHeader ) );
      IF f.Comptype = Ord ( LH6 )
      THEN BEGIN
          aWrite := LH6Decode ( LZInFile, LZOutFile );
      END ELSE BEGIN
          InBufPtr  := LZRWBufSize;
          InBufSize := LZRWBufSize;
          OutBufPtr := 0;
          FillChar ( BinaryTree^.TextBuf, SizeOf ( TLZTextBuf ), 0 );
          LZDecode;
      END;
      LZDecompress := aWrite
    END;

{ set date/time stamp }
{$ifdef Delphi}
  FileSetDate ( TFileRec ( LZOutFile ) .Handle, f.fTime );
{$else Delphi}
  SetFTime ( LZOutFile, f.fTime );
{$endif Delphi}

  Close ( LZOutFile );IF IOResult <> 0 THEN;

{ set attributes }
  FileSetAttr ( Dest, f.fAttr );

  IF CheckFileCRCs
  THEN BEGIN
     IF  ( GetFileCRC ( Dest ) <> f.CRC )
     THEN BEGIN
          LZDecompress := LZCode_BadFileCRC;
     END;
  END;

  IF Assigned ( aProc ) THEN
    BEGIN
      RepRec.Names := '';
      aProc ( RepRec, LZCode_CallBackEndFile )
    END
  END; { IOResult = 0 }

  Close ( LZInFile ); IF IOResult <> 0 THEN;
  END { IOResult = 0 }

  END;
  LZDone
{$endif Win32}
END; { LZDecompress }
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
TYPE         {   0           1     2    3    4     5     6    7    8                9         10 }
FCompTypes = ( FileError, Unknown, Zip, Zoo, Arc, Lzh,  Pak, Arj, TooSmall, UserDefined, ToStoreOnly );

FUNCTION GetCompressionType ( CONST FName : TLZString;OnlyCopyToArchive : Boolean ) : FCompTypes;
{see if a file is already compressed - and what type}
VAR
  f1    : File;
  i     : Integer;
  aMode : FCompTypes;
  c     : ARRAY [ 1..5 ] OF Byte;
  oMode : Byte;
  Ext   : String [ 10 ];

BEGIN
  Ext := Uppercase ( ExtractFileExt ( FName ) );
  IF ( Pos ( Ext, FIgnoreExtensions ) > 0 )
  THEN BEGIN
     GetCompressionType := UserDefined;
     Exit;
  END ELSE
  IF ( OnlyCopyToArchive = TRUE )
  THEN BEGIN
     GetCompressionType := ToStoreOnly;
     Exit;
  END;

  aMode := FileError;
  oMode := FileMode;
  FileMode := ( fmOpenRead {$ifndef ver90}OR fmShareDenyWrite{$endif} );
  Assign ( f1, FName );
  {$ifdef Win32} {$i-} {$endif Win32}
  Reset ( f1, 1 );
  {$ifdef Win32} {$i+} {$endif Win32}
  FileMode := oMode;
  IF IOResult = 0
  THEN BEGIN
     aMode := Unknown;
     IF ( FileSize ( f1 ) < 100 ) THEN aMode := TooSmall {don't process tiny files}
     ELSE
     BEGIN
          BlockRead ( f1, c, sizeof ( c ), i );
          IF ( ( c [ 1 ] = $50 ) AND ( c [ 2 ] = $4B ) )
          THEN aMode := Zip
          ELSE IF ( ( c [ 1 ] = $60 ) AND ( c [ 2 ] = $EA ) )
          THEN aMode := Arj
          ELSE IF ( ( c [ 4 ] = $6c ) AND ( c [ 5 ] = $68 ) )
          THEN aMode := Lzh
          ELSE IF ( ( c [ 1 ] = $5a ) AND ( c [ 2 ] = $4f ) AND ( c [ 3 ] = $4f ) )
          THEN aMode := Zoo
          ELSE IF ( ( c [ 1 ] = $1a ) AND ( c [ 2 ] = $08 ) )
          THEN aMode := Arc
          ELSE IF ( ( c [ 1 ] = $1a ) AND ( c [ 2 ] = $0b ) )
          THEN aMode := Pak;
     END;
     Close ( f1 );
  END; {if ioresult=0}
  GetCompressionType := aMode;
END;
{/////////////////////////////////////////////////////////}
FUNCTION ArchiveSquash ( VAR InFile, OutFile : file;
                       CONST aProc : TLZReportProc;
                       CompMethod : TLZCompressionChoices ) : TLZCount;
BEGIN
  ArchiveSquash := LZCode_GeneralErrorCode;
  IF IsLZInitialized THEN
  BEGIN
    Seek ( InFile, 0 );
    {$ifndef Win32} IF IOResult <> 0 THEN; {$endif}
    ArchiveSquash := DoEncodeIt ( InFile, OutFile, aProc, CompMethod );
  END; {IsLZInitialized}
END; { ArchiveSquash }
{/////////////////////////////////////////////////////////}
FUNCTION IsFileInDir ( fSpec : TLZString ) : Boolean;
VAR
{$ifdef Windows}
 Dir : TSearchRec;
{$else}
 Dir : SearchRec;
{$endif Windows}
BEGIN
    {$ifndef Win32}
    fSpec := Win16FThunker ( fSpec, True );
    {$endif Win32}

   {$ifdef Delphi}
     Result := ( FindFirst ( fSpec, faAnyFile - faDirectory - faVolumeID, Dir ) = 0 );
     IF Result THEN SysUtils.FindClose ( Dir );
   {$else Delphi}

   {$ifdef Windows}
     FindFirst ( Str2PChar ( fSpec ), faAnyFile - faDirectory - faVolumeID, Dir );
   {$else Windows}
     FindFirst ( fSpec, AnyFile - Directory - VolumeID, Dir );
   {$endif Windows}
     IsFileInDir := ( DosError = 0 )
  {$endif Delphi}
END;

{//////////////////////////////////////////}
PROCEDURE InitReportRec ( VAR RepRec : TLZReportRec; CONST X : TLZBigFileRec );
BEGIN
   WITH RepRec, X DO
     BEGIN
       Names  := BigNames^;
       Sizes  := BigSizes;
       uSizes := uBigSizes;
       Times  := BigTimes;
       fAttrs := BigfAttrs;
       CRCs   := BigCRCs;
       FileIDs    := BigFileID;
       CompressedTypes := BigCompressedType;
       IsDir  := IsBigDir;
       FileVersion := BigFileVersion;
    END
END;

{////////////////////////////////////////////////////}
FUNCTION LZListArchive ( ArchName : PChar; pHeader : pLZArchiveHeader;
ListFunc : TLZReportProc ) : TLZCount;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
VAR
b   : Boolean;
i   : TLZCount;
j, k : TLZCount;
{jR2 : PChiefLZArchiveHeader;}
RepRec : TLZReportRec;
BEGIN
   LZListArchive := LZCode_NilCallBack;  {callback not assigned}
   IF Not Assigned ( ListFunc ) THEN Exit;

   LZListArchive := LZCode_NotLZArchive;  {not an LZ archive}
   j := IsChiefLZArchive ( ArchName );

   IF j < 1 THEN Exit;

   LZHeader_Construct ( jr2, j );
   IF NOT Assigned ( jr2 ) THEN Exit;
 {$ifdef Delphi}
    TRY
 {$endif Delphi}
    k := GetChiefLZArchiveInfo ( ArchName, jr2^ );
    b :=  k >= 0;
    IF b THEN BEGIN
       IF Assigned ( pHeader ) THEN pHeader^ := jr2^.MainHeader;

       LZListArchive := jr2^.Count;

       FillChar ( RepRec, Sizeof ( RepRec ), #0 );
       WITH RepRec, jr2^.MainHeader
       DO BEGIN
          Sizes  := cSize;
          uSizes := uSize;
          fAttrs := Count;
          CRCs   := fBlockLen;
          Names  := StrPas ( ArchName );
          FileIDs := - 1;
          CompressedTypes := Ord ( LZUnknown );
       END;
       { report the archive details }
       IF ListFunc ( RepRec, LZCode_CallBackStartArchive ) <> 0  { send code to begin }
       THEN BEGIN
            FillChar ( RepRec, Sizeof ( RepRec ), #0 );
            FOR i := 1 TO ( jr2^.Count )
            DO BEGIN
               WITH RepRec
               DO BEGIN
                  Sizes  := jr2^.Files [i]^.Sizes;
                  uSizes := jr2^.Files [i]^.uSizes;
                  Times  := jr2^.Files [i]^.Times;
                  fAttrs := jr2^.Files [i]^.fAttrs;
                  CRCs   := jr2^.Files [i]^.CRCs;
                  IsDir  := jr2^.Files [i]^.IsDir;
                  FileIDs := jr2^.Files [i]^.FileID;
                  CompressedTypes := Jr2^.Files [i]^.CompressedType;
                  FileVersion := jr2^.Files [i]^.FileVersion;
                  Names  := GetFullLZName ( jr2^, i );
               END;
               IF ListFunc ( RepRec, i ) = 0 THEN Break;
            END; { for i }
            RepRec.Names := Strpas ( ArchName );
            ListFunc ( RepRec, LZCode_CallBackEndArchive ); { to end }
       END;
    END { if b }
    ELSE LZListArchive := k;
  {$ifdef Delphi}
    FINALLY
  {$endif Delphi}
   LZHeader_Destroy ( jr2, j );
  {$ifdef Delphi}
    ResetPassWordFlag;
    END; { try ... }
  {$endif Delphi}
END;
{/////////////////////////////////////////////////////////}
FUNCTION LZArchive ( fSpec, ArchName : PChar;
                     LZRecurseDirs :   TLZRecurse;
                     aProc :           TLZReportProc;
                     CompMethod :      TLZCompressionChoices ) : TLZCount;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}

TYPE
  PDirTimes = ^TDirTimes;
  TDirTimes = ARRAY [ 1..MaxChiefLZDirectories ] OF TLZCount;

CONST
{$ifdef Windows}
  faFiles = faReadOnly + faSysFile + faHidden + faArchive + 0;
  faDirs  = faSysFile + faHidden + faDirectory + 0;
{$else Windows}
  faFiles = ReadOnly + SysFile + Hidden + Archive + 0;
  faDirs  = SysFile + Hidden + Directory + 0;
{$endif Windows}

VAR
{$ifdef Windows}
 Dir :  TSearchRec;
{$else Windows}
 Dir :  SearchRec;
{$endif Windows}

{$ifndef Win32}
Temp       : TLZPathStr;
l, LZTot   : TLZCount;
{$endif Win32}

OldFMode   : byte;
Path,
s1, s2     : TLZString;
fSpecName  : TLZString;
i, ll      : TLZCount;
t          : Text;
UseFile    : boolean;
Hed        : TLZArchiveHeader;
FoundName  : TLZPathStr;
DirCount,
DirCountEx : TLZSSWord;
DirArray   : PLZDirArray;
DirTimes   : PDirTimes;
PIndex     : TLZCount;
NewPIndex  : TLZCount;
RepRec     : TLZReportRec;
NamCount   : integer;
NamNam     : pChar;
StoreUnCompressed : Boolean;
nS         : TLZString;
Hed2       : TLZHeader;
bb         : Boolean;

BEGIN   { LZArchive }
   DirCountEx := 0;

{$ifdef Shared_Buffers}
  IF IsLZInitialized THEN BEGIN
      LZArchive := LZCode_BusyDll; {busy}
      Exit
  END;
 {$endif Shared_Buffers}

  IF NOT LZInit ( CompMethod ) THEN
  {$ifdef Win32}
    RaiseError ( EChiefLZError, SInitFailed );
  {$else}
    BEGIN
      LZArchive := LZCode_InitFailure; {init error}
      Exit
    END;
  {$endif}

  FillChar ( Hed, Sizeof ( Hed ), #0 );
  StoreUnCompressed := CompMethod = LZNoCompression;

 {$ifdef Win32}
  TRY { finally }
 {$endif}

  s1 := StrPas ( fSpec );
  s2 := {$ifdef Win32} ExpandFileName ( StrPas ( ArchName ) )
        {$else}        StrPas ( ArchName )
        {$endif};

 {are we reading from a file?}
  UseFile := FALSE;
  i := Pos ( '/F=', Uppercase ( s1 ) );
  IF i > 0 THEN
    BEGIN
      Delete ( s1, 1, i + 2 );
      UseFile := TRUE;
      LZRecurseDirs := LZNoRecurse
    END;

  IF ( Length ( s1 ) = 0 ) OR ( Length ( s2 ) = 0 ) THEN
  {$ifdef Win32}
    RaiseError ( EChiefLZError, SInvalidParams );
  {$else}
    BEGIN
      LZDone;
      Exit
    END;
  {$endif}

{$ifdef Win32}

  s1 := ExpandFileName ( s1 );
  IF AnsiCompareText ( s1, s2 ) = 0 THEN
    RaiseErrorStr ( EChiefLZArchive, SSameFileName, s1 );

  AssignFile ( LZOutFile, s2 );

  {$i-}
  IF ArchiveStartOffSet = 0
  THEN BEGIN
     Rewrite ( LZOutFile, 1 );
     {$i+}
     IF IoResult <> 0 THEN BEGIN
        LZArchive := LZCode_CantCreateFile;
        LZDone;
        Exit;
     END;
  END
  ELSE BEGIN
      {$i-}
      Reset ( LZOutFile, 1 );
      {$i+}
      IF IoResult <> 0 THEN BEGIN
         LZArchive := LZCode_CantOpenFile;
         LZDone;
         Exit;
      END;
      {$i-}
      Seek ( LZOutFile, ArchiveStartOffSet );
      {$i+}
      IF IoResult <> 0 THEN BEGIN
         LZArchive := LZCode_GeneralErrorCode;
         LZDone;
         Exit;
      END;
  END; {if}

  TRY { finally }
    Result := LZCode_NoFilesProcessed;

    SetupArchiveFiles ( jr, MaxChiefLZArchiveSize );

    TRY { finally }
      Hed.Count := 0;
      DirCount := 0;
      { report processing subdirectories }
          IF Assigned ( aProc )
          THEN BEGIN
               FillChar ( RepRec, Sizeof ( RepRec ), #0 );
               WITH RepRec {send archive name}
               DO BEGIN
                  Names  := StrPas ( ArchName );
                  fAttrs := - 1;
                  Sizes  := - 1;
                  uSizes := - 1;
                  CRCs   := - 1;
               END;  {with}
               aProc ( RepRec,  LZCode_CallBackProcessingDirs );
               FillChar ( RepRec, Sizeof ( RepRec ), #0 );
          END;
      { end report: processing subdirectories }

    { get the filenames for the archive }
      IF UseFile THEN { - use a LIST file }
      BEGIN
        Path := '';
        AssignFile ( t, s1 );
        TRY
          Reset ( t );
          TRY { finally }
            WHILE NOT EOF ( t ) DO
              BEGIN
                Readln ( t, s1 );
                IF ( Length ( s1 ) <> 0 ) AND
                   ( AnsiCompareText ( s1, s2 ) <> 0 ) AND
                    FileExists ( s1 ) THEN
                  BEGIN
                  {$IFDEF Debug}
                    IF Hed.Count > MaxChiefLZArchiveSize THEN
                      RAISE EChiefLZDebug.Create ( 'Too many archive files' );
                  {$ENDIF}
                    IF Hed.Count >= MaxChiefLZArchiveSize THEN
                      break;
                    inc ( Hed.Count );
                    WITH jr^ [ Hed.Count ]^ DO
                      BEGIN
                        IsBigDir := FALSE;
                        BigDirID := 0;
                        BigCompressed := TRUE;
                        uBigSizes := fSize ( s1 );
                        BigTimes  := sfTime ( s1 );
                        BigfAttrs := FileGetAttr ( s1 );
                        BigCRCs   := GetFileCRC ( s1 );
                        BigFileID := Hed.Count;
                        BigCompressedType := Ord ( LZSS );
                        BigFileVersion := GetFileVersion ( s1 );
                        BigNames := NewString ( s1 );{aha}
                      END
                  END {s1 <> s2}
              END; {not EOF(t)}
            IF Hed.Count = 0 THEN
              RaiseError ( EChiefLZArchive, SNoValidFileName )
          FINALLY
            CloseFile ( t )
          END;
        EXCEPT END;
        END
{
  We do not have a LIST file, so find filespecs ...
}
        ELSE
          BEGIN
            Path := ExtractFilePath ( s1 );
            fSpecName := ExtractFileName ( s1 );
            New ( DirArray );
            TRY {finally}
              DirCountEx := 0;
              DirArray^ [ 0 ] := @Path;

              IF LZRecurseDirs <> LZNoRecurse THEN
{
  `Recurse' through subdirectories for files matching the given mask.
  There are 2 levels of recursion - full recursion and immediate-subdirs...
}
              BEGIN
                New ( DirTimes );
                TRY {finally}

                  i := 0;
                  REPEAT
                    IF ( LZRecurseDirs <> LZNoRecurse ) AND
                       ( FindFirst ( DirArray^ [ i ]^ + '*', faDirs, Dir ) = 0 ) THEN
                    TRY {finally}
                      REPEAT
                        IF Dir.Attr AND faDirectory <> 0 THEN
                          BEGIN
                            FoundName := GetFoundFileName ( DirArray^ [ i ]^, Dir );
                            IF ( FoundName <> '.' ) AND
                               ( FoundName <> '..' ) THEN
                              BEGIN
                              {$IFDEF Debug}
                                IF DirCount > MaxChiefLZDirectories THEN
                                  RAISE EChiefLZDebug.Create ( 'DirArray^ bounds exceeded' );
                              {$ENDIF}
                                IF DirCount >= MaxChiefLZDirectories THEN
                                  break;
                                inc ( DirCount );

                                DirArray^ [ DirCount ] :=
                                NewString ( DirArray^ [ i ]^ + FoundName + '\' );
                                DirTimes^ [ DirCount ] := Dir.Time
                              END
                          END
                      UNTIL FindNext ( Dir ) <> 0
                    FINALLY
                      SysUtils.FindClose ( Dir )
                    END;

                    IF i = 0 THEN
                      BEGIN
                        Inc ( i );
{
            Turn directory-recursion off - have only looked in
            immediate subdirectories ...
}
                        IF LZRecurseDirs = LZRecurseOnce THEN Dec ( LZRecurseDirs )
                      END
                    ELSE
                    IF  ( NOT IsFileInDir ( DirArray^ [ i ]^ + fSpecName ) ) {directory has no matching file }
                    AND ( fSpecName [Length ( fSpecName ) ] <> '*' )  { allow empty directories with "*.*" }
                    THEN BEGIN
                        DisposeString ( DirArray^ [ i ] );
                        Move ( DirArray^ [ i + 1 ], DirArray^ [ i ],
                                              ( DirCount - i ) * SizeOf ( PLZString ) );
                        Move ( DirTimes^ [ i + 1 ], DirTimes^ [ i ],
                                              ( DirCount - i ) * SizeOf ( TLZCount ) );
                        DirArray^ [ DirCount ] := NIL;
                        Dec ( DirCount );
                      END
                    ELSE
                      BEGIN
                        Inc ( Hed.Count );
                        WITH jr^ [ Hed.Count ]^ DO
                          BEGIN
                            IsBigDir  := TRUE;
                            BigDirID  := i;
                            BigTimes  := DirTimes^ [ i ];
{
  These two fields irrelevant for directories ...
}
                            BigSizes  := 0;
                            uBigSizes := 0;
{}
                            BigFileVersion := '-';
                            nS := RemoveBackSlash ( DirArray^ [ i ]^ );
                            BigNames := NewString ( nS );
                            BigCompressedType := Ord ( LZDir );
                            BigFileId := Hed.Count;
                          END;
                        Inc ( i )
                      END

                  UNTIL i > DirCount

                FINALLY
                  Dispose ( DirTimes )
                END;
{
  Find the parents for each directory ...
}
                DirCountEx := DirCount;
                FOR i := 1 TO DirCount DO
                  BEGIN
{
  Search for a hole in the directory structure ...
}
                    FoundName :=
                            ExtractFilePath ( RemoveBackSlash ( DirArray^ [ i ]^ ) );
                    PIndex := GetDirIndex ( FoundName, DirArray, DirCountEx );
{
  If such a hole exists, we must store headers for all the missing
  directories between Path and FoundName WORKING FORWARDS, or we'll
  give some of the directories the wrong parents ...
}
                    IF PIndex < 0 THEN
                      BEGIN
                        PIndex := 0;
                        s1 := Path;
                        REPEAT
                          s1 := FirstDirectoryBetween ( s1, FoundName );
                          NewPIndex := GetDirIndex ( s1, DirArray, DirCountEx );
                          IF NewPIndex < 0 THEN
                            BEGIN
{
  Do we have room for another directory ... ?
}
                            {$IFDEF Debug}
                              IF DirCountEx > MaxChiefLZDirectories THEN
                                RAISE EChiefLZDebug.Create ( 'Too many ChiefLZ directories.' );
                            {$ENDIF}
                              IF DirCountEx >= MaxChiefLZDirectories THEN
                                Break;

                              inc ( DirCountEx );
                              DirArray^ [ DirCountEx ] := NewString ( s1 );
                              inc ( Hed.Count );
                              WITH jr^ [ Hed.Count ]^ DO
                                BEGIN
                                  nS := RemoveBackSlash ( s1 );
                                  BigNames := NewString ( nS );
                                  BigTimes := NulFileDate;
                                  IsBigDir := TRUE;
                                  BigDirID := DirCountEx;
                                  BigParentDir := PIndex;
{
  These fields irrelevant for directories ...
}
                                  BigSizes  := 0;
                                  uBigSizes := 0;
                                  BigfAttrs := FileGetAttr ( BigNames^ );
                                  BigCRCs   := 0;
                                  BigFileID := Hed.Count;
                                  BigFileVersion := '-';
                                  BigCompressedType := Ord ( LZDir );
                                END;
                              NewPIndex := DirCountEx
                            END;
                          PIndex := NewPIndex
                        UNTIL Length ( s1 ) = Length ( FoundName )
                      END; {PIndex < 0}
{
  Now we're sure it exists, store Parent-index for directory i ...
}
                    jr^ [ i ]^.BigParentDir := PIndex

                  END { 1 <= i <= DirCount }
              END; { LZRecurseDirs }
{
   Look through the directory list (only the ones with files in!) and
   create an archive of files from them. Note that DirArray^[0] is
   the Path directory ...
}
              FOR i := 0 TO DirCount
              DO BEGIN
                ll := FindFirst ( DirArray^ [ i ]^ + fSpecName, faFiles, Dir );
                IF ll = 0 THEN
                TRY { finally }
                    REPEAT
                    TRY
                      s1 := DirArray^ [ i ]^ + GetFoundFileName ( DirArray^ [ i ]^, Dir );
                    EXCEPT END;
                    {$IFDEF Debug}
                    { Did not put faDirectory in Attr mask, so
                      **shouldn't** see any directories ...   }
                      IF Dir.Attr AND faDirectory <> 0 THEN
                      BEGIN
                        RAISE EChiefLZDebug.Create ( 'Found directory when expecting file' );
                      END;
                    {$ENDIF}
{
  Check that we are not trying to archive the output file ...
}
                      IF AnsiCompareText ( s1, s2 ) <> 0
                      THEN BEGIN
                        {$IFDEF Debug}
                          IF Hed.Count > MaxChiefLZArchiveSize THEN
                            RAISE EChiefLZDebug.Create ( 'Max archive size exceeded.' );
                        {$ENDIF}
                          IF Hed.Count >= MaxChiefLZArchiveSize THEN
                            Break;
                          inc ( Hed.Count );
                          WITH jr^ [ Hed.Count ]^ DO
                            BEGIN
                              IsBigDir  := FALSE;
                              BigDirID  := i;
                              BigCompressed := TRUE;
                              uBigSizes := Dir.Size;
                              BigSizes  := Dir.Size;
                              BigTimes  := Dir.Time;
                              BigfAttrs := Dir.Attr;
                              BigNames  := NewString ( s1 );
                              BigFileVersion := GetFileVersion ( s1 );
                              BigCRCs   := GetFileCRC ( s1 );
                              BigFileID := Hed.Count;
                              BigCompressedType := Ord ( LZSS );
                            END;
                        END;
                    UNTIL FindNext ( Dir ) <> 0;
                  FINALLY
                    SysUtils.FindClose ( Dir );
                  END;
            END;  { for i }
            FINALLY
              FOR i := 1 TO DirCountEx
              DO DisposeString ( DirArray^ [ i ] );

              Dispose ( DirArray );
            END;
          END;

        Hed.Signature := MyLZSignature;

        {fix the header}
        LZHeader_Construct ( jr2, Hed.Count );

        TRY { finally }
          jr2^.Count := Hed.Count;

          { see if we want a password }
          DummifyHeaderReserved ( Hed.Reserved );
          { now check for password supply}
          IF Assigned ( SetPassWordFunc )
          THEN BEGIN
             IF SetPassWordFunc ( Hed ) = LZCode_NewPassWord THEN
              Hed.Reserved.N_OffSet := LZCode_WrongPassWord;
             jr2^.MainHeader.Reserved := Hed.Reserved;
          END;
          {-}
          PrestoChangoMagic := LZCode_Archiving;
          FOR i := 1 TO Hed.Count DO
          WITH jr2^.Files [ i ]^, jr^ [ i ]^
          DO BEGIN
                IsDir  := IsBigDir;
                DirID  := BigDirID;
                ParentDir := BigParentDir;
                Compressed := BigCompressed;
                Sizes  := BigSizes;
                uSizes := uBigSizes;
                Times  := BigTimes;
                fAttrs := BigfAttrs;
                CRCs   := BigCRCs;
                FileID := BigFileID ;
                CompressedType := BigCompressedType;
                FileVersion := BigFileVersion;
                NameLen := Length ( ExtractFileName ( BigNames^ ) );
                nS :=  ExtractFileName ( BigNames^ );
                jr2^.LZFileNames^ [i]  := NewString ( nS );
                {jr2^.LZFileNames^ [i]^  := ExtractFileName ( BigNames^ );}
          END; {with}

        {main the header info}
         WriteFileHeaders ( LZOutFile, jr2^, Hed, True );

        { report beginning of archive }
          IF Assigned ( aProc )
          THEN BEGIN
               FillChar ( RepRec, Sizeof ( RepRec ), #0 );
               WITH RepRec {send details of main archive header}
               DO BEGIN
                  fAttrs := jr2^.Count;    {important bit!!!!}
                  Names  := StrPas ( ArchName ); { - ditto -}
                  Sizes  := jr2^.mainheader.cSize;
                  uSizes := jr2^.mainheader.uSize;
                  CRCs   := jr2^.mainheader.fBlockLen;
                  CompressedTypes := 0;  { archiving code }
               END;  {with}
               aProc ( RepRec,  LZCode_CallBackStartArchive );
               FillChar ( RepRec, Sizeof ( RepRec ), #0 );
          END; {if assigned}

        { loop through each file }
          FOR i := 1 + DirCount TO Hed.Count DO
            WITH jr^ [ i ]^ DO
              BEGIN
                AssignFile ( LZInFile, BigNames^ );
                InitReportRec ( RepRec, jr^ [ i ]^ );
                BlankRec := RepRec;

                OldFMode := FileMode;
                FileMode := fmOpenRead {$ifndef Ver90}OR fmShareDenyWrite{$endif Ver90}; { D2 only allows 0 <= FileMode <= 2 }
              {$I-}                     { However, share access is FILE_SHARE_READ }
                Reset ( LZInFile, 1 );
                FileMode := OldFMode;
              {$I+}
                IF IOResult <> 0 THEN    { Exception block generates   }
                  WITH jr2^.Files [ i ]^ DO  { false compiler warning ...  }
                    BEGIN                { Handle error using IOResult }
                      Sizes  := 0;
                      uSizes := 0;
                      Compressed := FALSE;
                      Continue
                    END;

                TRY { finally }
               { report procedure }
                  inc ( Result );
                  IF Assigned ( aProc )
                  THEN BEGIN {report beginning of each file}
                     aProc ( RepRec, LZCode_CallBackStartFile );
                  END; {if assigned}
                  LZReportProc := aProc;

                  bb := IsMyLZFile ( LZInFile, Hed2 );
                  WITH jr2^.Files [ i ]^ DO
                    IF ( bb )
                    OR ( IsChiefLZArchive ( Str2pChar ( BigNames^ ) ) > 0 )
                    OR ( Ord ( GetCompressionType ( BigNames^, StoreUnCompressed ) ) > 1 ) {other compressed file}
                    THEN
                 { Just copy (compressed) file into archive ... }
                      BEGIN
                        IF bb THEN Seek ( LZInfile, Sizeof ( Hed2 ) );
                        Sizes := MyFCopy ( LZInFile, LZOutFile,
                                         LZ_UNKNOWN_LENGTH, doReportOnRead );
                        IF bb THEN BEGIN
                           Sizes  := Hed2.cSize;
                           uSizes := Hed2.uSize;
                           Times  := Hed2.fTime;
                           CRCs   := Hed2.Crc;
                           fAttrs := Hed2.fAttr;
                           FileVersion := Hed2.Version;
                           CompressedType := Hed2.Comptype;
                           Compressed := True;
                        END ELSE BEGIN
                           fAttrs := FileGetAttr ( BigNames^ );
                           Compressed := FALSE;
                           CompressedType := Ord ( LZStored );
                        END;
                      END
                    ELSE BEGIN
                 { Compress the file into the archive ... }
                      IF CompMethod = LZMaxCompression
                      THEN CompressedType := Ord ( LH6 )
                      ELSE CompressedType := Ord ( LZSS );
                      Sizes := ArchiveSquash ( LZInFile, LZOutFile, aProc, CompMethod );
                      RepRec.Sizes := Sizes;
                      IF Sizes < 0 THEN BEGIN
                         LZHeader_Destroy ( jr2, Hed.Count );
                         FreeupArchiveFiles ( jr, MaxChiefLZArchiveSize );
                         LZDone;
                         CloseFile ( LZInFile );
                         CloseFile ( LZOutFile );
                         LZArchive := Sizes;
                         Exit;
                      END;
                    END;
                FINALLY
                  CloseFile ( LZInFile );

                  IF Assigned ( aProc ) THEN
                    BEGIN
                      RepRec.Names := '';
                      aProc ( RepRec, LZCode_CallBackEndFile )
                    END
                END
              END; { 1+DirCount <= i <= Count }

         {write reserved block at file end}
          WITH jr2^.MainHeader.Reserved DO BEGIN
               S_Code := Reserved_Code_s;
               N_Code := Reserved_Code_n;
               S_OffSet := ArchiveStartOffSet;
          END;
          BlockWrite ( LZOutFile, jr2^.MainHeader.Reserved, Sizeof ( jr2^.MainHeader.Reserved ) );
        { write header again }
          Seek ( LZOutFile, ArchiveStartOffSet );
          WriteFileHeaders ( LZOutFile, jr2^, Hed, True );

        { report end of archive }
        IF Assigned ( aProc )
        THEN BEGIN
          FillChar ( RepRec, Sizeof ( RepRec ), #0 );
          WITH RepRec, jr2^.MainHeader {send details of main archive header}
          DO BEGIN
             fAttrs := jr2^.Count;    {important bit!!!!}
             Names  := StrPas ( ArchName ); { - ditto -}
             Sizes  := jr2^.Mainheader.cSize;
             uSizes := jr2^.Mainheader.uSize;
             CRCs   := jr2^.Mainheader.fBlockLen;
          END;  {with}
          aProc ( RepRec,  LZCode_CallBackEndArchive );
        END; {if assigned}


        FINALLY
          LZHeader_Destroy ( jr2, Hed.Count );
        END

    FINALLY
      FreeupArchiveFiles ( jr, MaxChiefLZArchiveSize );
    END

  FINALLY
    CloseFile ( LZOutFile )
  END
  FINALLY
    LZDone;
  END;
  ResetPassWordFlag;
{$else Win32}

  {find path to add to filenames}
   Path := '';
   IF NOT UseFile THEN Path := ExtractFilePath ( s1 );

   IF Length ( Path ) = 0 THEN GetDir ( 0, Path );
   Path := AddBackSlash ( Uppercase ( Path ) );

   IF Length ( ExtractFilePath ( s2 ) ) = 0
     THEN Insert ( AddBackSlash ( GetCurrentDir ), s2, 1 );

   IF Length ( ExtractFilePath ( s1 ) ) = 0
     THEN Insert ( Path, s1, 1 );

   s2 := Uppercase ( s2 );
   {s1=filespec; s2=archive file}

   IF Uppercase ( s1 ) <> s2
   THEN BEGIN

   IF @WriteThunkFunc <> Nil THEN WriteThunkFunc ( s2, False ); { &&& }
   Assign ( LZOutFile, s2 );
   {$i-}
   IF ArchiveStartOffSet = 0
   THEN BEGIN
     Rewrite ( LZOutFile, 1 );
     IF IoResult <> 0 THEN BEGIN
        LZArchive := LZCode_CantCreateFile;
        LZDone;
        Exit;
     END;
   END
   ELSE BEGIN
      Reset ( LZOutFile, 1 );
      IF IoResult <> 0 THEN BEGIN
         LZArchive := LZCode_CantOpenFile;
         LZDone;
         Exit;
      END;
      Seek ( LZOutFile, ArchiveStartOffSet );
      IF IoResult <> 0 THEN BEGIN
         LZArchive := LZCode_GeneralErrorCode;
         LZDone;
         Exit;
      END;
  END; {if}
   {--}

  IF IOResult <> 0 THEN
     LZArchive := LZCode_WriteFailure {write error}
  ELSE BEGIN

   SetupArchiveFiles ( jr, MaxChiefLZArchiveSize );
   IF jr = NIL THEN
   {
     Error condition ... ???
   }
   ELSE BEGIN
   LZArchive := LZCode_NoFilesProcessed; {no file}
   Hed.Count := 0;
   DirCount  := 0;
   { report processing subdirectories }
   IF Assigned ( aProc )
   THEN BEGIN
        FillChar ( RepRec, Sizeof ( RepRec ), #0 );
        WITH RepRec {send archive name}
        DO BEGIN
           Names  := StrPas ( ArchName );
           fAttrs := - 1;
           Sizes  := - 1;
           uSizes := - 1;
           CRCs   := - 1;
        END;  {with}
        aProc ( RepRec,  LZCode_CallBackProcessingDirs );
        FillChar ( RepRec, Sizeof ( RepRec ), #0 );
   END;
   { end report: processing subdirectories }

  { get the file names for the archive }
   IF UseFile THEN BEGIN {using a LIST file}
      Assign ( t, s1 );
      Reset ( t );
      IF IOResult <> 0 THEN BEGIN
         LZArchive := LZCode_ListFileNotFound; {LIST file does not exist}
         FreeupArchiveFiles ( jr, MaxChiefLZArchiveSize );
         Close ( LZOutFile ); IF IOResult <> 0 THEN;
         LZDone;
         Exit
      END;
      WHILE NOT EOF ( t ) DO BEGIN
        Readln ( t, s1 );
        s1 := Uppercase ( s1 );
        IF ( IOResult = 0 ) AND ( Length ( s1 ) > 0 )
            AND ( s1 <> s2 )
            AND FileExists ( s1 ) THEN
          BEGIN
          {$IFDEF Debug}
            IF Hed.Count > MaxChiefLZArchiveSize THEN
              RunErrorMessage ( 'Max ChiefLZ archive size exceeded.' );
          {$ENDIF}
            IF Hed.Count >= MaxChiefLZArchiveSize THEN
              Break;
            inc ( Hed.Count );
            WITH jr^ [ Hed.Count ]^ DO
              BEGIN
                IsBigDir  := FALSE;
                BigDirID  := 0;
                BigCompressed := TRUE;
                uBigSizes := fSize ( s1 );
                BigTimes  := sfTime ( s1 );
                BigfAttrs := FileGetAttr ( Win16FThunker ( s1, True ) );
                BigCRCs   := GetFileCRC ( Win16FThunker ( s1, True ) );
                BigFileVersion := GetFileVersion ( Win16FThunker ( s1, True ) );
                BigFileID := Hed.Count;
                BigCompressedType := Ord ( LZSS );
                BigNames := NewString ( Win16FThunker ( s1, False ) ); { &&&}
              END
          END {s1<>s2}
      END; {while not eof(t)}

      Close ( t );
      IF IOResult <> 0 THEN;

      IF ( Hed.Count = 0 ) THEN BEGIN {no file}
         LZArchive := LZCode_NothinginListFile; {no valid file in LIST file}
         FreeupArchiveFiles ( jr, MaxChiefLZArchiveSize );
         Close ( LZOutFile ); IF IOResult <> 0 THEN;
         LZDone;
         Exit
      END;
   END { if usefile }
{
  We do not have a LIST file, so find fileSpecs ...
}
   ELSE BEGIN
       fSpecName := ExtractFileName ( s1 );
       New ( DirArray );
       IF DirArray <> NIL
       THEN BEGIN
         DirCountEx := 0;
         DirArray^ [ 0 ] := @Path;  { REMEMBER - Path is NOT on the Heap! }

         IF LZRecurseDirs <> LZNoRecurse THEN
{
  `Recurse' through subdirectories for files matching the given mask.
  There are 2 levels of recursion - full recursion and immediate-subdirs...
}
         BEGIN
           New ( DirTimes );
           IF DirTimes <> NIL THEN
           BEGIN
             i := 0;
             REPEAT
               IF LZRecurseDirs <> LZNoRecurse THEN
               BEGIN
             {$ifdef Delphi}
               IF FindFirst ( DirArray^ [ i ]^ + '*.*', faDirs, Dir ) = 0 THEN
               BEGIN
             {$else}
             {$ifdef Windows}
               Temp := DirArray^ [ i ]^ + '*.*';
               FindFirst ( Str2PChar ( Temp ), faDirs, Dir );
             {$else Windows}
               FindFirst ( DirArray^ [ i ]^ + '*.*', faDirs, Dir );
             {$endif Windows}
               IF DosError = 0 THEN
             {$endif}
               REPEAT
               {$ifdef TPW}
                 FoundName := StrPas ( Dir.Name );
               {$endif TPW}
                 IF ( Dir.Attr AND {$ifdef Windows} faDirectory{$else}Directory{$endif} <> 0 )
                 AND
                  {$ifdef TPW}
                    ( FoundName <> '.' ) AND ( FoundName <> '..' )
                  {$else TPW}
                    ( Dir.Name <> '.' ) AND ( Dir.Name <> '..' )
                  {$Endif TPW}
                 THEN BEGIN
                 {$IFDEF Debug}
                   IF DirCount > MaxChiefLZDirectories THEN
                     RunErrorMessage ( 'DirArray^ bounds exceeded.' );
                 {$ENDIF}
                   IF DirCount >= MaxChiefLZDirectories THEN break;

                   inc ( DirCount );
                   DirTimes^ [ DirCount ] := Dir.Time;

                   {$ifdef TPW}
                   DirArray^ [ DirCount ] :=
                   NewString ( DirArray^ [ i ]^ + Win16FThunker ( FoundName, False ) + '\' ); { &&& }
                   {$else TPW}
                   DirArray^ [ DirCount ] :=
                   NewString ( DirArray^ [ i ]^ + Win16FThunker ( Dir.Name, False )  + '\' ); { &&& }
                   {$endif TPW}

                   IF DirArray^ [ DirCount ] = NIL THEN {Error condition ...}
                   ELSE BEGIN
                       { change to long filenames }
                        Temp := Win16FThunker ( DirArray^ [dircount]^, False ); { &&& }
                        DisposeString ( DirArray^ [DirCount] );  { &&& }
                        DirArray^ [DirCount] := NewString ( AddBackSlash ( Temp ) ); { &&& }
                   END;

                 END;
              {$ifdef Delphi}
               UNTIL FindNext ( Dir ) <> 0;
               SysUtils.FindClose ( Dir )
               END;
             {$else Delphi}
               FindNext ( Dir )
               UNTIL DosError <> 0;
             {$endif Delphi}
               END;

               IF i = 0 THEN BEGIN
                   Inc ( i );
{
            Turn directory-recursion off - have only looked in
            immediate subdirectories ...
}
                   IF LZRecurseDirs = LZRecurseOnce THEN Dec ( LZRecurseDirs )
               END
               ELSE
               IF  ( NOT IsFileInDir ( DirArray^ [ i ]^ + fSpecName ) ) {directory has no matching file }
               AND ( fSpecName <> '*.*' )  { allow empty directories with "*.*" }
               THEN BEGIN
                   DisposeString ( DirArray^ [ i ] );
                   Move ( DirArray^ [ i + 1 ], DirArray^ [ i ],
                                              ( DirCount - i ) * SizeOf ( PLZString ) );
                   Move ( DirTimes^ [ i + 1 ], DirTimes^ [ i ],
                                              ( DirCount - i ) * SizeOf ( TLZCount ) );
                   DirArray^ [ DirCount ] := NIL;
                   Dec ( DirCount )
                 END

               ELSE
                 BEGIN
                   Inc ( Hed.Count );
                   WITH jr^ [ Hed.Count ]^ DO
                     BEGIN
                       IsBigDir  := TRUE;
                       BigDirID  := i;
                       BigCompressed := FALSE;
                       uBigSizes := 0;
                       BigSizes  := 0;
                       BigCRCs   := 0;
                       BigTimes  := DirTimes^ [ i ];
                       BigFileVersion := '-';
                       nS := RemoveBackSlash ( DirArray^ [ i ]^ );
                       BigNames  := NewString ( nS );
                       BigfAttrs  := FileGetAttr ( Win16FThunker ( BigNames^, True ) );
                       BigFileID  := Hed.Count;
                       BigCompressedType := Ord ( LZDIR );
                     END;
                   Inc ( i )
                 END;

             UNTIL i > DirCount;

             Dispose ( DirTimes )
           END; {DirTimes <> nil}
{
  Find the parents for each directory ...
}
         DirCountEx := DirCount;
         FOR i := 1 TO DirCount DO
           BEGIN
{
  Search for a hole in the directory structure ...
}
             FoundName := ExtractFilePath ( RemoveBackSlash ( DirArray^ [ i ]^ ) );
             PIndex := GetDirIndex ( FoundName, DirArray, DirCountEx );
{
  If such a hole exists, we must store headers for all the missing
  directories between Path and FoundName WORKING FORWARDS, or we'll
  give some of the directories the wrong parents ...
}
             IF PIndex < 0 THEN
               BEGIN
                 PIndex := 0;
                 s1 := Path;
                 REPEAT
                   s1 := FirstDirectoryBetween ( s1, FoundName );

                   NewPIndex := GetDirIndex ( s1, DirArray, DirCountEx );
                   IF NewPIndex < 0 THEN
                     BEGIN
{
  Do we have room for another directory ... ?
}
                     {$IFDEF Debug}
                       IF DirCountEx > MaxChiefLZDirectories THEN
                         RunErrorMessage ( 'Too many ChiefLZ directories.' );
                     {$ENDIF}
                       IF DirCountEx >= MaxChiefLZDirectories THEN
                         Break;

                       inc ( DirCountEx );
                       DirArray^ [ DirCountEx ] := NewString ( s1 );
                       inc ( Hed.Count );
                       WITH jr^ [ Hed.Count ]^ DO
                         BEGIN
                           nS := RemoveBackSlash ( s1 );
                           BigNames := NewString ( nS );
                           BigfAttrs := FileGetAttr ( Win16FThunker ( BigNames^, True ) );
                           BigCRCs   := 0;
                           BigTimes  := NulFileDate;
                           IsBigDir  := TRUE;
                           BigDirID  := DirCountEx;
                           BigParentDir := PIndex;
                           BigSizes  := 0;
                           uBigSizes := 0;
                           BigFileVersion := '-';
                           BigFileID := Hed.Count;
                           BigCompressedType := Ord ( LZDir );
                         END;
                       NewPIndex := DirCountEx
                     END;
                   PIndex := NewPIndex
                 UNTIL Length ( s1 ) = Length ( FoundName )
               END; { PIndex < 0 }
{
  Now we're sure it exists, store Parent-index for directory i ...
}
             jr^ [ i ]^.BigParentDir := PIndex

           END { 1 <= i <= DirCount }

         END; { LZRecurseDirs }
{
  Look through the directory list and create an archive of files from them...
  Note that DirArray[0]^ is the Path directory ...
}
         FOR i := 0 TO DirCount
         DO BEGIN
            Temp := DirArray^ [i]^ + fSpecName;
            Temp := Win16FThunker ( Temp, True );

           {$ifdef Delphi}
             IF FindFirst ( Temp, faFiles, Dir ) = 0 THEN
           {$else Delphi}
           {$ifdef Windows}
             FindFirst ( Str2PChar ( Temp ), faFiles, Dir );
           {$else Windows}
             FindFirst ( Temp, faFiles, Dir );
           {$endif Windows}
             IF DosError = 0 THEN
           {$endif Delphi}

           REPEAT
           {$ifdef TPW}
             s1 := DirArray^ [ i ]^ + StrPas ( Dir.Name );
           {$else TPW}
             s1 := DirArray^ [ i ]^ + Dir.Name;
           {$endif TPW}

           {$IFDEF Debug}
           { Did not put faDirectory in Attr mask, so *shouldn't*
             see any directories ... }
             IF Dir.Attr AND {$ifdef Windows} faDirectory
                             {$else}          Directory
                             {$endif} <> 0 THEN
               RunErrorMessage ( 'Found directory when expecting file' );
           {$ENDIF}
{
  Check that we are not trying to archive the output file ...
}
             IF Uppercase ( s1 ) <> s2 THEN
             BEGIN
             {$IFDEF Debug}
               IF Hed.Count > MaxChiefLZArchiveSize THEN
                 RunErrorMessage ( 'Max archive size exceeded' );
             {$ENDIF}
               IF Hed.Count >= MaxChiefLZArchiveSize THEN
                 Break;
               inc ( Hed.Count );
               WITH jr^ [ Hed.Count ]^
               DO BEGIN
                   IsBigDir      := FALSE;
                   BigDirID      := i;
                   BigCompressed := TRUE;
                   uBigSizes     := Dir.Size;
                   BigSizes      := Dir.Size;
                   BigTimes      := Dir.Time;
                   BigfAttrs     := Dir.Attr;
                   BigCRCs       := GetFileCRC ( s1 );
                   BigFileID     := Hed.Count;
                   BigFileVersion := GetFileVersion ( s1 );
                   BigNames      := NewString ( Win16FThunker ( s1, false ) ); { &&&}
                   BigCompressedType := Ord ( LZSS );
                 END; { with jr^ }
             END; { if uppercase }
         {$ifdef Delphi}
           UNTIL FindNext ( Dir ) <> 0;
           SysUtils.FindClose ( Dir );
         {$else Delphi}
             FindNext ( Dir );
           UNTIL DosError <> 0;
         {$endif Delphi}
         END;

         FOR i := 1 TO DirCountEx DO
           DisposeString ( DirArray^ [ i ] );
         Dispose ( DirArray )

       END; { DirArray <> nil }
     END; { NOT UseFile }

   Hed.Signature := MyLZSignature;

   { fix the header }
   LZHeader_Construct ( jr2, Hed.Count );

   { see if we want a password }
   DummifyHeaderReserved ( Hed.Reserved );
   { now check for password supply}
   IF Assigned ( SetPassWordFunc )
   THEN BEGIN
        IF SetPassWordFunc ( Hed ) = LZCode_NewPassWord
          THEN Hed.Reserved.N_OffSet := LZCode_WrongPassWord;
        jr2^.MainHeader.Reserved := Hed.Reserved;
   END;
   {-}
   jr2^.Count := Hed.Count;
   PrestoChangoMagic := LZCode_Archiving;
   FOR i := 1 TO Hed.Count DO
     WITH jr2^.Files [ i ]^, jr^ [ i ]^ DO
       BEGIN
         IsDir  := IsBigDir;
         DirID  := BigDirID;
         ParentDir := BigParentDir;
         Compressed := BigCompressed;
         Sizes  := BigSizes;
         uSizes := uBigSizes;
         Times  := BigTimes;
         fAttrs := BigfAttrs;
         CRCs   := BigCRCs;
         FileID := BigFileID ;
         CompressedType := BigCompressedType;
         FileVersion := BigFileVersion;
         NameLen := Length ( ExtractFileName ( BigNames^ ) );
         nS := ExtractFileName ( BigNames^ );
         jr2^.LZFileNames^ [i]  := NewString ( nS );
     END; { with jr2^.files }

  {write the header}
  IF WriteFileHeaders ( LZOutFile, jr2^, Hed, True ) <> 0
  THEN LZArchive := LZCode_HeaderWriteFailure {header write error}
  ELSE BEGIN

     { report start of archive}
     IF Assigned ( aProc )
     THEN BEGIN
          FillChar ( RepRec, Sizeof ( RepRec ), #0 );
          WITH RepRec {send details of main archive header}
          DO BEGIN
             fAttrs := jr2^.Count;    {important bit!!!!}
             Names  := StrPas ( ArchName ); { - ditto -}
             Sizes  := jr2^.Mainheader.cSize;
             uSizes := jr2^.Mainheader.uSize;
             CRCs   := jr2^.Mainheader.fBlockLen;
             CompressedTypes := 0;  { archiving code }
          END;  {with}
          aProc ( RepRec,  LZCode_CallBackStartArchive );
          FillChar ( RepRec, Sizeof ( RepRec ), #0 );
     END; {if assigned}

     LZArchive := LZCode_WriteFailure; {other write error}
     LZTot := 0;

  {loop through each file}
  FOR i := 1 + DirCount TO Hed.Count DO
    WITH jr^ [ i ]^ DO
      BEGIN
        InitReportRec ( RepRec, jr^ [ i ]^ );
        BlankRec := RepRec;

        Assign ( LZInFile, Win16FThunker ( BigNames^, true ) ); { &&&}
        OldFMode := FileMode;
{
  This choice of FileMode will cause Reset() to fail unless LZArchive
  has *EXCLUSIVE WRITE-ACCESS* to the file. This is what we want, as
  otherwise the file might change midway through the archive process.
}
        FileMode := ( fmOpenRead OR fmShareDenyWrite );
        Reset ( LZInFile, 1 );
        FileMode := OldFMode;
        IF IOResult <> 0 THEN
          WITH jr2^.Files [ i ]^ DO
            BEGIN                { Could not open file- insert nul }
              Sizes  := 0;       { entry into the LZ-Archive.      }
              uSizes := 0;
              Compressed := FALSE;
              Continue
            END;

       {report procedure }
        IF Assigned ( aProc )
        THEN BEGIN  {report start of each file}
           aProc ( RepRec, LZCode_CallBackStartFile );
        END; {if }
        inc ( LZTot );
        LZReportProc := aProc;

        bb := IsMyLZFile ( LZInfile , Hed2 );
        WITH jr2^.Files [ i ]^ DO
          BEGIN
            IF ( IsChiefLZArchive ( Str2PChar ( BigNames^ ) ) > 0 )
            OR ( bb )
            OR ( Ord ( GetCompressionType ( BigNames^, StoreUnCompressed ) ) > 1 ) {other compressed file}
            THEN BEGIN
                IF bb THEN Seek ( LZInfile, Sizeof ( Hed2 ) );
                l := MyFCopy ( LZInFile, LZOutFile,
                              LZ_UNKNOWN_LENGTH, doReportOnRead );
                IF bb THEN BEGIN
                    Sizes  := Hed2.cSize;
                    uSizes := Hed2.uSize;
                    Times  := Hed2.fTime;
                    CRCs   := Hed2.Crc;
                    fAttrs := Hed2.fAttr;
                    FileVersion := Hed2.Version;
                    CompressedType := Hed2.Comptype;
                    Compressed := True;
                END ELSE BEGIN
                    fAttrs := FileGetAttr ( BigNames^ );
                    Compressed := FALSE;
                    CompressedType := Ord ( LZStored );
                END;
              END
            ELSE BEGIN
                IF CompMethod = LZMaxCompression
                THEN CompressedType := Ord ( LH6 )
                ELSE CompressedType := Ord ( LZSS );
                l := ArchiveSquash ( LZInFile, LZOutFile, aProc, CompMethod );
                IF l < 0 THEN BEGIN
                   LZHeader_Destroy ( jr2, Hed.Count );
                   FreeupArchiveFiles ( jr, MaxChiefLZArchiveSize );
                   LZDone;
                   Close ( LZInFile );
                   Close ( LZOutFile );
                   LZArchive := l;
                   Exit;
                END;
                Sizes := l;
            END;
          END{with jr2^};

        Close ( LZInFile );IF IOResult <> 0 THEN;
        IF Assigned ( aPRoc ) THEN
          BEGIN
            RepRec.Names := '';
            RepRec.Sizes := l;
            aProc ( RepRec, LZCode_CallBackEndFile )
          END
      END; {With jr^, DirCount+1 <= i <= Count}

   LZArchive := LZTot;

   {write reserved block at file end}
     WITH jr2^.MainHeader.Reserved
     DO BEGIN
          S_Code    := Reserved_Code_s;
          N_Code    := Reserved_Code_n;
          S_OffSet := ArchiveStartOffSet;
     END;
     BlockWrite ( LZOutFile, jr2^.MainHeader.Reserved, Sizeof ( jr2^.MainHeader.Reserved ) );
   {rewrite header again}
     Seek ( LZOutFile, ArchiveStartOffSet );
     WriteFileHeaders ( LZOutFile, jr2^, Hed, True );

     { report end of archive }
     IF Assigned ( aProc )
     THEN BEGIN
          FillChar ( RepRec, Sizeof ( RepRec ), #0 );
          WITH RepRec, jr2^.MainHeader {send details of main archive header}
          DO BEGIN
             fAttrs := jr2^.Count;    {important bit!!!!}
             Names  := StrPas ( ArchName ); { - ditto -}
             Sizes  := jr2^.Mainheader.cSize;
             uSizes := jr2^.Mainheader.uSize;
             CRCs   := jr2^.Mainheader.fBlockLen;
          END;  {with}
          aProc ( RepRec,  LZCode_CallBackEndArchive );
     END; {if assigned}

   END;

   LZHeader_Destroy ( jr2, Hed.Count );
   FreeupArchiveFiles ( jr, MaxChiefLZArchiveSize );
   END; { jr <> nil }

   Close ( LZOutFile );IF IOResult <> 0 THEN;
   END; { IOResult = 0 }
   END; { Uppercase(s1) = s2 }
   LZDone;
{$endif}
  ResetPassWordFlag;
END; { LZArchive }
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
FUNCTION LZDearchive_ ( ArchName : PChar; aDefDir : PChar;
                     LZQuestion : TLZQuestionFunc;
                     aProc :      TLZReportProc;
                     aRename :    TLZRenameFunc;
                     RecurseDirs,
                     ExtractAsCompressed : Boolean
                      ) : TLZCount;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
{
  Local function to determine user's request ...
}
FUNCTION UserRequestsRename ( VAR FName : TLZString ) : boolean;
VAR
  Path,
  TempName : TLZString;
{$ifndef Delphi}
  Result :   boolean;
{$endif}
BEGIN
  IF NOT Assigned ( aRename ) THEN
    UserRequestsRename := FALSE
  ELSE
    BEGIN
      TempName := FName;
      Path := ExtractFilePath ( TempName );
      REPEAT
        Result := aRename ( TempName );
        IF NOT Result THEN
        {$ifdef Delphi}
          Exit;
        {$else}
          BEGIN
            UserRequestsRename := FALSE;
            Exit
          END;
        {$endif}
         IF Length ( ExtractFilePath ( TempName ) ) = 0 THEN
           Insert ( Path, TempName, 1 )
       {$ifdef Delphi}
         ELSE
           TempName := ExpandFileName ( TempName )
       {$endif}
      UNTIL NOT FileExists ( TempName );
      FName := TempName;
    {$ifndef Delphi}
      UserRequestsRename := Result
    {$endif}
    END
END;

VAR
SrcFile,
DestFile : file;
TempFile : file;

RealNum,
LZFilePos : TLZCount;
f         : TLZHeader;
DestRec,
RepRec    : TLZReportRec;
Hed       : TLZArchiveHeader;
i         : Integer;
OldFMode  : byte;

{$ifndef Win32}
BRead   : TLZSSWord;
Total   : TLZCount;
{$endif Win32}
TempName,
DefDir, Source : TLZString;

DirArray : PLZDirArray;
RetValue : TLZCount;
DirCount : Integer;
PathToSend : TLZString;
{Spanned,}
OnlyCopyFromArchive,
DearchiveRecursion,
SingleFile,
Safe : Boolean;
nS : TLZString;
BEGIN
   {$ifdef Shared_Buffers}
   IF IsLZInitialized
   THEN BEGIN
      LZDearchive_ := LZCode_BusyDLL; {busy}
      Exit
   END;
   {$endif Shared_Buffers}

   IF NOT FileExists ( StrPas ( ArchName ) ) THEN
   BEGIN
       LZDearchive_ := LZCode_ArchiveNotFound; {no archive}
       Exit
   END;

   IF IsChiefLZArchiveEx ( ArchName, Hed ) < 1 THEN
   BEGIN
       LZDearchive_ := LZCode_NotLZArchive; {bad archive}
       Exit
   END;

   RealNum := 0;
   DirCount := 0;
   SingleFile := Copy ( fDecompressMask, 1, 2 ) = '#:';
   DearchiveRecursion := RecurseDirs;
   OnlyCopyFromArchive := ExtractAsCompressed;
   DefDir := StrPas ( aDefDir );

   {$ifdef Win32}
   ResetPassWordFlag;

   {target directory}
   IF Length ( Trim ( DefDir ) ) = 0 THEN GetDir ( 0, DefDir )  // This directory MUST exist!
   ELSE BEGIN
       DefDir := ExpandFileName ( DefDir );
       IF not DirectoryExists ( DefDir )
       THEN IF CreatePath ( DefDir ) < 1
       THEN BEGIN
         ResetPassWordFlag;
         PrestoChangoMagic := - 1;
         LZDearchive_ := LZCode_BadTargetDirectory; {bad directory}
         Exit;
       END;
   END;

   DefDir := AddBackSlash ( DefDir );
   PathToSend := DefDir;

   {source file}
   Source := ExpandFileName ( StrPas ( ArchName ) );

   AssignFile ( SrcFile, Source );
   OldFMode := FileMode;
   FileMode := fmOpenRead {$ifndef Ver90}OR fmShareDenyWrite{$endif Ver90}; { D2 only allows 0 <= FileMode <= 2 }
   Reset ( SrcFile, 1 );      { However, share access is FILE_SHARE_READ }
   FileMode := OldFMode;
   TRY { finally }
     Seek ( SrcFile, Hed.Reserved.S_OffSet + SizeOf ( Hed ) );
     SetupArchiveFiles ( jr, Hed.Count );

     TRY { except }
       TRY { finally }
         LZHeader_Construct ( jr2, Hed.Count );
         TRY { finally }
         jr2^.Count := Hed.Count;
         IF ReadFileHeaders ( srcfile, jr2^, Hed ) <> 0
         THEN BEGIN
              ResetPassWordFlag;
              LZHeader_Destroy ( jr2, Hed.Count );
              LZDearchive_ := LZCode_BadHeaderCRC;
              FreeupArchiveFiles ( jr, Hed.Count );
              Exit;
         END;

         New ( DirArray );

         TRY { finally }

             { report beginning of archive }
             IF Assigned ( aProc )
             THEN BEGIN
               FillChar ( RepRec, Sizeof ( RepRec ), #0 );
               WITH RepRec {send details of main archive header}
               DO BEGIN
                  fAttrs := jr2^.Count;    {important bit!!!!}
                  Names  := Source;        { - ditto -}
                  Sizes  := jr2^.mainheader.cSize;
                  uSizes := jr2^.mainheader.uSize;
                  CRCs   := jr2^.mainheader.fBlockLen;
                  CompressedTypes := 1;  { de-archiving code }
               END;  {with}
               aProc ( RepRec,  LZCode_CallBackStartArchive );
               FillChar ( RepRec, Sizeof ( RepRec ), #0 );
             END; {if assigned}

             DirCount := 0;
             DirArray^ [ 0 ] := @DefDir;
             TRY { except }
               FOR i := 1 TO Hed.Count DO
                 WITH jr^ [ i ]^, jr2^.Files [ i ]^ DO
                   BEGIN
{
  IMPORTANT POINT: This algorithm depends on having all of the directory entries
  listed BEFORE the file entries in the archive header ...
}
                     IF IsDir THEN
                       BEGIN
                         inc ( DirCount );
                         nS := DefDir + GetFullLZName ( jr2^, i );
                         BigNames := NewString ( nS );

                         IF NOT DearchiveRecursion THEN {dont create subdirectories}
                         ELSE BEGIN
                            IF CreatePath ( BigNames^ ) < 0
                            THEN BEGIN
                                 LZDearchive_ := LZCode_BadTargetDirectory;
                                 LZHeader_Destroy ( jr2, Hed.Count );
                                 FreeupArchiveFiles ( jr, Hed.Count );
                                 FOR i := 1 TO DirCount DO DisposeString ( DirArray^ [i] );
                                 Dispose ( DirArray );
                                 CloseFile ( SrcFile );
                                 Exit;
                            END;

                           { report directory creation using archive entry info }
                            IF Assigned ( aProc ) THEN
                             BEGIN
                                InitReportRec ( RepRec, jr^ [ i ]^ );
                                aProc ( RepRec, LZCode_CallBackStartDirectory );
                                RepRec.Names := '';
                                aProc ( RepRec, LZCode_CallBackEndDirectory )
                             END;
                          END; {if not}

                         DirArray^ [ i ] := NewString ( BigNames^ + '\' );
                       END
                     ELSE BEGIN
                        IF NOT DearchiveRecursion
                        THEN BEGIN
                           nS := DefDir + jr2^.LZFileNames^ [i]^
                        END
                        ELSE BEGIN
                           nS := DirArray^ [DirID]^ + jr2^.LZFileNames^ [i]^;
                        END;
                        BigNames := NewString ( nS );
                     END;

                     IsBigDir  := IsDir;
                     BigDirID  := DirID;
                     BigParentDir := ParentDir;
                     BigCompressed := Compressed;
                     BigSizes  := Sizes;
                     uBigSizes := uSizes;
                     BigTimes  := Times;
                     BigfAttrs := fAttrs;
                     BigCRCs   := CRCs;
                     BigFileVersion := FileVersion;
                     BigFileID := FileID;
                     BigCompressedType := CompressedType;
                   END {with jr^}
             EXCEPT
               on EInOutError DO
                 RaiseErrorStr ( EChiefLZArchive, SBadDirectory, DirArray^ [ DirCount ]^ )
             END

           FINALLY
             FOR i := 1 TO DirCount DO DisposeString ( DirArray^ [i] );
             Dispose ( DirArray )
           END
         FINALLY
         END;

         New ( Buf );
         TRY { finally }
           LZFilePos := FilePos ( SrcFile );

         { temp file }
           TempName := GetTempChiefFileName; { This call CREATES a file on disc ... }
           AssignFile ( TempFile, TempName );   { ... and this links the file to a Pascal var }
{
   If premature EOF, archive is corrupt... This will trigger
   an exception - handled (and re-raised) below.
}
           FOR i := 1 + DirCount TO Hed.Count
           DO BEGIN
           IF ( ( NOT SingleFile ) AND  ( jr^ [i]^.BigfAttrs OR faComment = faComment ) ) { comment file = ignore }
           OR ( NOT FileMatchFunc ( Str2pChar ( fDecompressMask ), Str2pChar ( jr^ [i]^.BigNames^ ), i ) )
           THEN BEGIN
              inc ( LZFilePos, jr^ [ i ]^.BigSizes );
              Seek ( SrcFile, LZFilePos )
           END
           ELSE WITH jr^ [ i ]^ DO
             BEGIN {normal file - try to extract}
                 Inc ( RealNum );
                 InitReportRec ( RepRec, jr^ [ i ]^ ); {stuff inside the archive}
                 BlankRec := RepRec;
{
  This file was STORED compressed; just copy it out ...
}
                 IF NOT BigCompressed
                 THEN BEGIN
                   Safe := False;
                   IF ( FileExists ( BigNames^ ) )
                    AND ( Assigned ( LZQuestion ) )
                     THEN GetChiefLZFileInfo ( Str2pChar ( BigNames^ ) , DestRec );
{
  ... ensuring this stored LZ file will not overwrite SrcFile ...
}
                     IF ( AnsiCompareText ( ArchName, BigNames^ ) <> 0 )
                     OR ( UserRequestsRename ( BigNames^ ) )
                     THEN BEGIN
{
  ...AND checking that the file doesn't already exist ...
}
                       IF ( FileExists ( BigNames^ ) )
                       THEN BEGIN
                       IF ( Assigned ( LZQuestion ) )
                       THEN
                       CASE LZQuestion ( RepRec, DestRec ) OF
                           LZQuit : BEGIN
                                     Dec ( RealNum );
                                     Break     { User requests Abort!! }
                                   END;
                           LZNo :  BEGIN
                                     IF Assigned ( aProc ) THEN  { &&& }
                                     aProc ( RepRec, LZCode_UserSkippedFile );
                                     Dec ( RealNum );
                                   END;
{
  Now the mundane matters - copy out the stored file ...
}
                           LZYes : Safe := TRUE;
                       END; { Case }
                     END { FileExists }
                     ELSE Safe := TRUE;

                     IF Safe
                     THEN BEGIN
                          AssignFile ( DestFile, BigNames^ );
                          DeleteaFile ( BigNames^ );  { if copy exists, delete it }
                          Rewrite ( DestFile, 1 );
                          TRY { finally }
                               IF Assigned ( aProc ) THEN
                               aProc ( RepRec, LZCode_CallBackStartFile );
                               LZReportProc := aProc;
                               MyFCopy ( SrcFile, DestFile, BigSizes, doReportOnWrite );
                               FileSetDate ( TFileRec ( DestFile ) .Handle, RepRec.Times );
                          FINALLY
                               CloseFile ( DestFile );
                               FileSetAttr ( BigNames^, RepRec.faTTrs );
                               IF Assigned ( aProc ) THEN aProc ( RepRec, LZCode_CallBackEndFile )
                          END;
                      END;  { Safe }
                    END; { AnsiCompareText }
                  END { Not BigCompressed }
{
  This file was compressed into the archive- it needs expanding ...
}
                 ELSE
                   BEGIN
                     Rewrite ( TempFile, 1 );  // ( Re? ) open the temp file ... ( wiping contents )
                     TRY { finally }
                      { write header ... }
                       WITH f DO
                         BEGIN
                           Signature := ChiefLZSig;
                           fName     := ExtractFileName ( BigNames^ );
                           uSize     := uBigSizes;
                           cSize     := BigSizes;
                           fTime     := BigTimes;
                           fAttr     := BigfAttrs;
                           CRC       := BigCRCs;
                           Version   := BigFileVersion;
                           ID        := BigFileID;
                           CompType  := BigCompressedType;
                         END;
                       BlockWrite ( TempFile, f, SizeOf ( f ) );
                       LZReportProc := NIL;
                       MyFCopy ( SrcFile, TempFile, BigSizes, doReportOnWrite )

                     FINALLY
                       CloseFile ( TempFile )
                     END;

                  IF OnlyCopyFromArchive { dont decompress; just rename}
                  THEN BEGIN
                      DeleteaFile ( BigNames^ );
                      RenameaFile ( TempName, BigNames^ );
                  END
                  ELSE BEGIN
                   { decompress the temporary file ... }
                     TRY
                       RetValue := LZDecompress ( Str2PChar ( TempName ), Str2PChar ( BigNames^ ), LZQuestion, aProc );
                       IF RetValue = LZCode_UserAborted  { abort }
                       THEN BEGIN
                          Dec ( RealNum );
                          Break
                       END ELSE
                       IF RetValue = LZCode_UserSkippedFile  { LZNo }
                       THEN BEGIN
                          IF Assigned ( aProc ) THEN  { &&& }
                          aProc ( RepRec, LZCode_UserSkippedFile );
                          Dec ( RealNum );
                       END;
                     EXCEPT
                       Dec ( RealNum );
                       Break
                     END; {TRY}
                  END;{if copyfrom}

                 END;
              { goto location of next file in archive ... }
                 inc ( LZFilePos, BigSizes );
                 Seek ( SrcFile, LZFilePos )
               END; { 1+DirCount <= i <= Count }
           END;
           TRY
            IF FileExists ( TempName ) THEN
            Erase ( TempFile )  // Delete the temporary file ...
           EXCEPT END;

         FINALLY
           Dispose ( Buf )
         END
       FINALLY
         FreeupArchiveFiles ( jr, Hed.Count );
       END
     EXCEPT
       on E : EInOutError DO  // Re - RAISE the exception AS something
         BEGIN               //   more obvious.
           IF E.ErrorCode = 100 THEN  // `Read beyond EOF'
             RaiseErrorStr(EChiefLZArchive,SCorruptArchive, Source);
           raise             // Different IO-Error, so re-raise it to next handler
         end
     end
   finally
     CloseFile(SrcFile);
   end;
   LZDearchive_ := RealNum;
   ResetPassWordFlag;
{$else Win32}
   {target directory}
   DefDir := StrPas(aDefDir);
   if Length(DefDir) = 0 then GetDir(0, DefDir) { This directory MUST exist! }
   else
   if not DirectoryExists(DefDir)
   then begin
       If @WriteThunkFunc <> Nil then WriteThunkFunc(DefDir, True);
       if not DirectoryExists(DefDir)
       then if CreatePath(DefDir) < 1
       then begin
         ResetPassWordFlag;
         PrestoChangoMagic := -1;
         LZDearchive_ := LZCode_BadTargetDirectory; {bad directory}
         Exit;
       end;
     end;

   DefDir := AddBackSlash(DefDir);
   TempName := StrPas(ArchName);
   Source := ExtractFilePath(TempName);
   TempName := ExtractFileName(TempName);
   if Length(Source)=0 then GetDir(0, Source);
   Source := AddBackSlash(Source) + TempName;

   LZDearchive_ := LZCode_CantOpenFile; {open error}
   Assign(SrcFile, Source);
   OldFMode := FileMode;
{
  Open archive file: we require Read-access, don't need Write - access,
  AND * INSIST * that no one ELSE can write TO it ( i.e. corrupt it )
  UNTIL we're done ...
}
   FileMode := (fmOpenRead or fmShareDenyWrite);
   Reset(SrcFile, 1);
   FileMode := OldFMode;
   If IOResult = 0 then
   begin

   LZDearchive_ := LZCode_CantReadFile; {read error}
   Seek ( SrcFile, Hed.Reserved.S_OffSet + SizeOf(Hed) );
   if IOResult = 0 then
   begin
    SetupArchiveFiles(jr, Hed.Count );
    if jr = nil then
{
  Error condition ...
}
   else begin
     LZHeader_Construct(jr2, Hed.Count);
   if jr2 <> nil then
     begin

   {error reading header}
   jr2^.Count := Hed.Count;
   If ReadFileHeaders(srcfile, jr2^, Hed) <> 0
   then begin
     LZDearchive_ := LZCode_BadHeaderCRC;
     Close(SrcFile);
     LZHeader_Destroy(jr2, Hed.Count);
     FreeupArchiveFiles(jr, Hed.Count);
     ResetPassWordFlag;
     Exit;
   end;

  DirCount := 0;
  New(DirArray);
  if DirArray <>
  nil then
  begin
     { report beginning of archive }
      IF Assigned ( aProc )
      THEN BEGIN
           FillChar(RepRec, Sizeof(RepRec), #0);
           With RepRec {send details of main archive header}
           do begin
              fAttrs := jr2^.Count;    {important bit!!!!}
              Names  := StrPas(ArchName); { - ditto -}
              Sizes  := jr2^.mainheader.cSize;
              uSizes := jr2^.mainheader.uSize;
              CRCs   := jr2^.mainheader.fBlockLen;
              CompressedTypes := 1;  { de-archiving code }
           end;  {with}
           aProc ( RepRec,  LZCode_CallBackStartArchive);
           FillChar(RepRec, Sizeof(RepRec), #0);
      END; {if assigned}

    DirArray^[0] := @DefDir; { This string is NOT on the heap!!! }

    for i := 1 to Hed.Count do
      with jr^[i]^, jr2^.Files[i]^ do
        begin

          if IsDir then
            begin
              Inc(DirCount);
              nS := DefDir + GetFullLZName(jr2^,i);
              BigNames:= NewString(nS);
              DirArray^[i] := NewString(BigNames^+'\');
            end
          else begin
            If NOT DearchiveRecursion
               then nS := DefDir+jr2^.LZFileNames^[i]^
                 else nS := DirArray^[DirID]^ + jr2^.LZFileNames^[i]^;
            BigNames:= NewString(nS);
          end;

          IsBigDir  := IsDir;
          BigDirId  := DirID;
          BigParentDir := ParentDir;
          BigCompressed := Compressed;
          BigSizes  := Sizes;
          uBigSizes := uSizes;
          BigTimes  := Times;
          BigfAttrs := fAttrs;
          BigCRCs   := CRCs;
          BigFileVersion := FileVersion;
          BigFileID := FileID;
          BigCompressedType := CompressedType;
        end{with jr^[i]};

     for i := 1 to DirCount do DisposeString(DirArray^[i]);
     Dispose(DirArray);

    end; {DirArray<>nil}
  end; {jr2<>nil}
{
  This code placed here to help reduce the amount of clean-up that must be
  done in case of an error.
}
    If NOT DearchiveRecursion then {don't create directory tree}
    ELSE
    FOR i := 1 TO DirCount
    DO BEGIN
      IF CreatePath ( jr^ [i]^.BigNames^ ) < 0
      THEN BEGIN
          LZDearchive_ := LZCode_BadTargetDirectory;
          LZHeader_Destroy ( jr2, Hed.Count );
          FreeupArchiveFiles ( jr, Hed.Count );
          Close ( SrcFile );
          Exit
      END;

      IF Assigned ( aProc ) THEN
      { report directory-creation using archive-entry information }
        BEGIN
          InitReportRec ( RepRec, jr^ [i]^ );
          aProc ( RepRec, LZCode_CallBackStartDirectory );
          RepRec.Names := '';
          aProc ( RepRec, LZCode_CallBackEndDirectory )
        END
    END;{for i}

  LZFilePos := FilePos ( SrcFile );
  New ( Buf );
  IF Buf = nil THEN
  {
     Error condition ...???
  }
  ELSE BEGIN

  {error processing file}
    LZDearchive_ := LZCode_NoFilesProcessed;

    {temp file}
    TempName := Win16FThunker ( DefDir, True );

    IF NOT GetTempChiefFileName ( Str2PChar ( TempName ) )
    THEN TempName := DefDir + 'CHF$$$.$$$'
    ELSE TempName [0] := chr ( StrLen ( @TempName [1] ) ); { adjust length byte }

    Assign ( TempFile, TempName );

    FOR i := DirCount + 1 TO Hed.Count DO
    IF ( ( NOT SingleFile ) AND  ( jr^ [i]^.BigfAttrs OR faComment = faComment ) ) { comment file = ignore }
    OR ( NOT FileMatchFunc ( Str2pChar ( fDecompressMask ), Str2pChar ( jr^ [i]^.BigNames^ ), i ) )
    THEN BEGIN
       inc ( LZFilePos, jr^ [ i ]^.BigSizes );
       Seek ( SrcFile, LZFilePos );
    END
    ELSE
    WITH jr^ [i]^ DO
    BEGIN {normal file - try to extract}
        Inc ( RealNum );
        InitReportRec ( RepRec, jr^ [i]^ ); { stuff inside the archive }
        BlankRec := RepRec;
{
  This file was STORED compressed; just copy it out ...
}
        IF NOT BigCompressed
        THEN BEGIN
           Safe := FALSE;
           IF ( FileExists ( BigNames^ ) )
             AND ( Assigned ( LZQuestion ) )
              THEN GetChiefLZFileInfo ( Str2pChar ( BigNames^ ) , DestRec );
{
  ... ensuring this stored LZ file will not overwrite SrcFile ...
}
          IF ( Uppercase ( Source ) <> Uppercase ( BigNames^ ) ) OR
             ( UserRequestsRename ( BigNames^ ) ) THEN
          BEGIN
{
  ...AND checking that the file doesn't already exist ...
}

             IF ( FileExists ( BigNames^ ) )
             THEN BEGIN
              IF ( Assigned ( LZQuestion ) ) THEN
              CASE LZQuestion ( RepRec, DestRec ) OF
                 LZQuit :
                       BEGIN
                          Dec ( RealNum ); { User requested Abort! }
                          Break
                       END;
                  LZNo :
                       BEGIN
                            IF Assigned ( aProc ) THEN  { &&& }
                            aProc ( RepRec, LZCode_UserSkippedFile );
                            Dec ( RealNum );
                       END;
                  LZYes : Safe := TRUE;
                 END { Case }
             END  { If FileExists }
             ELSE Safe := True;

             IF Safe
             THEN BEGIN
                    nS := BigNames^;
                    IF @WriteThunkFunc <> Nil THEN WriteThunkFunc ( nS, False );
                    DeleteaFile ( nS );  { If old file exists, delete it &&& }
                    Assign ( DestFile, nS );
                    Rewrite ( DestFile, 1 );
                    IF IOResult = 0
                    THEN BEGIN
                       LZReportProc := aProc;
                       IF Assigned ( aProc ) THEN aProc ( RepRec, LZCode_CallBackStartFile );
                       MyFCopy ( SrcFile, DestFile, BigSizes, doReportOnWrite );
                       { set date/time stamp }
                       {$ifdef Delphi}
                       FileSetDate ( TFileRec ( DestFile ) .Handle, RepRec.Times );
                       {$else}
                       SetFTime ( DestFile, RepRec.Times );
                       {$endif Delphi}
                       Close ( DestFile );
                       IF IOResult <> 0 THEN;

                       FileSetAttr ( nS, RepRec.faTTrs );

                       IF Assigned ( aProc )
                       THEN BEGIN
                            RepRec.Names := '';
                            aProc ( RepRec, LZCode_CallBackEndFile )
                       END;  {Assigned}
                    END; { IoResult }
               END; { If Safe }
          END;
        END { not BigCompressed }
      ELSE BEGIN {* Is compressed ... *}

      Rewrite ( TempFile, 1 );
      IF IOResult <> 0 THEN BEGIN
        LZDearchive_ := LZCode_CantWriteTempFile; {big error}
        Break
      END;

    {write header}
      WITH f DO BEGIN
        fName     := ExtractFileName ( BigNames^ );
        Signature := ChiefLZSig;
        uSize     := uBigSizes;
        cSize     := BigSizes;
        fTime     := BigTimes;
        fAttr     := BigfAttrs;
        CRC       := BigCRCs;
        Version   := BigFileVersion;
        ID        := BigFileID;
        CompType  := BigCompressedType;
      END;

      BlockWrite ( TempFile, f, SizeOf ( f ) ); {write header}
      IF IOResult <> 0 THEN BEGIN
        Close ( TempFile );
        Break
      END;

      Total := 0;
      REPEAT
        BRead := Min ( BigSizes - Total, SizeOf ( Buf^ ) );
   { If the file is shorter than it should be, IO-Error }
        BlockRead ( SrcFile, Buf^, BRead );
        IF IOResult = 0 THEN
          BEGIN
   { If the output disc runs out of space, IO-Error }
            BlockWrite ( TempFile, Buf^, BRead );
            IF IOResult = 0 THEN
              BEGIN
                inc ( Total, BRead );
                Continue
              END
          END;
   { Error-handling: clean-up code ... }
        Close ( TempFile ); IF IOResult <> 0 THEN;
        Close ( SrcFile );
        LZHeader_Destroy ( jr2, Hed.Count );
        FreeupArchiveFiles ( jr, Hed.Count );
        Dispose ( Buf );
        ResetPassWordFlag;
        Exit
      UNTIL ( Total >= BigSizes );

      Close ( TempFile ); IF IOResult <> 0 THEN;

      IF OnlyCopyFromArchive { dont decompress; just rename}
      THEN BEGIN
           DeleteaFile ( BigNames^ );
           RenameaFile ( TempName, BigNames^ );
      END
      ELSE BEGIN
    {decompress the temporary file}
        RetValue := LZDecompress ( Str2PChar ( TempName ), Str2PChar ( BigNames^ ),
                                 LZQuestion, aProc );
        IF RetValue = LZCode_UserAborted  { User requested Abort !! }
        THEN BEGIN
            Erase ( TempFile ); IF IOResult <> 0 THEN;
            Dec ( RealNum );
            Break
        END ELSE
        IF RetValue = LZCode_UserSkippedFile  { LZNo }
        THEN BEGIN
            Erase ( TempFile ); IF IOResult <> 0 THEN;
            IF Assigned ( aProc ) THEN  { &&& }
            aProc ( RepRec, LZCode_UserSkippedFile );
            Dec ( RealNum );
        END;{ if RetValue}
      END; {decompress}
    END;

    LZDearchive_ := RealNum;

    {goto location of next file in archive}
    Inc ( LZFilePos, BigSizes );
    Seek ( SrcFile, LZFilePos );
    IF IOResult <> 0 THEN
      Break;

    Erase ( TempFile );IF IOResult <> 0 THEN;

  END; { DirCount+1 <= i <= Count) }

  Dispose ( Buf );
  END; { Buf <> nil }

  FreeupArchiveFiles ( jr, Hed.Count );
  END; { jr <> nil ... }

  END; { IOResult = 0 after BlockRead(SrcFile,... }

  Close ( SrcFile ); { Reset() Ok; hence Close() must succeed. }

  END; { IOResult = 0 after Reset(SrcFile,1) }
{$endif}

 { report end of archive }     {haba!}
  IF Assigned ( aProc )
  THEN BEGIN
        FillChar ( RepRec, Sizeof ( RepRec ), #0 );
        WITH RepRec, jr2^.MainHeader {send details of main archive header}
        DO BEGIN
           fAttrs := RealNum;    {important bit!!!!}
           Names  := Strpas ( ArchName ); { - ditto -}
        END;  {with}
        aProc ( RepRec,  LZCode_CallBackEndArchive );
   END; {if assigned}

   LZHeader_Destroy ( jr2, Hed.Count );
   ResetPassWordFlag;
END;
{/////////////////////////////////////////////////////////}
FUNCTION LZArchiveEx ( fSpec, ArchName : PChar;
                       LZRecurseDirs : TLZCount ) : TLZCount;
{shell to LZArchive - no callbacks}
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
VAR
T : TLZRecurse;
BEGIN
  T := LZNoRecurse; { default}
  CASE LZRecurseDirs OF
    0 : T := LZNoRecurse;
    1 : T := LZRecurseOnce;
    2 : T := LZFullRecurse;
  END; {case}
  LZArchiveEx := LZArchive ( fSpec, ArchName, T, NIL, LZMaxCompression );
END;
{/////////////////////////////////////////////////////////}
FUNCTION LZDearchiveEx ( ArchName, DefDir : PChar ) : TLZCount;
{shell to LZDeArchive - no callbacks}
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
BEGIN
 LZDearchiveEx := LZDearchive ( ArchName, DefDir, NIL, NIL, NIL, True, False );
END;
{/////////////////////////////////////////////////////////}
FUNCTION LZCompressEx ( aName : PChar;
                        ReplaceQuestion : TLZQuestionFunc;
                        aProc : TLZReportProc ) : TLZCount;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}

VAR
fName : TLZString;
NewName : TLZstring;
BEGIN
  fName := StrPas ( aName );
  NewName := GetLZMarkedName ( fName );
  LZCompressEx := LZCompress ( aName, Str2PChar ( NewName ),
                               ReplaceQuestion, aProc, LZMaxCompression );
END;
{/////////////////////////////////////////////////////////}
FUNCTION LZDecompressEx ( aName : PChar;
                        ReplaceQuestion : TLZQuestionFunc;
                        aProc : TLZReportProc ) : TLZCount;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
VAR
s2 : TLZstring;
s  : TLZString;
Name : TLZString;
OutName : ARRAY [ 0..{$ifdef win32}255{$else}128{$endif} ] OF Char;
IsHeaderRead : boolean;

BEGIN
  LZDecompressEx := LZCode_GeneralErrorCode;
  Name := StrPas ( aName );

  IF Length ( Name ) <> 0
  THEN BEGIN

  IsHeaderRead := FALSE;

  {see if source file exists}
  IF NOT FileExists ( Name ) THEN {look for name ending with MyLZMarker}
  BEGIN
     s2 := Uppercase ( Name );
     Name := GetLZMarkedName ( Name );
{
  If Win32, then GetChiefLZFileName() will throw the correct exception when
  it tries to open Name. No need to do it manually.
}
     IF NOT FileExists ( Name ) THEN  Exit;   { source file not found }

     GetChiefLZFileName ( Str2pChar ( Name ), OutName );
     s := Uppercase ( StrPas ( OutName ) );
     IF ExtractFileName ( s ) <> ExtractFileName ( s2 ) {wrong uncompressed file}
     THEN BEGIN
         LZDecompressEx := LZCode_WrongCompressedFile; {wrong file}
         Exit;
     END;
     IsHeaderRead := TRUE;
  END;
  {not FileExists}

  IF NOT IsHeaderRead THEN GetChiefLZFileName ( aName, OutName );

  IF StrLen ( OutName ) > 0 THEN BEGIN
    s  := ExtractFileName ( StrPas ( OutName ) ); {get just file name}
    s2 := ExtractFilePath ( Name );       {does source file have path?}
    IF Length ( s2 ) = 0 THEN
      GetDir ( 0, s2 );                   {if not, use current directory}
    s2 := AddBackSlash ( s2 ); {add '\'}
    Insert ( s2, s, 1 );   {target file}

    {check for same source and target}
    IF Length ( ExtractFilePath ( Name ) ) = 0 THEN
      Insert ( s2, Name, 1 );

    IF Uppercase ( Name ) = Uppercase ( s ) THEN
      LZDecompressEx := LZCode_SourceIsTarget  {same source & target}
    ELSE
      LZDecompressEx := LZDecompress ( aName, Str2PChar ( s ), ReplaceQuestion, aProc )
  END; { StrLen(OutName) > 0 }

  END; { Length(Name) <> 0 }
END;
{////////////////////////////////////////////////////}
PROCEDURE SetIgnoreExtensions ( IgnoreExtensions : pChar );
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
BEGIN
   FIgnoreExtensions := StrPas ( IgnoreExtensions ) + #0;
END;
{////////////////////////////////////////////////////}
FUNCTION GetIgnoreExtensions : pChar;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
BEGIN
   GetIgnoreExtensions := @FIgnoreExtensions [1];
END;
{////////////////////////////////////////////////////}
FUNCTION  GetDecompressMask : pChar;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
BEGIN
   GetDecompressMask := @fDecompressMask [1];
END;
{////////////////////////////////////////////////////}
PROCEDURE SetDecompressMask ( Mask : pChar );
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
BEGIN
   FDecompressMask := StrPas ( Mask ) + #0;
END;
{////////////////////////////////////////////////////}
FUNCTION  SetCheckFileCRCs ( ToCheck : Boolean ) : Boolean;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
BEGIN
    SetCheckFileCRCs := CheckFileCRCs;
    CheckFileCRCs    := ToCheck;
END;
{////////////////////////////////////////////////////}
FUNCTION  SetArchiveHeaderBegin ( NewOffset : TLZCount ) : TLZCount;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
BEGIN
   SetArchiveHeaderBegin := ArchiveStartOffSet;
   IF NewOffSet >= 0 THEN ArchiveStartOffSet := NewOffSet;
END;
{////////////////////////////////////////////////////}
FUNCTION SetArchiveSetPassWordFunc ( aProc : TLZSetPassWordFunc ) : Pointer;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}

BEGIN
  SetArchiveSetPassWordFunc := @SetPassWordFunc;
  SetPassWordFunc := aProc;
END;
{////////////////////////////////////////////////////}
FUNCTION SetArchiveCheckPassWordFunc ( aProc : TLZCheckPassWordFunc ) : Pointer;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
BEGIN
   SetArchiveCheckPassWordFunc := @CheckPassWordFunc;
   CheckPassWordFunc := aProc;
END;
{////////////////////////////////////////////////}
FUNCTION IsChiefLZSfxArchive
( fName : PChar; VAR Hed : TLZArchiveHeader ) : TLZCount;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
VAR
i       : TLZCount;
f       : file;
NumRead : TLZSSWord;
OldFMode : byte;
b       : boolean;
R       : TLZReserved;
BEGIN
     IsChiefLZSfxArchive := LZCode_GeneralErrorCode;
     FillChar ( Hed, Sizeof ( Hed ), #0 );
     IF ( StrLen ( FName ) = 0 ) OR ( NOT FileExists ( StrPas ( FName  ) ) )
     THEN Exit;

     IsChiefLZSfxArchive := 0; {return 0  == ordinary LZ archive}
     i := IsChiefLZArchiveEx ( Fname, Hed );
     IF i > 0 THEN Exit; { it is a normal LZ archive }

     IsChiefLZSfxArchive := LZCode_NotLZArchive;
     OldFMode := FileMode;
     Assign ( f, StrPas ( fName ) );
     FileMode := fmOpenRead {$ifndef Ver90}OR fmShareDenyWrite{$endif Ver90};
     {$i-} Reset ( f, 1 ); {$ifdef Win32}{$i+}{$endif Win32}
     FileMode := OldFMode;
     IF IOResult = 0
     THEN BEGIN
        i := FileSize ( f );
        IF i < Sizeof ( TLZReserved ) THEN BEGIN
           Close ( f );
           Exit;
        END;

        FillChar ( R, Sizeof ( R ), #0 );
        {$i-}Seek ( f, i - Sizeof ( TLZReserved ) );{$ifdef Win32}{$i+}{$endif Win32}
        IF IoResult <> 0 THEN BEGIN
           Close ( f );
           Exit;
        END;

        BlockRead ( f, R, SizeOf ( R ), NumRead );
        b := ( NumRead = SizeOf ( R ) ) AND
                            ( R.S_Code = Reserved_Code_S ) AND
                            ( R.N_Code = Reserved_Code_N ) AND
                            ( R.S_OffSet > 0 );

        IF b THEN BEGIN
           IF ( R.S_OffSet < i ) THEN BEGIN
              Seek ( f, R.S_OffSet );
              BlockRead ( f, Hed, Sizeof ( Hed ), NumRead );
              b := ( NumRead = SizeOf ( Hed ) )
              AND  ( Hed.Signature = MyLZSignature )
              AND  ( Hed.Count > 0 )
              AND  ( Hed.Reserved.S_Code = Reserved_Code_S )
              AND  ( Hed.Reserved.N_Code = Reserved_Code_N )
              AND  ( Hed.Reserved.S_OffSet = R.S_OffSet );
              IF b THEN IsChiefLZSfxArchive := Hed.Count;
           END;
        END;
        Close ( f );
      END;
END;
{////////////////////////////////////////////////}
FUNCTION LZSfxArchive ( Stub, fSpec, ArchName : pChar;
                        LZRecurseDirs : TLZRecurse;
                        aProc :         TLZReportProc;
                        CompMethod :    TLZCompressionChoices ) : TLZCount;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
VAR
Buf : PBufType;
s2,
s1 : TLZString;
Infile, OutFile : file;
old : Byte;
Bread,
BWrit : TLZSSWord;
i,
Total : TLZCount;

BEGIN
  s1 := StrPas ( Stub );
  s2 := StrPas ( ArchName );
  LZSfxArchive := LZCode_GeneralErrorCode;
  IF ( s1 = '' ) OR ( s2 = '' ) OR ( Not FileExists ( s1 ) ) THEN Exit;

{$ifdef Shared_Buffers}
  IF IsLZInitialized
  THEN BEGIN
      LZSfxArchive := LZCode_BusyDll; {busy}
      Exit
  END;
{$endif Shared_Buffers}

  old := FileMode;
  FileMode := fmOpenRead {$ifndef Ver90} OR fmShareDenyWrite{$endif Ver90};
  {$i-}
  LZSfxArchive := LZCode_CantOpenFile;
  Assign ( Infile, s1 );
  Reset ( InFile, 1 );
  FileMode := Old;
  {$ifdef Win32}{$i+}{$endif}
  IF IoResult <> 0 THEN exit;

  LZSfxArchive := LZCode_CantCreateFile;
  Assign ( OutFile, s2 );
  {$i-}
  ReWrite ( OutFile, 1 );
  {$ifdef Win32}{$i+}{$endif}
  IF IoResult <> 0 THEN BEGIN
     Close ( Infile );
     exit;
  END;

  Total := 0;
  New ( Buf );
  WHILE Not Eof ( Infile ) DO BEGIN
        BlockRead ( InFile, Buf^, Sizeof ( Buf^ ), BRead );
        BlockWrite ( OutFile, Buf^, BRead, BWrit );
        Inc ( Total, BWrit );
  END; {while not eof}
  Dispose ( Buf );
  Close ( InFile );
  Close ( OutFile );
  i := SetArchiveHeaderBegin ( Total );
  LZSfxArchive := LZArchive ( fSpec, ArchName, LZRecurseDirs, aProc, CompMethod );
  SetArchiveHeaderBegin ( i );
  ResetPassWordFlag;
END;
{////////////////////////////////////////////////}
FUNCTION LZArchiveFromLZSFXArchive ( SfxArchiveName, ArchName : pChar ) : TLZCount;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
VAR
Buf    : PBufType;
s2, s1 : TLZString;
Infile,
OutFile : file;
old    : Byte;
Bread,
BWrit  : TLZSSWord;
Total  : TLZCount;
Hed    : TLZArchiveHeader;
BEGIN
  s1 := StrPas ( SfxArchiveName ) ;
  s2 := StrPas ( ArchName );
  LZArchiveFromLZSFXArchive := LZCode_GeneralErrorCode;
  IF ( s1 = '' ) OR ( s2 = '' ) OR ( Not FileExists ( s1 ) ) THEN Exit;

  { not an SFX archive }
  LZArchiveFromLZSFXArchive := LZCode_NotLZSfxArchive;
  IF IsChiefLZSfxArchive ( SfxArchiveName, Hed ) < 1 THEN exit;

  { we do not yet support doing this from spanned archives }
  LZArchiveFromLZSFXArchive := LZCode_UnsupportedCall;
  IF IsChiefLZSpannedHeader ( Hed ) THEN Exit;

  LZArchiveFromLZSFXArchive := LZCode_CantOpenFile;
  Assign ( Infile, s1 );
  Old := FileMode;
  FileMode := fmOpenRead {$ifndef Ver90} OR fmShareDenyWrite{$endif Ver90};
  {$i-}Reset ( InFile, 1 );{$ifdef Win32}{$i+}{$endif}
  FileMode := Old;
  IF IoResult <> 0 THEN exit;
  LZArchiveFromLZSFXArchive := LZCode_CantReadFile;
  {$i-}Seek ( InFile, Hed.Reserved.S_OffSet );{$ifdef Win32}{$i+}{$endif}
  IF IoResult <> 0 THEN exit;

  LZArchiveFromLZSFXArchive := LZCode_CantCreateFile;
  Assign ( OutFile, s2 );
  {$i-}ReWrite ( OutFile, 1 );{$ifdef Win32}{$i+}{$endif}
  IF IoResult <> 0 THEN BEGIN
      Close ( Infile );
      ResetPassWordFlag;
      Exit;
  END;
  New ( Buf );
  Total := 0;

  {amend header}
  BlockRead ( Infile, Hed, Sizeof ( Hed ), BRead );
  Hed.Reserved.S_OffSet := 0;
  BlockWrite ( OutFile, Hed, BRead, BWrit );
  Inc ( Total, BWrit );

  {write the rest}
  WHILE Not Eof ( InFile ) DO BEGIN
      BlockRead ( Infile, Buf^, Sizeof ( Buf^ ), BRead );
      BlockWrite ( OutFile, Buf^, BRead, BWrit );
      Inc ( Total, BWrit );
  END;

  Dispose ( Buf );
  Close ( InFile );
  Close ( OutFile );
  LZArchiveFromLZSFXArchive := Total;
  ResetPassWordFlag;
END;
{////////////////////////////////////////////////}
FUNCTION LZSfxDearchive ( 
         SfxArchiveName, DefDir : pChar;
         LZQuestion : TLZQuestionFunc;
         aProc : TLZReportProc;
         aRename : TLZRenameFunc;
         RecurseDirs,
         ExtractAsCompressed : Boolean
          ) : TLZCount;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
VAR
Hed  : TLZArchiveHeader;
j    : TLZCount;
s    : String [ 18 ];
k    : TLZCount;
BEGIN
  LZSfxDearchive := LZCode_NotLZSfxArchive;
  j := IsChiefLZSfxArchive ( SfxArchiveName, Hed );
  IF j < 0 THEN exit;
  k := LZDearchive ( SfxArchiveName, DefDir, LZQuestion, aProc, aRename, RecurseDirs, ExtractAsCompressed );
  ResetPassWordFlag;
  LZSfxDearchive := k;
  { Windows: execute a program after dearchiving }
  {$ifdef Windows}
  {$ifndef DPMI}
  IF k > 0 THEN BEGIN
     IF ( Hed.Reserved.MagicR > '' )
     AND ( Copy ( Hed.Reserved.MagicR, 1, 1 ) <> #255 )
     THEN BEGIN
        s := Hed.Reserved.MagicR + #0;
        WinExec ( @s [1], sw_Normal );
     END;
  END;
  {$endif DPMI}
  {$endif Windows}
END;
{////////////////////////////////////////////////}
PROCEDURE FreePassWordFlag ( CONST Code : TLZCount );
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
VAR
i : TLZCount;
b : Boolean;
Header : TLZArchiveHeader;
BEGIN
    IF Not Assigned ( CheckPassWordFunc ) THEN Exit;
    FillChar ( Header, SizeOf ( Header ), #0 );
    Header.Reserved := PWordRec;
    i := CheckPassWordFunc ( Header, Code );
    b := ( i = LZCode_NoPassWord ) OR ( i = LZCode_CorrectPassWord );
    IF b THEN
    PrestoChangoMagic := i;
END;
{////////////////////////////////////////////////}
FUNCTION LocalArchiveHeaderPtr : PChiefLZArchiveHeader;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
BEGIN
   LocalArchiveHeaderPtr := Jr2;
END;
{////////////////////////////////////////////////}
FUNCTION FileMatch ( aFileSpec, aTheFName : pChar; ArchiveID : TLZCount ) : Boolean;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
{ does filename:TheFName match the file specification:FileSpec?
}
{
 rudimentary matching function;

Parameters:
  FileSpec  = the file specification to match
  TheFName  = the file name to be checked for match against filespec
  ArchiveID = the unique ID of the file that is being sent;
}
VAR
i, j  : integer;
p     : PChiefLZArchiveHeader;
FileSpec, TheFName : TLZString;
BEGIN
   FileMatch := TRUE;
   FileSpec := StrPas ( aFileSpec );
   TheFName := StrPas ( aTheFName );

   { numeric ID check only? }
   { to check only for a numeric ID, send '#:'+ID as FileSpec, e.g., #:54 }
   IF Copy ( FileSpec, 1, 2 ) = '#:'
   THEN BEGIN
      Delete ( FileSpec, 1, 2 );
      Val ( FileSpec, i, j );
      IF ( j <> 0 ) OR ( i <> ArchiveID ) THEN FileMatch := FALSE;
      Exit;
   END;

   IF ( FileSpec = '*.*' ) OR ( FileSpec = '' ) OR ( FileSpec = '*' )
   THEN exit; {'' or '*.*' '*' = all files match}

   FileSpec := UpperCase ( FileSpec );
   TheFName := UpperCase ( TheFName );

   IF  ( FileSpec = TheFName ) THEN Exit;  { names match }

   TheFName := ExtractFileName ( TheFName ); { strip path }

   IF ( FileSpec = TheFName ) THEN Exit;  { same name }

   p := LocalArchiveHeaderPtr;

   IF FileSpec = UpperCase ( GetFullLZName ( p^, ArchiveID ) )
   THEN Exit;  { full path names match }

   { else go to other matching routine }
   FileMatch := MatchStrings ( FileSpec, TheFName );

END;  { FileMatch }
{////////////////////////////////////////////////////}
{  default (simple) callback to ask for disks
   * character mode under DOS
   * uses "MessageBox" under Windows
}
FUNCTION SpanPromptForDisks ( CONST DiskNum, TotalDisks, NeededSpace : TLZCount; Drive : pChar ) : TLZCount;
{$ifdef Win32}STDCALL;{$else Win32}{$ifdef adLL}EXPORT;{$endif aDLL}{$endif Win32}
VAR
s : string [255];
i : TLZCount;
BEGIN
   WHILE 0 = 0 { loop until correct disk }
   DO BEGIN
      SpanPromptForDisks := 1;  { don't continue }

      {$ifdef OS_DOS}
        Write ( 'Please insert disk #', DiskNum, ' of ', TotalDisks, ' into drive ', Drive, '. Continue? [y/n] ' );
        Readln ( s );

        { operation cancelled }
        IF Upcase ( s [1] ) <> 'Y' THEN Exit;

       {$else OS_DOS}
         s := 'Please insert disk #' + IntToStr ( DiskNum ) + ' of ' + IntToStr ( TotalDisks )
              + ' into drive ' + StrPas ( Drive );

         s := s + #13#10 + #13#10 + 'Should I continue?' + #0;

         i := MessageBox ( 0, pChar ( @s [1] ), 'LZ Archive Disk Spanning',
              MB_IconQuestion + MB_YesNo );

      { operation cancelled }
      IF i <> IDYes THEN Exit;
      {$endif OS_DOS}

      SpanPromptForDisks := 0;  { continue }

      { don't check for free space }
      IF ( NeededSpace < 1 ) THEN Exit;

      { is there sufficient space? }
      IF FreeOnDisk ( StrPas ( Drive ) ) >= NeededSpace
      THEN BEGIN
         Exit
      END;

      { if we get here, there is insufficient disk space: so ask again }
      s := 'Insufficient disk space on drive ' + StrPas ( Drive ) + #0;

      {$ifdef OS_DOS}
      Writeln ( s );
      {$else OS_DOS}
      MessageBox ( 0, pChar ( @s [1] ), 'LZ Archive Disk Spanning Error', MB_IconExclamation + MB_Ok );
      {$endif OS_DOS}
   END;
END;
{///////////////////////////////////////}
FUNCTION MarkArchiveCommentFile ( fName : pChar ) : TLZCount;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
BEGIN
   MarkArchiveCommentFile := LZCode_GeneralErrorCode;
   IF FileSetAttr ( Win16FThunker ( StrPas ( fName ), True ), faComment ) = 0
   THEN MarkArchiveCommentFile := faComment;
END;
{///////////////////////////////////////}
FUNCTION ExtractArchiveCommentFile ( ArchName, DestDir, RetValue : pChar ) : TLZCount;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
VAR
b    : Boolean;
i, l,
j, k : TLZCount;
s    : String [ 14 ];
s1   : String [ 128 ];
old  : TLZString;
BEGIN
   ExtractArchiveCommentFile := LZCode_NotLZArchive;  {not an LZ archive}
   j := IsChiefLZArchive ( ArchName );
   IF j < 1 THEN Exit;

   ExtractArchiveCommentFile := LZCode_HeaderReadFailure;
   LZHeader_Construct ( jr2, j );
   IF NOT Assigned ( jr2 ) THEN Exit;
 {$ifdef Delphi}
    TRY
 {$endif Delphi}
    s [0] := #0;
    l := - 1;
    k := GetChiefLZArchiveInfo ( ArchName, jr2^ );
    b :=  k >= 0;
    IF b
    THEN BEGIN
       ExtractArchiveCommentFile := 0; { no comment file }
       FOR i := 1 TO ( jr2^.Count )
       DO BEGIN
          IF  ( jr2^.Files [i]^.fAttrs OR faComment = faComment )
          AND ( NOT jr2^.Files [i]^.IsDir )
          THEN BEGIN
              l  := jr2^.Files [i]^.FileID;
              s1 := jr2^.LZFileNames^ [i]^;
              ExtractArchiveCommentFile := l;
              Break;
          END;
       END; { for i }
    END { if b }
    ELSE ExtractArchiveCommentFile := k;
  {$ifdef Delphi}
    FINALLY
  {$endif Delphi}
   LZHeader_Destroy ( jr2, j );
  {$ifdef Delphi}
    END; { try ... }
  {$endif Delphi}

  IF l > 0 THEN BEGIN { comment file found }
     old := fDecompressMask;
     Str ( l, s );
     s := '#:' + s;
     SetDecompressMask ( Str2pChar ( s ) );
     i := LZDearchive_ ( ArchName, DestDir, Nil, Nil, Nil, False, False );
     SetDecompressMask ( Str2pChar ( old ) );
     IF i > 0 THEN BEGIN
        Old := AddBackSlash ( StrPas ( DestDir ) ) + s1;
        FileSetAttr ( Old, faArchive ); { reset the attribute bit, removing the faComment bit }
        IF Assigned ( RetValue )
        THEN {$ifdef Delphi}TRY{$endif}StrpCopy ( RetValue, Old );{$ifdef Delphi}EXCEPT END{$endif}
     END ELSE ExtractArchiveCommentFile := i;
  END;
  ResetPassWordFlag;
END;
{////////////////////////////////////////////////}
FUNCTION SetFileMatchFunc ( CONST aProc : TLZFileMatchFunc ) : Pointer;
{$ifdef aDLL}{$ifdef Win32} STDCALL
              {$else Win32}   EXPORT
              {$endif Win32};
{$endif aDLL}
BEGIN
    SetFileMatchFunc := Addr ( FileMatchFunc );
    IF Assigned ( aProc )
      THEN FileMatchFunc := aProc
        ELSE FileMatchFunc := FileMatch; { we must always have a default! }
END;
{////////////////////////////////////////////////}
FUNCTION GetFileMatchFunc : Pointer;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
BEGIN
    GetFileMatchFunc := Addr ( FileMatchFunc );
END;
{////////////////////////////////////////////////}
FUNCTION SetWin16FCreateThunk ( aProc : ThunkFCreateFunc ) : Pointer;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
{ point to the Win16 thunking file create function }
BEGIN
    SetWin16FCreateThunk := @WriteThunkFunc;
   {$ifndef Win32}
    WriteThunkFunc := aProc;  { this is relevant only to Win16!!! }
   {$endif Win32}
END;
{/////////////////////////////////////////////////////////}
FUNCTION SetWin16FNameThunk ( aProc : ThunkFNameFunc ) : Pointer;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
{ point to the Win16 thunking file create function }
BEGIN
   SetWin16FNameThunk := @ReadThunkFunc;
   {$ifndef Win32}
   ReadThunkFunc := aProc;  { this is relevant only to Win16!!! }
   {$endif Win32}
END;
{/////////////////////////////////////////////////////////}
FUNCTION SetWin16FReNameThunk ( aProc : ThunkFReNameFunc ) : Pointer;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
{ point to the Win16 thunking file create function }
BEGIN
   SetWin16FReNameThunk := @RenameThunkFunc;
   {$ifndef Win32}
   RenameThunkFunc := aProc;  { this is relevant only to Win16!!! }
   {$endif Win32}
END;
{////////////////////////////////////////////////////}
{.$i lzsplit.pas}
{////////////////////////////////////////////////////}
{/////// disk spanning routines /////////////////////}
{////////////////////////////////////////////////////}
FUNCTION SetSpanDiskPromptFunc ( aProc : TLZSpanPromptProc ) : Pointer;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
BEGIN
   IF Assigned ( aProc )
    THEN
        LZSpanPromptProc := aProc
          ELSE { we must always have a function for this }
            LZSpanPromptProc := SpanPromptForDisks;

   SetSpanDiskPromptFunc := @LZSpanPromptProc;
END;
{////////////////////////////////////////////////////}
FUNCTION IsChiefLZSpannedHeader ( CONST Header : TLZArchiveHeader ) : Boolean;
BEGIN
  WITH Header DO
  IsChiefLZSpannedHeader  :=
             ( Parts > 0 )
         AND ( Reserved.SpanR > '' )
         AND ( Reserved.SpanInfo.Signature = ChiefSpanSignature )
         AND ( Reserved.SpanInfo.TotalParts > 0 );
END;
{////////////////////////////////////////////////////}
FUNCTION IsChiefLZSpannedArchiveEx ( ArchName : pChar; VAR Hed : TLZArchiveHeader ) : TLZCount;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
{ returns >= ChiefSpanMagicNumber if a spanned archive }
VAR
j   : TLZCount;
Multi : Boolean;
BEGIN
   j := IsChiefLZSfxArchive ( ArchName, Hed );
   IsChiefLZSpannedArchiveEx := j;
   IF j < 0 THEN Exit; { NOT an LZ Archive }

   { is it a multi-part spanned archive ? }
   Multi := IsChiefLZSpannedHeader ( Hed );

   IF Multi THEN
   IsChiefLZSpannedArchiveEx := j + ChiefSpanMagicNumber;
END;
{////////////////////////////////////////////////////}
FUNCTION IsChiefLZSpannedArchive ( ArchName : pChar ) : TLZCount;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
{ returns >= ChiefSpanMagicNumber if a spanned archive }
VAR
Hed : TLZArchiveHeader;
BEGIN
  IsChiefLZSpannedArchive := IsChiefLZSpannedArchiveEx ( ArchName, Hed );
END;
{////////////////////////////////////////////////////}
FUNCTION LZArchiveSpan ( 
                   fSpec,
                   ArchName      : pChar;
                   LZRecurseDirs : TLZRecurse;
                   aProc         : TLZReportProc;
                   CompMethod    : TLZCompressionChoices;
                   pSpanInfo     : pLZSpanConfig
                    ) : TLZCount;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
VAR
TotWritten,
Remaining,
SrcSize,
i, j    : TLZCount;
code    : TLZSSWord;
SRec    : TLZSpanRec;
Rez     : TLZReserved;
Hed     : TLZArchiveHeader;
s, s2   : TLZString;
DiskName : ARRAY [0..4] OF Char;
DskName : String [5];
f1, f2   : File;
r, r2   : {$ifdef Win32}Single{$else}Real{$endif};
Buffer  : pBufType;
Sfx     : Boolean;
RepRec  : TLZReportRec;

FUNCTION FCopy ( VAR Src, Dest : File ) : TLZCount;
VAR
bRead,
bWrit : TLZSSWord;
BEGIN
    TotWritten := 0;
    Seek ( Src, 0 );
    { report that we commencing with a new part }
    IF Assigned ( aProc )
    THEN BEGIN
        RepRec.uSizes := 1;  { the number of this part }
        RepRec.Times := 1; { total number of parts }
        aProc ( RepRec, LZCode_CallBackStartSpanningPart )
    END;

    { do the copying }
    WHILE Not Eof ( Src )
    DO BEGIN
        BlockRead ( Src, Buffer^, Sizeof ( Buffer^ ), bRead );
        BlockWrite ( Dest, Buffer^, bRead, BWrit );
        inc ( TotWritten, bWrit );
        IF Assigned ( aProc )
        THEN BEGIN
             RepRec.Fattrs := bWrit;{ number of bytes written }
             aProc ( RepRec, LZCode_CallBackStillSpanningPart )
        END;
        IF bWrit <> bRead THEN Break;
    END;

    IF Assigned ( aProc )
    THEN BEGIN
         aProc ( RepRec, LZCode_CallBackEndSpanningPart );
    END;
    FCopy := TotWritten;
END; {FCopy}

FUNCTION SplitThem ( Num : TLZCount ) : TLZCount;
VAR
s1 : String [128];
r,
Tot,
Need,
i : TLZCount;
bRead,
bWrit : TLZSSWord;

BEGIN
 { the size of this part }
 IF Num < sRec.TotalParts
 THEN Need := pSpanInfo^.DiskSize - SizeOf ( TLZReserved )
 ELSE Need := Remaining + ( SizeOf ( TLZReserved ) * 2 );

 { ask for disks }
 SplitThem := LZCode_ErrorSpanNoDiskSupplied;
 IF LZSpanPromptProc ( Num, sRec.TotalParts, Need, DiskName ) <> 0 THEN Exit;

 SRec.ThisPart := Num;
 IF Num = 1 THEN s1 := DskName + ExtractFileName ( s )
 ELSE BEGIN
    Str ( Num, s1 );
    s1 := ChangeFileExt ( DskName + ExtractFileName ( s ), '.' + s1 );
    SRec.StartOffSet := 0;
 END;

 { try to create the disk file }
 Assign ( f2, s1 );
 {$i-}Rewrite ( f2, 1 );{$ifdef Win32}{$i+}{$endif}
 IF IoResult <> 0 THEN BEGIN
    SplitThem := LZCode_ErrorSpanCreatingPart;
    Exit;
 END;

 { report that we commencing with a new part }
 IF Assigned ( aProc )
 THEN BEGIN
    RepRec.Names  := s1;   { the name of this part }
    RepRec.Sizes  := Need; { the size of this part }
    RepRec.uSizes := Num;  { the number of this part }
    RepRec.Times  := sRec.TotalParts; { total number of parts }
    aProc ( RepRec, LZCode_CallBackStartSpanningPart )
 END;

 { start the stuff }
 i := pSpanInfo^.DiskSize - ( SizeOf ( TLZReserved ) * 2 );
 Tot := 0;
 WHILE 0 = 0
 DO BEGIN
    r := Sizeof ( Buffer^ );
    IF ( ( i - tot ) < Sizeof ( Buffer^ ) ) THEN r := ( i - Tot );
    BlockRead ( f1, Buffer^, r, bRead );
    BlockWrite ( f2, Buffer^, bRead, bWrit );

    IF Assigned ( aProc )
    THEN BEGIN
        RepRec.Fattrs := bWrit;{ number of bytes written }
        aProc ( RepRec, LZCode_CallBackStillSpanningPart )
    END;

    Inc ( Tot, bWrit );
    Inc ( TotWritten, bWrit );
    Dec ( Remaining, bWrit );
    IF ( Eof ( f1 ) )
    OR ( Tot >= i )
    OR ( bWrit <> bRead )
    OR ( Remaining <= 0 )
    OR ( TotWritten >= SrcSize - SizeOf ( TLZReserved ) )
    THEN Break;
 END; { while }

 SRec.StopOffSet := FilePos ( f2 );
 Rez.SpanInfo := SRec;
 Rez.SpanR := ExtractFileName ( s );
 BlockWrite ( f2, Rez, Sizeof ( Rez ), Code );
 Close ( f2 );
 IF Assigned ( aProc )
 THEN BEGIN
    aProc ( RepRec, LZCode_CallBackEndSpanningPart );
 END;

 SplitThem := Tot;
END; { SplitThem }

BEGIN
   { get temporary directory }
   s2 := GetEnv ( 'TEMP' );
   IF s2 = '' THEN s2 := GetEnv ( 'TMP' );
   IF s2 = '' THEN s2 := 'C:\TEMP';
   IF Not DirectoryExists ( s2 ) THEN CreatePath ( s2 );
   s2 := AddBackSlash ( s2 ) + '$C$HF_$$.TMP';

   { are we trying to create an SFX archive ? }
   Sfx := ( Assigned ( pSpanInfo ) )
   AND    ( pSpanInfo^.ToSFX )
   AND    ( Strlen ( pSpanInfo^.SfxStub ) > 0 );

   { create the temporary archive }
   IF Sfx
   THEN
     i := LZSFXArchive ( pSpanInfo^.SfxStub, fSpec, Str2pChar ( s2 ), LZRecurseDirs, aProc, CompMethod )
   ELSE
     i := LZArchive ( fSpec, Str2pChar ( s2 ), LZRecurseDirs, aProc, CompMethod );

   { did we succeed, and are we spanning? }
   IF ( i < 1 ) OR ( Not Assigned ( pSpanInfo ) )
   THEN BEGIN
      LZArchiveSpan := i;
      Exit;
   END;

   s := ExtractFileDir ( StrPas ( ArchName ) ); { get the disk name }
   IF s = '' THEN GetDir ( 0, s );  { no path - assume it is on this drive }
   s := Copy ( s, 1, 3 );           { get just the drive }
   StrpCopy ( DiskName, s );        { store it here }
   DskName := AddBackSlash ( s );   { add a backslash if none exists }

   {  we only need 1 disk - so just copy the TEMP file }
   SrcSize := FSize ( s2 );
   IF SrcSize <= pSpanInfo^.DiskSize
   THEN BEGIN
        pSpanInfo^.Count := 0; { not spanned }
        StrCopy ( pSpanInfo^.SpanName, ArchName ); { return the original archive name }

        { check if TEMP directory and target are on same drive }
        IF UpCase ( s [1] ) = UpCase ( s2 [1] ) { same drive }
        THEN BEGIN
            s := StrPas ( ArchName );
            IF RenameaFile ( s2, s )
            THEN BEGIN
               LZArchiveSpan := i;
               Exit;
            END;
        END;

        s := StrPas ( ArchName );

        { not on same drive, or rename failed = copy instead }
        Assign ( f1, s2 );
        {$i-}Reset ( f1, 1 );{$ifdef Win32}{$i+}{$endif}
        IF ioresult <> 0
        THEN BEGIN
           LZArchiveSpan := LZCode_ErrorSpanOpeningSource;
           DeleteaFile ( s2 );
           exit;
        END;

        { check disk space }
        j := FreeOnDisk (  StrPas ( DiskName ) );
        IF j < SrcSize THEN  { insufficient space }
        IF LZSpanPromptProc ( 1, 1, SrcSize, DiskName ) <> 0  { prompt for disk }
        THEN BEGIN
           Close ( f1 );
           LZArchiveSpan := LZCode_ErrorSpanNoDiskSupplied;
           DeleteaFile ( s2 );
           Exit;
        END;

        { now try to create the target archive }
        Assign ( f2, s );
        {$i-}ReWrite ( f2, 1 );{$ifdef Win32}{$i+}{$endif}
        IF ioresult <> 0
        THEN BEGIN
           Close ( f1 );
           LZArchiveSpan := LZCode_ErrorSpanCreatingArchive;
           DeleteaFile ( s2 );
           exit;
        END;

        { report that we are about to start building the spanned archive }
        IF Assigned ( aProc )
        THEN BEGIN
             RepRec.Names := StrPas ( ArchName );
             RepRec.Sizes := SrcSize;
             RepRec.uSizes := 0;
             RepRec.Times := 1; { total number of parts }
             aProc ( RepRec, LZCode_CallBackStartSpanningArchive )
        END;

        { copy the temp archive to the floppy }
        New ( Buffer );
        j := FCopy ( f1, f2 ); { copy the file }
        {$i-}
        Close ( f1 ); IF IoResult <> 0 THEN;
        Close ( f2 ); IF IoResult <> 0 THEN;
        {$ifdef Win32}{$i+}{$endif}

        Dispose ( Buffer );

        { report that we have finished rebuilding the spanned archive }
        IF Assigned ( aProc )
        THEN BEGIN
             RepRec.Names := StrPas ( ArchName );
             RepRec.uSizes := 1; { all parts }
             RepRec.Times := 1; { total number of parts }
             aProc ( RepRec, LZCode_CallBackEndSpanningArchive );
        END;

        { is the size correct? }
        IF j <> SrcSize
          THEN LZArchiveSpan := LZCode_ErrorSpanCreatingArchive
            ELSE LZArchiveSpan := i; { return the number of files archived }

        DeleteaFile ( s2 );
        Exit;
   END;
   { end: 1 disk }

   { if we get here, we need more than 1 disk }
   LZArchiveSpan := LZCode_BadSpanInformation;
   WITH pSpanInfo^ DO BEGIN
       IF ( DiskSize < 1 ) THEN exit;
   END;

   s := StrPas ( ArchName );
   { return the archivename, converted if necessary }
   StrpCopy ( pSpanInfo^.SpanName, DiskName + ExtractFileName ( s ) );

   { now do the rest }
   Assign ( f1, s2 );
   {$i-}Reset ( f1, 1 );{$ifdef Win32}{$i+}{$endif}
   IF ioresult <> 0 THEN BEGIN
      LZArchiveSpan := LZCode_ErrorSpanOpeningSource;
      exit;
   END;

   { how many parts do we need? }
   r  := SrcSize / pSpanInfo^.DiskSize;
   j  := Round ( r );
   r2 := Frac ( r );
   IF ( r2 > 0 ) AND ( r2 < 0.5 ) { "j" would have been rounded down }
     THEN Inc ( j ); { so increase it by 1 }

   FillChar ( SRec, Sizeof ( SRec ), #0 );
   FillChar ( Rez, Sizeof ( Rez ), #0 );
   FillChar ( Hed, Sizeof ( Hed ), #0 );

   WITH SRec DO BEGIN
       Signature := ChiefSpanSignature;
       TotalParts := j;
   END;

   j := SrcSize - Sizeof ( TLZReserved );
   Seek ( f1, j );
   BlockRead ( f1, Rez, Sizeof ( Rez ), Code );
   IF Code <> Sizeof ( Rez ) THEN BEGIN
      Close ( f1 );
      LZArchiveSpan := LZCode_ErrorSpanReadingSource;
      DeleteaFile ( s2 );
      Exit;
   END;

   { disk 1: info }
   WITH SRec DO BEGIN
        ThisPart := 1;
        StartOffSet := Rez.S_OffSet;
        StopOffSet  := j;
   END;

   Remaining := j;
   TotWritten := 0;

   {  Read the main header }
   Seek ( f1, Rez.S_OffSet );
   BlockRead ( f1, Hed, Sizeof ( Hed ), Code );
   IF Code <> Sizeof ( Hed ) THEN BEGIN
      Close ( f1 );
      DeleteaFile ( s2 );
      LZArchiveSpan := LZCode_ErrorSpanReadingSourceHeader;
      Exit;
   END;

   { report that we are about to start building the spanned archive }
   IF Assigned ( aProc )
   THEN BEGIN
        RepRec.Names := StrPas ( pSpanInfo^.SpanName );
        RepRec.Sizes := 0;
        RepRec.uSizes := 0;
        RepRec.Times := SRec.TotalParts; { total number of parts }
        aProc ( RepRec, LZCode_CallBackStartSpanningArchive )
   END;

   {  set number of parts and write it to file }
   pSpanInfo^.Count := SRec.TotalParts;
   Hed.Parts := SRec.TotalParts;
   Hed.Reserved.SpanInfo := SRec;
   Hed.Reserved.SpanR := ExtractFileName ( s );

   { rewrite the header }
   Seek ( f1, Rez.S_OffSet );
   BlockWrite ( f1, Hed, Sizeof ( Hed ), Code );

   { now split the file }
   New ( Buffer );
   Seek ( f1, 0 );
   FOR i := 1 TO Hed.Parts
   DO BEGIN
       j := SplitThem ( i );
       IF j < 1 THEN BEGIN
          Dispose ( Buffer );
          LZArchiveSpan := LZCode_ErrorSpanWritingPart;
          Close ( f1 );
          DeleteaFile ( s2 );
          Exit;
       END;
   END;
   Dispose ( Buffer );

   { report that we have finished rebuilding the spanned archive }
   IF Assigned ( aProc )
   THEN BEGIN
        RepRec.Names  := StrPas ( pSpanInfo^.SpanName );
        RepRec.Sizes  := FileSize ( f1 );
        RepRec.uSizes := SRec.TotalParts; { all parts }
        RepRec.Times  := SRec.TotalParts; { total number of parts }
        aProc ( RepRec, LZCode_CallBackEndSpanningArchive );
   END;

   LZArchiveSpan := Hed.Count;
   { cleanup }
   Close ( f1 );
   DeleteaFile ( s2 );
END;
{//////////////////////////////////////////////////}
FUNCTION LZDearchive ( ArchName : PChar; aDefDir : PChar;
                     LZQuestion : TLZQuestionFunc;
                     aProc :      TLZReportProc;
                     aRename :    TLZRenameFunc;
                     RecurseDirs,
                     ExtractAsCompressed : Boolean
                      ) : TLZCount;
VAR
Code : TLZSSWord;
pNum : Word;
Hed  : TLZArchiveHeader;
i, j,
k    : TLZCount;
Multi : Boolean;
s    : TLZString;
f2   : File;
Old  : Byte;
Buffer : pBufType;
RepRec : TLZReportRec;
DiskName : ARRAY [0..4] OF Char;


{ check whether a file is the correct part of a disk-spanned archive }
FUNCTION IsCorrectPart ( CONST Num : TLZCount; CONST R : TLZReserved ) : Boolean;
BEGIN
   WITH R.SpanInfo DO BEGIN
        IsCorrectPart :=
            ( Signature = ChiefSpanSignature )
        AND ( TotalParts > 0 )
        AND ( ThisPart = Num )
        AND ( StopOffSet > 0 );
   END;
END; { IsCorrectPart }

{ join the files together: num = the numbered part to process }
FUNCTION JoinThem ( CONST Num : TLZCount ) : TLZCount;
VAR
s1   : TLZString;
bRead,
bWrit : TLZSSWord;
f1   : File;
Rez  : TLZReserved;
sz,
Tot  : TLZCount;
b     : Boolean;

BEGIN
   JoinThem := LZCode_ErrorSpanNoDiskSupplied;

   IF NUM <> 1 THEN IF LZSpanPromptProc ( Num, pNum, - 1, DiskName ) <> 0 THEN Exit;

   b := False;
   sz := 0;
   
   WHILE Not b
   DO BEGIN

      { set the name of this part }
      IF Num = 1 THEN s1 := StrPas ( ArchName )
      ELSE BEGIN
         Str ( Num, s1 );
         s1 := ChangeFileExt ( StrPas ( ArchName ), '.' + s1 );
      END;

      { does the relevant part exist ? }
      IF Not FileExists ( s1 )
      THEN BEGIN
         REPEAT
            IF LZSpanPromptProc ( Num, pNum, - 1, DiskName ) <> 0 THEN Exit;
         UNTIL ( FileExists ( s1 ) );
      END;

      { the file exists: now check whether it has the right header information }
      Assign ( f1, s1 );
      Old := FileMode;
      FileMode := fmOpenRead {$ifndef Ver90}OR fmShareDenyWrite{$endif Ver90};
      {$i-}Reset ( f1, 1 );{$ifdef Win32}{$i+}{$endif}
      FileMode := Old;
      IF Ioresult <> 0 THEN BEGIN
         JoinThem := LZCode_ErrorSpanOpeningSource;
         Exit;
      END;

     sz := FileSize ( f1 );
     { read the header at the tail of the file }
     FillChar ( Rez, Sizeof ( Rez ), #0 );
     Seek ( f1, FileSize ( f1 ) - Sizeof ( Rez ) );
     BlockRead ( f1, Rez, Sizeof ( Rez ), Code );
     IF Code <> Sizeof ( Rez )
     THEN BEGIN
       JoinThem := LZCode_ErrorSpanBadSource;
       Close ( f1 );
       Exit;
     END;

     { do we have the correct file (part number) ? }
     JoinThem := LZCode_ErrorSpanWrongDiskSupplied;
     IF NOT IsCorrectPart ( Num, Rez ) { wrong part - ask again }
     THEN BEGIN
       IF LZSpanPromptProc ( Num, pNum, - 1, DiskName ) <> 0
       THEN BEGIN
          Close ( f1 );
          Exit;
       END;
     END ELSE Break;
   END; { while not b }

   { report that we commencing with a new part }
   IF Assigned ( aProc )
   THEN BEGIN
        RepRec.Names  := s1;   { the name of this part }
        RepRec.Sizes  := sz;   { the size of this part }
        RepRec.uSizes := Num;  { the number of this part }
        RepRec.Times  := pNum; { total number of parts }
        aProc ( RepRec, LZCode_CallBackStartSpanningPart )
   END;

   { start the stuff }
   Tot := 0;
   Seek ( f1, 0 );
   WHILE Not Eof ( f1 )
   DO BEGIN
       BlockRead ( f1, Buffer^, Sizeof ( Buffer^ ), bRead );
       BlockWrite ( f2, Buffer^, bRead, bWrit );
       IF Assigned ( aProc )
       THEN BEGIN
          RepRec.Fattrs := bWrit;{ number of bytes written }
          aProc ( RepRec, LZCode_CallBackStillSpanningPart )
       END;
       Inc ( Tot, bWrit );
   END;
   Close ( f1 );

   { remove reserved stuff }
   Seek ( f2, FileSize ( f2 ) - Sizeof ( Rez ) );
   Truncate ( f2 );
   JoinThem := Tot - Sizeof ( Rez );

   IF Assigned ( aProc )
   THEN BEGIN
      aProc ( RepRec, LZCode_CallBackEndSpanningPart );
   END;

END; { JoinThem }

BEGIN
   {$ifdef Shared_Buffers}
   IF IsLZInitialized
   THEN BEGIN
      LZDearchive := LZCode_BusyDLL; {busy}
      Exit;
   END;
   {$endif Shared_Buffers}

   j := IsChiefLZSfxArchive ( ArchName, Hed );
   IF j < 0 THEN
   BEGIN
       LZDearchive := LZCode_NotLZArchive; {bad archive}
       Exit;
   END;

   { is it a multi-part spanned archive ? }
   Multi := IsChiefLZSpannedHeader ( Hed );
   pNum  := Hed.Parts;

   { normal archive; or no Span information - dearchive normally }
   IF ( Not Multi )
   THEN BEGIN
      i := 0;
      IF j > 0 THEN i := SetArchiveHeaderBegin ( Hed.Reserved.S_OffSet );
      k := LZDearchive_ ( ArchName, aDefDir, LZQuestion, aProc, aRename,
                         RecurseDirs, ExtractAsCompressed );
      LZDearchive := k;
      IF j > 0 THEN SetArchiveHeaderBegin ( i );
      ResetPassWordFlag;
      Exit;
   END;

   { if we get here - it is spanned! }
   s := ExtractFileDir ( StrPas ( ArchName ) ); { get the disk name }
   IF s = '' THEN GetDir ( 0, s );      { no path - assume it is on this drive }
   s := Copy ( s, 1, 3 );                { get just the drive }
   StrpCopy ( DiskName, s );

   { create a temporary file in the TEMP directory }
   s := GetEnv ( 'TEMP' );
   IF s = '' THEN s := GetEnv ( 'TMP' );
   IF s = '' THEN s := 'C:\TEMP';
   IF Not DirectoryExists ( s ) THEN CreatePath ( s );
   s := AddBackSlash ( s ) + '$CH$F_$$.TMP';
   Assign ( f2, s );
   {$i-}ReWrite ( f2, 1 );{$ifdef Win32}{$i+}{$endif}
   IF Ioresult <> 0
   THEN BEGIN
      LZDearchive := LZCode_ErrorSpanCreatingTemp;
      Exit;
   END;

   { report that we are about to start rebuilding the spanned archive }
   IF Assigned ( aProc )
   THEN BEGIN
        RepRec.Names := StrPas ( ArchName );
        RepRec.Sizes := 0;
        RepRec.uSizes := 0;
        RepRec.Times := pNum; { total number of parts }
        aProc ( RepRec, LZCode_CallBackStartSpanningArchive )
   END;

   { rebuild parts into the temporary archive }
   New ( Buffer );
   FOR i := 1 TO pNum DO BEGIN
       k := JoinThem ( i );
       IF k < 1 THEN BEGIN
          Dispose ( Buffer );
          LZDearchive := k;
          Close ( f2 );
          Exit;
       END;
   END; { for i }
   Dispose ( Buffer );

   { reset the header so that it is no longer a spanned archive }
   WITH Hed DO BEGIN
        Parts := 0;
        WITH Reserved DO BEGIN
             SpanR := '';
             FillChar ( SpanInfo, Sizeof ( SpanInfo ), #0 );
             SpanInfo.Signature := '';
        END;
   END;

   { write the tail header }
   BlockWrite ( f2, Hed.Reserved, Sizeof ( Hed.Reserved ), Code );

   { rewrite the top header }
   Seek ( f2, Hed.Reserved.S_OffSet );
   BlockWrite ( f2, Hed, Sizeof ( Hed ), Code );
   {}

   { report that we have finished rebuilding the spanned archive }
   IF Assigned ( aProc )
   THEN BEGIN
        RepRec.Names := StrPas ( ArchName );
        RepRec.Sizes := FileSize ( f2 );
        RepRec.uSizes := pNum; { all parts }
        RepRec.Times := pNum; { total number of parts }
        aProc ( RepRec, LZCode_CallBackEndSpanningArchive );
   END;

   { close the file }
   Close ( f2 );

   { did we succeed in recreating the full archive ? }
   j := IsChiefLZSfxArchive ( Str2pChar ( s ), Hed );
   IF j < 0 THEN
   BEGIN
       DeleteaFile ( s );
       LZDearchive := LZCode_ErrorSpanExtractingTemp;
       Exit;
   END;

   { now, try to decompress it }
   i := 0;
   IF j > 0 THEN i := SetArchiveHeaderBegin ( Hed.Reserved.S_OffSet );
   k := LZDearchive_ ( Str2pChar ( s ), aDefDir, LZQuestion, aProc, aRename,
                      RecurseDirs, ExtractAsCompressed );
   LZDearchive := k;
   IF j > 0 THEN SetArchiveHeaderBegin ( i );
   ResetPassWordFlag;
   DeleteaFile ( s );
END;
{///////////////////////////////////////////////}
{/////// initialise the unit/DLL ///////////////}
{///////////////////////////////////////////////}
PROCEDURE ChiefLZ_Init;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}
BEGIN
  FillChar ( BlankRec, SizeOf ( BlankRec ), #0 );
  FillChar ( PWordRec, SizeOf ( PWordRec ), #0 );
  fDecompressMask := '*.*' + #0;
  Decompressing := FALSE;
  SetCheckFileCRCs ( FALSE );
  SetArchiveHeaderBegin ( 0 );
  ResetPassWordFlag;
  LZReadProc  := MyReadProc;
  LZWriteProc := MyWriteProc;
  LH6ReadProc := LH6ReadCallBack;
  LH6WriteProc := LH6WriteCallBack;
  SetSpanDiskPromptFunc ( SpanPromptForDisks ); { default to SpanPromptForDisks }
  SetFileMatchFunc ( FileMatch ); { default to filematch routine }
  SetArchiveCheckPassWordFunc ( NIL );
  SetArchiveSetPassWordFunc ( NIL );
  CurrentCompType := - 1;
  Jr2 := NIL;
  Jr  := NIL;
  WriteThunkFunc := NIL;
  ReadThunkFunc := NIL;
  RenameThunkFunc := NIL;
END;
{////////////////////////////////////////////////////}
{////////////////////////////////////////////////////}
{////////////////////////////////////////////////////}
{////////////////////////////////////////////////////}
{$IFNDEF Win32}
FUNCTION HeapFunc ( Size : Word ) : Integer; FAR; ASSEMBLER;
ASM
  MOV AX, 1
END; { HeapFunc }
{$ENDIF Win32}
{////////////////////////////////////////////////////}
{////////////////////////////////////////////////////}
{$ifdef aDLL}
{
  Procedural interface to allow MyLZMarker to be modified if a DLL.
  Utterly redundant if NOT DLL, since MyLZMarker is published in the
  interface and we WANT to grant read/write access.
}
FUNCTION GetLZMarkerChar : Char; {$ifdef Win32} STDCALL {$else} EXPORT {$endif};
BEGIN
  GetLZMarkerChar := MyLZMarker
END;

PROCEDURE SetLZMarkerChar ( CONST NewChar : Char );
{$ifdef Win32} STDCALL {$else} EXPORT {$endif};
BEGIN
  MyLZMarker := NewChar
END;

FUNCTION ChiefLZDLLVersion : TLZCount;
{$ifdef Win32} STDCALL {$else} EXPORT {$endif Win32};
BEGIN
  ChiefLZDLLVersion := ChiefLZVersionNumber
END;


EXPORTS
   LZCompress            index 1  {$ifdef Win32} name 'LZCompress' {$endif},
   LZDecompress          index 2  {$ifdef Win32} name 'LZDecompress' {$endif},
   IsChiefLZFile         index 3  {$ifdef Win32} name 'IsChiefLZFile' {$endif},
   LZArchive             index 4  {$ifdef Win32} name 'LZArchive' {$endif},
   LZDearchive           index 5  {$ifdef Win32} name 'LZDearchive' {$endif},
   IsChiefLZArchive      index 6  {$ifdef Win32} name 'IsChiefLZArchive' {$endif},
   GetChiefLZFileName    index 7  {$ifdef Win32} name 'GetChiefLZFileName' {$endif},
   GetChiefLZFileSize    index 8  {$ifdef Win32} name 'GetChiefLZFileSize' {$endif},
   GetChiefLZArchiveInfo index 9  {$ifdef Win32} name 'GetChiefLZArchiveInfo' {$endif},
   LZCompressEx          index 10 {$ifdef Win32} name 'LZCompressEx' {$endif},
   LZDeCompressEx        index 11 {$ifdef Win32} name 'LZDecompressEx' {$endif},
   GetLZMarkerChar       index 12 {$ifdef Win32} name 'GetLZMarkerChar' {$endif},
   SetLZMarkerChar       index 13 {$ifdef Win32} name 'SetLZMarkerChar' {$endif},
   ChiefLZDLLVersion     index 14 {$ifdef Win32} name 'ChiefLZDLLVersion' {$endif},
   GetChiefLZArchiveSize index 15 {$ifdef Win32} name 'GetChiefLZArchiveSize' {$endif},
   SetIgnoreExtensions   index 16 {$ifdef Win32} name 'SetIgnoreExtensions' {$endif},
   GetIgnoreExtensions   index 17 {$ifdef Win32} name 'GetIgnoreExtensions' {$endif},
   SetDecompressMask     index 18 {$ifdef Win32} name 'SetDecompressMask' {$endif},
   GetDecompressMask     index 19 {$ifdef Win32} name 'GetDecompressMask' {$endif},
   ChiefLZ_Init          index 20 {$ifdef Win32} name 'ChiefLZ_Init' {$endif},
   LZArchiveEx           index 21 {$ifdef Win32} name 'LZArchiveEx' {$endif},
   LZDearchiveEx         index 22 {$ifdef Win32} name 'LZDearchiveEx' {$endif},
   IsChiefLZArchiveEx    index 23 {$ifdef Win32} name 'IsChiefLZArchiveEx' {$endif},
   SetCheckFileCRCs      index 24 {$ifdef Win32} name 'SetCheckFileCRCs' {$endif},
   IsChiefLZFileEx       index 25 {$ifdef Win32} name 'IsChiefLZFileEx' {$endif},
   GetChiefLZFileInfo    index 26 {$ifdef Win32} name 'GetChiefLZFileInfo' {$endif},
   LZListArchive         index 27 {$ifdef Win32} name 'LZListArchive' {$endif},
   SetArchiveHeaderBegin index 29{$ifdef Win32}  name 'SetArchiveHeaderBegin' {$endif},
   SetArchiveSetPassWordFunc   index 30{$ifdef Win32} name 'SetArchiveSetPassWordFunc' {$endif},
   SetArchiveCheckPassWordFunc index 31{$ifdef Win32} name 'SetArchiveCheckPassWordFunc' {$endif},
   IsChiefLZSfxArchive         index 32{$ifdef Win32} name 'IsChiefLZSfxArchive' {$endif},
   LZSfxArchive                index 33{$ifdef Win32} name 'LZSfxArchive' {$endif},
   LZSfxDearchive              index 34{$ifdef Win32} name 'LZSfxDearchive' {$endif},
   LZArchiveFromLZSFXArchive   index 35{$ifdef Win32} name 'LZArchiveFromLZSFXArchive' {$endif},
   ResetPassWordFlag           index 36{$ifdef Win32} name 'ResetPassWordFlag' {$endif},
   FreePassWordFlag            index 37{$ifdef Win32} name 'FreePassWordFlag' {$endif},
   SetFileMatchFunc            index 38{$ifdef Win32} name 'SetFileMatchFunc' {$endif},
   GetFileMatchFunc            index 39{$ifdef Win32} name 'GetFileMatchFunc' {$endif},
   LocalArchiveHeaderPtr       index 40{$ifdef Win32} name 'LocalArchiveHeaderPtr' {$endif},
   FileMatch                   index 41{$ifdef Win32} name 'FileMatch' {$endif},
   SetWin16FCreateThunk        index 42{$ifdef Win32} name 'SetWin16FCreateThunk' {$endif},
   SetWin16FNameThunk          index 43{$ifdef Win32} name 'SetWin16FNameThunk' {$endif},
   SetWin16FReNameThunk        index 44{$ifdef Win32} name 'SetWin16FReNameThunk' {$endif},
   HasPassWord                 index 45{$ifdef Win32} name 'HasPassWord' {$endif},
   ExtractArchiveCommentFile   index 46{$ifdef Win32} name 'ExtractArchiveCommentFile' {$endif},
   MarkArchiveCommentFile      index 47{$ifdef Win32} name 'MarkArchiveCommentFile' {$endif},
   SetSpanDiskPromptFunc       index 48{$ifdef Win32} name 'SetSpanDiskPromptFunc' {$endif},
   LZArchiveSpan               index 49{$ifdef Win32} name 'LZArchiveSpan' {$endif},
   LZDearchive_                index 50{$ifdef Win32} name 'LZDearchive_' {$endif},
   IsChiefLZSpannedArchive     index 51{$ifdef Win32} name 'IsChiefLZSpannedArchive' {$endif},
   IsChiefLZSpannedArchiveEx   index 52{$ifdef Win32} name 'IsChiefLZSpannedArchiveEx' {$endif},
   IsChiefLZSpannedHeader      index 53{$ifdef Win32} name 'IsChiefLZSpannedHeader' {$endif};
{$endif aDLL}
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{$ifdef Win32}
{$ifdef aDLL}
BEGIN
{$else aDLL}
INITIALIZATION
{$endif aDLL}
{$else Win32}
BEGIN
  HeapError := @HeapFunc;  { Specific to 16-bit code }
  LZReportProc := NIL;
{$endif Win32}
  ChiefLZ_Init;
END.

