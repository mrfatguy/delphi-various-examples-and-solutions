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

unit Sys;

{ System Window unit

  This form is the "acting" main form, even though Application.MainForm
  actually points to the splash screen.  TSysWindow handles system
  messages and other operations which are global to Calmira.  Desktop
  interaction is handled here too but most tasks are delegated to
  TDesktop to perform.
}


interface

uses
  SysUtils, WinTypes, Messages, Classes, Controls, Forms, Dialogs,
  Iconic, Menus, DragDrop, Dropclnt, Multigrd, DropServ, CalMsgs,
  Grids, Start, Apholder, ObjList, CalForm, DdeMan, FormDrag, Settings,
  Sysmenu;

type
  TSysWindow = class(TCalForm)
    WindowMenu: TPopupMenu;
    About: TMenuItem;
    HelpContents: TMenuItem;
    Find: TMenuItem;
    Grid: TMultiGrid;
    App: TAppHolder;
    DropServer: TDropServer;
    RefreshSys: TMenuItem;
    Dragger: TFormDrag;
    DesktopMenu: TPopupMenu;
    DeskProperties: TMenuItem;
    DeskArrange: TMenuItem;
    DeskClear: TMenuItem;
    DeskClose: TMenuItem;
    ConfigFileSystem: TMenuItem;
    ConfigDesktop: TMenuItem;
    ConfigStartMenu: TMenuItem;
    ConfigBin: TMenuItem;
    ConfigTaskbar: TMenuItem;
    ObjectMenu: TPopupMenu;
    Properties: TMenuItem;
    CreateAlias: TMenuItem;
    SysProperties: TMenuItem;
    CascadeWins: TMenuItem;
    Snap: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    TopicSearch: TMenuItem;
    N5: TMenuItem;
    DeskFind: TMenuItem;
    DeskRun: TMenuItem;
    Run: TMenuItem;
    DeskOpen: TMenuItem;
    SystemMenu: TSystemMenu;
    DeskExplore: TMenuItem;
    MinimizeProgs: TMenuItem;
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure CreateAliasClick(Sender: TObject);
    procedure PropertiesClick(Sender: TObject);
    procedure AboutClick(Sender: TObject);
    procedure HelpContentsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FindClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridDrawCell(Sender: TObject; Index: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure GridSelectCell(Sender: TObject; Index: Integer;
      var CanSelect: Boolean);
    procedure DropServerFileDrag(Sender: TObject; X, Y: Integer;
      Target: Word; var Accept: Boolean);
    procedure GridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DropServerDeskDrop(Sender: TObject; X, Y: Integer;
      Target: Word);
    procedure AppException(Sender: TObject; E: Exception);
    procedure AppShowHint(var HintStr: OpenString; var CanShow: Boolean;
      var HintInfo: THintInfo);
    procedure GridMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure AppMessage(var Msg: TMsg; var Handled: Boolean);
    procedure GridEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure AppActivate(Sender: TObject);
    procedure AppDeactivate(Sender: TObject);
    procedure RefreshSysClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure DeskPropertiesClick(Sender: TObject);
    procedure DeskArrangeClick(Sender: TObject);
    procedure DeskClearClick(Sender: TObject);
    procedure DeskCloseClick(Sender: TObject);
    procedure ConfigDesktopClick(Sender: TObject);
    procedure ConfigStartMenuClick(Sender: TObject);
    procedure ConfigBinClick(Sender: TObject);
    procedure ConfigTaskbarClick(Sender: TObject);
    procedure ConfigFileSystemClick(Sender: TObject);
    procedure ObjectMenuPopup(Sender: TObject);
    procedure SysPropertiesClick(Sender: TObject);
    procedure CascadeWinsClick(Sender: TObject);
    procedure SnapClick(Sender: TObject);
    procedure TopicSearchClick(Sender: TObject);
    function AppWndProc(var Message: TMessage): Boolean;
    procedure DeskOpenClick(Sender: TObject);
    procedure AppActiveFormChange(Sender: TObject);
    procedure RunClick(Sender: TObject);
    procedure DeskRunClick(Sender: TObject);
    procedure DeskExploreClick(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure MinimizeProgsClick(Sender: TObject);
  private
    { Private declarations }
    Selected : TIconic;
    FItems : TObjectList;
    procedure WMSysCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;
    procedure WMCommand(var Msg: TWMCommand);   message WM_COMMAND;
    procedure WMNCRButtonDown(var Msg: TWMNCRButtonDown); message WM_NCRBUTTONDOWN;
    procedure WMDeskMenu(var Msg: TMessage); message WM_DESKMENU;
    procedure StartMacro(Sender : TObject; const macro, params : string);
  public
    procedure Configure;
    procedure ReadINISettings;
    procedure SettingsChanged(Changes : TSettingChanges); override;
    procedure KeyCommand(const title : string);
    property Items: TObjectList read FItems;
  end;

const
  { Custom system menu commands }

  SC_ARRANGEICONS    = SC_VSCROLL + 1000;
  SC_CLEARDESKTOP    = SC_VSCROLL + 1001;
  SC_CLOSEBROWSERS   = SC_VSCROLL + 1002;
  SC_ABOUT           = SC_VSCROLL + 1003;
  SC_CASCADEBROWSERS = SC_VSCROLL + 1004;
  SC_LINEUPICONS     = SC_VSCROLL + 1005;

var
  SysWindow: TSysWindow;
  LastErrorMode: Integer;


implementation

{$R *.DFM}

uses Desk, Shorts, DiskProp, Directry, About, IconWin, WinProcs, Drives,
  FileFind, IniFiles, Resource, Strings, MiscUtil, Files, FileMan, Environs,
  WasteBin, FileCtrl, Graphics, Tree, ShutDown, RunProg, Referenc, ChkList,
  ShellAPI, StrtProp, DeskProp, TaskProp, SysProp, FSysProp, Debug;

{ The taskbar module uses WndHooks.dll, but Calmira needs to as well.
  When Calmira is the shell, Windows looks in the current directory
  and the DOS search path for any implicitly referenced DLLs.  This
  means that Calmira's home dir must be added to the search path,
  which wastes valuable path space.

  To remedy this, we load WndHooks.dll explicitly using the LoadLibrary
  function, which can be told where to look for a DLL.  It involves
  a bit more coding but is well worth it.
}

var
  { DLL module instance and procedure pointers }
  WndHookDLL: THandle;
  SetDesktopHook : procedure(CallBack: HWND);
  ReleaseDesktopHook : procedure;
  SetRCloseEnabled : procedure(Enable: Boolean);


{ This unit is responsible for opening various non-modal windows.
  Inconsistencies will arise if non-modal icon windows are opened while
  a modal dialog is showing, so the IsDialogModal function is used. }

function IsDialogModal : Boolean;
begin
  Result := not IsWindowEnabled(Application.MainForm.Handle);
end;

function CheckDialogModal: Boolean;
var Msg : string[127];
begin
  Result := IsDialogModal;
  if Result then begin
    if Screen.ActiveForm = nil then
      Msg := 'Please close Calmira''s active dialog box first'
    else
      Msg := Format('Please close the "%s" dialog first', [Screen.ActiveForm.Caption]);
    MsgDialog(Msg, mtInformation, [mbOK], 0);
  end;
end;


procedure TSysWindow.FormDestroy(Sender: TObject);
begin
  ReleaseDesktopHook;
  FItems.Free;
  FreeLibrary(WndHookDLL);
end;


procedure TSysWindow.FormResize(Sender: TObject);
begin
  Grid.Width := ClientWidth - 8;
  Grid.Height := ClientHeight - 8;
  Grid.SizeGrid;
  Selected := nil;
  Invalidate;
end;


procedure TSysWindow.GridDblClick(Sender: TObject);
begin
  if Selected <> nil then Selected.Open;
end;


procedure TSysWindow.CreateAliasClick(Sender: TObject);
var
  filename : TFilename;
begin
  if Selected is TDrive then
    filename := 'c:\drive' + LowCase(TDrive(Selected).Letter) + '.als'
  else
    filename := ChangeFileExt(TProgram(Selected).Filename, '.als');

  if InputQuery('Create alias', 'Alias filename', filename) then
    Selected.WriteAlias(Lowercase(filename));
end;


procedure TSysWindow.PropertiesClick(Sender: TObject);
begin
  if Selected is TDrive then DiskPropExecute(TDrive(Selected).Letter);
end;


procedure TSysWindow.AboutClick(Sender: TObject);
begin
  ShowModalDialog(TAboutBox);
end;


procedure TSysWindow.AppException(Sender: TObject; E: Exception);
begin
  { Use MessageDialog to display exception messages because
    the forms look nicer in a small font }
  MsgDialog(E.Message, mtError, [mbOK], E.HelpContext);
end;


procedure TSysWindow.WMSysCommand(var Msg: TWMSysCommand);
begin
  case Msg.CmdType of
    SC_ABOUT         : About.Click;
    SC_ARRANGEICONS  : DeskArrange.Click;
    SC_CLEARDESKTOP  : DeskClear.Click;
    SC_CLOSEBROWSERS : DeskClose.Click;
    SC_CASCADEBROWSERS : CascadeWins.Click;
    SC_LINEUPICONS : Snap.Click;
  end;
  inherited;
end;


procedure TSysWindow.WMCommand(var Msg: TWMCommand);
var item: TMenuItem;
begin
  item := StartMenu.FindItem(Msg.ItemID, fkCommand);
  if item <> nil then item.Click;
  inherited;
end;


procedure TSysWindow.HelpContentsClick(Sender: TObject);
begin
   Application.HelpJump('Contents');
end;


procedure TSysWindow.FormCreate(Sender: TObject);
var
  i: Integer;
  buf : array[0..79] of Char;
begin
  { Load the Windows hook DLL and obtain pointers to the procedures we need }
  WndHookDLL := LoadLibrary(StrPCopy(buf, ApplicationPath + 'WNDHOOKS.DLL'));
  @SetDesktopHook     := GetProcAddress(WndHookDLL, 'SETDESKTOPHOOK');
  @ReleaseDesktopHook := GetProcAddress(WndHookDLL, 'RELEASEDESKTOPHOOK');
  @SetRCloseEnabled   := GetProcAddress(WndHookDLL, 'SETRCLOSEENABLED');

  Icon.Assign(Icons.Get('System'));

  FItems := TObjectList.Create;
  AppActivate(self);

  with SystemMenu do begin
    AddSeparator;
    Add('Cascade browsers', SC_CASCADEBROWSERS);
    Add('Arrange icons', SC_ARRANGEICONS);
    Add('Line up icons', SC_LINEUPICONS);
    Add('Close browsers', SC_CLOSEBROWSERS);
    Add('Clear desktop', SC_CLEARDESKTOP);
    AddSeparator;
    Add('About...', SC_ABOUT);
    DeleteCommand(SC_SIZE);
  end;

  StartMenu.OnStartMacro := StartMacro;

  ReadINISettings;
  Configure;
  LoadPosition(ini, 'System');
  Resize;
  Update;
end;

procedure TSysWindow.ReadINISettings;
begin
  RefreshSys.Click;
end;

procedure TSysWindow.Configure;
begin
  Caption := SysCaption;
  Color := Colors[ccWinFrame];
  Font.Assign(GlobalFont);

  with Grid do begin
    Visible := False;
    Color := Colors[ccIconBack];
    SelColor := Colors[ccIconSel];
    DefaultColWidth := BrowseGrid.X;
    DefaultRowHeight := BrowseGrid.Y;
    Font.Assign(GlobalFont);
    Canvas.Font.Assign(Font);
    Visible := True;
  end;

  with Dragger do begin
    Hollow := HollowDrag;
    MinWidth := BrowseGrid.X + XSpare;
    MinHeight := BrowseGrid.Y + XSpare;
  end;

  if ShowDeskMenu then SetDesktopHook(Handle)
  else ReleaseDesktopHook;

  SetRCloseEnabled(RightClose);
end;


procedure TSysWindow.FindClick(Sender: TObject);
var s: TFilename;
begin
  if CheckDialogModal then Exit;
  GetDir(0, s);
  FileFindExecute(Copy(s, 1, 3), 0);
end;


procedure TSysWindow.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if SysWinQuit then begin
    { save the desktop before it's too late! }
    Desktop.Save;

    if IsShell then begin
      { Always ask before a shell is closed down.  The InSendMessage is
        there for a reason: a slight problem arises when Windows Setup tries
        to restart Windows -- the call to ExitWindows returns false, so
        Calmira doesn't quit and Setup backs off.  The trick is to detect
        when Setup is the "caller" using InSendMessage
      }

      CanClose := MsgDialog('This will end your Windows session.',
        mtInformation, [mbOK, mbCancel], 0) = mrOK;
      if CanClose and not InSendMessage then CanClose := Bool(ExitWindows(0, 0));
    end

    else
      CanClose := not QueryQuit or
       (MsgDialog('Are you sure you want to close Calmira?', mtConfirmation,
         [mbYes, mbNo], 0) = mrYes);
  end;
end;

procedure TSysWindow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if SysWinQuit then Application.Terminate
  else Action := caMinimize;
end;


procedure TSysWindow.WMNCRButtonDown(var Msg: TWMNCRButtonDown);
begin
  with Msg do
    if (WindowState = wsMinimized) or (HitTest = HTSYSMENU) then
      StartMenu.Popup(XCursor, YCursor, False)
    else
      inherited;
end;


procedure TSysWindow.GridDrawCell(Sender: TObject; Index: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if Index < FItems.Count then TIconic(FItems[Index]).Draw(Grid.Canvas, Rect);
end;


procedure TSysWindow.GridSelectCell(Sender: TObject; Index: Integer;
  var CanSelect: Boolean);
begin
   CanSelect := Index < FItems.Count;
   if CanSelect then Selected := TIconic(FItems[Index]) else Selected := nil;
end;


procedure TSysWindow.DropServerFileDrag(Sender: TObject; X, Y: Integer;
  Target: Word; var Accept: Boolean);
begin
  Accept := Target = GetDesktopWindow;
end;


procedure TSysWindow.GridMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  i: Integer;
  p: TPoint;
  rect : TRect;
begin
  if Button = mbLeft then begin
    if Selected <> nil then Grid.BeginDrag(False)
  end
  else begin
    { popup one of the menus depending on whether the cursor
      is directly over an icon }
    i := Grid.MouseToCell(X, Y);
    rect := Grid.CellBounds(i);
    InflateRect(rect, -16, -8);
    OffsetRect(rect, 0, -8);
    GetCursorPos(p);

    if PtInRect(rect, Point(x, y)) and (i < Items.Count) then begin
      Grid.Select(i);
      ObjectMenu.Popup(p.x, p.y)
    end
    else
      WindowMenu.Popup(p.X, p.Y);
  end;
end;


procedure TSysWindow.DropServerDeskDrop(Sender: TObject; X, Y: Integer;
  Target: Word);
begin
  Selected.CreateShortcut.MinPosition := Point(X - 16, Y - 16);
end;


procedure TSysWindow.AppShowHint(var HintStr: OpenString;
  var CanShow: Boolean; var HintInfo: THintInfo);
var
  f : TDirItem;
  w : TIconWindow;
  i : Integer;
begin
  { Handles popup file hints.  A hint is shown only when there
    is no dragging taking place, otherwise the hint window will
    interfere with the focus rect.  The hint is shown slightly
    above the cursor and is forced to hide or change once the
    cursor leaves the current cell.
  }

  with HintInfo do
    if (HintControl is TMultiGrid) and FileHints then
      with TMultiGrid(HintControl) do begin
        if not (Owner is TIconWindow) then Exit;
        w := TIconWindow(Owner);
        if (GetCaptureControl <> nil) or w.ViewList.Checked then Exit;
        f := w.FileAt(CursorPos.X, CursorPos.Y, True);
        CanShow := f <> nil;
        if not CanShow then Exit;
        CursorRect := CellBounds(MouseToCell(CursorPos.X, CursorPos.Y));
        with ClientToScreen(CursorPos) do HintPos := Point(X, Y - 24);
        HintStr := f.Hint;
      end

    else if HintControl is TCheckList then
      with TCheckList(HintControl) do begin
        i := ItemAtPos(CursorPos, False);
        if (i < 0) or (i >= Hints.Count) then Exit;
        HintStr := Hints[i];
        CursorRect := ItemRect(i);
      end;
end;


procedure TSysWindow.GridMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if Grid.Dragging and DropServer.CanDrop and AnimCursor then
    SetCursor(Screen.Cursors[crFlutter])
end;


function CouldBeFolder(const s: string): Boolean;
begin
  Result := (s[1] in Alphas) and (s[2] = ':') and (s[3] = '\');
end;


function EnumTitleProc(Wnd : HWND; caption: PString):Bool; export;
var
  buf: TCaption;
begin
  Result := True;
  buf[0] := Chr(GetWindowText(Wnd, @buf[1], 78));
  if CompareText(buf, caption^) = 0 then begin
    SendMessage(Wnd, WM_ACTIVATE, WA_ACTIVE, MakeLong(Wnd, Word(True)));
    if IsIconic(Wnd) then ShowWindow(Wnd, SW_RESTORE)
    else BringWindowToTop(Wnd);
    Result := False;
  end
end;


procedure TSysWindow.KeyCommand(const title : string);
var
  i : Integer;
  f : TForm;
  item : TMenuItem;
begin
  { First look for a matching form caption }
  with Screen do
  for i := 0 to FormCount-1 do begin
    f := Forms[i];
    if CompareText(f.Caption, title) = 0 then begin
      if f is TShort then
        f.Perform(WM_OPENSHORT, 0, 0)
      else if f.Visible and f.Enabled then begin
        f.WindowState := wsNormal;
        f.BringToFront;
      end;
      Exit;
    end;
  end;

  item := StartMenu.Find(title, False);
  if item <> nil then
    item.Click
  else if CouldBeFolder(title) and HDirectoryExists(title) then
    Desktop.OpenFolder(title)
  else
    EnumWindows(@EnumTitleProc, Longint(@title));
end;


procedure TSysWindow.AppMessage(var Msg: TMsg; var Handled: Boolean);
var
  Shift : TShiftState;
  i : Integer;
begin
  with Msg do
    case Message of
    WM_CLOSE:
      if Msg.HWnd = Application.Handle then begin
        { The program has been closed from the taskbar or Task Manager }
        Desktop.Save;
        if IsShell then begin
          Handled := True;
          if MsgDialog('This will end your Windows session.',
             mtInformation, [mbOK, mbCancel], 0) = mrOK then ExitWindows(0, 0);
        end;
      end;

    WM_DROPFILES :
      TDropClient.CheckMessage(Msg, Handled);

    WM_KEYDOWN :
      { Check for keyboard shortcuts.  Exceptions must be handled explicitly,
        otherwise the program will be terminated by the Delphi RTL }

      if not IsDialogModal then
      try
        Shift := KeyDataToShiftState(Msg.lParam);

        if (Msg.wParam = VK_TAB) and (Shift = [ssCtrl]) then
          Desktop.NextForm

        else if (ssCtrl in Shift) and (ssAlt in Shift) then begin
          i := KeyMaps.IndexOfObject(TObject(Shortcut(Msg.wParam, Shift)));
          if i > -1 then KeyCommand(KeyMaps[i]);
        end;
      except
        on E: Exception do Application.HandleException(E);
      end;

    $C000..$FFFF : { registered messages }
      if Message = WM_CALMIRA then begin
        case wParam of
          CM_PREVINSTANCE: begin
                             BringToFront;
                             WindowState := wsNormal;
                           end;
          CM_STARTMENU  :  with TPoint(lParam) do begin
                             StartMenu.Popup(X, Y - StartMenu.Height, not StartMouseUp);
                             PostMessage(TaskbarWindow, WM_CALMIRA, CM_STARTCLOSE, 0);
                           end;
          CM_EXPLORER    : OpenExplorer('');
          CM_ARRANGEICONS: Desktop.ArrangeIcons;
          CM_STARTPROP   : ConfigStartMenu.Click;
          CM_TASKPROP    : ConfigTaskbar.Click;
        end;
        Handled := True;
      end;
    end;
end;


procedure TSysWindow.GridEndDrag(Sender, Target: TObject; X, Y: Integer);
begin
  DropServer.DragFinished;
end;


const
  CommandList : array[0..11] of string[23] =
    ({0}'$FOLDER', {1}'$SYSTEM', {2}'$RUN', {3}'$EXPLORE', {4}'$FIND',
     {5}'$SHUTDOWN', {6}'$SYSTEMPROP', {7}'$DESKTOPPROP',
     {8}'$FILESYSTEMPROP', {9}'$TASKBARPROP', {10}'$BINPROP',
     {11}'$STARTMENUPROP');

function FindCommand(const s: string): Integer;
begin
  for Result := 0 to High(CommandList) do
    if CommandList[Result] = s then Exit;
  Result := -1;
end;

procedure TSysWindow.StartMacro(Sender : TObject; const macro, params : string);
var
  foldername: TFilename;
  filespec : string[12];
  l, t, w, h: Integer;
  IconWindow : TIconWindow;
begin
  if not CheckDialogModal then
  case FindCommand(Uppercase(macro)) of
   0: begin
        if params = '' then begin
          DeskOpen.Click;
          Exit;
        end;

        if (Pos('*', params) > 0) or (Pos('?', params) > 0) then begin
          filespec := ExtractFilename(params);
          foldername := ExtractFileDir(params);
        end
        else begin
          filespec := DefaultFilter;
          foldername := params;
        end;

        IconWindow := Desktop.WindowOf(foldername);
        if IconWindow = nil then
          TIconWindow.Init(Application, foldername, filespec).Show
        else with IconWindow do begin
          Dir.Filter := filespec;
          RefreshWin;
          ShowNormal;
        end;
      end;
   1: ShowNormal;
   2: RunExecute('');
   3: OpenExplorer('');
   4: Find.Click;
   5: ShowModalDialog(TQuitDlg);
   6: SysProperties.Click;
   7: ConfigDesktop.Click;
   8: ConfigFileSystem.Click;
   9: ConfigTaskbar.Click;
   10: ConfigBin.Click;
   11: ConfigStartMenu.Click;
  else
    MsgDialog(Format('Unknown command "%s"', [macro]), mtError, [mbOK], 0);
  end;
end;


function ProvideLastIcon(Instance : Word) : HIcon;
begin
  { If the last program the user executed matches the given instance
    handle, then an icon is extracted if the user specified a
    particular one }

  Result := 0;

  if CalIcons and (Instance = LastInstance) then begin
    if LastIconFile > '' then
      Result := ExtractIcon(HInstance, StringAsPChar(LastIconFile), LastIconIndex);
    LastInstance := 0;
    LastIconFile := '';
    LastIconIndex := 0;
  end
end;


procedure TSysWindow.AppActivate(Sender: TObject);
begin
  LastErrorMode := SetErrorMode(SEM_FAILCRITICALERRORS);
end;

procedure TSysWindow.AppDeactivate(Sender: TObject);
begin
  SetErrorMode(LastErrorMode);
end;


procedure TSysWindow.RefreshSysClick(Sender: TObject);
var
  drive : Char;
  progs : TStringList;
  i: Integer;
  progname : TFilename;
  p : TProgram;
begin
  Selected := nil;
  FItems.ClearObjects;

  { Add the disk drives }
  for drive := 'A' to 'Z' do
    if drive in ValidDrives then FItems.Add(TDrive.Create(drive));

  { Add the program "shortcuts" }
  progs := TStringList.Create;
  try
    ini.ReadSection('Programs', progs);

    for i := 0 to progs.Count-1 do begin
      progname := progs[i];
      if ExtractFilePath(progname) = ''
        then progname := ApplicationPath + progname;
      if FileExists(progname) then begin
        p := TProgram.Create(progname);
        p.Caption := ini.ReadString('Programs', progs[i], ExtractFilename(progs[i]));
        FItems.Add(p);
      end;
    end;
  finally
    progs.Free;
  end;

  with Grid do begin
    Reset;
    Limit := FItems.Count;
    SizeGrid;
    Focus := 0;
  end;
  Invalidate;
end;


procedure TSysWindow.FormPaint(Sender: TObject);
begin
  Border3D(Canvas, ClientWidth-1, ClientHeight-1);
end;


procedure TSysWindow.WMDeskMenu(var Msg: TMessage);
begin
  with TPoint(Msg.lParam) do DesktopMenu.Popup(X, Y);
end;


procedure TSysWindow.DeskPropertiesClick(Sender: TObject);
begin
  ConfigDesktop.Click;
end;


procedure TSysWindow.DeskArrangeClick(Sender: TObject);
begin
  Desktop.ArrangeIcons;
end;


procedure TSysWindow.DeskClearClick(Sender: TObject);
begin
  if not CheckDialogModal then Application.Minimize;
end;


procedure TSysWindow.DeskCloseClick(Sender: TObject);
begin
  if not CheckDialogModal then Desktop.CloseWindows;
end;


procedure TSysWindow.ConfigDesktopClick(Sender: TObject);
begin
  if not CheckDialogModal then ShowModalDialog(TDeskPropDlg);
end;


procedure TSysWindow.ConfigStartMenuClick(Sender: TObject);
begin
  if CheckDialogModal then Exit;
  if StartPropDlg = nil then
    StartPropDlg := TStartPropDlg.Create(Application);
  StartPropDlg.Show;
end;


procedure TSysWindow.ConfigBinClick(Sender: TObject);
begin
  Bin.Properties.Click;
end;


procedure TSysWindow.ConfigTaskbarClick(Sender: TObject);
begin
  ShowModalDialog(TTaskPropDlg);
end;


procedure TSysWindow.ConfigFileSystemClick(Sender: TObject);
begin
  ShowModalDialog(TFileSysPropDlg);
end;


procedure TSysWindow.ObjectMenuPopup(Sender: TObject);
begin
  CreateAlias.Enabled := Selected <> nil;
  Properties.Enabled := Selected is TDrive;
end;


procedure TSysWindow.SysPropertiesClick(Sender: TObject);
begin
  ShowModalDialog(TSysPropDlg);
end;


procedure TSysWindow.CascadeWinsClick(Sender: TObject);
begin
  if not CheckDialogModal then Desktop.Cascade;
end;


procedure TSysWindow.SnapClick(Sender: TObject);
begin
  Desktop.SnapToGrid;
end;


procedure TSysWindow.TopicSearchClick(Sender: TObject);
const
  EmptyString : PChar = '';
begin
  Application.HelpCommand(HELP_PARTIALKEY, Longint(EmptyString));
end;


function TSysWindow.AppWndProc(var Message: TMessage): Boolean;
begin
  AppWndProc := False;

  with Message do
    if (Msg = WM_ENDSESSION) and Bool(wParam) then
      Desktop.Save
    else if (Msg = WM_CALMIRA) and (wParam = CM_GETTASKICON) then begin
      Result := ProvideLastIcon(lParam);
      AppWndProc := True;
    end;
end;



procedure TSysWindow.SettingsChanged(Changes : TSettingChanges);
begin
  if [scSystem, scFileSystem, scDesktop, scDisplay] * Changes <> [] then
    Configure;

  if [scDevices, scINIFile] * Changes <> [] then RefreshSys.Click;
end;


procedure TSysWindow.DeskOpenClick(Sender: TObject);
var
  s: TFilename;
begin
  if CheckDialogModal then Exit;
  s := '';
  if InputQuery('Open folder', 'Folder name', s) then
    Desktop.OpenFolder(ExpandFilename(s));
end;


procedure TSysWindow.AppActiveFormChange(Sender: TObject);
var s: TCaption;
begin
  if ComponentState <> [] then Exit;

  if Screen.ActiveForm is TIconWindow then begin
    s := Screen.ActiveForm.Caption;
    Environment.Values['CURRENTFOLDER'] := s;
    Environment.Values['CURRENTDRIVE'] := s[1];
  end
  else begin
    Environment.Values['CURRENTFOLDER'] := '';
    Environment.Values['CURRENTDRIVE'] := '';
  end;
end;


procedure TSysWindow.RunClick(Sender: TObject);
begin
  if CheckDialogModal then Exit;
  RunExecute('');
end;

procedure TSysWindow.DeskRunClick(Sender: TObject);
begin
  if not CheckDialogModal then RunExecute('');
end;

procedure TSysWindow.DeskExploreClick(Sender: TObject);
begin
  if not CheckDialogModal then OpenExplorer('');
end;

procedure TSysWindow.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  item: TMenuItem;
begin
  item := WindowMenu.FindItem(Shortcut(Key, Shift), fkShortcut);
  if item <> nil then item.Click;
end;

procedure TSysWindow.FormDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := (Source is TMultiGrid) and (TMultiGrid(Source).Owner is TIconWindow);
end;

procedure TSysWindow.FormDragDrop(Sender, Source: TObject; X, Y: Integer);
var i: Integer;
begin
  with ((Source as TMultiGrid).Owner as TIconWindow).CompileSelection(False) do
    for i := 0 to Count-1 do
      with  TDirItem(Items[i]) do
        NewStartItems.Values[GetTitle] := GetStartInfo;
end;

procedure TSysWindow.MinimizeProgsClick(Sender: TObject);
begin
  PostMessage(TaskbarWindow, WM_CALMIRA, CM_MINIMIZEALL, 0);
end;

end.
