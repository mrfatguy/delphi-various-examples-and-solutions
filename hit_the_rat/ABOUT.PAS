unit About;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ShellAPI;

type
  TAboutBox = class(TForm)
    OKButton: TButton;
    CloseImage: TImage;
    AboutImage: TImage;
    procedure CloseImageClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CloseImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CloseImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure AboutImageClick(Sender: TObject);
    procedure AboutImageMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

uses Main;

{$R *.DFM}


procedure TAboutBox.CloseImageClick(Sender: TObject);
begin
     OKButton.Click;
end;

procedure TAboutBox.FormCreate(Sender: TObject);
begin
     AboutBox.ClientWidth := AboutBitmap.Width;
     AboutBox.ClientHeight := AboutBitmap.Height;
     AboutImage.Picture.Bitmap := AboutBitmap;
     CloseImage.Top := 135;
     CloseImage.Left := 240;
     CloseImage.Picture.Bitmap := OKUPButtonBitmap;
end;

procedure TAboutBox.CloseImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     if Button = mbLeft then CloseImage.Picture.Bitmap := OKDOWNButtonBitmap;
end;

procedure TAboutBox.CloseImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     if Button = mbLeft then CloseImage.Picture.Bitmap := OKUPButtonBitmap;
end;

procedure TAboutBox.AboutImageClick(Sender: TObject);
var
   MouseCo: TPoint;
begin
     GetCursorPos(MouseCo);
     if PtInRect(RECT(60,78,260,98),ScreenToClient(MouseCo)) then
        ShellExecute(0, nil, pchar('http://friendsoft.yeah.net'), nil, nil, SW_MAXIMIZE);
     if PtInRect(RECT(85,103,235,118), ScreenToClient(MouseCo)) then
        ShellExecute(0, nil, pchar('mailto:xhq@writeme.com'), nil, nil, SW_SHOWNORMAL);

end;

procedure TAboutBox.AboutImageMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
     if PtInRect(RECT(60,78,260,98),Point(X, Y)) Or
        PtInRect(RECT(85,103,235,118),Point(X, Y))
     then
        Cursor := crHandPoint
     else
         Cursor := crDefault;

end;

procedure TAboutBox.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     CloseImage.Picture.Bitmap := OKDOWNButtonBitmap;
end;

procedure TAboutBox.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     CloseImage.Picture.Bitmap := OKUPButtonBitmap;
     OKButton.Click;
end;

end.

