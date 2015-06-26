program RegisterForm;

uses
  Forms,
  frmMain in 'frmMain.pas' {MainForm},
  Inet in 'Inet.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Register Form';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
