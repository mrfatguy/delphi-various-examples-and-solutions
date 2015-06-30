unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Sockets, StdCtrls, ImgList, ComCtrls, ExtCtrls;

type
  TMainForm = class(TForm)
    tcpServer: TTcpServer;
    mText: TMemo;
    btnAbout: TButton;
    btnSettings: TButton;
    lvMain: TListView;
    ilStatus: TImageList;
    cbStatus: TComboBox;
    tMainClock: TTimer;
    pnlSourceIP: TPanel;
    pcMain: TPageControl;
    Panel2: TPanel;
    Panel1: TPanel;
    pnlSentBytes: TPanel;

    procedure ProcessMessage(Sender: TObject; ClientSocket: TCustomIpClient);
    procedure FormCreate(Sender: TObject);
    procedure mTextKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAboutClick(Sender: TObject);
    procedure btnSettingsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure tMainClockTimer(Sender: TObject);
    procedure cbStatusChange(Sender: TObject);

    procedure StatusComboBoxDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure lvMainDblClick(Sender: TObject);
    procedure pcMainChange(Sender: TObject);
  private
    function CheckConnected(TerminateUponFailure: Boolean = False): Boolean;
    function GetUserNameByIP(IP: String): String;
    function GetUserIPByName(UserName: String): String;
    function GetUserTabIDByName(UserName: String): Integer;
    function GetUserListIDByName(UserName: String): Integer;
    function GetTab(UserName: String): TMemo;
    function CreateTab(UserName: String): TMemo;
    function FindMemo(OnWhat: TTabSheet): TMemo;

    procedure ReadUsers();
    procedure WriteUsers();
    procedure UpdateTree();
    procedure StatusChanged(NewStatus: Integer);
    procedure ProcessSystemCommand(SenderIP, Command: String);
    procedure SendMessageToIP(DestinationIP: String; MessageBuffer: TStringList);
    procedure SendLineToAll(Line: String; IgnoreOffline: Boolean = True);
    procedure SendLineToIP(DestinationIP: String; Line: String);
  public

  end;

  TUserData = record
    IP: String;
    Name: String;
    Status: Integer;
    StatusText: String;
  end;

  TReceiveThread = class(TThread)
  public
    ListBuffer: TStringList;
    TargetList: TStrings;
    RemoteHost: String;

    constructor Create(CreateSuspended: Boolean);

    procedure SynchronizedAddDataToControl();
    procedure Execute; override;
    procedure Terminate;
  end;

  TSendThread = class(TThread)
  public
    ListBuffer: TStringList;
    RemoteHost: String;

    constructor Create(CreateSuspended: Boolean);

    procedure ClientSend(Sender: TObject; Buf: PAnsiChar; var DataLen: Integer);
    procedure Execute; override;
    procedure Terminate;
  end;

const
  Statuses: array[0..5] of String = ('dostêpny', 'zaraz wracam', 'chêtnie porozmawiam', 'nie przeszkadzaæ', 'niewidoczny', 'niedostêpny');

var
  MainForm: TMainForm;

  StatusCounter, BytesSent, BytesGet, LastStatus: Integer;
  Users: array of TUserData;
  StatusResent: array of Boolean;

implementation

{$R *.dfm}

uses pasIfThen, pasProcs, frmInfo, frmSettings;

{---------------------TSendThread---------------------}

constructor TSendThread.Create(CreateSuspended: Boolean);
begin
  inherited Create(CreateSuspended);

  FreeOnTerminate := True;
  ListBuffer := TStringList.Create;
end;

procedure TSendThread.Terminate;
begin
  ListBuffer.Free;

  inherited;
end;

procedure TSendThread.ClientSend(Sender: TObject; Buf: PAnsiChar; var DataLen: Integer);
begin
  Inc(BytesSent, DataLen);
end;

procedure TSendThread.Execute;
var
  tcpTemp: TTcpClient;
  a: Integer;
begin
  if not MainForm.CheckConnected() then Exit;

  tcpTemp := TTcpClient.Create(MainForm);
  tcpTemp.RemoteHost := RemoteHost;
  tcpTemp.RemotePort := SettingsForm.eRemotePort.Text;
  tcpTemp.OnSend := ClientSend;

  try
    tcpTemp.Connect();
    for a := 0 to ListBuffer.Count - 1 do tcpTemp.Sendln(ListBuffer.Strings[a]);
  finally
    tcpTemp.Disconnect();
    tcpTemp.Free();
  end;
end;

{---------------------TReceiveThread---------------------}

constructor TReceiveThread.Create(CreateSuspended: Boolean);
begin
  inherited Create(CreateSuspended);

  FreeOnTerminate := True;
  ListBuffer := TStringList.Create;
end;

procedure TReceiveThread.Terminate;
begin
  ListBuffer.Free;

  inherited;
end;

procedure TReceiveThread.Execute;
begin
  Synchronize(SynchronizedAddDataToControl);
end;

procedure TReceiveThread.SynchronizedAddDataToControl();
var
  iUser: Integer;
  sComm, sUser: String;
  mMemo: TMemo;
begin
  sComm := ListBuffer.Text;
  sUser := MainForm.GetUserNameByIP(RemoteHost);

  if Pos('SYSTEM:', sComm) = 0 then
  begin
    if sUser <> '' then
    begin
        iUser := MainForm.GetUserTabIDByName(sUser);

        if iUser > -1 then
            mMemo := MainForm.GetTab(sUser)
        else
            mMemo := MainForm.CreateTab(sUser);

        mMemo.Lines.AddStrings(ListBuffer);
    end
    else Application.MessageBox(PChar('Zignorowana wiadomoœæ z adresu IP = ' + RemoteHost), 'B³¹d...', MB_OK + MB_ICONERROR);
  end
  else MainForm.ProcessSystemCommand(RemoteHost, Trim(Copy(sComm, Pos(':', sComm) + 1, Length(sComm))));
end;

{---------------------TMainForm---------------------}

procedure TMainForm.ProcessSystemCommand(SenderIP, Command: String);
var
  iUser: Integer;
  bHandled: Boolean;
  sOperation, sValue: String;
begin
  bHandled := False;

  sOperation := Copy(Command, 1, Pos('=', Command) - 1);
  sValue := Copy(Command, Pos('=', Command) + 1, Length(Command));

  if sOperation = 'Status' then
  begin
    //Zmiana statusu og³aszaj¹cego siê u¿ytkownika na liœcie
    iUser := GetUserListIDByName(GetUserNameByIP(SenderIP));

    //ShowMessage('"' + SenderIP + '"');
    //ShowMessage('"' + GetUserNameByIP(SenderIP) + '"');
    //ShowMessage(IntToStr(iUser));

    Users[iUser].Status := StrToIntDef(sValue, 5);
    UpdateTree();

    //Odbicie - odpowiedzenie mu naszym statusem
    if StatusResent[iUser] = False then
    begin
      SendLineToIP(SenderIP, 'SYSTEM:Status=' + IntToStr(cbStatus.ItemIndex));
      StatusResent[iUser] := True;
    end
    else StatusResent[iUser] := False;

    bHandled := True;
  end;

  if not bHandled then ShowMessage(SenderIP + ' przys³a³ "' + Command + '"');
end;

function TMainForm.GetTab(UserName: String): TMemo;
var
  i, l: Integer;
begin
  Result := nil;

  //Znalezienie taba lub utworzenie nowego, jeœli nie istnieje
  i := -1;

  for l := 0 to pcMain.PageCount - 1 do
  begin
    if pcMain.Pages[l].Caption = UserName then
    begin
      i := l;
      Break;
    end;
  end;

  if i <> -1 then
  begin
    pcMain.Pages[i].Highlighted := True;

    Result := FindMemo(pcMain.Pages[i]);
    if Result = nil then Application.MessageBox(PChar('Zignorowana wiadomoœæ o parametrach: UserName = ' + UserName + ', nie znaleziono memo na PCP = ' + IntToStr(i) + '!'), 'B³¹d...', MB_OK + MB_ICONERROR);
  end
  else Application.MessageBox(PChar('Zignorowana wiadomoœæ o parametrach: UserName = ' + UserName + ', nie znaleziono memo dla tego UserName!'), 'B³¹d...', MB_OK + MB_ICONERROR);
end;

function TMainForm.FindMemo(OnWhat: TTabSheet): TMemo;
var
  a: Integer;
begin
  Result := nil;

  for a := 0 to OnWhat.ComponentCount - 1 do
  begin
    if OnWhat.Components[a] is TMemo then
    begin
      Result := (OnWhat.Components[a] as TMemo);
      Break;
    end;
  end;
end;

function TMainForm.CreateTab(UserName: String): TMemo;
var
  mMemo: TMemo;
  tsTab: TTabSheet;
begin
  tsTab := TTabSheet.Create(MainForm.pcMain);
  with tsTab do
  begin
    Caption := UserName;
    PageControl := pcMain;
  end;

  tsTab.Highlighted := True;;

  mMemo := TMemo.Create(tsTab);
  with mMemo do
  begin
    Parent := tsTab;
    Align := alClient;
    ReadOnly := True;
    ScrollBars := ssVertical;
  end;

  Result := mMemo;
end;

procedure TMainForm.ProcessMessage(Sender: TObject; ClientSocket: TCustomIpClient);
var
  sUser, s: String;
  ReceiveThread: TReceiveThread;
begin
  ReceiveThread := TReceiveThread.Create(True);

  with ReceiveThread do
  begin
    RemoteHost := ClientSocket.RemoteHost;

    sUser := GetUserNameByIP(RemoteHost);

    s := ClientSocket.ReceiveLn;
    while s <> '' do
    begin
      ListBuffer.Add(s);
      s := ClientSocket.ReceiveLn;
    end;

    ListBuffer.Text := '[' + sUser + ListBuffer.Text;

    Resume;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  //Ró¿ne sprawy pocz¹tkowe
  MainForm.Caption := 'ntSLaA ' + VersionNumber;
  Application.Title := MainForm.Caption;

  BytesSent := 0;
  BytesGet := 0;
  StatusCounter := 0;

  MainPath := ExtractFilePath(Application.ExeName) + 'data\';
  ForceDirectories(MainPath);

  //U¿ytkownicy
  ReadUsers();
end;

function TMainForm.CheckConnected(TerminateUponFailure: Boolean): Boolean;
var
  sMessage: String;
begin
  Result := True;

  if not IsConnected() then
  begin
    sMessage := 'BRAK po³¹czenia z Internetem!';
    if TerminateUponFailure then sMessage := sMessage + ' Nast¹pi zamkniêcie programu!';

    Application.MessageBox(PChar(sMessage), 'B³¹d...', MB_OK + MB_ICONERROR);
    Result := False;

    if TerminateUponFailure then Application.Terminate();
  end;
end;

function TMainForm.GetUserTabIDByName(UserName: String): Integer;
var
  a: Integer;
begin
  Result := -1;

  for a := 0 to pcMain.PageCount - 1 do
  begin
    if pcMain.Pages[a].Caption = UserName then
    begin
      Result := a;
      Break;
    end;
  end;
end;

function TMainForm.GetUserListIDByName(UserName: String): Integer;
var
  a: Integer;
begin
  Result := -1;

  for a := 0 to lvMain.Items.Count - 1 do
  begin
    if lvMain.Items[a].SubItems[0] = UserName then
    begin
      Result := a;
      Break;
    end;
  end;
end;

function TMainForm.GetUserNameByIP(IP: String): String;
var
  a: Integer;
begin
  Result := '';

  for a := Low(Users) to High(Users) do
  begin
    if Users[a].IP = IP then
    begin
      Result := Users[a].Name;
      Break;
    end;
  end;
end;

function TMainForm.GetUserIPByName(UserName: String): String;
var
  a: Integer;
begin
  Result := '';

  for a := Low(Users) to High(Users) do
  begin
    if Users[a].Name = UserName then
    begin
      Result := Users[a].IP;
      Break;
    end;
  end;
end;

procedure TMainForm.mTextKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  i: Integer;
  sUser, sIP: String;
  mMemo: TMemo;
  sMess: TStringList;
begin
  if not (Key = 13) then Exit;

  //Wysy³anie wiadomoœci przy pomocy Enter, wiêc wyciêcie dodatkowej linii powsta³ej w wyniku tego
  if not ((ssCtrl in Shift) or (ssShift in Shift)) then mText.Text := Trim(mText.Text);

  //Ekzity, czyli obs³uga sytuacji nietypowych...
  if ((ssCtrl in Shift) or (ssShift in Shift)) then Exit;
  if not CheckConnected() then Exit;
  if mText.Text = '' then Exit;

  //Obs³uga b³êdów
  if pcMain.PageCount = 0 then
  begin
    Application.MessageBox(PChar('Proszê wybraæ odbiorcê wiadomoœci - klikn¹æ dwukrotnie na liœcie u¿ytkowników po prawej stronie!'), 'B³¹d...', MB_OK + MB_ICONERROR);
    Exit;
  end;

  sIP := GetUserIPByName(pcMain.ActivePage.Caption);

  if sIP = '' then
  begin
    Application.MessageBox('Adres IP nie mo¿e byæ ci¹giem pustym ("")!', 'B³¹d...', MB_OK + MB_ICONERROR);
    Exit;
  end;

  //Wys³anie wiadomoœci
  mMemo := FindMemo(pcMain.ActivePage);
  sMess := TStringList.Create();

  for i := 0 to mText.Lines.Count - 1 do sMess.Add(mText.Lines[i]);
  sMess.Text := ' o ' + TimeToStr(Time()) +'] ' + sMess.Text;

  SendMessageToIP(sIP, sMess);

  mText.Clear();

  //Wyœwietlnie wiadomoœci, jeœli nie wysy³asz do samego siebie...
  if sIP <> GetIP() then
  begin
    sUser := GetUserNameByIP(sIP);
    sMess.Text := '[' + sUser + sMess.Text;
    mMemo.Lines.AddStrings(sMess);
  end;

  sMess.Free();
end;

procedure TMainForm.btnAboutClick(Sender: TObject);
begin
  InfoForm.ShowModal();
end;

procedure TMainForm.btnSettingsClick(Sender: TObject);
begin
  SettingsForm.ShowModal();
end;

procedure TMainForm.FormShow(Sender: TObject);
var
  i: Integer;
begin
  //ComboBoxy stanów we wszystkich oknach
  for i := Low(Statuses) to High(Statuses) do
  begin
    cbStatus.Items.Add(Statuses[i]);
    SettingsForm.cbStatus.Items.Add(Statuses[i]);
  end;
  
  //Read and propagate settings
  SettingsForm.LoadSettings();
  SettingsForm.UseSettings();

  //Sprawdzenie adresu IP komputera (nadawcy)
  pnlSourceIP.Caption := GetIP();
  SettingsForm.eIP.Text := pnlSourceIP.Caption;

  if pnlSourceIP.Caption = '' then
  begin
    Application.MessageBox(PChar('Wykryto nieprawid³owy adres IP: "' + pnlSourceIP.Caption + '"! Dzia³anie programu zostanie zakoñczone!'), 'Nieprawid³owy adres IP...', MB_OK + MB_ICONERROR);
    Application.Terminate();
  end;

  //Rozpropagowanie statusu - dzieñ dobry
  cbStatus.ItemIndex := SettingsForm.cbStatus.ItemIndex;
  cbStatusChange(self);

  //Uruchomienie zegarka
  tMainClock.Enabled := True;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Rozpropagowanie statusu - do widzenia
  cbStatus.ItemIndex := 5;
  cbStatusChange(self);

  SettingsForm.SaveSettings();
  WriteUsers();
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  caA: TCloseAction;
begin
  caA := caMinimize;
  FormClose(MainForm, caA);
end;

procedure TMainForm.ReadUsers();
var
  sFile: String;
  a, l: Integer;
  slUsers: TStringList;
begin
  sFile := MainPath + 'users.dat';
  if not FileExists(sFile) then WriteUsers();

  slUsers := TStringList.Create;
  slUsers.LoadFromFile(sFile);

  slUsers.Sort();

  for a := 0 to slUsers.Count - 1 do
  begin
    l := Length(Users) + 1;
    SetLength(Users, l);
    SetLength(StatusResent, l);

    with Users[a] do
    begin
      IP := Copy(slUsers[a], Pos('=', slUsers[a]) + 1, Length(slUsers[a]));
      Name := Copy(slUsers[a], 0, Pos('=', slUsers[a]) - 1);
      Status := 5;
      StatusText := '';
    end;

    StatusResent[a] := False;
  end;

  slUsers.Free();
  UpdateTree();
end;

procedure TMainForm.WriteUsers();
var
  a: Integer;
  slUsers: TStringList;
begin
  slUsers := TStringList.Create;

  for a := Low(Users) to High(Users) do slUsers.Add(Users[a].Name + '=' + Users[a].IP);
  slUsers.SaveToFile(MainPath + 'users.dat');

  slUsers.Free();
end;

procedure TMainForm.UpdateTree();
var
  a: Integer;
  lst: TListItem;
begin
  lvMain.Items.BeginUpdate();
  lvMain.Items.Clear();

  for a := Low(Users) to High(Users) do
  begin
    lst := lvMain.Items.Add;

    with lst do
    begin
      Caption := IntToStr(Users[a].Status);

      StateIndex := Users[a].Status;
      StateIndex := IfThen(StateIndex = 4, 5, StateIndex);

      SubItems.Add(Users[a].Name);
      SubItems.Add(Users[a].IP);
    end;
  end;

  lvMain.Items.EndUpdate();
end;

procedure TMainForm.StatusComboBoxDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  with (Control as TComboBox).Canvas do
  begin
    Brush.Color := IfThen((odSelected in State), clMenuHighlight, clWindow);
    FillRect(Rect);
    TextOut(Rect.Left + 22, Rect.Top + 1, Statuses[Index]);
 end;

 ilStatus.Draw((Control as TComboBox).Canvas, Rect.Left + 3, Rect.Top + 3, Index);
end;

procedure TMainForm.tMainClockTimer(Sender: TObject);
var
  i, iCurrItemIndex: Integer;
begin
  //Status - mój
  iCurrItemIndex := cbStatus.ItemIndex;
  
  if not cbStatus.DroppedDown then
  begin
    cbStatus.ItemIndex := IfThen(IsConnected(), LastStatus, 5);

    if cbStatus.ItemIndex <> iCurrItemIndex then StatusChanged(cbStatus.ItemIndex);
  end;

  //Status - innych - co 11 sekund...
  Inc(StatusCounter);

  if StatusCounter = 10 then
  begin
    for i := 0 to Length(Users) - 1 do Users[i].Status := 5;
    UpdateTree();
    cbStatusChange(self);

    StatusCounter := 0;
  end;

  //Wy³¹czenie wyró¿nienia aktywnego taba
  if (pcMain.ActivePage <> nil) and (pcMain.ActivePage.Highlighted) then pcMain.ActivePage.Highlighted := False;

  //Transmisja danych - licznik
  pnlSentBytes.Caption := IntToStr(BytesSent) + ' b';
end;

procedure TMainForm.cbStatusChange(Sender: TObject);
begin
  LastStatus := cbStatus.ItemIndex;

  StatusChanged(cbStatus.ItemIndex);
end;

procedure TMainForm.StatusChanged(NewStatus: Integer);
var
  a: Integer;
begin
  mText.Enabled := (NewStatus < 5);
  lvMain.Enabled := (NewStatus < 5);
  mText.Color := IfThen((NewStatus < 5), clWindow, clBtnFace);
  lvMain.Color := IfThen((NewStatus < 5), clWindow, clBtnFace);

  if NewStatus = 5 then
  begin
    for a := 0 to lvMain.Items.Count - 1 do lvMain.Items[a].StateIndex := 5;

    lvMain.Enabled := False;
  end
  else lvMain.Enabled := True;

  SendLineToAll('SYSTEM:Status=' + IntToStr(cbStatus.ItemIndex), False);
end;

procedure TMainForm.lvMainDblClick(Sender: TObject);
var
  sIP, sUser: String;
  iUser: Integer;
  mMemo: TMemo;
begin
  if lvMain.ItemIndex = -1 then Exit;

  sIP := lvMain.Items[lvMain.ItemIndex].SubItems[1];

  sUser := GetUserNameByIP(sIP);

  if sUser <> '' then
  begin
    iUser := MainForm.GetUserTabIDByName(sUser);

    if iUser > -1 then
    mMemo := MainForm.GetTab(sUser)
    else
    mMemo := MainForm.CreateTab(sUser);

    pcMain.ActivePage := (mMemo.Parent as TTabSheet);
  end
  else Application.MessageBox('Nazwa u¿ytkownika nie mo¿e byæ ci¹giem pustym ("")!', 'B³¹d...', MB_OK + MB_ICONERROR);
end;

procedure TMainForm.pcMainChange(Sender: TObject);
begin
  if pcMain.ActivePage.Highlighted then pcMain.ActivePage.Highlighted := False;
end;

procedure TMainForm.SendMessageToIP(DestinationIP: String; MessageBuffer: TStringList);
var
  SendThread: TSendThread;
begin
  SendThread := TSendThread.Create(True);

  with SendThread do
  begin
    RemoteHost := DestinationIP;
    ListBuffer.Assign(MessageBuffer);
    Priority := tpLower;

    Resume;
  end;
end;

procedure TMainForm.SendLineToIP(DestinationIP: String; Line: String);
var
  slTemp: TStringList;
begin
  slTemp := TStringList.Create();
  slTemp.Add(Line);

  SendMessageToIP(DestinationIP, slTemp);

  slTemp.Free;
end;

procedure TMainForm.SendLineToAll(Line: String; IgnoreOffline: Boolean = True);
var
  a: Integer;
begin
  for a := 0 to Length(Users) - 1 do
  begin
    if (StrToInt(lvMain.Items[a].Caption) = 5) and IgnoreOffline then Continue;

    SendLineToIP(lvMain.Items[a].SubItems[1], Line);
  end;
end;

end.
