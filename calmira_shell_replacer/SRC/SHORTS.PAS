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

unit Shorts;

{ Shortcuts are implemented as ordinary forms that stay minimized.
  Each shortcut contains a TReference which handles the interaction
  with the main engine.  TDesktop is responsible for loading and
  saving shortcuts }

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Controls,
  Forms, Dialogs, Dropclnt, DragDrop, IniFiles, Referenc, CalForm, CalMsgs,
  Sysmenu, Settings;

const
  SC_PROPERTIES = SC_VSCROLL + 99;

type
  TShort = class(TCalForm)
    DropClient: TDropClient;
    SystemMenu: TSystemMenu;
    procedure FormDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DropClientDropFiles(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FRef : TReference;
    LastMouseDown : Longint;
    procedure WMQueryOpen(var Msg: TWMQueryOpen); message WM_QUERYOPEN;
    procedure WMOpenShort(var Msg : TMsg); message WM_OPENSHORT;
    procedure WMSysCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;
    procedure WMPaint(var Msg: TWMPaint); message WM_PAINT;
    procedure WMMouseActivate(var Msg : TWMMouseActivate); message WM_MOUSEACTIVATE;
    procedure RefChange(Sender : TObject);
  public
    { Public declarations }
    procedure SettingsChanged(Changes : TSettingChanges); override;
    property Ref : TReference read FRef;
    procedure LoadFromIni(ini : TIniFile; const section:  string);
    procedure SaveToIni(ini : TIniFile; const section : string);
  end;


implementation

{$R *.DFM}

uses Desk, Resource, IconWin, ShellAPI, FileMan, MultiGrd, WasteBin,
  FileFind, Drives, Files, Strings, MiscUtil, Sys, Graphics;

const QueryClose : Boolean = False;

procedure TShort.WMQueryOpen(var Msg: TWMQueryOpen);
begin
  { New windows cannot be opened when inside SendMessage, so
    an extra message must be posted to remind the shortcut to open.
    0 is returned to keep the shortcut iconic }
  Msg.Result := 0;
  PostMessage(Handle, WM_OPENSHORT, 0, 0);
end;


procedure TShort.WMOpenShort(var Msg : TMsg);
begin
  Ref.Open;
end;


procedure TShort.WMSysCommand(var Msg: TWMSysCommand);
begin
  if Msg.CmdType = SC_CLOSE then
    QueryClose := True
  else if Msg.CmdType = SC_PROPERTIES then
    Ref.Edit;

  inherited;
  QueryClose := False;
end;


procedure TShort.FormDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  Ref.DragDrop(Source);
end;


procedure TShort.FormDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := (Source <> SysWindow.Grid) and ((Source <> Bin.Listbox) or
    (Ref.Kind <> rkFile));
end;


procedure TShort.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;


procedure TShort.FormCreate(Sender: TObject);
begin
  with SystemMenu do begin
    Insert(6, 'Properties...', SC_PROPERTIES);
    Rename(SC_RESTORE, 'Open');
    Rename(SC_CLOSE, 'Remove');
    DeleteCommand(SC_SIZE);
    DeleteCommand(SC_MINIMIZE);
    DeleteCommand(SC_MAXIMIZE);
    DeleteCommand(SC_TASKLIST);
    Delete(5);
  end;

  FRef := TShortcutReference.Create;
  FRef.OnChange := RefChange;
end;


procedure TShort.WMPaint(var Msg: TWMPaint);
begin
  inherited;
  if ShortArrows and (WindowState = wsMinimized) then
    Canvas.Draw(0, 22, ShortArrow);
end;


procedure TShort.DropClientDropFiles(Sender: TObject);
begin
  Ref.AcceptFiles(DropClient.Files);
end;


procedure TShort.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  { Query close is set to True when the user deletes the shortcut
    from the popup menu.  During shutdown, this is False so shortcuts
    are closed without asking }

  CanClose := not QueryClose or not ConfirmDelShort or
    (MsgDialog(Format('Delete shortcut to "%s"?', [Caption]),
      mtConfirmation, mbOKCancel, 0) = mrOK);
end;


procedure TShort.RefChange(Sender : TObject);
begin
  Ref.AssignIcon(Icon);
  Caption := Ref.Caption;
end;


procedure TShort.LoadFromIni(ini : TIniFile; const section:  string);
begin
  Ref.LoadFromIni(ini, section);

  MinPosition := Point(ini.ReadInteger(section, 'Left', 128),
                   ini.ReadInteger(section, 'Top', 128));
  Update;
end;


procedure TShort.SaveToIni(ini : TIniFile; const section : string);
begin
  Ref.SaveToIni(ini, section);
  with MinPosition do begin
    ini.WriteInteger(section, 'Left', x);
    ini.WriteInteger(section, 'Top', y);
  end;
end;

procedure TShort.FormDestroy(Sender: TObject);
begin
  FRef.Free;
end;


procedure TShort.SettingsChanged(Changes : TSettingChanges);
begin
  if scDesktop in Changes then Repaint;
end;


procedure TShort.WMMouseActivate(var Msg : TWMMouseActivate);
begin
  { To prevent shortcuts being moved when the icon is dragged,
    the mouse down message is thrown away.  To catch double clicks,
    the DoubleClickSpeed from WIN.INI (milliseconds?) is used to
    time each mouse message.

    Consider using TimerCount from ToolHelp instead. }

  if StickyShorts or OneClickShorts then
    with Msg do
    if MouseMsg = WM_LBUTTONDOWN then begin
      Result := MA_NOACTIVATEANDEAT;
      if OneClickShorts or (GetTickCount < LastMouseDown + DoubleClickSpeed) then
        Perform(WM_OPENSHORT, 0, 0);
      LastMouseDown := GetTickCount;
    end
    else
      inherited
  else
    inherited;
end;


end.

