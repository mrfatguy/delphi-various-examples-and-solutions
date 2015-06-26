unit frmMyInputDialog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TInputDialogForm = class(TForm)
    eText: TEdit;
    ctnOK: TButton;
    btnCancel: TButton;
    lText: TLabel;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InputDialogForm: TInputDialogForm;

implementation

{$R *.DFM}

procedure TInputDialogForm.FormShow(Sender: TObject);
begin
        eText.SetFocus;
        eText.SelectAll;
end;

end.
