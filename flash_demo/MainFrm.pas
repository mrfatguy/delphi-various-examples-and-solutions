             
(****************************************************************)
(*                                                              *)
(*             Copyright (c) 2002 by Adam Boduch                *)
(*                 http://4programmers.net                      *)
(*                  adam@4programmers.net                       *)
(*                                                              *)
(****************************************************************)

unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OleCtrls, ShockwaveFlashObjects_TLB, StdCtrls;

type
  TMainForm = class(TForm)
    Flash: TShockwaveFlash;
    procedure FormCreate(Sender: TObject);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);
begin
{ zaladowanie animacji Flasha }
  Flash.Movie := ExtractFilePath(Application.ExeName) + 'demo.swf';
{ uruchomienie aplikacji }
  Flash.Play;
end;

end.
