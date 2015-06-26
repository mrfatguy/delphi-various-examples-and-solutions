program SQLQuery;

uses
  Forms,
  Windows,
  Dialogs,
  frmMain in 'frmMain.pas' {MainForm},
  mysql in 'mysql.pas',
  frmLog in 'frmLog.pas' {LogWindow};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'SQLQuery';
  Application.CreateForm(TLogWindow, LogWindow);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
