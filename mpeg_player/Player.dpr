(* Adam Boduch@poland.com *)

program Player;

uses
  Forms,
  MainFrmU in 'MainFrmU.pas' {MainFrm},
  BigFrmU in 'BigFrmU.pas' {FullForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainFrm, MainFrm);
  Application.CreateForm(TFullForm, FullForm);
  Application.Run;
end.
