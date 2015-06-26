
(****************************************************************)
(*                                                              *)
(*              Copyright (c) 2001 by Adam Boduch               *)
(*              http://PROGRAMOWANIE.OF.PL                      *)
(*              boduch@poland.com                               *)
(*                                                              *)
(****************************************************************)

unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

uses Registry;

procedure TMainForm.Button1Click(Sender: TObject);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;  // otworz rejestr
  try
    try
      Reg.RootKey := HKEY_CLASSES_ROOT; // odpowiedni klucz otworz :)
      Reg.OpenKey( // Utworz klucz
      '.rzi', True);
      Reg.WriteString('', 'RziFile'); // dodaj typ klucza
      Reg.CloseKey;  // zamknij klucz
      Reg.OpenKey(  // stworz klucz oznaczajacy ikone
      'rzifile\DefaultIcon', True);
      Reg.WriteString('', Application.ExeName + ',1');
      Reg.CloseKey;
      Reg.OpenKey(  // stworz kolejny...
      'rzifile\shell\open\command', True);  // akcja po nacisnieciu
      Reg.WriteString('','"'+Application.ExeName+'" "%1"');// wpisz sciezke programu
      Reg.CloseKey;
      Reg.OpenKey(
      'rzifile\shell\Edytuj', True); // stworz nowe pozycje - Edyuj
      Reg.WriteString('', 'Otwórz w programie...'); // tekst pozycji
      Reg.CloseKey;
      Reg.OpenKey(  // stworz akcje po nacisnieciu
      'rzifile\shell\Edytuj\command', True);
      Reg.WriteString('', '"' + Application.ExeName + '" "%1"'); // dopisz sciezke programu
    except
      raise Exception.Create('B³¹d! Wyst¹pi³ b³¹d wzwi¹zany z rejestrem!');
    end;
  finally
    Reg.Free;
  end;
  Application.MessageBox('Rejestracja uda³a siê! Stwórz teraz jakiœ plik z rozszerzeniem *.rzi');
end;

procedure TMainForm.Button2Click(Sender: TObject);
var
  Reg: TRegistry;
begin
{  usuwa rozszerzenie }
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.DeleteKey('.rzi');  // usun klucz
    Reg.DeleteKey('rzifile');
  finally
    Reg.Free;
  end;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
{  jezeli uzytkownik kliknie na plik z rozszerzeniem - otworz program }
  if ParamCount > 0 then
    Panel1.Caption := ParamStr(1);
end;

end.
