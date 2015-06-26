{ Copyright (c) 2000 By Adam Boduch }
{     bald@pf.pl                    }

unit BigFrmU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type
  TFullForm = class(TForm)
    FullPanel: TPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FullForm: TFullForm;

implementation

uses MainFrmU;

{$R *.DFM}

procedure TFullForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{
Ta procedura zamyka okno i wyswietla film
na formie pierwszej.
}
  if Key = 27 then
  begin // Jezeli nacisnieto ESC
    MainFrm.Player.Display := MainFrm.PP;
    MainFrm.PLayer.DisplayRect := MainFrm.PP.ClientRect;
    FullForm.Close;
  end;
end;

end.
