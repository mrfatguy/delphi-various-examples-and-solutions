program ntSLaA;

uses
  Forms,
  //Memcheck,
  frmMain in 'frmMain.pas' {MainForm},
  pasIfThen in 'pasIfThen.pas',
  frmInfo in 'frmInfo.pas' {InfoForm},
  frmSettings in 'frmSettings.pas' {SettingsForm},
  pasProcs in 'pasProcs.pas';

{$R *.res}

begin
  //MemChk;
  Application.Initialize;
  Application.Title := 'ntSLaA 1.00';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TInfoForm, InfoForm);
  Application.CreateForm(TSettingsForm, SettingsForm);
  Application.Run;
end.
