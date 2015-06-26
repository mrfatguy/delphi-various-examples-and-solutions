program string_coder;

uses
  Forms,
  frmMain in 'frmMain.pas' {MainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'String Coder';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
