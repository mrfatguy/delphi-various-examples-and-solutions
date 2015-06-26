
(****************************************************************)
(*                                                              *)
(*      Example programme geting IP address for Delphi 5        *)
(*       Copyright (c) 2001 by Service for programmers          *)
(*           Adam Boduch  -  Build: 18.03.2001                  *)
(*             HTTP://WWW.PROGRAMOWANIE.OF.PL                   *)
(*      E - mail:  boduch@poland.com                            *)
(*                                                              *)
(****************************************************************)

unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TMainForm = class(TForm)
    btnGetIPName: TButton;
    procedure btnGetIPNameClick(Sender: TObject);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

uses WinSock; // <-- wazny modul umozliwiajacy pobieranie adresu IP

procedure GetIPAndName(var IPAddress : PChar; var ACompName : PCHar);
var
  Host : PHostEnt;
  CompName : array[0..MAX_PATH] of char; // Nazwa zalogowanego uzytkownika
  IP : PChar; // adres IP komputera
begin
  //Pobieramy nazwê komputera i przypisujemy ja zmiennej "CompName"
  GetHostName(@CompName, MAX_PATH);
  Host := GetHostByName(@CompName); // uzyskanie nazway uzytkownika

  ACompName := Host^.h_name; // przypisanie zmiennej "ACompName" nazwy uzytkownika

  //Pobieramy jego adres IP  ( urzyte tu zostalo rzutowanie )
  IP := iNet_ntoa(PInAddr(Host^.h_addr_list^)^);

  IPAddress := IP; // przypisanie zmiennej "IPAddress" nazwy IP
end;

procedure TMainForm.btnGetIPNameClick(Sender: TObject);
var
  IP : PChar;
  CName : PCHar;
  TF : TextFile; // plik tekstowy
begin
{
  Wykonaj procedure i przypisz jej parametry dwom zmiennym: IP oraz CName
}
  GetIPandName(IP, CName);
  AssignFile(TF, 'C:\IP.txt'); // skojarz zmienna z nazwa tworzonego pliku
  try
    Rewrite(TF); // zapisz plik na dysku
    Writeln(TF, 'Adres IP: ' + IP); // zapisz do pliku linie
    Writeln(TF, 'Nazwa u¿ytkownika: ' + CName);
  finally
    CloseFile(TF); // zakoncz zapisywanie do pliku
  end;
end;

var
  VER : WORD;
  Data : TWSAData;

initialization
begin
 //£adujemy bibliotekê Winsock
  VER := MAKEWORD(1, 0);
  WSAStartup(VER, Data);
end;

finalization
  WSACleanup; // zwolnij biblioteke Winsock

end.


 