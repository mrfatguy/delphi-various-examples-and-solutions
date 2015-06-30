unit frmMyInputDialog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TInputDialog = class(TForm)
    eText: TEdit;
    lText: TLabel;
    imgMain: TImage;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    imgQuestion: TImage;
    imgSecurity: TImage;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InputDialog: TInputDialog;

implementation

{$R *.DFM}

procedure TInputDialog.FormShow(Sender: TObject);
begin
        eText.SetFocus;
        eText.SelectAll;
end;

end.
