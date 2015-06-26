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

unit Progress;

interface

uses
  SysUtils, Classes, Controls, Forms, StdCtrls, Buttons, ExtCtrls, BarGauge;

type
  TFileOperation = (foCopy, foMove, foDelete);

  TProgressBox = class(TForm)
    FileLabel: TLabel;
    PercentLabel: TLabel;
    CancelBtn: TBitBtn;
    FromText: TLabel;
    FromLabel: TLabel;
    ToText: TLabel;
    ToLabel: TLabel;
    Gauge: TBarGauge;
    procedure CancelBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    { Private declarations }
    FAbortOp : Boolean;
  public
    { Public declarations }
    property AbortOp : Boolean read FAbortOp;
    procedure UpdateGauge;
    procedure UpdateLabel(const source, dest : TFilename);
    procedure Init(Op : TFileOperation; ACount: Integer);
    procedure CheckForAbort;
  end;

  const FileOpMessages : array[TFileOperation] of string[11] =
    ('Copying...', 'Moving...', 'Deleting');

var
  ProgressBox: TProgressBox;

implementation

{$R *.DFM}

uses FileCtrl, Settings, Strings, Desk, Replace;

procedure TProgressBox.UpdateGauge;
begin
  Gauge.AddProgress(1);
end;


procedure TProgressBox.UpdateLabel(const source, dest: TFilename);
begin
  FileLabel.Caption := Uppercase(ExtractFilename(source));

  with FromLabel do
    Caption := MinimizeName(Uppercase(ExtractFileDir(source)), Canvas, Width);

  with ToLabel do
    Caption := MinimizeName(Uppercase(ExtractFileDir(dest)), Canvas, Width);

  FromLabel.Update;
  ToLabel.Update;
end;


procedure TProgressBox.Init(Op : TFileOperation; ACount: Integer);
var i: Integer;
begin
  if Op in [foCopy, foMove] then begin
    FileLabel.Caption := '';
    FromText.Show;
    ToText.Show;
    FromLabel.Caption := '';  FromLabel.Show;
    ToLabel.Caption := '';    ToLabel.Show;
  end
  else begin
    FileLabel.Caption := 'Please wait...';
    FromText.Hide;
    FromLabel.Hide;
    ToText.Hide;
    ToLabel.Hide;
  end;

  Caption := FileOpMessages[Op];

  FAbortOp := False;
  Gauge.Progress := 0;
  Gauge.MaxValue := ACount;
  Show;
  Update;
end;


procedure TProgressBox.CancelBtnClick(Sender: TObject);
begin
  FAbortOp := True;
end;


procedure TProgressBox.FormShow(Sender: TObject);
begin
  Gauge.ForeColor := Colors[ccPercent];
  Gauge.Font.Color := Colors[ccPercentText];
  Desktop.EnableForms(False);
end;

procedure TProgressBox.FormHide(Sender: TObject);
begin
  FAbortOp := False;
  Desktop.EnableForms(True);
  ReplaceBox.Free;
  ReplaceBox := nil;
end;

procedure TProgressBox.CheckForAbort;
begin
  Application.ProcessMessages;
  if FAbortOp then Abort;
end;


end.
