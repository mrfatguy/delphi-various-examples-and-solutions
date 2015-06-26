program HitRat;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  About in 'About.pas' {AboutBox},
  Ctrl in 'Ctrl.pas' {CtrlForm},
  HighScore in 'HighScore.pas' {HighScoreForm};

{$R *.RES}
{$R graphics.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TCtrlForm, CtrlForm);
  Application.CreateForm(THighScoreForm, HighScoreForm);
  Application.Title := 'Hit The Rat !';
  Application.Run;
end.
