program OEMSet;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  frmInfo in 'frmInfo.pas' {Info};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'OEMSet 1.00';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TInfo, Info);
  Application.Run;
end.
