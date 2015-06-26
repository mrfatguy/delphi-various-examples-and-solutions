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

unit About;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TAboutBox = class(TForm)
    OKButton: TBitBtn;
    LicenseBtn: TBitBtn;
    Image: TImage;
    ProductName: TLabel;
    VersionLabel: TLabel;
    Copyright: TLabel;
    Email: TLabel;
    MemLabel: TLabel;
    ResLabel: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    procedure LicenseBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{
var
  AboutBox: TAboutBox;
}

implementation

{$R *.DFM}

uses Strings, SysUtils, Files, MiscUtil, Settings, Dialogs;

procedure TAboutBox.LicenseBtnClick(Sender: TObject);
var
  license : TFilename;
begin
  license := ApplicationPath + 'LICENSE.TXT';

  if not FileExists(license) then
    MsgDialog('Cannot find LICENSE.TXT.  You can obtain a GNU General ' +
      'Public License by writing to the Free Software Foundation Inc., '+
      '675 Mass Ave, Cambridge, MA 02139, USA.', mtWarning, [mbOK], 0)
  else
    if ExecuteFile('notepad.exe', license, '', 'Open', SW_SHOWMAXIMIZED) <= 31 then
    MsgDialog('Unable to run Notepad.  Read LICENSE.TXT with another text editor',
      mtError, [mbOK], 0);
end;


procedure TAboutBox.FormCreate(Sender: TObject);
begin
  OKButton.Cancel := True;

  MemLabel.Caption := Format('Memory:      %s Free', [FormatByte(GetFreeSpace(0))]);
  ResLabel.Caption := Format('Resources:  System %d%%    GDI %d%%    USER %d%%',
    [GetFreeSystemResources(GFSR_SYSTEMRESOURCES),
     GetFreeSystemResources(GFSR_GDIRESOURCES),
     GetFreeSystemResources(GFSR_USERRESOURCES)]);

  Image.Picture.Bitmap.Handle := LoadBitmap(HInstance, 'LOGO');

  if FirstRun then begin
    Caption := 'Welcome';
    FirstRun := False;
  end;
end;

end.

