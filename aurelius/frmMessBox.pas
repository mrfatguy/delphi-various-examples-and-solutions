unit frmMessBox;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ImgBtn, StdCtrls;

type
  TMessBox = class(TForm)
    back: TPaintBox;
    Tytul: TPanel;
    btnOK: TImgBtn;
    Label1: TLabel;
    btnYes: TImgBtn;
    btnNo: TImgBtn;
    Odpowiedz: TPanel;
    procedure FormPaint(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnNoClick(Sender: TObject);
    procedure btnYesClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MessBox: TMessBox;

implementation

{$R *.DFM}

uses Procs;

procedure TMessBox.FormPaint(Sender: TObject);
begin
DrawOutline(Back,Tytul.Caption);
end;

procedure TMessBox.btnOKClick(Sender: TObject);
begin
Odpowiedz.Caption := '0';
Close;
end;

procedure TMessBox.btnNoClick(Sender: TObject);
begin
Odpowiedz.Caption := '7';
Close;
end;

procedure TMessBox.btnYesClick(Sender: TObject);
begin
Odpowiedz.Caption := '6';
Close;
end;

procedure TMessBox.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key=27) and (btnNo.Visible) then btnNoClick(self);
if (Key=27) and (btnOK.Visible) then btnOKClick(self);
if (Key=13) and (btnYes.Visible) then btnYesClick(self);
if (Key=13) and (btnOK.Visible) then btnOKClick(self);
end;

end.
