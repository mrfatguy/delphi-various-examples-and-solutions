unit IconList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Commctrl;

type
  TForm1 = class(TForm)
    ListView1: TListView;
    procedure ListView1ColumnClick(Sender: TObject; Column: TListColumn);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    ArrowDown, NoArrow, ArrowUp: HBitmap;
    FBitmap: TBitmap;
    FAtoZ: Boolean;
    OldCol: Byte;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}
{$R Arrows.res}
var  AtoZOrder: Boolean;

procedure TForm1.ListView1ColumnClick(Sender: TObject;
  Column: TListColumn);
function CustomSortProc(Item1, Item2: TListItem; ParamSort: Integer): Integer; stdcall;
begin
  case ParamSort of  //Column
    0://Sort Main column.
    if AtoZOrder then
      Result:=lstrcmp(PChar(TListItem(Item1).Caption), PChar(TListItem(Item2).Caption))
    else
      Result:=-lstrcmp(PChar(TListItem(Item1).Caption), PChar(TListItem(Item2).Caption));
  else //Sort one of the subcolumns (subitems).
    if AtoZOrder then
      Result:=lstrcmp(PChar(TListItem(Item1).SubItems[ParamSort-1]), PChar(TListItem(Item2).SubItems[ParamSort-1]))
    else
      Result:=-lstrcmp(PChar(TListItem(Item1).SubItems[ParamSort-1]), PChar(TListItem(Item2).SubItems[ParamSort-1]));
  end;
end;
var hditem:THdItem;
    I: Byte;
begin
  if OldCol=Column.Index then
    FAtoZ:=not FAtoZ
  else
    OldCol:=Column.Index;
  AtoZOrder:=FAtoZ;
  ListView1.CustomSort(@CustomSortProc, Column.Index);
  for I:=0 to ListView1.Columns.Count-1 do
  begin
    FBitmap.Releasehandle;
    if I=Column.Index then
    begin
      if AtoZOrder then
        FBitmap.Handle:=ArrowDown
      else
        FBitmap.Handle:=ArrowUp
    end
    else
       FBitmap.Handle:=NoArrow;
    hditem.Mask := HDI_FORMAT;
    Header_GetItem(GetDlgItem(ListView1.Handle,0),I,hditem);
    hditem.Mask:=HDI_BITMAP or HDI_FORMAT;
    hditem.fmt:=hditem.fmt or HDF_BITMAP;
    hditem.hbm:=FBitmap.Handle;
    Header_SetItem(GetDlgItem(ListView1.Handle,0),I,hditem);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ArrowUp:=LoadBitmap(hInstance, 'ARROWUP');
  ArrowDown:=LoadBitmap(hInstance, 'ARROWDOWN');
  NoArrow:=LoadBitmap(hInstance, 'NOARROW');
  FBitmap:=TBitmap.Create;
  ListView1ColumnClick(Sender,ListView1.Columns[0]);

end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FBitmap.ReleaseHandle;
  FBitmap.Free;
  DeleteObject(ArrowUp);
  DeleteObject(ArrowDown);
  DeleteObject(NoArrow);
end;

end.
