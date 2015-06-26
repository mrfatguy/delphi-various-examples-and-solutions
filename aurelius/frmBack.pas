unit frmBack;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Jpeg, StdCtrls, ExtCtrls, MPlayer;

type
  TBackForm = class(TForm)
    imgLogo: TImage;
    lblCopy: TLabel;
    Label10: TLabel;
    imgBack: TImage;
    mm: TMediaPlayer;
    Timer1: TTimer;
    procedure EndGame;

    procedure FormResize(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure mmNotify(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  BackForm: TBackForm;

implementation

{$R *.DFM}

uses Procs, frmMainMenu;

procedure TBackForm.FormResize(Sender: TObject);
begin
CenterControl(lblCopy);
lblCopy.Top:=BackForm.Height-20;
end;

procedure TBackForm.EndGame;
begin
mm.Stop;
mm.Eject;
mm.Close;
ClearTemp;
WriteSettings;
SystemParametersInfo(SPI_SETSCREENSAVEACTIVE,1,nil,0);
Application.Terminate;
end;

procedure TBackForm.FormPaint(Sender: TObject);
var
        FBitmap: TBitmap;
begin
FBitmap:=TBitmap.Create;
try
        FBitMap.LoadFromFile(DataPath+'back.bmp');
        BackForm.Canvas.Brush.Bitmap:=FBitmap;
        BackForm.Canvas.FillRect(Rect(0,0,ClientWidth,ClientWidth));
finally
        BackForm.Canvas.Brush.Bitmap := nil;
        FBitmap.Free;
end;

end;

procedure TBackForm.mmNotify(Sender: TObject);
begin
mm.Notify:=True;
if mm.Mode=mpStopped then mm.Play;
end;

procedure TBackForm.FormShow(Sender: TObject);
begin
Timer1.Enabled:=True;
BackForm.DoubleBuffered:=True;
label10.Caption:='Wersja '+GameVersion;
end;

procedure TBackForm.Timer1Timer(Sender: TObject);
begin
Timer1.Enabled:=False;
mm.FileName:=DataPath+'main.mid';
mm.Wait:=True;
mm.Open;
mm.Play;
MainMenu.ShowModal;
end;

end.
