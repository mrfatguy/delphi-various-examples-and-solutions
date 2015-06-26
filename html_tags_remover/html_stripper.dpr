program html_stripper;

uses
  Forms,
  frmMain in 'frmMain.pas' {MainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'HTML Stripper';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
