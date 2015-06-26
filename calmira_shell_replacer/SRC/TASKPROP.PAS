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

unit Taskprop;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, Chklist, TabNotBk, ExtCtrls, Spin, StylSped;

type
  TTaskPropDlg = class(TForm)
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Notebook: TTabbedNotebook;
    CheckList: TCheckList;
    ExcludeList: TListBox;
    Header: THeader;
    Label1: TLabel;
    AddBtn: TStyleSpeed;
    RemoveBtn: TStyleSpeed;
    RefreshEdit: TSpinEdit;
    Label2: TLabel;
    Bevel1: TBevel;
    HelpBtn: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure ExcludeListDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure AddBtnClick(Sender: TObject);
    procedure RemoveBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{
var
  TaskPropDlg: TTaskPropDlg;
}


implementation

{$R *.DFM}

uses Settings, CalMsgs, Strings, Dialogs;

procedure TTaskPropDlg.FormCreate(Sender: TObject);
begin
  Notebook.PageIndex := 0;

  CheckList.SetData(
    [StayVisible, Highlight, ShrinkMax,
     Clock24, PopupRes, PopupDate,
     Animate, ButtonHints, ArrangeMin,
     HideMinApps, IconWindowTask, ExplorerTask,
     FullFolderPath, CalIcons, DocNameFirst,
     DocNameLower]);

  ini.ReadStrings('Exclude', ExcludeList.Items);
  RefreshEdit.Value := ini.ReadInteger('Taskbar', 'Refresh', 5);
end;

procedure TTaskPropDlg.OKBtnClick(Sender: TObject);
begin
  CheckList.GetData(
    [@StayVisible, @Highlight, @ShrinkMax,
     @Clock24, @PopupRes, @PopupDate,
     @Animate, @ButtonHints, @ArrangeMin,
     @HideMinApps, @IconWindowTask, @ExplorerTask,
     @FullFolderPath, @CalIcons, @DocNameFirst,
     @DocNameLower]);

  SaveTaskProp;
  ini.WriteStrings('Exclude', ExcludeList.Items);
  ini.WriteInteger('Taskbar', 'Refresh', RefreshEdit.Value);

  AnnounceSettingsChanged([scTaskbar]);
end;


procedure TTaskPropDlg.ExcludeListDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  m, c : string[79];
begin
  with ExcludeList do begin
    m := '';
    c := '';
    Unformat(Items[Index], '%s %s', [@m, 79, @c, 79]);
    Canvas.FillRect(Rect);
    Canvas.TextOut(Rect.Left+2, Rect.Top+1, m);
    Canvas.TextOut(Header.SectionWidth[0], Rect.Top+1, c);
  end;
end;


procedure TTaskPropDlg.AddBtnClick(Sender: TObject);
var s: string;
begin
  s := '';
  if InputQuery('Add taskbar exclusion', 'Module [classname]', s) and
    (s > '') then ExcludeList.Items.Add(s);
end;

procedure TTaskPropDlg.RemoveBtnClick(Sender: TObject);
begin
  with ExcludeList do
    if ItemIndex <> -1 then Items.Delete(ItemIndex);
end;

end.
