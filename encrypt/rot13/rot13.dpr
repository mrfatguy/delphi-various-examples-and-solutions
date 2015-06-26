program rot13;

uses
  Forms,
  main in 'main.pas' {frmMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'SkyEye''s ROT-13';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
