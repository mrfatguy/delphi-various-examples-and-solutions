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

unit Shutdown;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, ExtCtrls, Messages;

type
  TQuitDlg = class(TForm)
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    rbDOS: TRadioButton;
    rbQuit: TRadioButton;
    rbRestart: TRadioButton;
    rbReboot: TRadioButton;
    Bevel1: TBevel;
    Image1: TImage;
    procedure OKBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rbDOSDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.DFM}

uses MiscUtil, Settings, Desk;

{var QuitDlg: TQuitDlg;}

procedure TQuitDlg.OKBtnClick(Sender: TObject);
begin
  Close;
  DestroyHandle;
  Desktop.Save;
  case GetRadioIndex([rbDOS, rbQuit, rbRestart, rbReboot]) of
   0: ExitWindows(0, 0);
   1: Application.Terminate;
   2: ExitWindows(EW_RESTARTWINDOWS, 0);
   3: ExitWindows(EW_REBOOTSYSTEM, 0);
  end;
end;

procedure TQuitDlg.FormCreate(Sender: TObject);
begin
  rbQuit.Enabled := not IsShell;
end;

procedure TQuitDlg.FormShow(Sender: TObject);
begin
  SetSysModalWindow(Handle);
end;

procedure TQuitDlg.rbDOSDblClick(Sender: TObject);
begin
  OKBtn.Click;
end;

end.
