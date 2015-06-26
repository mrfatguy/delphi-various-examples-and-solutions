unit frmNewGame;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ImgBtn, Buttons;

type
  TNewGame = class(TForm)
    Back: TPaintBox;
    Label2: TLabel;
    btnCancel: TImgBtn;
    btnHelp: TImgBtn;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    procedure FormPaint(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewGame: TNewGame;

implementation

{$R *.DFM}

uses Procs, frmHelp;

procedure TNewGame.FormPaint(Sender: TObject);
begin
DrawOutline(Back,'Utwórz nowy obraz Podró¿nika');
end;

procedure TNewGame.btnCancelClick(Sender: TObject);
begin
Close;
end;

procedure TNewGame.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=27 then btnCancelClick(self);
if Key=112 then btnHelpClick(self);
end;

procedure TNewGame.btnHelpClick(Sender: TObject);
begin
        Help.TrybPracy.Caption:='Help';
        Help.OpenHelp;
        ShowCursor(True);
        Help.rvListJump(self,2);        
        Help.ShowModal;
        ShowCursor(False);
end;

end.
