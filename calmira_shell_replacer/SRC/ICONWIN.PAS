{**************************************************************************}
{                                                                          }
{    Calmira shell for Microsoft® Windows(TM) 3.1                          }
{    Source Release 1.0                                                    }
{    Copyright (C) 1997  Li-Hsin Huang                                     }
{                                                                          }
{    This program is free software; you can redistribute it and/or modify  }
{    it under the terms of the GNU General Public License as published by  }
{    the Free Software Foundation; either version 2 of the License, or     }
{    (at your option) any later version.                                   }
{                                                                          }
{    This program is distributed in the hope that it will be useful,       }
{    but WITHOUT ANY WARRANTY; without even the implied warranty of        }
{    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         }
{    GNU General Public License for more details.                          }
{                                                                          }
{    You should have received a copy of the GNU General Public License     }
{    along with this program; if not, write to the Free Software           }
{    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.             }
{                                                                          }
{**************************************************************************}

unit IconWin;

{ Icon Windows unit.

  Fields

    FDir - the form's TDirectory object that holds a list of files and folders.

    SelSize - the size (in bytes) of all items selected

    FDragCopy - True if the current drag-and-drop should copy files if
      successful, False if the operation is a move.

    FSelected - the focused TDirItem

    FSelection - contains a list of selected TDirItems, but is only valid
      immediately after CompileSelection is called.

    FLocked - boolean that indicates if the form should not change its
      size automatically, probably due to the tree view being attached.

    DragJustEnded - flag that is set after OnDragEnd to stop deselections

    Stretching - true if the user is using the lasso to make a selection
}

interface

uses
  SysUtils, WinTypes, Classes, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  Directry, Menus, MultiGrd, Dropclnt, DropServ, DragDrop, Settings,
  Grids, Messages, Progress, Resource, CalForm, FormDrag, CalMsgs;

type
  TIconWindow = class(TCalForm)
    TotalLabel: TLabel;
    SelLabel: TLabel;
    ObjectMenu: TPopupMenu;
    Open: TMenuItem;
    OpenWith: TMenuItem;
    Delete: TMenuItem;
    Properties: TMenuItem;
    Rename: TMenuItem;
    CreateAlias: TMenuItem;
    Duplicate: TMenuItem;
    Grid: TMultiGrid;
    DropServer: TDropServer;
    DropClient: TDropClient;
    WinMenu: TPopupMenu;
    CreateFolder: TMenuItem;
    Undelete: TMenuItem;
    Run: TMenuItem;
    N1: TMenuItem;
    SetFilter: TMenuItem;
    SortbyType: TMenuItem;
    SortbyName: TMenuItem;
    SortbySize: TMenuItem;
    SortbyDate: TMenuItem;
    N2: TMenuItem;
    Inspect: TMenuItem;
    ViewList: TMenuItem;
    AliasProp: TMenuItem;
    Describe: TMenuItem;
    Dragger: TFormDrag;
    FileSystem: TMenuItem;
    Select: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure GridDragOver(Sender, Source: TObject; X, Y: Integer;
     State: TDragState; var Accept: Boolean);
    procedure GridDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ObjectMenuPopup(Sender: TObject);
    procedure OpenClick(Sender: TObject);
    procedure DeleteClick(Sender: TObject);
    procedure CreateFolderClick(Sender: TObject);
    procedure GridMouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
    procedure FormDragOver(Sender, Source: TObject; X, Y: Integer;
     State: TDragState; var Accept: Boolean);
    procedure OpenWithClick(Sender: TObject);
    procedure PropertiesClick(Sender: TObject);
    procedure GridCellSelected(Sender: TObject; Index : Integer; IsSelected: Boolean);
    procedure RenameClick(Sender: TObject);
    procedure GridKeyPress(Sender: TObject; var Key: Char);
    procedure FormDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure RunClick(Sender: TObject);
    procedure CreateAliasClick(Sender: TObject);
    procedure SetFilterClick(Sender: TObject);
    procedure SortByTypeClick(Sender: TObject);
    procedure UndeleteClick(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DuplicateClick(Sender: TObject);
    procedure GridDrawCell(Sender: TObject; Index: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure GridSelectCell(Sender: TObject; Index: Integer;
      var CanSelect: Boolean);
    procedure DropServerFileDrop(Sender: TObject; X, Y: Integer;
      Target: Word);
    procedure TotalLabelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GridMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GridEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure SelLabelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GridMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DropClientDropFiles(Sender: TObject);
    procedure DropServerDeskDrop(Sender: TObject; X, Y: Integer;
      Target: Word);
    procedure FormDblClick(Sender: TObject);
    procedure GridSelect(Sender: TObject; Index: Integer);
    procedure InspectClick(Sender: TObject);
    procedure ViewListClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TotalLabelClick(Sender: TObject);
    procedure AliasPropClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure DescribeClick(Sender: TObject);
    procedure FileSystemClick(Sender: TObject);
    procedure SelectClick(Sender: TObject);
    procedure WinMenuPopup(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FDir : TDirectory;
    Selsize : Longint;
    FDragCopy : Boolean;
    FSelected : TDirItem;
    FSelection: TFileList;
    FLocked : Boolean;
    DragJustEnded: Boolean;
    Stretching: Boolean;
    Corner, Anchor: TPoint;
    procedure Arrange(Sender : TObject);
    procedure InitFileOp(Op : TFileOperation);
    procedure DoneFileOp;
    function InitCopy(const dest: string) : Boolean;
    function InitMove(const dest: string) : Boolean;
    function InitDelete(const dest: string) : Boolean;
    procedure AutoResize;
    procedure ConstructPathMenu;
    procedure SetDragCopy(copy: Boolean);
    procedure GridDrawList(Sender: TObject; Index: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure WMSysCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;
    procedure WMNCRButtonDown(var Msg: TWMNCRButtonDown); message WM_NCRBUTTONDOWN;
    procedure WMActivate(var Msg : TWMActivate); message WM_ACTIVATE;
    procedure DrawLasso(r: TRect);
    procedure SelectFileHandler(Sender : TObject;
      const FileSpec : string; select : Boolean);
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Init(AOwner: TComponent;
      const foldername, filter: TFilename);
    procedure DropInFolder(const foldername: TFilename);
    procedure DropInWindow(d : TDirectory);
    procedure FolderRenamed(const previous, current: TFilename);
    function FileAt(x, y : Integer; wholecell: Boolean) : TDirItem;
    function CompileSelection(recurse: Boolean): TFileList;
    function CompileFilenames: TStringList;
    procedure ChangeDir(const foldername : string);
    function LoadDimensions: Boolean;
    procedure SaveDimensions;
    procedure Configure;
    procedure SettingsChanged(Changes : TSettingChanges); override;
    procedure RefreshWin;
    class function CalcSize(cols, rows : Integer): TPoint;

    property Dir : TDirectory read FDir;
    property Selected : TDirItem read FSelected write FSelected;
    property Selection: TFileList read FSelection;
    property DragCopy: Boolean read FDragCopy write SetDragCopy;
    property Locked : Boolean read FLocked write FLocked;
  end;

var
   Xspare, YSpare: Integer;
   SizeRight, DateLeft, TimeLeft, AttrLeft : Integer;

implementation

{$R *.DFM}

uses ShellAPI, FileProp, DiskProp, Drives, Busy, Graphics, Tree, Environs,
  Fileman, WasteBin, FileCtrl, OpenFile, RunProg, Desk, FileFind, Debug,
  Filter, Sys, Strings, MiscUtil, Files, WinProcs, Alias, FSysProp, Select, Clipbrd;


var
  PathMenu : TPopupMenu;
  LastPath : TFilename;

const
  LabelTop : Integer = 4;
  LabelDiv : Integer = 153;


procedure TIconWindow.FormCreate(Sender: TObject);
begin
  Icon.Assign(FolderIcon);
  DeleteMenu(GetSystemMenu(Handle, False), SC_SIZE, MF_BYCOMMAND);
  FSelection := TFileList.Create;
  SelLabel.Left := LabelDiv;
end;


procedure TIconWindow.FormDestroy(Sender: TObject);
begin
  Desktop.RemoveWindow(self);
  Dir.Free;
  FSelection.Free;
  if WindowOpen = woSaved then SaveDimensions;
end;


function TIconWindow.LoadDimensions: Boolean;
var
  l, t, w, h: Integer;
  s: string[31];
begin
  { Loads positions and size from INI file }
  s := WindowPos.Values[Caption];
  if s = '' then Result := False
  else try
    Result := Unformat(s, '%d,%d,%d,%d', [@l, @t, @w, @h]) = 4;
    if Result then begin
      SetBounds(l, t, w, h);
      Locked := True;
    end;
  except
    on EConvertError do;
  end;
end;


procedure TIconWindow.SaveDimensions;
begin
  WindowPos.Values[Caption] :=
    Format('%d,%d,%d,%d', [Left, Top, Width, Height]);
end;



procedure TIconWindow.Configure;
begin
  Color := Colors[ccWinFrame];

  with Grid do begin
    Visible := False;
    Color := Colors[ccIconBack];
    SelColor := Colors[ccIconSel];
    ThumbTrack := TrackThumb;

    if ViewList.Checked then begin
      DefaultColWidth := Width;
      DefaultRowHeight := LineHeight;
      OnDrawCell := GridDrawList;
    end
    else begin
      DefaultColWidth := BrowseGrid.X;
      DefaultRowHeight := BrowseGrid.Y;
    end;

    Font.Assign(GlobalFont);
    Canvas.Font.Assign(Font);
    SizeRight := Canvas.TextWidth('nnnnnnnn.nnn') + 30 + Canvas.TextWidth('9999.99MB');
    DateLeft := SizeRight + 10;
    TimeLeft := DateLeft + 6 + Canvas.TextWidth('00/00/00');
    AttrLeft := TimeLeft + 10 + Canvas.TextWidth('00:00 pm');
    Visible := True;
  end;

  with CalcSize(4, 1), Dragger do begin
    MinWidth := X;
    MinHeight := Y;
    Hollow := HollowDrag;
  end;
end;


constructor TIconWindow.Init(AOwner: TComponent;
  const foldername, filter: TFilename);
begin
  inherited Create(AOwner);

  { Icon windows always show a directory when opened, so a special
    constructor is needed to ensure that a directory name is used. }

  FDir := TDirectory.Create(Makepath(foldername));
  FDir.Filter := filter;
  FDir.Scan;
  FDir.OnUpdate := Arrange;

  Caption := Dir.Fullname;
  Desktop.AddWindow(self);

  if WindowOpen = woRandom then
    SetBounds(Random(Screen.Width - Width), Random(Screen.Height - Height - 60),
      Width, Height)

  else if not ((WindowOpen = woSaved) and LoadDimensions) then begin
    if Screen.ActiveForm is TIconWindow then begin
      Top := Screen.ActiveForm.Top + 32;
      Left := Screen.ActiveForm.Left + 32;
    end
    else begin
       Top := (Screen.Height - Height) div 2;
       Left := (Screen.Width - Width) div 2;
    end;
  end;

  ViewList.Checked := ShowList;
  Configure;

  SetMenuCheck([SortByType, SortByName, SortBySize, SortByDate],
    Integer(Dir.SortOrder));

  if Autosize and not Locked then AutoResize;
  Arrange(self);
end;


procedure TIconWindow.ConstructPathMenu;
var
  s: TFilename;
  m: TMenuItem;
  i: Integer;
begin
  { Fills a popup menu with the list of ancestor directories. }

  s := ExtractFileDir(Dir.Fullname);
  if LastPath = s then Exit;

  with PathMenu.Items do
    while Count > 0 do Items[0].Free;

  while Length(s) >= 3 do begin
    m := TMenuItem.Create(PathMenu);
    m.Caption := s;
    m.OnClick := Desktop.WindowSelect;
    PathMenu.Items.Add(m);
    if Length(s) = 3 then s := ''
    else s := ExtractFileDir(s);
  end;
end;


class function TIconWindow.CalcSize(cols, rows : Integer): TPoint;
begin
  Result.x := cols * BrowseGrid.X + XSpare;
  Result.y := rows * BrowseGrid.Y + YSpare;
end;


procedure TIconWindow.AutoResize;
var
  size: TPoint;
begin
  { Changes the size of the window depending on the number of icons
    in the list }

  if WindowState <> wsNormal then Exit;
  case Dir.Count of
    0..4   : size := CalcSize(4, 1);
    5..8   : size := CalcSize(4, 2);
    9..12  : size := CalcSize(4, 3);
    13..15 : size := CalcSize(5, 3);
    16..20 : size := CalcSize(5, 4);
    21..24 : size := CalcSize(6, 4);
    else     size := CalcSize(6, 5);
  end;

  if ViewList.Checked then begin
    size.x := CalcSize(4, 1).x;
    if UseDescriptions then
      if DescWidth > -1 then Inc(size.x, DescWidth)
      else Inc(size.x, (15 * BrowseGrid.X) div 10);
  end;

  { The OnResize event is only triggered when the bounds change, but
    as a convention, AutoResize needs to call Resize exactly once
    to reset some of the controls }

  if EqualRect(BoundsRect, Bounds(Left, Top, size.X, size.Y)) then Resize
  else SetBounds(Left, Top, size.X, size.Y);
end;


procedure TIconWindow.Arrange(Sender : TObject);
begin
  { Called after a directory's contents have changed }

  if not (csDestroying in ComponentState) then begin
    TotalLabel.Caption :=
      Format('%d object%s  %s',
        [Dir.Count, OneItem[Dir.Count = 1], FormatByte(Dir.Size)]);
    Selsize := 0;

    with Grid, Dir do begin
      Reset;                 { clear the grid }
      Limit := Count;        { set the selection extent }
      SizeGrid;              { adjust the rows and columns to fit }

      { The focus might be out of bounds after files have been deleted }
      if (Focus >= Count) and (Count > 0) then Focus := Count-1;
      GridSelect(self, Focus);
    end;
  end;
end;


procedure TIconWindow.FormResize(Sender: TObject);
var GridBottom : Integer;
begin
  if WindowState <> wsMinimized then begin
    Grid.SetBounds(4, 4, ClientWidth - 8, ClientHeight - 26);
    TotalLabel.Top := Grid.Top + Grid.Height + LabelTop;
    SelLabel.Top := TotalLabel.Top;

    with Grid do
    if ViewList.Checked then
      DefaultColWidth := Width - 2
    else
      { TCustomGrid doesn't compare the current column width with a new
        setting, so DefaultColWidth should be assigned only when required }
      if DefaultColWidth <> BrowseGrid.X then DefaultColWidth := BrowseGrid.X;

    Grid.SizeGrid;
    Invalidate;
  end;
end;



procedure TIconWindow.FormPaint(Sender: TObject);
var
  r: TRect;
  x, y: Integer;
begin
  Border3D(Canvas, ClientWidth-1, ClientHeight-1);
  { Draw the status bar bevels }
  r := Bounds(4, ClientHeight-19, LabelDiv-13, 16);
  Frame3D(Canvas, r, clBtnShadow, clBtnHighlight, 1);
  r := Bounds(LabelDiv - 5, ClientHeight-19, ClientWidth - LabelDiv + 2, 16);
  Frame3D(Canvas, r, clBtnShadow, clBtnHighlight, 1);
  { Draw the resize "grip" }
  Canvas.Draw(ClientWidth-17, ClientHeight-17, Sizebox);
end;


function TIconWindow.FileAt(x, y : Integer; WholeCell: Boolean) : TDirItem;
var
  rect : TRect;
  i : Integer;
begin
  { Returns the item at the given mouse coordinates (grid coordinate system).
    If WholeCell is true, the entire grid box tested for containment,
    otherwise only the icon area (approximately) is tested }

  i := Grid.MouseToCell(x, y);
  rect := Grid.CellBounds(i);

  if not (ViewList.Checked or WholeCell) then begin
    InflateRect(rect, -16, -8);
    OffsetRect(rect, 0, -8);
  end;

  if PtInRect(rect, Point(x, y)) and (i < Dir.Count) then
    Result := TDirItem(Dir[i])
  else Result := nil;
end;



procedure TIconWindow.GridDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
var
  f: TDirItem;
  DropInIcon : Boolean;
  NewDrop : Integer;
begin
  { Scroll the grid if the cursor is floating over the vertical
    scroll bar's buttons }

  with Grid do
    if (X > Width - 24) and (VisibleRowCount < RowCount) then begin
      if (Y < 32) and (TopRow > 0) then
        TopRow := TopRow-1
      else if (Y > Height-32) and (TopRow < RowCount-VisibleRowCount) then
        TopRow := TopRow+1;
    end;

  if Source = SysWindow.Grid then Accept := False
  else begin
    { This bit is tricky...when the cursor is over a suitable icon,
      the focus box is turned on.  However, when it is not over a suitable
      icon, Accept can still be True because the drop target becomes
      the window.  That is, Accept and DropInIcon are independent }

    f := FileAt(X, Y, False);
    DropInIcon := (f <> nil) and f.AcceptsDrops;
    NewDrop := Grid.MouseToCell(X, Y);
    Accept := (Source <> Sender) or ((NewDrop <> Grid.Focus) and DropInIcon);

    with Grid do
      if not (Accept and DropInIcon) or (State = dsDragLeave) then
        DropFocus := -1
      else
        DropFocus := NewDrop;
  end;
end;


procedure TIconWindow.GridDragDrop(Sender, Source: TObject; X, Y: Integer);
var target : TDirItem;
begin
  Grid.DropFocus := -1;
  target := FileAt(X, Y, False);

  if (target <> nil) and target.AcceptsDrops then
    target.DragDrop(Source)

  else if Source is TMultiGrid then
    (TMultiGrid(Source).Owner as TIconWindow).DropInWindow(Dir)

  else if Source = Bin.Listbox then
    Bin.RestoreTo(Dir.Fullname)
end;


procedure TIconWindow.InitFileOp(Op : TFileOperation);
begin
  { Begings a file operation by initialising the progress display,
    cursor and file manager }

  Desktop.SetCursor(crBusyPointer);
  CompileSelection(True);
  NoToAll;

  if (Selection.FolderCount > 0) or (Selection.FileCount > 1) then
    ProgressBox.Init(Op, Selection.FileCount)
  else
    BusyBox.ShowMessage(FileOpMessages[Op]);

  if UseDescriptions and Simul4DOS then
    Dir.Desc.LoadFromPath(Dir.Path);
end;


procedure TIconWindow.DoneFileOp;
begin
  ProgressBox.Hide;
  BusyBox.Hide;
  Desktop.ReleaseCursor;
  Desktop.RefreshNow;
  PlaySound(Sounds.Values['NotifyCompletion']);
  SetFocus;
  NoToAll;
end;



function TIconWindow.InitCopy(const dest : string): Boolean;
begin
  Result := not (ConfirmCopyStart and
    (MsgDialog(Format('Copy %d item%s from %s to %s?',
       [Grid.SelCount, OneItem[Grid.SelCount = 1], Dir.Fullname, dest]),
       mtConfirmation, [mbYes, mbNo], 0) <> mrYes));

  if Result then InitFileOp(foCopy);
end;


function TIconWindow.InitMove(const dest: string) : Boolean;
begin
  Result := not (ConfirmMoveStart and
    (MsgDialog(Format('Move %d item%s from %s to %s?',
       [Grid.SelCount, OneItem[Grid.SelCount = 1], Dir.Fullname, dest]),
       mtConfirmation, [mbYes, mbNo], 0) <> mrYes));

  if Result then InitFileOp(foMove);
end;


function TIconWindow.InitDelete(const dest: string) : Boolean;
begin
  Result := not (ConfirmDelStart and
    (MsgDialog(Format('Delete %d item%s from %s?',
    [Grid.Selcount, OneItem[Grid.SelCount = 1], dest]),
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes));

  if Result then InitFileOp(foDelete);
end;


procedure TIconWindow.DropInFolder(const foldername : TFilename);
var
  i : Integer;
  path : TFilename;
begin
  { Copies or moves selected items from this window into a
    specified folder.  If the folder is being shown in an icon window,
    DropInWindow should be used instead. }

  path := MakePath(foldername);
  if path = Dir.Path then begin
    ErrorMsg('Cannot copy or move items onto themselves');
    Exit;
  end;

  case DragCopy of
    True : if not InitCopy(foldername) then exit;
    False: if not InitMove(foldername) then exit;
  end;
  try
    if DragCopy then
      for i := 0 to Selection.count-1 do TDirItem(Selection[i]).CopyToPath(path)
    else
      for i := 0 to Selection.Count-1 do TDirItem(Selection[i]).MoveToPath(path);
  finally
    if not DragCopy then Dir.Flush;
    DoneFileOp;
  end;
end;


procedure TIconWindow.DropInWindow(d : TDirectory);
var i: Integer;
begin
  { Copies or moves selected items from this window into another window,
    represented by its directory object }

  if d = Dir then begin
    ErrorMsg('Cannot copy or move items onto themselves');
    exit;
  end;

  if UseDescriptions and Simul4DOS then
    d.Desc.LoadFromPath(d.Path);

  case DragCopy of
    True : if not InitCopy(d.Fullname) then exit;
    False: if not InitMove(d.Fullname) then exit;
  end;

  try
    if DragCopy then
       for i := 0 to Selection.count-1 do TDirItem(Selection[i]).CopyToDirectory(d)
    else
       for i := 0 to Selection.count-1 do TDirItem(Selection[i]).MoveToDirectory(d);
  finally
    if not DragCopy then Dir.Flush;
    d.Flush;
    DoneFileOp;
  end;
end;



procedure TIconWindow.ObjectMenuPopup(Sender: TObject);
var
  valid : Boolean;
  IsFile : Boolean;
begin
  { Hide inappropriate menu items, depending on the currently
    "focused" object.  }

  valid := Selected <> nil;
  IsFile := Selected is TFileItem;

  Describe.Visible := UseDescriptions;
  Open.Visible := valid;
  OpenWith.Visible := IsFile;
  Inspect.Visible := IsFile and (InspectProg > '');
  Duplicate.Visible := Selected is TFile;
  AliasProp.Visible := Selected is TAlias;
  Properties.Visible := valid;
  Rename.Visible := valid;
  Delete.Visible := valid;
  CreateAlias.Visible := valid and not (Selected is TAlias);
end;


procedure TIconWindow.OpenClick(Sender: TObject);
begin
  if Selected <> nil then Selected.Open;
end;


procedure TIconWindow.DeleteClick(Sender: TObject);
var i : Integer;
begin
  if (Grid.SelCount > 0) and InitDelete(Dir.Fullname) then
  try
    for i := 0 to Selection.Count-1 do TDirItem(Selection[i]).Delete;
  finally
    Dir.Flush;
    DoneFileOp;
  end;
end;


procedure TIconWindow.CreateFolderClick(Sender: TObject);
var s: TFilename;
begin
  s := '';
  if InputQuery('Create folder', 'New folder name', s) then
    Dir.CreateFolder(Lowercase(s));
end;


procedure TIconWindow.DrawLasso(r: TRect);
begin
  { Draw the "column of marching ants" selection box, like the
    one used in Delphi's form editor.  PolyLine must be used for
    this effect -- MoveTo and LineTo don't work }

  with Grid.Canvas do begin
    Pen.Style := psDot;
    Pen.Mode := pmXor;
    PolyLine([Point(r.Left, r.Top), Point(r.Right, r.Top),
      Point(r.Right, r.Bottom), Point(r.Left, r.Bottom),
      Point(r.Left, r.Top)]);
  end;
end;


procedure TIconWindow.GridMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  p : TPoint;
  r : TRect;
begin
  if not (ssDouble in Shift) then begin

    if Button = mbLeft then begin
      if (FileAt(X, Y, False) <> nil) and (Grid.SelCount > 0) then with Grid do begin
        { Start dragging when clicking over an icon }
        DragCopy := not (ssAlt in Shift);
        BeginDrag(False);
      end
      else with Grid do begin
        { Start lasso selection when clicking over empty space }
        Stretching := True;
        Update;
        Anchor := Point(X, Y);
        Corner := Anchor;
        with ClientRect do begin
          r.TopLeft := ClientToScreen(TopLeft);
          r.BottomRight := ClientToScreen(Bottomright);
          ClipCursor(@r);
        end;
      end;
    end

    else if Grid.Dragging then
      { Toggle move/copy when right clicking during file drag }
      DragCopy := not DragCopy

    else if not Stretching then with Grid do begin
      { Display appropriate context menu }
      GetCursorPos(p);
      if FileAt(X, Y, False) = nil then
        WinMenu.Popup(p.x, p.y)
      else begin
        Select(MouseToCell(X, Y));
        if SelCount > 0 then ObjectMenu.Popup(p.x, p.y);
      end;
    end;
  end;
end;


procedure TIconWindow.FormDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := (Source <> Grid) and (Source <> SysWindow.Grid);
end;


procedure TIconWindow.OpenWithClick(Sender: TObject);
var s: TFilename;
begin
  if not (Selected is TFileItem) then exit;
  s := TOpenFileDlg.Execute;
  if s > '' then TFileItem(Selected).OpenWith(s);
end;


procedure TIconWindow.PropertiesClick(Sender: TObject);
begin
  if Grid.SelCount > 0 then

  with TFilePropDlg.Create(Application) do
  try
    if Grid.Selcount = 1 then SetItem(Selected)
    else SetItem(CompileSelection(True));
    ShowModal;
  finally
    Free;
  end;
end;


procedure TIconWindow.GridCellSelected(Sender: TObject; Index : Integer;
  IsSelected: Boolean);
var s: Longint;
begin
  { Called once for each selection or deselection in the grid.  If the
    user selects 100 files in one go, this is called 100 times, so keep
    the code short }

  if Index < Dir.Count then begin
    s := TDirItem(Dir[Index]).Size;
    if IsSelected then Inc(Selsize, s) else Dec(Selsize, s);
  end;
end;


procedure TIconWindow.RenameClick(Sender: TObject);
var s: TFilename;
begin
  if Selected <> nil then with Selected do begin
    s := Filename;
    if InputQuery('Rename ' + Filename, 'New filename', s) then begin
      if UseDescriptions and Simul4DOS then
        Dir.Desc.LoadFromPath(Dir.Path);
      Filename := Lowercase(s);
      Dir.Update;
    end;
  end;
end;


procedure TIconWindow.GridKeyPress(Sender: TObject; var Key: Char);
var
  c: Char;
  i, foc: Integer;
  found : Boolean;
begin
  case Key of
   { Standard window management }
   '-': Desktop.ClosePathWindows(Dir.Fullname);
   '+': Desktop.CloseLowerWindows(Dir.Fullname);
   '*': Desktop.CloseOtherWindows(self);
   '/': Desktop.CloseWindows;
   '\': Desktop.OpenFolder(Dir.Path[1] + ':\');

  else
    { Jump to the next object which begins with this character }

    with Dir do if Count > 1 then begin
      c := LowCase(Key);
      foc := Grid.Focus;
      i := (foc + 1) mod Count;

      while (i <> foc) and (LowCase(TDirItem(List^[i]).GetTitle[1]) <> c) do
        i := (i + 1) mod Count;

      if i <> foc then Grid.Select(i);
    end;
  end;
end;


procedure TIconWindow.FormDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  if Source is TMultiGrid then
    TIconWindow(TMultiGrid(Source).Owner).DropInWindow(Dir)

  else if Source = Bin.Listbox then
    Bin.RestoreTo(Dir.Fullname)

  else if Source = FindList then
    ProcessFiles(FindForm.CompileSelection, Dir.Fullname);
end;


procedure TIconWindow.RefreshWin;
begin
  try
    Dir.Scan;
    if AutoSize and not Locked then AutoResize;
    Arrange(self);
  except
    on EScanError do Close;
  end;
end;


procedure TIconWindow.RunClick(Sender: TObject);
begin
  ChDir(Dir.Fullname);
  if Selected <> nil then RunExecute(Selected.Filename)
  else RunExecute('');
end;


procedure TIconWindow.CreateAliasClick(Sender: TObject);
var
  fname : TFilename;
begin
  if Selected <> nil then begin
    fname := ChangeFileExt(Selected.Fullname, '.als');

    if (ConfirmNewAlias or not (dfWriteable in GetDriveFlags(Caption[1]))) and
      not InputQuery('Create alias', 'Alias filename', fname) then Exit;

    Selected.WriteAlias(Lowercase(fname));
  end;
end;


procedure TIconWindow.SetFilterClick(Sender: TObject);
begin
  with TFilterDialog.Create(Application) do
  try
    FilterEdit.Text := Dir.Filter;
    ShowHidSys.Checked := Dir.Mask and faHidden <> 0;
    if ShowModal = mrOK then begin
      Dir.Filter := FilterEdit.Text;
      if ShowHidSys.Checked then Dir.Mask := Dir.Mask or faHidSys
      else Dir.Mask := Dir.Mask and not faHidSys;
      Dir.Scan;
      Dir.Update;
    end;
  finally
    Free;
  end;
end;


procedure TIconWindow.SortByTypeClick(Sender: TObject);
begin
  { Handles all "sorting" menu item events }
  with Sender as TMenuItem do
    if not Checked then begin
      SetMenuCheck([SortByType, SortByName, SortBySize, SortByDate], Tag);
      Dir.SortOrder := TSortOrder(Tag);
      Dir.Sort;
      Dir.Update;
    end;
end;


function TIconWindow.CompileSelection(recurse: Boolean): TFileList;
var i: Integer;
begin
  { Fills a TFileList with the current selection.  Recurse controls
    whether subdirectories have their content sizes counted.  Use
    this instead of the TDirectory object when items may be moved
    or deleted }

  Desktop.SetCursor(crHourGlass);
  with Selection do begin
    Clear;
    Capacity := max(Capacity, Grid.SelCount);
    Selection.DeepScan := recurse;
    for i := 0 to Dir.Count-1 do
      if Grid.Selected[i] then Selection.Add(Dir[i]);
  end;
  Desktop.ReleaseCursor;
  Result := Selection;
end;


procedure TIconWindow.UndeleteClick(Sender: TObject);
begin
  ExecuteFile(EnvironSubst(UndeleteProg), '', Dir.Fullname,
    'Open', SW_SHOWNORMAL);
end;


procedure TIconWindow.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  item : TMenuItem;
  s: TFilename;
  p: PChar;
begin
  { The grid can only have one PopupMenu property, so the window menu
    is searched manually for a shortcut match }
  s := '';
  item := WinMenu.FindItem(Shortcut(Key, Shift), fkShortcut);

  if item <> nil then item.Click
  else begin
    { Handle keyboard commands not in menus }

    if (Key = VK_BACK) and (Shift + [ssAlt] = [ssAlt]) then begin
      if Length(Dir.Path) > 3 then
        Desktop.OpenFolder(ExtractFileDir(Dir.Fullname))
      else
        SysWindow.ShowNormal;
    end

    else if (Shift = [ssCtrl, ssShift]) and (Chr(Key) in ValidDrives) then
      { Ctrl+Alt+Letter opens the root directory }
      Desktop.OpenFolder(LowCase(Chr(Key)) + ':\')

    else if Shift = [ssCtrl] then
      case key of
        Ord('C'): Clipboard.AsText := Dir.Path + Dir.Filter;
        Ord('E'): OpenExplorer(Dir.Fullname);
        Ord('F'): FileFindExecute(Dir.Fullname, 1);
        Ord('P'): begin
                    if Selected <> nil then s := Selected.Filename;
                    if InputQuery('Print file', 'Filename', s) then
                      ExecuteFile(s, '', Dir.Fullname, 'print', SW_SHOWNORMAL);
                  end;
        Ord('O'): if InputQuery('Open folder', 'Folder name', s) then
                    Desktop.OpenFolder(s);
        VK_F5   : Desktop.Cascade;
      end

    else if (Shift = [ssShift]) and (key = VK_F5) then
      Desktop.ArrangeIcons

    else if Shift = [] then
      case Key of
        VK_F5   : RefreshWin;
        VK_F12  : Application.Minimize;
      end;
  end;
end;


procedure TIconWindow.WMSysCommand(var Msg: TWMSysCommand);
begin
  inherited;
  case Msg.CmdType and $FFF0 of
    SC_MINIMIZE: PlaySound(Sounds.Values['WindowMinimize']);
    SC_MAXIMIZE: PlaySound(Sounds.Values['WindowMaximize']);
    SC_RESTORE : PlaySound(Sounds.Values['WindowRestore']);
    SC_CLOSE   : PlaySound(Sounds.Values['WindowClose']);
  end;
end;


procedure TIconWindow.FormShow(Sender: TObject);
begin
  PlaySound(Sounds.Values['WindowOpen']);
  if IconWindowTask then
    PostMessage(TaskbarWindow, WM_CALMIRA, CM_ADDCALWINDOW, Handle);
end;


procedure TIconWindow.DuplicateClick(Sender: TObject);
var s: string;
begin
   if not (Selected is TFileItem) then exit;

   s := '';
   if InputQuery('Duplicate '+Selected.Filename, 'New filename', s) then begin
     (Selected as TFileItem).Duplicate(Lowercase(s));
     Dir.Update;
   end;
end;


procedure TIconWindow.GridDrawCell(Sender: TObject; Index: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  TDirItem(Dir[Index]).Draw(Grid.Canvas, Rect);
end;


procedure TIconWindow.GridDrawList(Sender: TObject; Index: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  TDirItem(Dir[Index]).DrawAsText(Grid.Canvas, Rect)
end;


procedure TIconWindow.GridSelectCell(Sender: TObject; Index: Integer;
  var CanSelect: Boolean);
begin
  CanSelect := not Stretching;
end;


procedure TIconWindow.DropServerFileDrop(Sender: TObject; X, Y: Integer;
  Target: Word);
var i: Integer;
begin
  if Grid.SelCount > 0 then
    with DropServer do
      for i := 0 to Dir.Count-1 do
        if Grid.Selected[i] then Files.Add(TDirItem(Dir[i]).Fullname);
end;


procedure TIconWindow.TotalLabelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then DiskPropExecute(Upcase(Dir.Path[1]));
end;


procedure TIconWindow.GridMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  r, s: TRect;
  i, count, topitem: Integer;
begin
  if Button <> mbLeft then exit;
  ClipCursor(nil);
  with Grid do begin
    count := Grid.SelCount;

    if Stretching then begin
      { Select files inside lasso }
      Stretching := False;
      R := NormalizeRect(Anchor, Corner);
      DrawLasso(R);
      topitem := Toprow * ColCount;
      for i := topitem to Min(Dir.Count,
       topitem + (VisibleColCount * (VisibleRowCount+1)))-1 do begin

        s := CellBounds(i);
        InflateRect(s, -16, -8);
        if Intersects(R, S) then Selected[i] := True;
      end;
    end;

    { Deselect when the user clicks in an empty area, provided that
      no new files were selected and a drag hasn't just finished }

    if (count = SelCount) and not DragJustEnded and
      (FileAt(X, Y, True) = nil) and (Dir.Count > 0) then
      DeselectAll;

    GridSelect(self, Focus);
  end;
  DragJustEnded := False;
end;


procedure TIconWindow.GridEndDrag(Sender, Target: TObject; X, Y: Integer);
begin
  DragJustEnded := True;
  DropServer.DragFinished;
end;


procedure TIconWindow.SelLabelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    with Grid do
      if SelCount = 0 then SelectAll
      else DeselectAll

  else if Button = mbRight then
    Select.Click;
end;


procedure TIconWindow.GridMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 if Grid.Dragging then begin
    if DropServer.CanDrop and AnimCursor then
      SetCursor(Screen.Cursors[crFlutter]);
 end
 else if Stretching then begin
    { erase previous lasso and redraw }
    DrawLasso(NormalizeRect(Anchor, Corner));
    Corner := Point(X, Y);
    DrawLasso(NormalizeRect(Anchor, Corner));
  end;
end;


procedure TIconWindow.DropClientDropFiles(Sender: TObject);
var target : TDirItem;
begin
  with DropClient do
  if (WindowState <> wsMinimized) and PtInRect(Grid.BoundsRect, DropPos) then begin

    target := FileAt(DropPos.x, DropPos.y, False);

    if (target <> nil) and target.AcceptsDrops then
      target.DragDrop(Files)
    else
      ProcessFiles(Files, Dir.Fullname)
  end
  else ProcessFiles(Files, Dir.Fullname)
end;


procedure TIconWindow.FolderRenamed(const previous, current: TFilename);
var s: TFilename;
begin
  { Search for the ancestor which has been renamed and change that
    part of the string to the new name }

  s := Dir.Fullname;
  if (previous = s) or IsAncestorDir(previous, s) then begin
    System.Delete(s, 1, Length(previous));
    Desktop.RemoveWindow(self);
    Dir.Path := current + s + '\';
    Caption := Dir.Fullname;
    Desktop.AddWindow(self);
  end;
end;


procedure TIconWindow.DropServerDeskDrop(Sender: TObject; X, Y: Integer;
  Target: Word);
begin
  if Selected <> nil then
    Selected.CreateShortcut.MinPosition := Point(X - 16, Y - 16);
end;


procedure TIconWindow.WMNCRButtonDown(var Msg: TWMNCRButtonDown);
begin
  inherited;
  with Msg do
    if HitTest = HTSYSMENU then begin
      ConstructPathMenu;
      PathMenu.Popup(XCursor, YCursor);
    end;
end;


function TIconWindow.CompileFilenames: TStringList;
var i: Integer;
begin
  { Just returns a new list of filenames.  Compare CompileSelection method }
  Result := TStringList.Create;
  for i := 0 to Dir.Count-1 do
    if Grid.Selected[i] then Result.Add(TDirItem(Dir[i]).Fullname);
end;


procedure TIconWindow.SetDragCopy(copy: Boolean);
const
  DragCursors : array[Boolean, Boolean] of TCursor =
    ( (crDropFile, crDropMulti), (crDropCopy, crDropMultiCopy ));
begin
  { Sets the cursor shape depending on whether copy mode is on, and
    how many items are selected }

  FDragCopy := copy;
  with Grid do DragCursor := DragCursors[FDragCopy, SelCount > 1];
  RefreshCursor;
end;


procedure TIconWindow.FormDblClick(Sender: TObject);
const
  NewStates : array[TWindowState] of TWindowState =
    (wsMaximized, wsMinimized, wsNormal);
begin
  WindowState := NewStates[WindowState];
end;


procedure TIconWindow.GridSelect(Sender: TObject; Index: Integer);
const
  Labels : array[Boolean] of string[23] =
    ('Selected %d items  %s', 'Selected %d item  %s');
begin
  { Called whenever the selection has changed }

  if (index < Dir.Count) and (Grid.SelCount > 0) then
    Selected := TDirItem(Dir[index])
  else begin
    Selected := nil;
    if Dir.Count = 0 then Grid.Focus := 0;
  end;

  SelLabel.Caption := Format(Labels[Grid.SelCount = 1],
    [Grid.SelCount, FormatByte(Selsize)]);
end;


procedure TIconWindow.InspectClick(Sender: TObject);
begin
  if Selected is TFileItem then
    TFileItem(Selected).OpenWith(EnvironSubst(InspectProg));
end;


procedure TIconWindow.ChangeDir(const foldername : string);
begin
  if foldername = Caption then exit;
  Desktop.RemoveWindow(self);
  Dir.Path := MakePath(foldername);
  Caption := Dir.Fullname;
  Desktop.AddWindow(self);
  RefreshWin;
end;


procedure TIconWindow.ViewListClick(Sender: TObject);
begin
  ViewList.Checked := not ViewList.Checked;

  with Grid do begin
    Visible := False;
    if ViewList.Checked then begin
      DefaultRowHeight := LineHeight;
      OnDrawCell := GridDrawList;
    end
    else begin
      DefaultRowHeight := BrowseGrid.Y;
      OnDrawCell := GridDrawCell;
    end;
    if AutoSize and not Locked and (WindowState = wsNormal) then AutoResize
    else Resize;
    Visible := True;
    SetFocus;
  end;
end;


procedure TIconWindow.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var p: TPoint;
begin
  if (Dragger.DragState = fdNone) and (Button = mbRight) then begin
    GetCursorPos(p);
    WinMenu.Popup(p.X, p.Y);
  end;
end;


procedure TIconWindow.TotalLabelClick(Sender: TObject);
begin
  RefreshWin;
end;


procedure TIconWindow.AliasPropClick(Sender: TObject);
begin
  if Selected is TAlias then TAlias(Selected).Edit;
end;


procedure TIconWindow.WMActivate(var Msg : TWMActivate);
begin
  inherited;
  if Msg.Active = WA_INACTIVE then Application.HintPause := 800
  else Application.HintPause := HintDelay;
end;


procedure TIconWindow.FormHide(Sender: TObject);
begin
  if IconWindowTask then
    PostMessage(TaskbarWindow, WM_CALMIRA, CM_DELCALWINDOW, Handle);
end;


procedure TIconWindow.DescribeClick(Sender: TObject);
var i: Integer;
begin
  if Grid.Selcount = 0 then Exit;

  if UseDescriptions and Simul4DOS then
    Dir.Desc.LoadFromPath(Dir.Path);

  CompileSelection(False);
  for i := 0 to Selection.count-1 do
    if not TDirItem(Selection[i]).EditDescription then Break;

  Dir.Desc.SaveToPath(Dir.Path);
  Grid.Invalidate;
end;


procedure TIconWindow.FileSystemClick(Sender: TObject);
begin
  ShowModalDialog(TFileSysPropDlg);
end;

procedure TIconWindow.SettingsChanged(Changes: TSettingChanges);
begin
  if [scSystem, scFileSystem, scDesktop, scDisplay] * Changes <> [] then
    Configure;
  if sc4DOS in Changes then RefreshWin;
end;


procedure TIconWindow.SelectClick(Sender: TObject);
begin
  with TSelectFileDlg.Create(Application) do
    try
      OnSelectFiles := SelectFileHandler;
      ShowModal;
    finally
      Free;
    end;
end;



procedure TIconWindow.SelectFileHandler(Sender : TObject;
  const FileSpec : string; select : Boolean);
var i: Integer;
begin
  for i := 0 to Dir.Count-1 do
    if WildCardMatch(TDirItem(Dir[i]).Filename, FileSpec) then
      Grid.Selected[i] := select;
  GridSelect(self, Grid.Focus);
end;



procedure TIconWindow.WinMenuPopup(Sender: TObject);
begin
  Select.Enabled := Dir.Count > 0;
  SetFilter.Checked := Dir.Filter <> DefaultFilter;
end;

procedure TIconWindow.GridDblClick(Sender: TObject);
begin
  if (GetAsyncKeyState(VK_SHIFT) < 0) and (Selected is TFolder) then
    OpenExplorer(Selected.Fullname)
  else
    Open.Click;
end;

procedure TIconWindow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

initialization
  PathMenu := TPopupMenu.Create(Application);
  Xspare := GetSystemMetrics(SM_CYVSCROLL) + 13;
  Yspare := GetSystemMetrics(SM_CYCAPTION) + 29;

  if Screen.PixelsPerInch > 96 then begin
    LabelTop := 2;
    LabelDiv := 170;
  end;
end.
