unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, TFlatHintUnit, ThemeMgr,
  GIFImage;

type
  TMainForm = class(TForm)
    imgHorizontalTop: TImage;
    imgHorizontalBottom: TImage;
    imgVerticalLeft: TImage;
    Image1: TImage;
    MainLogo: TImage;
    btnAbout: TImage;
    btnHelp: TImage;
    btnEnd: TImage;
    FlatHint1: TFlatHint;
    btnMyGallery: TImage;
    btnNewAlbum: TImage;
    btnShowAlbum: TImage;
    ThemeManager1: TThemeManager;
    procedure FormCreate(Sender: TObject);
    procedure MoveForm(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnHelpClick(Sender: TObject);
    procedure btnEndClick(Sender: TObject);
    procedure btnNewAlbumClick(Sender: TObject);
    procedure btnShowAlbumClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses frmNewEdit, frmView;

{$R *.DFM}
{$R WinXP.res}

procedure TMainForm.FormCreate(Sender: TObject);
var
	PanelRgn, ChildRgn: HRGN;
begin
	PanelRgn := CreateRectRgn(0,0,Width,Height);

	ChildRgn := CreateRectRgn(0,0,9,9);
	CombineRgn(PanelRgn,PanelRgn,ChildRgn, RGN_XOR);
	ChildRgn := CreateRectRgn(0,411,9,420);
	CombineRgn(PanelRgn,PanelRgn,ChildRgn, RGN_XOR);
	ChildRgn := CreateRectRgn(551,411,560,420);
	CombineRgn(PanelRgn,PanelRgn,ChildRgn, RGN_XOR);
	ChildRgn := CreateRectRgn(551,0,560,9);
	CombineRgn(PanelRgn,PanelRgn,ChildRgn, RGN_XOR);

	ChildRgn := CreateRectRgn(0,16,9,404);
	CombineRgn(PanelRgn,PanelRgn,ChildRgn, RGN_XOR);
	ChildRgn := CreateRectRgn(551,16,560,404);
	CombineRgn(PanelRgn,PanelRgn,ChildRgn, RGN_XOR);
	ChildRgn := CreateRectRgn(16,0,544,9);
	CombineRgn(PanelRgn,PanelRgn,ChildRgn, RGN_XOR);
	ChildRgn := CreateRectRgn(16,411,544,420);
	CombineRgn(PanelRgn,PanelRgn,ChildRgn, RGN_XOR);

	SetWindowRgn(Handle, PanelRgn, True);
end;

procedure TMainForm.MoveForm(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
        if ssleft in shift then
	begin
		ReleaseCapture;
		MainForm.Perform(WM_syscommand, $F012, 0);
	end;
end;

procedure TMainForm.btnHelpClick(Sender: TObject);
begin
	Application.MessageBox('Pomoc dla programu jest niedostêpna w tej wersji...','Informacja...',MB_OK+MB_ICONINFORMATION+MB_DEFBUTTON1);
end;

procedure TMainForm.btnEndClick(Sender: TObject);
begin
	Application.Terminate;
end;

procedure TMainForm.btnNewAlbumClick(Sender: TObject);
begin
	NewEditForm.IsNew:=True;
	NewEditForm.ShowModal;
end;

procedure TMainForm.btnShowAlbumClick(Sender: TObject);
begin
	ViewAlbum.ShowModal;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
	if ParamStr(2)='' then
	begin
		if ExtractFileExt(ParamStr(1))='.maf' then
		begin
			if not FileExists(ParamStr(1)) then exit;
			ViewAlbum.CurrentFileName:=ParamStr(1);
			ViewAlbum.ShowModal;
			Application.Terminate;
		end;
		if ExtractFileExt(ParamStr(1))='.sd2k' then
		begin
			if not FileExists(ParamStr(1)) then exit;
			NewEditForm.OpenProject(ParamStr(1));
			NewEditForm.ShowModal;
			Application.Terminate;
		end;
	end;
end;

end.
