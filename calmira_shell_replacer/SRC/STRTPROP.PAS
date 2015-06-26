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

unit Strtprop;

{ Start Menu Properties Dialog

  The main control is a TOutline that contains a copy of the start
  menu.  Each outline node contains a pointer to a dynamic 255 char
  string that stores additional data.  The string size is fixed
  because TOutlineNode's Data property cannot be used easily with
  AssignStr, which requires a var parameter.
}

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, Menus, Grids, Outline, TabNotBk, SysUtils, Chklist, StylSped,
  Scrtree, Messages, CalMsgs, CalForm, Settings;

type
  TStartPropDlg = class(TCalForm)
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Notebook: TTabbedNotebook;
    OutlineMenu: TPopupMenu;
    AddItem: TMenuItem;
    InsertItem: TMenuItem;
    EditItem: TMenuItem;
    DeleteItem: TMenuItem;
    ExpandItem: TMenuItem;
    CollapseItem: TMenuItem;
    N1: TMenuItem;
    Convert: TMenuItem;
    AddBtn: TStyleSpeed;
    InsertBtn: TStyleSpeed;
    EditBtn: TStyleSpeed;
    DeleteBtn: TStyleSpeed;
    ExpandBtn: TStyleSpeed;
    CollapseBtn: TStyleSpeed;
    ConvertBtn: TStyleSpeed;
    PrefList: TCheckList;
    Outline: TScrollTree;
    Modified: TCheckBox;
    BitBtn1: TBitBtn;
    procedure OutlineDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure OutlineDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure OutlineEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure OutlineMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure AddItemClick(Sender: TObject);
    procedure InsertItemClick(Sender: TObject);
    procedure EditItemClick(Sender: TObject);
    procedure DeleteItemClick(Sender: TObject);
    procedure ExpandItemClick(Sender: TObject);
    procedure CollapseItemClick(Sender: TObject);
    procedure ConvertClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OutlineDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure CancelBtnClick(Sender: TObject);
    procedure PrefListClick(Sender: TObject);
  private
    { Private declarations }
    DragItem : Longint;
    {procedure UpdateMenuTree;}
    procedure ConvertProgItem(Sender : TObject;
     const group, caption: TFilename; const data: string);
    function AddOutlineNode(index : Longint;
      const cap, data : string; Op: TAttachMode): Longint;
    procedure DisposeNode(node : TOutlineNode);
  public
    { Public declarations }
    procedure Configure;
    procedure SettingsChanged(Changes : TSettingChanges); override;
  end;

var
  StartPropDlg: TStartPropDlg;
  NewStartItems : TStringList;

implementation

{$R *.DFM}

uses Start, ProgConv, MenuEdit, MultiGrd, IconWin, Directry,
  Sys, MiscUtil, Dialogs, Strings;


procedure TStartPropDlg.OutlineDragDrop(Sender, Source: TObject; X,
  Y: Integer);
const
  Attach: array[Boolean] of TAttachMode = (oaInsert, oaAddChild);
var
  dest : Longint;
  i : Integer;
begin
  Outline.DropFocus := -1;
  dest := Outline.GetItemAt(X, Y);

  { Handle drops from icon windows or from outline itself }

  if Source is TMultiGrid then
    with (TMultiGrid(Source).Owner as TIconWindow).CompileSelection(False) do
      for i := 0 to Count-1 do
        with  TDirItem(Items[i]) do
          AddOutlineNode(dest, GetTitle, GetStartInfo, oaAddChild)

  else with Outline, Items[DragItem] do begin
    { Strange things seem to happen without BeginUpdate/EndUpdate! }
    BeginUpdate;
    if GetAsyncKeyState(VK_CONTROL) < 0 then
      AddOutlineNode(dest, Text,
        PString(Data)^, Attach[GetAsyncKeyState(VK_MENU) < 0])
    else begin
      Collapse;
      MoveTo(dest, Attach[GetAsyncKeyState(VK_MENU) < 0]);
    end;
    EndUpdate;
  end;
  Modified.Checked := True;
end;


procedure TStartPropDlg.OutlineDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := ((Sender = Source) or
             (Source is TMultiGrid) and (Source <> SysWindow.Grid))
             and (Outline.GetItemAt(X, Y) > 0);

  with Outline do
    if not Accept or (State = dsDragLeave) then DropFocus := -1
    else DropFocus := GetCellAt(X, Y);
end;


procedure TStartPropDlg.OutlineEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
  ClipCursor(nil);
end;


procedure TStartPropDlg.OutlineMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  r : TRect;
  i : Longint;
  p : TPoint;
begin
  if ssDouble in Shift then
    Exit

  else if Button = mbRight then with Outline do begin
    { Select the item under the cursor and popup menu }
    if GetCaptureControl <> nil then Exit;
    i := GetItem(X, Y);
    if i > 0 then SelectedItem := i;
    GetCursorPos(p);
    OutlineMenu.Popup(p.X, p.Y);
  end

  else with Outline do begin
    { Pre-determine whether the item should be moved depending on
      the Alt key, restrict the cursor to the outline and start
      drag }
    DragItem := GetItem(X, Y);
    if DragItem > 0 then begin
      with ClientRect do begin
        r.TopLeft := ClientToScreen(TopLeft);
        r.BottomRight := ClientToScreen(Bottomright);
        ClipCursor(@r);
      end;
      BeginDrag(False);
    end;
  end
end;


procedure TStartPropDlg.AddItemClick(Sender: TObject);
begin
  with MenuEditDlg do
  if EditItem('Add menu item', '', ';;;;') = mrOK then
    AddOutlineNode(Outline.SelectedItem, CaptionEdit.Text, DataString, oaInsert);
end;


procedure TStartPropDlg.InsertItemClick(Sender: TObject);
begin
  with Outline, MenuEditDlg do
    if SelectedItem = 0 then AddItem.Click else
      if EditItem('Insert menu item', '', ';;;;') = mrOK then
        AddOutlineNode(SelectedItem, CaptionEdit.Text, DataString, oaAddChild);
end;


procedure TStartPropDlg.EditItemClick(Sender: TObject);
var
  node : TOutlineNode;
begin
  with Outline, MenuEditDlg do
    if (SelectedItem > 0) then begin
      node := Items[SelectedItem];
      if EditItem('Menu item properties', node.Text,
      PString(node.Data)^) = mrOK then begin
        PString(node.Data)^ := DataString;
        node.Text := CaptionEdit.Text;
        Modified.Checked := True;
      end;
    end;
end;


procedure TStartPropDlg.DisposeNode(node : TOutlineNode);
var i : Longint;
begin
  { Recursive procedure to free dynamic strings }

  Dispose(PString(node.Data));
  i := node.GetFirstChild;
  while i <> -1 do begin
    DisposeNode(Outline.Items[i]);
    i := node.GetNextChild(i);
  end;
end;


procedure TStartPropDlg.DeleteItemClick(Sender: TObject);
var
  node: TOutlineNode;
  i : Longint;
begin
  with Outline do
    if SelectedItem > 0 then begin
      node := Items[SelectedItem];
      if node.HasItems and (MsgDialog('Delete this menu?',
        mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then Exit;

      DisposeNode(node);

      { If a node is deleted when its previous sibling is expanded,
        the TOutline code often crashes }
      node.Collapse;
      i := node.Parent.GetPrevChild(SelectedItem);
      if i > 0 then Items[i].Collapse;
      Delete(SelectedItem);
      Modified.Checked := True;
    end;
end;


procedure TStartPropDlg.ExpandItemClick(Sender: TObject);
begin
  Outline.FullExpand;
end;


procedure TStartPropDlg.CollapseItemClick(Sender: TObject);
begin
  Outline.FullCollapse;
end;


procedure TStartPropDlg.ConvertClick(Sender: TObject);
begin
  with TConvertDlg.Create(Application) do
  try
    OnConvertProg := ConvertProgItem;
    ShowModal;
  finally
    Free;
  end;
end;


procedure TStartPropDlg.ConvertProgItem(Sender : TObject;
  const group, caption: TFilename; const data: string);
var
  i, parentnode: Longint;
begin
  with Outline do begin
    { Find existing submenu containing the group }
    parentnode := GetTextItem(group);

    if parentnode = 0 then begin
      { Create a new group node and add the item to it }
      AddOutlineNode(0, group, ';;;;', oaInsert);
      AddOutlineNode(GetTextItem(group), caption, data, oaAddChild);
    end

    else begin
      { An existing group has been found.  Now look for a matching
        menu item, and update it if found.  Otherwise, just add
        another item }

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



procedure TStartPropDlg.FormCreate(Sender: TObject);
var i: Integer;
begin
  { A menu editor dialog is created here to speed up editing }
  Notebook.PageIndex := 0;
  MenuEditDlg := TMenuEditDlg.Create(Application);
  StartMenu.AssignToOutline(Outline);

  with NewStartItems do begin
    for i := 0 to Count-1 do AddOutlineNode(0,
      GetStrKey(Strings[i]), GetStrValue(Strings[i]), oaAdd);
    Clear;
  end;

  Outline.SetUpdateState(False);
  Outline.Canvas.Font.Assign(Font);
  PrefList.SetData([StartMenu3D, BoldSelect,
    ShellStartup, StartMouseUp]);
  Configure;
  {UpdateMenuTree;}
end;


function TStartPropDlg.AddOutlineNode(index : Longint;
  const cap, data : string; Op: TAttachMode): Longint;
var
  p: PString;
begin
  { Add a new outline node with a dynamic string as the Data }
  Modified.Checked := True;
  New(p);
  p^ := data;
  case Op of
    oaAdd      : Result := Outline.AddObject(index, cap, p);
    oaAddChild : Result := Outline.AddChildObject(index, cap, p);
    oaInsert   : Result := Outline.InsertObject(index, cap, p);
  end;
end;


procedure TStartPropDlg.OKBtnClick(Sender: TObject);
begin
  PrefList.GetData([@StartMenu3D, @BoldSelect,
    @ShellStartup, @StartMouseUp]);

  SaveStartProp;
  StartMenu.Configure;
  PostMessage(TaskbarWindow, WM_CALMIRA, CM_TASKCONFIG, 0);

  if Modified.Checked then StartMenu.RebuildFromOutline(Outline);
  Close;
  AnnounceSettingsChanged([scStartMenu]);
end;


procedure TStartPropDlg.FormDestroy(Sender: TObject);
var
  i: Longint;
begin
  with Outline do
    for i := 1 to ItemCount do Dispose(PString(Items[i].Data));

  MenuEditDlg.Free;
  MenuEditDlg := nil;
  StartPropDlg := nil;
end;


procedure TStartPropDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;


procedure TStartPropDlg.OutlineDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  item: TOutlineNode;
  x, y : Integer;
begin
  { Fast outline drawing with no BrushCopy.  Unlike the tree view,
    (see TREE.PAS) there are no disadvantages here because all the
    pictures are square or rectangular, so no transparency is
    needed }

  with Outline do begin
    index := GetItem(0, Rect.Top);
    item := Items[index];
    x := Rect.Left + item.Level * 20 + 4;
    y := (Rect.Top + Rect.Bottom) div 2;

    with Canvas do begin
      if odSelected in State then Brush.Color := clHighlight
      else Brush.Color := Color;
      FillRect(Rect);

      if item.HasItems then
        if item.Expanded then Draw(x+1, Rect.Top+2, PictureOpen)
        else Draw(x+1, Rect.Top+2, PictureClosed)
      else
        Draw(x+1, Rect.Top+4, PictureLeaf);

      TextOut(x + 19, Rect.Top+1, item.Text);

      { Draw horizontal line connecting node to branch }

      MoveTo(x - 4, y);
      Dec(x, 16);
      LineTo(x, y);

      { Draw vertical line, it's length depending on whether
        this node has additional siblings }

      if Item.Parent.GetLastChild = Item.Index then
        LineTo(x, Rect.Top-1)
      else begin
        MoveTo(x, Rect.Top);
        LineTo(x, Rect.Bottom);
      end;

      { Loop back to the root through all parent nodes, drawing a
        vertical line if the parent has child nodes to be drawn
        below this node }

      item := item.Parent;

      while (Item <> nil) and (Item.Parent <> nil) do begin
        Dec(x, 20);
        if Item.Parent.GetLastChild > Item.Index then begin
          MoveTo(x, Rect.Top);
          LineTo(x, Rect.Bottom);
        end;
        item := item.Parent;
      end;
    end;
  end;
end;


procedure TStartPropDlg.CancelBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TStartPropDlg.SettingsChanged(Changes : TSettingChanges);
begin
  if [scDesktop, scDisplay, scSystem] * Changes <> [] then Configure;
end;


procedure TStartPropDlg.Configure;
begin
  Outline.ThumbTracking := TrackThumb;
  Outline.ItemHeight := LineHeight;
end;


procedure TStartPropDlg.PrefListClick(Sender: TObject);
begin
  if PrefList.ItemIndex = 0 then Modified.Checked := True;
end;


procedure DoneStartProp; far;
begin
  NewStartItems.Free;
end;

initialization
  NewStartItems := TStringList.Create;
  AddExitProc(DoneStartProp);
end.
