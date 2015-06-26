{______________________________________________________________________________

                     (c) 1998 Marcin Wieczorek ( T-1000 )
                         email:wieczor@polbox.com
 ______________________________________________________________________________}

program Agitacja;

uses
  Forms,
  UMainForm in 'UMainForm.pas' {MainForm},
  Engine in 'Engine.pas',
  Debug in 'Debug.pas',
  UOptionsForm in 'UOptionsForm.pas' {OptionsForm},
  UClientNetForm in 'UClientNetForm.pas' {ClientNetForm},
  UServerNetForm in 'UServerNetForm.pas' {ServerNetForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Agitacja';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TOptionsForm, OptionsForm);
  Application.CreateForm(TClientNetForm, ClientNetForm);
  Application.CreateForm(TServerNetForm, ServerNetForm);
  Application.Run;
end.
