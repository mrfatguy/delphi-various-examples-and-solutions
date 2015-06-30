program SampleSaver;

uses
  Forms,
  sUnit1 in 'sUnit1.pas' {Form1},
  pasStructureStore in 'pasStructureStore.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
