unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Menus, ShellAPI, INIFiles, MMSystem;
const
     WM_TRAYICON = WM_USER + 1;
type
  TMainForm = class(TForm)
    RatTimer: TTimer;
    ScoreTimer: TTimer;
    RatMenu: TPopupMenu;
    cmNewGame: TMenuItem;
    cmPauseOrResume: TMenuItem;
    cmQuit: TMenuItem;
    cmHighscore: TMenuItem;
    cmAbout: TMenuItem;
    N1: TMenuItem;
    cmHide: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormPaint(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cmQuitClick(Sender: TObject);
    procedure NewClick(Sender: TObject);
    procedure RatTimerTimer(Sender: TObject);
    procedure ScoreTimerTimer(Sender: TObject);
    procedure cmPauseOrResumeClick(Sender: TObject);
    procedure cmAboutClick(Sender: TObject);
    procedure CreateParams(var Params: TCreateParams); override;
    procedure FormShow(Sender: TObject);
    procedure RatMenuPopup(Sender: TObject);
    procedure cmHighscoreClick(Sender: TObject);
    procedure cmHideClick(Sender: TObject);
  private
    { Private declarations }
    procedure WMNCHitTest(var Msg: TWMNCHitTest); message WM_NCHitTest;
    procedure IconCallBackMessage( var Msg : TMessage ); message WM_TRAYICON;
  public
    { Public declarations }
    procedure DrawHand;
    procedure DoTrayIconRightClick;
    function MakeNewRecord:Boolean;
    procedure UpdateHighScore;

  end;

type
    MenuButtonStatus = (btnUP, btnOVER, btnDOWN);
    MenuButtonOrder = (btnOrderNEW, btnOrderPAUSE, btnOrderCLOSE, btnOrderHIGHSCORE, btnOrderABOUT);
    HandStatus_Type = (Hand_Up, Hand_Down, Hand_Hit);
    RatSprRec = record
              x, y, w, h, ox, oy : integer;
              end;
    RatRec = record
           x, y, pos, speed : integer;
           end;
    HighScoreRec = record
               Name : string[8];
               Date : string[10];
               Score : string[2];
    end;

const
     MenuButtonImageName: array [btnOrderNEW..btnOrderABOUT, btnUP..btnDOWN] of string =
     (
      ('NEWUP','NEWOVER','NEWDOWN'),('PAUSEUP','PAUSEOVER','PAUSEDOWN'), ('CLOSEUP', 'CLOSEOVER','CLOSEDOWN'),
      ('HIGHSCOREUP', 'HIGHSCOREOVER','HIGHSCOREDOWN'),('ABOUTUP','ABOUTOVER','ABOUTDOWN')
     );
var
   MainForm: TMainForm;

   BufferBitmap : TBitmap;
   BackGroundBitmap : TBitmap;
   SpriteBitmap : TBitmap;
   MaskBitmap : TBitmap;

   AboutBitmap: TBitmap;
   HighScoreBitmap: TBitmap;
   CtrlBitmap: TBitmap;
   OKUPButtonBitmap, OKDOWNButtonBitmap: TBitmap;
   MenuButtonBitmap: array [btnOrderNEW..btnOrderABOUT, btnUP..btnDOWN] of TBitmap;

   HandStatus : HandStatus_Type;
   HandXPos, HandYPos : integer;
   LeftTime, Score : integer;

   RatSpr : array [0..15] of RatSprRec;
   Rat : array [0..2, 0..2] of RatRec;

   Frames : LongInt;

   GameRunning, GamePause : Boolean;
   MyNotifyStruct: TNotifyIconData;

   INIFile : TIniFile;
   HighScoreArray : array [0..9] of HighScoreRec;
   NewRecordPos : integer;

implementation

uses About, Ctrl, HighScore;

{$R *.DFM}

procedure LoadRatSpr(i, ox, oy, x, y, w, h : integer);
begin
     RatSpr[i].ox :=ox;
     RatSpr[i].oy :=oy;
     RatSpr[i].x :=x;
     RatSpr[i].y :=y;
     RatSpr[i].w :=w;
     RatSpr[i].h :=h;
end;

procedure LoadRat(row, col, x, y : integer);
begin
     Rat[row, col].x := x;
     Rat[row, col].y := y;
     Rat[row, col].pos := 0;
     Rat[row, col].speed := 0;
end;

procedure InitData;
begin
     LoadRat(0, 0, 187, 48);
     LoadRat(1, 0, 127, 79);
     LoadRat(2, 0, 75, 116);
     LoadRat(0, 1, 247, 58);
     LoadRat(1, 1, 189, 90);
     LoadRat(2, 1, 146, 126);
     LoadRat(0, 2, 304, 66);
     LoadRat(1, 2, 262, 98);
     LoadRat(2, 2, 222, 134);

     LoadRatSpr(1,  $00, $00, $5E, $36, $3C, $39);
     LoadRatSpr(2,  $01, $02, $61, $02, $38, $36);
     LoadRatSpr(3,  $01, $0a, $D8, $4E, $38, $2E);
     LoadRatSpr(4,  $02, $0E, $D7, $24, $38, $2A);
     LoadRatSpr(5,  $02, $16, $D8, $00, $38, $22);
     LoadRatSpr(6,  $02, $1A, $D7, $82, $35, $1E);
     LoadRatSpr(7,  $02, $1A, $A0, $85, $35, $1E);
     LoadRatSpr(8,  $02, $1A, $9F, $68, $35, $1E);
     LoadRatSpr(9,  $02, $1A, $9F, $4B, $35, $1E);
     LoadRatSpr(10,  $02, $1A, $9E, $2D, $35, $1E);
     LoadRatSpr(11, $02, $1D, $9E, $12, $35, $1B);
     LoadRatSpr(12, $02, $2A, $9E, $01, $35, $0E);
     LoadRatSpr(13, $01, $21, $5E, $70, $3D, $25);
     LoadRatSpr(14, $01, $21, $5D, $94, $3D, $1A);
     LoadRatSpr(15, $00, $00, $00, $00, $00, $00);

end;

procedure DrawRats(x, y, c : integer);
begin
     if c > 0 then
     begin
          BitBlt(BufferBitmap.Canvas.Handle, x+RatSpr[c].ox, y+RatSpr[c].oy, RatSpr[c].w, RatSpr[c].h,
                 MaskBitmap.Canvas.Handle, RatSpr[c].x, RatSpr[c].y, SRCAND);
          BitBlt(BufferBitmap.Canvas.Handle, x+RatSpr[c].ox, y+RatSpr[c].oy, RatSpr[c].w, RatSpr[c].h,
                 SpriteBitmap.Canvas.Handle, RatSpr[c].x, RatSpr[c].y, SRCINVERT);
     end;
end;

procedure PopupRats;
var
   i, j : integer;
begin
     if Frames mod 5 = 0 then
     begin

          i := random(3);
          j := random(3);

          if Rat[i,j].pos = 0 then
          begin
               Rat[i,j].pos := 12;
               Rat[i,j].speed := random(1)+1;
          end;
     end;
end;

procedure UpdateRats(row, col : integer);
begin
     if (Rat[row, col].pos <= 12) and (Rat[row, col].pos > 0) then
     begin
          if (Frames mod Rat[row, col].speed = 0) then
             Rat[row, col].pos := Rat[row, col].pos - 1;
     end
     else
     if Rat[row,col].pos >12 then
     begin
          if (Frames mod Rat[row, col].speed = 0) then Rat[row, col].pos := Rat[row, col].pos + 1;
          if Rat[row, col].pos >= 15 then Rat[row, col].pos := 0;
     end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
   myRgn : HRGN;
   round, i : integer;
   btnOrder : MenuButtonOrder;
begin
     GameRunning := FALSE;
     GamePause := FALSE;
     InitData;

     for i := 0 to 9 do
     begin
          HighScoreArray[i].Name := '--------';
          HighScoreArray[i].Date := '----/--/--';
          HighScoreArray[i].Score := '--';
     end;

     INIFile := TIniFile.Create('.\rat.ini');

     for i := 0 to 9 do
     begin
          HighScoreArray[i].Name := INIFile.ReadString(IntToStr(i), 'Name', '--------');
          HighScoreArray[i].Date := INIFile.ReadString(IntToStr(i), 'Date', '----/--/--');
          HighScoreArray[i].Score := INIFile.ReadString(IntToStr(i), 'Score', '--');
     end;

     HandStatus := Hand_Up;
     BackGroundBitmap := TBitmap.Create;
     BackGroundBitmap.LoadFromResourceName(hInstance, 'BACKGROUND');

     BufferBitmap := TBitmap.Create;
     BufferBitmap.Width := BackGroundBitmap.Width;
     BufferBitmap.Height := BackGroundBitmap.Height;
     MainForm.ClientWidth := BackGroundBitmap.Width;
     MainForm.ClientHeight := BackGroundBitmap.Height;

     AboutBitmap := TBitmap.Create;
     AboutBitmap.LoadFromResourceName(hInstance, 'ABOUT');

     HighScoreBitmap := TBitmap.Create;
     HighScoreBitmap.LoadFromResourceName(hInstance, 'HIGHSCORE');

     OKUPButtonBitmap:= TBitmap.Create;
     OKUPButtonBitmap.LoadFromResourceName(hInstance, 'OKUP');

     OKDOWNButtonBitmap:= TBitmap.Create;
     OKDOWNButtonBitmap.LoadFromResourceName(hInstance, 'OKDOWN');

     CtrlBitmap := TBitmap.Create;
     CtrlBitmap.LoadFromResourceName(hInstance, 'CONTROL');

     for btnOrder := btnOrderNEW to btnOrderABOUT do
     begin
          MenuButtonBitmap[btnOrder, btnUP] := TBitmap.Create;
          MenuButtonBitmap[btnOrder, btnUP].LoadFromResourceName(hInstance,MenuButtonImageName[btnOrder, btnUP]);
          MenuButtonBitmap[btnOrder, btnOVER] := TBitmap.Create;
          MenuButtonBitmap[btnOrder, btnOVER].LoadFromResourceName(hInstance,MenuButtonImageName[btnOrder, btnOVER]);
          MenuButtonBitmap[btnOrder, btnDown] := TBitmap.Create;
          MenuButtonBitmap[btnOrder, btnDown].LoadFromResourceName(hInstance,MenuButtonImageName[btnOrder, btnDOWN]);
     end;

     round := 128;
     MainForm.Brush.Style:=bsClear;
     myRgn := 0;
     GetWindowRgn(MainForm.Handle, myRgn);
     DeleteObject(myRgn);
     myRgn:= CreateroundRectRgn(0,0,MainForm.Width,MainForm.Height, round, round);
     SetWindowRgn(MainForm.Handle, myRgn, TRUE);

     SpriteBitmap := TBitmap.Create;
     SpriteBitmap.LoadFromResourceName(hInstance, 'SPRITE');

     MaskBitmap := TBitmap.Create;
     MaskBitmap.LoadFromResourceName(hInstance, 'MASK');

     BitBlt(BufferBitmap.Canvas.Handle, 0, 0, BufferBitmap.Width, BufferBitmap.Height,
            BackGroundBitmap.Canvas.Handle, 0, 0, SRCCOPY);

     RatTimer.Enabled := FALSE;
     LeftTime := 59;
     Score := 0;
     Left := (Screen.Width - Width) div 2;
     Top := (Screen.Height - Height) div 2;

     with MyNotifyStruct do
     begin
          cbSize := sizeof(MyNotifyStruct);
          Wnd := MainForm.handle;
          uID := 1;
          uFlags :=  NIF_ICON or NIF_TIP or NIF_MESSAGE;
          hIcon := LoadIcon(hInstance, 'TRAYICON');
          szTip := 'Hit the rat!';
          uCallBackMessage := WM_TRAYICON;
     end;
     Shell_NotifyIcon(NIM_ADD, @MyNotifyStruct);
end;

procedure TMainForm.CreateParams(var Params: TCreateParams);
begin
     inherited CreateParams(Params);
     with Params do
          Style := (Style or WS_POPUP) and (not WS_DLGFRAME)and (not WS_CAPTION) ;
end;

procedure TMainForm.WMNCHitTest(var Msg: TWMNCHitTest);
begin
     inherited;
//     if  (Msg.Result = htClient)and((GameRunning = FALSE)or(GamePause = TRUE))
//     then Msg.Result := htCaption;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
   btnOrder : MenuButtonOrder;
   i : integer;
begin
     for i := 0 to 9 do
     begin
          INIFile.WriteString(IntToStr(i), 'Name', HighScoreArray[i].Name);
          INIFile.WriteString(IntToStr(i), 'Date', HighScoreArray[i].Date);
          INIFile.WriteString(IntToStr(i), 'Score', HighScoreArray[i].Score);
     end;
     INIFile.Free;

     BufferBitmap.Free;
     BackGroundBitmap.Free;
     SpriteBitmap.Free;
     MaskBitmap.Free;
     AboutBitmap.Free;
     HighScoreBitmap.Free;
     CtrlBitmap.Free;
     OKUPButtonBitmap.Free;
     OKDOWNButtonBitmap.Free;
     for btnOrder := btnOrderNEW to btnOrderABOUT do
     begin
          MenuButtonBitmap[btnOrder, btnUP].Free;
          MenuButtonBitmap[btnOrder, btnOVER].Free;
          MenuButtonBitmap[btnOrder, btnDown].Free;
     end;
     with MyNotifyStruct do
     begin
          cbSize := sizeof(MyNotifyStruct);
          Wnd := MainForm.handle;
          uID := 1;
          uFlags :=  NIF_ICON or NIF_TIP or NIF_MESSAGE;
          szTip := 'Hit the rat!';
          uCallBackMessage := WM_TRAYICON;
     end;
     Shell_NotifyIcon(NIM_DELETE, @MyNotifyStruct);
    
end;

procedure TMainForm.FormPaint(Sender: TObject);
var
   row, col : integer;
begin
     ShowWindow (Application.Handle, SW_HIDE);
     BitBlt(BufferBitmap.Canvas.Handle, 0, 0, BufferBitmap.Width, BufferBitmap.Height,
            BackGroundBitmap.Canvas.Handle, 0, 0, SRCCOPY);

     //Draw Rats
     for row := 0 to 2 do
     begin
          for col := 0 to 2 do
          begin
               DrawRats(Rat[row, col].x,  Rat[row, col].y, Rat[row, col].pos);
          end;
     end;

     if RatTimer.Enabled = TRUE then DrawHand();
     MainForm.Canvas.Draw(0, 0, BufferBitmap);
     CtrlForm.DrawTimeAndScore;
end;

procedure TMainForm.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
   index : Cardinal;
begin
     HandXPos := X - 15;
     HandYPos := Y - 40;

     for index := 0 to 4 do
         PTImage(Cardinal(@CtrlForm.NewBtnImage) + index*sizeof(PTImage))^.Picture.Bitmap := MenuButtonBitmap[MenuButtonOrder(index), btnUP];

end;

procedure TMainForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
   row, col : integer;
   sp, d : integer;
begin
     if (GameRunning = FALSE) or (GamePause = TRUE) then exit;

     d := 10;

     if Button = mbLeft then  HandStatus := Hand_Down;

     for row := 0 to 2 do
     begin
          for col :=0 to 2 do
          begin
               sp := Rat[row, col].pos;
               if  (sp > 0) and (sp <= 12) then
               begin
                    if (X > Rat[row, col].x + RatSpr[sp].ox + d) and
                       (X < Rat[row, col].x + RatSpr[sp].ox + RatSpr[sp].w - d) and
                       (Y > Rat[row, col].y + RatSpr[sp].oy ) and
                       (Y < Rat[row, col].y + RatSpr[sp].oy + RatSpr[sp].h ) then
                    begin
                         Rat[row, col].pos := 13;
                         Rat[row, col].speed := 5;
                         Score := Score + 1;
                         if Button = mbLeft then
                         begin
                              HandStatus := Hand_Hit;
                              PlaySound('HIT', hInstance, SND_RESOURCE or SND_ASYNC);
                         end;
                    end;
               end;
          end;
     FormPaint(self);
     end;

end;

procedure TMainForm.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     if (GameRunning = FALSE) or (GamePause = TRUE) then exit;
     if Button = mbLeft then HandStatus := Hand_Up;
     FormPaint(self);
end;

procedure TMainForm.DrawHand;
begin
     case HandStatus of
     Hand_Up : begin
                    BitBlt(BufferBitmap.Canvas.Handle, HandXPos, HandYPos, 97, 54,
                           MaskBitmap.Canvas.Handle, 0, 0, SRCAND);
                    BitBlt(BufferBitmap.Canvas.Handle, HandXPos, HandYPos, 97, 54,
                           SpriteBitmap.Canvas.Handle, 0, 0, SRCINVERT);
               end;
     Hand_Down : begin
                      BitBlt(BufferBitmap.Canvas.Handle, HandXPos, HandYPos - 6, 90, 64,
                             MaskBitmap.Canvas.Handle, 0, 54, SRCAND);
                      BitBlt(BufferBitmap.Canvas.Handle, HandXPos, HandYPos - 6, 90, 64,
                             SpriteBitmap.Canvas.Handle, 0, 54, SRCINVERT);
                 end;
     Hand_Hit : begin
                      BitBlt(BufferBitmap.Canvas.Handle, HandXPos, HandYPos, 90, 64,
                             MaskBitmap.Canvas.Handle, 0, 118, SRCAND);
                      BitBlt(BufferBitmap.Canvas.Handle, HandXPos, HandYPos, 90, 64,
                             SpriteBitmap.Canvas.Handle, 0, 118, SRCINVERT);

                end;
     end;
end;
procedure TMainForm.cmQuitClick(Sender: TObject);
begin
     Close;
end;

procedure TMainForm.NewClick(Sender: TObject);
begin
     LeftTime := 59;
     RatTimer.Enabled := TRUE;
     ScoreTimer.Enabled := TRUE;
     GameRunning := TRUE;
     GamePause := FALSE;
     Cursor := -1;
     Frames := 0;
     Score := 0;
     InitData;
     Randomize;
     FormPaint(self);
end;

procedure TMainForm.RatTimerTimer(Sender: TObject);
var
   row, col : integer;
begin
     Frames := Frames + 1;
     FormPaint(Self);
     PopupRats;
     for row := 0 to 2 do
     begin
          for col := 0 to 2 do
          begin
               UpdateRats(row, col);
          end;
     end;
     if LeftTime <= 0 then
     begin
          RatTimer.Enabled := FALSE;
          ScoreTimer.Enabled := FALSE;
          Cursor := 0;
          GameRunning := FALSE;
          GamePause := FALSE;
          if MakeNewRecord then UpdateHighScore;
          MainForm.Canvas.Draw(0, 0, BackgroundBitmap);
     end;

end;

procedure TMainForm.ScoreTimerTimer(Sender: TObject);
begin
     LeftTime := LeftTime - 1;
end;

procedure TMainForm.cmPauseOrResumeClick(Sender: TObject);
begin
     if GameRunning = TRUE then
     begin

          if GamePause = FALSE then
          begin
               ScoreTimer.Enabled := FALSE;
               RatTimer.Enabled := FALSE;
               GamePause := TRUE;
               Cursor := 0;
          end
          else
          begin
               ScoreTimer.Enabled := TRUE;
               RatTimer.Enabled := TRUE;
               GamePause := FALSE;
               Cursor := -1;
          end;
     end
end;

procedure TMainForm.cmAboutClick(Sender: TObject);
begin
     MainForm.cmPauseOrResume.Click;

     AboutBox.ShowModal;

     MainForm.cmPauseOrResume.Click;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
     CtrlForm.Left := MainForm.Left + 69;
     CtrlForm.Top := MainForm.Top - 100;
     CtrlForm.Show;
end;

procedure TMainForm.RatMenuPopup(Sender: TObject);
begin
     if MainForm.Visible = TRUE then
        cmHide.Caption := 'H&ide'
     else
        cmHide.Caption := '&Show';

     if GamePause = TRUE then
     begin
          cmPauseOrResume.Caption := 'Resume';
          cmPauseOrResume.Enabled := TRUE;
          exit;
     end;

     if GameRunning = TRUE then
     begin
          cmPauseOrResume.Caption := 'Pause';
          cmPauseOrResume.Enabled := TRUE;
     end
     else
     begin
          cmPauseOrResume.Caption := 'Pause';
          cmPauseOrResume.Enabled := FALSE;
     end;
end;

procedure TMainForm.IconCallBackMessage( var Msg : TMessage );
begin
     case Msg.lParam of
          WM_LBUTTONDBLCLK :
                           begin
                                SetForegroundWindow( Application.Handle );
                                Application.ProcessMessages;
                           end;
          WM_RBUTTONDOWN    : DoTrayIconRightClick;
     end;
end;

procedure TMainForm.DoTrayIconRightClick;
var
   MouseCo: Tpoint;
begin
   GetCursorPos(MouseCo);
   SetForegroundWindow( Application.Handle );
   Application.ProcessMessages;
   RatMenu.Popup( Mouseco.X, Mouseco.Y );
end;

procedure TMainForm.cmHighscoreClick(Sender: TObject);
var
   ScoreLabel : array [0..9, 0..2] of TLabel;
   i, j : integer;
begin
     MainForm.cmPauseOrResume.Click;

       for i := 0 to 9 do
       begin
            for j := 0 to 2 do
            begin
                   ScoreLabel[i, j] := TLabel.Create(self);
                   ScoreLabel[i, j].Left := 36+j*80;
                   ScoreLabel[i, j].Top := 50+i*20;
                   ScoreLabel[i, j].Parent := HighScoreForm;
                   ScoreLabel[i, j].Transparent := TRUE;
                   ScoreLabel[i, j].Font.Size := 8;

            end;
            ScoreLabel[i, 0].Caption := HighScoreArray[i].Name;
            ScoreLabel[i, 1].Caption := HighScoreArray[i].Date;
            ScoreLabel[i, 2].Caption := HighScoreArray[i].Score;
       end;
     HighScoreForm.ShowModal;
     for i := 0 to 9 do
            for j := 0 to 2 do
                   ScoreLabel[i, j].Free;

     MainForm.cmPauseOrResume.Click;

end;


procedure TMainForm.cmHideClick(Sender: TObject);
begin
     if cmHide.Caption = '&Show' then
     begin
          MainForm.Show;
          CtrlForm.Show;
     end
     else
     begin
          MainForm.Hide;
          CtrlForm.Hide;
          if GameRunning then MainForm.cmPauseOrResume.Click;
     end;

end;
function TMainForm.MakeNewRecord:Boolean;
var
   i : integer;
   oldvalue, newvalue : integer;
begin
     MakeNewRecord := FALSE;
     newvalue := Score;
     if newvalue = 0 then exit;
     for i := 0 to 9 do
     begin
          if HighScoreArray[i].Score = '--' then
          begin
               MakeNewRecord := TRUE;
               NewRecordPos := i;
               exit;
          end;
          oldvalue := StrToInt(HighScoreArray[i].Score);
          if oldvalue < newvalue then
          begin
               MakeNewRecord := TRUE;
               NewRecordPos := i;
               exit;
          end;
     end;
end;

procedure TMainForm.UpdateHighScore;
var
   i : integer;
   InputString : string;
begin
     InputString:= InputBox('You make a new record', 'Please input your NAME', 'Unknown');
     for  i := 9 downto NewRecordPos+1 do
     begin
          HighScoreArray[i].Name := HighScoreArray[i-1].Name;
          HighScoreArray[i].Date := HighScoreArray[i-1].Date;
          HighScoreArray[i].Score := HighScoreArray[i-1].Score;
     end;
     HighScoreArray[NewRecordPos].Name := InputString;
     HighScoreArray[NewRecordPos].Date := DateToStr(Date);
     HighScoreArray[NewRecordPos].Score := IntToStr(Score);
     MainForm.cmHighscore.Click;
end;

end.
