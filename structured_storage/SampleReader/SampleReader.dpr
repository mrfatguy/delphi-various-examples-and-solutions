program SampleReader;

uses
  Forms,
  rUnit1 in 'rUnit1.pas' {Form1},
  pasStructureStore in 'pasStructureStore.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
