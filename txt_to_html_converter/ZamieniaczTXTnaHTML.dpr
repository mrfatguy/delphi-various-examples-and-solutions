program ZamieniaczTXTnaHTML;

uses
  Forms,
  frmMain in 'frmMain.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Zamieniacz TXT na HTML';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
