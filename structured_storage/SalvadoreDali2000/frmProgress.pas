unit frmProgress;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TProgressForm = class(TForm)
    pbProgress: TProgressBar;
    lblStatus: TLabel;
    btnCancel: TButton;
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ProgressForm: TProgressForm;

implementation

uses frmNewEdit;

{$R *.DFM}

procedure TProgressForm.btnCancelClick(Sender: TObject);
begin
	NewEditForm.ForceExit:=True;
end;

end.
