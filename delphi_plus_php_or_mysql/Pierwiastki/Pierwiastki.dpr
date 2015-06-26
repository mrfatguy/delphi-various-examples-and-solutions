program Pierwiastki;

uses
  Forms,
  frmMain in 'frmMain.pas' {MainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Nietypowa internetowo-wikipediowa tablica Mendelejewa :)';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
