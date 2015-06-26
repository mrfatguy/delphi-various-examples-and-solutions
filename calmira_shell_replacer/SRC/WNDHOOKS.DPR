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

library WndHooks;

{ Calmira's Windows hooks and other low level stuff.

  This DLL implements:

  Shell hook - detects and reports top-level windows being created or
    destroyed (perfect for a taskbar)

  WndProc hook - detects and reports WM_ACTIVATE messages sent to
    any window.  Detects user maximizing a window, and can adjust its
    size so as not to overlap with the taskbar.

  Mouse hook - detects and reports WM_MOUSEMOVE messages sent to
    any window (used by taskbar to hide after the cursor has moved off).
    Also detects WM_NCRBUTTONDOWN so that right clicks on minimize or
    maximize boxes can be used to close a window.

  Desktop WndProc - detects and reports the user right clicking on
    the desktop, so that host program can display a popup menu.

  Thanks to Ralf Scheiner for the code to constrain maximized windows.
}

uses WinProcs, WinTypes, Messages, CalMsgs;

type
  LongRec = record
    Lo, Hi: Word;
  end;


var
  CallBackWnd : HWND;

  TaskHook  : HHook;
  WndHook   :HHook;
  MouseHook : HHook;

  ScreenWidth, ScreenHeight, YLimit: Integer;
  MaxEnabled : Boolean;
  MouseEnabled : Boolean;
  RCloseEnabled : Boolean;

  DeskWndProc : TFarProc;
  DeskCallBack: HWND;

{ shell hook }

function ShellProc(Code : Integer; wParam: Word; lParam: Longint): Longint; export;
begin
  case Code of
  HSHELL_WINDOWCREATED   : PostMessage(CallbackWnd, WM_SHELLWNDCREATE, wParam, lParam);
  HSHELL_WINDOWDESTROYED : PostMessage(CallBackWnd, WM_SHELLWNDDESTROY, wParam, lParam);
  end;
  Result := CallNextHookEx(TaskHook, Code, wParam, lParam);
end;


procedure StopTaskMonitor; export;
begin
  if TaskHook > 0 then UnhookWindowsHookEx(TaskHook);
  TaskHook := 0;
end;

procedure StartTaskMonitor; export;
begin
  StopTaskMonitor;
  TaskHook := SetWindowsHookEx(WH_SHELL, ShellProc, HInstance, 0);
end;


{ WndProc hook }

function WndProcHook(code: integer; wParam:word; lParam:Longint):LongInt; export;
type
  PHookMsg=^THookMsg;

  THookMsg=record
   lParam: Longint;
   wParam: Word;
   uMsg: Word;
   hWnd: THandle;
  end;
var
  Wnd: HWnd;
begin
  if code >= 0 then with PHookMsg(lParam)^ do

    if MaxEnabled and (uMsg = WM_WINDOWPOSCHANGING) then begin
      { Adjust size of maximized window }
      with pWindowPos(lParam)^ do
        if (Y+cY>ScreenHeight) and (X+cX>ScreenWidth) then begin
          cY := YLimit - Y;
          if GetWindowLong(HWnd, GWL_STYLE) and WS_THICKFRAME > 0 then
            Inc(cY, GetSystemMetrics(SM_CYFRAME))
          else
            Inc(cY);
        end;
    end

    else if (uMsg = WM_ACTIVATE) and (CallBackWnd > 0) then
      { inform host program about activation message }
      case wParam of
        WA_INACTIVE    : if Bool(LongRec(lParam).Hi) then
                         SendMessage(CallBackWnd, WM_HIDEQUERY, hWnd, 0);
        WA_ACTIVE      : SendMessage(CallBackWnd, WM_WINACTIVE, hWnd, 1);
        WA_CLICKACTIVE : SendMessage(CallBackWnd, WM_WINACTIVE, hWnd, 1);
      end;

  CallNextHookEx(WndHook,Code,wParam,lParam);
end;

procedure SetYLimit(y: Integer); export;
begin
   YLimit := y;
end;

procedure UnhookWndHook; export;
begin
  if WndHook> 0 then UnHookWindowsHookEx(WndHook);
  WndHook:= 0;
end;

procedure SetWndHook; export;
begin
  UnhookWndHook;
  WndHook := SetWindowsHookEx(WH_CallWndProc,WndProcHook,hInstance,0);
end;

{ Mouse hook }

function MouseProc(Code : Integer; wParam: Word; lParam: Longint): Longint; export;
var
  y: Integer;
begin
  if MouseEnabled and (wParam = WM_MOUSEMOVE) then begin
    { inform host about mouse movement }
    y := TMouseHookStruct(Pointer(lParam)^).Pt.y;
    if y < YLimit then PostMessage(CallbackWnd, WM_MOUSEHOOK, y, 0);
  end

  else if RCloseEnabled and (wParam = WM_NCRBUTTONDOWN) then begin
    { close the window if right click on minimize/maximize boxes }
    with TMouseHookStruct(Pointer(lParam)^) do
      if (wHitTestCode = HTMAXBUTTON) or (wHitTestCode = HTMINBUTTON) then begin
        Result := 1;
        PostMessage(hWnd, WM_CLOSE, 0, 0);
        Exit;
      end;
  end;

  Result := CallNextHookEx(MouseHook, Code, wParam, lParam);
end;


procedure StopMouseMonitor; export;
begin
  if MouseHook > 0 then UnhookWindowsHookEx(MouseHook);
  MouseHook := 0;
end;

procedure StartMouseMonitor; export;
begin
  StopMouseMonitor;
  MouseHook := SetWindowsHookEx(WH_MOUSE, MouseProc, HInstance, 0);
end;

procedure EnableMouseMonitor; export;
begin
  MouseEnabled := True;
end;

procedure DisableMouseMonitor; export;
begin
  MouseEnabled := False;
end;


procedure SetCallBackWnd(Wnd: HWND); export;
begin
  CallBackWnd := Wnd;
end;

procedure SetMaxEnabled(value : Boolean); export;
begin
  MaxEnabled := value;
end;

{ Desktop window procedure to catch right clicks }

function NewDeskWndProc(Handle: HWND; Msg: Word; wParam: Word;
  lParam: Longint): Longint; export;
begin
  if (Msg = WM_RBUTTONDOWN) then
    PostMessage(DeskCallBack, WM_DESKMENU, wParam, lParam);

  Result := CallWindowProc(DeskWndProc, Handle, Msg, wParam, lParam);
end;

procedure ReleaseDesktopHook; export;
begin
  { restore Windows's wndproc }
  if DeskWndProc <> nil then begin
    SetWindowLong(GetDesktopWindow, GWL_WNDPROC, Longint(DeskWndProc));
    DeskWndProc := nil;
  end;
end;

procedure SetDesktopHook(CallBack : HWND); export;
begin
  { replace desktop wndproc with our one }
  ReleaseDesktopHook;
  DeskCallback := CallBack;
  DeskWndProc := Pointer(SetWindowLong(GetDesktopWindow, GWL_WNDPROC,
    Longint(@NewDeskWndProc)));
end;


{ Right click on min/max buttons to close }

procedure SetRCloseEnabled(value : Boolean); export;
begin
  RCloseEnabled := value;
end;



exports
  StartTaskMonitor index 1,
  StopTaskMonitor index 2,
  SetWndHook index 3,
  UnhookWndHook index 4,
  SetYLimit index 5,
  StartMouseMonitor index 6,
  StopMouseMonitor index 7,
  EnableMouseMonitor index 8,
  DisableMouseMonitor index 9,
  SetCallBackWnd index 10,
  SetMaxEnabled index 11,
  SetRCloseEnabled index 12,
  SetDesktopHook index 13,
  ReleaseDesktopHook index 14;

begin
  ScreenWidth := GetSystemMetrics(SM_CXSCREEN);
  ScreenHeight := GetSystemMetrics(SM_CYSCREEN);
  YLimit := ScreenHeight - 32;
end.
