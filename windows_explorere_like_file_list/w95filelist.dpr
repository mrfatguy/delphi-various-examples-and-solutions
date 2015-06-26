program w95filelist;

uses
  Forms,
  main in 'main.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'MSt''s Sample App';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
