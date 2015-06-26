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

unit Sysprop;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, ExtCtrls, Chklist, TabNotBk, Grids, StylSped, Outline, Spin,
  Scrtree, Dialogs, Settings;

type
  TSysPropDlg = class(TForm)
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Notebook: TTabbedNotebook;
    Bevel1: TBevel;
    CapEdit: TEdit;
    Label2: TLabel;
    PrefList: TCheckList;
    Label1: TLabel;
    Element: TComboBox;
    ColorPick: TComboBox;
    Bevel2: TBevel;
    CustomBtn: TStyleSpeed;
    Sample: TShape;
    Label3: TLabel;
    Label4: TLabel;
    AddBtn: TStyleSpeed;
    RemoveBtn: TStyleSpeed;
    ModifyBtn: TStyleSpeed;
    Bevel3: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    GridWidth: TSpinEdit;
    GridHeight: TSpinEdit;
    Label8: TLabel;
    RowHeight: TSpinEdit;
    Label7: TLabel;
    Label9: TLabel;
    Outline: TScrollTree;
    SaveBtn: TStyleSpeed;
    ColorDialog: TColorDialog;
    DeviceList: TListBox;
    Header: THeader;
    RemoteEdit: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    PasswordEdit: TEdit;
    Connect: TStyleSpeed;
    Disconnect: TStyleSpeed;
    RefreshNet: TStyleSpeed;
    HelpBtn: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure OutlineDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure AddBtnClick(Sender: TObject);
    procedure RemoveBtnClick(Sender: TObject);
    procedure ModifyBtnClick(Sender: TObject);
    procedure OutlineClick(Sender: TObject);
    procedure ColorPickChange(Sender: TObject);
    procedure CustomBtnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ElementChange(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure NotebookChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure DeviceListDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure RefreshNetClick(Sender: TObject);
    procedure HeaderSized(Sender: TObject; ASection, AWidth: Integer);
    procedure ConnectClick(Sender: TObject);
    procedure DeviceListClick(Sender: TObject);
  private
    { Private declarations }
    FilledOutline : Boolean;
    Changes : TSettingChanges;
    AdvancedChanged : Boolean;
    SaveCustomColors : Boolean;
    procedure EnumColorProc(const s: string);
  public
    { Public declarations }
    procedure QueryNetwork;
  end;

{
var
  SysPropDlg: TSysPropDlg;
}


implementation

uses Drives, MiscUtil, Sys, SysUtils, Strings;

{$R *.DFM}

procedure TSysPropDlg.EnumColorProc(const s: string);
begin
  ColorPick.Items.AddObject(
    System.Copy(s, 3, Length(s)-2), TObject(StringToColor(s)));
end;


function GetNetConnection(LocalName : string): string;
var
  len: Word;
begin
  len := 254;
  if WNetGetConnection(StringAsPChar(LocalName), @Result[1], @len) = WN_SUCCESS then
    Result[0] := Chr(len)
  else
    Result := '(None)';
end;


procedure TSysPropDlg.QueryNetwork;
var
  d: Char;
begin
  DeviceList.Clear;

  for d := 'A' to 'Z' do
    DeviceList.Items.AddObject(
      Format('Drive (%s:)¬%s', [d, GetNetConnection(d + ':')]),
      TObject(d));

  for d := '1' to '3' do
    DeviceList.Items.AddObject(
      Format('Parallel port LPT%s¬%s', [d, GetNetConnection('LPT' + d)]),
      TObject(d));

  Connect.Enabled := False;
  Disconnect.Enabled := False;
end;


procedure TSysPropDlg.FormCreate(Sender: TObject);
var
  c: TCalColor;
begin
  Changes := [];
  Notebook.PageIndex := 0;
  CapEdit.Text := SysCaption;

  PrefList.SetData(
    [ShowSplash, RestoreSys, SysWinQuit,
     QueryQuit, MsgDialogSounds, LoadTaskbar,
     TrackThumb, KeyBreak]);

  for c := Low(TCalColor) to High(TCalColor) do
    Element.Items.AddObject(ColorNames[c], Pointer(Colors[c]));
  GetColorValues(EnumColorProc);

  GridWidth.Value := BrowseGrid.X;
  GridHeight.Value := BrowseGrid.Y;
  RowHeight.Value := LineHeight;

  ini.ReadSectionValues('Custom colors', ColorDialog.CustomColors);
end;


procedure TSysPropDlg.OKBtnClick(Sender: TObject);
var
  c: TCalColor;
begin
  if AdvancedChanged and (MsgDialog('Save advanced settings?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes) then SaveBtn.Click;

  SysCaption := CapEdit.Text;

  PrefList.GetData(
    [@ShowSplash, @RestoreSys, @SysWinQuit,
     @QueryQuit, @MsgDialogSounds, @LoadTaskbar,
     @TrackThumb, @KeyBreak]);

  for c:= Low(TCalColor) to High(TCalColor) do
    Colors[c] := Longint(Element.Items.Objects[Integer(c)]);

  BrowseGrid.X := GridWidth.Value;
  BrowseGrid.Y := GridHeight.Value;
  LineHeight := RowHeight.Value;

  SaveSystemProp;
  Include(Changes, scSystem);
  if CustomBtn.Enabled then Include(Changes, scDisplay);
end;


procedure TSysPropDlg.OutlineDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  item: TOutlineNode;
  x : Integer;
begin
  with Outline do begin
    index := GetItem(0, Rect.Top);
    item := Items[index];
    x := Rect.Left + 4 + (item.Level-1) * 20;

    with Canvas do begin
      FillRect(Rect);
      TextOut(x + 19, Rect.Top+2, item.Text);

      if item.Level = 1 then
        if item.Expanded then
          Draw(x+1, Rect.Top+1, PictureOpen)
        else
          Draw(x+1, Rect.Top+1, PictureClosed)
      else
        Draw(x+1, Rect.Top+1, PictureLeaf);
    end;
  end;
end;


procedure TSysPropDlg.AddBtnClick(Sender: TObject);
var
  s: string;
  item : TOutlineNode;
begin
  s := '';
  if InputQuery('Add an entry', 'Ident=Value', s) then begin
    AdvancedChanged := True;
    with Outline do
      if SelectedItem > 0 then begin
        item := Items[SelectedItem];
        if item.Level = 1 then AddChild(SelectedItem, s)
        else Add(SelectedItem, s);
      end
      else
        Add(0, s);
  end;
end;


procedure TSysPropDlg.RemoveBtnClick(Sender: TObject);
begin
  with Outline do
    if SelectedItem > 0 then begin
      Delete(SelectedItem);
      AdvancedChanged := True;
    end;
end;


procedure TSysPropDlg.ModifyBtnClick(Sender: TObject);
var
  s: string;
  item : TOutlineNode;
begin
  with Outline do begin
    if SelectedItem > 0 then begin
      item := Items[SelectedItem];
      s := item.Text;
      if InputQuery('Modify entry', 'Ident=Value', s) then begin
        item.Text := s;
        AdvancedChanged := True;
      end;
    end;
  end;
end;


procedure TSysPropDlg.OutlineClick(Sender: TObject);
begin
  with Outline do
  RemoveBtn.Enabled :=
    (SelectedItem > 0) and (Items[SelectedItem].Level > 1);
  ModifyBtn.Enabled := RemoveBtn.Enabled;
end;


procedure TSysPropDlg.ColorPickChange(Sender: TObject);
var
  c: TColor;
begin
  with ColorPick do c := TColor(Items.Objects[ItemIndex]);
  with Element do Items.Objects[ItemIndex] := TObject(c);
  Sample.Brush.Color := c;
end;


procedure TSysPropDlg.CustomBtnClick(Sender: TObject);
var
  c: TColor;
begin
  ColorDialog.Color := Sample.Brush.Color;
  if ColorDialog.Execute then begin
    c := ColorDialog.Color;
    with ColorPick do ItemIndex := Items.IndexOfObject(TObject(c));
    with Element do Items.Objects[ItemIndex] := TObject(c);
    Sample.Brush.Color := c;
    SaveCustomColors := True;
  end;
end;


procedure TSysPropDlg.FormDestroy(Sender: TObject);
begin
  if SaveCustomColors then
    ini.WriteSectionValues('Custom colors', ColorDialog.CustomColors);
  if Changes <> [] then AnnounceSettingsChanged(Changes);
end;


procedure TSysPropDlg.ElementChange(Sender: TObject);
var
  c: TColor;
begin
  with Element do c := TColor(Items.Objects[ItemIndex]);
  with ColorPick do begin
    Enabled := True;
    ItemIndex := Items.IndexOfObject(TObject(c));
  end;
  CustomBtn.Enabled := True;
  Sample.Brush.Color := c;
end;



procedure TSysPropDlg.SaveBtnClick(Sender: TObject);
var
  i: Longint;
begin
  Screen.Cursor := crHourGlass;
  with ini do
    for i := 1 to Outline.ItemCount do
      with Outline.Items[i] do
        if Level = 1 then EraseSection(Text)
        else WriteString(Parent.Text, GetStrKey(Text), GetStrValue(Text));

  Screen.Cursor := crDefault;
  Include(Changes, scINIFile);
  AdvancedChanged := False;
end;


procedure TSysPropDlg.NotebookChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
var
  sections, strings: TStringList;
  i, j : Integer;
  node : Longint;
  s : string[127];
begin
  if (NewTab = 3) and not FilledOutline then begin
    sections := TUniqueStrings.Create;
    ini.ReadStrings('Advanced', sections);
    strings := TStringList.Create;

    try
      with Outline do begin
        for i := 0 to sections.Count-1 do Add(0, sections[i]);

        BeginUpdate;
        for i := 0 to sections.Count-1 do begin
          s := sections[i];
          node := GetTextItem(s);
          strings.Clear;
          ini.ReadSectionValues(s, strings);
          for j := 0 to strings.Count-1 do AddChild(node, strings[j]);
        end;
        EndUpdate;
        Canvas.Font.Assign(Font);
        ThumbTracking := TrackThumb;
        Click;
      end;
    finally
      sections.Free;
      strings.Free;
      FilledOutline := True;
    end;
  end

  else if (NewTab = 2) and (DeviceList.Items.Count = 0) then
    QueryNetwork;
end;


procedure TSysPropDlg.DeviceListDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  local : string[31];
  remote : string;
begin
  with DeviceList do begin
    remote := '';
    Unformat(Items[Index], '%s¬%s', [@local, 31, @remote, 255]);
    Canvas.FillRect(Rect);
    Inc(Rect.Top);
    Canvas.TextOut(Rect.Left + 2, Rect.Top, local);
    Canvas.TextOut(Header.SectionWidth[0], Rect.Top, remote);
  end;
end;


procedure TSysPropDlg.RefreshNetClick(Sender: TObject);
begin
  QueryNetwork;
end;


procedure TSysPropDlg.HeaderSized(Sender: TObject; ASection,
  AWidth: Integer);
begin
  DeviceList.Invalidate;
end;


function NetError(n: Word): string;
begin
  case n of
    WN_SUCCESS       : Result := 'The connection/disconnection was successful';
    WN_NOT_SUPPORTED : Result := 'This operation is not supported';
    WN_OUT_OF_MEMORY : Result := 'Out of memory';
    WN_NET_ERROR     : Result := 'An error has occured on the network';
    WN_BAD_POINTER   : Result := 'Invalid pointer';
    WN_BAD_NETNAME   : Result := 'Invalid network resource name';
    WN_BAD_LOCALNAME : Result := 'Invalid local device';
    WN_BAD_PASSWORD  : Result := 'Invalid password';
    WN_ACCESS_DENIED : Result := 'Access denied!';
    WN_OPEN_FILES    : Result := 'Files were open so connection not cancelled';
    WN_ALREADY_CONNECTED : Result := 'This device is already remotely connected';
    else Result := 'The connection/disconnection failed';
  end;
end;


procedure TSysPropDlg.ConnectClick(Sender: TObject);
var
  local : string[7];
  remote, password: string;
  result : Word;
begin
  with DeviceList do
    if ItemIndex > -1 then begin
      { Get the local device name }
      local := 'X';
      local[1] := Char(Items.Objects[ItemIndex]);
      if local[1] in ['1'..'3'] then local := 'LPT' + local
      else AppendStr(local, ':');

      if Sender = Connect then begin
        { attempt connection }
        remote := RemoteEdit.Text;
        password := PasswordEdit.Text;
        Result := WNetAddConnection(StringAsPChar(remote), StringAsPChar(password),
          StringAsPchar(local));
      end
      else
        { attempt disconnection }
        Result := WNetCancelConnection(StringAsPChar(local),
          MsgDialog('Close any open files or print jobs?',
          mtWarning, [mbYes, mbNo], 0) = mrYes);

      if Result = WN_SUCCESS then QueryNetwork
      else MsgDialog(NetError(Result), mtError, [mbOK], 0);
      Include(Changes, scDevices);
      DetectDrives;
  end;
end;


procedure TSysPropDlg.DeviceListClick(Sender: TObject);
begin
  Connect.Enabled := True;
  Disconnect.Enabled := True;
end;

end.
