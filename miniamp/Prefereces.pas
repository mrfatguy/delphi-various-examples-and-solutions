unit Prefereces;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, ImgList, IniFiles, ActiveX, ShlObj, ComObj,
  Registry, ShellApi;

type
  TSetupForm = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    AddToDesktopButton: TButton;
    AddToSendToButton: TButton;
    AddToSMButton: TButton;
    AddToQLButton: TButton;
    RegisterButton: TButton;
    MPxIconGB: TGroupBox;
    PlayListGB: TGroupBox;
    ShortcutGB: TGroupBox;
    LanguageGB: TGroupBox;
    LanguageLabel: TLabel;
    TitleLabel: TLabel;
    CopyrightLabel: TLabel;
    hpLabel: TLabel;
    FriendSoftURL: TLabel;
    mailLabel: TLabel;
    EMailAdd: TLabel;
    PreferencePageControl: TPageControl;
    SetupTabSheet: TTabSheet;
    LanguageComboBox: TComboBox;
    MPxIconImage: TImage;
    PlaylistIconImage: TImage;
    MPxIconTrackBar: TTrackBar;
    PlaylistIconTrackBar: TTrackBar;
    IconImageList: TImageList;
    AboutTabSheet: TTabSheet;
    MoreMemo: TMemo;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AddToDesktopButtonClick(Sender: TObject);
    procedure AddToSendToButtonClick(Sender: TObject);
    procedure AddToSMButtonClick(Sender: TObject);
    procedure AddToQLButtonClick(Sender: TObject);
    procedure MPxIconTrackBarChange(Sender: TObject);
    procedure PlaylistIconTrackBarChange(Sender: TObject);
    procedure LanguageComboBoxChange(Sender: TObject);
    procedure RegisterButtonClick(Sender: TObject);
    procedure FriendSoftURLMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FriendSoftURLMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure EMailAddMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure EMailAddMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateLanguage;
  end;

var
  SetupForm: TSetupForm;

implementation

uses MainForm;

{$R *.DFM}

procedure AddShortCutTo(Dest, Name: string);
{ Dest:   Desktop, Start Menu, SendTo, Programs, Quick Launch}
var
   ShLink: IShellLink;
   PFile: IPersistFile;
   FileName: string;
   WFileName: WideString;
   Reg : TRegIniFile;
begin
     ShLink := CreateComObject(CLSID_ShellLink) as IShellLink;
     PFile := ShLink as IPersistFile;

     FileName := Application.ExeName;
     ShLink.SetPath(PChar(FileName));
     ShLink.SetWorkingDirectory(PChar(ExtractFilePath(FileName)));

     Reg := TRegIniFile.Create('Software\Microsoft\Windows\CurrentVersion\Explorer');

     if Dest = 'Quick Launch' then
        WFileName := Reg.ReadString('Shell Folders', 'AppData', '') + '\Microsoft\Internet Explorer\Quick Launch\'+ Name + '.lnk'
     else
         WFileName := Reg.ReadString('Shell Folders', Dest, '') + '\'+ Name + '.lnk';
     Reg.Free;
     PFile.Save(PWChar(WFileName), FALSE);
end;

procedure TSetupForm.UpdateLanguage;
var
   LanFile : TIniFile;
   offset : Cardinal;
   S : string;
   i : integer;
begin
     IconImageList.GetBitmap(MPxIconIndex, MPxIconImage.Picture.Bitmap);
     IconImageList.GetBitmap(PlaylistIconIndex, PlaylistIconImage.Picture.Bitmap);
     PlaylistIconTrackBar.Position := PlaylistIconIndex;
     MPxIconTrackBar.Position := MPxIconIndex;
     //Open language file
     LanFile := TIniFile.Create(AppPath+CurrentLanguage+'.ini');
     if CurrentFont <> nil then CurrentFont.Free;
     CurrentFont := TFont.Create;
     CurrentFont.Name := LanFile.ReadString('General', 'FontName', 'MS Sans Serif');
     CurrentFont.Size := LanFile.ReadInteger('General', 'FontSize', 7);
     CurrentFont.Charset := DEFAULT_CHARSET;
     if CurrentLanguage = 'Chinese' then CurrentFont.Charset := GB2312_CHARSET;
     if CurrentLanguage = 'Japanese' then CurrentFont.Charset := SHIFTJIS_CHARSET;
     if CurrentLanguage = 'Korean' then CurrentFont.Charset := HANGEUL_CHARSET;
     if CurrentLanguage = 'Big5' then CurrentFont.Charset := CHINESEBIG5_CHARSET;
     SetupForm.Font := CurrentFont;

     Caption := LanFile.ReadString('SetupForm', 'SetupForm', 'miniAMP - Preference');
     offset := Cardinal(@OKButton);
     while offset <= Cardinal(@RegisterButton) do
     begin
          S := LanFile.ReadString('SetupForm', PTButton(offset)^.Name, '');
          if S <> '' then PTButton(offset)^.Caption := S;
          offset := offset + sizeof(PTButton);
     end;

     offset := Cardinal(@MPxIconGB);
     while offset <= Cardinal(@LanguageGB) do
     begin
          S := LanFile.ReadString('SetupForm', PTGroupBox(offset)^.Name, '');
          if S <> '' then PTGroupBox(offset)^.Caption := S;
          offset := offset + sizeof(PTGroupBox);
     end;

     offset := Cardinal(@LanguageLabel);
     while offset <= Cardinal(@EMailAdd) do
     begin
          S := LanFile.ReadString('SetupForm', PTLabel(offset)^.Name, '');
          if S <> '' then PTLabel(offset)^.Caption := S;
          offset := offset + sizeof(PTLabel);
     end;

     for i := 0 to PreferencePageControl.PageCount - 1 do
     begin
          PreferencePageControl.Pages[i].Caption := LanFile.ReadString('SetupForm', 'ItemString'+IntToStr(i), '');
     end;

     LanguageComboBox.ItemIndex :=LanguageList.IndexOf(CurrentLanguage);

     LanFile.Free;

     if CurrentLanguage = 'Chinese' then
        MoreMemo.Lines.LoadFromFile(AppPath+'ReadmeGB.txt')
     else
         MoreMemo.Lines.LoadFromFile(AppPath+'ReadmeE.txt');
end;

procedure TSetupForm.OKButtonClick(Sender: TObject);
var
   SettingFile : TIniFile;
begin
     SettingFile := TIniFile.Create(AppPath+'miniAMP.ini');
     SettingFile.WriteInteger('General', 'MPxIconIndex', MPxIconIndex);
     SettingFile.WriteInteger('General', 'PlaylistIconIndex', PlaylistIconIndex);
     SettingFile.Free;
     Close;
end;

procedure TSetupForm.CancelButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TSetupForm.FormCreate(Sender: TObject);
begin
//     SetWindowLong(PreferencePageControl.Handle, GWL_STYLE, GetWindowLong(PreferencePageControl.Handle, GWL_STYLE) or $0100);
     MPxIconTrackBar.Max := IconImageList.Count-1;
     PlaylistIconTrackBar.Max := IconImageList.Count-1;
     UpdateLanguage;
end;

procedure TSetupForm.AddToDesktopButtonClick(Sender: TObject);
begin
     AddShortCutTo('Desktop', 'miniAMP v1.0');
end;

procedure TSetupForm.AddToSendToButtonClick(Sender: TObject);
begin
     AddShortCutTo('SendTo', 'miniAMP v1.0');
end;

procedure TSetupForm.AddToSMButtonClick(Sender: TObject);
begin
     AddShortCutTo('Programs', 'miniAMP v1.0');
end;

procedure TSetupForm.AddToQLButtonClick(Sender: TObject);
begin
     AddShortCutTo('Quick Launch', 'miniAMP v1.0');
end;

procedure TSetupForm.MPxIconTrackBarChange(Sender: TObject);
begin
     MPxIconIndex := MPxIconTrackBar.Position;
     MPxIconImage.Picture := nil;
     IconImageList.GetBitmap(MPxIconIndex, MPxIconImage.Picture.Bitmap);
end;

procedure TSetupForm.PlaylistIconTrackBarChange(Sender: TObject);
begin
     PlaylistIconIndex := PlaylistIconTrackBar.Position;
     PlaylistIconImage.Picture := nil;
     IconImageList.GetBitmap(PlaylistIconIndex, PlaylistIconImage.Picture.Bitmap);
end;

procedure TSetupForm.LanguageComboBoxChange(Sender: TObject);
var
   NewLanguage : string;
begin
     //check language file
     NewLanguage := LanguageList.Strings[LanguageComboBox.ItemIndex];
     if FileExists(AppPath+NewLanguage+'.ini') = FALSE then
     begin
          ShowMessage('Language file can not be found.');
          LanguageComboBox.ItemIndex :=LanguageList.IndexOf(CurrentLanguage);
          Exit;
     end
     else
     begin
          CurrentLanguage := NewLanguage;
          PlayerForm.UpdateLanguage;
          UpdateLanguage;
     end;
end;

procedure TSetupForm.RegisterButtonClick(Sender: TObject);
var
   RegIni: TRegIniFile;
begin
     RegIni := TRegIniFile.Create('');
     with RegIni do
     begin
          RootKey := HKEY_CLASSES_ROOT;
          WriteString('miniAMP.File','','miniAMP Media File');
          WriteString('miniAMP.File\DefaultIcon','', Application.ExeName+','+IntToStr(MPxIconIndex));
          WriteString('miniAMP.File\Shell','','Play');
          WriteString('miniAMP.File\Shell\Open','','Open with miniAMP');
          WriteString('miniAMP.File\Shell\Open\command','', '"'+Application.ExeName + '" "%1"');
          WriteString('miniAMP.File\Shell\Play','','Play with miniAMP');
          WriteString('miniAMP.File\Shell\Play\command', '', '"'+Application.ExeName + '" "%1"');

          WriteString('miniAMP.ListFile','','miniAMP Media File');
          WriteString('miniAMP.ListFile\DefaultIcon','', Application.ExeName+','+IntToStr(PlaylistIconIndex));
          WriteString('miniAMP.ListFile\Shell','','Play');
          WriteString('miniAMP.ListFile\Shell\Open','','Open with miniAMP');
          WriteString('miniAMP.ListFile\Shell\Open\command','','"'+Application.ExeName + '" "%1"');
          WriteString('miniAMP.ListFile\Shell\Play','','Play with miniAMP');
          WriteString('miniAMP.ListFile\Shell\Play\command', '', '"'+Application.ExeName + '" "%1"');

          WriteString('.mp1', '', 'miniAMP.File');
          WriteString('.mp2', '', 'miniAMP.File');
          WriteString('.mp3', '', 'miniAMP.File');

          WriteString('.pls', '', 'miniAMP.ListFile');
          WriteString('.m3u', '', 'miniAMP.ListFile');

          Free;
     end;
end;


procedure TSetupForm.FriendSoftURLMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     FriendSoftURL.Font.Color := clBlue;
     ShellExecute(0, nil, PChar('http://skyscraper.fortunecity.com/seque/344/'), nil, nil, SW_MAXIMIZE);
end;

procedure TSetupForm.FriendSoftURLMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     FriendSoftURL.Font.Color := clRed;
end;

procedure TSetupForm.EMailAddMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     EMailAdd.Font.Color := clRed;
end;

procedure TSetupForm.EMailAddMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     EMailAdd.Font.Color := clBlue;
     ShellExecute(0, nil, pchar('mailto:xhq@writeme.com'), nil, nil, SW_SHOWNORMAL);
end;
end.

