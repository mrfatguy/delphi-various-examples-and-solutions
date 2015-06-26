 
(****************************************************************)
(*                                                              *)
(*                      HelpEngine Source                       *)
(*               Copyright (c) 2001 by Adam Boduch              *)
(*                   http://4programmers.net                    *)
(*                   mailto:boduch@poland.com                   *)
(*                                                              *)
(****************************************************************)

unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TMainForm = class(TForm)
    edtSearch: TEdit;
    lbSearchStrings: TListBox;
    lblFound: TLabel;
    lblSearchWord: TLabel;
    procedure edtSearchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}
(*
  OPIS PROGRAMU
  -------------

  Procedura obslugi naprawde nie jest skomplikowna. Wszystko opiera sie na
  jednej (!) procedurze, ktora wszystko wykonuje. Opiera sie na petli for,
  ktora analizuje wszystkie pozycje komponentu TListBox i porownuje przy
  pomocy funkcji Pos ciag wpisanych juz znakow ze dana pozycja. Zeby nie bylo
  nieporozumien, to sprawdzany jest jeszcze warunek, a mianowicie, czy pierwsza
  litera szukanego tekstu jest zgodna z szukana opzjca - jezeli tak to
  dana pozycja jest zaznaczana, a petla przerwana...

*)

procedure TMainForm.edtSearchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i, Found : Integer;
begin
  for I := 0 to lbSearchStrings.Items.Count -1 do  // analizuj wszystkie pozycje
  begin
    Found := Pos(edtSearch.Text, lbSearchStrings.Items[i]); // szukaj ciagu znakow
    if (Found > 0) and (lbSearchStrings.Items[i][1] = edtSearch.Text[1]) then
    begin
      lbSearchStrings.ItemIndex := i; // jezeli znaleziono to zaznacz
      Break; // i przerwij dzialanie petli
    end;
  end;
end;

procedure TMainForm.edtSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then { jezeli nacisnieto przycisk Enter to pobirez w
  calosci zaznacznoa pozycje i wyswietl na komponencie lblFound }
    lblFound.Caption := 'Wybra³eœ opcjê: ' + lbSearchStrings.Items[lbSearchStrings.ItemIndex];
end;

end.
