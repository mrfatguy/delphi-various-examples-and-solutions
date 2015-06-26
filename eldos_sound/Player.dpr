program Player;

uses
  Forms,
  main in 'main.pas' {PlayForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'MPegPlay demo player';
  Application.CreateForm(TPlayForm, PlayForm);
  Application.Run;
end.

