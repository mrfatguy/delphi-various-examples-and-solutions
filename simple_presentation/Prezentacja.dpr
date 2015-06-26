program Prezentacja;

uses
  Forms,
  pasProcs in 'pasProcs.pas',
  frmMain in 'frmMain.pas' {MainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Prezentacja pracy dyplomowej';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
