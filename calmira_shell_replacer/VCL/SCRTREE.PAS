{*********************************************************}
{                                                         }
{    Calmira Visual Component Library 1.0                 }
{    by Li-Hsin Huang,                                    }
{    released into the public domain January 1997         }
{                                                         }
{*********************************************************}

unit Scrtree;

{ TScrollTree }

{ This is an enhanced TOutline control.

  Properties

  ThumbTracking - when True, causes the outline to scroll while the
    user is dragging the vertical scrollbar.  The TOutline object sets
    its inherited Options to [], leaving out TCustomGrid's goThumbTracking.
    And since it also redefines the Options property, the inherited Options
    cannot be accessed (well, I can't think of a way!)  For fast owner-draw
    outlines, thumb tracking is useful, so a simple scroll message override
    does the trick.

  DropFocus - used to display a focusrect during drag and drop.  Set to
    -1 to erase the rectangle.

  Methods

  GetItemAt - same as GetItem except that it returns 0 if the specified
    point doesn't actually contain a graphic of an outline item.
    TOutline's GetItem simply returns the nearest node, which is not
    always what you want!

  GetCellAt - returns the index of the cell at the given point, regardless
    of whether there is an outline node present.  This is the "row"
    of TCustomGrid and has nothing really to do with TOutline.
}

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Grids, Outline;

type
  TScrollTree = class(TOutline)
  private
    { Private declarations }
    FThumbTracking : Boolean;
    FDropFocus : Integer;
    procedure WMVScroll(var Msg : TWMVScroll); message WM_VSCROLL;
    procedure SetDropFocus(value: Integer);
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    function GetItemAt(X, Y: Integer): Longint;
    function GetCellAt(X, Y: Integer): Longint;
    property DropFocus: Integer read FDropFocus write SetDropFocus;
  published
    { Published declarations }
    property ThumbTracking : Boolean
      read FThumbTRacking write FThumbTracking default False;
  end;

procedure Register;

implementation

constructor TScrollTree.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  FDropFocus := -1;
end;

procedure TScrollTree.WMVScroll(var Msg : TWMVScroll);
var
  NewTopRow : Longint;
begin
  { This calculation uses 16-bit maths.  Switch to 32-bit LongMulDiv()
    from the VCL if there are problems }

  if ThumbTracking and (Msg.ScrollCode = SB_THUMBTRACK) then begin
    NewTopRow := MulDiv( Integer(RowCount - VisibleRowCount), Msg.Pos, MaxInt);
    if NewTopRow >= 0 then TopRow := NewTopRow;
  end
  else
    inherited;
end;


function TScrollTree.GetItemAt(X, Y: Integer): Longint;
begin
  Result := 0;
  if PtInRect(CellRect(0, MouseCoord(X, Y).Y), Point(X, Y)) then
    Result := GetItem(X, Y);
end;


function TScrollTree.GetCellAt(X, Y: Integer): Longint;
var
  Coords : TGridCoord;
begin
  Coords := MouseCoord(X, Y);
  if PtInRect(CellRect(0, Coords.Y), Point(X, Y)) then
    Result := Coords.Y
  else
    Result := 0;
end;


procedure TScrollTree.SetDropFocus(value: Integer);
begin
  if FDropFocus <> Value then begin
    if FDropFocus <> -1 then
      Canvas.DrawFocusRect(CellRect(0, FDropFocus));
    if value <> -1 then
      Canvas.DrawFocusRect(CellRect(0, value));

    FDropFocus := value;
  end;
end;


procedure Register;
begin
  RegisterComponents('Samples', [TScrollTree]);
end;

end.
