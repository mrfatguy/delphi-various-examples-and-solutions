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

unit FileFind;

{ Find dialog

  Performs a recursive background search for the specified files,
  and adds the file details to a multi-column list box.  The fields
  are encoded and unformatted in the DrawItem handler.  This limits
  the number of entries, so for a greater capacity, consider moving
  the data into a TStringList and just adding null fields in the
  listbox (the string list probably uses more memory because it
  allocates lots of small blocks).

  The listbox is a drag-drop source, and has a separate global
  variable pointing to it.  This is so that drag-drop targets can
  check the source without dereferencing the FindForm variable,
  whieh may be nil when the dialog is not open.
}

interface

uses WinTypes, WinProcs, Classes, Forms, Controls, Buttons, CalForm,
  StdCtrls, ExtCtrls, SysUtils, Menus, DragDrop, DropServ, Graphics,
  TabNotBk, Settings;

type
  TFindForm = class(TCalForm)
    CloseBtn: TBitBtn;
    SearchBtn: TBitBtn;
    ClearBtn: TBitBtn;
    Header: THeader;
    Menu: TPopupMenu;
    OpenParent: TMenuItem;
    Delete: TMenuItem;
    DropServer: TDropServer;
    OpenFile: TMenuItem;
    N1: TMenuItem;
    Listbox: TListBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    FoundLabel: TLabel;
    SelLabel: TLabel;
    Notebook: TTabbedNotebook;
    Label1: TLabel;
    FileEdit: TComboBox;
    Label2: TLabel;
    StartEdit: TComboBox;
    WholeDrive: TRadioButton;
    SubFolders: TRadioButton;
    OneFolder: TRadioButton;
    procedure SearchBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure ClearBtnClick(Sender: TObject);
    procedure ListboxDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure HeaderSized(Sender: TObject; ASection, AWidth: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure DeleteClick(Sender: TObject);
    procedure OpenParentClick(Sender: TObject);
    procedure MenuPopup(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DropServerFileDrop(Sender: TObject; X, Y: Integer;
      Target: Word);
    procedure ListboxMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ListboxEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure OpenFileClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StartEditKeyPress(Sender: TObject; var Key: Char);
    procedure WholeDriveClick(Sender: TObject);
    procedure ListboxClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure StartEditDblClick(Sender: TObject);
    procedure StartEditChange(Sender: TObject);
  private
    { Private declarations }
    Searching: Boolean;
    FSelection: TStringList;
    LocStart, SizeStart, DateStart: Integer;
    Changed : Boolean;
    FileSpecs : TStringList;
    procedure SearchFiles(const StartPath: TFilename);
    procedure ExtractSearchMasks;
    procedure UpdateStatusBar;
  public
    { Public declarations }
    function CompileSelection: TStringList;
    procedure SettingsChanged(Changes : TSettingChanges); override;
    function FileAt(i: Integer) : TFilename;
    property Selection : TStringList read FSelection;
  end;

  EFindError = class(Exception);

var
  FindForm: TFindForm;
  FindList: TListBox;

procedure FileFindExecute(const StartPath : string; RadioIndex: Integer);

implementation

{$R *.DFM}

uses Dialogs, Resource, Strings, MiscUtil, Tree,
  Fileman, Drives, Desk, FileCtrl, Files, Directry;


procedure TFindForm.ExtractSearchMasks;
var
  specs : TFilename;
  i : Integer;
begin
  specs := Trim(FileEdit.Text);
  if specs = '' then raise
    EFindError.Create('Please specify the files to search for.');

  { separate the file sepcifications and add to a string list }

  FileSpecs.Clear;
  i := Pos(';', specs);
  while i > 0 do begin
    FileSpecs.Add(Copy(specs, 1, i-1));
    System.Delete(specs, 1, i);
    i := Pos(';', specs);
  end;
  if specs > '' then FileSpecs.Add(specs);
end;


procedure TFindForm.UpdateStatusBar;
begin
  FoundLabel.Caption := Format('%d items found', [Listbox.Items.Count]);
  SelLabel.Caption := Format('%d selected', [Listbox.SelCount]);
end;


procedure TFindForm.SearchBtnClick(Sender: TObject);
begin
  if Searching then begin
    Searching := False;
    exit;
  end;

  Changed := AddHistory(FileEdit) or Changed;
  Changed := AddHistory(StartEdit) or Changed;

  Searching := True;
  SearchBtn.Caption := 'Stop';
  Notebook.Enabled := False;
  CloseBtn.Enabled := False;
  ClearBtn.Enabled := False;
  Listbox.Enabled := True;
  Cursor := crBusyPointer;

  try
    with StartEdit do begin
      Text := Lowercase(ExpandFilename(Text));
      if WholeDrive.Checked then Text := Copy(Text, 1, 3);
      ExtractSearchMasks;
      SearchFiles(MakePath(Text));
    end;
  finally
    Searching := False;
    SearchBtn.Caption := 'Search';
    Notebook.Enabled := True;
    CloseBtn.Enabled := True;
    ClearBtn.Enabled := True;
    Screen.Cursor := crDefault;
    Listbox.Items.EndUpdate;
    Cursor := crDefault;

    PlaySound(Sounds.Values['NotifyCompletion']);
    if Listbox.Items.Count = 0 then begin
      MsgDialog('No matching files found', mtInformation, [mbOK], 0);
      Listbox.Enabled := False;
    end
    else Listbox.Enabled := True;
    UpdateStatusBar;
  end;
end;




procedure TFindForm.SearchFiles(const StartPath: TFilename);
var
  rec: TSearchRec;
  code, i : Integer;
  icon : TIcon;
begin
  Application.ProcessMessages;
  if not Searching or Application.Terminated then Abort;

  for i := 0 to FileSpecs.Count-1 do begin

  { loop through wildcards }
  code := FindFirst(StartPath + FileSpecs[i], faAnyFile and not faVolumeID, rec);

  while code = 0 do begin
    if rec.name[1] <> '.' then begin

      rec.name := Lowercase(rec.name);

      if rec.attr and faDirectory > 0 then
        icon := TinyFolder
      else if ExtensionIn(Copy(ExtractFileExt(rec.name), 2, 3), programs) then
        icon := TinyProg
      else
        icon := TinyFile;

      Listbox.Items.AddObject(Format('%s;%s;%s;%s',
        [rec.name, MakeDirname(StartPath), FormatByte(rec.size),
         DateToStr(TimestampToDate(rec.time))]), icon);
    end;
    Application.ProcessMessages;
    code := FindNext(rec);
  end;

  end;

  if not OneFolder.Checked then begin
    { search subdirs }
    code := FindFirst(StartPath + '*.*', faDirectory, rec);
    while code = 0 do begin
      if (rec.Attr and faDirectory <> 0) and (rec.name[1] <> '.') then
        SearchFiles(StartPath + Lowercase(rec.name) + '\');
      Application.ProcessMessages;
      code := FindNext(rec);
    end;
  end;
end;



procedure TFindForm.FormCreate(Sender: TObject);
begin
  Icon.Assign(Icons.Get('FindDialog'));
  CloseBtn.Cancel := True;
  Notebook.PageIndex := 0;
  Searching := False;
  Listbox.DragCursor := crDropFile;
  FSelection := TStringList.Create;
  FileSpecs := TStringList.Create;
  FileSpecs.Duplicates := dupIgnore;
  FindList := Listbox;
  Listbox.ItemHeight := LineHeight;
  ini.ReadStrings('Search for', FileEdit.Items);
  ini.ReadStrings('Start from', StartEdit.Items);
  ini.ReadHeader('Find files', Header);
  HeaderSized(Header, 0, Header.SectionWidth[0]);
end;


procedure TFindForm.CloseBtnClick(Sender: TObject);
begin
  Close;
end;


procedure TFindForm.ClearBtnClick(Sender: TObject);
begin
  with Listbox do begin
    Items.Clear;
    FoundLabel.Caption := '0 items found';
    SelLabel.Caption := '0 selected';
    Enabled := False;
  end;
end;

procedure TFindForm.ListboxDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  filename: string[15];
  location: TFilename;
  size    : string[15];
  date    : string[15];
begin
  with Listbox, Listbox.Canvas do begin
    FillRect(Rect);

    if FindDlgIcons then begin
      Draw(Rect.Left, Rect.Top, TIcon(Items.Objects[Index]));
      Inc(Rect.Left, 20);
    end;

    Inc(Rect.Top);
    Unformat(Items[Index], '%s;%s;%s;%s',
      [@filename, 15, @location, 79, @size, 15, @date, 15]);

    TextOut(Rect.Left + 2, Rect.Top, filename);
    TextOut(LocStart, Rect.Top, MinimizeName(location, Canvas, SizeStart - LocStart));
    TextOut(DateStart-10-TextWidth(size), Rect.Top, size);
    TextOut(DateStart, Rect.Top, date);
  end;
end;


procedure TFindForm.HeaderSized(Sender: TObject; ASection,
  AWidth: Integer);
begin
  with Header do begin
    LocStart := SectionWidth[0];
    SizeStart := LocStart + SectionWidth[1];
    DateStart := SizeStart + SectionWidth[2];
  end;
  Listbox.Invalidate;
end;


function TFindForm.FileAt(i: Integer): TFilename;
var
  name: string[15];
  location : TFilename;
begin
  { The listbox stores the name and location the wrong way around...}
  Unformat(Listbox.Items[i], '%s;%s;', [@name, 15, @location, 79]);
  Result := MakePath(location) + name;
end;


function TFindForm.CompileSelection: TStringList;
var
  i: Integer;
begin
  FSelection.Clear;
  for i := 0 to Listbox.Items.Count-1 do
    if Listbox.Selected[i] then FSelection.Add(FileAt(i));
  Result := FSelection;
end;


procedure TFindForm.FormDestroy(Sender: TObject);
begin
  ini.WriteHeader('Find files', Header);

  if Changed then with ini do begin
    EraseSection('Search for');
    WriteStrings('Search for', FileEdit.Items);

    EraseSection('Start from');
    WriteStrings('Start from', StartEdit.Items);
  end;

  FSelection.Free;
  FileSpecs.Free;
  FindList := nil;
  FindForm := nil;
end;



procedure TFindForm.DeleteClick(Sender: TObject);
var
  i: Integer;
  s: TFilename;
begin
  if not Searching then with Listbox do begin
    NoToAll;
    i := 0;
    Items.BeginUpdate;
    Screen.Cursor := crHourGlass;
    try
      for i := Items.Count-1 downto 0 do
        if Selected[i] then begin
          if KeyBreak and (GetAsyncKeyState(VK_ESCAPE) < 0) then Break;
          s := FileAt(i);
          if (Items.Objects[i] = TinyFile) and EraseFile(s, -1) then begin
            Items.Delete(i);
            Desktop.RefreshList.Add(ExtractFileDir(s));
          end
        end;
    finally
      Desktop.RefreshNow;
      Screen.Cursor := crDefault;
      Items.EndUpdate;
      Enabled := Items.Count > 0;
      UpdateStatusBar;
    end;
  end;
end;


procedure TFindForm.OpenParentClick(Sender: TObject);
begin
  with Listbox do
  if ItemIndex <> -1 then
    Desktop.OpenFolder(ExtractFileDir(FileAt(ItemIndex)));
end;


procedure TFindForm.MenuPopup(Sender: TObject);
begin
  OpenFile.Enabled := Listbox.ItemIndex <> -1;
  OpenParent.Enabled := OpenFile.Enabled;
  Delete.Enabled := OpenFile.Enabled;
end;


procedure TFindForm.FormShow(Sender: TObject);
var s: string;
begin
  if StartEdit.Text = '' then begin
    GetDir(0, s);
    StartEdit.Text := Copy(s, 1, 3);
  end;
end;


procedure TFindForm.DropServerFileDrop(Sender: TObject; X, Y: Integer;
  Target: Word);
begin
  DropServer.Files.Assign(CompileSelection);
end;


procedure TFindForm.ListboxMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if Listbox.Dragging and DropServer.CanDrop and AnimCursor then
    SetCursor(Screen.Cursors[crFlutter])
end;


procedure TFindForm.ListboxEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
  DropServer.DragFinished;
end;


procedure TFindForm.OpenFileClick(Sender: TObject);
var
  s: TFilename;
begin
  with Listbox do
  if ItemIndex <> -1 then begin
    s := FileAt(ItemIndex);
    if Items.Objects[ItemIndex] = TinyFolder then Desktop.OpenFolder(s)
    else DefaultExec(s, '', ExtractFileDir(s), SW_SHOWNORMAL);
  end;
end;


procedure TFindForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree
end;


procedure FileFindExecute(const StartPath : string; RadioIndex: Integer);
begin
  if FindForm = nil then FindForm := TFindForm.Create(Application);

  with FindForm do begin
    StartEdit.Text := Lowercase(StartPath);
    SetRadioIndex([WholeDrive, SubFolders, OneFolder], RadioIndex);
    WindowState := wsNormal;
    Show;
  end;
end;


procedure TFindForm.StartEditKeyPress(Sender: TObject; var Key: Char);
begin
  Key := LowCase(Key);
end;


procedure TFindForm.WholeDriveClick(Sender: TObject);
begin
  StartEdit.Text := Copy(StartEdit.Text, 1, 3);
end;


procedure TFindForm.ListboxClick(Sender: TObject);
begin
  UpdateStatusBar;
end;


procedure TFindForm.FormPaint(Sender: TObject);
begin
  Border3D(Canvas, ClientWidth-1, ClientHeight-1);
end;


procedure TFindForm.StartEditDblClick(Sender: TObject);
begin
  SubFolders.Checked := True;
  StartEdit.Text := SelectFolder(StartEdit.Text);
end;


procedure TFindForm.StartEditChange(Sender: TObject);
begin
  if WholeDrive.Checked then SubFolders.Checked := True;
end;


procedure TFindForm.SettingsChanged(Changes : TSettingChanges);
begin
  if scFileSystem in Changes then Listbox.Invalidate;
end;

end.
