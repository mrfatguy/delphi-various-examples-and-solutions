UNIT CHFLZSS;
{
UNIT implementing a simple Pascal object/Delphi component for ChiefLZ
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


"HOW TO" for ChiefLZ archives;
------------------------------

Legend;
"-" = this step is optional
"*" = this step is mandatory

1. To Create an Archive
          - override Method "SetPassWord"
          - override Method "ProgressReport"
          - SetRecurseDirs
          * SetArchiveFileSpecs
          * SetArchiveName
          * CreateArchive

1A. To Create an Archive spanned across disks
          - override Method "SetPassWord"
          - override Method "ProgressReport"
          - SetRecurseDirs
          * SetArchiveFileSpecs
          * SetArchiveName
          * SetSpanDiskSize  (or SetSpanDiskType)
          * SetSpanDisks
          * CreateArchive

2. To Decompress an archive
          - override Method "CheckPassWord"
          - override Method "ProgressReport"
          - override Method "RequestNewName"
          - override Method "ConfirmOverwrite"
          - SetCheckFileCRC
          - SetDearchiveRecurse
          - SetDeArchiveMask
          * SetArchiveName
          * SetTargetDirectory
          * DecompressArchive

3. To Create a Self-Extracting archive
          - override Method "SetPassWord"
          - override Method "ProgressReport"
          - SetRecurseDirs
          * SetArchiveFileSpecs
          * SetSFXArchiveName
          * SetSFXStub
          * CreateSFXArchive

3A. To Create a Self-Extracting archive spanned across disks
          - override Method "SetPassWord"
          - override Method "ProgressReport"
          - SetRecurseDirs
          * SetArchiveFileSpecs
          * SetSFXArchiveName
          * SetSFXStub
          * SetSpanDiskSize  (or SetSpanDiskType)
          * SetSpanDisks
          * CreateSFXArchive

4. To Decompress a Self-Extracting archive
          - override Method "ProgressReport"
          - override Method "RequestNewName"
          - override Method "ConfirmOverwrite"
          - override Method "CheckPassWord"
          - SetDeArchiveMask
          * SetSFXArchiveName
          * SetTargetDirectory
          * DecompressSFXArchive

5. To Extract the LZ archive from self-extracting archive
          - override Method "CheckPassWord"
          * SetSFXArchiveName
          * SetArchiveName
          * ExtractArchiveFromSFX

6. To List/View the contents of an archive
          - override Method "CheckPassWord"
          - SetDeArchiveMask
          * override Method "ListArchiveContents", or "ViewArchiveContents"
          * SetArchiveName
          * ListArchive, or ViewArchive

7. To List/View the contents of a self-extracting archive
          - override Method "CheckPassWord"
          - SetDeArchiveMask
          * override Method "ListArchiveContents", or "ViewArchiveContents"
          * SetArchiveName
          * ListSfxArchive, or ViewSfxArchive


NOTE: for functional callbacks, you need to override one or more of
the following methods in a descendant object;
 * SetPassWord    - to ask the user for a password and then store the value
 * CheckPassWord  - to ask the user for a password and check if it is correct
 * ProgressReport - for progress report - gauges and percent meters, etc.
 * RequestNewName - to request for a new name for an existing file
 * ConfirmOverwrite - to ask for overwrite permission
 * ViewArchiveContents - view the contents of an archive: used with ViewArchive()
 * ListArchiveContents - an alternate way to view the contents of an archive: used with ListArchive()
 if you don't want any progress report, etc., then you need not
 override any of the above methods
}


INTERFACE

{$i LZDefine.inc}

USES
{$ifdef Windows}
{$ifndef DPMI}
 Wintypes,
 WinProcs,
 {$ifdef TPW}WinDos, {$endif TPW}
{$endif DPMI}
{$endif Windows}
{$ifdef Delphi}
Classes,
SysUtils,
{$else Delphi}
Objects,
Strings,
{$endif Delphi}
{$ifdef aDLL}
LZExplic,
{$else aDLL}
ChiefLZ,
{$endif aDLL}
ChfTypes,
LZThunk,
ChfUtils;

{ /// Delphi events /// }
{$ifdef Delphi}
TYPE
TViewArchiveProctypeEx = FUNCTION ( Sender : pObject; CONST ArchiveInfo : PChiefLZArchiveHeader;
                         CONST CurrentNum : TLZCount ) : TLZCount OF OBJECT;

TYPE
TLZReportProcEx = FUNCTION ( Sender : PObject; CONST CurrentRecord : TLZReportRec; CONST Number : TLZCount ) : TLZCount
OF OBJECT;

TYPE
TLZQuestionFuncEx =
FUNCTION ( Sender : PObject; CONST CurrentRecord : TLZReportRec; CONST ExistingFileRecord : TLZReportRec ) : TLZReply
OF OBJECT;

TYPE
TLZRenameFuncEx = FUNCTION ( Sender : PObject; VAR NewFileName : TLZString ) : boolean
OF OBJECT;

TYPE
TLZSetPassWordFuncEx   = FUNCTION ( Sender : PObject; VAR Header : TLZArchiveHeader ) : TLZCount
OF OBJECT;

TYPE
TLZCheckPassWordFuncEx = FUNCTION ( Sender : PObject; CONST Header : TLZArchiveHeader; CONST Code : TLZCount  ) : TLZCount
OF OBJECT;

TYPE
TLZFileMatchFuncEx = FUNCTION  ( Sender : PObject; FileSpec : TLZString; TheFName : TLZstring; ArchiveID : TLZCount ) : Boolean
OF OBJECT;

TYPE
TLZSpanPromptProcEx = FUNCTION
                    ( Sender : PObject; CONST DiskNum, TotalParts, NeededSpace : TLZCount; Drive : pChar ) : TLZCount
OF OBJECT;

{$endif Delphi}

{////////////////////////////////////////////////////}
{////////////////////////////////////////////////////}
{ ///////////// MAIN CHIEFLZ OBJECT //////////////// }
{////////////////////////////////////////////////////}
{////////////////////////////////////////////////////}
TYPE
TChiefLZObj = {$ifdef Delphi}CLASS ( TComponent ) {$else Delphi}OBJECT ( TObject ) {$Endif Delphi}

 PRIVATE
   fSpanConfigRec : TLZSpanConfig;
   FArchiveFilesHeader : PChiefLZArchiveHeader;
   FRecurseDirs  : TLZRecurse;
   fMakeSfxValue,
   FDearchiveRecurse,
   fCheckFileCRC,
   fCopyOnly     : Boolean;
   fCompressionChoices : TLZCompressionChoices;
   fSFXArchiveName,
   fSFXStub,
   fExtensionstoStore,
   fArchiveName,
   fTargetDirectory,
   fArchiveFileSpecs,
   fDearchiveMask,
   fInputName,
   fOutputName   : TLZString;
   fSpanDiskCount,
   fSpanDiskSize : TLZCount;
   fSpanDisks    : Boolean;
   fFloppyType   : LZFloppyDiskTypes;
   fPromptForDiskProc : TLZSpanPromptProc;

   {  fields for callbacks }
   fSetPassWord   : TLZSetPassWordFunc;
   fCheckPassWord : TLZCheckPassWordFunc;
   fMatchFileFunc : TLZFileMatchFunc;
   {}

   {$ifdef Delphi} { private fields for Delphi events }
   xFQuestionProc : TLZQuestionFuncEx;
   xFReportProc   : TLZReportProcEx;
   xFRenameProc   : TLZRenameFuncEx;
   xFViewProc     : TViewArchiveProctypeEx;
   xFListArchive  : TLZReportProcEx;
   xfSetPassWord  : TLZSetPassWordFuncEx;
   xfCheckPassWord : TLZCheckPassWordFuncEx;
   xfMatchFileFunc : TLZFileMatchFuncEx;
   xfPromptForDiskProc : TLZSpanPromptProcEx;
   {$endif Delphi}

    PROCEDURE   InitAll;
   {initialise the fields on construction and destruction}

   FUNCTION ViewArchiveEx : TLZCount;
   FUNCTION ListArchiveEx : TLZCount;

PUBLIC
   MainArchiveHeader : TLZArchiveHeader;
   {to hold copy of main LZ archive header}

   ReportRec   : TLZReportRec;
   {to hold copy of a TLZReportRec}

   FileHeader  : TLZHeader;
   {to hold copy of a TLZHeader}

   { are we in the process of creating an archive? }
   Archiving  : Boolean;

   { the name for the archive comment if any }
   ArchiveCommentFileName : ARRAY [0..255] OF Char;

   {$ifdef Delphi}
   PROPERTY ArchiveFilesHeader : PChiefLZArchiveHeader read FArchiveFilesHeader write FArchiveFilesHeader;
   {points to the file information part of the archive header}
   {$endif Delphi}

 {$ifdef Delphi}
 PUBLISHED
 {$endif Delphi}

   CONSTRUCTOR Create ( aOwner : {$ifdef Delphi} TComponent {$else} pObject {$endif} );
   {$ifdef Delphi}OVERRIDE;{$endif Delphi}

   CONSTRUCTOR Init ( CONST InfName, OutFName : TLZString );
   {$ifdef Delphi}VIRTUAL;{$endif Delphi}
   { init with source and target file names, or with blanks -
     so set the source and target file names later }

   DESTRUCTOR {$ifdef Delphi} Destroy; OVERRIDE
              {$else}         Done;    VIRTUAL
              {$endif};

{ /// single files /// }
   PROCEDURE SetInputName ( CONST aName : TLZString );VIRTUAL;
   {set source filename: single file compression}

   FUNCTION GetInputName : TLZString; VIRTUAL;
   {return the current InputFileName}

   PROCEDURE SetOutputName ( CONST aName : TLZString );VIRTUAL;
   {set target filename: single file compression}

   FUNCTION GetOutputName : TLZString; VIRTUAL;
   {return the current OutputFileName}

{ /// single file operations /// }
   FUNCTION CompressFile : TLZCount; VIRTUAL;
   {Compress a single source file >> target file }

   FUNCTION DeCompressFile : TLZCount; VIRTUAL;
   {DeCompress a single source file >> target file}

   FUNCTION CompressFileEx : TLZCount; VIRTUAL;
   {Compress a single source file >> target file }

   FUNCTION DeCompressFileEx : TLZCount; VIRTUAL;
   {DeCompress a single source file >> target file}

{ /// archives /// }
   PROCEDURE SetArchiveName ( CONST aName : TLZString );VIRTUAL;
   {set the name of source or target ChiefLZ archives}

   FUNCTION  GetArchiveName : TLZString ;VIRTUAL;
   {get the archive name}

   PROCEDURE SetArchiveFileSpecs ( CONST aSpec : TLZString );VIRTUAL;
   {filespecs for creating ChiefLZ archives}

   FUNCTION  GetArchiveFileSpecs : TLZString ;VIRTUAL;
   {get the specs}

   PROCEDURE SetTargetDirectory ( CONST aName : TLZString );VIRTUAL;
   {set target directory for dearchiving archives (both ordinary
   ChiefLZ, and SFX)}

   FUNCTION  GetTargetDirectory : TLZString ;VIRTUAL;
   {get the target directory}

   PROCEDURE SetRecurseDirs ( CONST aRec : TLZRecurse );VIRTUAL;
   {set recursion flag}

   FUNCTION GetRecurseDirs : TLZRecurse; VIRTUAL;
   {return the current recursion code}

   PROCEDURE SetDeArchiveMask ( CONST Mask : TLZString );VIRTUAL;
   {set the mask for dearchiving; default is '*.*' = all files}

   FUNCTION GetDearchiveMask : TLZString; VIRTUAL;
   {return the current dearchivemask}

   PROCEDURE SetDearchiveRecurse ( Recurse : Boolean );VIRTUAL;
   {set the LZDearchive recursion flag}

   PROCEDURE SetCheckFileCRC ( Check : Boolean );VIRTUAL;
   {set the file CRC checking flag}

   PROCEDURE SetExtractUnExpanded ( Enabled : Boolean );VIRTUAL;
   {set the copy-compressed flag}

   PROCEDURE SetCompressionChoices ( Choice : TLZCompressionChoices ); VIRTUAL;
   {set the type of archive compression to be used in creating archives}

   PROCEDURE SetExtensionstoStore ( CONST Extensions : TLZString ); VIRTUAL;
   {change the file extensions to be stored uncompressed}

   FUNCTION  GetExtensionstoStore : TLZString; VIRTUAL;
   {return the file extensions to be stored uncompressed}

   FUNCTION SetSetPassWordFunc ( aProc : TLZSetPassWordFunc ) : TLZCount; VIRTUAL;
   { point to the function to set the password }

   FUNCTION SetCheckPassWordFunc ( aProc : TLZCheckPassWordFunc ) : TLZCount; VIRTUAL;
   { point to the function to check the password }

   PROCEDURE SetPromptForDiskProc ( aProc : TLZSpanPromptProc ); VIRTUAL;

{/// SFX /////}
   PROCEDURE SetSFXStub ( CONST aStub : TLZString );VIRTUAL;
   {set the name of the .EXE to use as the stub for SFX creation}

   FUNCTION  GetSFXStub : TLZString; VIRTUAL;
   {return the name of the current SFX stub}

   PROCEDURE SetSFXArchiveName ( CONST aName : TLZString );VIRTUAL;
   {set the name of the source or target SFX archive}

   FUNCTION  GetSFXArchiveName : TLZString; VIRTUAL;
   {return the name of the SFX archive}

   PROCEDURE SetMakeSfxValue ( CONST ToSfx : Boolean ); VIRTUAL;
   { toggle whether CreateArchive should create an Sfx archive }

   FUNCTION  GetMakeSfxValue : Boolean;VIRTUAL;
   { return the toggle state of CreateArchive ->> SFX }

   FUNCTION  SetHeaderOffset : TLZCount; VIRTUAL;
   { set the offset for the start of the header;
      do this only if the file is an SFX archive
   }

   PROCEDURE RestoreHeaderOffset ( OffSet : TLZCount ); VIRTUAL;
   { restore the header offset }

{///  archive operations /// }
   FUNCTION CreateArchive : TLZCount;VIRTUAL;
   {create an Archive: using prenamed callback: ConfirmOverwrite }

   FUNCTION DecompressArchive : TLZCount;VIRTUAL;
   {Decompress an Archive; using prenamed callback: ConfirmOverwrite }

   FUNCTION ExtractArchiveFileByName ( CONST fName : TLZString ) : TLZCount;VIRTUAL;

   FUNCTION ExtractArchiveFileByID ( CONST ID : TLZCount ) : TLZCount;VIRTUAL;

   FUNCTION ExtractCommentFromArchive : TLZCount;VIRTUAL;
   {extract any comment file from the archive}

   FUNCTION SetArchiveCommentFile ( fName : TLZString ) : TLZCount;VIRTUAL;
   {set this file as an archive comment file}

   FUNCTION ListArchive : TLZCount; VIRTUAL;
   {view the current archive; using prenamed callback: ListArchiveContents}

   FUNCTION ViewArchive : TLZCount; VIRTUAL;
   {view the current archive; using prenamed callback: ViewArchiveContents}

   FUNCTION GetArchiveSize : TLZCount; VIRTUAL;
   {return the uncompressed size of the archive}

   FUNCTION FullLZName ( RecordNum : TLZCount ) : TLZString;
   {return the full name of record i }

   FUNCTION  GetSpanDiskSize : TLZCount; VIRTUAL;
   { get the size of the removeable disk to be used for disk spanning }

   PROCEDURE SetSpanDiskSize ( CONST dSize : TLZCount ); VIRTUAL;
   { set the size of the removeable disk to be used for disk spanning }

   FUNCTION  GetSpanDisks : Boolean; VIRTUAL;
   { See whether we should span across disks }

   FUNCTION  GetSpanDiskCount : TLZCount; VIRTUAL;
   { retrieve the number of spanned disks }

   FUNCTION  GetSpannedArchiveName : TLZString; VIRTUAL;
   { retrieve the name of the current spanned archive, if any }

   PROCEDURE SetSpanDiskType ( aType : LZFloppyDiskTypes ); VIRTUAL;
   { set the type of floppy for spanned disks: the size is then set automatically }

   FUNCTION  GetSpanDiskType : LZFloppyDiskTypes; VIRTUAL;
   { get the type of floppy disk being used }

   PROCEDURE SetSpanDisks ( ToSpan : Boolean ); VIRTUAL;
   { Decide whether we should span across disks }

   FUNCTION  IsSpanned ( aName : TLZString ) : TLZCount; VIRTUAL;
   { is the archive spanned?
     return:
       < 0 = no valid archive
         0 = normal archive - not spanned
       > 0 = spanned archive - return the number of disks
   }

   FUNCTION  IsSpannedArchive : Boolean; VIRTUAL;
   { is the archive spanned?}

   FUNCTION  IsSpannedSFXArchive : Boolean; VIRTUAL;
   { is the SFX archive spanned?}

{ /// SFX archive operations /// }
   FUNCTION IsSFXArchive : TLZCount; VIRTUAL;
   {is this a ChiefLZ SFX archive ?}

   FUNCTION ListSFXArchive : TLZCount;VIRTUAL;
   { view contents of an SFX archive }

   FUNCTION ViewSFXArchive : TLZCount;VIRTUAL;
   { view contents of an SFX archive, #2 }

   FUNCTION CreateSFXArchive : TLZCount;VIRTUAL;
   {create an SFX Archive }

   FUNCTION DecompressSFXArchive : TLZCount;VIRTUAL;
   {Decompress an SFX Archive}

   FUNCTION ExtractArchiveFromSFX : TLZCount;VIRTUAL;
   {extract LZ archive from SFX file}

{ // callbacks //}
{dummy callback methods - they should normally be overriden }
{default (dummy) "question" method}
   FUNCTION ConfirmOverwrite ( Sender : pObject; CONST Current : TLZReportRec; CONST aExist : TLZReportRec ) : TLZReply;
   VIRTUAL;

  {working, simple "question" method}
   FUNCTION ConfirmOverwriteW ( Sender : pObject; CONST Current : TLZReportRec; CONST aExist : TLZReportRec ) : TLZReply;
   VIRTUAL;

  { default  (dummy) "report" method }
   FUNCTION  ProgressReport ( Sender : pObject; CONST aName : TLZReportRec; CONST Number : TLZCount ) : TLZCount ;
   VIRTUAL;

  { default (dummy) "rename" method }
   FUNCTION RequestNewName ( Sender : pObject; VAR NewFileName : TLZString ) : boolean;
   VIRTUAL;

  { default (dummy) "list" method }
  FUNCTION  ListArchiveContents ( Sender : pObject; CONST X : TLZReportRec;  CONST i : TLZCount ) : TLZCount;
  VIRTUAL;

  { default (dummy) "view" method }
  FUNCTION  ViewArchiveContents ( Sender : pObject; CONST X : PChiefLZArchiveHeader; CONST i : TLZCount ) : TLZCount;
  VIRTUAL;

 { default (dummy) "setpassword" method }
   FUNCTION SetPassWord ( Sender : pObject; VAR Header : TLZArchiveHeader ) : TLZCount; VIRTUAL;

 { default (dummy) "checkpassword" method }
   FUNCTION CheckPassWord
   ( Sender : pObject; CONST Header : TLZArchiveHeader; CONST Code : TLZCount  ) : TLZCount; VIRTUAL;

 { default (dummy) "filematch" method }
   FUNCTION MatchFileName
   ( Sender : PObject; FileSpec : TLZString; TheFName : TLZstring; ArchiveID : TLZCount ) : Boolean; VIRTUAL;

   { dummy disk prompt function  }
   FUNCTION PromptForDisk
   ( Sender : PObject; CONST DiskNum, TotalParts, NeededSpace : TLZCount; Drive : pChar ) : TLZCount; VIRTUAL;

 {$ifdef Delphi}
 {* published properties *}
 {* single files *}
   PROPERTY InputFileName      : TLZString      read GetInputName     write SetInputName;
   PROPERTY OutputFileName     : TLZString      read GetOutputName    write SetOutputName;

 { * archives * }
 { events }
   PROPERTY OnConfirmOverwrite : TLZQuestionFuncEx read xfQuestionProc  write xfQuestionProc;
   PROPERTY OnProgressReport   : TLZReportProcEx   read xfReportProc    write xfReportProc;
   PROPERTY OnSeekToReName     : TLZRenameFuncEx   read xfRenameProc    write xfRenameProc;
   PROPERTY OnListArchive      : TLZReportProcEx   read xFListArchive   write xFListArchive;
   PROPERTY OnViewArchive      : TViewArchiveProctypeEx read xfViewProc write xfViewProc;
   PROPERTY OnRequestPassWord  : TLZSetPassWordFuncEx   read xfSetPassWord    write xfSetPassWord;
   PROPERTY OnCheckPassWord    : TLZCheckPassWordFuncEx read xfCheckPassWord  write xfCheckPassWord;
   PROPERTY OnMatchFileName    : TLZFileMatchFuncEx     read xfMatchFileFunc  write xfMatchFileFunc;
   PROPERTY OnPromptForDisk    : TLZSpanPromptProcEx    read xfPromptForDiskProc write xfPromptForDiskProc;


 { other properties }
   PROPERTY RecurseDirs        : TLZRecurse read GetRecurseDirs write SetRecurseDirs;
   PROPERTY DearchiveRecurse   : Boolean    read FDearchiveRecurse write SetDearchiveRecurse;
   PROPERTY CheckFileCRCs      : Boolean    read fCheckFileCRC write SetCheckFileCRC;
   PROPERTY ExtractUnExpanded  : Boolean    read fCopyOnly write SetExtractUnExpanded;
   PROPERTY CompressionChoice  : TLZCompressionChoices read fCompressionChoices write SetCompressionChoices;
   PROPERTY ArchiveSize        : TLZCount   read GetArchiveSize;
   PROPERTY ExtensionstoStore  : TLZString  read GetExtensionstoStore write SetExtensionstoStore;
   PROPERTY ArchiveName        : TLZString  read GetArchiveName   write SetArchiveName;
   PROPERTY ArchiveFileSpecs   : TLZString  read GetArchiveFileSpecs write SetArchiveFileSpecs;
   PROPERTY DeArchiveMask      : TLZString  read GetDeArchiveMask write SetDearchiveMask;
   PROPERTY SFXStub            : TLZString  read GetSFXStub write SetSFXStub;
   PROPERTY SFXArchiveName     : TLZString  read GetSFXArchiveName write SetSFXArchiveName;
   PROPERTY MakeSFXArchive     : Boolean    Read GetMakeSfxValue write SetMakeSfxValue;
   PROPERTY SpanDisks          : Boolean    read GetSpanDisks write SetSpanDisks;
   PROPERTY SpanDiskCount      : TLZCount   read GetSpanDiskCount;
   PROPERTY SpanArchiveName    : TLZString  read GetSpannedArchiveName;
   PROPERTY SpanDiskSize       : TLZCount   Read GetSpanDiskSize write SetSpanDiskSize;
   PROPERTY SpanDiskType       : LZFloppyDiskTypes read GetSpanDiskType write SetSpanDiskType;
   PROPERTY DeArchiveTargetDirectory : TLZString  read GetTargetDirectory write SetTargetDirectory;

 {$endif Delphi}
END; {TChiefLZObj}

TYPE
pChiefLZObj = {$ifndef Delphi}^{$Endif Delphi}TChiefLZObj;
{////////////////////////////////////////////////////}
{////////////////////////////////////////////////////}
{////////////////////////////////////////////////////}
{$ifdef Delphi}
PROCEDURE Register;
{$endif Delphi}
{////////////////////////////////////////////////////}
{////////////////////////////////////////////////////}
{////////////////////////////////////////////////////}

IMPLEMENTATION

VAR
LocalInstance : pointer;

{////////////////////////////////////////////////////}
{$ifdef Delphi}
PROCEDURE Register;
BEGIN
   RegisterComponents ( 'ChiefLZ', [ TChiefLZObj ] );
END;
{$endif Delphi}
{/////////////////////////////////////////////////////////}

{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{///////////   DEFAULT CALLBACK FUNCTIONS   //////////////}
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{ "ListProc" }
FUNCTION ListArchiveContentsEx ( CONST X : TLZReportRec;  CONST i : TLZCount ) : TLZCount;
{$ifdef Win32}STDCALL;{$else Win32}{$ifdef aDLL}EXPORT;{$endif aDLL}{$endif Win32}
BEGIN
   ListArchiveContentsEx := 0;
   IF ( NOT Assigned ( LocalInstance ) ) THEN Exit;
   WITH TChiefLZObj ( LocalInstance{$ifndef Delphi}^{$endif Delphi} )
   DO BEGIN
{$ifdef Delphi}
       IF ( NOT Assigned ( xFListArchive ) ) THEN exit;
       Result := xFListArchive ( pChiefLZObj ( LocalInstance ), x, i );
{$else Delphi}
       ListArchiveContentsEx :=
       ListArchiveContents ( pChiefLZObj ( LocalInstance ), x, i );
{$endif Delphi}
   END; { With }
   ResetPassWordFlag;
END;
{/////////////////////////////////////////////////////////}
{ "ViewProc" }
FUNCTION ViewArchiveContentsEx ( CONST X : PChiefLZArchiveHeader; CONST i : TLZCount ) : TLZCount;
{$ifdef Win32}STDCALL;{$else Win32}{$ifdef aDLL}EXPORT;{$endif aDLL}{$endif Win32}
BEGIN
   ViewArchiveContentsEx := 0;
   IF ( NOT Assigned ( LocalInstance ) ) THEN Exit;
   WITH TChiefLZObj ( LocalInstance{$ifndef Delphi}^{$endif Delphi} )
   DO BEGIN
{$ifdef Delphi}
       IF ( NOT Assigned ( xfViewProc ) ) THEN exit;
       Result := xfViewProc ( pChiefLZObj ( LocalInstance ), x, i );
{$else Delphi}
       ViewArchiveContentsEx :=
       ViewArchiveContents ( pChiefLZObj ( LocalInstance ), x, i );
{$endif Delphi}
   END; { With }
   ResetPassWordFlag;
END;
{/////////////////////////////////////////////////////////}
{ "QuestionProc: LZQuestion" }
FUNCTION ConfirmOverwriteEx ( CONST LZRecord : TLZReportRec; CONST ExistingFile : TLZReportRec ) : TLZReply;
{$ifdef Win32}STDCALL;{$else Win32}{$ifdef aDLL}EXPORT;{$endif aDLL}{$endif Win32}
BEGIN
   ConfirmOverwriteEx := LZYes;
   IF ( NOT Assigned ( LocalInstance ) ) THEN Exit;
   WITH TChiefLZObj ( LocalInstance{$ifndef Delphi}^{$endif Delphi} )
   DO BEGIN
{$ifdef Delphi}
       IF ( NOT Assigned ( xfQuestionProc ) ) THEN exit;
       Result  :=
       xFQuestionProc ( pChiefLZObj ( LocalInstance ), LZRecord, ExistingFile );
{$else Delphi}
       ConfirmOverwriteEx :=
       ConfirmOverwrite ( pChiefLZObj ( LocalInstance ), LZRecord, ExistingFile );
{$endif Delphi}
   END; { With }
END;
{/////////////////////////////////////////////////////////}
{ "ReportProc: LZReport" }
FUNCTION ProgressReportEx ( CONST LZRecord : TLZReportRec; CONST Number : TLZCount ) : TLZCount;
{$ifdef Win32}STDCALL;{$else Win32}{$ifdef aDLL}EXPORT;{$endif aDLL}{$endif Win32}
BEGIN
   ProgressReportEx := 1;
   IF ( NOT Assigned ( LocalInstance ) ) THEN Exit;
   WITH TChiefLZObj ( LocalInstance{$ifndef Delphi}^{$endif Delphi} )
   DO BEGIN
{$ifdef Delphi}
       IF ( NOT Assigned ( xfReportProc ) ) THEN exit;
       xfReportProc ( pChiefLZObj ( LocalInstance ), LZRecord, Number );
{$else Delphi}
       ProgressReport ( pChiefLZObj ( LocalInstance ), LZRecord, Number );
{$endif Delphi}
   END; { With }
END;
{/////////////////////////////////////////////////////////}
{ "RenameProc: LZRename" }
FUNCTION RequestNewNameEx ( VAR NewFileName : TLZString ) : boolean;
{$ifdef Win32}STDCALL;{$else Win32}{$ifdef aDLL}EXPORT;{$endif aDLL}{$endif Win32}
BEGIN
   RequestNewNameEx := False;
   IF ( NOT Assigned ( LocalInstance ) ) THEN Exit;
   WITH TChiefLZObj ( LocalInstance{$ifndef Delphi}^{$endif Delphi} )
   DO BEGIN
{$ifdef Delphi}
       IF ( NOT Assigned ( xfRenameProc ) ) THEN exit;
       Result := xfRenameProc ( pChiefLZObj ( LocalInstance ), NewFileName );
{$else Delphi}
       RequestNewNameEx := RequestNewName ( pChiefLZObj ( LocalInstance ), NewFileName );
{$endif Delphi}
   END; { With }
END;
{/////////////////////////////////////////////////////////}
{ Set Password func }
FUNCTION SetPassWordFuncEx  ( VAR Header : TLZArchiveHeader ) : TLZCount;
{$ifdef Win32}STDCALL;{$else Win32}{$ifdef aDLL}EXPORT;{$endif aDLL}{$endif Win32}
BEGIN
   SetPassWordFuncEx := LZCode_NoPassWord;
   IF ( NOT Assigned ( LocalInstance ) ) THEN Exit;
   WITH TChiefLZObj ( LocalInstance{$ifndef Delphi}^{$endif Delphi} )
   DO BEGIN
{$ifdef Delphi}
       IF ( NOT Assigned ( xfSetPassWord ) ) THEN exit;
       Result := xfSetPassWord ( pChiefLZObj ( LocalInstance ), Header );
{$else Delphi}
       SetPassWordFuncEx := SetPassWord ( pChiefLZObj ( LocalInstance ), Header );
{$endif Delphi}
   END; { With }
END;
{/////////////////////////////////////////////////////////}
{ Check Password func }
FUNCTION CheckPassWordFuncEx ( CONST Header : TLZArchiveHeader; CONST Code : TLZCount  ) : TLZCount;
{$ifdef Win32}STDCALL;{$else Win32}{$ifdef aDLL}EXPORT;{$endif aDLL}{$endif Win32}
BEGIN
   CheckPassWordFuncEx := LZCode_NoPassWord;
   IF ( NOT Assigned ( LocalInstance ) ) THEN Exit;
   WITH TChiefLZObj ( LocalInstance{$ifndef Delphi}^{$endif Delphi} )
   DO BEGIN
{$ifdef Delphi}
       IF ( NOT Assigned ( xfCheckPassWord ) ) THEN exit;
       Result := xfCheckPassWord ( pChiefLZObj ( LocalInstance ), Header, Code );
{$else Delphi}
       CheckPassWordFuncEx := CheckPassWord ( pChiefLZObj ( LocalInstance ), Header, Code );
{$endif Delphi}
   END; { With }
END;
{/////////////////////////////////////////////////////////}
{ File match function }
FUNCTION MatchFileNameEx ( FileSpec : TLZString; TheFName : TLZstring; ArchiveID : TLZCount ) : Boolean;
{$ifdef Win32}STDCALL;{$else Win32}{$ifdef aDLL}EXPORT;{$endif aDLL}{$endif Win32}
BEGIN
   MatchFileNameEx := True;
   IF ( NOT Assigned ( LocalInstance ) ) THEN Exit;
   WITH TChiefLZObj ( LocalInstance{$ifndef Delphi}^{$endif Delphi} )
   DO BEGIN
{$ifdef Delphi}
       IF ( NOT Assigned ( xfMatchFileFunc ) ) THEN exit;
       Result := xfMatchFileFunc ( pChiefLZObj ( LocalInstance ),
                 FileSpec, TheFName, ArchiveID );
{$else Delphi}
       MatchFileNameEx := MatchFileName ( pChiefLZObj ( LocalInstance ),
                          FileSpec, TheFName, ArchiveID );
{$endif Delphi}
   END; { With }
END;
{/////////////////////////////////////////////////////////}
FUNCTION PromptForDiskEx
( CONST DiskNum, TotalParts, NeededSpace : TLZCount; Drive : pChar ) : TLZCount;
{$ifdef Win32}STDCALL;{$else Win32}{$ifdef aDLL}EXPORT;{$endif aDLL}{$endif Win32}
BEGIN
   PromptForDiskEx := 1;  { don't continue }
   IF ( NOT Assigned ( LocalInstance ) ) THEN Exit;
   WITH TChiefLZObj ( LocalInstance{$ifndef Delphi}^{$endif Delphi} )
   DO BEGIN
{$ifdef Delphi}
       IF ( NOT Assigned ( xfPromptForDiskProc ) ) THEN exit;
       Result := xfPromptForDiskProc
       ( pChiefLZObj ( LocalInstance ), DiskNum, TotalParts, NeededSpace, Drive );
{$else Delphi}
       PromptForDiskEx := PromptForDisk
       ( pChiefLZObj ( LocalInstance ), DiskNum, TotalParts, NeededSpace, Drive );
{$endif Delphi}
   END; { With }
END;
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{ ///////////// THE MAIN CHIEFLZ OBJECT ///////////////// }
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{initialise some values; called by the Constructor and the Destructor}
PROCEDURE   TChiefLZObj.InitAll;
BEGIN
   FArchiveFilesHeader := NIL;
   SetCompressionChoices ( LZMaxCompression ); {default to LZH6 compression}

   { these callback fields point to nothing }
   SetSetPassWordFunc ( NIL );
   SetCheckPassWordFunc ( NIL );
   fMatchFileFunc := NIL;

   { make these point to functions in this unit, which in turn
     call other methods }
   SetArchiveSetPassWordFunc ( SetPassWordFuncEx );
   SetArchiveCheckPassWordFunc ( CheckPassWordFuncEx );
   SetPromptForDiskProc ( PromptForDiskEx );

   { initialise some other default values }
   RestoreHeaderOffset ( 0 );
   SetDeArchiveMask ( '*.*' );
   SetCheckFileCRC ( FALSE );
   SetDeArchiveRecurse ( TRUE );
   SetExtractUnExpanded ( False );
   SetExtensionstoStore ( StrPas ( GetIgnoreExtensions ) );
   SetInputName ( '' );
   SetOutputName ( '' );
   SetArchiveName ( '' );
   SetArchiveFileSpecs ( '' );
   SetTargetDirectory ( '' );
   SetSFXStub ( '' );
   SetSFXArchiveName ( '' );
   SetMakeSfxValue ( False );
   SetRecurseDirs ( LZNoRecurse );
   FillChar ( MainArchiveHeader, SizeOf ( MainArchiveHeader ), #0 );
   FillChar ( ReportRec, SizeOf ( ReportRec ), #0 );
   FillChar ( FileHeader, SizeOf ( FileHeader ), #0 );
   FillChar ( fSpanConfigRec, SizeOf ( fSpanConfigRec ), #0 );
   Archiving  := False;

   { disk spanning }
   SetSpanDiskType ( FloppyDisk1440 );
   SetSpanDisks ( False );
   fSpanDiskCount := 0;

   { password }
   ResetPassWordFlag;
END;
{////////////////////////////////////////////////////}
CONSTRUCTOR TChiefLZObj.Create;
BEGIN
 {$ifdef Delphi}
   INHERITED Create ( aOwner );
   OnViewArchive      := ViewArchiveContents;
   OnListArchive      := ListArchiveContents;
   OnSeekToReName     := RequestNewName;
   OnProgressReport   := ProgressReport;
   OnConfirmOverwrite := ConfirmOverwrite;
   OnRequestPassWord  := SetPassWord;
   OnCheckPassWord    := CheckPassWord;
   OnMatchFileName    := MatchFileName;
   OnPromptForDisk    := PromptForDisk;
 {$endif Delphi}

   LocalInstance := pChiefLZObj ( {$ifndef Delphi}@{$endif Delphi}Self );

   { save the original }
   @fPromptForDiskProc := SetSpanDiskPromptFunc ( Nil );
   InitAll;
END;
{////////////////////////////////////////////////////}
CONSTRUCTOR TChiefLZObj.Init;
BEGIN
 {$ifndef Delphi}
   INHERITED Init;
 {$endif Delphi}
   Create ( NIL );
   SetInputName ( InFName );
   SetOutputName ( OutFName );
END;
{////////////////////////////////////////////////////}
DESTRUCTOR TChiefLZObj.{$ifdef Delphi} Destroy {$else} Done {$endif};
BEGIN
   LocalInstance := NIL;
   InitAll;
   INHERITED {$ifdef Delphi} Destroy;{$else Delphi}Done;{$endif Delphi}
END;
{////////////////////////////////////////////////////}
{////////////////////////////////////////////////////}
{///////////// SINGLE COMPRESSED FILES //////////////}
{////////////////////////////////////////////////////}
{////////////////////////////////////////////////////}
PROCEDURE TChiefLZObj.SetInputName;
BEGIN
  fInputName := aName;
END;
{////////////////////////////////////////////////////}
PROCEDURE TChiefLZObj.SetOutputName;
BEGIN
   fOutputName := aName;
END;
{////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.GetInputName : TLZString;
BEGIN
  GetInputName := fInputName;
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.GetOutputName : TLZString;
BEGIN
  GetOutputName := fOutputName;
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.CompressFile : TLZCount;
BEGIN
   IF Length ( FOutputName ) > 0 THEN
     CompressFile := LZCompress ( 
     Str2PChar ( fInputName ),
     Str2PChar ( fOutputName ),
     ConfirmOverwriteEx,
     ProgressReportEx,
     fCompressionChoices )
   ELSE
     CompressFile := LZCompressEx ( 
     Str2PChar ( fInputName ),
     ConfirmOverwriteEx,
     ProgressReportEx )
END;
{////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.DeCompressFile : TLZCount;
BEGIN
   IF Length ( FOutputName ) > 0 THEN
     DeCompressFile := LZDeCompress ( 
     Str2PChar ( fInputName ),
     Str2PChar ( fOutputName ),
     ConfirmOverwriteEx,
     ProgressReportEx )
   ELSE
     DeCompressFile := LZDeCompressEx ( 
     Str2PChar ( fInputName ),
     ConfirmOverwriteEx,
     ProgressReportEx )
END;
{////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.CompressFileEx : TLZCount;
BEGIN
     CompressFileEx := LZCompressEx ( 
     Str2PChar ( fInputName ),
     ConfirmOverwriteEx,
     ProgressReportEx )
END;
{////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.DeCompressFileEx : TLZCount;
BEGIN
     DeCompressFileEx := LZDeCompressEx ( 
     Str2PChar ( fInputName ),
     ConfirmOverwriteEx,
     ProgressReportEx )
END;
{////////////////////////////////////////////////////}
{////////////////////////////////////////////////////}
{///////////// COMPRESSED ARCHIVES //////////////////}
{////////////////////////////////////////////////////}
{////////////////////////////////////////////////////}
PROCEDURE TChiefLZObj.SetDeArchiveMask ( CONST Mask : TLZString );
BEGIN
  fDeArchiveMask := Mask;
  SetDecompressMask ( Str2pChar ( fDeArchiveMask ) );
END;
{/////////////////////////////////////////////////////////}
PROCEDURE TChiefLZObj.SetRecurseDirs ( CONST aRec : TLZRecurse );
BEGIN
   fRecurseDirs := aRec;
END;
{/////////////////////////////////////////////////////////}
PROCEDURE TChiefLZObj.SetDearchiveRecurse ( Recurse : Boolean );
BEGIN
   FDearchiveRecurse := Recurse;
END;
{/////////////////////////////////////////////////////////}
PROCEDURE TChiefLZObj.SetCheckFileCRC ( Check : Boolean );
BEGIN
   fCheckFileCRC := Check;
   SetCheckFileCRCs ( Check );
END;
{/////////////////////////////////////////////////////////}
PROCEDURE TChiefLZObj.SetExtractUnExpanded ( Enabled : Boolean );
BEGIN
   fCopyOnly := Enabled;
END;
{/////////////////////////////////////////////////////////}
PROCEDURE TChiefLZObj.SetCompressionChoices ( Choice : TLZCompressionChoices );
BEGIN
   fCompressionChoices := Choice;
END;
{/////////////////////////////////////////////////////////}
PROCEDURE TChiefLZObj.SetArchiveName ( CONST aName : TLZString );
BEGIN
   fArchiveName := aName;
END;
{/////////////////////////////////////////////////////////}
FUNCTION  TChiefLZObj.GetArchiveName : TLZString ;
BEGIN
   GetArchiveName := fArchiveName;
END;
{/////////////////////////////////////////////////////////}
PROCEDURE TChiefLZObj.SetArchiveFileSpecs ( CONST aSpec : TLZString );
BEGIN
   fArchiveFileSpecs := aSpec;
END;
{/////////////////////////////////////////////////////////}
FUNCTION  TChiefLZObj.GetArchiveFileSpecs : TLZString ;
BEGIN
   GetArchiveFileSpecs := fArchiveFileSpecs;
END;
{/////////////////////////////////////////////////////////}
PROCEDURE TChiefLZObj.SetTargetDirectory ( CONST aName : TLZString );
BEGIN
   fTargetDirectory := aName;
END;
{/////////////////////////////////////////////////////////}
FUNCTION  TChiefLZObj.GetTargetDirectory : TLZString ;
BEGIN
   GetTargetDirectory := fTargetDirectory;
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.GetArchiveSize : TLZCount;
BEGIN
  GetArchiveSize := GetChiefLZArchiveSize ( Str2PChar ( fInputName ) );
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.GetDearchiveMask : TLZString;
BEGIN
  GetDearchiveMask := fDearchiveMask;
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.GetRecurseDirs : TLZRecurse;
BEGIN
  GetRecurseDirs := fRecurseDirs;
END;
{/////////////////////////////////////////////////////////}
PROCEDURE TChiefLZObj.SetExtensionstoStore ( CONST Extensions : TLZString );
BEGIN
   fExtensionstoStore := Extensions;
   SetIgnoreExtensions ( Str2PChar ( fExtensionstoStore ) );
END;
{////////////////////////////////////////////////////}
PROCEDURE TChiefLZObj.SetSFXStub ( CONST aStub : TLZString );
BEGIN
  fSFXStub := aStub;
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.GetSFXStub : TLZString;
BEGIN
   GetSFXStub := fSFXStub;
END;
{/////////////////////////////////////////////////////////}
PROCEDURE TChiefLZObj.SetSFXArchiveName ( CONST aName : TLZString );
BEGIN
   fSFXArchiveName := aName;
END;
{/////////////////////////////////////////////////////////}
FUNCTION  TChiefLZObj.GetSFXArchiveName : TLZString;
BEGIN
   GetSFXArchiveName := fSFXArchiveName;
END;
{/////////////////////////////////////////////////////////}
PROCEDURE TChiefLZObj.SetMakeSfxValue ( CONST ToSfx : Boolean );
BEGIN
    fMakeSfxValue := ToSfx;
END;
{/////////////////////////////////////////////////////////}
FUNCTION  TChiefLZObj.GetMakeSfxValue : Boolean;
BEGIN
       GetMakeSfxValue := fMakeSfxValue;
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.CreateArchive : TLZCount;
BEGIN
   fSpanDiskCount := 0;
   { should we be creating an SFX archive ?}
   IF fMakeSfxValue
   THEN BEGIN
      CreateArchive := CreateSFXArchive;
      exit;
   END;
   Archiving  := True;
   IF GetSpanDisks  { should we do some disk spanning? }
   THEN BEGIN
      WITH fSpanConfigRec
      DO BEGIN
           DiskSize := GetSpanDiskSize;
           ToSfx    := False;
           Count    := 0;
           StrpCopy ( SfxStub, '' );
           StrpCopy ( SpanName, '' );
           CreateArchive := LZArchiveSpan ( 
                     Str2PChar ( fArchiveFileSpecs ), Str2PChar ( fArchiveName ),
                     fRecurseDirs, ProgressReportEx, fCompressionChoices, @fSpanConfigRec );
           fSpanDiskCount := fSpanConfigRec.Count;
      END;
   END
   ELSE
   CreateArchive := LZArchive ( 
                     Str2PChar ( fArchiveFileSpecs ), Str2PChar ( fArchiveName ),
                     fRecurseDirs, ProgressReportEx, fCompressionChoices );

   Archiving  := False;
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.DecompressArchive : TLZCount;
BEGIN
   Archiving  := False;
   DecompressArchive := LZDearchive
   ( 
   Str2PChar ( fArchiveName ),
   Str2PChar ( fTargetDirectory ),
   ConfirmOverwriteEx,
   ProgressReportEx,
   RequestNewNameEx,
   FDearchiveRecurse,
   fCopyOnly
   );
END;
{////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.CreateSFXArchive : TLZCount;
BEGIN
   Archiving  := True;
   fSpanDiskCount := 0;
   IF GetSpanDisks
   THEN BEGIN
      WITH fSpanConfigRec
      DO BEGIN
           DiskSize := GetSpanDiskSize;
           ToSfx    := True;
           Count    := 0;
           StrpCopy ( SfxStub, fSFXStub );
           StrpCopy ( SpanName, '' );
           CreateSFXArchive := LZArchiveSpan ( 
                     Str2PChar ( fArchiveFileSpecs ), Str2PChar ( fSFXArchiveName ),
                     fRecurseDirs, ProgressReportEx, fCompressionChoices, @fSpanConfigRec );
           fSpanDiskCount := fSpanConfigRec.Count;
      END;
   END
   ELSE CreateSFXArchive :=  LZSfxArchive
        ( Str2PChar ( fSFXStub ), Str2PChar ( fArchiveFileSpecs ),
        Str2PChar ( fSFXArchiveName ), fRecurseDirs, ProgressReportEx, fCompressionChoices );
   Archiving  := False;
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.DecompressSFXArchive : TLZCount;
BEGIN
   Archiving  := False;
   DecompressSFXArchive := LZSFXDearchive
   ( Str2PChar ( fSFXArchiveName ), Str2PChar ( fTargetDirectory ),
   ConfirmOverwriteEx, ProgressReportEx, RequestNewNameEx, FDearchiveRecurse, fCopyOnly );
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.ExtractArchiveFromSFX : TLZCount;
BEGIN
  Archiving  := False;
  IF fArchiveName = ''
    THEN fArchiveName := ChangeFileExt ( fSFXArchiveName, '.LZA' );

  ExtractArchiveFromSFX := LZArchiveFromLZSFXArchive ( 
                           Str2PChar ( fSFXArchiveName ), {source SFX archive}
                           Str2PChar ( fArchiveName ) );  {target LZSS archive}
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.ExtractArchiveFileByName ( CONST fName : TLZString ) : TLZCount;
VAR
s : TLZString;
BEGIN
   S := FName;
   SetDecompressMask ( Str2pChar ( s ) );
   ExtractArchiveFileByName := LZDearchive
                     ( Str2PChar ( fArchiveName ), Str2PChar ( fTargetDirectory ),
                      Nil, Nil, Nil, FDearchiveRecurse, fCopyOnly );
   SetDecompressMask ( Str2pChar ( fDeArchiveMask ) );
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.ExtractArchiveFileByID ( CONST ID : TLZCount ) : TLZCount;
VAR
s : String [12];
BEGIN
   S := '#:' + IntToStr ( ID );
   SetDecompressMask ( Str2pChar ( s ) );
   ExtractArchiveFileByID := LZDearchive
                     ( Str2PChar ( fArchiveName ), Str2PChar ( fTargetDirectory ),
                      Nil, Nil, Nil, FDearchiveRecurse, fCopyOnly );
   SetDecompressMask ( Str2pChar ( fDeArchiveMask ) );
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.IsSFXArchive : TLZCount;
{returns
= 0 = ordinary ChiefLZ archive
< 0 = neither ordinary nor SFX ChiefLZ archive
> 0 = ChiefLZ SFX archive
}
BEGIN
  IsSFXArchive := IsChiefLZSfxArchive ( Str2PChar ( fSFXArchiveName ), MainArchiveHeader );

  { is it a multi-part spanned archive ? }
  IF IsChiefLZSpannedHeader ( MainArchiveHeader )
    THEN fSpanDiskCount := MainArchiveHeader.Parts;
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.ListSFXArchive : TLZCount;
VAR
s : TLZString;
i, j : TLZCount;
BEGIN
  j := IsSFXArchive;
  i := 0;
  IF j > 0 THEN BEGIN
     s := fArchiveName;
     fArchiveName := fSFXArchiveName;
     i := SetHeaderOffset;
  END;
  ListSFXArchive := ListArchiveEx;
  IF i > 0 THEN BEGIN
     RestoreHeaderOffSet ( i );
     fArchiveName := s;
  END;
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.ListArchive : TLZCount;
BEGIN
   IF IsSFXArchive > 0
   THEN ListArchive := ListSFXArchive
   ELSE ListArchive := ListArchiveEx;
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.ListArchiveEx : TLZCount;
BEGIN
   fSpanDiskCount := 0;
   ListArchiveEx := LZListArchive ( Str2PChar ( fArchiveName ), @MainArchiveHeader, ListArchiveContentsEx );

   { is it a multi-part spanned archive ? }
   IF IsChiefLZSpannedHeader ( MainArchiveHeader )
    THEN fSpanDiskCount := MainArchiveHeader.Parts;
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.ViewSFXArchive : TLZCount;
VAR
s : TLZString;
i, j : TLZCount;
BEGIN
  j := IsSFXArchive;
  i := 0;
  IF j > 0 THEN BEGIN  { it is an SFX }
     s := fArchiveName;
     fArchiveName := fSFXArchiveName;
     i := SetHeaderOffset;
  END;
  ViewSFXArchive := ViewArchiveEx;
  IF i > 0 THEN BEGIN
     RestoreHeaderOffSet ( i );
     fArchiveName := s;
  END;
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.ViewArchive : TLZCount;
BEGIN
   IF IsSFXArchive > 0
   THEN ViewArchive := ViewSFXArchive
   ELSE ViewArchive := ViewArchiveEx;
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.ViewArchiveEx : TLZCount;
VAR
b   : Boolean;
i   : TLZCount;
j, k : TLZCount;

BEGIN
   fSpanDiskCount := 0;
   ViewArchiveEx := LZCode_NotLZArchive;

   j := IsChiefLZArchiveEx ( Str2PChar ( fArchiveName ),
                           MainArchiveHeader );
   IF j < 1 THEN Exit;

   { is it a multi-part spanned archive ? }
   IF IsChiefLZSpannedHeader ( MainArchiveHeader )
    THEN fSpanDiskCount := MainArchiveHeader.Parts;

   LZHeader_Construct ( FArchiveFilesHeader, j );

   IF NOT Assigned ( FArchiveFilesHeader ) THEN Exit;
 {$ifdef Delphi}
    TRY
 {$endif Delphi}
    k := GetChiefLZArchiveInfo
    ( Str2PChar ( fArchiveName ), FArchiveFilesHeader^ );
    b := k >= 0;
    IF b THEN BEGIN
       ViewArchiveEx := FArchiveFilesHeader^.Count;
       IF ViewArchiveContentsEx
       ( FArchiveFilesHeader, LZCode_CallBackStartArchive ) <> 0  { send code to begin }
       THEN BEGIN
            FOR i := 1 TO ( FArchiveFilesHeader^.Count )
            DO BEGIN  { loop through each record }
               IF ViewArchiveContentsEx ( FArchiveFilesHeader, i ) = 0
               THEN Break;
            END; { for i }
            ViewArchiveContentsEx ( FArchiveFilesHeader, LZCode_CallBackEndArchive ); { end }
       END;
    END{ if b }
    ELSE ViewArchiveEx := k;

  {$ifdef Delphi}
    FINALLY
  {$endif Delphi}
   LZHeader_Destroy ( FArchiveFilesHeader, j );
  {$ifdef Delphi}
    END; { try ... }
  {$endif Delphi}
   ResetPassWordFlag;
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.ConfirmOverwriteW;
  VAR
  i : integer;
  p : pchar;
  s : String [48];
  s1 : String [5];

BEGIN
  ConfirmOverwriteW := LZYes;
  WITH Current
  DO BEGIN
   {$ifndef MSDOS}
   {$ifndef DPMI}
    Getmem ( p, 512 );
    strpcopy ( p, 'The file "' + aExist.Names + '" already exists: ' + #13#10#13#10 );
    Strpcat ( p, 'File Name : ' + Current.Names + #13#10 );

    str ( Sizes, s );
    strpcat ( p, 'Compressed Size  : ' + s + ' bytes' + #13#10 );

    str ( uSizes, s );
    strpcat ( p, 'Uncompressed Size: ' + s + ' bytes' + #13#10 );

    s1 := 'HRSA';
    IF fAttrs AND faHidden   = 0 THEN s1 [1] := '_';
    IF fAttrs AND faReadOnly = 0 THEN s1 [2] := '_';
    IF fAttrs AND faSysFile  = 0 THEN s1 [3] := '_';
    IF fAttrs AND faArchive  = 0 THEN s1 [4] := '_';

    str ( fAttrs, s );
    strpcat ( p, 'File Attributes: ' + s1 + '  (' + s + ')' + #13#10 );

    strpcat ( p, 'File Version : ' + Current.FileVersion + #13#10 );

    s := HexL ( CRCs );
    strpcat ( p, '32-bit CRC: ' + s + '' + #13#10 );

    str ( GetCompressionRatio ( Sizes, uSizes ), s );
    strpcat ( p, 'Compression ratio: ' + s + '%' + #13#10#13#10 );

    strpcat ( p, 'Should I overwrite the existing file?' );

    i := messagebox ( GetActiveWindow, p, 'ChiefLZ', mb_IconQuestion + mb_YesNoCancel );
    CASE i OF
         id_Yes : ConfirmOverwriteW := LZYes;
         id_No  : ConfirmOverwriteW := LZNo;
         id_Cancel : ConfirmOverwriteW := LZQuit;
    END; { Case}
    freemem ( p, 512 );
    {$endif DPMI}
  {$endif MSDOS}
  END;  { With aName}
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.ConfirmOverwrite;
BEGIN
   ConfirmOverwrite := LZYes; { default - overwrite all existing files }
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.ProgressReport;
BEGIN
   { default - report nothing }
   ProgressReport := 1;
END;
{/////////////////////////////////////////////////////////}
FUNCTION  TChiefLZObj.RequestNewName;
BEGIN
   NewFileName := '';
   RequestNewName := False;   { default - do nothing }
END;
{/////////////////////////////////////////////////////////}
FUNCTION  TChiefLZObj.ViewArchiveContents;
BEGIN
   ViewArchiveContents := 0;  { default - do nothing }
END;
{/////////////////////////////////////////////////////////}
FUNCTION  TChiefLZObj.ListArchiveContents;
BEGIN
   ListArchiveContents := 0;  { default - do nothing }
END;
{/////////////////////////////////////////////////////////}
PROCEDURE TChiefLZObj.SetPromptForDiskProc ( aProc : TLZSpanPromptProc );
BEGIN
   IF Assigned ( aProc ) THEN SetSpanDiskPromptFunc ( aProc );
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.PromptForDisk
( Sender : PObject; CONST DiskNum, TotalParts, NeededSpace : TLZCount; Drive : pChar ) : TLZCount;
VAR
s   : String [255];
i, j : TLZCount;
BEGIN
{$ifdef OS_DOS}
   { use default }
   PromptForDisk := fPromptForDiskProc ( DiskNum, TotalParts, NeededSpace, Drive );
{$else OS_DOS}
   WHILE 0 = 0
   DO BEGIN
      s := 'Please insert disk #' + IntToStr ( DiskNum ) + ' of ' + IntToStr ( TotalParts )
          + ' into drive ' + StrPas ( Drive );
      s := s + #13#10 + #13#10 + 'Should I continue?' + #0;

      PromptForDisk := 1;  { don't continue }
      i := MessageBox ( 0, pChar ( @s [1] ), 'LZ Archive Disk Spanning',
           MB_IconQuestion + MB_YesNo );

      { operation cancelled }
      IF i <> IDYes THEN Exit;

      PromptForDisk := 0;  { continue }

      { don't check for free space }
      IF ( NeededSpace < 1 ) THEN Exit;

      { how much do we really need? }
      IF NeededSpace < GetSpanDiskSize THEN j := NeededSpace ELSE j := GetSpanDiskSize;

      { is there sufficient space? }
      IF FreeOnDisk ( StrPas ( Drive ) ) >= j
      THEN BEGIN
         Exit
      END;

      { if we get here, there is insufficient disk space: so ask again }
      s := 'Insufficient disk space on drive ' + StrPas ( Drive ) + #0;

      MessageBox ( 0, pChar ( @s [1] ), 'LZ Archive Disk Spanning Error', MB_IconExclamation + MB_Ok );
   END;
  {$endif OS_DOS}
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.SetPassWord ( Sender : pObject; VAR Header : TLZArchiveHeader ) : TLZCount;
BEGIN
   SetPassWord := LZCode_NoPassWord; { default - return no password }
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.CheckPassWord
( Sender : pObject; CONST Header : TLZArchiveHeader; CONST Code : TLZCount  ) : TLZCount;
BEGIN
   { default - return wrong password;
     why?: we won't get here unless there is a password in the archive! }
   CheckPassWord := LZCode_WrongPassWord;
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.ExtractCommentFromArchive : TLZCount;
BEGIN
     ExtractCommentFromArchive :=
     ExtractArchiveCommentFile
     ( Str2PChar ( fArchiveName ), Str2PChar ( fTargetDirectory ), ArchiveCommentFileName );
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.SetArchiveCommentFile ( fName : TLZString ) : TLZCount;
BEGIN
   SetArchiveCommentFile := MarkArchiveCommentFile ( Str2pChar ( FName ) );
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.FullLZName ( RecordNum : TLZCount ) : TLZString;
BEGIN
  IF Assigned ( FArchiveFilesHeader )
  THEN FullLZName := GetFullLZName ( FArchiveFilesHeader^, RecordNum )
  ELSE FullLZName := '';
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.MatchFileName
( Sender : PObject; FileSpec : TLZString; TheFName : TLZstring; ArchiveID : TLZCount ) : Boolean;
BEGIN
   @fMatchFileFunc := GetFileMatchFunc;    { default - use the current matching function }
   MatchFileName   := fMatchFileFunc ( Str2pChar ( FileSpec ), Str2pChar ( TheFName ), ArchiveID );
END;
{/////////////////////////////////////////////////////////}
FUNCTION  TChiefLZObj.GetSpanDiskSize : TLZCount;
BEGIN
   GetSpanDiskSize := fSpanDiskSize;
END;
{/////////////////////////////////////////////////////////}
FUNCTION  TChiefLZObj.GetSpanDiskCount : TLZCount;
BEGIN
   GetSpanDiskCount := fSpanDiskCount;
END;
{/////////////////////////////////////////////////////////}
FUNCTION  TChiefLZObj.GetSpannedArchiveName : TLZString;
BEGIN
    GetSpannedArchiveName := StrPas ( fSpanConfigRec.SpanName );
END;
{/////////////////////////////////////////////////////////}
PROCEDURE TChiefLZObj.SetSpanDiskSize ( CONST dSize : TLZCount );
BEGIN
   IF dSize <> fSpanDiskSize
   THEN BEGIN
      fSpanDiskSize := dSize;
      IF dSize = Floppy1440  THEN fFloppyType := FloppyDisk1440  ELSE
      IF dSize = Floppy720   THEN fFloppyType := FloppyDisk720   ELSE
      IF dSize = Floppy2880  THEN fFloppyType := FloppyDisk2880  ELSE
      IF dSize = Floppy360   THEN fFloppyType := FloppyDisk360   ELSE
      IF dSize = Floppy1200  THEN fFloppyType := FloppyDisk1200  ELSE
      IF dSize = FloppyIOZip THEN fFloppyType := FloppyDiskZip
      ELSE fFloppyType := FloppyDiskOther;
   END;
END;
{/////////////////////////////////////////////////////////}
FUNCTION  TChiefLZObj.GetSpanDisks : Boolean;
BEGIN
     GetSpanDisks := fSpanDisks;
END;
{/////////////////////////////////////////////////////////}
PROCEDURE TChiefLZObj.SetSpanDisks ( ToSpan : Boolean );
BEGIN
     IF ToSpan <> fSpanDisks THEN fSpanDisks := ToSpan;
END;
{/////////////////////////////////////////////////////////}
PROCEDURE TChiefLZObj.SetSpanDiskType ( aType : LZFloppyDiskTypes );
BEGIN
   fFloppyType := aType;
   CASE aType OF
        FloppyDisk1440 : fSpanDiskSize := Floppy1440;
        FloppyDisk720  : fSpanDiskSize := Floppy720;
        FloppyDisk2880 : fSpanDiskSize := Floppy2880;
        FloppyDisk360  : fSpanDiskSize := Floppy360;
        FloppyDisk1200 : fSpanDiskSize := Floppy1200;
        FloppyDiskZip  : fSpanDiskSize := FloppyIOZip;
        FloppyDiskOther : fSpanDiskSize := - 1;  { error }
   END;
END;
{/////////////////////////////////////////////////////////}
FUNCTION  TChiefLZObj.GetSpanDiskType : LZFloppyDiskTypes;
BEGIN
   GetSpanDiskType := fFloppyType;
END;
{/////////////////////////////////////////////////////////}
FUNCTION  TChiefLZObj.IsSpanned ( aName : TLZString ) : TLZCount;
VAR
i : TLZcount;
BEGIN
   i := IsChiefLZSfxArchive ( Str2pChar ( aName ), MainArchiveHeader );
   IF i < 0 THEN IsSpanned := i
   ELSE BEGIN { i <0 == not a valid archive; i>0 == SFX; i=0 == normal archive }
      IsSpanned := 0;
      IF IsChiefLZSpannedHeader ( MainArchiveHeader )
      THEN BEGIN
        fSpanDiskCount := MainArchiveHeader.Parts;
        IsSpanned := MainArchiveHeader.Parts;
      END;
   END;
END;
{/////////////////////////////////////////////////////////}
FUNCTION  TChiefLZObj.IsSpannedArchive : Boolean;
BEGIN
   IsSpannedArchive := IsSpanned ( fArchiveName ) > 1;
END;
{/////////////////////////////////////////////////////////}
FUNCTION  TChiefLZObj.IsSpannedSFXArchive : Boolean;
BEGIN
   IsSpannedSFXArchive := IsSpanned ( fSFXArchiveName ) > 1;
END;
{/////////////////////////////////////////////////////////}
FUNCTION  TChiefLZObj.GetExtensionstoStore : TLZString;
BEGIN
   GetExtensionstoStore := StrPas ( GetIgnoreExtensions );
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.SetSetPassWordFunc ( aProc : TLZSetPassWordFunc ) : TLZCount;
BEGIN
    fSetPassWord := aProc;
    SetArchiveSetPassWordFunc ( aProc );
    SetSetPassWordFunc := 0;
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.SetCheckPassWordFunc ( aProc : TLZCheckPassWordFunc ) : TLZCount;
BEGIN
   fCheckPassWord := aProc;
   SetArchiveCheckPassWordFunc ( aProc );
   SetCheckPassWordFunc := 0;
END;
{/////////////////////////////////////////////////////////}
FUNCTION TChiefLZObj.SetHeaderOffset : TLZCount;
BEGIN
   SetHeaderOffSet :=
      SetArchiveHeaderBegin ( MainArchiveHeader.Reserved.S_OffSet );
END;
{/////////////////////////////////////////////////////////}
PROCEDURE TChiefLZObj.RestoreHeaderOffset ( OffSet : TLZCount );
BEGIN
    SetArchiveHeaderBegin ( OffSet );
END;
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
{/////////////////////////////////////////////////////////}
BEGIN
   { () }
END.
