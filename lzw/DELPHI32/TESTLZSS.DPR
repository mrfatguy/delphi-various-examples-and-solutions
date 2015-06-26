program testlzss;

uses
  Forms,
  testunit in 'testunit.pas' {Form1},
  Progress in 'Progress.pas' {ProgressForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TProgressForm, ProgressForm);
  Application.Run;
end.
