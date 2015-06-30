unit frmPreview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls;

type
  TPreviewForm = class(TForm)
    sbMain: TScrollBox;
    imgPreview: TImage;
    procedure FormPaint(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CloseForm(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PreviewForm: TPreviewForm;

implementation

{$R *.DFM}

procedure TPreviewForm.FormPaint(Sender: TObject);
begin
	if (imgPreview.Width<sbMain.Width) and (imgPreview.Height<sbMain.Height) then
	begin
		imgPreview.Left:=(sbMain.Width div 2)-(imgPreview.Width div 2);
		imgPreview.Top:=(sbMain.Height div 2)-(imgPreview.Height div 2);
	end
	else
	begin
		imgPreview.Left:=0;
		imgPreview.Top:=0;
	end;
end;

procedure TPreviewForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if Key=27 then Close;
end;

procedure TPreviewForm.CloseForm(Sender: TObject);
begin
	Close;
end;

end.
