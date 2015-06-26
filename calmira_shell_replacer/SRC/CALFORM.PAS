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

unit CalForm;

{ TCalForm is the common ancestor of most of Calmira's modeless windows,
  and you should use it for other modeless windows that you add.  The
  main feature is the use of WMSettingsChanged to trigger the
  SettingsChanged method.  Descendants override this to adjust their
  properties depending on which settings have been modified.

  WM_NCRBUTTONDOWN is intercepted to popup the list of open windows or
  close the form when the user right clicks on a minimize/maximize
  button.

  Finally, ShowNormal is provided to make it easier to display a
  window, whatever state it is in.
}

interface

uses ExtForm, Messages, Classes, FormDrag, CalMsgs, Settings;

type

TCalForm = class(TExtForm)
private
  procedure WMNCRButtonDown(var Msg: TWMNCRButtonDown); message WM_NCRBUTTONDOWN;
  procedure WMSettingsChanged(var Msg: TMessage); message WM_SETTINGSCHANGED;
public
  procedure SettingsChanged(Changes : TSettingChanges); virtual;
  procedure ShowNormal;
end;

implementation

uses Forms, Desk, WinProcs, WinTypes, MiscUtil;

procedure TCalForm.WMNCRButtonDown(var Msg: TWMNCRButtonDown);
begin
  if WindowState <> wsMinimized then
  with Msg do
    case HitTest of
      HTCAPTION : Desktop.WindowMenu.Popup(XCursor, YCursor);
      HTMAXBUTTON : Close;
      HTMINBUTTON : Close;
      else inherited;
    end
  else inherited;
end;

procedure TCalForm.WMSettingsChanged(var Msg: TMessage);
begin
  SettingsChanged(TSettingChanges(Msg.wParam));
end;

procedure TCalForm.SettingsChanged(Changes : TSettingChanges);
begin
end;

procedure TCalForm.ShowNormal;
begin
  WindowState := wsNormal;
  Show;
end;

end.
