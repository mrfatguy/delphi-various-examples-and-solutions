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

unit Refedit;

interface

uses Classes, Forms, Controls, Buttons, StdCtrls, ExtCtrls, Dialogs,
  StylSped, Icondlg, SysUtils, TabNotBk, Menus;

type
  TRefEditDlg = class(TForm)
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    IconDialog: TIconDialog;
    Notebook: TTabbedNotebook;
    Label1: TLabel;
    Label2: TLabel;
    TargetLabel: TLabel;
    BrowseIcon: TStyleSpeed;
    CapEdit: TEdit;
    FilePanel: TGroupBox;
    ParamLabel: TLabel;
    Label3: TLabel;
    FolderEdit: TEdit;
    DocFolder: TCheckBox;
    ParamEdit: TEdit;
    TargetEdit: TEdit;
    IconEdit: TEdit;
    ShowGroup: TRadioGroup;
    HelpBtn: TBitBtn;
    KindMenu: TPopupMenu;
    DriveKind: TMenuItem;
    FolderKind: TMenuItem;
    FileKind: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BrowseIconClick(Sender: TObject);
    procedure FolderEditDblClick(Sender: TObject);
    procedure DriveKindClick(Sender: TObject);
  private
    { Private declarations }
    SaveHistory : Boolean;
  public
    { Public declarations }
  end;

var
  RefEditDlg: TRefEditDlg;

function ExtractIconFile(const s: string): TFilename;
function ExtractIconIndex(const s: string): Integer;

implementation

{$R *.DFM}

uses Graphics, FileCtrl, ShellAPI, Strings, Settings, WinProcs, Tree;

function ExtractIconFile(const s: string): TFilename;
begin
  Result := '';
  Unformat(s, '%s(', [@Result, 79]);
end;

function ExtractIconIndex(const s: string): Integer;
begin
  Result := 0;
  try Unformat(s, '%S(%d', [@Result]);
  except on EConvertError do;
  end;
end;


procedure TRefEditDlg.FormCreate(Sender: TObject);
begin
  Notebook.PageIndex := 0;
  ini.ReadStrings('IconSources', IconDialog.HistoryList);
end;

procedure TRefEditDlg.FormDestroy(Sender: TObject);
begin
  if SaveHistory then ini.WriteStrings('IconSources', IconDialog.HistoryList);
end;

procedure TRefEditDlg.BrowseIconClick(Sender: TObject);
begin
  with IconDialog do begin
    if IconEdit.Text > '' then Filename := ExtractIconFile(IconEdit.Text)
    else Filename := TargetEdit.Text;
    IconIndex := ExtractIconIndex(IconEdit.Text);

    if Execute then begin
      IconEdit.Text := Format('%s(%d)', [Filename, IconIndex]);
      SaveHistory := True;
    end;
  end;
end;

procedure TRefEditDlg.FolderEditDblClick(Sender: TObject);
begin
  FolderEdit.Text := SelectFolder(FolderEdit.Text);
end;

procedure TRefEditDlg.DriveKindClick(Sender: TObject);
begin
  DriveKind.Checked := False;
  FolderKind.Checked := False;
  FileKind.Checked := False;
  (Sender as TMenuItem).Checked := True;
end;

end.
