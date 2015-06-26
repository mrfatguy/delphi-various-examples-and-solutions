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

unit Deskprop;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, ExtCtrls, Chklist, TabNotBk;

type
  TDeskPropDlg = class(TForm)
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Notebook: TTabbedNotebook;
    CheckList: TCheckList;
    Placement: TRadioGroup;
    Label1: TLabel;
    HelpBtn: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
{
var
  DeskPropDlg: TDeskPropDlg;
}

implementation

{$R *.DFM}

uses Settings, Desk;

procedure TDeskPropDlg.FormCreate(Sender: TObject);
begin
  Notebook.PageIndex := 0;
  Placement.ItemIndex := Integer(WindowOpen);
  CheckList.SetData(
    [AutoSize, HollowDrag, SaveWindows,
     ShortArrows, AnimCursor, ShowDeskMenu,
     TreeAlign, ConfirmDelShort, StickyShorts,
     OneClickShorts, BrowseSame, RightClose]);
end;

procedure TDeskPropDlg.OKBtnClick(Sender: TObject);
begin
  WindowOpen := TWindowOpen(Placement.ItemIndex);
  CheckList.GetData(
    [@AutoSize, @HollowDrag, @SaveWindows,
     @ShortArrows, @AnimCursor, @ShowDeskMenu,
     @TreeAlign, @ConfirmDelShort, @StickyShorts,
     @OneClickShorts, @BrowseSame, @RightClose]);
  SaveDeskProp;
  AnnounceSettingsChanged([scDesktop]);
end;


end.
