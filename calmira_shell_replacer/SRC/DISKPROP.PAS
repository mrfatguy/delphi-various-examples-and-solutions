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

unit Diskprop;

interface

uses
  Classes, SysUtils, Graphics, Controls, Forms, StdCtrls, Buttons, ExtCtrls, 
  TabNotBk, BarGauge;

type
  TDiskDialog = class(TForm)
    OKBtn: TBitBtn;
    Notebook: TTabbedNotebook;
    Label10: TLabel;
    DriveLetter: TLabel;
    Label11: TLabel;
    DriveType: TLabel;
    Label12: TLabel;
    DriveSize: TLabel;
    Label13: TLabel;
    DriveFree: TLabel;
    Label14: TLabel;
    DriveImage: TImage;
    Label1: TLabel;
    VolLabel: TLabel;
    Bevel1: TBevel;
    Gauge: TBarGauge;
    procedure FormShow(Sender: TObject);
    procedure DriveImageClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


procedure DiskPropExecute(drive : Char);

implementation

{$R *.DFM}

uses Strings, Drives, Resource, FileCtrl, Settings,
  Files, Environs, WinTypes;

{
var
  DiskDialog: TDiskDialog;
}

procedure TDiskDialog.FormShow(Sender: TObject);
var
  dnum : Integer;
  drive : Char;
  dtype : TDriveType;
  size, free : Longint;
  vol : string;
begin
  drive := DriveLetter.Caption[1];
  dnum := DriveNumber(drive);
  dtype := GuessDriveType(drive);
  DriveType.Caption := DriveDesc[dtype];
  DriveImage.Picture.Icon := icons.Drive[dtype];

  Screen.Cursor := crHourGlass;
  try
    size := DiskSize(dnum);
    if size <> -1 then free := DiskFree(dnum);
  finally
    Screen.Cursor := crDefault;
  end;

  if size <> -1 then begin
    DriveSize.Caption := FormatByte(size);
    DriveFree.Caption := FormatByte(free);

    if dtype = dtNetwork then vol := GetNetworkVolume(drive)
    else vol := GetVolumeID(drive);
    if vol > '' then VolLabel.Caption := vol;

    if size > 1024 then begin
      size := size div 1024;
      free := free div 1024;
    end;

    Gauge.MaxValue := size;
    Gauge.Progress := size - free;
  end;

  Gauge.ForeColor := Colors[ccPercent];
  Gauge.Font.Color := Colors[ccPercentText];
end;

procedure TDiskDialog.DriveImageClick(Sender: TObject);
begin
  ExecuteFile(EnvironSubst(DiskProg), '', '', 'Open', SW_SHOWNORMAL);
end;

procedure DiskPropExecute(drive : Char);
begin
  with TDiskDialog.Create(Application) do
  try
    DriveLetter.Caption := Upcase(drive);
    ShowModal;
  finally
    Free;
  end;
end;

procedure TDiskDialog.FormCreate(Sender: TObject);
begin
  OKBtn.Cancel := True;
  Notebook.PageIndex := 0;
end;

end.
