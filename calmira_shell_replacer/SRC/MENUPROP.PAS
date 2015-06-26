unit Menuprop;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, Menus, Grids, Outline, TabNotBk;

type
  TBtnBottomDlg = class(TForm)
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    HelpBtn: TBitBtn;
    TabbedNotebook1: TTabbedNotebook;
    Outline: TOutline;
    OutlineMenu: TPopupMenu;
    AddItem: TMenuItem;
    InsertItem: TMenuItem;
    EditItem: TMenuItem;
    DeleteItem: TMenuItem;
    ExpandItem: TMenuItem;
    CollapseItem: TMenuItem;
    N1: TMenuItem;
    Convert: TMenuItem;
    procedure OutlineDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure OutlineDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure OutlineEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure OutlineMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BtnBottomDlg: TBtnBottomDlg;

implementation

{$R *.DFM}

procedure TBtnBottomDlg.OutlineDragDrop(Sender, Source: TObject; X,
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

procedure TBtnBottomDlg.OutlineDragOver(Sender, Source: TObject; X,
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

procedure TBtnBottomDlg.OutlineEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
  ClipCursor(nil);
end;

procedure TBtnBottomDlg.OutlineMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
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

end.
