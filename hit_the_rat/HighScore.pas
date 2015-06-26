unit HighScore;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  THighScoreForm = class(TForm)
    CloseImage: TImage;
    OKButton: TButton;
    ScoreImage: TImage;
    procedure CloseImageClick(Sender: TObject);
    procedure CloseImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CloseImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HighScoreForm: THighScoreForm;

implementation

uses Main;

{$R *.DFM}

procedure THighScoreForm.CloseImageClick(Sender: TObject);
begin
     OKButton.Click;
end;

procedure THighScoreForm.CloseImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     if Button = mbLeft then CloseImage.Picture.Bitmap := OKDOWNButtonBitmap;
end;

procedure THighScoreForm.CloseImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     if Button = mbLeft then CloseImage.Picture.Bitmap := OKUPButtonBitmap;
end;

procedure THighScoreForm.FormCreate(Sender: TObject);
begin
     ClientWidth := HighScoreBitmap.Width;
     ClientHeight := HighScoreBitmap.Height;
     ScoreImage.Picture.Bitmap := HighScoreBitmap;
     CloseImage.Top := ClientHeight - 50;
     CloseImage.Left := (ClientWidth - 60)div 2 ;
     CloseImage.Picture.Bitmap := OKUPButtonBitmap;
end;

end.
