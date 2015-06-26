unit main_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ActnList, ExtCtrls, StdCtrls, ComCtrls;

type
  TfrmMain = class(TForm)
    pcMain: TPageControl;
    tsText: TTabSheet;
    tsImage: TTabSheet;
    memText: TMemo;
    imgImage: TImage;
    ActionList1: TActionList;
    MainMenu1: TMainMenu;
    actOpenText: TAction;
    actOpenImage: TAction;
    actSaveCypher: TAction;
    actClose: TAction;
    actGenerateImage: TAction;
    Plik1: TMenuItem;
    Otwrzobraz1: TMenuItem;
    Otwrzobraz2: TMenuItem;
    N1: TMenuItem;
    Wygenerujobraz1: TMenuItem;
    Zapiszstagenograf1: TMenuItem;
    N2: TMenuItem;
    Zamknijprogram1: TMenuItem;
    oDialog: TOpenDialog;
    sDialog: TSaveDialog;
    actOpenCypher: TAction;
    Otwrzstagenograf1: TMenuItem;
    procedure actCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actOpenTextExecute(Sender: TObject);
    procedure actOpenImageExecute(Sender: TObject);
    procedure memTextChange(Sender: TObject);
    procedure actGenerateImageExecute(Sender: TObject);
    procedure actOpenCypherExecute(Sender: TObject);
    procedure actSaveCypherExecute(Sender: TObject);
  private
    { Private declarations }
    textReady: Boolean;
    imageReady: Boolean;
    cypherImage: TBitmap;

    procedure PrepareImage;
    procedure OpenCypher(FileName: String);
    procedure SaveCypher(FileName: String);

  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

const
  CYPHER_CODE = 'CYPHER~SIGNATURE';

implementation

{$R *.dfm}

procedure TfrmMain.actCloseExecute(Sender: TObject);
begin
  Close;
end;

//wyrysowanie jakiegoœ obrazka :o)
procedure TfrmMain.PrepareImage;
var
  i: Integer;
  box: TRect;
begin
  Randomize;
  with cypherImage do
  begin
    //przygotowanie bia³ego t³a :o)
    box := Rect(0, 0, Width, Height);
    Canvas.Brush.Color := RGB(Random(255), Random(255), Random(255));
    Canvas.FillRect(box);

    //narysowanie w losowych miejscach prostok¹tów
    for i := 0 to 80 do
    begin
      box.Left := Random(Width);
      box.Right := box.Left + Random(Width - box.Left);
      box.Top := Random(Height);
      box.Bottom := box.Top + Random(Height - box.Top);
      Canvas.Brush.Color := RGB(Random(255), Random(255), Random(255));
      if Random(2) = 1 then
        Canvas.Ellipse(box)
      else
        Canvas.FillRect(box);
    end;
  end;
  imgImage.Picture.Bitmap.Assign(cypherImage);
  imgImage.Repaint;
  pcMain.ActivePage := tsImage;
  imageReady := True;
end;

//tworzymy obrazek i ustawiamy jego parametry :o)
procedure TfrmMain.FormCreate(Sender: TObject);
begin
  cypherImage := TBitmap.Create;
  with cypherImage do
  begin
    Width := 800;
    Height := 600;
    PixelFormat := pf24bit;
  end;
end;

//wczytanie pliku tekstowego (tekst do zaszyfrowania)
procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  cypherImage.Free;
end;

procedure TfrmMain.actOpenTextExecute(Sender: TObject);
begin
  oDialog.Filter := 'Pliki tekstowe (*.txt)|*.txt';
  if oDialog.Execute then
  begin
    try
      memText.Lines.LoadFromFile(oDialog.FileName);
      pcMain.ActivePage := tsText;
    except
      MessageBox(Handle, 'Podczas odczytywania pliku wyst¹pi³ b³¹d!',
        PChar('B³¹d nr ' + IntToStr(GetLastError)), 16);
    end;
  end;
end;

//wczytanie obrazka, który bêdzie "noœnikiem" :o)
procedure TfrmMain.actOpenImageExecute(Sender: TObject);
begin
  oDialog.Filter := 'Bitmapy (*.bmp)|*.bmp';
  if oDialog.Execute then
  begin
    try
      imgImage.Picture.LoadFromFile(oDialog.FileName);
      with cypherImage do
      begin
        Canvas.Brush.Color := clBlack;
        Canvas.FillRect(Rect(0, 0, Width, Height));
        Canvas.Draw(0, 0, imgImage.Picture.Graphic);
      end;
      imgImage.Picture.Bitmap.Assign(cypherImage);
      imgImage.Repaint;
      imageReady := True;
      pcMain.ActivePage := tsImage;
    except
      MessageBox(Handle, 'Podczas odczytywania pliku wyst¹pi³ b³¹d!',
        PChar('B³¹d nr ' + IntToStr(GetLastError)), 16);
    end;
  end;
end;

//otwieranie pliku z zakodowanym tekstem
procedure TfrmMain.actOpenCypherExecute(Sender: TObject);
begin
  oDialog.Filter := 'Bitmapy (*.bmp)|*.bmp';
  if oDialog.Execute then OpenCypher(oDialog.FileName)
end;

//zapisywanie pliku z zakodowanym tekstem
procedure TfrmMain.actSaveCypherExecute(Sender: TObject);
begin
  if sDialog.Execute then SaveCypher(sDialog.FileName);
end;

//jeœli u¿ytkownik wpisa³ jakiœ tekst, mo¿na szyfrowaæ :o)
procedure TfrmMain.memTextChange(Sender: TObject);
begin
  textReady := memText.Text <> '';
end;

//wywo³anie procedury rysuj¹cej obrazek
procedure TfrmMain.actGenerateImageExecute(Sender: TObject);
begin
  PrepareImage;
end;

//otwarcie pliku z zakodowanym tekstem
procedure TfrmMain.OpenCypher(FileName: String);
var
  BMP: TBitmap;
  s: String;
  i, j, k, nr: Integer;
  bajt, b: Byte;
  linia: PByteArray;
begin
  BMP := TBitmap.Create;
  try
    try
      BMP.LoadFromFile(FileName);
      imgImage.Picture.Bitmap.Assign(BMP);
      imgImage.Repaint;
      s := '';
      nr := 0;
      bajt := 0;
      for i := 0 to BMP.Height - 1 do
      begin
        linia := BMP.ScanLine[i];
        for j := 0 to BMP.Width - 1 do
        begin
          //pobieramy kolejne bity
          bajt := bajt xor (linia[j] and 1);
          Inc(nr);
          //zgromadziliœmy ca³y bajt?
          if nr = 8 then
          begin
            //trzeba odwróciæ kolejnoœc bitów...
            b := 0;
            for k := 0 to 7 do
            begin
              b := b shl 1;
              b := b or (bajt and 1);
              bajt := bajt shr 1;
            end;
            //dodajemy nowo odkodowany tekst :o)
            s := s + Chr(b);
            nr := 0;
            bajt := 0;
          end;
          bajt := bajt shl 1;
        end;
      end;
      //czy na pewno odkodowaliœmy tekst?
      if Pos(CYPHER_CODE, s) = 1 then
      begin
        Delete(s, 1, Length(CYPHER_CODE));
      end else
        s := '';
      memText.Text := s;
    except
      MessageBox(Handle, 'Podczas odczytywania pliku wyst¹pi³ b³¹d!',
        PChar('B³¹d nr ' + IntToStr(GetLastError)), 16);
    end;
  finally
    BMP.Free;
  end;
end;

//zakodowanie tekstu i zapis bitmapy
procedure TfrmMain.SaveCypher(FileName: String);
var
  BMP: TBitmap;
  s: String;
  i, j, znak, nr: Integer;
  bajt: Byte;
  linia: PByteArray;
begin
  //nale¿y zadbaæ, aby tekst do zakodowania nie by³ zbyt d³ugi :o)
  //obrazek ma 800x600x3 bajty, do zakodowania ka¿dego znaku potrzebujemy
  //8 bitów (1 bajtu), wiêc obliczenia nie s¹ skomplikowane :o)
  //doklejamy te¿ na pocz¹tku sygnaturkê, dziêki której zawsze
  //rozpoznamy, ¿e plik zawiera zakodowany tekst :o)

  s := Copy(CYPHER_CODE + memText.Text, 1,
           (cypherImage.Width * cypherImage.Height * 3) div 8);

  BMP := TBitmap.Create;
  BMP.Assign(cypherImage);
  try
    znak := 1;
    bajt := Ord(s[znak]);
    nr := 0;

    //dla ka¿dej linii obrazka...
    for i := 0 to BMP.Height - 1 do
    begin
      //pobieramy ca³¹ liniê
      linia := BMP.ScanLine[i];

      //przesuwamy siê wzd³u¿ linii, ka¿da pozycja to jeden bajt
      for j := 0 to BMP.Width - 1 do
      begin
        //zapisujemy ostatni bit
        linia[j] := ((linia[j] shr 1) shl 1) or (bajt and 1);
        Inc(nr);
        //czy to ju¿ by³ ostatni bit znaku?
        if nr = 8 then
        begin
          nr := 0;
          Inc(znak);
          if znak > Length(s) then
            bajt := 0
          else
            bajt := Ord(s[znak]);
        end else
          bajt := bajt shr 1;
      end;
    end;
    try
      BMP.SaveToFile(FileName);
    except
      MessageBox(Handle, 'Podczas zapisywania pliku wyst¹pi³ b³¹d!',
        PChar('B³¹d nr ' + IntToStr(GetLastError)), 16);
    end;
  finally
    BMP.Free;
  end;
end;


end.
