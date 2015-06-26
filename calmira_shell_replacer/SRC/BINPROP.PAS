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

unit Binprop;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, Spin, TabNotBk, ExtCtrls, Chklist;

type
  TBinPropDlg = class(TForm)
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Notebook: TTabbedNotebook;
    GroupBox1: TGroupBox;
    rbLeave: TRadioButton;
    rbDelete: TRadioButton;
    rbClear: TRadioButton;
    rbCollect: TRadioButton;
    SizeEdit: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    CapEdit: TEdit;
    Label3: TLabel;
    HelpBtn: TBitBtn;
    cbIcons: TCheckBox;
    cbDisable: TCheckBox;
    Bevel1: TBevel;
    procedure rbCollectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{
var
  BinPropDlg: TBinPropDlg;
}

implementation

uses WasteBin, MiscUtil, Settings;

{$R *.DFM}

procedure TBinPropDlg.rbCollectClick(Sender: TObject);
begin
  SizeEdit.Enabled := rbCollect.Checked;
end;

procedure TBinPropDlg.FormCreate(Sender: TObject);
begin
  Notebook.PageIndex := 0;
  CapEdit.Text := BinCaption;
  SetRadioIndex([rbLeave, rbDelete, rbClear, rbCollect], Integer(BinAction));
  SizeEdit.Value := BinCapacity;
  cbIcons.Checked := BinIcons;
  cbDisable.Checked := BinDisable;
end;

procedure TBinPropDlg.OKBtnClick(Sender: TObject);
begin
  BinCaption := CapEdit.Text;
  BinAction := TBinAction(GetRadioIndex([rbLeave, rbDelete, rbClear, rbCollect]));
  BinCapacity := SizeEdit.Value;
  BinIcons := cbIcons.Checked;
  BinDisable := cbDisable.Checked;
  SaveBinProp;
  Bin.Configure;
  Bin.Visible := not BinDisable;
  AnnounceSettingsChanged([scBin]);
end;



end.
