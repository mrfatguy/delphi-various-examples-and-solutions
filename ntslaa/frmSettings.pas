unit frmSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ShellAPI, IniFiles;

type
  TSettingsForm = class(TForm)
    btnOK: TButton;
    btnCancel: TButton;
    gbConnection: TGroupBox;
    eLocalPort: TLabeledEdit;
    eRemotePort: TLabeledEdit;
    Label1: TLabel;
    gbProgram: TGroupBox;
    cbStatus: TComboBox;
    Label2: TLabel;
    eIP: TLabeledEdit;
    btnTest: TButton;
    chbSaveState: TCheckBox;
    Label3: TLabel;
    procedure btnOKClick(Sender: TObject);
    procedure GlobalKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnTestClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure LoadSettings();
    procedure SaveSettings();
    procedure UseSettings();
  end;

var
  SettingsForm: TSettingsForm;

implementation

{$R *.dfm}

uses frmMain, pasProcs, pasIfThen;

procedure TSettingsForm.LoadSettings();
var
  sSettings: TMemIniFile;
  iState: Integer;
begin
  //Najpierw ustawienia programu
  sSettings := TMemIniFile.Create(MainPath + 'settings.dat');

  eLocalPort.Text := sSettings.ReadString('Connection', 'LocalPort', '5000');
  eRemotePort.Text := sSettings.ReadString('Connection', 'RemotePort', '5000');

  cbStatus.ItemIndex := sSettings.ReadInteger('Program', 'DefaultStatus', 0);

  chbSaveState.Checked := sSettings.ReadBool('Program', 'DontSaveState', False);

  sSettings.Free();

  if chbSaveState.Checked then Exit;

  //Potem jego stan
  sSettings := TMemIniFile.Create(MainPath + 'state.dat');

  iState := sSettings.ReadInteger('MainForm', 'State', 0);
  case iState of
    0: MainForm.WindowState := wsNormal;
    1: MainForm.WindowState := wsMinimized;
    2: MainForm.WindowState := wsMaximized;
  end;

  if iState = 0 then
  begin
    MainForm.Left := sSettings.ReadInteger('MainForm', 'Left', 50);
    MainForm.Top := sSettings.ReadInteger('MainForm', 'Top', 50);
    MainForm.Width := sSettings.ReadInteger('MainForm', 'Width', 900);
    MainForm.Height := sSettings.ReadInteger('MainForm', 'Height', 600);
  end;

  MainForm.lvMain.Columns[1].Width := sSettings.ReadInteger('MainForm', 'C1', 160);
  MainForm.lvMain.Columns[2].Width := sSettings.ReadInteger('MainForm', 'C2', 100);

  sSettings.Free();
end;

procedure TSettingsForm.SaveSettings();
var
  sSettings: TMemIniFile;
  iState: Integer;
begin
  //Najpierw ustawienia programu
  sSettings := TMemIniFile.Create(MainPath + 'settings.dat');

  sSettings.WriteString('Connection', 'LocalPort', eLocalPort.Text);
  sSettings.WriteString('Connection', 'RemotePort', eRemotePort.Text);

  sSettings.WriteInteger('Program', 'DefaultStatus', cbStatus.ItemIndex);

  sSettings.WriteBool('Program', 'DontSaveState', chbSaveState.Checked);

  sSettings.UpdateFile();
  sSettings.Free();

  if chbSaveState.Checked then Exit;

  //Potem jego stan
  sSettings := TMemIniFile.Create(MainPath + 'state.dat');

  iState := 0;
  case MainForm.WindowState of
    wsNormal:	iState := 0;
    wsMinimized: iState := 1;
    wsMaximized: iState := 2;
  end;
  sSettings.WriteInteger('MainForm', 'State', iState);

  if iState = 0 then
  begin
    sSettings.WriteInteger('MainForm', 'Left', MainForm.Left);
    sSettings.WriteInteger('MainForm', 'Top', MainForm.Top);
    sSettings.WriteInteger('MainForm', 'Width', MainForm.Width);
    sSettings.WriteInteger('MainForm', 'Height', MainForm.Height);
  end;

  sSettings.WriteInteger('MainForm', 'C1', MainForm.lvMain.Columns[1].Width);
  sSettings.WriteInteger('MainForm', 'C2', MainForm.lvMain.Columns[2].Width);

  sSettings.UpdateFile();
  sSettings.Free();
end;

procedure TSettingsForm.UseSettings();
begin
  with MainForm do
  begin
    tcpServer.LocalPort := eLocalPort.Text;
    tcpServer.Active := True;
  end;
end;

procedure TSettingsForm.btnOKClick(Sender: TObject);
begin
  SaveSettings();
  UseSettings();
end;

procedure TSettingsForm.GlobalKeyPress(Sender: TObject; var Key: Char);
var
  iKey: Integer;
begin
  iKey := IfThen(((Key in ['0'..'9']) or (Ord(Key) = 8)), Ord(Key), 0);
  Key := Chr(iKey);
end;

procedure TSettingsForm.FormCreate(Sender: TObject);
begin
  cbStatus.OnDrawItem := MainForm.StatusComboBoxDrawItem;
end;

procedure TSettingsForm.btnTestClick(Sender: TObject);
begin
  Application.MessageBox(PChar('Jeszcze nie dzia³a! :)'), 'B³¹d...', MB_OK + MB_ICONINFORMATION);
end;

end.
