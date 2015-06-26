program SumyKontr;

uses
  Forms,
  MainFrom in 'MainFrom.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Program do sprawdzania sumy kontrolnej';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
