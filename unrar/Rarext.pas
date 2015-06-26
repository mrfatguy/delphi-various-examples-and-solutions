// Author: aberka@usa.net, ICQ UIN 2365308, http://jakub.naf.cz/~aberka
// Gandalf: Tomasz Trejderowski (TT Software): ttsoft@koti.com.pl, www.ttsoft.koti.com.pl
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//Modified by WiZZARD
//Modified by Gandalf
unit RarExt;
interface
uses
  Windows, Classes;

const
  rMaxCommentSize = 65535; {Modify this to change the limit of Comment size}

  erEndArchive    = 10; {End of archive}
  erNoMemory      = 11; {Not enough memory to initialize data structures}
  erBadData       = 12; {Archive header broken}
  erBadArchive    = 13; {File is not valid RAR archive}
  erUnknownFormat = 14; {UnKnown comment format}
  erEOpen         = 15; {File open error}
  erECreate       = 16; {File create error}
  erEClose        = 17; {File close error}
  erERead         = 18; {Read error}
  erEWrite        = 19; {Write error}
  erSmallBuf      = 20; {Buffer too small, comments weren't read completely}

  opList          =  0; {Open archive for reading file headers only}
  opExtract       =  1; {Open archive for testing and extracting files}

  doSkip          =  0; {Move to the next file in archive}
                        {Warning: If the archive is solid and opExtract mode                                  was set when the archive was opened, the
                                  current file will be processed - the operation
                                  will be performed slower than a simple seek}
  doTest          =  1; {Test the current file and move to the next file in
                         the archive. If the archive was opened with opList mode,
                         the operation is equal to doSkip}
  doExtract       =  2; {Extract the current file and move to the next file.
                         If the archive was opened with opList mode,
                         the operation is equal to doSkip}

  moVolAsk        =  0; {Required volume is absent. The function should prompt
                         user and return non-zero value to retry the operation.
                         The function may also specify a new volume name,
                         placing it to ArcName parameter}
                         {!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!}
  moVolNotify     =  1; {Required volume is successfully opened. This is a
                         notification call and ArcName modification is NOT
                         allowed. The funciton should return non-zero value
                         to continue or a zero value to terminate operation}
                         {!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!}


type
    RARHeaderData = record
                    ArcName                            : array[1..260] of char;
                    FileName                           : array[1..260] of char;
                    Flags                              : Cardinal;
                    PackSize                           : Cardinal;
                    UnpSize                            : Cardinal;
                    HostOS                             : Cardinal;
                    FileCRC                            : Cardinal;
                    FileTime                           : Cardinal;
                    UnpVer                             : Cardinal;
                    Method                             : Cardinal;
                    FileAttr                           : Cardinal;
                    CmtBuf                             : PChar;
                    CmtBufSize, CmtSize, CmtState      : Cardinal;
                  end;

  RAROpenArchiveData = record
                         ArcName                       : PChar;
                         OpenMode                      : Cardinal;
                         OpenResult                    : Cardinal;
                         CmtBuf                        : PChar;
                         CmtBufSize                    : Cardinal;
                         CmtSize                       : Cardinal;
                         CmtState                      : Cardinal;
                       end;

  TComment = record
               Size : Integer;
               Data : Array[1..rMaxCommentSize] of Char;
             end;


  {EVENTS}
  TChangeVolProcN     = function (Sender: TObject; ArcName : PChar; Mode : Integer) : Integer of object;
  TProcessDataProcN   = function (Sender: TObject; Addr : PChar; BlockSize, Position : Integer) : Integer of object;

  TErrorProc          = procedure (Sender: TObject; Error : Integer) of object;
  TCommentProc        = procedure (Sender: TObject; Comment : TComment) of object;
  TListFileProc       = procedure (Sender: TObject; ListedFile : RARHeaderData) of object;
  TFileBeingExtracted = procedure (Sender: TObject; eFile : RARHeaderData) of object;
  TFileExtracted      = procedure (Sender: TObject; eFile : RARHeaderData; Result : Boolean) of object;
  TFileBeingTested    = procedure (Sender: TObject; eFile : RARHeaderData) of object;
  TFileTested         = procedure (Sender: TObject; eFile : RARHeaderData; Result : Boolean) of object;
  TReqPassword        = procedure (Sender: TObject; eFile : RARHeaderData; var Password : String) of object;

  TChangeVolProc      = function (var ArcName : PChar; Mode : Integer) : Integer; cdecl;
  TProcessDataProc    = function (Addr : PChar; Size : Integer) : Integer; cdecl;




  {EXTERNAL}
  //Added by WiZZARD
  TRAROpenArchivee        = function  (var ArchiveData : RAROpenArchiveData) : THandle; stdcall;
  TRARCloseArchive        = function  (hArcData : THandle) : Integer; stdcall;
  TRARReadHeader          = function  (hArcData : THandle; var HeaderData : RARHeaderData) : Integer; stdcall;
  TRARProcessFile         = function  (hArcData : THandle; Operation : Integer; DestPath, DestName : PChar) : Integer; stdcall;
  TRARSetChangeVolProc    = procedure (hArcData : THandle; CVP : TChangeVolProc); stdcall;
  TRARSetProcessDataProc  = procedure (hArcData : THandle; PDP : TProcessDataProc); stdcall;
  TRARSetPassword         = procedure (hArcData : THandle; Password : PChar); stdcall;



type
  TRAR = class(TComponent)
  private
    { Private declarations }
    RAROpenArchive       :TRAROpenArchivee;
    RARCloseArchive      :TRARCloseArchive;
    RARReadHeader        :TRARReadHeader;
    RARProcessFile       :TRARProcessFile;
    RARSetChangeVolProc  :TRARSetChangeVolProc;
    RARSetProcessDataProc:TRARSetProcessDataProc;
    RARSetPassword       :TRARSetPassword;

    LibHandle                  : THandle;
    FArchiveName               : String;
    FFilesToExtract            : TStringList;
    FFilesToTest               : TStringList;
    FTargetDir                 : String;
    FStop                      : Boolean;

    FOnProgress                : TProcessDataProcN;
    FChngVolume                : TChangeVolProcN;
    FError                     : TErrorProc;
    FComment                   : TCommentProc;
    FListFile                  : TListFileProc;
    FFileBeingExtracted        : TFileBeingExtracted;
    FFileExtracted             : TFileExtracted;
    FFileBeingTested           : TFileBeingTested;
    FFileTested                : TFileTested;
    FReqPassword               : TReqPassword;

    FActualPos                 : Integer;

    procedure SetFilesToExtract(Value : TStringList);
    procedure SetFilesToTest(Value : TStringList);

  protected
    { Protected declarations }

  public
    { Public declarations }
    //Added by WiZZARD - modified by Gandalf:
    function LoadUnRarLibrary(LibName: String): Boolean;
    //Added by WiZZARD
    procedure UnLoadUnRarLibrary;

    procedure ListArchive;
    function ExtractArchive : Boolean; {False - errors in archive, True - everything went ok}


    function TestArchive : Boolean; {False - archive corrupted, True - archive is ok}
    function TestArchiveByHwnd(hnd: THandle) : Boolean; {False - archive corrupted, True - archive is ok}


    Function GetErrorString(Error : Integer) : String;
    //Function GetErrorStringCZ(Error : Integer) : String;

    constructor Create(AOwner : TComponent); override;
    //constructor Create;

    destructor Free;

  published
    { Published declarations }
    property ArchiveName : String
      read FArchiveName write FArchiveName;
    property FilesToExtract : TStringList
      read FFilesToExtract write SetFilesToExtract;
    property FilesToTest : TStringList
      read FFilesToTest write SetFilesToTest;
    property TargetDir : String
      read FTargetDir write FTargetDir;
    property Stop : Boolean
      read FStop write FStop default False;
{    property Password : String
      read FPassword write FPassword;}

    property OnProcessData : TProcessDataProcN
      read FOnProgress write FOnProgress;
    property OnVolumeChange : TChangeVolProcN
      read FChngVolume write FChngVolume;
    property OnError : TErrorProc
      read FError write FError;
    property OnComment : TCommentProc
      read FComment write FComment;
    property OnListFile : TListFileProc
      read FListFile write FListFile;
    property OnExtracting : TFileBeingExtracted
      read FFileBeingExtracted write FFileBeingExtracted;
    property OnExtract : TFileExtracted
      read FFileExtracted write FFileExtracted;
    property OnTesting : TFileBeingTested
      read FFileBeingTested write FFileBeingTested;
    property OnTested : TFileTested
      read FFileTested write FFileTested;
    property OnReqPassword : TReqPassword
      read FReqPassword write FReqPassword;

  end;


procedure Register;

implementation

//{$R RAREXT.RES}

var xSelf : Pointer;

procedure Register;
begin
  RegisterComponents('Compression', [TRAR]);
end;   

constructor TRAR.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFilesToExtract:=TStringList.Create;
  FFilesToExtract.Sorted:=True;
  FFilesToTest:=TStringList.Create;
  FFilesToTest.Sorted:=True;
end;

destructor TRAR.Free;
begin
  FFilesToExtract.Free;
  FFilesToTest.Free;
end;

procedure TRAR.SetFilesToExtract(Value : TStringList);
begin
  FFilesToExtract.Assign(Value);
end;

procedure TRAR.SetFilesToTest(Value : TStringList);
begin
  FFilesToTest.Assign(Value);
end;

function ChangeVolProc(var ArcName : PChar; Mode : Integer) : Integer; cdecl;
begin // Future - ArcName sensitive ...
  Result:=TRAR(xSelf).OnVolumeChange(xSelf,ArcName,Mode);
end;

function ProcessDataProc(Addr : PChar; Size : Integer) : Integer; cdecl;
begin
  TRAR(xSelf).FActualPos:=(TRAR(xSelf).FActualPos+Size);
  Result:=TRAR(xSelf).OnProcessData(xSelf,Addr,Size,TRAR(xSelf).FActualPos);
end;

Function TRAR.GetErrorString(Error : Integer) : String;
begin
  case Error of
    erEndArchive    : Result:='Koniec archiwum';
    erNoMemory      : Result:='Za ma³o pamiêci do inicjalizacji struktur danych';
    erBadData       : Result:='B³¹d CRC, dane zniszczone';
    erBadArchive    : Result:='Nie w³aœciwy plik RAR';
    erUnknownFormat : Result:='Nieznany format komentarza';
    erEOpen         : Result:='B³¹d otwarcia pliku';
    erECreate       : Result:='B³¹d tworzenia pliku';
    erEClose        : Result:='B³¹d zamykania pliku';
    erERead         : Result:='B³¹d odczytu';
    erEWrite        : Result:='B³¹d zapisu';
    erSmallBuf      : Result:='Bufor za ma³y dla komentarza';
    else Result:='Nieznany b³¹d';
  end;
end;

{Function TRAR.GetErrorStringCZ(Error : Integer) : String;
begin
  case Error of
    erEndArchive    : Result:='Konec archivu';
    erNoMemory      : Result:='Nedostatek pamìti pro inicializaci datové oblasti';
    erBadData       : Result:='Špatný kontrolní souèet. Data jsou pravdìpodobnì poškozena';
    erBadArchive    : Result:='Soubor není RAR archivem';
    erUnknownFormat : Result:='Neznámý formát komentáøe';
    erEOpen         : Result:='Chyba pøi otevírání souboru';
    erECreate       : Result:='Chyba pøi vytváøení souboru';
    erEClose        : Result:='Chyba pøi zavírání souboru';
    erERead         : Result:='Chyba pøi ètení';
    erEWrite        : Result:='Chyba pøi zápisu';
    erSmallBuf      : Result:='Komentáø je moc velký na aktuální zásobník, nebude kompletní';
    else Result:='Chyba';
  end;
end;}

procedure TRAR.ListArchive;
var OpenArchiveData : RAROpenArchiveData;
    hArcData        : THandle;
    RHCode, PFCode  : Integer;
    HeaderData      : RARHeaderData;
    Comm            : TComment;
begin
  xSelf:=Self;
  OpenArchiveData.ArcName:=@FArchiveName[1];
  {!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!}
  OpenArchiveData.CmtBuf:=@Comm.Data[1];
  OpenArchiveData.CmtBufSize:=SizeOf(Comm.Data);
  OpenArchiveData.OpenMode:=opList;
  hArcData:=RAROpenArchive(OpenArchiveData);
  Comm.Size:=OpenArchiveData.CmtSize;

  if OpenArchiveData.OpenResult<>0 then
  begin
    if Assigned(OnError) then
      OnError(Self,OpenArchiveData.OpenResult);
    RARCloseArchive(hArcData);
    Exit;
  end;

  if (OpenArchiveData.CmtState=1) then
  begin
    if Assigned(OnComment) then
      OnComment(Self,Comm);
  end;

  if Assigned(OnVolumeChange) then
    RARSetChangeVolProc(hArcData,ChangeVolProc);

  HeaderData.CmtBuf:=@Comm.Data[1];
  HeaderData.CmtBufSize:=SizeOf(Comm.Data);

  RHCode:=RARReadHeader(hArcData,HeaderData);
  while RHCode=0 do
  begin
    if Assigned(OnListFile) then OnListFile(Self, HeaderData);
    if FStop then
    begin
      FStop:=False;
      RARCloseArchive(hArcData);
      Exit;
    end;
    if (HeaderData.CmtState=1) then OnComment(Self,Comm);
    PFCode:=RARProcessFile(hArcData,doSkip,NIL,NIL);
    if (PFCode<>0) then
    begin
      if Assigned(OnError) then OnError(Self,PFCode);
      Break;
    end;
    RHCode:=RARReadHeader(hArcData,HeaderData);
   end;

  if (RHCode=erBadData) and (Assigned(OnError)) then OnError(Self,RHCode);
  RARCloseArchive(hArcData);
end;
///////////////////////////////////////////////////////////////////////////////
function TRAR.ExtractArchive : Boolean;
var OpenArchiveData : RAROpenArchiveData;
    hArcData        : THandle;
    RHCode, PFCode  : Integer;
    HeaderData      : RARHeaderData;
    Comm            : TComment;
    TDir            : PChar;
    Temp            : Integer;
    S               : String;
    Password        : String;
begin
  Result:=True;
  if (FArchiveName='') then
  begin
    if Assigned(OnError) then
      OnError(Self,erBadArchive);
    Result:=False;
    Exit;
  end;
  xSelf:=Self;
  OpenArchiveData.ArcName:=@FArchiveName[1];
  {!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!}
  OpenArchiveData.CmtBuf:=@Comm.Data[1];
  OpenArchiveData.CmtBufSize:=SizeOf(Comm.Data);
  OpenArchiveData.OpenMode:=opExtract;
  hArcData:=RAROpenArchive(OpenArchiveData);
  Comm.Size:=OpenArchiveData.CmtSize;

  If FTargetDir='' then TDir:=Nil else TDir:=@FTargetDir[1];

  if OpenArchiveData.OpenResult<>0 then
  begin
    RARCloseArchive(hArcData);
    if Assigned(OnError) then
      OnError(Self,OpenArchiveData.OpenResult);
    Result:=False;
    Exit;
  end;

  if (OpenArchiveData.CmtState=1) then
  begin
    if Assigned(OnComment) then
      OnComment(Self,Comm);
  end;

  if Assigned(OnVolumeChange) then
    RARSetChangeVolProc(hArcData,ChangeVolProc);

  HeaderData.CmtBuf:=@Comm.Data[1];
  HeaderData.CmtBufSize:=SizeOf(Comm.Data);

  if Assigned(OnProcessData) then
    RARSetProcessDataProc(hArcData,ProcessDataProc);

  RHCode:=RARReadHeader(hArcData,HeaderData);
  while RHCode=0 do
  begin
    S:=''; for Temp:=1 to SizeOf(HeaderData.FileName) do if HeaderData.FileName[Temp]=#00 then break else S:=S+HeaderData.FileName[Temp];
    if FStop then
      begin
        FStop:=False;
        RARCloseArchive(hArcData);
        Exit;
      end;
    if (FFilesToExtract.Count=0) or (FFilesToExtract.Find(S,Temp)) then
    begin
      if Assigned(OnExtracting) then OnExtracting(Self, HeaderData);
      FActualPos:=0;
      if ((HeaderData.Flags and 4)=4) and (Assigned(OnReqPassword)) then
      begin
        OnReqPassword(Self,HeaderData,Password);
        if Password<>'' then RARSetPassword(hArcData,@Password[1]);
      end;
      PFCode:=RARProcessFile(hArcData,doExtract,TDir,NiL);
      if Assigned(OnExtract) then OnExtract(Self, HeaderData, PFCode=0);
      if PFCode<>0 then
         begin
           Result:=False;
           if Assigned(OnError) then OnError(Self,PFCode);
           if (PFCode<>erECreate) and (PFCode<>erBadData) then
           begin
             RARCloseArchive(hArcData);
             Exit;
           end;
         end;
    end else
    begin
      PFCode:=RARProcessFile(hArcData,doSkip,TDir,NiL);
      if PFCode<>0 then
         begin
           Result:=False;
           if Assigned(OnError) then OnError(Self,PFCode);
           RARCloseArchive(hArcData);
           Exit;
         end;
    end;
    RHCode:=RARReadHeader(hArcData,HeaderData);
  end;

  if (RHCode=erBadData) and (Assigned(OnError)) then OnError(Self,RHCode);
  RARCloseArchive(hArcData);
end;
////////////////////////////////////////////////////////////////////////////////
function TRAR.TestArchive : Boolean;
var OpenArchiveData : RAROpenArchiveData;
    hArcData        : THandle;
    RHCode, PFCode  : Integer;
    HeaderData      : RARHeaderData;
    Comm            : TComment;
    Temp            : Integer;
    S               : String;
    Password        : String;
begin
  Result:=True;
  if (FArchiveName='') then
  begin
    if Assigned(OnError) then
      OnError(Self,erBadArchive);
    Result:=False;
    Exit;
  end;
  xSelf:=Self;
  OpenArchiveData.ArcName:=@FArchiveName[1];
  {!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!}
  OpenArchiveData.CmtBuf:=@Comm.Data[1];
  OpenArchiveData.CmtBufSize:=SizeOf(Comm.Data);
  OpenArchiveData.OpenMode:=opExtract;
  hArcData:=RAROpenArchive(OpenArchiveData);
  Comm.Size:=OpenArchiveData.CmtSize;

  if OpenArchiveData.OpenResult<>0 then
  begin
    if Assigned(OnError) then
      OnError(Self,OpenArchiveData.OpenResult);
    Result:=False;
    RARCloseArchive(hArcData);
    Exit;
  end;

  if (OpenArchiveData.CmtState=1) then
  begin
    if Assigned(OnComment) then
      OnComment(Self,Comm);
  end;

  if Assigned(OnVolumeChange) then
    RARSetChangeVolProc(hArcData,ChangeVolProc);

  HeaderData.CmtBuf:=@Comm.Data[1];
  HeaderData.CmtBufSize:=SizeOf(Comm.Data);

  RHCode:=RARReadHeader(hArcData,HeaderData);
  while RHCode=0 do
  begin
    S:=''; for Temp:=1 to SizeOf(HeaderData.FileName) do if HeaderData.FileName[Temp]=#00 then break else S:=S+HeaderData.FileName[Temp];
    if FStop then
      begin
        FStop:=False;
        RARCloseArchive(hArcData);
        Exit;
      end;
    if (FFilesToTest.Count=0) or (FFilesToTest.Find(S,Temp)) then
    begin
      if Assigned(OnTesting) then OnTesting(Self, HeaderData);
      if ((HeaderData.Flags and 4)=4) and (Assigned(OnReqPassword)) then
      begin
        OnReqPassword(Self,HeaderData,Password);
        if Password<>'' then RARSetPassword(hArcData,@Password[1]);
      end;
      PFCode:=RARProcessFile(hArcData,doTest,nil,niL);
      if Assigned(OnTested) then OnTested(Self, HeaderData,PFCode=0);
      if PFCode<>0 then
         begin
           Result:=False;
           If Assigned(OnError) then OnError(Self,PFCode);
           if (PFCode<>erECreate) and (PFCode<>erBadData) then
           begin
             RARCloseArchive(hArcData);
             Exit; {Serios error, exit}
           end;
         end;
    end else
    begin
      PFCode:=RARProcessFile(hArcData,doSkip,nil,niL);
      if PFCode<>0 then
         begin
           if Assigned(OnError) then OnError(Self,PFCode);
           Result:=False;
           RARCloseArchive(hArcData);
           Exit;
         end;
    end;
    RHCode:=RARReadHeader(hArcData,HeaderData);
  end;

  if (RHCode=erBadData) and (Assigned(OnError)) then OnError(Self,RHCode);
  RARCloseArchive(hArcData);
end;


//_________________________________________________\\
//_________________________________________________\\

function TRAR.TestArchiveByHwnd(hnd: THandle) : Boolean;
var OpenArchiveData : RAROpenArchiveData;
    hArcData        : THandle;
    RHCode, PFCode  : Integer;
    HeaderData      : RARHeaderData;
    Comm            : TComment;
    Temp            : Integer;
    S               : String;
    Password        : String;
begin
  Result:=True;
{  if (FArchiveName='') then
  begin
    if Assigned(OnError) then
      OnError(Self,erBadArchive);
    Result:=False;
    Exit;
  end;}
  xSelf:=Self;
  OpenArchiveData.ArcName:=@FArchiveName[1];
  {!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!}
  OpenArchiveData.CmtBuf:=@Comm.Data[1];
  OpenArchiveData.CmtBufSize:=SizeOf(Comm.Data);
  OpenArchiveData.OpenMode:=opExtract;
  hArcData:=RAROpenArchive(OpenArchiveData);
  Comm.Size:=OpenArchiveData.CmtSize;

  if OpenArchiveData.OpenResult<>0 then
  begin
    if Assigned(OnError) then
      OnError(Self,OpenArchiveData.OpenResult);
    Result:=False;
    RARCloseArchive(hArcData);
    Exit;
  end;

  if (OpenArchiveData.CmtState=1) then
  begin
    if Assigned(OnComment) then
      OnComment(Self,Comm);
  end;

  if Assigned(OnVolumeChange) then
    RARSetChangeVolProc(hArcData,ChangeVolProc);

  HeaderData.CmtBuf:=@Comm.Data[1];
  HeaderData.CmtBufSize:=SizeOf(Comm.Data);

  RHCode:=RARReadHeader(hArcData,HeaderData);
  while RHCode=0 do
  begin
    S:=''; for Temp:=1 to SizeOf(HeaderData.FileName) do if HeaderData.FileName[Temp]=#00 then break else S:=S+HeaderData.FileName[Temp];
    if FStop then
      begin
        FStop:=False;
        RARCloseArchive(hArcData);
        Exit;
      end;
    if (FFilesToTest.Count=0) or (FFilesToTest.Find(S,Temp)) then
    begin
      if Assigned(OnTesting) then OnTesting(Self, HeaderData);
      if ((HeaderData.Flags and 4)=4) and (Assigned(OnReqPassword)) then
      begin
        OnReqPassword(Self,HeaderData,Password);
        if Password<>'' then RARSetPassword(hArcData,@Password[1]);
      end;
      PFCode:=RARProcessFile(hArcData,doTest,nil,niL);
      if Assigned(OnTested) then OnTested(Self, HeaderData,PFCode=0);
      if PFCode<>0 then
         begin
           Result:=False;
           If Assigned(OnError) then OnError(Self,PFCode);
           if (PFCode<>erECreate) and (PFCode<>erBadData) then
           begin
             RARCloseArchive(hArcData);
             Exit; {Serios error, exit}
           end;
         end;
    end else
    begin
      PFCode:=RARProcessFile(hArcData,doSkip,nil,niL);
      if PFCode<>0 then
         begin
           if Assigned(OnError) then OnError(Self,PFCode);
           Result:=False;
           RARCloseArchive(hArcData);
           Exit;
         end;
    end;
    RHCode:=RARReadHeader(hArcData,HeaderData);
  end;

  if (RHCode=erBadData) and (Assigned(OnError)) then OnError(Self,RHCode);
  RARCloseArchive(hArcData);
end;

//_________________________________________________


//Added by WiZZARD
//Modified by Gandalf
function TRAR.LoadUnRarLibrary(LibName: String): boolean;
begin
Result:=True;
   if LibName='' then LibName:='unrar.dll';
   LibHandle := LoadLibrary(PChar(LibName));
   try
      if LibHandle < HINSTANCE_ERROR then
      begin
           MessageBox(hInstance,PChar('B³¹d: Nie odnaleziono biblioteki '+LibName+' !!!'),'B³¹d przy ³adowaniu biblioteki...',16);
           Result:=False;
           Exit;
      end;

      @RAROpenArchive        := GetProcAddress(LibHandle,'RAROpenArchive');
      @RARCloseArchive       := GetProcAddress(LibHandle,'RARCloseArchive');
      @RARReadHeader         := GetProcAddress(LibHandle,'RARReadHeader');
      @RARProcessFile        := GetProcAddress(LibHandle,'RARProcessFile');
      @RARSetChangeVolProc   := GetProcAddress(LibHandle,'RARSetChangeVolProc');
      @RARSetProcessDataProc := GetProcAddress(LibHandle,'RARSetProcessDataProc');
      @RARSetPassword        := GetProcAddress(LibHandle,'RARSetPassword');
   finally
   end;
end;
//Added by WiZZARD
procedure TRAR.UnLoadUnRarLibrary;
begin
   FreeLibrary(LibHandle);
end;


end.
