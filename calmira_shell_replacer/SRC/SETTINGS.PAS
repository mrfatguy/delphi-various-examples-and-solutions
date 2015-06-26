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

unit Settings;

{ Settings manager

  This unit is responsible for loading and saving most settings, using
  the main INI file.  Most settings are also declared here.

  Each set of properties has associated load and save procedures.  The
  load procedure is called during startup, and the save procedure is
  called by the individual property dialogs, after the user presses OK.

  LoadSettings() will initialize some general settings, and those which
  are not available for editing in dialogs.  Then it loads all the
  settings which do belong in property dialogs.

  AnnounceSettingsChanged() should be called by a property dialog
  after it has saved its properties, passing a parameter that indicates
  which part of the setup has changed.  This causes WM_SETTINGSCHANGED
  to be broadcast to all forms, which respond appropriately.
}

interface

uses Classes, SysUtils, IniFiles, Profile, WinTypes, Graphics, Controls, Forms;

type
  { sorting in icon windows }
  TSortOrder = (soType, soName, soSize, soDate);

  { new window placement }
  TWindowOpen = (woCascaded, woRandom, woSaved);

  { trash management }
  TBinAction  = (baLeave, baDelete, baEmpty, baCollect);

  { application colour palette }
  TCalColor = (ccWinFrame, ccIconBack, ccIconSel, ccShortArrow,
    ccAliasArrow, ccPercent, ccPercentText, ccTaskbar);

  TSettingChanges = set of (scSystem, scFileSystem, scDesktop,
    scStartMenu, scBin, scTaskbar, scDisplay, scINIFile, sc4DOS, scDevices);

const
  ColorNames : array[TCalColor] of string[15] =
  ('Window frames', 'Icon background', 'Icon selection', 'Shortcut arrows',
   'Alias arrows', 'Percent bar', 'Percent text', 'Taskbar');

  DefaultColors : array[TCalColor] of TColor =
    (clSilver, clWindow, clSilver, clBlack, clBlack, clBlue,
     clOlive, clSilver);

  Programs      : string[79] = 'com exe bat pif';

var
  { System properties }
  SysCaption   : TCaption;
  ShowSplash   : Boolean;
  LoadTaskbar  : Boolean;
  RestoreSys   : Boolean;   { restore system window after loading }
  SysWinQuit   : Boolean;   { close system window to quit program }
  QueryQuit    : Boolean;
  TrackThumb   : Boolean;   { scroll window contents when dragging scrollbar }
  KeyBreak     : Boolean;   { break from loops using Esc }

  { File system properties }

  DefaultSort   : TSortOrder;
  DefaultFilter : string[12];
  IconStrings   : TFilename;    { extensions to search for icons in }

  FileHints    : Boolean;
  HintDelay    : Integer;

  UseDescriptions : Boolean;
  DescCaptions    : Boolean;    { show descriptions as captions }
  Simul4DOS       : Boolean;    { load description file before changing }
  IgnoreCtrlD     : Boolean;    { don't bother with ^D markers in descriptions }

  ConfirmCopyStart : Boolean;
  ConfirmMoveStart : Boolean;
  ConfirmDelStart  : Boolean;
  ConfirmCopyFile  : Boolean;
  ConfirmMoveFile  : Boolean;
  ConfirmDelFile   : Boolean;
  ConfirmReplace   : Boolean;
  ConfirmProtect   : Boolean;
  ConfirmCopyFolder : Boolean;
  ConfirmMoveFolder : Boolean;
  ConfirmDelFolder  : Boolean;
  ConfirmNewAlias   : Boolean;

  BackCopying   : Boolean;  { background copying }
  ShowHidSys    : Boolean;  { show hidden/system files }
  ShowList      : Boolean;  { display list view in new icon windows }
  ProgDrop      : Boolean;  { allow drop into programs }
  FindVersion   : Boolean;  { look for version information }
  FindDlgIcons  : Boolean;  { icons in find dialog list }
  RefreshFolders: Boolean;  { refresh windows re-opened by shortcuts }
  AliasArrows   : Boolean;
  HintDesc      : Boolean;
  HintDate      : Boolean;
  HintTime      : Boolean;
  HintAttrib    : Boolean;

  InspectProg  : TFilename;
  DefaultProg  : TFilename;
  UndeleteProg : TFilename;
  DiskProg     : TFilename;

  { Desktop properties }

  WindowOpen : TWindowOpen;   { new window placement }
  AutoSize : Boolean;         { adjust icon window size to fit contents }
  HollowDrag : Boolean;
  SaveWindows : Boolean;      { save windows between sessions }
  ShortArrows : Boolean;
  AnimCursor : Boolean;
  ShowDeskMenu : Boolean;
  TreeAlign : Boolean;        { align file window with tree view }
  ConfirmDelShort : Boolean;
  StickyShorts : Boolean;     { move only when caption is dragged }
  OneClickShorts : Boolean;   { activate after single click }
  BrowseSame : Boolean;       { browse folders in same window }
  RightClose : Boolean;       { right click on min/max box to close }
  FilePaneCols : Integer;     { columns in file pane of explorer }

  { Taskbar properties }

  StayVisible   : Boolean;
  Highlight     : Boolean;    { press button of active task }
  ShrinkMax     : Boolean;    { constrain maximised windows above the bar }
  Clock24       : Boolean;
  PopupRes      : Boolean;
  PopupDate     : Boolean;
  Animate       : Boolean;
  ButtonHints   : Boolean;
  ArrangeMin    : Boolean;    { move minimised windows upwards }
  HideMinApps   : Boolean;
  IconWindowTask : Boolean;
  ExplorerTask   : Boolean;
  FullFolderPath : Boolean;
  CalIcons       : Boolean;
  DocNameFirst   : Boolean;
  DocNameLower   : Boolean;


  { Bin properties }

  BinCaption   : TCaption;
  BinAction    : TBinAction;
  BinCapacity  : Integer;
  BinIcons     : Boolean;
  BinDisable   : Boolean;

  { Start menu properties }

  StartMenu3D  : Boolean;
  ShellStartup : Boolean;
  BoldSelect   : Boolean;
  StartMouseUp : Boolean;
  StartFile    : TFilename;  { normally "START.INI" }

  { Internal }

  IsShell : Boolean;            { true when this program is the shell }
  DoubleClickSpeed : Integer;   { read from WIN.INI }
  Sounds  : TStringList;        { sound effects WAV file list }
  KeyMaps : TStringList;        { keyboard shortcuts }
  WindowPos : TStringList;      { window positions }
  DriveNames : TStringList;    { user defined names for disk drives }
  ini     : TProfile;           { main ini file }
  FirstRun: Boolean;            { first time Calmira is run }
  FillMenu : Boolean;           { fill start menu with grey }
  Colors  : array[TCalColor] of TColor;

  DeskGrid        : TPoint;   { desktop grid for lining up icons }
  BrowseGrid      : TPoint;   { icon window grid size }
  LineHeight      : Integer;  { height of lists and outlines }
  MinAppHeight    : Integer;  { height of icons above the taskbar }
  DescWidth       : Integer;  { width of descriptions in icon windows }

  GlobalFont : TFont;

procedure LoadSettings;
procedure AnnounceSettingsChanged(changes : TSettingChanges);

procedure LoadSystemProp;
procedure SaveSystemProp;
procedure LoadFileSysProp;
procedure SaveFileSysProp;
procedure LoadBinProp;
procedure SaveBinProp;
procedure LoadDeskProp;
procedure SaveDeskProp;
procedure LoadStartProp;
procedure SaveStartProp;
procedure LoadTaskProp;
procedure SaveTaskProp;


implementation

uses Directry, Strings, MiscUtil, WinProcs, Resource, CalMsgs, Menus,
  Start, FourDOS, Environs, Files, FileMan;


procedure ReplaceBitmapColors(bitmap : TBitmap; source, dest: TColor);
var i, j: Integer;
begin
  { changes pixels from one colour to another }
  if source <> dest then
    with bitmap do
      for i := 0 to Width-1 do
        for j := 0 to Height-1 do
          if Canvas.Pixels[i, j] = source then Canvas.Pixels[i, j] := dest;
end;


function ReadColor(col: TCalColor): TColor;
var s: string[31];
begin
  s := ini.ReadString('Colors', ColorNames[col], '');
  if s = '' then Result := DefaultColors[col]
  else Result := StringToColor(s);
end;


procedure LoadSettings;
var
  i : Integer;
  s : string;
  sysini : TIniFile;
begin
  with ini do begin
    DeskGrid.X   := ReadInteger('Desktop', 'DeskGridX', 16);
    DeskGrid.Y   := ReadInteger('Desktop', 'DeskGridY', 16);
    FilePaneCols := ReadInteger('Desktop', 'FilePaneCols', 4);

    ReadFont('Display', GlobalFont);

    ReadSectionValues('Environment', Environment);
    Environment.Values['CALMIRA'] := Lowercase(ExtractFileDir(ApplicationPath));
    Sounds.Clear;
    ReadSectionValues('Sounds', Sounds);

    DriveNames.Clear;
    ReadSectionValues('Drives', DriveNames);
    ReadSectionValues('Window positions', WindowPos);

    Keymaps.Clear;
    ReadSection('Keyboard', KeyMaps);
    for i := 0 to KeyMaps.Count-1 do begin
      s := ReadString('Keyboard', KeyMaps[i], '');
      KeyMaps.Objects[i] := TObject(TextToShortcut('Ctrl+Alt+' + s));
    end;

    DescriptionFile := ReadString('File system', 'DescriptionFile', 'descript.ion');
    DescWidth       := ReadInteger('File System', 'DescriptionWidth', -1);
    FirstRun        := ReadBool('Calmira', 'FirstRun', True);
    WriteBool('Calmira', 'FirstRun', False);
  end;

  sysini := TIniFile.Create('system.ini');
  IsShell := Lowercase(ExtractFilename(
    sysini.ReadString('boot', 'shell', 'progman.exe'))) = 'calmira.exe';
  sysini.Free;

  sysini := TIniFile.Create('win.ini');
  programs := ' ' + Lowercase(sysini.ReadString('windows', 'Programs', programs)) + ' ';
  DoubleClickSpeed := sysini.ReadInteger('windows', 'DoubleClickSpeed', 250);
  sysini.Free;

  LoadSystemProp;
  LoadDeskProp;
  LoadFileSysProp;
  LoadTaskProp;
  LoadBinProp;
  LoadStartProp;
end;


{ Bin properties }

procedure LoadBinProp;
begin
  with ini do begin
    BinCaption  := ReadString('Bin', 'Caption', 'Bin');
    BinAction   := TBinAction(ReadInteger('Bin', 'Action', 0));
    BinCapacity := ReadInteger('Bin', 'Capacity', 8);
    BinIcons    := ReadBool('Bin', 'Icons', False);
    BinDisable  := ReadBool('Bin', 'Disable', False);
  end;
end;

procedure SaveBinProp;
begin
  with ini do begin
    WriteString('Bin', 'Caption', BinCaption);
    WriteInteger('Bin', 'Action', Integer(BinAction));
    WriteInteger('Bin', 'Capacity', BinCapacity);
    WriteBool('Bin', 'Icons', BinIcons);
    WriteBool('Bin', 'Disable', BinDisable);
  end;
end;


{ Desktop properties }

procedure LoadDeskProp;
begin
  with ini do begin
    AutoSize := ReadBool('Preferences', 'AutoSize', True);
    HollowDrag := ReadBool('Preferences', 'HollowDrag', False);
    SaveWindows := ReadBool('Preferences', 'SaveWindows', False);
    ShortArrows := ReadBool('Preferences', 'ShortArrows', True);
    AnimCursor := ReadBool('Preferences', 'AnimCursor', True);
    ShowDeskMenu := ReadBool('Preferences', 'ShowDeskMenu', True);
    TreeAlign := ReadBool('Preferences', 'TreeAlign', True);
    StickyShorts := ReadBool('Preferences', 'StickyShorts', True);
    OneClickShorts := ReadBool('Preferences', 'OneClickShorts', False);
    BrowseSame := ReadBool('Preferences', 'BrowseSame', False);
    RightClose := ReadBool('Preferences', 'RightClose', False);
    ConfirmDelShort := ReadBool('Confirmation', 'DelShort', True);
    WindowOpen := TWindowOpen(ReadInteger('Preferences', 'WindowOpen', 0));
  end;
end;


procedure SaveDeskProp;
begin
  with ini do begin
    WriteBool('Preferences', 'AutoSize', AutoSize);
    WriteBool('Preferences', 'HollowDrag', HollowDrag);
    WriteBool('Preferences', 'SaveWindows', SaveWindows);
    WriteBool('Preferences', 'ShortArrows', ShortArrows);
    WriteBool('Preferences', 'AnimCursor', AnimCursor);
    WriteBool('Preferences', 'ShowDeskMenu', ShowDeskMenu);
    WriteBool('Preferences', 'TreeAlign', TreeAlign);
    WriteBool('Confirmation', 'DelShort', ConfirmDelShort);
    WriteBool('Preferences', 'StickyShorts', StickyShorts);
    WriteBool('Preferences', 'OneClickShorts', OneClickShorts);
    WriteBool('Preferences', 'BrowseSame', BrowseSame);
    WriteBool('Preferences', 'RightClose', RightClose);
    WriteInteger('Preferences', 'WindowOpen', Integer(WindowOpen));
  end;
end;

{ File system properties }

procedure LoadFileSysProp;
begin
  with ini do begin
    DefaultSort   := TSortOrder(ReadInteger('File system', 'DefaultSort', 0));
    IconStrings   := ' ' + ReadString('File system', 'IconStrings', 'EXE') + ' ';
    DefaultFilter := ReadString('File system ', 'DefaultFilter', '*.*');
    FileHints     := ReadBool('File system ', 'FileHints', True);
    HintDelay     := ReadInteger('File system ', 'HintDelay', 1000);
    UseDescriptions := ReadBool('File system', 'UseDescriptions', False);
    DescCaptions  := ReadBool('File system', 'DescCaptions', False);
    Simul4DOS   := ReadBool('File system', 'Simul4DOS', False);

    ConfirmCopyStart  := ReadBool('Confirmation', 'CopyStart', False);
    ConfirmMoveStart  := ReadBool('Confirmation', 'MoveStart', False);
    ConfirmDelStart   := ReadBool('Confirmation', 'DelStart', True);
    ConfirmCopyFile   := ReadBool('Confirmation', 'CopyFile', False);
    ConfirmMoveFile   := ReadBool('Confirmation', 'MoveFile', False);
    ConfirmDelFile    := ReadBool('Confirmation', 'DelFile', False);
    ConfirmReplace    := ReadBool('Confirmation', 'Replace', True);
    ConfirmProtect    := ReadBool('Confirmation', 'Protect', True);
    ConfirmCopyFolder := ReadBool('Confirmation', 'CopyFolder', False);
    ConfirmMoveFolder := ReadBool('Confirmation', 'MoveFolder', False);
    ConfirmDelFolder  := ReadBool('Confirmation', 'DelFolder', True);
    ConfirmNewAlias   := ReadBool('Confirmation', 'NewAlias', False);

    BackCopying  := ReadBool('Preferences', 'BackCopying', True);
    ShowHidSys   := ReadBool('Preferences', 'ShowHidSys', False);
    ShowList     := ReadBool('Preferences', 'ShowList', False);
    ProgDrop     := ReadBool('Preferences', 'ProgDrop', False);
    FindVersion  := ReadBool('Preferences', 'FindVersion', True);
    FindDlgIcons := ReadBool('Preferences', 'FindDlgIcons', True);
    RefreshFolders := ReadBool('Preferences', 'RefreshFolders', True);
    AliasArrows  := ReadBool('Preferences', 'AliasArrows', True);
    IgnoreCtrlD  := ReadBool('Preferences', 'IgnoreCtrlD', False);
    HintDesc     := ReadBool('Preferences', 'HintDesc', HintDesc);
    HintDate     := ReadBool('Preferences', 'HintDate', HintDate);
    HintTime     := ReadBool('Preferences', 'HintTime', HintTime);
    HintAttrib   := ReadBool('Preferences', 'HintAttrib', HintAttrib);

    InspectProg  := ReadString('Utilities', 'Inspect', '');
    DefaultProg  := ReadString('Utilities', 'Default', '');
    UndeleteProg := ReadString('Utilities', 'Undelete', '');
    DiskProg     := ReadString('Utilities', 'Disk', '');
  end;

  if BackCopying then @BackgroundProc := @FileMan.BackgroundProcess
  else @BackgroundProc := nil;
end;

procedure SaveFileSysProp;
begin
  with ini do begin
    WriteInteger('File system', 'DefaultSort', Integer(DefaultSort));
    WriteString('File system', 'IconStrings', IconStrings);
    WriteString('File system ', 'DefaultFilter', DefaultFilter);
    WriteBool('File system', 'FileHints', FileHints);
    WriteInteger('File system', 'HintDelay', HintDelay);
    WriteBool('File system', 'UseDescriptions', UseDescriptions);
    WriteBool('File system', 'DescCaptions', DescCaptions);
    WriteBool('File system', 'Simul4DOS', Simul4DOS);

    WriteBool('Confirmation', 'CopyStart', ConfirmCopyStart);
    WriteBool('Confirmation', 'MoveStart', ConfirmMoveStart);
    WriteBool('Confirmation', 'DelStart', ConfirmDelStart);
    WriteBool('Confirmation', 'CopyFile', ConfirmCopyFile);
    WriteBool('Confirmation', 'MoveFile', ConfirmMoveFile);
    WriteBool('Confirmation', 'DelFile', ConfirmDelFile);
    WriteBool('Confirmation', 'Replace', ConfirmReplace);
    WriteBool('Confirmation', 'Protect', ConfirmProtect);
    WriteBool('Confirmation', 'CopyFolder', ConfirmCopyFolder);
    WriteBool('Confirmation', 'MoveFolder', ConfirmMoveFolder);
    WriteBool('Confirmation', 'DelFolder', ConfirmDelFolder);
    WriteBool('Confirmation', 'NewAlias', ConfirmNewAlias);

    WriteBool('Preferences', 'BackCopying', BackCopying);
    WriteBool('Preferences', 'ShowHidSys', ShowHidSys);
    WriteBool('Preferences', 'ShowList', ShowList);
    WriteBool('Preferences', 'ProgDrop', ProgDrop);
    WriteBool('Preferences', 'FindVersion', FindVersion);
    WriteBool('Preferences', 'FindDlgIcons', FindDlgIcons);
    WriteBool('Preferences', 'RefreshFolders', RefreshFolders);
    WriteBool('Preferences', 'AliasArrows', AliasArrows);
    WriteBool('Preferences', 'IgnoreCtrlD', IgnoreCtrlD);
    WriteBool('Preferences', 'HintDesc', HintDesc);
    WriteBool('Preferences', 'HintDate', HintDate);
    WriteBool('Preferences', 'HintTime', HintTime);
    WriteBool('Preferences', 'HintAttrib', HintAttrib);

    WriteString('Utilities', 'Inspect', InspectProg);
    WriteString('Utilities', 'Default', DefaultProg);
    WriteString('Utilities', 'Undelete', UndeleteProg);
    WriteString('Utilities', 'Disk', DiskProg);
  end;
end;

{ Start menu properties }

procedure SaveStartProp;
begin
  with ini do begin
    WriteBool('Start menu', 'StartMenu3D', StartMenu3D);
    WriteBool('Start menu', 'BoldSelect', BoldSelect);
    WriteBool('Start menu', 'ShellStartup', ShellStartup);
    WriteBool('Start menu', 'StartMouseUp', StartMouseUp);
  end;
end;

procedure LoadStartProp;
begin
  with ini do begin
    StartMenu3D  := ReadBool('Start menu', 'StartMenu3D', True);
    BoldSelect := ReadBool('Start menu', 'BoldSelect', True);
    ShellStartup := ReadBool('Start menu', 'ShellStartup', False);
    StartMouseUp := ReadBool('Start menu', 'StartMouseUp', True);
    StartFile := ReadString('Start menu', 'Filename',
      ApplicationPath + 'start.ini');
  end;
end;

{ System properties }

procedure LoadSystemProp;
var
  c: TCalColor;
begin
  with ini do begin
    SysCaption := ReadString('System', 'Caption', 'System');
    ShowSplash := ReadBool('Preferences', 'ShowSplash', True);
    RestoreSys := ReadBool('Preferences', 'RestoreSys', False);
    SysWinQuit := ReadBool('Preferences', 'SysWinQuit', True);
    QueryQuit := ReadBool('Preferences', 'QueryQuit', True);
    MsgDialogSounds := ReadBool('Preferences', 'MsgDialogSounds', True);
    LoadTaskbar := ReadBool('Preferences', 'LoadTaskbar', True);
    TrackThumb := ReadBool('Preferences', 'TrackThumb', False);
    KeyBreak := ReadBool('Preferences', 'KeyBreak', False);

    for c := Low(TCalColor) to High(TCalColor) do
      Colors[c] := ReadColor(c);

    ReplaceBitmapColors(ShortArrow, clBlack, Colors[ccShortArrow]);
    ReplaceBitmapColors(AliasArrow, clBlack, Colors[ccAliasArrow]);
    ReplaceBitmapColors(SizeBox, clSilver, Colors[ccWinFrame]);

    BrowseGrid.X := ReadInteger('Display', 'BrowseGridX', 75);
    BrowseGrid.Y := ReadInteger('Display', 'BrowseGridY', 60);
    LineHeight := ReadInteger('Display', 'LineHeight', 16);
  end;
end;

procedure SaveSystemProp;
var
  c: TCalColor;
begin
  with ini do begin
    WriteString('System', 'Caption', SysCaption);
    WriteBool('Preferences', 'ShowSplash', ShowSplash);
    WriteBool('Preferences', 'RestoreSys', RestoreSys);
    WriteBool('Preferences', 'SysWinQuit', SysWinQuit);
    WriteBool('Preferences', 'QueryQuit', QueryQuit);
    WriteBool('Preferences', 'MsgDialogSounds', MsgDialogSounds);
    WriteBool('Preferences', 'LoadTaskbar', LoadTaskbar);
    WriteBool('Preferences', 'TrackThumb', TrackThumb);
    WriteBool('Preferences', 'KeyBreak', KeyBreak);

    for c := Low(TCalColor) to High(TCalColor) do
      WriteString('Colors', ColorNames[c], ColorToString(Colors[c]));;

    WriteInteger('Display', 'BrowseGridX', BrowseGrid.X);
    WriteInteger('Display', 'BrowseGridY', BrowseGrid.Y );
    WriteInteger('Display', 'LineHeight', LineHeight);
  end;
end;

{ Taskbar properties }

procedure LoadTaskProp;
begin
  with ini do begin
    StayVisible := ReadBool('Taskbar', 'StayVisible', True);
    Highlight   := ReadBool('Taskbar', 'Highlight', True);
    ShrinkMax   := ReadBool('Taskbar', 'ShrinkMax', True);
    Clock24     := ReadBool('Taskbar', 'Clock24', True);
    PopupRes    := ReadBool('Taskbar', 'PopupRes', True);
    PopupDate   := ReadBool('Taskbar', 'PopupDate', True);
    Animate     := ReadBool('Taskbar', 'Animate', True);
    ButtonHints := ReadBool('Taskbar', 'ButtonHints', True);
    ArrangeMin  := ReadBool('Taskbar', 'ArrangeMin', True);
    HideMinApps := ReadBool('Taskbar', 'MideMinApps', True);
    IconWindowTask := ReadBool('Taskbar', 'IconWindowTask', True);
    ExplorerTask := ReadBool('Taskbar', 'ExplorerTask', True);
    CalIcons := ReadBool('Taskbar', 'CalIcons', True);
    FullFolderPath := ReadBool('Taskbar', 'FullFolderPath', False);
    DocNameFirst := ReadBool('Taskbar', 'DocNameFirst', True);
    DocNameLower := ReadBool('Taskbar', 'DocNameLower', True);
    MinAppHeight := ReadInteger('Taskbar', 'MinAppHeight', 60);
  end;
end;


procedure SaveTaskProp;
begin
  with ini do begin
    WriteBool('Taskbar', 'StayVisible', StayVisible);
    WriteBool('Taskbar', 'Highlight', Highlight);
    WriteBool('Taskbar', 'ShrinkMax', ShrinkMax);
    WriteBool('Taskbar', 'Clock24', Clock24);
    WriteBool('Taskbar', 'PopupRes', PopupRes);
    WriteBool('Taskbar', 'PopupDate', PopupDate);
    WriteBool('Taskbar', 'Animate', Animate);
    WriteBool('Taskbar', 'ButtonHints', ButtonHints);
    WriteBool('Taskbar', 'ArrangeMin', ArrangeMin);
    WriteBool('Taskbar', 'MideMinApps', HideMinApps);
    WriteBool('Taskbar', 'IconWindowTask', IconWindowTask);
    WriteBool('Taskbar', 'ExplorerTask', ExplorerTask);
    WriteBool('Taskbar', 'FullFolderPath', FullFolderPath);
    WriteBool('Taskbar', 'CalIcons', CalIcons);
    WriteBool('Taskbar', 'DocNameFirst', DocNameFirst);
    WriteBool('Taskbar', 'DocNameLower', DocNameLower);
  end;
end;


procedure AnnounceSettingsChanged(changes: TSettingChanges);
var
  i: Integer;
begin
  if scINIFile in changes then LoadSettings;

  { Notify taskbar of updates }
  if [scINIFile, scTaskbar] * changes <> [] then
    if TaskbarWindow > 0 then
      PostMessage(TaskBarWnd, WM_CALMIRA, CM_TASKCONFIG, 0);

  if scDisplay in changes then begin
    ShortArrow.Reload;
    AliasArrow.Reload;
    SizeBox.Reload;
    ReplaceBitmapColors(ShortArrow, clBlack, Colors[ccShortArrow]);
    ReplaceBitmapColors(AliasArrow, clBlack, Colors[ccAliasArrow]);
    ReplaceBitmapColors(SizeBox, clSilver, Colors[ccWinFrame]);
  end;

  if scFileSystem in changes then
    if BackCopying then @BackgroundProc := @FileMan.BackgroundProcess
    else @BackgroundProc := nil;

  StartMenu.Configure;

  with Screen do
    for i := 0 to FormCount-1 do
      PostMessage(Forms[i].Handle, WM_SETTINGSCHANGED, Word(Changes), 0);
end;



procedure InitSettings;
begin
  ini := TProfile.Create(ApplicationPath + 'CALMIRA.INI');
  Sounds := TStringList.Create;
  KeyMaps := TStringList.Create;
  WindowPos := TStringList.Create;
  DriveNames := TStringList.Create;
  GlobalFont := TFont.Create;
end;


procedure DoneSettings; far;
begin
  Sounds.Free;
  KeyMaps.Free;
  WindowPos.Free;
  DriveNames.Free;
  ini.Free;
  GlobalFont.Free;
end;


initialization
  InitSettings;
  AddExitProc(DoneSettings);
end.
