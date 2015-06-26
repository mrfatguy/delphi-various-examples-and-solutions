program Shellink;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  WinShell in '..\..\Utils\WinShell.pas',
  PickU in 'PickU.pas' {LinkForm},
  NewLinkU in 'NewLinkU.pas' {NewLinkForm},
  AboutU in 'AboutU.pas' {Aboutform};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
