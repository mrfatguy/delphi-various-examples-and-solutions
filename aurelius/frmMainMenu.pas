unit frmMainMenu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, RVScroll, RichView, RVStyle;

type
  TMainMenu = class(TForm)
    Back: TPaintBox;
    RVStyle1: TRVStyle;
    rv: TRichView;
    Edit1: TEdit;
    Button1: TButton;
    Timer1: TTimer;
    procedure FormPaint(Sender: TObject);
    procedure AnimateAdd(Tekst: String; Style: Integer; NewLine: Boolean);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ProcessCommand(Command: String);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    rvLines: Integer;
  public
    { Public declarations }
  end;

var
  MainMenu: TMainMenu;

implementation

uses frmSetup, frmBack, frmIntro, Procs, frmHelp, frmNewGame;

{$R *.DFM}

procedure TMainMenu.FormPaint(Sender: TObject);
begin
DrawOutline(Back,'Konsola');
end;

procedure TMainMenu.AnimateAdd(Tekst: String; Style: Integer; NewLine: Boolean);
var
        a: Integer;
begin
if NewLine then
begin
        rv.AddTextNL('',Style,0,0);
        Inc(rvLines);
        if rvLines>=7 then
        begin
                rvLines:=1;
                rv.Clear;
        end;
end;
for a:=1 to Length(Tekst) do
begin
        rv.Add(Copy(Tekst,a,1),Style);
        rv.Format;
        MakeDelay(20);
end;
rv.ScrollTo(rv.DocumentHeight);
end;

procedure TMainMenu.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
        ucmd: String;
begin
if (Key=13) and (Edit1.Text<>'') then
begin
        Edit1.Enabled:=False;
        ucmd:=Edit1.Text;
        Edit1.Text:='';
        ucmd:=AnsiLowerCase(ucmd);
        AnimateAdd('> '+ucmd,1,True);
        ProcessCommand(ucmd);
        Edit1.Enabled:=True;
        Edit1.SetFocus;
end;
end;

procedure TMainMenu.ProcessCommand(Command: String);
var
        MRCode: Integer;
begin
if Pos(' ', Command)<>0 then
begin
        AnimateAdd('Polecenie nie mo¿e zawieraæ znaku odstêpu.',0,True);
        exit;
end;
if (Command='zamknij') or (Command='koniec') or (Command='zakoñcz') then
begin
        ShowCursor(True);
        MRCode:=ShowInfo('PotwierdŸ zerwanie po³¹czenia...','Czy napewno chcesz przerwaæ po³¹czenie z obecn¹ bramk¹ Aureliusa ???',2);
        ShowCursor(False);
        if MRCode=7 then exit;
        Application.ProcessMessages;
        {AnimateAdd('Trwa zamykanie systemu...',0,True);
        MakeDelay(1000);
        AnimateAdd('### Wyrzucenie œwiadomoœci...',0,True);
        MakeDelay(1000);
        AnimateAdd(' OK',1,False);
        MakeDelay(200);
        AnimateAdd('### Deaktywujê transformacje G-G...',0,True);
        MakeDelay(1000);
        AnimateAdd(' OK',1,False);
        MakeDelay(1000);
        AnimateAdd('Do zobaczenia...',0,True);
        MakeDelay(200);}
        ShowCursor(True);
        BackForm.EndGame;
        exit;
end;
if (Command='konfiguruj') or (Command='konfiguracja') then
begin
        AnimateAdd('Otwieram modu³ konfiguracyjny...',0,True);
        MakeDelay(500);
        ShowCursor(True);
        SetupForm.ShowModal;
        ShowCursor(False);
        if SetupForm.ModalResult=mrCancel then MainMenu.AnimateAdd('Konfiguracja anulowana...',0,True);
        if SetupForm.ModalResult=mrOK then MainMenu.AnimateAdd('Konfiguracja zapisana...',0,True);
        exit;
end;
if (Command='nowy') or (Command='utwórz_nowy') then
begin
        AnimateAdd('Otwieram modu³ kreacji nowego obrazu...',0,True);
        MakeDelay(500);
        ShowCursor(True);
        NewGame.ShowModal;
        ShowCursor(False);
        exit;
end;
if (Command='poka¿_intro') or (Command='intro') then
begin
        AnimateAdd('Usi¹dŸ wygodnie i zrelaksuj siê...',0,True);
        MakeDelay(500);
        with BackForm.mm do
        begin
                Stop;
                Eject;
                Close;
        end;
        IntroForm.ShowIntro;
        with BackForm.mm do
        begin
                FileName:=DataPath+'main.mid';
                Wait:=True;
                Open;
                Play;
        end;
        AnimateAdd('Prezentacja zakoñczona...',0,True);
        exit;
end;
if Command='wersja' then
begin
        AnimateAdd('System ',0,True);
        AnimateAdd(' Aurelius ',1,False);
        AnimateAdd('(wersja '+GameVersion+')',0,False);
        exit;
end;
if Command='pomoc' then
begin
        AnimateAdd('Odczytujê dane systemu pomocy...',0,True);
        Help.TrybPracy.Caption:='Help';
        Help.OpenHelp;
        AnimateAdd(' OK',1,False);
        MakeDelay(500);
        AnimateAdd('Otwieram modu³ pomocy...',0,True);
        MakeDelay(500);
        Help.rvText.Clear;
        Help.rvText.Add('Wybierz interesuj¹cy Ciê temat z listy znajduj¹cej siê po lewej stronie.',0);
        Help.rvText.Format;
        ShowCursor(True);
        Help.ShowModal;
        ShowCursor(False);
        AnimateAdd('Po³¹czenie zamkniête...',0,True);
        exit;
end;
if (Command='historia') or (Command='historia_gry') then
begin
        AnimateAdd('Odczytujê dane...',0,True);
        Help.TrybPracy.Caption:='History';
        Help.OpenHelp;
        AnimateAdd(' OK',1,False);
        MakeDelay(500);
        AnimateAdd('Otwieram modu³...',0,True);
        MakeDelay(500);
        Help.rvText.Clear;
        Help.rvText.Add('Modu³ ten pozwala œledziæ zmiany w kolejnych wersjach i wydaniach gry.',0);
        Help.rvText.Add(' Wybierz interesuj¹c¹ Ciê datê z listy znajduj¹cej siê po lewej stronie.',0);
        Help.rvText.Format;
        ShowCursor(True);
        Help.ShowModal;
        ShowCursor(False);
        AnimateAdd('Po³¹czenie zamkniête...',0,True);
        exit;
end;
{if Command='test' then
begin
        ShowCursor(True);
        ShowInfo('Testowanie...','To jest tylko informacja testowa i absolutnie nic wiêcej !!!',1);
        ShowCursor(False);
        exit;
end;}
AnimateAdd('Polecenie nieznane...',0,True);
end;

procedure TMainMenu.FormShow(Sender: TObject);
begin
ShowCursor(False);
Timer1.Enabled:=True;
end;

procedure TMainMenu.Timer1Timer(Sender: TObject);
begin
Timer1.Enabled:=False;
{Randomize;
AnimateAdd('### Aktywujê transformacje G-G...',0,True);
MakeDelay(1000);
AnimateAdd(' OK',1,False);
MakeDelay(200);
AnimateAdd('### Transport œwiadomoœci...',0,True);
MakeDelay(1000);
AnimateAdd(' OK',1,False);
MakeDelay(200);
AnimateAdd('### Wejœcie do systemu w wêŸle ',0,True);
AnimateAdd(IntToStr(Random(99999))+'.'+IntToStr(Random(99999)),1,False);
AnimateAdd(' ',0,True);
MakeDelay(1000);
AnimateAdd('Aurelius '+GameVersion,1,True);
AnimateAdd(' Witaj w systemie Podró¿niku!',0,False);
AnimateAdd('Dostêp do pomocy on-line: wpisz',0,True);
AnimateAdd(' pomoc',1,False);
AnimateAdd('...',0,False);
rvLines:=6;}
Edit1.Enabled:=True;
Edit1.SetFocus;
end;

end.
