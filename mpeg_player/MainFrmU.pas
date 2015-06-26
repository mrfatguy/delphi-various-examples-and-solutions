{      Player v. ALFA ource                }
{ Copyright (C) 2000 by Adam Boduch        }
{ E-mail: boduch@poland.com                }
{ Web Page: http://www.programowanie.of.pl }

{ Kod ten nie moze sie znalezc na innej    }
{ niz na podanym wyzej adresie strony bez  }
{ zgody autora.                            }

unit MainFrmU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MPlayer, StdCtrls, ExtCtrls, ComCtrls, Menus, Buttons, MMSystem, Registry,
  ToolWin, ImgList;

type
  TMainFrm = class(TForm)
    HomeMenu: TMainMenu;
    File1: TMenuItem;
    FileOpen: TMenuItem;
    N1: TMenuItem;
    StatusB: TStatusBar;
    Open: TOpenDialog;
    PP: TPanel;
    TextPanel: TPanel;
    Scroll: TScrollBar;
    Player: TMediaPlayer;
    Timer: TTimer;
    Sound: TTrackBar;
    Image1: TImage;
    Exit: TMenuItem;
    Close: TMenuItem;
    Widok1: TMenuItem;
    FullS: TMenuItem;
    N2: TMenuItem;
    OnTop: TMenuItem;
    Bar: TToolBar;
    Play: TToolButton;
    Pause: TToolButton;
    ImageList: TImageList;
    Stop: TToolButton;
    About1: TMenuItem;
    procedure FileOpenClick(Sender: TObject);
    procedure ScrollScroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure TimerTimer(Sender: TObject);
    procedure PlayerNotify(Sender: TObject);
    procedure SoundChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure PPClick(Sender: TObject);
    procedure CloseClick(Sender: TObject);
    procedure FullSClick(Sender: TObject);
    procedure OnTopClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PauseClick(Sender: TObject);
    procedure PlayClick(Sender: TObject);
    procedure StopClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
  private
     Button: TMPBtnType;
    procedure ShowText(Text: String);

  public
    FName : String;
    Tx : String;
  end;

var
  MainFrm: TMainFrm;

implementation

uses BigFrmU;

{$R *.DFM}


procedure TMainFrm.ShowText(Text: String);
begin
{
Procedura, ktora wyswietla w Panelu tekst.
}
   TextPanel.Caption := Text;
end;

procedure TMainFrm.FileOpenClick(Sender: TObject);

begin
 try

  if Open.Execute then


    FName := Open.FileName;  //Przypisanie sciezki zmiennej

    Player.FileName := FName;  //Przypisanie Playerowi zmiennej
    Player.Open; //Otwarcie filmu

    Player.Display := PP; { Przypisanie Playerowi obszaru
    wyswietlania jako Panel }
    Player.DisplayRect := PP.ClientRect; { Dopasowanie rozmiarow
    filmu do rozmiarow Panela }

    Scroll.Position := 0; //Wskaznik na 0

    Tx := ExtractFileName(Player.FileName); //Odlaczenie nazwy pliku od sciezki
    ShowText(Tx); // i wyswietlenie jej w Panelu "TextPanel"
    Caption := Tx;

 except
   on EMCIDeviceError do
    raise Exception.Create(Format(
    'Nie mogê otworzyæ pliku o rozszerzeniu %s. SprawdŸ czy plik nie '+
    'jest uszkodzony lub czy prawid³owy jest jego format danych.',
    [ExtractFileExt(Player.FileName)]));
 end;

end;

procedure TMainFrm.ScrollScroll(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
begin
{
Pozycja Playera rownac sie bedzie pozycji Scroll'a.
Jezeli zmieni sie pozycja Scroll'a "przewinie" sie film
}
  Player.Position := Scroll.Position;
end;

procedure TMainFrm.TimerTimer(Sender: TObject);
begin
{ j/w }
 Scroll.Position := Player.Position;
end;

procedure TMainFrm.PlayerNotify(Sender: TObject);
begin  // jezeli film sie skonczy
  if Player.NotifyValue = nvSuccessful then  //Jezeli operacja sie zakonczy
  begin
    Timer.Enabled := False;  // wylaczenie Timer'a
    Scroll.Position := Scroll.Position;  //Scroll na tej samej pozycji
    Player.Stop;

    StopClick(Sender);
 end;

end;

procedure TMainFrm.SoundChange(Sender: TObject);
begin  //Ustawienie glosnosci...
  case Sound.Position of
    1:
    WaveOutSetVolume(0, $20002000);{2000}
  2:
    WaveOutSetVolume(0, $60006000); {6000}
  3: 
    WaveOutSetVolume(0, $80008000); {8000}
  4:
    WaveOutSetVolume(0, $90009000);  {9000}
  5:
    WaveOutSetVolume(0, $FFFFFFFF);{dzwkek na maxa}
  end;   
end;

procedure TMainFrm.FormCreate(Sender: TObject);
var
  Reg : TRegistry;
  Key : Boolean;
  I : Integer;
  S : String;
begin
// wcztyaj wartosci z rejestru

  Reg := TRegistry.Create;
    try
      Key := Reg.OpenKey(
             'Software\Player', False);
      if Key then
      begin
        Top := Reg.ReadInteger('Top');
        Left := Reg.ReadInteger('Left');
        OnTop.Checked := Reg.ReadBool('StayOnTop');
      end else
        OnTop.Checked := False;
    finally
      Reg.Free;
    end;     
end;

procedure TMainFrm.Image1Click(Sender: TObject);
begin
  Sound.Position := 1;  //Wyciszenie
end;

procedure TMainFrm.PPClick(Sender: TObject);
begin
  try
    Player.Pause;
    ShowText('Wciœniêto pauze...');
  except
    ShowText('Brak filmu...');
  end;
end;

procedure TMainFrm.CloseClick(Sender: TObject);
begin
  Player.Close; // Zamkniecie filmu
  ShowText('Film zosta³ zamkniêty.');//Wyswietlenie textu
  Caption := 'Player';
end;

procedure TMainFrm.FullSClick(Sender: TObject);
begin

    FullForm.BorderStyle := bsNone; // ukryj pasek
    FullForm.WindowState := wsMaximized; // okno na maxa
    Player.Display := FullForm.FullPanel;// obraz na Panelu
    with FullForm.FullPanel do // rozmiar panellu do rozmiaru filmu
    Player.DisplayRect := Rect(0, 0, Width, Height);

  OnTop.Checked := False;
  FullForm.ShowModal; // Wyswietlenie okna 2
end;

procedure TMainFrm.OnTopClick(Sender: TObject);
begin
{ Zawrze na wierzchu }
 OnTop.Checked := not OnTop.Checked;
 if OnTop.Checked = True then
 FormStyle := fsStayOnTop;
end;

procedure TMainFrm.FormDestroy(Sender: TObject);
var
  Reg : TRegistry;
begin
  Reg := TRegistry.Create;

  try
    Reg.OpenKey(
    'Software\Player', True);
   // zapisz pozycje okna
      Reg.WriteInteger('Top', Top);
      Reg.WriteInteger('Left', Left);
  // zapisz pozycje "StayOnTop"
      Reg.WriteBool('StayOnTop',OnTop.Checked);
  finally
    Reg.Free;
  end;
end;

procedure TMainFrm.PauseClick(Sender: TObject);
begin  // pauza
 try
   Player.Pause;  // pauzuj film
   Play.Down := False; // przyciski "odcisniete"
   Stop.Down := False;
   Pause.Down := True;
   ShowText('Wciœniêto pauze...'); // zmien tekst
 except   // wyjatek
   Pause.Down := False;
     raise Exception.Create(
     'Film nie jest odtwarzany!');
 end;
end;

procedure TMainFrm.PlayClick(Sender: TObject);
begin
 try
  Scroll.Max := Player.Length; //Przypisanie msx. wartosci do dlugosci filmu
  Timer.Enabled := True; // Wlaczenie Timer'a
  ShowText('Trwa odtwarzanie...');
  Player.Play;
  Play.Down := True;
  Stop.Down := False;
  Pause.Down := False;
 except
   Play.Down := False;
   raise Exception.Create(
   'Najpierw musisz wybrac film do otwarcia!');
 end;
end;

procedure TMainFrm.StopClick(Sender: TObject);
begin
 try
  Player.Stop;
  Play.Down := False;
  Pause.Down := False;
  Stop.Down := True;
  ShowText('Zatrzymano film...');
 except
   Stop.Down := False;
     raise Exception.Create(
     'Nie mo¿na wy³¹czyæ filmu poniewa¿ nie jest on odtwarzany!');
 end;    
end;

procedure TMainFrm.About1Click(Sender: TObject);
begin
  MessageDlg(
  '   Player v. BETA '+#13+#13+
  'Autor: Adam Boduch '+#13+
  'E-mail: boduch@poland.com '+ #13+
  '  http://www.programowanie.of.pl',mtInformation,
  [mbOK], 0);
end;

end.
