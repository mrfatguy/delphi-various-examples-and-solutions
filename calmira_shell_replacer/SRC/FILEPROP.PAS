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

unit FileProp;

{ File Properties dialog

  Displays details of files (and version information), folders or
  a combination.  The main call is SetItem(), which accepts either
  a TDirItem or a TFileList, and sets up the dialog appropriately.
}

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, ExtCtrls, Directry, TabNotBk, VerInfo;

type
  TFilePropDlg = class(TForm)
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Notebook: TTabbedNotebook;
    Notes: TNotebook;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    FilenameLab: TLabel;
    LocationLab: TLabel;
    SizeLab: TLabel;
    DateLab: TLabel;
    Label10: TLabel;
    TypeLab: TLabel;
    Label6: TLabel;
    Foldername: TLabel;
    Label8: TLabel;
    FolderLoc: TLabel;
    Label16: TLabel;
    Foldersize: TLabel;
    Label21: TLabel;
    FolderDate: TLabel;
    Label23: TLabel;
    TotalLab: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Selfiles: TLabel;
    Selsize: TLabel;
    Listbox: TListBox;
    Bevel2: TBevel;
    ReadOnly: TCheckBox;
    Hidden: TCheckBox;
    Archive: TCheckBox;
    System: TCheckBox;
    Label5: TLabel;
    Bevel1: TBevel;
    Header: THeader;
    Panel1: TPanel;
    ItemImage: TImage;
    HelpBtn: TBitBtn;
    procedure OKBtnClick(Sender: TObject);
    procedure ReadOnlyClick(Sender: TObject);
    procedure TotalLabClick(Sender: TObject);
    procedure ListboxDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure FormCreate(Sender: TObject);
    procedure HeaderSized(Sender: TObject; ASection, AWidth: Integer);
  private
    { Private declarations }
    Item : TObject;
    changed : Boolean;
    procedure SetSingle;
    procedure SetFile;
    procedure SetFolder;
    procedure SetList;
    procedure ExtractVerInfo;
    procedure SetCheckBoxes(attr, gray: Integer);
  public
    { Public declarations }
    procedure SetItem(AItem : TObject);
  end;

var
  FilePropDlg: TFilePropDlg;

implementation

{$R *.DFM}

uses SysUtils, Files, Strings, Resource, Settings, MiscUtil,
  Dialogs, Alias, FourDOS, FileCtrl;


procedure TFilePropDlg.SetCheckboxes(attr, gray: Integer);

procedure SetCheckBox(Checkbox: TCheckbox; mask: Integer);
begin
  with Checkbox do begin
    Checked := attr and mask <> 0;
    if gray and mask <> 0 then State := cbGrayed else AllowGrayed := False;
  end;
end;

begin
  SetCheckbox(ReadOnly, faReadOnly);
  SetCheckbox(Archive, faArchive);
  SetCheckbox(Hidden, faHidden);
  SetCheckbox(System, faSysFile);
end;


procedure TFilePropDlg.SetSingle;
begin
  with Item as TDirItem do begin
    ItemImage.Picture.Icon := Icon;
    SetCheckBoxes(Attr, 0);
  end;
end;



procedure TFilePropDlg.SetFile;
var
  ext : TFileExt;
begin
  SetSingle;
  with Item as TFileItem do begin
    Notes.PageIndex := 0;

    FilenameLab.Caption := Filename;
    LocationLab.Caption := Dir.Fullname;

    DateLab.Caption := FormatDateTime('dddd d mmmm yyyy,  hh:mm am/pm', TimeStamp);
    if Size <= 1024 then
      SizeLab.Caption := FormatByte(Size)
    else
      SizeLab.Caption :=
       Format('%s   (%.0n bytes)', [FormatByte(Size), Size * 1.0]);

    ext := Extension;
    with TypeLab do
      if ext = 'exe' then Caption := 'Program'
      else if ext = 'com' then Caption := 'MS-DOS program'
      else if ext = 'dll' then Caption := 'Dynamic link library'
      else if ext = 'bat' then Caption := 'MS-DOS batch file'
      else if ext = 'pif' then Caption := 'Program information file'
      else if Item is TAlias then Caption := 'Alias'
      else begin
        { query the registry }
        Caption := GetRegValue(GetRegValue('.' + ext));
        if Caption = '' then Caption := 'Unknown';
      end;

    if FindVersion then ExtractVerInfo;
  end;
end;


procedure TFilePropDlg.SetFolder;
begin
  SetSingle;
  with Item as TFolder do begin
    Notes.PageIndex := 1;

    Foldername.Caption := Filename;
    FolderLoc.Caption := Dir.Fullname;
    FolderDate.Caption := FormatDateTime('dddd d mmmm yyyy,  hh:mm am/pm', TimeStamp);

    with DirInfo(Fullname, False) do
    FolderSize.Caption := Format('%s in %d file%s',
      [FormatByte(size), files, OneItem[files = 1]]);
  end;
end;


procedure TFilePropDlg.SetList;
var
  i, gray, attr : Integer;
  f : TDirItem;
begin
  with Item as TFileList do begin
    Notes.PageIndex := 2;
    ItemImage.Picture.Icon := Icons.Get('MultiFile');
    Selfiles.Caption := Format('%d file%s in %d folder%s',
      [FileCount, OneItem[FileCount = 1], FolderCount, OneItem[FolderCount = 1]]);;
    Selsize.Caption := FormatByte(FileSize);

    { Determine which checkboxes should be grayed out }

    attr := TDirItem(Items[0]).Attr;
    gray := 0;
    for i := 1 to Count-1 do begin
       f := TDirItem(Items[i]);
       gray := gray or (f.Attr xor attr);
       attr := attr or f.Attr;
    end;
    SetCheckBoxes(attr, gray);
  end;
end;


procedure TFilePropDlg.SetItem(AItem : TObject);
begin
  Item := AItem;
  if Item is TFileItem then SetFile
  else if Item is TFolder then SetFolder
  else SetList;
  Caption := Notes.ActivePage;
  if Listbox.Items.Count = 0 then NoteBook.Pages.Delete(1);
end;


procedure TFilePropDlg.OKBtnClick(Sender: TObject);
var i, attrib, gray : Integer;
begin
  if not changed then exit;

  attrib := Integer(ReadOnly.Checked) * faReadOnly or
            Integer(Archive.Checked) * faArchive or
            Integer(Hidden.Checked) * faHidden or
            Integer(System.Checked) * faSysFile;

  if Item is TDirItem then
    (Item as TDirItem).Attr := attrib
  else
      with Item as TFileList do begin

      gray := Integer(ReadOnly.State = cbGrayed) * faReadOnly or
              Integer(Archive.State = cbGrayed) * faArchive or
              Integer(Hidden.State = cbGrayed) * faHidden or
              Integer(System.State = cbGrayed) * faSysFile;

      for i := 0 to Count-1 do
        with TDirItem(Items[i]) do Attr := attrib or (gray and Attr);
    end;
end;


procedure TFilePropDlg.ReadOnlyClick(Sender: TObject);
begin
  changed := True;
end;

procedure TFilePropDlg.TotalLabClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    with DirInfo((Item as TFolder).Fullname, True) do
      TotalLab.Caption := Format('%d file%s, %d folder%s, %s total',
       [files, OneItem[files = 1], dirs, OneItem[dirs = 1], FormatByte(size)]);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFilePropDlg.ExtractVerInfo;
var Res: TVersion;

procedure AddField(const field, info: string);
begin
  if info > '' then Listbox.Items.Add(field + info);
end;

begin
  try
    Res := TVersion.Create((Item as TFileItem).Filename);
    if not Res.HasData then Exit;

    Listbox.Items.BeginUpdate;
    with Res do begin
      AddField('Product name¬', ProductName);
      AddField('Legal copyright¬', LegalCopyright);
      AddField('Description¬', FileDescription);
      AddField('Type¬', FileType);
      AddField('Subtype¬', FileSubType);
      AddField('File OS¬', FileOS);
      AddField('Comments¬', Comments);
      AddField('Product version¬', ProductVersion);
      AddField('File version¬', FileVersion);
      AddField('Company¬', CompanyName);
      AddField('Legal trademarks¬', LegalTrademarks);
      AddField('Internal name¬', InternalName);
      AddField('Private build¬', PrivateBuild);
      AddField('Special build¬', SpecialBuild);
    end;
    Listbox.Canvas.Font := Font;
    Header.SectionWidth[0] := Listbox.Canvas.TextWidth('Original filename ') + 8;
    Listbox.Items.EndUpdate;
  finally
    Res.Free;
  end;
end;

procedure TFilePropDlg.ListboxDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  field : string[31];
  value : string;
begin
  with Listbox do begin
    Unformat(Items[Index], '%s¬%s', [@field, 31, @value, 255]);
    with Canvas do begin
      FillRect(Rect);
      TextOut(Rect.Left + 2, Rect.Top + 1, field);
      TextOut(Rect.Left + Header.SectionWidth[0], Rect.Top + 1, value);
    end;
  end;
end;

procedure TFilePropDlg.FormCreate(Sender: TObject);
begin
  Notebook.PageIndex := 0;
  Listbox.ItemHeight := LineHeight;
end;

procedure TFilePropDlg.HeaderSized(Sender: TObject; ASection,
  AWidth: Integer);
begin
  Listbox.Invalidate;
end;

end.
