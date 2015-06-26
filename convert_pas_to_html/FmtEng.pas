unit FmtEng;
{ (c)1998 Marcin Wieczorek ( T-1000) }
interface

uses Classes;

const inReserved='<strong>';
      outReserved='</strong>';
      inComment='<em>';
      outComment='</em>';
      inPara='<p>';
      outParam='</p>';
      inoutBreak='<br>';
      inCode='<code>';
      outCode='</code>';
      inPreformat='<pre>';
      outPreformat='</pre>';
      nCharacters=[#0..#255]-['a'..'z','A'..'Z'];
      markLess='&lt;';
      markGreat='&gt;';

type TParameters=class
      protected
      FReserved:TStringList;
      FComment:String;
      destructor Destroy;override;
      public
      property Reserved:TStringList read FReserved;
      property Comment:String read FComment;
      procedure LoadFromFile(N:String);
      constructor Create;
     end;

procedure ProcessStringList(L:TStrings);
procedure ProcessFile(N:String);

var Parameters:TParameters;

implementation

uses INIFiles,SysUtils,Forms,Clipbrd;

function FindPos(Sub,S:String;From:Integer):Integer;
var I,J,P:Integer;
begin
 Result:=0;
 for I:=From to Length(S) do
 begin
  P:=0;
  for J:=1 to Length(Sub) do
  begin
   if S[I+J-1]<>Sub[J] then Break;
   P:=J;
  end;
  if (P=Length(Sub))and((S[I-1]in nCharacters)and(S[I+Length(Sub)]in nCharacters))then
  begin
   Result:=I;
   Break;
  end;
 end;
end;

function ProcessLine(S:String):String;
var I,P,C,WP:Integer;
    W:String;
begin
 while Pos('<',S)<>0 do
 begin
  P:=Pos('<',S);
  Delete(S,P,1);Insert(markLess,S,P);
 end;
 while Pos('>',S)<>0 do
 begin
  P:=Pos('>',S);
  Delete(S,P,1);Insert(markGreat,S,P);
 end;

 C:=Pos(Parameters.Comment,S);
 if C<>0 then
 begin
  Insert(inComment,S,C);
  S:=S+outComment;
 end;

 for I:=0 to Parameters.Reserved.Count-1 do
 begin
  WP:=1;
  W:=Parameters.Reserved[I];
  repeat
   P:=FindPos(W,S,WP);
   if (P>0)and((P<C)or(C=0))then
   begin
    Insert(inReserved,S,P);
    Insert(outReserved,S,P+Length(W+InReserved));
   end;
   WP:=P+Length(inReserved+outReserved+W);
  until P=0;
 end;
 Result:=S;
end;

procedure ProcessStringList(L:TStrings);
var I:Integer;
begin
 for I:=0 to L.Count-1 do L[I]:=ProcessLine(L[I]);
 L.Insert(0,inCode);
 L.Insert(0,inPreformat);
 L.Add(outCode);
 L.Add(outPreformat);
end;

procedure ProcessFile(N:String);
var L:TStringList;
begin
 L:=TStringList.Create;
 try
  L.LoadFromFile(N);
  ProcessStringList(L);
  L.SaveToFile(N);
 finally
  L.Free;
 end;
end;

{______________________________________________________________________________}

destructor TParameters.Destroy;
begin
 FReserved.Free;FReserved:=Nil;
 inherited Destroy;
end;

procedure TParameters.LoadFromFile(N:String);
var INI:TINIFile;
    S:String;
begin
 INI:=TINIFile.Create(N);
 try
  S:=ExtractFilePath(Application.ExeName)+INI.ReadString('DataFiles','ReservedWords','RESERVED.TXT');
  FReserved.LoadFromFile(S);
  FComment:=INI.ReadString('Tags','CommentString','//');
 finally
  INI.Free;
 end;
end;

constructor TParameters.Create;
begin
 inherited Create;
 FREserved:=TStringList.Create;
end;

initialization
 Parameters:=TParameters.Create;
finalization
 Parameters.Free;
end.
