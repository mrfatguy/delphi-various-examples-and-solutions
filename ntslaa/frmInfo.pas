unit frmInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ShellAPI;

type
  TInfoForm = class(TForm)
    bntClose: TButton;
    pnlTitle: TPanel;
    pnlSubtitle: TPanel;
    Label1: TLabel;
    procedure pnlUses1Click(Sender: TObject);
    procedure bntCloseClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InfoForm: TInfoForm;

implementation

{$R *.dfm}

procedure TInfoForm.pnlUses1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.dragonsoft.us/delphi_vcl.php', '', '', SW_SHOW);
end;

procedure TInfoForm.bntCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TInfoForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure TInfoForm.FormShow(Sender: TObject);
begin
  pnlTitle.Caption := Application.Title;
end;

end.
