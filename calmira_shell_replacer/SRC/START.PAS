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

unit Start;

{ Start Menu

  TStartMenu is a popup menu that is owner-drawn, so that it has a 3D
  effect and small icons.  The small icons are stored in one large bitmap
  to conserve memory.  They are ordered in tree-traversal order, so when
  the start menu next loads, all the small icons are in the right places.

  TStartMenuItem is the class of menu item that is used for the start
  menu.  It has a Data property which holds a string containing
  encoded information about the item.  This data can be expanded with
  the ExtractStartInfo function.
}

interface

uses Classes, SysUtils, Menus, Outline, Messages, WinTypes, Graphics, Forms;

type
  TStartFlags = (sfTop, sfBottom, sfSeparator);

  TStartMenuItem = class(TMenuItem)
  private
    FData : PString;
    FImgOffset : Word;
    function GetData: string;
    procedure SetData(const Value: string);
  public
    Flags : set of TStartFlags;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Click; override;
    procedure PutBitmap;
    property Data : string read GetData write SetData;
    property ImgOffset : Word read FImgOffset;
  end;

  TStartMacroEvent = procedure (Sender : TObject; const macro, params : string)
    of object;

  TStartMenu = class(TPopupMenu)
  private
    Canvas : TCanvas;
    Window: HWND;
    FItemHeight : Integer;
    FOnStartMacro : TStartMacroEvent;
    procedure WndProc(var Message: TMessage);
    procedure PaintMenu(DC: HDC; const Rect : TRect; state : Word;
      item : TStartMenuItem);
    function GetHeight : Integer;
    procedure SetOwnerDraw(menu : TMenuItem);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Configure;
    procedure Popup(X, Y: Integer; TrackLeft : Boolean);
    procedure Clear;
    function Find(const cap : string; submenu: Boolean): TMenuItem;
    procedure Load;
    procedure RunStartup;
    procedure RebuildFromOutline(Outline : TOutline);
    procedure AssignToOutline(Outline : TOutline);
    procedure HandleClick(Sender : TObject);
    property OnStartMacro : TStartMacroEvent read FOnStartMacro write FOnStartMacro;
    property Height : Integer read GetHeight;
  end;

  TStartImages = class(TBitmap)
  private
    FNext : Integer;
  public
    function Add(bmp : TBitmap): Integer;
    property Next: Integer read FNext write FNext;
  end;

  { TStartInfo is only slightly larger than a 255 char string, so
    placing it on the stack is OK, provided that there is no recursion  }

  TStartInfo = record
    Command: TFilename;
    Directory : TFilename;
    ShowMode : Integer;
    IconFile : TFilename;
    IconIndex : Integer;
  end;

function ExtractStartInfo(const s: string): TStartInfo;
function PackStartInfo(const command, directory, iconfile: TFilename;
  showmode, iconindex: Integer): string;

var StartMenu : TStartMenu;

implementation

uses Strings, IniFiles, Desk, Files, Directry, Dialogs, FileMan, Environs,
  Controls, MiscUtil, WinProcs, Sys, Referenc, Settings, Resource;

{ TStartMenu and its items need to share some graphics objects, so they
  are global rather than parameters }

var
  Images : TStartImages;
  TempIcon : TIcon;
  SmallBmp : TBitmap;
  UsingCache : Boolean;


function TStartImages.Add(bmp : TBitmap): Integer;
begin
  if FNext + 16 > Width then Width := Width + (64 * 16);
  Result := FNext;
  Canvas.Draw(FNext, 0, bmp);
  Inc(FNext, 16);
end;



{ TStartMenuItem }

constructor TStartMenuItem.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FData := NullStr;
end;

destructor TStartMenuItem.Destroy;
begin
  DisposeStr(FData);
  inherited Destroy;
end;

procedure TStartMenuItem.Click;
begin
  if not (sfSeparator in Flags) then inherited Click;
end;

function TStartMenuItem.GetData: string;
begin
  Result := FData^;
end;

procedure TStartMenuItem.SetData(const Value: string);
begin
  if FData^ <> Value then AssignStr(FData, Value);
end;


const
  CommandTable : array[0..4] of string[11] =
  ('$FOLDER', '$FIND', '$RUN', '$EXPLORE', '$SHUTDOWN');

procedure TStartMenuItem.PutBitmap;
var
  Command, IconFile: TFilename;
  src, dest : THandle;
  i, j, IconIndex: Integer;
  c: TColor;
begin
  Command := '';
  IconFile := '';
  IconIndex := 0;
  Unformat(Data, '%s;%S;%D;%s;%d', [@Command, 79, @IconFile, 79, @IconIndex]);

  i := Pos(' ', Command);
  if i > 0 then Command[0] := Chr(i-1);

  if (Count > 0) and (IconFile = '') then begin
    { default group bitmap }
    FImgOffset := 16;
    Exit;
  end;

  if (Command[1] = '$') and (IconFile = '') then begin
    { Find an auxiliary image }
    i := 0;
    while i <= High(CommandTable) do
      if CompareText(Command, CommandTable[i]) = 0 then System.Break else Inc(i);
    FImgOffset := 32 + i * 16;
    Exit;
  end;

  if UsingCache then begin
    { When this function is called, Images.Next points to where the
      small icon image should be placed }
    FImgOffset := Images.Next;
    Images.Next := Images.Next + 16;
    Exit;
  end;

  if CompareText(ExtractFileExt(IconFile), '.bmp') = 0 then
    SmallBmp.LoadFromFile(EnvironSubst(IconFile))
  else begin
    { Use a reference object to do the icon searching }
    FileRef.Target := Lowercase(command);
    FileRef.IconFile := IconFile;
    FileRef.IconIndex := IconIndex;
    FileRef.AssignIcon(TempIcon);
    ShrinkIcon(TempIcon.Handle, SmallBmp);
  end;

  { Add the new 16 x 16 image to the list and remember where you put it }
  FImgOffset := Images.Add(SmallBmp);
end;


{ TStartMenu }

constructor TStartMenu.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Window := AllocateHWnd(WndProc);
  Canvas := TCanvas.Create;
  Canvas.Brush.Color := clSilver;

  { A convenient place to create global objects! }
  Images := TStartImages.Create;
  TempIcon := TIcon.Create;
  SmallBmp := InitBitmap(TBitmap.Create, 16, 16, clSilver);

  Configure;
end;


destructor TStartMenu.Destroy;
begin
  Canvas.Free;
  Images.Free;
  TempIcon.Free;
  SmallBmp.Free;
  DeallocateHWnd(Window);
  inherited Destroy;
end;


procedure TStartMenu.Configure;
const
  FontStyles : array[Boolean] of TFontStyles = ([], [fsBold]);
  DDEService : array[Boolean] of string[7] = ('CALMIRA', 'PROGMAN');
begin
  FillMenu := BoldSelect or (ColorToRGB(clMenu) <> clSilver);
  ini.ReadFont('Start menu', Canvas.Font);

  { When Windows sends WM_MEASUREITEM messages, the start menu has
    no valid canvas to measure the text widths.  So it utilises
    the canvas from a bitmap by setting its font and, later,
    calling its TextWidth method }

  with Images.Canvas.Font do begin
    Assign(Canvas.Font);
    Style := FontStyles[BoldSelect];
  end;

  { When BoldSelect is on, menu items need to be wider to accomodate
    the font.  So when BoldSelect changes, the start menu must be
    "invalidated" so that Windows sends more WM_MEASUREITEM messages
    to find the new widths }

  if StartMenu3D then SetOwnerDraw(Items);
end;


procedure TStartMenu.Clear;
begin
  with Items do while Count > 0 do Items[0].Free;
end;


procedure TStartMenu.SetOwnerDraw(menu : TMenuItem);
var
  i : Integer;
  item : TMenuItem;
begin
  { Recurses through the menu tree, setting each item to owner-draw.
    With the 4th parameter of ModifyMenu, don't confuse the Handle
    with the Command }

  for i := 0 to menu.Count-1 do begin
    item := menu.Items[i];
    if item.Count > 0 then begin
      ModifyMenu(menu.Handle, i, MF_BYPOSITION or MF_OWNERDRAW or MF_POPUP,
        item.Handle, Pointer(item));
      SetOwnerDraw(item);
    end
    else
      ModifyMenu(menu.Handle, i, MF_BYPOSITION or MF_OWNERDRAW,
        item.Command, Pointer(item));
  end;
end;



procedure TStartMenu.Load;
var
  startini: TIniFile;

procedure AddToMenu(menu: TMenuItem; const section: string);
var
  names: TStringList;
  s    : string;
  item : TStartMenuItem;
  i    : Integer;
begin
  { Reads an entire INI file section, turns each entry into
    a menu item, and adds the items to the menu parameter }

  names := TStringList.Create;
  menu.Caption := ExtractFilename(section);

  try
    startini.ReadSection(section, names);

    for i := 0 to names.Count-1 do begin
      item := TStartMenuItem.Create(self);
      s := names[i];
      item.Data := startini.ReadString(section, s, '');

      if s[Length(s)] = '*' then begin
        Dec(s[0]);
        AddToMenu(item, Format('%s\%s', [section, s]));
      end
      else
        item.OnClick := HandleClick;

      item.Caption := s;
      menu.Add(item);
    end;
  finally
    names.Free;
  end;
end;


procedure AssignBitmaps(menu : TMenuItem);
var
  item: TStartMenuItem;
  i : Integer;
begin
  { AssignBitmaps recursively travels the tree, calling PutBitmap
    for each menu item.  It also calculates the menu item's flags
    used when painting.  The Tag stores the item's height. }

  for i := 0 to menu.Count-1 do begin
    item := TStartMenuItem(menu.Items[i]);
    with item do begin
      if i = 0 then Include(Flags, sfTop);
      if i = menu.Count-1 then Include(Flags, sfBottom);
      if (Caption > '') and (Caption[1] = '-') then begin
        Include(Flags, sfSeparator);
        Tag := FItemHeight div 2;
      end
      else Tag := FItemHeight;
      PutBitmap;
    end;
    if item.Count > 0 then AssignBitmaps(item);
  end;
end;



var
  Defaults : TBitmap;
  CacheFile : TFilename;
begin { TStartMenu.Load }
  Clear;
  startini := TIniFile.Create(StartFile);
  Desktop.SetCursor(crHourGlass);
  AddToMenu(Items, 'Start');
  CacheFile := ApplicationPath + 'bmpcache.bmp';
  try
    if StartMenu3D then begin
      FItemHeight := Abs(Canvas.Font.Height) + 10;
      if FileExists(CacheFile) then begin
        UsingCache := True;
        Images.LoadFromFile(CacheFile);
      end
      else begin
        { copy preset pictures into cache bitmap }
        UsingCache := False;
        InitBitmap(Images, 128 * 16, 16, clSilver);
        Defaults := TBitmap.Create;
        Defaults.Handle := LoadBitmap(HInstance, 'STARTBMPS');
        Images.Canvas.Draw(0, 0, Defaults);
        Defaults.Free;
      end;
      Images.Next := 128; { skip over preset pictures }
      AssignBitmaps(Items);
      SetOwnerDraw(Items);
      if not UsingCache then begin
        { chop off any empty space at the end before saving file }
        Images.Width := Images.Next;
        Images.SaveToFile(CacheFile);
      end;
    end
    else begin
      DeleteFile(CacheFile);
      FItemHeight := GetSystemMetrics(SM_CYMENU);
    end;
  finally
    startini.Free;
    Desktop.ReleaseCursor;
  end;
end;


function TStartMenu.GetHeight : Integer;
var
  i: Integer;
begin
  Result := 2;
  if StartMenu3D then
    for i := 0 to Items.Count-1 do Inc(Result, TStartMenuItem(Items[i]).Tag)
  else
    Inc(Result, Items.Count * FItemHeight);
end;


procedure TStartMenu.RebuildFromOutline(Outline : TOutline);
var
  startini : TIniFile;
  i : Integer;
  section : string[127];
begin
  DeleteFile(StartFile);
  DeleteFile(ApplicationPath + 'bmpcache.bmp');

  { This routine works on the outline from the Start Properties dialog.
    It assumes that each outline node has a dynamic string pointed to by
    the Data property }

  startini := TIniFile.Create(StartFile);
  try
    with Outline do
    for i := 1 to ItemCount do with Items[i] do begin
      if Level = 1 then section := 'Start'
      else section := 'Start\' + Parent.FullPath;

      if HasItems then
        startini.WriteString(section, Text + '*', PString(Data)^)
      else
        startini.WriteString(section, Text, PString(Data)^);
    end;
  finally
    startini.Free;
    Load;
  end;
end;


procedure TStartMenu.AssignToOutline(Outline : TOutline);

procedure Translate(menu: TMenuItem; dest : Longint);
var
  node : Longint;
  p: PString;
  i : Integer;
begin
  with menu do
    for i := 0 to Count-1 do begin
      New(p);
      p^ := (Items[i] as TStartMenuItem).Data;
      node := Outline.AddChildObject(dest, Items[i].Caption, TObject(p));
      if Items[i].Count > 0 then Translate(Items[i], node);
    end;
end;

begin
  Translate(Items, 0);
end;



procedure TStartMenu.HandleClick(Sender : TObject);
const
  ShowCmdsEx : array[TWindowState] of Word =
    (SW_SHOWNORMAL, SW_SHOWMINNOACTIVE, SW_SHOWMAXIMIZED);
var
  filename, params: TFilename;
begin
  with ExtractStartInfo((Sender as TStartMenuItem).Data) do begin

    filename := command;
    params := '';
    Unformat(command, '%s %s', [@filename, 79, @params, 79]);

    if (filename[1] = '$') and Assigned(FOnStartMacro) then
      FOnStartMacro(self, EnvironSubst(filename), EnvironSubst(params))
    else begin
      LastIconFile := iconfile;
      LastIconIndex := iconindex;
      LastInstance := DefaultExec(filename, params, directory,
        ShowCmdsEx[TWindowState(Abs(showmode) mod 3)]);
    end;
  end;
end;


procedure TStartMenu.RunStartup;
var
  i: Integer;
  item : TMenuItem;
begin
  item := Find('Startup', True);
  if item <> nil then with item do
    for i := 0 to Count-1 do Items[i].Click;
end;


procedure TStartMenu.Popup(X, Y: Integer; TrackLeft : Boolean);
const
  Flags: array[TPopupAlignment] of Word = (TPM_LEFTALIGN, TPM_RIGHTALIGN,
    TPM_CENTERALIGN);

  Tracks : array[Boolean] of Word =
    (TPM_RIGHTBUTTON, TPM_LEFTBUTTON);
begin
  TrackPopupMenu(Items.Handle, Flags[Alignment] or Tracks[TrackLeft], X, Y,
    0, Window, nil);
end;


procedure TStartMenu.PaintMenu(DC: HDC; const Rect : TRect;
  state : Word; item : TStartMenuItem);
const
  PenColors : array[Boolean] of TColor = (clSilver, clGray);
var
  y: Integer;
begin
  with Canvas, Rect do begin
    { grab the DC that Windows provides }
    Handle := DC;

    if FillMenu then FillRect(Rect);
    if sfSeparator in item.Flags then state := state and not ODS_SELECTED;

    if state and ODS_SELECTED > 0 then
      { upper shadow for selected item }
      Pen.Color := clGray
    else if sfTop in item.Flags then begin
      { top item -- draw over menu border with gray }
      Pen.Color := clGray;
      MoveTo(Left-1, Top-1);
      LineTo(Right+1, Top-1);
      Pen.Color := clWhite;
    end
    else
      Pen.Color := clSilver;

    { Draw top of menu item }
    MoveTo(Left, Top);
    LineTo(Right, Top);

    { Prepare font for output, and prepare pen for drawing the
      bottom of the menu item }

    if state and ODS_SELECTED > 0 then begin
      if BoldSelect then begin
        Font.Style := [fsBold];
        Font.Color := clBlack;
      end
      else Font.Color := clWhite;
      Pen.Color := clWhite;
    end
    else begin
      if BoldSelect then Font.Style := [];
      Font.Color := clBlack;
      Pen.Color := PenColors[sfBottom in item.Flags];
    end;

    { draw bottom of item }
    MoveTo(Left, Bottom-1);
    LineTo(Right, Bottom-1);

    if sfSeparator in item.Flags then begin
      Pen.Color := clGray;
      y := (Top + Bottom) div 2;
      MoveTo(Left, y);
      LineTo(Right, y);
      Pen.Color := clWhite;
      MoveTo(Left, y+1);
      LineTo(Right, y+1);
    end
    else
      TextOut(Left + 40, Top + 4, item.Caption);

    { draw the left and right sides }
    Pen.Color := clWhite;
    MoveTo(Left, Top);
    LineTo(Left, Bottom);

    Pen.Color := clBlack;
    MoveTo(Right+1, Top);
    LineTo(Right+1, Bottom);

    Pen.Color := clGray;
    MoveTo(Right, Top);
    LineTo(Right, Bottom);
    MoveTo(Left-1, Top);
    LineTo(Left-1, Bottom);

    { now for the icon... }
    if not (sfSeparator in item.Flags) then
      BitBlt(Handle, Left + 16, Top + 2, 16, 16,
        Images.Canvas.Handle, item.ImgOffset, 0, SRCCOPY);

    { reset the canvas object }
    Handle := 0;
  end;
end;


procedure TStartMenu.WndProc(var Message: TMessage);
begin
  { This is a simplified version of the WndProc from the Menus VCL. }
  try
    case Message.Msg of
      WM_DRAWITEM:
        with TDRAWITEMSTRUCT(Pointer(Message.lParam)^) do
          PaintMenu(hDC, rcItem, itemState, TStartMenuItem(itemData));

      WM_MEASUREITEM:
        with TMEASUREITEMSTRUCT(Pointer(Message.lParam)^) do begin
          itemHeight := TMenuItem(itemData).Tag;
          itemWidth := Images.Canvas.TextWidth(TMenuItem(itemData).Caption) + 40;
        end;

      WM_COMMAND:
          DispatchCommand(Message.wParam);
    end;
    with Message do Result := DefWindowProc(Window, Msg, wParam, lParam);
  except
    Application.HandleException(Self);
  end;
end;


function ExtractStartInfo(const s: string): TStartInfo;
begin
  FillChar(Result, SizeOf(Result), 0);

  if Unformat(s, '%s;%s;%d;%s;%d',
    [@Result.command, 79, @Result.directory, 79, @Result.showmode,
     @Result.iconfile, 79, @Result.iconindex]) = 1
    then Result.command := '';
end;


function PackStartInfo(const command, directory, iconfile: TFilename;
 showmode, iconindex: Integer): string;
begin
  Result := Format('%.79s;%.79s;%d;%.79s;%d',
    [command, directory, showmode, iconfile, iconindex]);
end;


function TStartMenu.Find(const cap : string; Submenu: Boolean): TMenuItem;

function FindCap(node : TMenuItem): TMenuItem;
var
  i: Integer;
  item : TMenuItem;
begin
  Result := nil;
  for i := 0 to node.Count-1 do begin
    item := node.Items[i];
    if ((item.Count > 0) = Submenu) and (CompareText(item.Caption, cap) = 0) then
      Result := item
    else if item.Count > 0 then
      Result := FindCap(item);

    if Result <> nil then Exit;
  end;
end;

begin
  Result := FindCap(items);
end;

end.

