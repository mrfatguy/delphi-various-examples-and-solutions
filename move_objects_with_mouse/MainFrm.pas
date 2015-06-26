
(****************************************************************)
(*                                                              *)
(*            TStream Test programme for Delphi 5               *)
(*       Copyright (c) 2001 by Service for programmers          *)
(*             HTTP://WWW.PROGRAMOWANIE.OF.PL                   *)
(*                E - mail:  boduch@poland.com                  *)
(*              27.04.2001 r.                                   *)
(*                                                              *)
(****************************************************************)

unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TMainForm = class(TForm)
    btnMove: TButton;
    procedure btnMoveMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnMoveMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnMoveMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnMoveClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

var
  MD : Boolean;
  P : TPoint;

procedure TMainForm.btnMoveMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  MD := True;  // klawisz myszy nacisniety
  P := Point(X, Y); // pobierz wspolrzedne kursora i przpisz do zmiennej P
end;

procedure TMainForm.btnMoveMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if MD then
  begin
    btnMove.Left := btnMove.Left + (X - P.X); // przesuwaj komponent
    btnMove.Top := btnMove.Top + (Y - P.Y);
    btnMove.OnClick := nil; // zdarzenie OnClick na razie nie wystepuje
  end;
end;

procedure TMainForm.btnMoveMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  MD := False;  // klawisz myszy nie jest juz wcisniety
  btnMove.OnClick := btnMoveClick; // przypisz zdarzenie OnClick
end;


procedure TMainForm.btnMoveClick(Sender: TObject);
var
  sComponentName : String;
begin
{
  Jezeli uzytkownik nacisnie przycisk to wyswietlane jest okno z polem do
  wpisania nowej nazwy ( Caption ) komponentu.
  Ta nowa wartosc przypisywana jest zmiennej sComponentName, ktora to z kolei
  zostaje przypisana nazwie ( Caption ) komponntu TButton.
}
  sComponentName := InputBox('Nowa nazwa komponentu:', 'Nazwa komponentu:', '');
  btnMove.Caption := sComponentName;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
var
  FileStream : TFileStream;
begin
  if FileExists('setup.txt') then // jezeli istnieje plik
    FileStream := TFileStream.Create('setup.txt', fmOpenWrite) else // otworz plik tylko do zapisu
  FileStream := TFileStream.Create('setup.txt', fmCreate); // w przeciwnym wypadku stworz plik

  FileStream.WriteComponent(btnMove); // zapisz ustawienia komponentu TButton
  FileStream.Free; // zwolnij zmienna
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  FileStream : TFileStream;
begin
  if not FileExists('setup.txt') then Exit; // jezeli plik nie istnieje - nie rob nic
  
  FileStream := TFileStream.Create('setup.txt', fmOpenRead); // otworz tylko do odczytu
  FileStream.ReadComponent(btnMove);  // odczytaj ustawienia komponentu
  FileStream.Free;
end;

end.
