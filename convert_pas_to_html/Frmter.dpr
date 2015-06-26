program Frmter;

uses
  Forms,
  MForm in 'MForm.pas' {MainForm},
  FmtEng in 'FmtEng.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
