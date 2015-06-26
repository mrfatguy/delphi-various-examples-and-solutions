program Instances;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  InterAppComm in '..\InterAppComm.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.ShowMainForm := False;
  Application.Run;
end.
