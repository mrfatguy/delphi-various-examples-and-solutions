{
Copyright © 1998 by Delphi 4 Developer's Guide - Xavier Pacheco and Steve Teixeira
}

unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, FileCtrl, StdCtrls, verinfo, Grids, Outline, DirOutln,
  ComCtrls;

type
  TMainForm = class(TForm)
    lvVersionInfo: TListView;
    btnClose: TButton;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    VerInfoRes: TVerInfoRes;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure AddListViewItem(const aCaption, aValue: String; aData: Pointer;
  aLV: TListView);
// This method is used to add a TListItem to the TListView, aLV
var
  NewItem: TListItem;
begin
  NewItem := aLV.Items.Add;
  NewItem.Caption := aCaption;
  NewItem.Data := aData;
  NewItem.SubItems.Add(aValue);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  VerInfoRes := TVerInfoRes.Create(Application.ExeName);
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  VerInfoRes.Free;
end;

procedure TMainForm.FormShow(Sender: TObject);
var
  VerString: String;
  i: integer;
  sFFlags: String;

begin
  for i := ord(viCompanyName) to ord(viComments) do begin
    VerString := VerInfoRes.GetPreDefKeyString(TVerInfoType(i));
    if VerString <> '' then
      AddListViewItem(VerNameArray[TVerInfoType(i)], VerString, nil,
        lvVersionInfo);
  end;
  VerString := VerInfoRes.GetUserDefKeyString('Autor');
  if VerString <> EmptyStr then
      AddListViewItem('Autor', VerString, nil, lvVersionInfo);
      

  AddListViewItem('Wersja pliku', VerInfoRes.FileVersion, nil,
    lvVersionInfo);
  AddListViewItem('Wersja produktu', VerInfoRes.ProductVersion, nil,
    lvVersionInfo);
  for i := 0 to VerInfoRes.FileFlags.Count - 1 do begin
    if i <> 0 then
      sFFlags := SFFlags+', ';
    sFFlags := SFFlags+VerInfoRes.FileFlags[i];
  end;
  AddListViewItem('Znaczniki',SFFlags, nil, lvVersionInfo);
  AddListViewItem('System operacyjny', VerINfoRes.FileOS, nil, lvVersionInfo);

end;

procedure TMainForm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
