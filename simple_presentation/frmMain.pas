unit frmMain;

interface

uses
  SysUtils, Forms, Classes, Controls, PicShow, ExtCtrls,
  StdCtrls, Dialogs, Windows;

type
  TMainForm = class(TForm)
    PicShow: TPicShow;
    procedure ShowPage(PageN: Integer);

    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PicShowMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
     LastPage, Page: Integer;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses pasProcs;

{$R *.DFM}

procedure TMainForm.FormShow(Sender: TObject);
begin
	Screen.Cursor:=crNone;
end;

procedure TMainForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
	GotoPage: Integer;
	Path, sGotoPage: String;
begin
	if Key=27 then PerformExit;
	if Key=71 then
	begin
		sGotoPage:=InputBox('Zmiana strony', 'Przejdü do strony nr:', IntToStr(Page));
		GotoPage:=StrToIntDef(sGotoPage, Page);
		if GotoPage=Page then exit;

		if GotoPage<10 then
			Path:=aPath+'data/page_0'+IntToStr(GotoPage)+'.bmp'
		else
			Path:=aPath+'data/page_'+IntToStr(GotoPage)+'.bmp';

		if FileExists(Path) then
		begin
			Page:=GotoPage;
			ShowPage(Page);
		end
		else Application.MessageBox(PChar('Wybrana strona prezentacji (numer '+IntToStr(GotoPage)+') nie istnieje!'),'Ostrzeøenie',MB_OK+MB_ICONWARNING+MB_DEFBUTTON1);
	end;
end;

procedure TMainForm.ShowPage(PageN: Integer);
var
	Path: String;
begin
	if PageN<10 then
		Path:=aPath+'data/page_0'+IntToStr(PageN)+'.bmp'
	else
		Path:=aPath+'data/page_'+IntToStr(PageN)+'.bmp';

	if FileExists(Path) then
	begin
		PicShow.Picture.Bitmap.LoadFromFile(Path);
		if PageN>LastPage then PicShow.Style:=5;
		if PageN<LastPage then PicShow.Style:=6;
		PicShow.Execute;
	end
	else Application.Terminate;
end;

procedure TMainForm.PicShowMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
	if Button = mbLeft then
	begin
		LastPage:=Page;
		Inc(Page);
		ShowPage(Page);
	end;
	if Button = mbRight then
	begin
		LastPage:=Page;
		Dec(Page);
		ShowPage(Page);
	end;
	if Button = mbMiddle then PerformExit
end;

end.
