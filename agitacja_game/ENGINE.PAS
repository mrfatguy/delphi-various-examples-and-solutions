{______________________________________________________________________________

                     (c) 1998 Marcin Wieczorek ( T-1000 )
                         email:wieczor@polbox.com
 ______________________________________________________________________________}

unit Engine;

interface

uses Classes,Windows,Graphics;

const PageDim=10;
      MoveListSize=PageDim*PageDim;
      MaxLevel=10;
      
type TPinKind=(pkNone,pkBlack,pkWhite);
     TPinArray=array[0..PageDim-1,0..PageDim-1]of TPinKind;
     TMoveArray=array[0..MoveListSize-1]of TPoint;
     TMoveList=record
                Moves:TMoveArray;
                Count:Integer;
               end;
     TPageDesc=record
      Pins:TPinArray;
      BlackMove:Boolean;
     end;
     TPinPage=class
      private
      TopLevel:Integer;
      BestMove:TPoint;
      protected
      { Plansza }
      FPins:TPinArray;
      { Czy teraz ruch czarnego ? }
      FBlackMove:Boolean;
      function GetPins(X,Y:Integer):TPinKind;
      procedure SetPins(X,Y:Integer;V:TPinKind);
      public
      Double,Finished,ModAI:Boolean;
      Move:Integer;
      LastMove:TPoint;
      property Pins[I,J:Integer]:TPinKind read GetPins write SetPins;
      property BlackMove:Boolean read FBlackMove write FBlackMove;

      constructor Create;

      { Ocena pozycji }
      function PositionMark:Integer;virtual;

      { Wyrysowanie planszy }
      procedure PaintOn(Canvas:TCanvas);virtual;
      { Kolor przeciwnika }
      function OpositionColor(Color:TPinKind):TPinKind;
      { Kolor aktualny }
      function CurrentColor:TPinKind;
      { Wykonanie ruchu }
      procedure SetMove(X,Y:Integer);virtual;
      { Kratka po myszka }
      function FindMousePos(X,Y:Integer):TPoint;
      { Znalezienie mozliwego ruchu od pola X,Y w prawo i dol }
      function FindMove(var X,Y:Integer):Boolean;
      { Sprawdza czy ruch X,Y jest poprawny }
      function GoodMove(X,Y:Integer):Boolean;
      { Podaje liczby pionów }
      procedure GetStats(var White,Black:Integer);
      { Procedura ustawiajaca poczatek planszy }
      procedure ClearBoard;virtual;
      { Procedura wypelnia puste miejsca pionkami Color }
      procedure FillUp(Color:TPinKind);
      { Wyznacza mozliwe ruchy }
      procedure FindAllMoves(var L:TMoveList);
      { Sztuczna inteligencja }
      function AIGetMove:TPoint;
      function AIGetMove1:TPoint;
      function AIGetMove2(Level:Integer):TPoint;
      function GetValue(N:Integer;Player:Boolean):Integer;

      { Zapis i odczyt ze strumienia }
      procedure StoreTo(S:TStream);virtual;
      procedure LoadFrom(S:TStream);virtual;
      procedure Assign(P:TPinPage);virtual;
     end;

var PositionCount:Integer;

implementation

uses Debug;

{ Stale do wymiarowania planszy }
const PinWidth=15;
      PinHeight=PinWidth;
      LineWidth=1;
      Colors:array[TPinKind]of TColor=(clGray,clBlack,clWhite);

var Levels:array[1..MaxLevel]of TPinPage;

function TPinPage.GetPins(X,Y:Integer):TPinKind;
begin
 if X<-PageDim then X:=X+PageDim*(X div PageDim);
 if Y<-PageDim then Y:=Y+PageDim*(Y div PageDim);

 Result:=FPins[(X+PageDim) mod PageDim,(Y+PageDim) mod PageDim];
end;

procedure TPinPage.SetPins(X,Y:Integer;V:TPinKind);
begin
 if X<-PageDim then X:=X+PageDim*(X div PageDim);
 if Y<-PageDim then Y:=Y+PageDim*(Y div PageDim);

 FPins[(X+PageDim) mod PageDim,(Y+PageDim) mod PageDim]:=V;
end;

constructor TPinPage.Create;
begin
 inherited Create;
 ClearBoard;
 Double:=True;
end;

function TPinPage.PositionMark:Integer;

{ Zlicza liczbe punktow w kolorze Color }
function CountPins(Color:TPinKind):Integer;
var I,J:Integer;
begin
 Result:=0;
 for I:=0 to PageDim-1 do
  for J:=0 to PageDim-1 do
   if FPins[I,J]=Color then Inc(Result);
end;

function SolidBlocks2x2(Color:TPinKind):Integer;
var I,J:Integer;
begin
 Result:=0;
 for I:=0 to PageDim-2 do
  for J:=0 to PageDim-2 do
   if (FPins[I,J]=FPins[I+1,J])and(FPins[I,J+1]=FPins[I+1,J+1])
       and(FPins[I+1,J+1]=Color)and(FPins[I,J]=Color)then Inc(Result);
end;

begin
 Inc(PositionCount);
 Result:=CountPins(pkBlack)-CountPins(pkWhite);
// if not ModAI then Result:=CountPins(pkBlack)-CountPins(pkWhite)
// else Result:=16*(CountPins(pkBlack)-CountPins(pkWhite))+
//              -SolidBlocks2x2(pkBlack)-SolidBlocks2x2(pkWhite);
end;

function TPinPage.OpositionColor(Color:TPinKind):TPinKind;
begin
 if Color=pkBlack then Result:=pkWhite
 else Result:=pkBlack;
end;

function TPinPage.CurrentColor:TPinKind;
begin
 if BlackMove then Result:=pkBlack
 else Result:=pkWhite;
end;

procedure TPinPage.SetMove(X,Y:Integer);
var Color,OpColor:TPinKind;
    I,J:Integer;
begin
 if Finished then Exit;
 TestMsg(GoodMove(X,Y),'Invalid move');
 Color:=CurrentColor;
 OpColor:=OpositionColor(Color);
 for I:=-1 to 1 do
  for J:=-1 to 1 do
   if Pins[X+I,Y+J]=OpColor then Pins[X+I,Y+J]:=Color;
 Pins[X,Y]:=Color;
 FBlackMove:=not FBlackMove;

 X:=0;Y:=0;
 if not FindMove(X,Y) then
 begin
  FillUp(Color);
  Finished:=True;
 end;
 Inc(Move);
 LastMove:=Point(X,Y);
end;

procedure TPinPage.PaintOn(Canvas:TCanvas);
var I,J,X,Y,D:Integer;
begin
 with Canvas do
 begin
  if Double then D:=2
  else D:=1;

  with Pen do
  begin
   Style:=psSolid;
   Color:=clBtnFace;
   Width:=LineWidth;
  end;
  with Brush do
  begin
   Style:=bsSolid;
   Color:=Pen.Color;
  end;
  Rectangle(0,0,D*PageDim*(LineWidth+PinWidth),D*PageDim*(LineWidth+PinHeight));
  Pen.Color:=clBlack;

  for I:=0 to D*PageDim do
  begin
   X:=I*(LineWidth+PinWidth);
   MoveTo(X,0);LineTo(X,D*PageDim*(LineWidth+PinWidth)+LineWidth);
  end;

  for I:=0 to D*PageDim do
  begin
   Y:=I*(LineWidth+PinHeight);
   MoveTo(0,Y);LineTo(D*PageDim*(LineWidth+PinHeight)+LineWidth,Y);
  end;

  Brush.Style:=bsSolid;
  for I:=0 to D*PageDim-1 do
   for J:=0 to D*PageDim-1 do
   begin
    if Pins[I,J]=pkNone then Continue;
    Brush.Color:=Colors[Pins[I,J]];
    X:=I*(LineWidth+PinWidth)+1;
    Y:=J*(LineWidth+PinHeight)+1;
    Ellipse(X,Y,X+PinWidth,Y+PinHeight);
   end;
 end;
end;

function TPinPage.FindMousePos(X,Y:Integer):TPoint;
begin
 Result.X:=X div (LineWidth+PinWidth);
 Result.Y:=Y div (LineWidth+PinHeight);
end;

function TPinPage.FindMove(var X,Y:Integer):Boolean;
begin
 Result:=True;
 repeat
  repeat
   if GoodMove(X,Y) then Exit;
   Inc(X);
  until X>=PageDim;
  X:=0;
  Inc(Y);
 until Y>=PageDim;
 Result:=False;
end;

function TPinPage.GoodMove(X,Y:Integer):Boolean;
var LX,LY,HX,HY:Integer;
    Color:TPinKind;
begin
 Result:=False;
 if Pins[X,Y]<>pkNone then Exit;
 Result:=True;Color:=CurrentColor;
 LX:=X-1;HX:=X+1;
 LY:=Y-1;HY:=Y+1;
 if (Pins[LX,LY]=Color)or(Pins[X,LY]=Color)or(Pins[HX,LY]=Color)or
    (Pins[LX,Y]=Color)or(Pins[HX,Y]=Color)or
    (Pins[LX,HY]=Color)or(Pins[X,HY]=Color)or(Pins[HX,HY]=Color)then Exit;
 Result:=False;
end;

procedure TPinPage.GetStats(var White,Black:Integer);
var I,J:Integer;
begin
 White:=0;Black:=0;
 for I:=0 to PageDim-1 do
  for J:=0 to PageDim-1 do
   case Pins[I,J] of
    pkBlack:Inc(Black);
    pkWhite:Inc(White);
   end; 
end;

procedure TPinPage.ClearBoard;
var I,J:Integer;
begin
 for I:=0 to PageDim-1 do
  for J:=0 to PageDim-1 do
   Pins[I,J]:=pkNone;
 Pins[3,3]:=pkWhite;
 Pins[6,6]:=pkBlack;
 FBlackMove:=False;
 Finished:=False;
 Move:=2;
end;

procedure TPinPage.FillUp(Color:TPinKind);
var I,J:Integer;
begin
 for I:=0 to PageDim-1 do
  for J:=0 to PageDim-1 do
   if Pins[I,J]=pkNone then Pins[I,J]:=Color;
end;

procedure TPinPage.StoreTo(S:TStream);
begin
 S.Write(FPins,SizeOf(FPins));
 S.Write(FBlackMove,SizeOf(FBlackMove));
end;

procedure TPinPage.LoadFrom(S:TStream);
begin
 S.Read(FPins,SizeOf(FPins));
 S.Read(FBlackMove,SizeOf(FBlackMove));
end;

procedure TPinPage.FindAllMoves(var L:TMoveList);
var I,J:Integer;
begin
 L.Count:=0;
 for I:=0 to PageDim-1 do
  for J:=0 to PageDim-1 do
   if GoodMove(I,J) then
   begin
    L.Moves[L.Count]:=Point(I,J);
    Inc(L.Count);
   end;
end;

procedure TPinPage.Assign(P:TPinPage);
begin
 FPins:=P.FPins;
 FBlackMove:=P.FBlackMove;
 Finished:=P.Finished;
 Double:=P.Double;
end;

function TPinPage.AIGetMove:TPoint;
var L:TMoveList;
begin
 Result:=Point(-1,-1);
 FindAllMoves(L);
 if L.Count=0 then Exit;
 Result:=L.Moves[Random(L.Count)];
end;

function TPinPage.AIGetMove1:TPoint;
var L:TMoveList;
    I,Max,MaxI,V,W,B:Integer;
    P:TPinPage;
begin
 { Troche ruchow losowych }
 if Random(33)=0 then
 begin
  Result:=AIGetMove;
  Exit;
 end;

 Result:=Point(-1,-1);
 FindAllMoves(L);
 if L.Count=0 then Exit;
 P:=TPinPage.Create;
 try
  Max:=-MaxLongint;MaxI:=-1;
  for I:=0 to L.Count-1 do
  begin
   P.Assign(Self);
   P.SetMove(L.Moves[I].X,L.Moves[I].Y);
   P.GetStats(W,B);
   if BlackMove then V:=B-W
   else V:=W-B;
   if V>Max then
   begin
    Max:=V;MaxI:=I;
   end;
  end;
 finally
  P.Free;
 end;
 Result:=L.Moves[MaxI];
end;

function TPinPage.GetValue(N:Integer;Player:Boolean):Integer;
var I,Min,Max,MinI,MaxI,V:Integer;
    L:TPinPage;
    M:TMoveList;
begin
 if N=1 then
 begin
  if Player then Result:=PositionMark
  else Result:=-PositionMark;
  if N=TopLevel then BestMove:=AIGetMove1;
 end
 else
 begin
  FindAllMoves(M);
  if Player then V:=PositionMark
  else V:=-PositionMark;
  if (M.Count=0)or((V>10)and(Move<70)) then
  begin
   Result:=V;
   if N=TopLevel then BestMove:=AIGetMove1;
  end
  else
  begin
   L:=Levels[N];
   Min:=MaxLongint;Max:=-MaxLongint;MinI:=0;MaxI:=0;
   for I:=0 to M.Count-1 do
   begin
    L.Assign(Self);
    L.SetMove(M.Moves[I].X,M.Moves[I].Y);
    V:=L.GetValue(N-1,Player);
    if V<Min then
    begin
     Min:=V;MinI:=I;
    end;
    if V>Max then
    begin
     Max:=V;MaxI:=I;
    end;
   end;
   if Player=BlackMove then Result:=Max
   else Result:=Min;
   if N=TopLevel then
   begin
    if Player=BlackMove then BestMove:=M.Moves[MaxI]
    else BestMove:=M.Moves[MinI]
   end;
  end;
 end;
end;

function TPinPage.AIGetMove2(Level:Integer):TPoint;
begin
 { Troche ruchow losowych }
 if Random(11*Level)=0 then
 begin
  Result:=AIGetMove;
  Exit;
 end;
 if Move>80 then Level:=Level+2
 else
  if Move>70 then Level:=Level+1; 
 TopLevel:=Level;
 GetValue(TopLevel,BlackMove);
 Result:=BestMove;
end;

procedure Init;
var I:Integer;
begin
 for I:=1 to MaxLevel do Levels[I]:=TPinPage.Create;
end;

procedure Done;
var I:Integer;
begin
 for I:=1 to MaxLevel do Levels[I].Free;
end;

initialization
 Init;
finalization
 Done;
end.
