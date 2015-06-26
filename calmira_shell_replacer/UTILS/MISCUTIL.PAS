{*********************************************************}
{                                                         }
{    Calmira System Library 1.0                           }
{    by Li-Hsin Huang,                                    }
{    released into the public domain January 1997         }
{                                                         }
{*********************************************************}

unit MiscUtil;

{ Some useful Delphi and Windows routines }

interface

uses Classes, SysUtils, Forms, WinTypes, IniFiles, Menus,
  StdCtrls, Dialogs, ExtCtrls, Graphics;

const
  MsgDialogSounds : Boolean = False;

var
  ApplicationPath : TFilename;
  WinPath : TFilename;

function Min(a, b: Integer): Integer;
function Max(a, b: Integer): Integer;
{ Returns the smaller and larger of two values respectively }

function Range(n, lower, upper: Integer): Integer;
{ Constrains n to a lower and upper limit }

function Sign(x: Integer) : Integer;
{ Returns 1 if x > 0, -1 if x < 0 and 0 if x = 0 }

procedure Border3d(Canvas : TCanvas; Width, Height: Integer);
{ Draws a raised 3D border on a canvas, typically used in an
  OnPaint method of a TForm }

procedure ErrorMsg(const msg: string);
{ Displays a message dialog box indicating an error }

procedure PlaySound(const filename: TFilename);
{ Plays the specified WAV file as a sound effect.  If the filename
  is <None>, nothing is played }

function Intersects(const R, S: TRect): Boolean;
{ Returns True if the two rectangles intersect }

function NormalizeRect(p, q: TPoint): TRect;
{ Returns a rectangle defined by any two points.  When dragging a
  selection box with a mouse, the fixed corner and the moving
  corner may not always be top left and bottom right respectively.
  This function creates a valid TRect out of them }

function TimeStampToDate(FileDate: Longint): TDateTime;
{ Converts a DOS timestamp to TDateTime.  If the timestamp is invalid
  (some programs use invalid stamps as markers), the current date
  is returned instead of raising EConvertError }

function GetRegValue(key : string): string;
{ Returns a value from the Windows registration database, with the
  specified key from HKEY_CLASSES_ROOT }

function GetRadioIndex(const R: array of TRadioButton): Integer;
procedure SetRadioIndex(const R: array of TRadioBUtton; index: Integer);
function GetMenuCheck(const M: array of TMenuItem): Integer;
procedure SetMenuCheck(const M: array of TMenuItem; index: Integer);
{ These routines are useful for setting and querying the state of
  several controls.  Use them to simulate arrays and as an alternative
  to TRadioGroup. }

procedure RefreshCursor;
{ Updates the cursor image when you have changed the Cursor or DragCursor
  property of a control }

function AddHistory(Combo : TComboBox): Boolean;
{ Adds a combo box's Text string to its listbox, but only if the
  string is not empty and not already present in the list.  The item is
  inserted at the top of the list, and if there are more than 24 items,
  the bottom one is removed.  Returns true if the list is modified }

function MsgDialog(const Msg: string; AType: TMsgDlgType;
  AButtons: TMsgDlgButtons; HelpCtx: Longint): Word;
{ Calls the MessageDialog function, but also plays a suitable sound
  effect from the Control Panel settings.  The MsgDialogSounds variable
  enables the sounds }

function ShowModalDialog(FormClass : TFormClass): TModalResult;
{ A very simple way of displaying a dynamic modal form -- just pass the
  form's class name e.g. TForm1, and an instance will be created,
  shown as a modal dialog and then destroyed. }

function InitBitmap(ABitmap: TBitmap;
  AWidth, AHeight : Integer; Color : TColor) : TBitmap;
{ Initialises the bitmap's dimensions and fills it with the chosen colour }

procedure ShrinkIcon(H : HIcon; Glyph : TBitmap);
{ Shrinks a 32 x 32 icon down to a 16 x 16 bitmap }

implementation

uses WinProcs, MMSystem, ShellAPI, Strings;


function Min(a, b: Integer): Integer; assembler;
asm
  MOV	AX, a
  CMP	AX, b
  JLE	@@1
  MOV	AX, b
@@1:
end;


function Max(a, b: Integer): Integer; assembler;
asm
  MOV	AX, a
  CMP	AX, b
  JGE	@@1
  MOV	AX, b
@@1:
end;

function Range(n, lower, upper: Integer): Integer; assembler;
asm
   MOV  AX, n
   CMP  AX, lower
   JGE  @@1
   MOV  AX, lower
   JMP  @finish
@@1:
   CMP  AX, upper
   JLE  @finish
   MOV  AX, upper
   JMP  @finish
@@2:
   MOV  AX, lower
@finish:
end;


function Sign(x: Integer) : Integer; assembler;
asm
   MOV  AX, X
   CMP  AX, 0
   JL   @@1
   JG   @@2
   XOR  AX, AX
   JMP  @finish
@@1:
   MOV  AX, -1
   JMP  @finish
@@2:
   MOV  AX, 1
@finish:
end;



procedure Border3d(Canvas : TCanvas; Width, Height: Integer);
begin
  with Canvas do begin
    Pen.Color := clBtnHighLight;
    MoveTo(0, Height);
    LineTo(0, 0);
    LineTo(Width, 0);
    Pen.Color := clBtnShadow;
    LineTo(Width, Height);
    LineTo(0, Height);
  end;
end;


procedure ErrorMsg(const msg: string);
begin
  MsgDialog(msg, mtError, [mbOK], 0);
end;


procedure PlaySound(const filename: TFilename);
var s: TFilename;
begin
  if CompareText(filename, '<None>') <> 0 then
    SndPlaySound(StrPCopy(@s, filename), SND_ASYNC or SND_NODEFAULT);
end;



function Intersects(const R, S: TRect): Boolean;
var dummy: TRect;
begin
  Result := IntersectRect(dummy, R, S) > 0;
end;

function NormalizeRect(p, q: TPoint): TRect; assembler;
asm
  MOV  AX, p.x
  MOV  BX, p.y
  MOV  CX, q.x
  MOV  DX, q.y
  CMP  AX, CX
  JLE  @@1
  XCHG AX, CX
@@1:
  CMP  BX, DX
  JLE  @@2
  XCHG BX, DX
@@2:
  LES  DI, @Result
  MOV  TRect(ES:[DI]).Left, AX
  MOV  TRect(ES:[DI]).Top, BX
  MOV  TRect(ES:[DI]).Right, CX
  MOV  TRect(ES:[DI]).Bottom, DX
end;



function TimeStampToDate(FileDate: Longint): TDateTime;
begin
  try Result := FileDateToDateTime(FileDate)
  except on EConvertError do Result := Date;
  end;
end;

function GetRegValue(key : string): string;
var cb : Longint;
begin
  cb := 255;
  if RegQueryValue(HKEY_CLASSES_ROOT, StringAsPChar(key),
     @Result[1], cb) = ERROR_SUCCESS then
    Result[0] := Chr(cb-1)
  else
    Result := '';
end;


function GetRadioIndex(const R: array of TRadioButton): Integer;
var i: Integer;
begin
  for i := 0 to High(R) do
    if R[i].Checked then begin
      Result := i;
      exit;
    end;
  Result := 0;
end;


procedure SetRadioIndex(const R: array of TRadioBUtton; index: Integer);
var i: Integer;
begin
  for i := 0 to High(R) do R[i].Checked := i = index;
end;


function GetMenuCheck(const M: array of TMenuItem): Integer;
var i: Integer;
begin
  for i := 0 to High(M) do
    if M[i].Checked then begin
      Result := i;
      exit;
    end;
  Result := 0;
end;


procedure SetMenuCheck(const M: array of TMenuItem; index: Integer);
var i: Integer;
begin
  for i := 0 to High(M) do M[i].Checked := i = index;
end;


procedure RefreshCursor;
var p: TPoint;
begin
  GetCursorPos(p);
  SetCursorPos(p.x, p.y);
end;


function AddHistory(Combo : TComboBox): Boolean;
begin
  Result := False;
  with Combo, Combo.Items do
    if (Text <> '') and (IndexOf(Text) = -1) then begin
      Result := True;
      Insert(0, Text);
      if Count > 24 then Delete(Count-1);
    end;
end;

function MsgDialog(const Msg: string; AType: TMsgDlgType;
  AButtons: TMsgDlgButtons; HelpCtx: Longint): Word;
const
  Sound : array[TMsgDlgType] of Word =
    (MB_ICONEXCLAMATION, MB_ICONHAND, MB_OK, MB_ICONQUESTION, 0);
begin
  if MsgDialogSounds and (AType < mtCustom) then MessageBeep(Sound[AType]);
  Result := MessageDlg(Msg, AType, AButtons, HelpCtx);
end;


function ShowModalDialog(FormClass : TFormClass): TModalResult;
begin
  with FormClass.Create(Application) do
  try
    Result := ShowModal;
  finally
    Free;
  end;
end;


function InitBitmap(ABitmap: TBitmap;
  AWidth, AHeight : Integer; Color : TColor) : TBitmap;
begin
  { initializes a bitmap with width, height and background colour }

  with ABitmap do begin
    Width := AWidth;
    Height := AHeight;
    Canvas.Brush.Color := Color;
    Canvas.FillRect(Rect(0, 0, Width, Height));
  end;
  Result := ABitmap;
end;


procedure ShrinkIcon(H : HIcon; Glyph : TBitmap);
var
  bmp : TBitmap;
  i, j : Integer;
  src, dest : HDC;
begin
  bmp := InitBitmap(TBitmap.Create, 32, 32, clSilver);
  DrawIcon(bmp.Canvas.Handle, 0, 0, H);

  try
    with Glyph do begin
      Width := 16;
      Height := 16;

      Canvas.StretchDraw(Rect(0, 0, 16, 16), bmp);
      src := bmp.Canvas.Handle;
      dest := Canvas.Handle;

      for i := 0 to 15 do
        for j := 0 to 15 do
          if GetPixel(dest, i, j) = clSilver then
           SetPixel(dest, i, j, GetPixel(src, i shl 1, j shl 1));

      Canvas.Pixels[0, 15] := clBtnFace;
    end;
  finally
    bmp.Free;
  end;
end;




initialization
  ApplicationPath := ExtractFilePath(ParamStr(0));
  WinPath[0] := Chr(GetWindowsDirectory(@WinPath[1], 79));
  WinPath := MakePath(WinPath);
end.
