unit Options;

interface

uses Classes, Forms, Controls, Buttons, StdCtrls, ExtCtrls, TabNotBk,
  Grids, Outline, Menus, Spin, Dialogs, StylSped, WinTypes,
  Iconic, SysUtils;

type
  TOptionDlg = class(TForm)
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Notebook: TTabbedNotebook;
    FilterEdit: TEdit;
    Label1: TLabel;
    cbShowHidSys: TCheckBox;
    Replace: TCheckBox;
    FileDelete: TCheckBox;
    Move: TCheckBox;
    Copy: TCheckBox;
    FolderDelete: TCheckBox;
    Protect: TCheckBox;
    Outline: TOutline;
    OpenDialog: TOpenDialog;
    DelayLabel: TLabel;
    cbFileHints: TCheckBox;
    HelpBtn: TBitBtn;
    AddBtn: TStyleSpeed;
    InsertBtn: TStyleSpeed;
    EditBtn: TStyleSpeed;
    DeleteBtn: TStyleSpeed;
    ExpandBtn: TStyleSpeed;
    CollapseBtn: TStyleSpeed;
    OutlineMenu: TPopupMenu;
    AddItem: TMenuItem;
    InsertItem: TMenuItem;
    EditItem: TMenuItem;
    DeleteItem: TMenuItem;
    CollapseItem: TMenuItem;
    ExpandItem: TMenuItem;
    N1: TMenuItem;
    Convert: TMenuItem;
    cbAutoSize: TCheckBox;
    cbAutoActivate: TCheckBox;
    cbBrowseSame: TCheckBox;
    cbShortArrows: TCheckBox;
    cbHollowDrag: TCheckBox;
    cbSaveWindows: TCheckBox;
    cbFindVersion: TCheckBox;
    cbShowGlyphs: TCheckBox;
    cbShowSplash: TCheckBox;
    cbAnimCursor: TCheckBox;
    cbProgDrop: TCheckBox;
    ChangeFont: TStyleSpeed;
    Element: TComboBox;
    Label2: TLabel;
    BrowseXEdit: TSpinEdit;
    BrowseYEdit: TSpinEdit;
    Label13: TLabel;
    Label14: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    FontDialog: TFontDialog;
    cbClearSearch: TCheckBox;
    Bevel9: TBevel;
    ColorDialog: TColorDialog;
    Label17: TLabel;
    Label18: TLabel;
    rbCopy: TRadioButton;
    rbMove: TRadioButton;
    rbPrompt: TRadioButton;
    cbRemoveShort: TCheckBox;
    Bevel11: TBevel;
    Label7: TLabel;
    UndeleteEdit: TEdit;
    Label4: TLabel;
    InspectEdit: TEdit;
    Label5: TLabel;
    DefaultEdit: TEdit;
    Label6: TLabel;
    DiskEdit: TEdit;
    Bevel10: TBevel;
    cbShrinkMax: TCheckBox;
    cb24Hour: TCheckBox;
    Label19: TLabel;
    RefreshEdit: TSpinEdit;
    cbAnimate: TCheckBox;
    cbButtonHint: TCheckBox;
    IconEdit: TEdit;
    Label8: TLabel;
    Label21: TLabel;
    rbType: TRadioButton;
    rbName: TRadioButton;
    rbDate: TRadioButton;
    rbSize: TRadioButton;
    cbEnableBin: TCheckBox;
    rbLeave: TRadioButton;
    rbEmpty: TRadioButton;
    rbDelete: TRadioButton;
    rbCollect: TRadioButton;
    KeepFreeEdit: TSpinEdit;
    KeepFreeLab: TLabel;
    Label15: TLabel;
    SysEdit: TEdit;
    Label16: TLabel;
    BinEdit: TEdit;
    Label22: TLabel;
    rbCascaded: TRadioButton;
    rbRandom: TRadioButton;
    rbSaved: TRadioButton;
    cbPromptQuit: TCheckBox;
    cbConfirmAlias: TCheckBox;
    Delay: TScrollBar;
    CustomColor: TStyleSpeed;
    ColorPick: TComboBox;
    Label3: TLabel;
    Shape: TShape;
    Bevel12: TBevel;
    SamplePanel: TPanel;
    PaintBox: TPaintBox;
    cbTaskbar: TCheckBox;
    cbRestoreSys: TCheckBox;
    cbRefreshShort: TCheckBox;
    cbAliasArrows: TCheckBox;
    cbShowList: TCheckBox;
    Bevel13: TBevel;
    cbAlwaysStart: TCheckBox;
    cbAlwaysVisible: TCheckBox;
    cbHighlight: TCheckBox;
    ExcludeList: TListBox;
    Label10: TLabel;
    AddExcl: TStyleSpeed;
    RemoveExcl: TStyleSpeed;
    cbNewStart: TCheckBox;
    Panel1: TPanel;
    rbStandard: TRadioButton;
    rb4DOS: TRadioButton;
    rbExtended: TRadioButton;
    cbSysWinQuit: TCheckBox;
    cbMsgSounds: TCheckBox;
    cbShowDeskMenu: TCheckBox;
    procedure OKBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure UndeleteEditDblClick(Sender: TObject);
    procedure OutlineMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure OutlineDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure OutlineDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure InsertBtnClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure EditBtnClick(Sender: TObject);
    procedure ExpandBtnClick(Sender: TObject);
    procedure CollapseBtnClick(Sender: TObject);
    procedure NotebookChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure OutlineEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure ConvertClick(Sender: TObject);
    procedure rbCollectClick(Sender: TObject);
    procedure ChangeFontClick(Sender: TObject);
    procedure CustomColorClick(Sender: TObject);
    procedure ColorPickChange(Sender: TObject);
    procedure ElementChange(Sender: TObject);
    procedure PaintBoxPaint(Sender: TObject);
    procedure BrowseXEditChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelBtnClick(Sender: TObject);
    procedure AddExclClick(Sender: TObject);
    procedure RemoveExclClick(Sender: TObject);
  private
    { Private declarations }
    DragItem : Longint;
    MakeChild : Boolean;
    StartChanged : Boolean;
    DisplayChanged : Boolean;
    NotifyTaskbar : Boolean;
    BuiltTree : Boolean;
    ColorsSet : Boolean;
    DropFocus : Integer;
    Sample1, Sample2, Sample3, Sample4 : TSampleImage;
    procedure EnumColorProc(const s: string);
    procedure ConvertProgItem(Sender : TObject;
      const group, caption: TFilename; const data :string);
    procedure SetDisplayChanged;
    procedure EraseDropFocus;
    procedure AddOutlineNode(index : Longint;
      const cap, data : string; Op: TAttachMode);
  public
    { Public declarations }
  end;


var OptionDlg: TOptionDlg;


implementation

{$R *.DFM}

uses Settings, Directry, MMSystem, Sys, WasteBin, MenuEdit, MultiGrd,
  Strings, Files, MiscUtil, IniFiles, Shorts, Start, Alias,
  WinProcs, ProgConv, Desk, Graphics, Resource, BarLink, IconWin;

procedure TOptionDlg.FormCreate(Sender: TObject);
var c: TCalColor;
begin
  { File view }
  SetRadioIndex([rbType, rbName, rbSize, rbDate], Integer(DefaultSort));
  IconEdit.Text        := Trim(IconStrings);
  FilterEdit.Text      := DefaultFilter;
  cbShowHidSys.Checked := DefaultHidSys;
  cbShowList.Checked   := ShowList;
  cbFileHints.Checked  := FileHints;
  Delay.Position       := HintDelay;
  SetRadioIndex([rbStandard, rb4DOS, rbExtended], Integer(FileSystem));

  { Confirmation }
  FileDelete.Checked    := ConfirmFileDel;
  FolderDelete.Checked  := ConfirmFolderDel;
  Replace.Checked       := ConfirmReplace;
  Copy.Checked          := ConfirmCopy;
  Move.Checked          := ConfirmMove;
  Protect.Checked       := ConfirmProtected;
  cbRemoveShort.Checked := ConfirmShort;
  cbConfirmAlias.Checked := ConfirmAlias;
  cbPromptQuit.Checked  := PromptQuit;
  SetRadioIndex([rbCopy, rbMove, rbPrompt], Integer(DropAction));

  { Desktop }
  cbAutoSize.Checked      := AutoSize;
  cbAutoActivate.Checked  := AutoActivate;
  cbBrowseSame.Checked    := BrowseSame;
  cbShortArrows.Checked   := ShortArrows;
  cbAliasArrows.Checked   := AliasArrows;
  cbHollowDrag.Checked    := HollowDrag;
  cbSaveWindows.Checked   := SaveWindows;
  SetRadioIndex([rbCascaded, rbRandom, rbSaved], Integer(WindowOpen));
  SysEdit.Text     := SysCaption;
  BinEdit.Text     := BinCaption;

  { Misc }
  cbEnableBin.Checked     := EnableBin;
  SetRadioIndex([rbLeave, rbEmpty, rbDelete, rbCollect], Integer(BinAction));
  KeepFreeEdit.Value      := KeepFree;
  UndeleteEdit.Text   := UndeleteProg;
  InspectEdit.Text := InspectProg;
  DefaultEdit.Text := DefaultProg;
  DiskEdit.Text    := DiskProg;

  { Display }
  BrowseXEdit.Value := BrowseGrid.X;
  BrowseYEdit.Value := BrowseGrid.Y;
  for c := Low(TCalColor) to High(TCalColor) do
    Element.Items.AddObject(ColorNames[c], Pointer(Colors[c]));
  FontDialog.Font.Assign(GlobalFont);

  { Preferences }
  cbShowSplash.Checked := ShowSplash;
  cbFindVersion.Checked   := FindVersion;
  cbShowGlyphs.Checked    := ShowGlyphs;
  cbClearSearch.Checked  := ClearSearch;
  cbAnimCursor.Checked := AnimCursor;
  cbProgDrop.Checked := ProgDrop;
  cbMsgSounds.Checked := MsgDialogSounds;
  cbTaskbar.Checked := LoadTaskbar;
  cbRestoreSys.Checked := RestoreSys;
  cbRefreshShort.Checked := RefreshShort;
  cbAlwaysStart.Checked := AlwaysStart;
  cbNewStart.Checked := NewStart;
  cbShowDeskMenu.Checked := ShowDeskMenu;

  { Taskbar }

  cbAlwaysVisible.Checked := ini.ReadBool('Taskbar', 'StayVisible', True);
  cbShrinkMax.Checked := ini.ReadBool('Taskbar', 'NoOverlap', False);
  cb24Hour.Checked := ini.ReadBool('Taskbar', '24Hour', False);
  cbHighlight.Checked := ini.ReadBool('Taskbar', 'Highlight', True);
  cbAnimate.Checked := ini.ReadBool('Taskbar', 'Animate', True);
  cbButtonHint.Checked := ini.ReadBool('Taskbar', 'ButtonHint', True);
  RefreshEdit.Value := ini.ReadInteger('Taskbar', 'Refresh', 5);
  ini.ReadStrings('Exclude', ExcludeList.Items);

  Outline.ItemHeight := LineHeight;
  Notebook.PageIndex := 0;
  DropFocus := -1;
end;


procedure TOptionDlg.OKBtnClick(Sender: TObject);
var c: TCalColor;
begin
  { File display }
  DefaultSort := TSortOrder(GetRadioIndex([rbType, rbName, rbSize, rbDate]));
  DefaultFilter := FilterEdit.Text;
  DefaultHidSys := cbShowHidSys.Checked;
  IconStrings := ' ' + Lowercase(Trim(IconEdit.Text)) + ' ';
  ShowList   := cbShowList.Checked;
  FileHints  := cbFileHints.Checked;
  HintDelay  := Delay.Position;
  FileSystem := TFileSystem(GetRadioIndex([rbStandard, rb4DOS, rbExtended]));

  { Confirmation }
  ConfirmFileDel   := FileDelete.Checked;
  ConfirmFolderDel := FolderDelete.Checked;
  ConfirmReplace   := Replace.Checked;
  ConfirmCopy      := Copy.Checked;
  ConfirmMove      := Move.Checked;
  ConfirmProtected := Protect.Checked;
  ConfirmShort     := cbRemoveShort.Checked;
  ConfirmAlias     := cbConfirmAlias.Checked;
  PromptQuit       := cbPromptQuit.Checked;
  DropAction := TDropAction(GetRadioIndex([rbCopy, rbMove, rbPrompt]));

  { Desktop }
  AutoSize := cbAutoSize.Checked;
  AutoActivate := cbAutoActivate.Checked;
  BrowseSame := cbBrowseSame.Checked;
  ShortArrows := cbShortArrows.Checked;
  AliasArrows := cbAliasArrows.Checked;
  HollowDrag := cbHollowDrag.Checked;
  SaveWindows := cbSaveWindows.Checked;
  WindowOpen := TWindowOpen(GetRadioIndex([rbCascaded, rbRandom, rbSaved]));
  BinCaption := BinEdit.Text;
  SysCaption := SysEdit.Text;

  { Misc }
  EnableBin := cbEnableBin.Checked;
  Bin.Visible := EnableBin;
  BinAction := TBinAction(GetRadioIndex([rbLeave, rbEmpty, rbDelete, rbCollect]));
  KeepFree :=KeepFreeEdit.Value;
  UndeleteProg := UndeleteEdit.Text;
  InspectProg := InspectEdit.Text;
  DefaultProg := DefaultEdit.Text;
  DiskProg := DiskEdit.Text;

  { Display }

  if DisplayChanged then begin
    BrowseGrid.X := BrowseXEdit.Value;
    BrowseGrid.Y := BrowseYEdit.Value;
    for c:= Low(TCalColor) to High(TCalColor) do
      Colors[c] := Longint(Element.Items.Objects[Integer(c)]);
    GlobalFont.Assign(FontDialog.Font);
    Desktop.Configure;
  end;

  { Preferences }
  ShowSplash := cbShowSplash.Checked;
  FindVersion := cbFindVersion.Checked;
  ShowGlyphs := cbShowGlyphs.Checked;
  ClearSearch := cbClearSearch.Checked;
  AnimCursor := cbAnimCursor.Checked;
  ProgDrop := cbProgDrop.Checked;
  MsgDialogSounds := cbMsgSounds.Checked;
  LoadTaskbar := cbTaskbar.Checked;
  RestoreSys := cbRestoreSys.Checked;
  RefreshShort := cbRefreshShort.Checked;
  AlwaysStart := cbAlwaysStart.Checked;
  NewStart := cbNewStart.Checked;
  ShowDeskMenu := cbShowDeskMenu.Checked;

  if StartChanged then
    StartMenu.RebuildFromOutline(Outline, ApplicationPath + 'START.INI');

  ini.WriteBool('Taskbar', 'StayVisible', cbAlwaysVisible.Checked);
  ini.WriteBool('Taskbar', 'NoOverlap', cbShrinkMax.Checked);
  ini.WriteBool('Taskbar', '24Hour', cb24Hour.Checked);
  ini.WriteBool('Taskbar', 'Highlight', cbHighlight.Checked);
  ini.WriteBool('Taskbar', 'Animate', cbAnimate.Checked);
  ini.WriteBool('Taskbar', 'ButtonHint', cbButtonHint.Checked);
  ini.WriteInteger('Taskbar', 'Refresh', RefreshEdit.Value);
  ini.WriteStrings('Exclude', ExcludeList.Items);

  SaveSettings;

  if NotifyTaskbar or DisplayChanged then
    PostMessage(TaskbarWindow, WM_CALYPSO, CM_TASKCONFIG, 0);

  Close;
end;


procedure TOptionDlg.EnumColorProc(const s: string);
begin
  ColorPick.Items.AddObject(System.Copy(s, 3, Length(s)-2), TObject(StringToColor(s)));
end;


procedure TOptionDlg.FormDestroy(Sender: TObject);
var i: Integer;
begin
  with Outline do
    for i := 1 to ItemCount do
      if Items[i].Data <> nil then Dispose(PString(Items[i].Data));

  MenuEditDlg.Free;
  Sample1.Free;
  Sample2.Free;
  Sample3.Free;
  Sample4.Free;

  OptionDlg := nil;
end;


procedure TOptionDlg.UndeleteEditDblClick(Sender: TObject);
begin
  if OpenDialog.Execute then (Sender as TEdit).Text := OpenDialog.Filename;
end;


procedure TOptionDlg.OutlineMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  r : TRect;
  i : Longint;
  p : TPoint;
begin
  if ssDouble in Shift then exit
  else if Button = mbRight then with Outline do begin
    i := GetItem(X, Y);
    if i > 0 then SelectedItem := i;
    GetCursorPos(p);
    OutlineMenu.Popup(p.X, p.Y);
  end
  else with Outline do begin
    DragItem := GetItem(X, Y);
    if DragItem > 0 then begin
      MakeChild := ssAlt in Shift;
      with ClientRect do begin
        r.TopLeft := ClientToScreen(TopLeft);
        r.BottomRight := ClientToScreen(Bottomright);
        ClipCursor(@r);
      end;
      BeginDrag(False);
    end;
  end
end;


procedure TOptionDlg.EraseDropFocus;
begin
  if DropFocus <> -1 then with Outline do
    Canvas.DrawFocusRect(Bounds(0, DropFocus * ItemHeight, Width, ItemHeight));
  DropFocus := -1;
end;


procedure TOptionDlg.OutlineDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var i: Integer;
begin
  Accept := ((Sender = Source) or
             (Source is TMultiGrid) and (Source <> SysWindow.Grid))
            and (Outline.GetItem(X, Y) > 0);

  with Outline do begin
    if not Accept or (State = dsDragLeave) then
      EraseDropFocus
    else begin
      i := Y div ItemHeight;
      if i <> DropFocus then begin
        EraseDropFocus;
        Canvas.DrawFocusRect(Bounds(0, i * ItemHeight, Width, ItemHeight));
        DropFocus := i;
      end;
    end;
  end;
end;


procedure TOptionDlg.OutlineDragDrop(Sender, Source: TObject; X,
  Y: Integer);
const
  MoveOp: array[Boolean] of TAttachMode = (oaInsert, oaAddChild);
var
  dest : Longint;
  i : Integer;
begin
  EraseDropFocus;
  dest := Outline.GetItem(X, Y);

  if Source is TMultiGrid then
    with (TMultiGrid(Source).Owner as TIconWindow).CompileSelection(False) do
      for i := 0 to Count-1 do
        with  TDirItem(Items[i]) do
          AddOutlineNode(dest, GetTitle, GetStartInfo, oaAddChild)

  else with Outline do begin
    BeginUpdate;
    Items[DragItem].MoveTo(dest, MoveOp[MakeChild]);
    EndUpdate;
  end;
  StartChanged := True;
end;


procedure TOptionDlg.InsertBtnClick(Sender: TObject);
begin
  with Outline, MenuEditDlg do
    if SelectedItem = 0 then AddBtn.Click else
      if EditItem('Insert menu item', '', '', False) = mrOK then
        AddOutlineNode(SelectedItem, CaptionEdit.Text, DataString, oaAddChild);
end;


procedure TOptionDlg.AddBtnClick(Sender: TObject);
begin
  with MenuEditDlg do
  if EditItem('Add menu item', '', '', False) = mrOK then
    AddOutlineNode(Outline.SelectedItem, CaptionEdit.Text, DataString, oaInsert);
end;

procedure TOptionDlg.AddOutlineNode(index : Longint;
  const cap, data : string; Op: TAttachMode);
var p: PString;
begin
  StartChanged := True;
  New(p);
  p^ := data;
  case Op of
    oaAdd      : Outline.AddObject(index, cap, p);
    oaAddChild : Outline.AddChildObject(index, cap, p);
    oaInsert   : Outline.InsertObject(index, cap, p);
  end;
end;


procedure TOptionDlg.DeleteBtnClick(Sender: TObject);

procedure DisposeNode(node : TOutlineNode);
var i : Longint;
begin
  Dispose(PString(node.Data));
  i := node.GetFirstChild;
  while i <> -1 do begin
    DisposeNode(Outline.Items[i]);
    i := node.GetNextChild(i);
  end;
end;


var
  node: TOutlineNode;
  i : Longint;
begin
  with Outline do
    if SelectedItem > 0 then begin
      node := Items[SelectedItem];
      if node.HasItems and (MsgDialog('Delete this menu?',
        mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then exit;

      DisposeNode(node);
      node.Collapse;
      i := node.Parent.GetPrevChild(SelectedItem);
      if i > 0 then Items[i].Collapse;
      Delete(SelectedItem);
      StartChanged := True;
    end;
end;


procedure TOptionDlg.EditBtnClick(Sender: TObject);
var node : TOutlineNode;
begin
  with Outline, MenuEditDlg do
    if (SelectedItem > 0) then begin
      node := Items[SelectedItem];
      if EditItem('Edit menu item', node.Text,
      PString(node.Data)^, node.HasItems) = mrOK then begin
        PString(node.Data)^ := DataString;
        node.Text := CaptionEdit.Text;
        StartChanged := True;
      end;
    end;
end;


procedure TOptionDlg.ExpandBtnClick(Sender: TObject);
begin
  Outline.FullExpand;
end;

procedure TOptionDlg.CollapseBtnClick(Sender: TObject);
begin
  Outline.FullCollapse;
end;


procedure TOptionDlg.NotebookChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
  HelpContext := NewTab + 20;
  HelpBtn.HelpContext := HelpContext;

  if (NewTab = 3) and not BuiltTree then begin
    MenuEditDlg := TMenuEditDlg.Create(Application);
    StartMenu.AssignToOutline(Outline);
    Outline.SetUpdateState(False);
    BuiltTree := True;
  end

  else if (NewTab = 4) and not ColorsSet then begin
    GetColorValues(EnumColorProc);
    Sample1 := TSampleImage.Create('CDROM(D:)', icons.Get('CDROMDrive'));
    Sample2 := TSampleImage.Create('command.com', icons.Get('MSDOS'));
    Sample3 := TSampleImage.Create('windows', foldericon);
    Sample4 := TSampleImage.Create('config.sys', fileicon);
    ColorsSet := True;
  end

  else if NewTab = 7 then
    NotifyTaskbar := True;
end;


procedure TOptionDlg.OutlineEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
  ClipCursor(nil);
end;

procedure TOptionDlg.ConvertClick(Sender: TObject);
begin
  with TConvertDlg.Create(Application) do
  try
    OnConvertProg := ConvertProgItem;
    ShowModal;
  finally
    Free;
  end;
end;


procedure TOptionDlg.ConvertProgItem(Sender : TObject;
  const group, caption: TFilename; const data: string);
var
  i, parentnode: Longint;
begin
  with Outline do begin
    parentnode := GetTextItem(group);

    if parentnode = 0 then begin
      AddOutlineNode(0, group, '', oaInsert);
      AddOutlineNode(GetTextItem(group), caption, data, oaAddChild);
    end
    else begin
      i := Items[parentnode].GetFirstChild;
      while i <> -1 do
        if CompareText(Items[i].Text, caption) = 0 then begin
          PString(Items[i].Data)^ := data;
          Exit;
        end
        else i := Items[parentnode].GetNextChild(i);

      AddOutlineNode(parentnode, caption, data, oaAddChild);
    end;
  end;
end;


procedure TOptionDlg.rbCollectClick(Sender: TObject);
begin
  with rbCollect do begin
    KeepFreeLab.Enabled := Checked;
    KeepFreeEdit.Enabled := Checked;
  end;
end;

procedure TOptionDlg.ChangeFontClick(Sender: TObject);
begin
  if FontDialog.Execute then SetDisplayChanged;
end;


procedure TOptionDlg.SetDisplayChanged;
begin
  DisplayChanged := True;
  Paintbox.Repaint;
end;

procedure TOptionDlg.CustomColorClick(Sender: TObject);
var c: TColor;
begin
  if ColorDialog.Execute then begin
    c := ColorDialog.Color;
    with ColorPick do ItemIndex := Items.IndexOfObject(TObject(c));
    with Element do Items.Objects[ItemIndex] := TObject(c);
    Shape.Brush.Color := c;
    SetDisplayChanged;
  end;
end;


procedure TOptionDlg.ColorPickChange(Sender: TObject);
var c: TColor;
begin
  c := TColor(ColorPick.Items.Objects[ColorPick.ItemIndex]);
  with Element do Items.Objects[ItemIndex] := TObject(c);
  Shape.Brush.Color := c;
  SetDisplayChanged;
end;


procedure TOptionDlg.ElementChange(Sender: TObject);
var c: TColor;
begin
  CustomColor.Enabled := True;
  with Element do c := TColor(Items.Objects[ItemIndex]);

  with ColorPick do begin
    Enabled := True;
    ItemIndex := Items.IndexOfObject(TObject(c));
  end;

  Shape.Brush.Color := c;
  SetDisplayChanged;
end;


procedure TOptionDlg.PaintBoxPaint(Sender: TObject);
var
  r: TRect;
  w, h: Integer;
begin
  if NoteBook.PageIndex = 4 then begin
    SamplePanel.Color := TColor(Element.Items.Objects[Integer(ccWinFrame)]);
    w := BrowseXEdit.Value;
    h := BrowseYEdit.Value;

    with PaintBox do begin
      with Canvas do begin
        Font.Assign(FontDialog.Font);
        Brush.Color := TColor(Element.Items.Objects[Integer(ccIconBack)]);
        Pen.Color := clBlack;
        with ClientRect do Rectangle(Left, Top, Right, Bottom);
      end;

      r := Rect(1, 1, w+1, h+1);
      Sample1.Draw(Canvas, r);
      OffSetRect(r, w, 0);
      Sample2.Draw(Canvas, r);
      OffSetRect(r, -w, h);
      with Canvas do begin
        Brush.Color := TColor(Element.Items.Objects[Integer(ccIconSel)]);;
        FillRect(r);
        DrawFocusRect(r);
        Sample3.Draw(Canvas, r);
        Brush.Color := TColor(Element.Items.Objects[Integer(ccIconBack)]);
      end;
      OffSetRect(r, w, 0);
      Sample4.Draw(Canvas, r);
    end;
  end;
end;

procedure TOptionDlg.BrowseXEditChange(Sender: TObject);
begin
  SetDisplayChanged;
end;


procedure TOptionDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TOptionDlg.CancelBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TOptionDlg.AddExclClick(Sender: TObject);
var s: TFilename;
begin
  s := '';
  if InputQuery('Add taskbar exclusion', 'Filename', s) then begin
    s := ExtractFilename(s);
    if s > '' then ExcludeList.Items.Add(s);
  end;
end;

procedure TOptionDlg.RemoveExclClick(Sender: TObject);
begin
  with ExcludeList do
    if ItemIndex <> -1 then Items.Delete(ItemIndex);
end;

end.
