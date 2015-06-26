program FWD;

uses
  Forms,
  frmMain in 'frmMain.pas' {MainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'File Watch Dog 1.00';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
