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

unit Runprog;

interface

uses Classes, Forms, Controls, Buttons, StdCtrls, Dialogs;

type
  TRunDlg = class(TForm)
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Label1: TLabel;
    Combo: TComboBox;
    RunMin: TCheckBox;
    DosCommand: TCheckBox;
    OpenDialog: TOpenDialog;
    BrowseBtn: TBitBtn;
    procedure OKBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure BrowseBtnClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
    Changed : Boolean;
  public
    { Public declarations }
  end;

procedure RunExecute(const s: string);

implementation

{$R *.DFM}

uses SysUtils, Files, Settings, WinProcs, WinTypes, MiscUtil,
  Resource, Environs;

var RunDlg: TRunDlg;

procedure RunExecute(const s: string);
begin
  if RunDlg = nil then RunDlg := TRunDlg.Create(Application);

  with RunDlg do begin
    Combo.Text := s;
    WindowState := wsNormal;
    Show;
  end;
end;


procedure TRunDlg.OKBtnClick(Sender: TObject);
const
  Commands: array[Boolean] of Word = (SW_SHOW, SW_SHOWMINNOACTIVE);
var
  command: array[0..79] of Char;
begin
  Changed := AddHistory(Combo) or Changed;
  with Combo do
    if Text > '' then begin
      if DosCommand.Checked then
        WinExec(StrPCopy(@command,
          EnvironSubst('%COMSPEC% /c ' + Text)), Commands[RunMin.Checked])
      else
        WinExec(StrPCopy(@command, Text), Commands[RunMin.Checked]);
    end;
end;


procedure TRunDlg.FormCreate(Sender: TObject);
begin
  Icon.Assign(Icons.Get('RunDialog'));
  ini.ReadStrings('RunProgram', Combo.Items);
end;


procedure TRunDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;


procedure TRunDlg.FormDestroy(Sender: TObject);
begin
  if Changed then begin
    ini.EraseSection('RunProgram');
    ini.WriteStrings('RunProgram', Combo.Items);
  end;
  RunDlg := nil;
end;


procedure TRunDlg.CancelBtnClick(Sender: TObject);
begin
  Close;
end;


procedure TRunDlg.BrowseBtnClick(Sender: TObject);
begin
  if OpenDialog.Execute then
    Combo.Text := Lowercase(OpenDialog.Filename);
end;


procedure TRunDlg.FormPaint(Sender: TObject);
begin
  Border3D(Canvas, ClientWidth-1, ClientHeight-1);
end;

end.
