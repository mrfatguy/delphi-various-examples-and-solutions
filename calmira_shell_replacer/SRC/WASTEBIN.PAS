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

unit Wastebin;

{ Wastepaper bin

  TTrash object

  This is an abstract base class that defines how a piece of trash
  is stored, deleted and restored.  The code for performing the disk
  operations is placed in the descendants, TFileTrash and TFolderTrash.

  Methods

    Create - initializes a new object from a TDirItem that is about
      to be binned.
    Load - initializes a new object from an entry in the INI file.
    RestoreTo - moves the trash back into "normal" disk space.
      A pathname is required and if none is given, the object is
      moved back to where it originally came from.
    Delete - removes the item from disk, freeing up space
    Draw - paints a row of the bin's listbox.  The integer parameters
      specify where the size and date fields begin

  Protected methods

    These are called to implement disk operations.

    DoTrash - moves a TDirItem to the bin (currently implemented in the
      base class).
    DoDelete - called by Delete
    DoRestore - called by RestoreTo
    GetIcon - returns the TIcon to represent the trash item.
    CanReplaceFile - called by RestoreTo if the destination already
      exists.  TFileTrash asks for confirmation, TFolderTrash just
      raises an exception.

  Properties
    Filename - the full name of the original file or folder
    Tempname - the current name of the file or folder
    Size - for files, this gives the file size.  For folders, this is
      the total size of the structure including sub-folders
    Date - a string containing the formatted date
    Release - True if the trash object should be removed from the bin
      the next time it is updated -- either because the referenced
      file/folder has been deleted or restored, or is otherwise invalid.


  TBin form

  When items are dropped from a TIconWindow, the TDirItems are
  converted into TTrash objects, which are stored into the INI file
  and recreated the next time the program loads.  The trash is kept
  in Listbox.Items.Objects during normal use.

  Methods

    UpdateBin - deletes all TTrash objects with their Release flag
      set to True, then changes the form's icon to show if there is
      something in the bin.
    SaveTrash - deletes unwanted trash according to the BinAction
      setting, and writes the remaining filenames to the INI file.
      This is usually called when the program ends.
    RestoreTo - calles the RestoreTo method of every selected
      TTrash object
}

interface

uses
  SysUtils, Classes, Controls, Forms, Dialogs, StdCtrls, Buttons, Messages,
  Fileman, ExtCtrls, Menus, Dropclnt, DragDrop, WinTypes, CalForm, FormDrag,
  Graphics, Directry, Settings, Sysmenu;

const
  SC_EMPTYBIN = SC_VSCROLL + 999;

type
  TTrashDate = string[15];

  TTrash = class
  protected
    FFilename: TFilename;
    FTempname: TFilename;
    FSize : Longint;
    FDate : TTrashDate;
    FRelease : Boolean;
    procedure DoTrash(Item: TDirItem); virtual;
    function DoDelete: Boolean; virtual; abstract;
    function DoRestore(const dest: TFilename): Boolean; virtual; abstract;
    function GetIcon: TIcon; virtual; abstract;
    function CanReplaceFile(const s: TFilename): Boolean; virtual; abstract;
  public
    constructor Create(Item : TDirItem); virtual;
    constructor Load(const AFilename, ATempname: TFilename); virtual;
    function Delete: Boolean;
    procedure RestoreTo(dest: TFilename);
    procedure Draw(Canvas: TCanvas; Rect: TRect; x1, x2: Integer);
    property Filename : TFilename read FFilename;
    property Tempname : TFilename read FTempname;
    property Size : Longint read FSize;
    property Date : TTrashDate read FDate;
    property Release: Boolean read FRelease;
  end;


  TFolderTrash = class(TTrash)
  protected
    function DoDelete: Boolean; override;
    function DoRestore(const dest: TFilename): Boolean; override;
    function GetIcon: TIcon; override;
    function CanReplaceFile(const s: TFilename): Boolean; override;
  public
    constructor Create(Item : TDirItem); override;
    constructor Load(const AFilename, ATempname: TFilename); override;
  end;


  TFileTrash = class(TTrash)
  protected
    function DoDelete: Boolean; override;
    function DoRestore(const dest: TFilename): Boolean; override;
    function GetIcon: TIcon; override;
    function CanReplaceFile(const s: TFilename): Boolean; override;
  public
    constructor Create(Item : TDirItem); override;
  end;

  TTrashClass = class of TTrash;

  TBin = class(TCalForm)
    Listbox: TListBox;
    Menu: TPopupMenu;
    Delete: TMenuItem;
    Empty: TMenuItem;
    Header: THeader;
    Dragger: TFormDrag;
    N1: TMenuItem;
    Properties: TMenuItem;
    Restore: TMenuItem;
    SystemMenu: TSystemMenu;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure DeleteClick(Sender: TObject);
    procedure EmptyClick(Sender: TObject);
    procedure HeaderSized(Sender: TObject; ASection, AWidth: Integer);
    procedure ListboxDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure FormResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure PropertiesClick(Sender: TObject);
    procedure RestoreClick(Sender: TObject);
    procedure MenuPopup(Sender: TObject);
  private
    { Private declarations }
    SizeStart, DateStart: Integer;
    procedure WMSysCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;
  public
    { Public declarations }
    procedure UpdateBin;
    procedure SaveTrash;
    procedure RestoreTo(const foldername: TFilename);
    procedure Configure;
    procedure ReadINISettings;
    procedure SettingsChanged(Changes : TSettingChanges); override;
  end;

  EBinError = class(Exception);

const
  DefaultBin : TFilename = '';

var
  Bin: TBin;

implementation

{$R *.DFM}

uses IconWin, FileCtrl, Desk, MultiGrd, Resource, Busy,
  ShellAPI, FileFind, Files, MiscUtil, Drives, Strings, Sys, WinProcs,
  BinProp;

const
  IsFolderToTrash : array[Boolean] of TTrashClass = (TFileTrash, TFolderTrash);
  { returns the appropriate class to use depending on whether the
    source is a folder or not }

var
  BinFolders : TStringList;


{ Decides which directory a file or folder should be stored in }

function GetBinFolder(const filename: TFilename): TFilename;
begin
  Result := BinFolders.Values[filename[1]];
  if Result = '' then Result := DefaultBin;
end;


function MangleFilename(const path, original: TFilename): TFilename;
var
  n, p : Integer;
  body : string[8];
  ext  : string[3];
  num  : string[5];
  R : TSearchRec;
begin
  { Appends a twiddle (tilde) and number to the end of a filename
    when a naming conflict occurs.  For example, if autoexec.bat exists,
    the second copy in the bin is called autoex~1.bat }

  p := Pos('.', original);

  if p = 0 then begin
    body := original;
    ext := '';
  end else begin
    body := Copy(original, 1, p-1);
    ext := Copy(original, p+1, 255);
  end;

  Result := path + original;
  n := 0;

  while FindFirst(Result, faAnyFile and not faVolumeID, R) = 0 do begin
    Inc(n);
    num := IntToStr(n);
    Result := Format('%s%s~%d.%s', [Path, Copy(body, 1, 7 - Length(num)), n, ext]);
  end;

  if Result[Length(Result)] = '.' then Dec(Result[0]);
end;


{ TTrash }

constructor TTrash.Create(Item : TDirItem);
begin
  inherited Create;
  FRelease := False;
  FFilename := Item.Fullname;
  FSize := Item.Size;
  FDate := DateToStr(Item.TimeStamp);
end;


{ Suppresses all user confirmation before trashing the item }

procedure TTrash.DoTrash(Item : TDirItem);
begin
  YesToAll;
  try
    try
      Item.MoveAndRename(FTempName);
    except
      raise EBinError.Create(Format('Unable to move %s to bin', [Filename]));
    end;
  finally
    NoToAll;
  end;
end;


constructor TTrash.Load(const AFilename, ATempname: TFilename);
var
  rec: TSearchRec;
begin
  inherited Create;
  FRelease := False;
  FFilename := AFilename;
  FTempname := ATempname;
  FRelease := FindFirst(Tempname, faAnyFile, rec) <> 0;
  FSize := rec.size;
  FDate := DateToStr(TimeStampToDate(rec.time));
end;


{ Calls ForceDirectories to make sure that the destination folder
  exists before restoring.  Strictly speaking, more than one icon
  window may be invalidated by this procedure, but it's not important
  enough to worry about, so only the destination window is refreshed }

procedure TTrash.RestoreTo(dest: TFilename);
begin
  if dest = '' then dest := ExtractFilePath(Filename)
  else dest := MakePath(dest);
  ForceDirectories(dest);
  AppendStr(dest, ExtractFilename(Filename));
  if FFileExists(dest) and not CanReplaceFile(dest) then Exit;

  try
    DoRestore(dest);
    FRelease := True;
  except
    raise EBinError.Create(Format('Unable to restore %s', [Filename]));
  end;

  Desktop.RefreshList.Add(ExtractFileDir(dest));
end;


function TTrash.Delete: Boolean;
begin
  YesToAll;
  try
    try
      FileSetAttr(TempName, 0);
      Result := DoDelete;
    except
      Result := False;
      raise;
    end;
  finally
    FRelease := Result;
    NoToAll;
  end;
end;


{ The abstract function GetIcon is called to retrieve a folder or file image }

procedure TTrash.Draw(Canvas: TCanvas; Rect: TRect; x1, x2: Integer);
var
  sizestr : string[31];
begin
  with Canvas do begin
    FillRect(Rect);
    sizestr := FormatByte(Size);

    if BinIcons then begin
      Draw(Rect.Left + 2, Rect.Top, GetIcon);
      Inc(Rect.Left, 20);
      Dec(x1, 18);
    end;

    Inc(Rect.Top);
    TextOut(Rect.Left + 2, Rect.Top, MinimizeName(Filename, Canvas, x1));
    TextOut(x2 - 6 - TextWidth(sizestr), Rect.Top, sizestr);
    TextOut(x2, Rect.Top, Date);
  end;
end;


{ TFolderTrash }

constructor TFolderTrash.Create(Item : TDirItem);
begin
  { The file manager's directory copying facilities will update the
    BytesTransferred variable for a quick way to find the total size }

  inherited Create(Item);
  FTempname := MangleFilename(GetBinFolder(FFilename), ExtractFilename(FFilename));
  BytesTransferred := 0;
  DoTrash(Item);
  FSize := BytesTransferred;
end;

constructor TFolderTrash.Load(const AFilename, ATempname: TFilename);
begin
  inherited Load(AFilename, ATempname);
  FSize := DirInfo(Tempname, True).Size;
end;

function TFolderTrash.DoDelete: Boolean;
begin
  Result := DeleteDirectory(FTempname);
end;

function TFolderTrash.DoRestore(const dest: TFilename): Boolean;
begin
  Result := MoveDirectory(Tempname, dest);
end;

function TFolderTrash.GetIcon: TIcon;
begin
  Result := TinyFolder;
end;

function TFolderTrash.CanReplaceFile(const s: TFilename): Boolean;
begin
  raise EBinError.CreateFmt('Cannot restore folder %s because there '+
    'is a file with that name', [s]);
end;

{ TFileTrash }

constructor TFileTrash.Create(Item : TDirItem);
begin
  inherited Create(Item);
  FTempname := MangleFilename(GetBinFolder(FFilename), ExtractFilename(FFilename));
  DoTrash(Item);
end;

function TFileTrash.DoDelete: Boolean;
begin
  Result := DeleteFile(FTempname);
end;

function TFileTrash.DoRestore(const dest: TFilename): Boolean;
begin
  Result := MoveFile(Tempname, dest, -1);
end;

function TFileTrash.GetIcon: TIcon;
begin
  Result := TinyFile;
end;

function TFileTrash.CanReplaceFile(const s: TFilename): Boolean;
begin
  case MsgDialog(Format('Replace existing %s?', [s]),
   mtConfirmation, mbYesNoCancel, 0) of
    mrYes     : Result := True;
    mrNo      : Result := False;
    mrCancel  : Abort;
  end;
end;

{ TBin }

procedure TBin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caMinimize;
end;


procedure TBin.FormDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
   Accept := (Source is TMultiGrid) and (Source <> SysWindow.Grid);
end;


procedure TBin.FormCreate(Sender: TObject);
var
  i: Integer;
  t: TTrash;
  s: TFilename;
  rec : TSearchRec;
begin
  BinFolders := TStringList.Create;
  WindowState := wsMinimized;
  Listbox.DragCursor := crDropFile;
  ReadINISettings;
  Configure;

  with SystemMenu do begin
    DeleteCommand(SC_SIZE);
    DeleteCommand(SC_MAXIMIZE);
    AddSeparator;
    Add('Empty', SC_EMPTYBIN);
  end;

  ini.ReadSection('Trash', Listbox.Items);
  with Listbox.Items do
    for i := 0 to Count-1 do begin
      s := Strings[i];
      FindFirst(s, faAnyFile and not faVolumeID, rec);
      t := IsFolderToTrash[rec.attr and faDirectory > 0].Load(
        ini.ReadString('Trash', s, ''), s);
      Strings[i] := t.Filename;
      Objects[i] := t;
    end;
  UpdateBin;

  if not BinDisable then begin
    LoadPosition(ini, 'Bin');
    Update;
  end;
end;


{ The bin accepts drops from icon windows only.  For each item selected,
  a corresponding TTrash object is created, which is responsible for
  moving the original.  Filenames and trash objects are stored in the
  listbox }

procedure TBin.FormDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  win: TIconWindow;
  i : Integer;
  waste : TTrash;
  item : TDirItem;
begin
  win := (Source as TMultiGrid).Owner as TIconWindow;
  try
    if BinAction = baDelete then
      win.Delete.Click

    else with win.CompileSelection(False) do begin
      if (FileCount > 1) or (FolderCount > 0) then
        BusyBox.ShowMessage('Binning selected items...');

      for i := 0 to Count-1 do begin
        item := TDirItem(Items[i]);
        waste := IsFolderToTrash[item is TFolder].Create(item);
        Listbox.Items.AddObject(waste.Filename, waste);
      end;
    end;
  finally
    UpdateBin;
    BusyBox.Hide;
    win.Dir.Flush;
    PlaySound(Sounds.Values['BinDropFiles']);
  end;
end;


{ Called before the program quits, and also deletes unwanted trash.
  UpdateBin and FormDestroy are responsible for freeing the TTrash
  objects when they are not needed. }

procedure TBin.SaveTrash;
var
  i: Integer;
  used, space: Longint;
begin
  with Listbox.Items do
    try
      { count how many bytes are used }
      used := 0;
      for i := 0 to Count-1 do Inc(used, TTrash(Objects[i]).Size);

      case BinAction of
        baCollect: space := Longint(BinCapacity) * 1024 * 1024;
        baEmpty  : space := -1;
      end;

      { keep deleting until within the limit }
      i := 0;
      while (used > space) and (i < Count) do begin
        with TTrash(Objects[i]) do if Delete then Dec(used, Size);
        Inc(i);
      end;
    finally
      { clear out deleted entries and write the remainder to disk }
      UpdateBin;
      ini.EraseSection('Trash');
      for i := 0 to Count-1 do with TTrash(Objects[i]) do
        ini.WriteString('Trash', Tempname, Filename);
    end;
end;


procedure TBin.UpdateBin;
var i: Integer;
begin
  { Free unused trash objects }
  i := 0;
  with Listbox.Items do begin
    for i := Count-1 downto 0 do
      if TTrash(Objects[i]).Release then begin
        Objects[i].Free;
        Delete(i);
      end;

    { Change the icon }
    if Count = 0 then Icon.Assign(icons.Get('EmptyBin'))
    else Icon.Assign(icons.Get('FullBin'));
  end;

  Listbox.Itemindex := -1;
end;


procedure TBin.RestoreTo(const foldername: TFilename);
var
  i: Integer;
  path : TFilename;
begin
  { if no folder is specified, trash is restored to its original location }
  try
    with Listbox do begin
      if Items.Count > 1 then BusyBox.ShowMessage('Restoring files...');
      if foldername = '' then path := '' else path := MakePath(foldername);

      for i := 0 to Items.Count-1 do
        if Selected[i] then TTrash(Items.Objects[i]).RestoreTo(path);
    end;
  finally
    UpdateBin;
    BusyBox.Hide;
    Desktop.RefreshNow;
    PlaySound(Sounds.Values['BinRestore']);
  end;
end;


procedure TBin.DeleteClick(Sender: TObject);
var
  i: Integer;
begin
  with Listbox.Items do
    for i := 0 to Count-1 do
      if Listbox.Selected[i] then TTrash(Objects[i]).Delete;
  UpdateBin;
end;


procedure TBin.EmptyClick(Sender: TObject);
var
  i: Integer;
begin
  BusyBox.ShowMessage('Emptying bin...');
  try
    PlaySound(Sounds.Values['BinEmpty']);
    with Listbox.Items do
      for i := 0 to Count-1 do TTrash(Objects[i]).Delete;
  finally
    UpdateBin;
    BusyBox.Hide;
  end;
end;



procedure TBin.WMSysCommand(var Msg: TWMSysCommand);
begin
  inherited;
  if Msg.CmdType = SC_EMPTYBIN then Empty.Click;
end;


procedure TBin.HeaderSized(Sender: TObject; ASection, AWidth: Integer);
begin
  { Adjust listbox columns and redraw }
  with Header do begin
    SizeStart := SectionWidth[0];
    DateStart := SizeStart + SectionWidth[1];
  end;
  Listbox.Invalidate;
end;


procedure TBin.ListboxDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  with Listbox do
    TTrash(Items.Objects[Index]).Draw(Canvas, Rect, SizeStart-6, DateStart);
end;


procedure TBin.FormResize(Sender: TObject);
begin
  Listbox.Width := ClientWidth - 8;
  Listbox.Height := ClientHeight - Header.Height - 7;
  Header.Width := Listbox.Width;
  Invalidate;
end;


procedure TBin.FormDestroy(Sender: TObject);
var
  i: Integer;
begin
  with Listbox.Items do for i := 0 to Count-1 do Objects[i].Free;
  BinFolders.Free;
  ini.WriteHeader('Bin', Header);
end;


procedure TBin.Configure;
begin
  Caption := BinCaption;
  Color := Colors[ccWinFrame];
  Dragger.Hollow := HollowDrag;
  Listbox.ItemHeight := LineHeight;
  Invalidate;
end;


procedure TBin.ReadINISettings;
var
  i: Integer;
begin
  ini.ReadHeader('Bin', Header);
  HeaderSized(Header, 0, Header.SectionWidth[0]);

  BinFolders.Clear;
  ini.ReadSectionValues('Bin Locations', BinFolders);
  for i := 0 to BinFolders.Count-1 do
    BinFolders[i] := MakePath(BinFolders[i]);
end;


procedure TBin.FormPaint(Sender: TObject);
begin
  Border3D(Canvas, ClientWidth-1, ClientHeight-1);
end;


procedure TBin.PropertiesClick(Sender: TObject);
begin
  ShowModalDialog(TBinPropDlg);
end;


procedure TBin.RestoreClick(Sender: TObject);
begin
  RestoreTo('');
end;


procedure TBin.MenuPopup(Sender: TObject);
begin
  with Listbox do begin
    Restore.Enabled := SelCount > 0;
    Delete.Enabled := SelCount > 0;
    Empty.Enabled := Items.Count > 0;
  end;
end;


procedure TBin.SettingsChanged(Changes : TSettingChanges);
begin
  if scIniFile in Changes then ReadINISettings;
  if [scSystem, scDisplay, scDesktop, scBin] * Changes <> [] then Configure;
end;


initialization
  DefaultBin := Lowercase(ApplicationPath + 'BIN');
  if not FDirectoryExists(DefaultBin) then begin
    MkDir(DefaultBin);
    FileSetAttr(DefaultBin, faHidden);
  end;
  AppendStr(DefaultBin, '\');
end.
