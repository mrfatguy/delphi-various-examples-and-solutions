{*********************************************************}
{                                                         }
{    Calmira Visual Component Library 1.0                 }
{    by Li-Hsin Huang,                                    }
{    released into the public domain January 1997         }
{                                                         }
{*********************************************************}

unit FormDrag;

{ TFormDrag component }

{ TFormDrag lets the user move and resize a form with a non-resizable
  border, typically bsSingle.  It can simulate a "solid" drag like
  Windows95, or for slower machines, it can use hollow boxes instead.
  Just drop the component onto your form, and it is ready to use.

  Windows 3.x is generally not up to dynamically resizing the controls
  during dragging, so TFormDrag hides all the controls and shows them
  when the dragging has stopped.

  Note that you should not re-assign the following event handlers
  of TForm at run-time: OnMouseMove, OnMouseDown, OnMouseUp,
  OnPaint and OnResize.

  TFormDrag prevents some of these events from occuring when it
  takes over the dragging, so that you need not be concerned with
  any side effects -- just pretend the component is not there and
  program normally.

  DragWidth
    The size of the square in the bottom right corner reserved for
    resizing the form.

  Hollow
    Determines if the form is resized during dragging, or a hollow
    rectangle used to represent the form's dimensions.

  MinWidth, MinHeight, MaxWidth, MaxHeight
    Constrains the size of the form

  AllowMove, AllowSize
    Enables the two operations of this component

  DragState (run-time and read only)
    Indicates what kind of dragging is taking place.  Check this to
    avoid executing code that could disrupt the operation.
}

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs;

type
  TFormDragState = (fdNone, fdSolidMove, fdSolidSize, fdHollowMove, fdHollowSize);

  TFormDrag = class(TComponent)
  private
    { Private declarations }
    FMouseMove : TMouseMoveEvent;
    FMouseDown : TMouseEvent;
    FMouseUp   : TMouseEvent;
    FPaint     : TNotifyEvent;
    FResize    : TNotifyEvent;
    FDragState : TFormDragState;
    FDragWidth : Integer;
    FMinWidth  : Integer;
    FMinHeight : Integer;
    FMaxWidth  : Integer;
    FMaxHeight : Integer;
    FAllowMove : Boolean;
    FAllowSize : Boolean;
    FHollow    : Boolean;
    xofs, yofs : Integer;
    FormRect   : TRect;
    procedure HandleMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure HandleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure HandleMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  protected
    { Protected declarations }
    procedure Loaded; override;
    procedure StartHollowDrag;
    procedure InverseRect;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    property DragState : TFormDragState read FDragState;
  published
    { Published declarations }
    property DragWidth : Integer read FDragWidth write FDragWidth default 16;
    property Hollow    : Boolean read FHollow write FHollow default False;
    property MinWidth  : Integer read FMinWidth write FMinWidth default 0;
    property MinHeight : Integer read FMinHeight write FMinHeight default 0;
    property MaxWidth  : Integer read FMaxWidth write FMaxWidth default High(Integer);
    property MaxHeight : Integer read FMaxHeight write FMaxHeight default High(Integer);
    property AllowMove : Boolean read FAllowMove write FAllowMove default True;
    property AllowSize : Boolean read FAllowSize write FAllowSize default True;
  end;

procedure Register;


implementation

uses MiscUtil;

var
  { GDI objects used for drawing the resize boxes }
  InversePen : HPen;

constructor TFormDrag.Create(AOwner: TComponent);
begin
  if not (AOwner is TForm) then
    raise EInvalidOperation.Create('TFormDrag can only be placed on a form');

  inherited Create(AOwner);
  FDragState := fdNone;
  FDragWidth := 16;
  FHollow    := False;
  FMaxWidth  := High(Integer);
  FMaxHeight := High(Integer);
  FAllowMove := True;
  FAllowSize := True;
end;


procedure TFormDrag.Loaded;
begin
  { The form's handlers must not be touched during design time,
    otherwise incorrect events will be saved }

  inherited Loaded;
  if not (csDesigning in ComponentState) then
    with Owner as TForm do begin
      { Save the form's original handlers... }
      FMouseMove := OnMouseMove;
      FMouseDown := OnMouseDown;
      FMouseUp   := OnMouseUp;
      FPaint     := OnPaint;
      FResize    := OnResize;

      { ...and make the form call our handlers instead }
      OnMouseMove := HandleMouseMove;
      OnMouseDown := HandleMouseDown;
      OnMouseUp   := HandleMouseUp;
    end;
end;


procedure TFormDrag.StartHollowDrag;
begin
  { Create a suitable pen and set up the screen device context
    ready for drawing }
  InversePen := CreatePen(PS_SOLID, 1, ColorToRGB(clBlack));
  { Obtain and draw the initial rectangle }
  FormRect := TForm(Owner).BoundsRect;
  InverseRect;
end;


procedure TFormDrag.InverseRect;
var
  ScreenDC: HDC;
  OldPen     : HPen;
  OldRop2    : Integer;
begin
  { Draws an inverse rectangle on the screen device context, the
    coordinates specified by FormRect.  The rectangle is two
    pixels thick but it is faster to draw two thin ones than to
    use a thick pen }

  ScreenDC := GetDC(0);
  OldRop2 := SetRop2(ScreenDC, R2_NOT);
  OldPen := SelectObject(ScreenDC, InversePen);

  with FormRect do begin
    MoveTo(ScreenDC, Left, Top);
    LineTo(ScreenDC, Right-1, Top);
    LineTo(ScreenDC, Right-1, Bottom-1);
    LineTo(ScreenDC, Left, Bottom-1);
    LineTo(ScreenDC, Left, Top);

    MoveTo(ScreenDC, Left-1, Top-1);
    LineTo(ScreenDC, Right, Top-1);
    LineTo(ScreenDC, Right, Bottom);
    LineTo(ScreenDC, Left-1, Bottom);
    LineTo(ScreenDC, Left-1, Top-1);
  end;

  SetRop2(ScreenDC, OldRop2);
  SelectObject(ScreenDC, OldPen);
  ReleaseDC(0,ScreenDC);
end;



procedure TFormDrag.HandleMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  { During a solid drag, the form has its dimensions set each time the mouse
    is moved.  During a hollow drag, the previous rectangle must be erased
    (by drawing over it) before drawing the new one }

  with Owner as TForm do
    case DragState of
      fdNone :
        if AllowSize then begin
          if (X > ClientWidth-DragWidth) and (Y > ClientHeight-DragWidth) then begin
            Cursor := crSizeNWSE;
            Exit;
          end
          else begin
            Cursor := crDefault;
          end;
          if Assigned(FMouseMove) then FMouseMove(Sender, Shift, X, Y);
        end;

      fdSolidMove :
        SetBounds(Left+X-xofs, Top+Y-yofs, Width, Height);

      fdSolidSize :
        SetBounds(Left, Top,
          Range(X+xofs, MinWidth, MaxWidth),
          Range(Y+yofs, MinHeight, MaxHeight));

      fdHollowMove:
        begin
          InverseRect;
          FormRect := Bounds(Left+X-xofs, Top+Y-yofs, Width, Height);
          InverseRect;
        end;

      fdHollowSize:
        begin
          InverseRect;
          FormRect := Bounds(Left, Top, Range(X+xofs, MinWidth, MaxWidth),
            Range(Y+yofs, MinHeight, MaxHeight));
          InverseRect;
        end;
    end {case};
end;


procedure TFormDrag.HandleMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var i: Integer;
begin
  with Owner as TForm do
  if (Button = mbLeft) and not (ssDouble in Shift)
   and (WindowState <> WsMaximized) then begin
    if (X > ClientWidth-DragWidth) and (Y > ClientHeight-DragWidth) and AllowSize then begin
      { Start a resize operation }
      xofs := Width - X;
      yofs := Height - Y;

      if Hollow then begin
        FDragState := fdHollowSize;
        StartHollowDrag;
      end
      else begin
        { Suppress OnPaint and OnResize }
        FDragState := fdSolidSize;
        OnPaint := nil;
        OnResize := nil;
        for i := 0 to ControlCount-1 do Controls[i].Hide;
        Canvas.Brush.Color := Color;
        Canvas.FillRect(Rect(0, 0, ClientWidth, ClientHeight));
      end;
    end
    else if AllowMove then begin
      { Start a move operation }
      xofs := X;
      yofs := Y;
      if Hollow then begin
        FDragState := fdHollowMove;
        StartHollowDrag;
      end
      else FDragState := fdSolidMove;
    end
    else if Assigned(FMouseDown) then
      { trigger form's original OnMouseDown event }
      FMouseDown(Sender, Button, Shift, X, Y);
  end
  else if Assigned(FMouseDown) then
     FMouseDown(Sender, Button, Shift, X, Y);
end;


procedure TFormDrag.HandleMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var i: Integer;
begin
  if (Button = mbLeft) and (FDragState <> fdNone) then
  with Owner as TForm do begin
    { End the drag operation }
    if FDragState = fdSolidSize then begin
      { Tell the form that it has just been resized, and force it
        to paint if required.  }
      FDragState := fdNone;
      if Assigned(FResize) then FResize(Owner);
      if Assigned(FPaint) then FPaint(Owner);
      OnResize := FResize;
      OnPaint := FPaint;
      for i := 0 to ControlCount-1 do Controls[i].Show;
    end
    else if FDragState in [fdHollowSize, fdHollowMove] then begin
      { Set the new coordinates of the form and clean up the
        graphics stuff }
      ReleaseCapture;
      InverseRect;
      BoundsRect := FormRect;
      DeleteObject(InversePen);
    end;
    FDragState := fdNone;
  end
  else
    if Assigned(FMouseUp) then FMouseUp(Sender, Button, Shift, X, Y);
end;

procedure Register;
begin
  RegisterComponents('Samples', [TFormDrag]);
end;


end.
