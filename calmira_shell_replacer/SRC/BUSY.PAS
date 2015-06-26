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

unit Busy;

interface

uses Classes, Controls, Forms, StdCtrls;

type
  TBusyBox = class(TForm)
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowMessage(const s: string);
  end;

var
  BusyBox: TBusyBox;

implementation

{$R *.DFM}

uses Desk, Replace;

procedure TBusyBox.ShowMessage(const s: string);
begin
  Label1.Caption := s;
  Show;
  Update;
end;


procedure TBusyBox.FormShow(Sender: TObject);
begin
  Desktop.EnableForms(False);
end;


procedure TBusyBox.FormHide(Sender: TObject);
begin
  Desktop.EnableForms(True);
  ReplaceBox.Free;
  ReplaceBox := nil;
end;

end.
