unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Spin, WinShell, Menus;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    btnOpen: TButton;
    edLink: TEdit;
    btnNew: TButton;
    btnSave: TButton;
    Label3: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edIcon: TEdit;
    edDesc: TEdit;
    edWorkDir: TEdit;
    edArg: TEdit;
    cbShowCmd: TComboBox;
    hkHotKey: THotKey;
    speIcnIdx: TSpinEdit;
    pnlIconPanel: TPanel;
    imgIconImage: TImage;
    btnExit: TButton;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    NewLInk1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    edPath: TEdit;
    procedure btnOpenClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure edIconChange(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
  private
    procedure GetControls(var SLI: TShellLinkInfo);
    procedure SetControls(const SLI: TShellLinkInfo);
    procedure ShowIcon;
    procedure OpenLinkFile(const LinkFileName: String);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

uses PickU, NewLinkU, AboutU, CommCtrl, ShellAPI;

type
  THotKeyRec = record
    Char, ModCode: Byte;
  end;

procedure TMainForm.SetControls(const SLI: TShellLinkInfo);
{ Sets values of UI controls based on contents of SLI }
var
  Mods: THKModifiers;
begin
  with SLI do
  begin
    edPath.Text := PathName;
    edIcon.Text := IconLocation;
    { if icon name is blank and link is to exe, use exe name for icon }
    { path.  This is done because the icon index is ignored if the    }
    { icon path is blank, but an exe may contain more than one icon.  }
    if (IconLocation = '') and
      (CompareText(ExtractFileExt(PathName), 'EXE') = 0) then
      edIcon.Text := PathName;
    edWorkDir.Text := WorkingDirectory;
    edArg.Text := Arguments;
    speIcnIdx.Value := IconIndex;
    edDesc.Text := Description;
    { SW_* constants start at 1 }
    cbShowCmd.ItemIndex := ShowCmd - 1;
    { Hot key char in low byte }
    hkHotKey.HotKey := Lo(HotKey);
    { Figure out which modifier flags are in high byte }
    Mods := [];
    if (HOTKEYF_ALT and Hi(HotKey)) <> 0 then include(Mods, hkAlt);
    if (HOTKEYF_CONTROL and Hi(HotKey)) <> 0 then include(Mods, hkCtrl);
    if (HOTKEYF_EXT and Hi(HotKey)) <> 0 then include(Mods, hkExt);
    if (HOTKEYF_SHIFT and Hi(HotKey)) <> 0 then include(Mods, hkShift);
    { Set modifiers set }
    hkHotKey.Modifiers := Mods;
  end;
  ShowIcon;
end;

procedure TMainForm.GetControls(var SLI: TShellLinkInfo);
{ Gets values of UI controls and uses them to set values of SLI }
var
  CtlMods: THKModifiers;
  HR: THotKeyRec;
begin
  with SLI do
  begin
    PathName := edPath.Text;
    IconLocation := edIcon.Text;
    WorkingDirectory := edWorkDir.Text;
    Arguments := edArg.Text;
    IconIndex := speIcnIdx.Value;
    Description := edDesc.Text;
    { SW_* constants start at 1 }
    ShowCmd := cbShowCmd.ItemIndex + 1;
    { Get hot key character }
    word(HR) := hkHotKey.HotKey;
    { Figure out which modifier keys are being used }
    CtlMods := hkHotKey.Modifiers;
    with HR do begin
      ModCode := 0;
      if (hkAlt in CtlMods) then ModCode := ModCode or HOTKEYF_ALT;
      if (hkCtrl in CtlMods) then ModCode := ModCode or HOTKEYF_CONTROL;
      if (hkExt in CtlMods) then ModCode := ModCode or HOTKEYF_EXT;
      if (hkShift in CtlMods) then ModCode := ModCode or HOTKEYF_SHIFT;
    end;
    HotKey := word(HR);
  end;
end;

procedure TMainForm.ShowIcon;
{ Retreives icon from appropriate file and shows in IconImage }
var
  HI: THandle;
  IcnFile: string;
  IconIndex: word;
begin
  { Get name of icon file }
  IcnFile := edIcon.Text;
  { If blank, use the exe name }
  if IcnFile = '' then
    IcnFile := edPath.Text;
  { Make sure file exists }
  if FileExists(IcnFile) then
  begin
    IconIndex := speIcnIdx.Value;
    { Extract icon from file }
    HI := ExtractAssociatedIcon(hInstance, PChar(IcnFile), IconIndex);
    { Assign icon handle to IconImage }
    imgIconImage.Picture.Icon.Handle := HI;
  end;
end;

procedure TMainForm.OpenLinkFile(const LinkFileName: string);
{ Opens a link file, get info, and displays info in UI }
var
  SLI: TShellLinkInfo;
begin
  edLink.Text := LinkFileName;
  try
    GetShellLinkInfo(LinkFileName, SLI);
  except
    on EShellOleError do
      MessageDlg('B³¹d otwarcia ³¹cznika', mtError, [mbOk], 0);
  end;
  SetControls(SLI);
end;

procedure TMainForm.btnOpenClick(Sender: TObject);
{ OnClick handler for OpenBtn }
var
  LinkFile: String;
begin
  if GetLinkFile(LinkFile) then
    OpenLinkFile(LinkFile);
end;

procedure TMainForm.btnNewClick(Sender: TObject);
{ OnClick handler for NewBtn }
var
  FileName: string;
  Dest: Integer;
begin
  if GetNewLinkName(FileName, Dest) then
    OpenLinkFile(CreateShellLink(FileName, '', Dest));
end;

procedure TMainForm.edIconChange(Sender: TObject);
{ OnChange handler for IconEd and IcnIdxEd }
begin
  ShowIcon;
end;

procedure TMainForm.btnSaveClick(Sender: TObject);
{ OnClick handler for SaveBtn }
var
  SLI: TShellLinkInfo;
begin
  GetControls(SLI);
  try
    SetShellLinkInfo(edLink.Text, SLI);
  except
    on EShellOleError do
      MessageDlg('B³¹d ustawiania ³¹cznika', mtError, [mbOk], 0);
  end;
end;

procedure TMainForm.btnExitClick(Sender: TObject);
{ OnClick handler for ExitBtn }
begin
  Close;
end;

procedure TMainForm.About1Click(Sender: TObject);
{ OnClick handler for Help|About menu item }
begin
  AboutBox;
end;

end.
