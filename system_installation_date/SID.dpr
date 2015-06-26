program SID;

uses
  Forms,
  frmMain in 'frmMain.pas' {MainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'System Installation Date';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
