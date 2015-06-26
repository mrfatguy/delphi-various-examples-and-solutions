unit frmSetup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ImgBtn;

type
  TSetupForm = class(TForm)
    chkSS: TCheckBox;
    Back: TPaintBox;
    btnCancel: TImgBtn;
    btnOK: TImgBtn;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SetupForm: TSetupForm;

implementation

{$R *.DFM}

uses Procs, frmMainMenu;

procedure TSetupForm.btnOKClick(Sender: TObject);
begin
sett.DeactivateScreenSaver:=chkSS.Checked;
ProcessSettings;

Close;
ModalResult:=mrOK;
end;

procedure TSetupForm.btnCancelClick(Sender: TObject);
begin
Close;
SetupForm.ModalResult:=mrCancel;
end;

procedure TSetupForm.FormShow(Sender: TObject);
begin
chkSS.Checked:=sett.DeactivateScreenSaver;
end;

procedure TSetupForm.FormPaint(Sender: TObject);
begin
DrawOutline(Back,'Ustawienia programu');
end;

procedure TSetupForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=27 then btnCancelClick(self);
if Key=13 then btnOKClick(self);
end;

end.
