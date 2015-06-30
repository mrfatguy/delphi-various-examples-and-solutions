unit frmPhotoInfo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons;

type
  TPhotoInfoForm = class(TForm)
    gbPhoto: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    lblTitle: TLabel;
    lblAuthor: TLabel;
    gbFile: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    lblNumber: TLabel;
    lblType: TLabel;
    gbParams: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    lblPass: TLabel;
    lblRedist: TLabel;
    gbDesc: TGroupBox;
    lblDesc: TLabel;
    btnClose: TSpeedButton;
    sbPrev: TSpeedButton;
    sbNext: TSpeedButton;
    lblDims: TLabel;
    Label6: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure sbPrevClick(Sender: TObject);
    procedure sbNextClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PhotoInfoForm: TPhotoInfoForm;

implementation

uses frmView;

{$R *.DFM}

procedure TPhotoInfoForm.btnCloseClick(Sender: TObject);
begin
	Close;
end;

procedure TPhotoInfoForm.sbPrevClick(Sender: TObject);
begin
	ViewAlbum.PrevPhoto;
end;

procedure TPhotoInfoForm.sbNextClick(Sender: TObject);
begin
	ViewAlbum.NextPhoto;
end;

procedure TPhotoInfoForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
	max: Integer;
begin
	if (Key=38) or (Key=37) or (Key=33) or (Key=8) then ViewAlbum.PrevPhoto;
	if (Key=39) or (Key=40) or (Key=34) or (Key=32) then ViewAlbum.NextPhoto;
	if Key=36 then ViewAlbum.ShowPhoto(0);
	if Key=35 then
	begin
		max:=StrToIntDef(ViewAlbum.Photos.Values['PhotoCount'],0)-1;
		if max=-1 then exit;
		ViewAlbum.ShowPhoto(max);
	end;
end;

end.
