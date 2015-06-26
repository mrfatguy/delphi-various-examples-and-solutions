program Encrypter;

uses
  Forms,
  Encrypter1 in 'Encrypter1.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
