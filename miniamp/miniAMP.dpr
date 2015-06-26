program miniAMP;

uses
  Forms,
  Windows,
  Messages,
  Sysutils,
  Dialogs,
  MainForm in 'MainForm.pas' {PlayerForm},
  PlayList in 'PlayList.pas' {ListForm},
  FileInfo in 'FileInfo.pas' {FileInfoForm},
  Prefereces in 'Prefereces.pas' {SetupForm};

{$R *.RES}
{$R default.RES}


var
  hPrevious: THandle;
  i: integer;
  FileName: string;

{----------------------------------------------------------------------------------
 Description    : a callback function that receives top-level window handles as a
                  result of a call to the EnumWindows
 Parameters     : see notes
 Error checking : ?
 Notes          : check "EnumWindows" and "EnumWindowsProc" WinAPI help topics
-----------------------------------------------------------------------------------}

function EnumWindowsFunc(Handle: HWND; Param: LParam): boolean; stdcall;

  {---------------------------------------}
  function IsAPrevInstanceRunning: boolean;
  var
    ClassName: array[0..30] of Char;
    iAppID: integer;
  begin

    { get the class name for the top-level window specified by Handle }
    GetClassName(Handle, ClassName, 30);
    iAppID := SendMessage(Handle, UM_APP_ID_CHECK, 0, 0);

    { if ClassName matches to the this application's Main Form class name...}
    { and iAppID matches to to the this application's APP_ID}
    Result := (StrIComp(ClassName, MAIN_FORM_CLASS) = 0) and (iAppID = APP_ID);
  end;
  {---------------------------------------}

begin
  { must be True to continue the enumeration }
  Result := not IsAPrevInstanceRunning;
  if not Result then hPrevious := Handle;
end;


procedure PassParamsToPreviousInstance(hWnd: THandle; s: string);
var
   cds : CopyDataStruct;
begin
     if hWnd <> 0 then
     begin
          cds.dwData := 0;
          cds.cbData := Length(s);
          cds.lpData := PChar(s);
          SetForegroundWindow(hWnd);
          SendMessage(hWnd, WM_COPYDATA, 0, Integer(@cds));
     end;
end;

begin
      hPrevious := 0;
      EnumWindows(@EnumWindowsFunc, 0);
      { if a previous instance is already running then pass the command line
        parameters to it and exit... }
      if hPrevious <> 0 then
      begin
           PostMessage(hPrevious, UM_RESTORE_APPLICATION, 0, 0);
           FileName := '';
           if ParamCount >= 1 then
{
           for i:= 1 to ParamCount do  FileName:= FileName+ParamStr(i);
           PassParamsToPreviousInstance(hPrevious, FileName);
           Exit;
}
           for i:= 1 to ParamCount do
               ShowMessage(ParamStr(i));
//               PassParamsToPreviousInstance(hPrevious, ParamStr(i));
       end
  else
  begin
       hPrevious := CreateMutex(nil, FALSE, 'MINIAMP_MUTEX');
       if WaitForSingleObject(hPrevious, 0) <> WAIT_TIMEOUT then
       begin
            Application.Initialize;
            Application.Title := 'miniAMP';
            Application.CreateForm(TPlayerForm, PlayerForm);
  Application.CreateForm(TListForm, ListForm);
  Application.CreateForm(TFileInfoForm, FileInfoForm);
  Application.CreateForm(TSetupForm, SetupForm);
  PlayerForm.UpdateLanguage;
            PlayerForm.PlayerMenuPopup(PlayerForm);
            if ParamCount >= 1 then
               for i:= 1 to ParamCount do
                   ShowMessage(ParamStr(i))
//                 PassParamsToPreviousInstance(PlayerForm.Handle, ParamStr(i))
               else
                   PlayerForm.LoadLastSongList;
            Application.Run;
       end;
    end;
end.


