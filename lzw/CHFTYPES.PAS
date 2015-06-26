{$I LZDefine.inc}
UNIT ChfTypes;
{type definitions for the ChiefLZ package}
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

{$ifdef Win32}
USES
  SysUtils;

TYPE
EChiefLZError    = CLASS ( Exception );
EChiefLZCompress = CLASS ( EChiefLZError );
EChiefLZArchive  = CLASS ( EChiefLZCompress );
TYPE
EChiefLZDLL      = CLASS ( EChiefLZError );
{$else}
USES
{$ifdef Delphi}
SysUtils;
{$else}
Strings, Objects;
{$endif Delphi}
{$endif Win32}

{$ifdef VirtualPascal}
TYPE
Word    = SmallWord;     { 16-bit word }
Integer = Longint;       { 32-bit integer }
{$endif VirtualPascal}

CONST
MySigStr = #4 + ^M + 'ChfLZ_2' + #5#6#4;  { ChiefLZ 2.x signature }
MyLZSignature : String [ Length ( MySigStr ) ] = MySigStr;

CONST faComment  = $09; { file attribute marker for comment files }

{ chieflz archive function return values }
CONST
LZCode_GeneralErrorCode   = - 1;
LZCode_NoFilesProcessed   =   0;
LZCode_CantOpenFile       = - 2;
LZCode_CantReadFile       = - 3;
LZCode_CantCreateFile     = - 4;
LZCode_InitFailure        = - 5;
LZCode_WriteFailure       = - 6;
LZCode_HeaderWriteFailure = - 7;
LZCode_HeaderReadFailure  = - 77;
LZCode_CantWriteTempFile  = - 8;
LZCode_ListFileNotFound   = - 9;
LZCode_NothinginListFile  = - 10;
LZCode_SourceIsTarget     = - 11;
LZCode_SourceFileNotFound = - 12;
LZCode_BadTargetDirectory = - 13;
LZCode_NotLZFile          = - 14;
LZCode_NotLZArchive       = - 15;
LZCode_ArchiveNotFound    = - 16;
LZCode_NilCallBack        = - 17;
LZCode_WrongCompressedFile = - 18;
LZCode_AccessDenied       = - 19;
LZCode_MemAllocFailure    = - 20;
LZCode_EndOfFileError     = - 21;

{ Multi-disk span Error Codes }
LZCode_BadSpanInformation      = - 22;
LZCode_ErrorSpanOpeningSource  = - 23;
LZCode_ErrorSpanReadingSource  = - 24;
LZCode_ErrorSpanReadingSourceHeader = - 25;
LZCode_ErrorSpanCreatingPart   = - 26;
LZCode_ErrorSpanNoDiskSupplied = - 27;
LZCode_ErrorSpanWritingPart    = - 28;
LZCode_ErrorSpanBadSource      = - 29;
LZCode_ErrorSpanWrongDiskSupplied = - 30;
LZCode_ErrorSpanCreatingTemp      = - 31;
LZCode_ErrorSpanExtractingTemp    = - 32;
LZCode_ErrorSpanCreatingArchive   = - 33;

{ other error codes }
LZCode_UserSkippedFile    = - 100;
LZCode_UserAborted        = - 150;
LZCode_BadFileCRC         = - 200;
LZCode_BusyDll            = - 300;
LZCode_NotLZSfxArchive    = - 400;
LZCode_NoPassWord         = - 1000;
LZCode_NewPassWord        = - 1010;  {we have set a new password}
LZCode_WrongPassWord      = - 2000;
LZCode_CorrectPassWord    = - 3000;
LZCode_BadHeaderCRC       = - 3010;
LZCode_UnsupportedCall    = - 3020;

{progress report callback codes}
LZCode_CallBackStartFile      = - 1;  {notify start of new file}
LZCode_CallBackEndFile        = - 2;  {notify end of file}
LZCode_CallBackStartDirectory = - 3;  {notify creation of directory}
LZCode_CallBackEndDirectory   = - 4;  {notify end; directory creation}
LZCode_CallBackProcessingDirs = - 5;  {notify that we are processing directories when archiving}
LZCode_CallBackStartArchive   = - 6;  {notify start of archive}
LZCode_CallBackEndArchive     = - 7;  {notify end of archive}
LZCode_CallBackStartSpanningArchive  = - 8; { notify that we are starting to rebuild a spanned archive }
LZCode_CallBackStartSpanningPart = - 9; { notify that we are starting with a new part }
LZCode_CallBackStillSpanningPart = - 10;
LZCode_CallBackEndSpanningPart = - 11;
LZCode_CallBackEndSpanningArchive = - 12; { notify that we have finished rebuilding the spanned archive }

{ the compression types }
TLZCompressionTypeStrings : ARRAY [0..4] OF PChar =
( 'Unknown',     { 0  = unknown }
  'Dir',         { 1  = directory }
  'Stored',      { 2  = stored }
  'Lzss',        { 3  = LZSS }
  'LH6'          { 4  = SixPack Huffman }
);

TYPE                  {    0          1        2       3     4 }
TLZCompressionTypes   = ( LZUnknown, LZDir, LZStored, LZSS, LH6 );

                      {   0:Store only     1: Use LZSS        2: Use SixPack Huffman  (LH6) }
TLZCompressionChoices = ( LZNoCompression, LZFastCompression, LZMaxCompression );
{Notes:
 * LH6 compression is slow-ish (while compressing), but the compression
   ratio is excellent - more or less the same as ZIP "deflation"
 * LZSS compression is fast but the compression ratio is not as good
   as LH6 or ZIP

   * so you should select LZMaxCompression, or LZFastCompression, depending
     on whether you are looking for maximum compression, or speed.
}


{ fixed-length string type }
TYPE
pLZString = ^TLZString;
TLZString = String [255];

{new Global numeric data type; use this instead of "longint"
 so that it can easily be changed in future
}
TYPE
TLZCount   = Longint;

{pointer to object type, for Win16-Win32 type compatibility}
TYPE
pObject = {$ifndef Delphi}^{$endif Delphi}TObject;

{some data types used herein}
TYPE
TLZExtStr  = String {$ifdef Win32} [ 255 ]{$else Win32} [ 128 ] {$endif Win32};
pLZPathStr = ^TLZPathStr;
TLZPathStr = String {$ifdef Win32} [ 255 ]{$else Win32} [ 128 ] {$endif Win32};
TLZSigStr  = String [ 18 ];
TLZVerStr  = String [ 8 ];

{record for reporting archive file information}
TYPE
pLZReportRec = ^TLZReportRec;
TLZReportRec = PACKED RECORD
{any version information?}
   FileVersion : TLZVerStr;
{compressed sizes}
   Sizes  : TLZCount;
{uncompressed sizes}
   uSizes : TLZCount;
{date/time stamps}
   Times  : TLZCount;
{file names}
   Names  : TLZPathStr;
{file attributes}
   fAttrs : TLZCount;
{ 32-bit CRC}
   CRCs   : TLZCount;
{ 32-bit unique ID }
   FileIDs : TLZCount;
{  Compression type }
   CompressedTypes : Byte;
{is it a Directory?}
   IsDir  : Boolean; {introduced this for LZ report and Question procedures}
END;

{procedural type for status/progress information
            CurrentRecord=file record information
            NumberOfBytes=number of bytes read/written
}
TYPE
TLZReportProc = FUNCTION ( CONST CurrentRecord : TLZReportRec;CONST NumberOfBytes : TLZCount ) : TLZCount
{$ifdef Win32}STDCALL{$endif Win32};

{new type for "LZQuestion"
 LZYES = overwrite this file
 LZNO  = don't overwrite this file
 LZQUIT = abort the dearchiving process
}
TYPE
TLZReply = ( LZNo, LZYes, LZQuit );

{ * some procedural types for callbacks *}

{
procedural type to ask whether an existing file should
be overwritten -

  * the source file's details are sent to your function
    in "CurrentRecord";

  * the existing file's details are sent to your function
    in "ExistingFileRecord"
  * your function should return "LZYes" if you want the file to be
    overwritten.

  * If no function is pointed to, the default is to overwrite existing
    files without warning.
}
TYPE
TLZQuestionFunc = FUNCTION
( CONST CurrentRecord : TLZReportRec; CONST ExistingFileRecord : TLZReportRec ) : TLZReply
{$ifdef Win32}STDCALL{$endif Win32};

{
  Function type to determine whether to abort a file operation,
  or rename the file; if you want the file to be renamed, then
  return TRUE, and send the new name in "NewFileName"
}
TYPE
TLZRenameFunc = FUNCTION ( VAR NewFileName : TLZString ) : boolean
{$ifdef Win32}STDCALL{$endif Win32};

{
Filename matching callback type
Parameters:
  FileSpec  = the file specification to match
  TheFName  = the file name to be checked for match against filespec
  ArchiveID = the unique ID of the file that is being sent
  Returns: should return TRUE if the file matches, else return FALSE
}
TYPE
TLZFileMatchFunc = FUNCTION  ( FileSpec, TheFName : pChar; ArchiveID : TLZCount ) : Boolean
{$ifdef Win32}STDCALL{$endif Win32};

TYPE
ThunkFCreateFunc = FUNCTION ( VAR FName : TLZString; ItsADirectory : Boolean ) : Longint
{$ifdef Win32}STDCALL{$endif Win32};
{
 16-bit callback function type to create a long file
 or directory name - use only under Win16
}

ThunkFNameFunc = FUNCTION ( CONST FName : TLZString;FromLongToShort : Boolean ) : TLZString
{$ifdef Win32}STDCALL{$endif Win32};
{
 16-bit callback function type to return a long file
 or directory name - use only under Win16
}

ThunkFReNameFunc = FUNCTION ( CONST OldFName, NewFName : TLZString ) : Boolean
{$ifdef Win32}STDCALL{$endif Win32};
{
 16-bit callback function type to rename a file - with longname support
 - use only under Win16
}

{////////////////////////////////////////////////////}
{ archives spanning across disks }

{  floppy disk types }
TYPE
LZFloppyDiskTypes =
{ 0                1              2                3    }
( FloppyDisk1440, FloppyDisk720, FloppyDisk2880, FloppyDisk360,
{4                 5              6 }
 FloppyDisk1200, FloppyDiskZip, FloppyDiskOther );

{ sample floppy sizes for spanned disks: *with safety margins*
  :correct them as necessary
 }
CONST
OneMegabyte = ( 1024 * 1024 );                { one "real" megabyte }
Floppy1440  = Round ( 1.389 * OneMegabyte );  { 1.44mb floppy }
Floppy720   = Round ( 0.695 * OneMegabyte );  { 720kb floppy }
Floppy2880  = Floppy1440 * 2;                 { 2.88md floppy }
Floppy360   = Floppy720 Div 2;                { 360kb floppy }
Floppy1200  = 1200000;                        { 1.2mb floppy: check this !!!}
FloppyIOZip = Round ( 95.776 * OneMegabyte ); { Iomega ZIP }

{ signature for multi-disk archives & parts }
CONST ChiefSpanSignature = #4#2#10;

{ magic number for multi-disk archives }
CONST ChiefSpanMagicNumber = 100000;

{ record type for multi-disk archives; written at the end of the file }
TYPE
pLZSpanRec = ^TLZSpanRec;
TLZSpanRec = PACKED RECORD
    Signature     : String [3];   { ID signature }
    TotalParts    : Word;        { total number of parts }
    ThisPart      : Word;        { the number of this part }
    StartOffSet   : TLZCount;    { the offset for the beginning of the archive information }
    StopOffSet    : TLZCount;    { the offset for the end of the archive information }
END;

{ to inform us whether to span disks }
TYPE
pLZSpanConfig = ^TLZSpanConfig;
TLZSpanConfig = PACKED RECORD
     DiskSize : TLZCount; { the size of the removeable disk }
     ToSFX    : Boolean;  { should we create an SFX archive ?}
     SfxStub  : ARRAY [0..79] OF Char; { if so, supply the name of the stub }
     SpanName : ARRAY [0..128] OF char; { the name of the spanned archive }
     Count    : TLZCount;
     Flags    : TLZCount; { reserved }
END;

{  Callback type for asking for disks: multi-disk spanned archives
 your function should return 0 to continue, and non-zero to stop
 the process
}
TYPE
TLZSpanPromptProc = FUNCTION ( CONST DiskNum, TotalDisks, NeededSpace : TLZCount; Drive : pChar ) : TLZCount
{$ifdef Win32}STDCALL{$endif Win32};


{password and self-extracting archive stuff}
CONST
Reserved_Code_N = - 20751;
Reserved_Code_S = #4#5#1#2;

{ special record to deal with SFX, passwords, etc. }
TYPE
TLZReserved = PACKED RECORD
   SpanInfo : TLZSpanRec; { reserved! - information for multi-disk archives }
   S_Code   : String [4]; { reserved! - string code for SFX } { MagicS }
   N_Code   : TLZCount;   { reserved! - numeric code for SFX} { MagicN[0] }
   S_OffSet : TLZCount;   { reserved! - Start offset for the header information }{ MagicN[1] }
   N_OffSet : TLZCount;   { reserved! - !!! } { MagicN[2] }
   MagicN   : ARRAY [3..7] OF TLZCount; { can be used for passwords }
   Fill     : ARRAY [1..4] OF Byte; { reserved }
   MagicR   : String [12]; { program to run after extracting SFX}
   SpanR    : String [12]; { reserved! - information for multi-disk archives }
END;
{////////////////////////////////////////////////////}
{/////////////// SINGLE FILE HEADER /////////////////}
{////////////////////////////////////////////////////}
{////////////////////////////////////////////////////}
{///// header for single compressed LZ files  ///////}
TYPE
PLZHeader = ^TLZHeader;
TLZHeader = PACKED RECORD
{ ! do NOT change any of these ! }
 Signature : String [ 10 ];   {the identification header}
 uSize     : TLZCount;        {uncompressed size}
 cSize     : TLZCount;        {compressed size}
 fTime     : TLZCount;        {time/date stamp}
 fAttr     : TLZCount;        {attribute}
 Crc       : TLZCount;        {32-bit CRC}
 Version   : TLZVerStr;       {file version}
 fName     : String [ 128 ];  {filename}
 ID        : TLZCount;        {Archive ID, or zero}
 CompType  : Byte;            {Compression type}
 Reserved  : TLZReserved;     {reserved}
END;
{////////////////////////////////////////////////////}
{////////////////////////////////////////////////////}
{///////////////// ARCHIVE HEADERS //////////////////}
{////////////////////////////////////////////////////}
{////////////////////////////////////////////////////}
{/////// header stuff for ChiefLZ archives //////////}
CONST
MaxChiefLZArchiveSize = {maximum number of files in archives}
1024 * {$ifdef MSDOS}
     2 {$else MSDOS}    { 2k for DOS because of real-mode memory constraints}
     8 {$endif MSDOS};  { let's use more for Windows and Dos DPMI;
                          you can have any number, but you need to have lots
                          of memory for high numbers}

CONST
MaxChiefLZDirectories = ( MaxChiefLZArchiveSize div 2 );

TYPE TLZRecurse = ( LZNoRecurse, LZRecurseOnce, LZFullRecurse );

{* main ChiefLZ archive header *}
TYPE
pLZArchiveHeader = ^TLZArchiveHeader;
TLZArchiveHeader = PACKED RECORD
   Signature : TLZSigStr; {Chief's LZ archive signature}
   Parts     : TLZCount;  {number of parts; reserved for future use}
   Count     : TLZCount;  {number of files in archive}
   CSize     : TLZCount;  {compressed size of archive}
   USize     : TLZCount;  {uncompressed size of archive}
   fBlockLen : TLZCount;  {length of filenames block in header}
   hCRC32    : TLZCount;  {32-bit CRC of main header}
   Reserved  : TLZReserved;{reserved}
END;

{* archive header file records *}
TYPE
pLZFileRec = ^TLZFileRec;
TLZFileRec = PACKED RECORD
{is it a directory?}
       IsDir : Boolean;
{its directory ID}
       DirID : Word;
{its parent directory ID}
       ParentDir : Word;
{any version information?}
       FileVersion : TLZVerStr;
{is it compressed?}
       Compressed : Boolean;
{compressed sizes}
       Sizes : TLZCount;
{uncompressed sizes}
       uSizes : TLZCount;
{date/time stamps}
       Times : TLZCount;
{file attributes}
       fAttrs : TLZCount;
{ 32-bit CRC}
       CRCs  : TLZCount;
{length of the filename}
       NameLen : Byte;
{ Unique 32-bit Identifier for file in archive }
       FileID : TLZCount;
{  Compression type }
       CompressedType : Byte;
END;

TYPE
pFileNamesArray = ^TFileNamesArray;
TFileNamesArray = ARRAY [ 1..MaxChiefLZArchiveSize ] OF pLZString;

TYPE
pFileRecsArray = ^TFileRecsArray;
TFileRecsArray = ARRAY [ 1..MaxChiefLZArchiveSize ] OF pLZFileRec;

{* main record for storing archive file information *}
TYPE
PChiefLZArchiveHeader = ^TChiefLZArchiveHeader;
TChiefLZArchiveHeader = PACKED RECORD
   Count       : TLZCount;        {total file count}
   Files       : TFileRecsArray;  {file records}
   LZFileNames : pFileNamesArray; {file names}
   MainHeader  : TLZArchiveHeader;{copy of main header}
END;

{ callback function to report Archive information;
   * receives LZCode_CallBackStartArchive in "Number" to indicate start
   * receives LZCode_CallBackEndArchive in "Number" to indicate end
   * ViewArchive() obtains the records, and loops through each record
   * the whole Archive information is in pHeader^
   * Number = the number of the record to process
   * return zero to terminate the callback early;
}
TYPE
TViewArchiveProctype = FUNCTION ( pHeader : PChiefLZArchiveHeader; Number : TLZCount ) : TLZCount
{$ifdef Win32}STDCALL{$endif Win32};

{callback function to set Archive PassWord
 - The function should return "LZCode_NewPassWord" if a password was set,
   and a negative value (e.g., LZCode_NoPassWord) if a password was not
   set.

 You should set values only in the Header record's "Reserved.MagicN" field
 to store the password.

}
TYPE
TLZSetPassWordFunc   = FUNCTION ( VAR Header : TLZArchiveHeader ) : TLZCount
{$ifdef Win32}STDCALL{$endif Win32};

{
callback function to check Archive PassWord
your function should return;
 * LZCode_NoPassWord if there is no password
 * LZCode_CorrectPassWord if the password is correct
 * LZCode_WrongPassWord if the password is wrong

 "Code" is always ZERO when the CheckPassword function
 is called by the routines. If "Code" is not equal to ZERO,
 this is an indication of a user-supplied code.

}
TYPE
TLZCheckPassWordFunc = FUNCTION
( CONST Header : TLZArchiveHeader; CONST Code : TLZCount ) : TLZCount
{$ifdef Win32}STDCALL{$endif Win32};

{scan the header for record # index, and return the full name}
FUNCTION GetFullLZName ( CONST  X : TChiefLZArchiveHeader;
                         Index : TLZCount ) : TLZstring;
{$ifdef aDLL} {$ifdef Win32} STDCALL
              {$else Win32}  EXPORT
              {$endif Win32};
{$endif aDLL}

{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{////// ROUTINES TO MANIPULATE ARCHIVE HEADERS ///////////}
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{ Archive header setup; return the size of the allocated block }
FUNCTION LZHeader_Construct ( VAR p : PChiefLZArchiveHeader; CONST aMax : TLZCount ) : TLZCount;

{ Archive header destroy }
PROCEDURE LZHeader_Destroy ( VAR p : PChiefLZArchiveHeader; CONST aMax : TLZCount );

{ write the Archive header information }
FUNCTION WriteFileHeaders
( VAR outfile : File;VAR ArchiveInfo : TChiefLZArchiveHeader;VAR Head : TLZArchiveHeader;
 WriteMain : Boolean ) : TLZCount;

{ read the Archive header information }
FUNCTION ReadFileHeaders
( VAR infile : File;VAR ArchiveInfo : TChiefLZArchiveHeader;CONST Head : TLZArchiveHeader ) : TLZCount;

{ return the 32-bit CRC for the main archive header }
FUNCTION GetArchiveHeaderCRC ( VAR ArchiveInfo : TChiefLZArchiveHeader ) : TLZCount;

FUNCTION  NewString ( CONST s : TLZString ) : PLZString;
PROCEDURE DisposeString ( VAR P : PLZString );

{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
IMPLEMENTATION

USES CHFCRC;
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}

{ array type for writing/reading file names in archive header }
CONST
Max_Arr = 1024 *
{$ifdef Win32}256{$else Win32}{$ifdef MSDOS}32{$else}62{$endif MSDOS}{$endif Win32};

{ block size to write at once in header }
CONST
Max_Num = 1024 * {$ifdef Win32}255{$else Win32}{$ifdef MSDOS}31{$else}61{$endif MSDOS}{$endif Win32};


TYPE
pCharArr = ^TCharArr;
TCharArr = ARRAY [0..Max_Arr] OF char;

{/////////////////////////////////////////////////////////}
{add a Pascal string to a pChar}
FUNCTION StrpCat ( p : pChar; s : TLZString ) : pchar;
BEGIN
   s := s + #0;
   strpcat := strcat ( p, @s [1] );
END;

FUNCTION NewString ( CONST s : TLZString ) : PLZString;
{$ifndef Delphi}
VAR
  Result : PLZString;
{$endif}
BEGIN
{
 If Windows code, we must allow for the possibility that someone might
 try and place a #0 on the end of the string ... allocate an extra byte...
}
  GetMem ( Result, 2 * SizeOf ( Char ) + Length ( s ) );
  IF Result <> NIL THEN Result^ := s;
{$ifndef Delphi}
  NewString := Result;
{$endif}
END;

PROCEDURE DisposeString ( VAR P : PLZString );
BEGIN
  IF Assigned ( p )
  THEN BEGIN
  {$ifdef Delphi}TRY{$endif Delphi}
     FreeMem ( P, 2 * SizeOf ( Char ) + Length ( P^ ) );
  {$ifdef Delphi}EXCEPT END;{$endif Delphi}
  END;
  P := NIL;
END;
{/////////////////////////////////////////////////////////}
FUNCTION LZHeader_Construct ( VAR p : PChiefLZArchiveHeader; CONST aMax : TLZCount ) : TLZCount;
VAR
Max,
i : TLZCount;
j : TLZCount;
BEGIN
   Max := aMax;
   IF Max > MaxChiefLZArchiveSize THEN Max := MaxChiefLZArchiveSize;
   New ( p );
   j := Sizeof ( TChiefLZArchiveHeader ) + Sizeof ( TFileNamesArray );
   WITH p^ DO BEGIN
        Count := 0;
        New ( LZFileNames );
        FillChar ( MainHeader, Sizeof ( MainHeader ), #0 );
        Count := Max;
        MainHeader.Parts := 1; {at the moment we can only have one part}
        MainHeader.Count := Count;
        FOR i := 1 TO Max
        DO BEGIN
           LZFileNames^ [i] := NIL;
           New ( Files [i] );
           Inc ( j,
           ( Sizeof ( TLZString ) {$ifndef Win32}Div 3{$endif Win32} )
           + Sizeof ( TLZFileRec ) );
        END;
   END;
   LZHeader_Construct := j;
END;
{/////////////////////////////////////////////////////////}
PROCEDURE LZHeader_Destroy ( VAR p : PChiefLZArchiveHeader; CONST aMax : TLZCount );
VAR
Max,
i : TLZCount;
BEGIN
   Max := aMax;
   IF Max > MaxChiefLZArchiveSize THEN Max := MaxChiefLZArchiveSize;
   IF Assigned ( p ) THEN BEGIN
     WITH p^ DO BEGIN
        FOR i := Max DOWNTO 1
        DO BEGIN
           IF Assigned ( LZFileNames^ [i] ) THEN DisposeString ( LZFileNames^ [i] );
           IF Assigned ( Files [i] )
           THEN BEGIN
              Dispose ( Files [i] );
              Files [i] := NIL;
           END;
        END; {for i}
        Dispose ( LZFileNames );
     END; {with p^}
     IF Assigned ( p ) THEN Dispose ( p );
   END;
   p := NIL;
END;
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{
simple encryption of filenames before writing them
to the archive header, so that the filename block is
not immediately recognisable if the archive is examined
with an editor;

no fancy encryption is sought here, so please do not change
this encryption function.
}
CONST by = 3; {arbitrary figure that we encrypt/decrypt by}

FUNCTION Encrypt ( s : TLZString ) : TLZString;
VAR
i : Byte;
BEGIN
    FOR i := 1 TO length ( s )
    DO BEGIN
       Inc ( s [i], by + i );
    END;
    Encrypt := s;
END;

FUNCTION Decrypt ( s : TLZString ) : TLZString;
VAR
i : Byte;
BEGIN
    FOR i := 1 TO length ( s )
    DO BEGIN
       Dec ( s [i], by + i );
    END;
    Decrypt := s;
END;
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
FUNCTION GetArchiveHeaderCRC ( VAR ArchiveInfo : TChiefLZArchiveHeader ) : TLZCount;
VAR
i, c : TLZCount;
BEGIN
     InitCRC32 ( c );
     FOR i := 1 TO ArchiveInfo.Count
     DO BEGIN
         UpdateCRC32 ( c, ArchiveInfo.Files [i]^, Sizeof ( ArchiveInfo.Files [i]^ ) );
         UpdateCRC32 ( c, ArchiveInfo.LZFileNames^ [i]^, ArchiveInfo.Files [i]^.NameLen );
     END;
     c := FinalCRC32 ( c );
     GetArchiveHeaderCRC := c;
END;
{/////////////////////////////////////////////////////////}
FUNCTION WriteFileHeaders
( VAR outfile : File;VAR ArchiveInfo : TChiefLZArchiveHeader;VAR Head : TLZArchiveHeader;
 WriteMain : Boolean ) : TLZCount;

VAR
i, j, k, l, Num : TLZCount;
StufftoWrite : pCharArr;
b : boolean;
BEGIN
     WriteFileHeaders := LZCode_HeaderWriteFailure;
     Num := Head.Count;
     IF WriteMain { write the main header }
     THEN BEGIN
        j := 0;
        k := 0;
        l := 0;

        FOR i := 1 TO Num DO BEGIN
            WITH ArchiveInfo.Files [i]^ DO BEGIN
                 inc ( j, uSizes );
                 inc ( k, NameLen );
                 inc ( l, Sizes );
            END; { with }
        END; { for i }

        WITH Head DO BEGIN
          uSize    := j;
          cSize    := l;
          fBlockLen := k;
          Reserved := ArchiveInfo.MainHeader.Reserved;
          hCRC32   := GetArchiveHeaderCRC ( ArchiveInfo );
        END;

     { write the main archive header }
      {$i-}
       BlockWrite ( outfile, Head, Sizeof ( Head ) );
      {$ifdef Win32}{$i+} {$endif Win32}
       IF ioresult <> 0 THEN Exit;
    END; {if writemain}

     StufftoWrite := Nil;
     b := Head.fBlockLen < Max_Num; {can we write the whole at once?}
     IF b THEN BEGIN
        Getmem ( StufftoWrite, Head.fBlockLen + 1 );
        Strpcopy ( StufftoWrite^, '' );
     END;

   { write the archive file information }
     FOR i := 1 TO Num
     DO BEGIN
      {$i-}
         BlockWrite ( outfile, ArchiveInfo.Files [i]^, sizeof ( ArchiveInfo.Files [i]^ ) );
      {$ifdef Win32}{$i+} {$endif Win32}
         IF ioresult <> 0
         THEN BEGIN
            IF b THEN Freemem ( StufftoWrite, Head.fBlockLen + 1 );
            Exit;
         END;
         IF b THEN StrPCat ( StufftoWrite^, Encrypt ( ArchiveInfo.LZFileNames^ [i]^ ) );
     END;

     { write the archive filenames }
     IF b
     THEN BEGIN
      {$i-}
        BlockWrite ( outfile, StufftoWrite^, StrLen ( StufftoWrite^ ) );
      {$ifdef Win32}{$i+} {$endif Win32}
        WriteFileHeaders := IoResult;
        Freemem ( StufftoWrite, Head.fBlockLen + 1 );
     END
     ELSE BEGIN
        Getmem ( StufftoWrite, 255 );
        FOR i := 1 TO Num
        DO BEGIN
            Strpcopy ( StufftoWrite^, Encrypt ( ArchiveInfo.LZFileNames^ [i]^ ) );
            {$i-}
            BlockWrite ( outFile, StufftoWrite^, StrLen ( StufftoWrite^ ) );
            {$ifdef Win32}{$i+} {$endif Win32}
            IF IoResult <> 0
            THEN BEGIN
                Freemem ( StufftoWrite, 255 );
                exit;
            END; {ioresult}
            WriteFileHeaders := 0;
        END; {for i}
        Freemem ( StufftoWrite, 255 );
     END;
END;
{/////////////////////////////////////////////////////////}
FUNCTION ReadFileHeaders
( VAR infile : File;VAR ArchiveInfo : TChiefLZArchiveHeader;CONST Head : TLZArchiveHeader ) : TLZCount;
VAR
Max, i, j, k : TLZCount;
StufftoWrite : pCharArr;
p : pchar;
s : string [3];
BEGIN
     Max := Head.Count;
     IF Max > MaxChiefLZArchiveSize THEN Max := MaxChiefLZArchiveSize;
     ReadFileHeaders := LZCode_HeaderReadFailure;
     ArchiveInfo.MainHeader :=  Head;
     ArchiveInfo.Count := Max;

     FOR i := 1 TO Max
     DO BEGIN
        {$i-}
         BlockRead ( infile, ArchiveInfo.Files [i]^, sizeof ( ArchiveInfo.Files [i]^ ) );
        {$ifdef Win32}{$i+} {$endif Win32}
         IF IoResult <> 0 THEN exit;
     END;

     IF Head.fBlockLen < Max_Num {can we read the whole at once?}
     THEN BEGIN
        Getmem ( StufftoWrite, Head.fBlockLen + 1 );
        Strpcopy ( StufftoWrite^, '' );
        {$i-}
        BlockRead ( infile, StufftoWrite^, Head.fBlockLen );
        {$ifdef Win32}{$i+} {$endif Win32}
        IF IoResult <> 0 THEN BEGIN
           Freemem ( StufftoWrite, Head.fBlockLen + 1 );
           exit;
        END;

        getmem ( p, 255 );
        j := 1;
        k := 0;
        strcopy ( p, '' );
        FOR i := 0 TO Pred ( Head.fBlockLen )
        DO BEGIN
            IF j > Max THEN Break;
            s := StufftoWrite^ [i] + #0;
            strcat ( p, @s [1] );
            inc ( k );
            IF k = ArchiveInfo.Files [j]^.NameLen
            THEN BEGIN
                 ArchiveInfo.LZFileNames^ [j] :=
                 NewString ( Decrypt ( strpas ( p ) ) );
                 strcopy ( p, '' );
                 inc ( j );
                 k := 0;
            END;
        END; {for i}
        Freemem ( p, 255 );
        Freemem ( StufftoWrite, Head.fBlockLen + 1 );
     END { if Head.fBlockLen <= Max_Num }
     ELSE BEGIN
         Getmem ( StufftoWrite, 255 );
         FOR i := 1 TO Max
         DO BEGIN
             {$i-}
             BlockRead ( infile, StufftoWrite^, ArchiveInfo.Files [i]^.NameLen );
             {$ifdef Win32}{$i+} {$endif Win32}
             IF IoResult <> 0 THEN BEGIN
                Freemem ( StufftoWrite, 255 );
                exit;
             END;
             ArchiveInfo.LZFileNames^ [i] :=
             NewString ( Copy ( StrPas ( StufftoWrite^ ), 1,
             ArchiveInfo.Files [i]^.NameLen ) );

             ArchiveInfo.LZFileNames^ [i]^ := Decrypt ( ArchiveInfo.LZFileNames^ [i]^ );
         END;
         Freemem ( StufftoWrite, 255 );
    END;
     { check header CRC }
     j := GetArchiveHeaderCRC ( ArchiveInfo );
     IF ( j <> Head.hCRC32 ) { mismatched header CRC - probably corrupt archive }
     THEN BEGIN
        ReadFileHeaders := LZCode_BadHeaderCRC;
     END ELSE
     ReadFileHeaders := 0;
END;
{/////////////////////////////////////////////////////////}
FUNCTION GetFullLZName ( CONST  X : TChiefLZArchiveHeader;
                         Index : TLZCount ) : TLZstring;
VAR
{$ifndef Delphi}
Result : TLZString;
{$endif Delphi}
i : TLZCount;
BEGIN
  Result := '';
{$ifdef Delphi}
  TRY
{$endif Delphi}
  i := X.Count;
  IF ( i > MaxChiefLZArchiveSize ) THEN {}
  ELSE REPEAT
    IF ( Index > i ) OR ( index > MaxChiefLZArchiveSize ) THEN Break
    ELSE BEGIN
         WITH X.Files [ Index ]^
         DO BEGIN
            Result := X.LZFileNames^ [Index]^ + '\' + Result;
            IF NOT IsDir THEN Index := DirID ELSE Index := ParentDir;
         END;
    END;
  UNTIL Index = 0;
{$ifdef Win32}
  SetLength ( Result, Pred ( Length ( Result ) ) );
{$else Win32}
  Dec ( Result [ 0 ] );
{$endif Win32}
{$ifndef Delphi}
  GetFullLZName := Result;
{$endif Delphi}
{$ifdef Delphi}
  EXCEPT END; { TRY }
{$endif Delphi}

END;
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
END.
