program Receiver;

uses
  Forms,
  MainReceiver in 'MainReceiver.pas' {Form1},
  InterAppComm in '..\InterAppComm.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
