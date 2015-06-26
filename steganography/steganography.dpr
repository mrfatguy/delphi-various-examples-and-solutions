program Stagenografia;

uses
  Forms,
  main_form in 'main_form.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
