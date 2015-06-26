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

unit CalMsgs;

interface

uses WinTypes, Messages;

const
  WM_SETTINGSCHANGED = WM_USER + 100;  { broadcast to all Calmira windows }
  WM_OPENSHORT       = WM_USER + 101;  { used internally by TShort }

  CM_PREVINSTANCE = 1;   { activates the previous instance }
  CM_TASKCONFIG   = 2;   { tells the taskbar to reload the settings }
  CM_EXPLORER     = 3;   { tells Calmira to display the tree view }
  CM_STARTMENU    = 4;   { makes Calmira popup the start menu }
  CM_STARTCLOSE   = 5;   { makes the start button pop up }
  CM_UNLOADTASKBAR= 6;   { closes the taskbar program }
  CM_ARRANGEICONS = 7;   { calls Calmira's icon arrangement function }
  CM_ADDCALWINDOW = 8;   { adds an icon window to the taskbar }
  CM_DELCALWINDOW = 9;   { removes an icon window from the taskbar }
  CM_GETTASKICON  = 10;  { Calmira returns the handle of a suitble icon }
  CM_STARTPROP    = 11;  { displays Start Properties dialog }
  CM_TASKPROP     = 12;  { displays Taskbar Properties dialog }
  CM_MINIMIZEALL  = 13;  { minimizes all programs }

  { Used by Wndhooks DLL }

  WM_SHELLWNDCREATE  = WM_USER + 200; { top level window created }
  WM_SHELLWNDDESTROY = WM_USER + 201; { top level window destroyed }
  WM_MOUSEHOOK       = WM_USER + 202; { mouse has moved }
  WM_HIDEQUERY       = WM_USER + 203; { window has been minimized }
  WM_WINACTIVE       = WM_USER + 204; { window has been activated }
  WM_DESKMENU        = WM_USER + 205; { right click on wallpaper }

var
  WM_CALMIRA : Word;
  TaskBarWnd : HWND;
  CalmiraWnd : HWND;

{ After the window finding functions are called, the window handles can
  be accessed through the variables instead to avoid calling FindWindow
  repeatedly }

function TaskbarWindow: HWND;
function CalmiraWindow: HWND;

implementation

uses WinProcs;

function TaskbarWindow: HWND;
begin
  Result := FindWindow('TApplication', 'Taskbar');
  TaskBarWnd := Result;
end;

function CalmiraWindow: HWND;
begin
  Result := FindWindow('TApplication', 'Calmira');
  CalmiraWnd := Result;
end;

initialization
  WM_CALMIRA := RegisterWindowMessage('Calmira Registered Message');
end.
