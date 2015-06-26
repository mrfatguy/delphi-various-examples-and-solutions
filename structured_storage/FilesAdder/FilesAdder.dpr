program FilesAdder;

uses
  Forms,
  sUnit1 in 'sUnit1.pas' {MainForm},
  pasStructureStore in 'pasStructureStore.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'FilesAdder 1.00';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
