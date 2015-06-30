program PSDemo;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  Splash in 'Splash.pas' {SplashForm};

{$R *.RES}

begin
  Application.Initialize;
  with TSplashForm.Execute do
    try
      Application.CreateForm(TMainForm, MainForm);
    finally
      Free;
    end;
  Application.Run;
end.
