program Taskbar;

uses
  Forms,
  WinProcs,
  Task in 'TASK.PAS' {Bar};

{$R *.RES}

begin
  if HPrevInst <> 0 then exit;
  Application.CreateForm(TBar, Bar);
  Application.Run;
end.
