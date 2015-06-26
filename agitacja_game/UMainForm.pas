unit UMainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, Engine, StdCtrls, Spin, ScktComp, ComCtrls;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Shape1: TShape;
    ClientSocket1: TClientSocket;
    ServerSocket1: TServerSocket;
    StatusBar1: TStatusBar;
    Button3: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Bevel1: TBevel;
    Button4: TButton;
    Button1: TButton;
    Image1: TImage;
    Button2: TButton;
    Edit1: TEdit;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Disconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Connect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Label10DblClick(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Page:TPinPage;
    Dir:String;
    NetGame,Server,Connected,InProgress:Boolean;
    BlackC,WhiteC:Integer;
    StartTime:TDateTime;
    procedure PerformNetAction(S:String);
    procedure SendNetCommand(S:String);
    procedure ConnectWithOponent;
    procedure DisconnectOponent;
    procedure ConnectChanged;
    procedure UpdateAll;
    procedure DoAIMove;
    procedure CheckEnd;
    procedure HandleIdle(Sender:TObject;var Done:Boolean);
    function GetQrczakMove:TPoint;
  end;

var
  MainForm: TMainForm;

implementation
{______________________________________________________________________________

                     (c) 1998 Marcin Wieczorek ( T-1000 )
                         email:wieczor@polbox.com
 ______________________________________________________________________________}

uses Debug, UOptionsForm, UClientNetForm, UServerNetForm;

{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);
begin
 Page:=TPinPage.Create;
 Page.Finished:=True;
 Dir:=ExtractFilePath(Application.ExeName);
 Application.OnIdle:=HandleIdle;
 Randomize;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
 Page.Free;Page:=Nil;
end;

procedure TMainForm.PaintBox1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var P:TPoint;
    S:String;
begin
 { Testujemy czy gosc mial prawo wykonac ruch ( czy jego kolej ) }
 if (Page.BlackMove and (OptionsForm.RadioGroup1.ItemIndex<>0))or
    ((not Page.BlackMove) and (OptionsForm.RadioGroup2.ItemIndex<>0)) then
 begin
  MessageBeep(mb_IconError);
  Exit;
 end;

 P:=Page.FindMousePos(X,Y);
 if Page.GoodMove(P.X,P.Y)then
 begin
  PositionCount:=1;
  Page.SetMove(P.X,P.Y);
  UpdateAll;

  { Obsluga gry sieciowej }
  if Connected then
  begin
   S:=Format('%d:%d',[P.X,P.Y]);
   SendNetCommand(S);
  end;

 end
 else
 begin
  MessageBeep(mb_IconError);
  Exit;
 end;
 CheckEnd;
end;

procedure TMainForm.UpdateAll;
var W,B:Integer;
begin
 Page.PaintOn(Image1.Canvas);
 Label2.Caption:=IntToStr(Page.PositionMark);
 if Page.BlackMove then Shape1.Brush.Color:=clBlack
 else Shape1.Brush.Color:=clWhite;
 Shape1.Invalidate;
 Page.GetStats(W,B);
 Label5.Caption:='White:'+IntToStr(W);
 Label6.Caption:='Black:'+IntToStr(B);
 Label8.Caption:=FloatToStrF(PositionCount/(Now-StartTime)/3600/24,ffFixed,10,3)+' pos/s';
 StartTime:=Now;
 {Sleep(200);}
end;

procedure TMainForm.ServerSocket1ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
 Connected:=True;
 ConnectChanged;
 StatusBar1.SimpleText:='Connected to '+Socket.RemoteAddress;
end;

procedure TMainForm.ServerSocket1ClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
 Connected:=False;
 ConnectChanged;
 StatusBar1.SimpleText:='';
end;

procedure TMainForm.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
begin
 PerformNetAction(Socket.ReceiveText);
end;

procedure TMainForm.ClientSocket1Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
 Connected:=False;
 ConnectChanged;
 StatusBar1.SimpleText:='';
end;

procedure TMainForm.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
 Connected:=True;
 ConnectChanged;
 StatusBar1.SimpleText:='Connected to '+Socket.RemoteAddress;
end;

procedure TMainForm.ClientSocket1Read(Sender: TObject;
  Socket: TCustomWinSocket);
begin
 PerformNetAction(Socket.ReceiveText);
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if Connected then
  if Server then
  begin
   ServerSocket1.Socket.Connections[0].Close;
   ServerSocket1.Close;
  end
  else ClientSocket1.Close;
end;

procedure TMainForm.PerformNetAction(S:String);
var Space,X,Y:Integer;
    T:String;
begin
 if S='CLEARBOARD'then
 begin
  Page.ClearBoard;
  UpdateAll;
  InProgress:=True;
  Exit;
 end;
 if S='CLOSE' then
 begin
  DisconnectOponent;
  Exit;
 end;
 if Pos('CHAT:',S)=1 then
 begin
  S:=Copy(S,Length('CHAT:')+1,Length(S)-Length('CHAT:'));
  MessageBeep(mb_IconInformation);
  Application.MessageBox(PChar(S),'Oponent message',mb_OK+mb_IconInformation);
  Exit;
 end;

 Space:=Pos(':',S);
 TestMsg(Space<>0,'Net message is corrupted');
 T:=Copy(S,1,Space-1);
 X:=StrToInt(T);
 T:=Copy(S,Space+1,Length(S)-Space);
 Y:=StrToInt(T);
 if Page.GoodMove(X,Y)then
 begin
  Page.SetMove(X,Y);
  UpdateAll;
 end;
 
 CheckEnd;
end;

procedure TMainForm.Button3Click(Sender: TObject);
begin
 Page.ClearBoard;
 Page.BlackMove:=OptionsForm.CheckBox2.Checked;
 UpdateAll;
 { Obsluga gry sieciowej }
 if NetGame then
 begin
  if Connected then SendNetCommand('CLEARBOARD')
  else ConnectWithOponent;
 end;
 InProgress:=True;
end;

procedure TMainForm.SendNetCommand(S:String);
begin
 if Server then
  ServerSocket1.Socket.Connections[0].SendText(S)
 else ClientSocket1.Socket.SendText(S);
end;

procedure TMainForm.ConnectChanged;
begin
 Button4.Enabled:=not Connected;
 if Connected then SendNetCommand('CLEARBOARD');
 Button1.Enabled:=Connected;
 Button2.Enabled:=Connected;
 Edit1.Enabled:=Connected;
end;

procedure TMainForm.Button4Click(Sender: TObject);
begin
 OptionsForm.ShowModal;
end;

procedure TMainForm.ConnectWithOponent;
begin
 Server:=OptionsForm.RadioGroup3.ItemIndex=0;
 if Server then
 begin
  ServerSocket1.Port:=OptionsForm.SpinEdit1.Value;
  ServerSocket1.Open;
  ServerNetForm.Show;
 end
 else
 begin
  ClientSocket1.Address:=OptionsForm.Edit1.Text;
  ClientSocket1.Port:=OptionsForm.SpinEdit1.Value;
  ClientSocket1.Open;
  ClientNetForm.Show;
 end;
end;

procedure TMainForm.DisconnectOponent;
begin
 if Server then
 begin
  if Connected then
   ServerSocket1.Socket.Connections[0].Close;
  ServerSocket1.Close;
 end
 else ClientSocket1.Close;

 repeat
  Application.ProcessMessages;
 until not Connected;
 InProgress:=False;
end;

procedure TMainForm.ClientSocket1Error(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
 ErrorCode:=0;
 ClientSocket1.Open;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
 SendNetCommand('CLOSE');
 DisconnectOponent;
end;

procedure TMainForm.DoAIMove;
var P:TPoint;
    S:String;
    AINum:Integer;
begin
 if Page.Finished then Exit;
 if (Page.BlackMove and (OptionsForm.RadioGroup1.ItemIndex<>1))or
    ((not Page.BlackMove) and (OptionsForm.RadioGroup2.ItemIndex<>1)) then Exit;
 if NetGame and (not Connected) then Exit;

 if Page.BlackMove then AINum:=OptionsForm.RadioGroup4.ItemIndex
 else AINum:=OptionsForm.RadioGroup5.ItemIndex;
 Page.ModAI:=not Page.BlackMove;
 case AINum of
  0:P:=Page.AIGetMove;
  1:P:=Page.AIGetMove1;
  2:P:=Page.AIGetMove2(3);
  3:P:=Page.AIGetMove2(4);
  4:P:=Page.AIGetMove2(5);
  5:P:=GetQrczakMove;
 end;
 Page.SetMove(P.X,P.Y);
 UpdateAll;

 PositionCount:=1;
 { Obsluga gry sieciowej }
 if Connected then
 begin
  S:=Format('%d:%d',[P.X,P.Y]);
  SendNetCommand(S);
 end;
end;

function TMainForm.GetQrczakMove:TPoint;
type TPair=record
      X,Y:SmallInt;
     end;
var Start:TDateTime;
    F:File of TPair;
    M:TPair;
    Finish:Boolean;
begin
 Start:=Now;

 M.X:=Page.LastMove.X;
 M.Y:=Page.LastMove.Y;
 AssignFile(F,'move.dat');Rewrite(F);
 try
  Write(F,M);
 finally
  CloseFile(F);
 end;
 Finish:=False;
 repeat
  if FileExists('next.dat')then
  begin
   AssignFile(F,'next.dat');Reset(F);
   try
    Read(F,M);
    Result:=Point(M.X,M.Y);
   finally
    CloseFile(F);
   end;
   DeleteFile('next.dat');
   Finish:=True;
  end;
 until (Now>Start+1/24/60*1)or Finish;
end;

procedure TMainForm.CheckEnd;
var W,B:Integer;
    S:String;
begin
 if (not Page.Finished)or(not InProgress) then Exit;
 InProgress:=False;
 Page.GetStats(W,B);
 if W>B then S:='White wins !'
 else
  if B>W then S:='Black wins !'
  else S:='It''s a DRAW !';
 if not CheckBox1.Checked then
 begin
  ShowMessage(S);
  MessageBeep(mb_IconInformation);
 end;
 if W>B then Inc(WhiteC)
 else
  if B>W then Inc(BlackC);
 Label10.Caption:=Format('%d-%d',[WhiteC,BlackC]);
 Label10.Update;
 if CheckBox1.Checked then Button3Click(Nil);
end;

procedure TMainForm.HandleIdle(Sender:TObject;var Done:Boolean);
begin
 if InProgress then
 begin
  DoAIMove;
  CheckEnd;
 end;
end;

procedure TMainForm.Button2Click(Sender: TObject);
begin
 SendNetCommand('CHAT:'+Edit1.Text);
end;

procedure TMainForm.Label10DblClick(Sender: TObject);
begin
 BlackC:=0;WhiteC:=0;
end;

procedure TMainForm.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var P:TPoint;
begin
 if (Page.BlackMove and (OptionsForm.RadioGroup1.ItemIndex<>0))or
    ((not Page.BlackMove) and (OptionsForm.RadioGroup2.ItemIndex<>0)) then
  Image1.Cursor:=crNoDrop
 else
 begin
  P:=Page.FindMousePos(X,Y);
  if Page.GoodMove(P.X,P.Y)then Image1.Cursor:=crDefault
  else Image1.Cursor:=crNoDrop
 end;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
 Button3Click(Sender);
end;

end.
