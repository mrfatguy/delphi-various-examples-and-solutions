program Sender;

uses
  Forms,
  MainSender in 'MainSender.pas' {Form1},
  InterAppComm in '..\InterAppComm.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
