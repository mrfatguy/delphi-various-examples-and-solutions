unit frmIntro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, MPlayer;

type
  TIntroForm = class(TForm)
    Image1: TImage;
    mm: TMediaPlayer;
    procedure FormShow(Sender: TObject);
    procedure ShowIntro;
    procedure Delay(MSecs: Longint);
    procedure ShowAndHide(PlaceHolder: TImage; FileName: String; DelayBetween: Integer);
    procedure ProcessIntroStop;
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Image1Click(Sender: TObject);
  private

  public
    ECode: Boolean;
  end;

var
  IntroForm: TIntroForm;

implementation

{$R *.DFM}

uses Procs;

procedure TIntroForm.Delay(MSecs: Longint);
var
  FirstTickCount, Now: Longint;
begin
  FirstTickCount := GetTickCount;
  repeat
    Application.ProcessMessages;
    { allowing access to other controls, etc. }
    if ECode=True then exit;
    Now := GetTickCount;
  until (Now - FirstTickCount >= MSecs) or (Now < FirstTickCount);
end;

procedure DrawTrRect(Canvas: TCanvas; const ARect: TRect; Color: TColor;
Opacity: Integer);
type
  RGBARR = array [0..0] of TRGBQUAD;
  PRGBARR = ^RGBARR;
var prgb: PRGBARR;
    rgb, black : TRGBQUAD;
   i,j: Integer;
   tr : Integer;
   Clr: LongInt;
   bmp: TBitmap;
begin
  Clr := ColorToRGB(Color);
  rgb.rgbRed      := Clr and $000000FF;
  rgb.rgbGreen    := (Clr and $0000FF00) shr 8;
  rgb.rgbBlue     := (Clr and $00FFFFFF) shr 16;
  rgb.rgbReserved := 0;

  bmp := TBitmap.Create;
  bmp.PixelFormat := pf32bit;
  bmp.Width := ARect.Right-ARect.Left;
  bmp.Height := ARect.Bottom-ARect.Top;
  bmp.Canvas.CopyRect(Rect(0,0,bmp.Width,bmp.Height), Canvas, ARect);

  FillChar(black, sizeof(black), 0);

  tr := 255 - Opacity;
  for i := 0 to bmp.Height-1 do begin
    prgb := PRGBARR(bmp.ScanLine[i]);
    for j := 0 to bmp.Width-1 do
      if not CompareMem(@(prgb[j]),@black,3) then
      with prgb[j] do begin
        rgbBlue  := (rgbBlue*tr  + rgb.rgbBlue*Opacity) div 255;
        rgbGreen := (rgbGreen*tr + rgb.rgbGreen*Opacity)div 255;
        rgbRed   := (rgbRed*tr   + rgb.rgbRed*Opacity) div 255;
      end;
  end;
  Canvas.Draw(ARect.Left, ARect.Top, bmp);
  bmp.Free;
end;

procedure TIntroForm.ShowAndHide(PlaceHolder: TImage; FileName: String; DelayBetween: Integer);
var
        a: Integer;
        filbmp, tmpbmp: TBitmap;
begin
filbmp:=TBitmap.Create;
filbmp.LoadFromFile(FileName);
tmpbmp := TBitmap.Create;
for a:=12 downto 0 do
begin
        if ECode=True then exit;
        tmpbmp.Assign(filbmp);
        DrawTrRect(tmpbmp.Canvas,Rect(0,0,tmpbmp.Width,tmpbmp.Height),clBlack,(a*20));
        PlaceHolder.Picture.Bitmap:=tmpbmp;
        PlaceHolder.Refresh;
end;
IntroForm.Delay(DelayBetween);
for a:=0 to 12 do
begin
        if ECode=True then exit;
        tmpbmp.Assign(filbmp);
        DrawTrRect(tmpbmp.Canvas,Rect(0,0,tmpbmp.Width,tmpbmp.Height),clBlack,(a*20));
        PlaceHolder.Picture.Bitmap:=tmpbmp;
        PlaceHolder.Refresh;
end;
tmpbmp.Free;
filbmp.Free;
end;

procedure TIntroForm.FormShow(Sender: TObject);
begin
IntroForm.DoubleBuffered:=True;
ECode:=False;
end;

procedure TIntroForm.ShowIntro;
var
        times: array[1..9] of Integer;
        a: Integer;
begin
mm.FileName:=DataPath+'i.mid';
mm.Wait:=True;
mm.Open;
mm.Play;
Image1.Picture:=nil;
times[1]:=2000; times[2]:=12000; times[3]:=2000;
times[4]:=14000; times[5]:=2000; times[6]:=15000;
times[7]:=3000; times[8]:=1000; times[9]:=4000;
ShowCursor(False);
IntroForm.Show;
Delay(1000);
//historia
for a:=1 to 6 do
begin
        ShowAndHide(Image1,DataPath+'i'+IntToStr(a)+'.bmp',times[a]);
        if ECode=True then
        begin
                mm.Stop;
                mm.Eject;
                mm.Close;
                ProcessIntroStop;
                exit;
        end;
end;
Delay(2000);
//Tomasz Trejderowski...
for a:=7 to 8 do
begin
        ShowAndHide(Image1,DataPath+'i'+IntToStr(a)+'.bmp',times[a]);
        if ECode=True then
        begin
                mm.Stop;
                mm.Eject;
                mm.Close;
                ProcessIntroStop;
                exit;
        end;
end;
Delay(1000);
//Tytul...
ShowAndHide(Image1,DataPath+'i9.bmp',times[9]);
Delay(1000);
mm.Stop;
mm.Eject;
mm.Close;
Delay(1000);
ProcessIntroStop;
end;

procedure TIntroForm.ProcessIntroStop;
begin
IntroForm.Hide;
ShowCursor(True);
end;

procedure TIntroForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=27 then ECode:=True;
end;

procedure TIntroForm.Image1Click(Sender: TObject);
begin
ECode:=True;
end;

end.
