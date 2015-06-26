program Aurelius;

uses
  Forms,
  frmBack in 'frmBack.pas' {BackForm},
  Procs in 'Procs.pas',
  frmSetup in 'frmSetup.pas' {SetupForm},
  frmDecompress in 'frmDecompress.pas' {Decompress},
  frmIntro in 'frmIntro.pas' {IntroForm},
  frmMainMenu in 'frmMainMenu.pas' {MainMenu},
  frmHelp in 'frmHelp.pas' {Help},
  frmMessBox in 'frmMessBox.pas' {MessBox},
  frmNewGame in 'frmNewGame.pas' {NewGame};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Aurelius';
  Application.CreateForm(TDecompress, Decompress);
  Application.CreateForm(TBackForm, BackForm);
  Application.CreateForm(TSetupForm, SetupForm);
  Application.CreateForm(TIntroForm, IntroForm);
  Application.CreateForm(TMainMenu, MainMenu);
  Application.CreateForm(THelp, Help);
  Application.CreateForm(TMessBox, MessBox);
  Application.CreateForm(TNewGame, NewGame);
  Application.Run;
end.
