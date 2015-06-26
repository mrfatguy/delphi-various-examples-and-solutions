unit Ctrl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
    PTImage = ^TImage;

  TCtrlForm = class(TForm)
    NewBtnImage: TImage;
    PauseBtnmage: TImage;
    CloseBtnImage: TImage;
    HighScoreBtnImage: TImage;
    AboutBtnImage: TImage;
    LEDImageList: TImageList;
    ScoreImageList: TImageList;
    MenuImage: TImage;
    MinImage: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnImageMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure BtnImageClick(Sender: TObject);
    procedure DrawTimeAndScore;
    procedure MenuImageClick(Sender: TObject);
    procedure MinImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MinImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MinImageClick(Sender: TObject);
  private
    { Private declarations }
    procedure WMNCHitTest(var Msg: TWMNCHitTest); message WM_NCHITTEST;
  public
    { Public declarations }
    bx, by : integer;
    bLeftBtnDown: Boolean;
    bCloseImageClick : Boolean;
  end;

var
  CtrlForm: TCtrlForm;
  MinUPBitmap, MinDOWNBitmap : TBitmap;
  MenuBitmap : TBitmap;

implementation

uses Main;

{$R *.DFM}

procedure TCtrlForm.WMNCHitTest(var Msg : TWMNCHitTest);

begin
     inherited;
     with Msg do
          with ScreenToClient(Point(XPos,YPos)) do
               if PtInRect(RECT(16,0,284,15), Point(X,Y)) then
               begin
                    Result := htCaption;
                    MainForm.Left := Left - 69;
                    MainForm.Top := Top + 100;
               end;
end;

procedure TCtrlForm.FormCreate(Sender: TObject);
var
   offset : cardinal;
   i : integer;

begin
     CtrlForm.ClientWidth := CtrlBitmap.Width;
     CtrlForm.ClientHeight := CtrlBitmap.Height;
     CtrlForm.Canvas.Draw(0, 0, CtrlBitmap);

     MenuImage.Width := 12;
     MenuImage.Height := 12;

     MinImage.Width := 12;
     MinImage.Height := 12;

     MinUPBitmap := TBitmap.Create;
     MinUPBitmap.LoadFromResourceName(hInstance, 'MINUP');

     MinDOWNBitmap := TBitmap.Create;
     MinDOWNBitmap.LoadFromResourceName(hInstance, 'MINDOWN');

     MenuBitmap := TBitmap.Create;
     MenuBitmap.LoadFromResourceName(hInstance, 'MENU');


     MinImage.Picture.Bitmap := MinUPBitmap;
     MenuImage.Picture.Bitmap := MenuBitmap;

     offset := Cardinal(@NewBtnImage);
     i := 0;
     while offset <= Cardinal(@AboutBtnImage) do
     begin
          PTImage(offset)^.Tag := i;
          PTImage(offset)^.Width := 30;
          PTImage(offset)^.Height := 25;
          PTImage(offset)^.Top := 75;
          PTImage(offset)^.Left := 25+i*55;
          PTImage(offset)^.Picture.Bitmap := MenuButtonBitmap[MenuButtonOrder(i), btnUP];
          i := i + 1;
          offset := offset + sizeof(PTImage);
     end;

     bLeftBtnDown := FALSE;
     bCloseImageClick := FALSE;

end;
procedure TCtrlForm.DrawTimeAndScore;
var
   sTime, sScore : string;
   x, y : integer;
begin
     sTime := IntToStr(Main.LeftTime);
     if Main.LeftTime < 10 then
     begin
          STime[2] := sTime[1];
          STime[1] := '0';
     end;

     x := 88;
     y := 36;

     with LEDImageList do
     begin
          Draw(CtrlForm.Canvas, x, y, StrToInt(sTime[1]));
          Draw(CtrlForm.Canvas, x+16, y, StrToInt(sTime[2]));
     end;

     sScore := IntToStr(Main.Score);
     if Main.Score < 10 then
     begin
          sScore[2] := sScore[1];
          sScore[1] := '0';
     end;

     x := 208;
     y := 36;
     with ScoreImageList do
     begin
          Draw(Canvas, x, y, StrToInt(sScore[1]));
          Draw(Canvas, x+16, y, StrToInt(sScore[2]));
     end;

end;
procedure TCtrlForm.FormPaint(Sender: TObject);
begin
     CtrlForm.Canvas.Draw(0, 0, CtrlBitmap);
     DrawTimeAndScore;
end;

procedure TCtrlForm.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
   index : Cardinal;
begin
     for index := 0 to 4 do
             PTImage(Cardinal(@NewBtnImage) + index*sizeof(PTImage))^.Picture.Bitmap := MenuButtonBitmap[MenuButtonOrder(index), btnUP]
end;

procedure TCtrlForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     MainForm.Close;
end;

procedure TCtrlForm.BtnImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   index : Cardinal;
begin
     if Button = mbLeft then
     begin
          index := TImage(Sender).Tag;
          PTImage(Cardinal(@NewBtnImage) + index*sizeof(PTImage))^.Picture.Bitmap := MenuButtonBitmap[MenuButtonOrder(index), btnDOWN];
          bLeftBtnDown := TRUE;
     end;
end;

procedure TCtrlForm.BtnImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   index : Cardinal;
begin
     if (Button = mbLeft) and (bCloseImageClick = FALSE) then
     begin
          index := TImage(Sender).Tag;
          PTImage(Cardinal(@NewBtnImage) + index*sizeof(PTImage))^.Picture.Bitmap := MenuButtonBitmap[MenuButtonOrder(index), btnUP];
          bLeftBtnDown := FALSE;
     end;

end;

procedure TCtrlForm.BtnImageMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
   index : Cardinal;
begin
     if bLeftBtnDown then Exit;
     for index := 0 to 4 do
         PTImage(Cardinal(@NewBtnImage) + index*sizeof(PTImage))^.Picture.Bitmap := MenuButtonBitmap[MenuButtonOrder(index), btnUP];
     index := TImage(Sender).Tag;
     PTImage(Cardinal(@NewBtnImage) + index*sizeof(PTImage))^.Picture.Bitmap := MenuButtonBitmap[MenuButtonOrder(index), btnOVER];
end;

procedure TCtrlForm.BtnImageClick(Sender: TObject);
begin
     case TImage(Sender).Tag of
     0 ://New
       MainForm.cmNewGame.Click;
     1 ://Pause
       MainForm.cmPauseOrResume.Click;
     2://Close
     begin
       bCloseImageClick := TRUE;
       MainForm.cmQuit.Click;
     end;
     3://HighScore
       MainForm.cmHighscore.Click;
     4://About
       MainForm.cmAbout.Click;
     end;

end;

procedure TCtrlForm.MenuImageClick(Sender: TObject);
begin
     MainForm.RatMenu.Popup(Left+14, Top+14);
end;

procedure TCtrlForm.MinImageMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     MinImage.Picture.Bitmap := MinUPBitmap;
end;

procedure TCtrlForm.MinImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     MinImage.Picture.Bitmap := MinDOWNBitmap;
end;

procedure TCtrlForm.MinImageClick(Sender: TObject);
begin
     //
     if GamePause = FALSE then MainForm.cmPauseOrResume.Click;

     MainForm.Hide;
     CtrlForm.Hide;
end;

end.


