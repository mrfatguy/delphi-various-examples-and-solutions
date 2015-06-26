
(****************************************************************)
(*                                                              *)
(*              Copyright (c) 2002 by Adam Boduch               *)
(*                   http://4programmers.net                    *)
(*                    adam@4programmers.net                     *)
(*                                                              *)
(****************************************************************)

unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IdBaseComponent, IdHTTP,
  StdCtrls, ComCtrls, IdTCPClient, IdTCPConnection, IdComponent;

type
  TMainForm = class(TForm)
    Forum: TIdHTTP;
    gbPost: TGroupBox;
    edtTitle: TEdit;
    lblTitle: TLabel;
    lblNick: TLabel;
    edtNick: TEdit;
    lblEmail: TLabel;
    edtMail: TEdit;
    memBody: TMemo;
    btnSend: TButton;
    StatusBar: TStatusBar;
    Label1: TLabel;
    procedure btnSendClick(Sender: TObject);
    procedure ForumConnected(Sender: TObject);
    procedure ForumWork(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure ForumWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.btnSendClick(Sender: TObject);
var
  Input, OutPut : TStringStream;
  ErrCode : String;
  BeginPos : Integer;
begin
{ stworzenie strumieni tekstowych }
  Input := TStringStream.Create('');
  Output := TStringStream.Create('');
  try
    btnSend.Enabled := False; // zablokowanie przycisku
  { dodanie do strumienia lancucha oznaczajcego dane nowego tematu na forum. Dane do tego
    lancucha pobierane sa z komponentow }
    Input.WriteString(Format('title=%s&name=%s&email=%s&body=%s', [edtTitle.Text, edtNick.Text, edtmail.Text, memBody.Lines.Text]));
    Forum.Post('http://4programmers.net/forum/message.php?action=create', // wyslanie danych ze strumienia do skryptu
      Input, Output);

    { strumien Output przechwytuje odpowiedz serwera, czyli kod HTML jaki wyswietlil skrypt }

    if Pos('<title>B³±d</title>', Output.DataString) <> 0 then  // jezeli wystapi taka linia
    begin
    { to znaczy, ze wystapil blad. Zadaniem ponizszych komend jest wyluskanie bledu
      z kodu HTML i wyswietlenie samego bledu. Na samym jednak poczatku nalezy pobirac
      polozenie znacznika </p> od ktoego to zaczyna sie wlasciwy komunikat bledu }
      BeginPos := Pos('</p>', Output.DataString)+4;
    { nastepnie nalezy pobrac koniec komunikatu bledu. W tym celu znajdujemy znacznik </center>
      ktory oznacza koniec komunikatu bledu. Odejmujemy jego pozycje od zmiennej BeginPos i uzyskujemy
      w ten sposob polozenie koncowe komunikatu bledu }
      ErrCode := Copy(Output.DataString, BeginPos, Pos('</center>', Output.DataString) - BeginPos);
    { teraz pozostaje juz tylko ten komunikat wyswietlic }
      MessageBox(Handle, PChar(Errcode), 'Wyst¹pi³ b³¹d podczas próbie wys³ania postu...', MB_OK + MB_ICONWARNING);
    end else Messagebox(Handle, 'Dziêkuje za wys³anie posta na forum dyskusjne 4programmers.net! WejdŸ na stronê www.4programmers.net, aby zobaczyæ swój post!',
    'Dziêkujemy...', MB_OK + MB_ICONINFORMATION);
  finally
  { zwolnienie zasobow }
    Input.Free;
    Output.Free;
    btnSend.Enabled := True;
  end;
end;

procedure TMainForm.ForumConnected(Sender: TObject);
begin
  StatusBar.SimpleText := 'Po³¹czony...';
end;

procedure TMainForm.ForumWork(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCount: Integer);
begin
// pokazanie procesu przesylania danych
  StatusBar.SimpleText := 'Pracuje... ' + IntToStr(AWorkCount) + '%';
end;

procedure TMainForm.ForumWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
begin
  if Forum.ResponseCode = 302 then Messagebox(Handle, 'Dziêkuje za wys³anie posta na forum dyskusjne 4programmers.net! WejdŸ na stronê www.4programmers.net, aby zobaczyæ swój post!',
    'Dziêkujemy...', MB_OK + MB_ICONINFORMATION);
  StatusBar.SimpleText := 'Zakoñczono i roz³¹czono. Przes³anie danych do skryptu... ' + (Forum.ResponseText)
end;

end.
