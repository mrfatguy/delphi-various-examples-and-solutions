program ExifReader;



{%File 'InkNames'}

uses
  Forms,
  frmMain in 'frmMain.pas' {MainForm},
  dEXIF in 'dEXIF.pas',
  msData in 'msData.pas';

{$R *.RES}
begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.ShowMainForm := False;
  Application.Run;
end.
