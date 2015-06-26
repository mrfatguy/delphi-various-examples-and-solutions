program po2_add_notes;

uses
  Forms,
  frmMain in 'frmMain.pas' {MainForm},
  pasProcs in 'pasProcs.pas',
  frmMyInputDialog in 'frmMyInputDialog.pas' {InputDialogForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'po2_add_notes';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TInputDialogForm, InputDialogForm);
  Application.Run;
end.
