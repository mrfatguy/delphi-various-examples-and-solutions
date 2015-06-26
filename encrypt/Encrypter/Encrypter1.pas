unit Encrypter1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button2Click(Sender: TObject);
var
x,i,                // count variables
sText,sPW: Integer; // size of Text, PW
Text,PW:   PChar;   // buffer for Text, PW
begin
  sText:=Length(Memo1.text)+1;
  sPW:=Length(Edit1.text)+1;
  Text:=PChar(Trim(Copy(Memo1.text,1,sText)));
  PW:=PChar(Copy(Edit1.text,1,sPW));
  {sText:=Length(Memo1.text)+1;
  sPW:=Length(Edit1.text)+1;
  Text:=PChar(Memo1.text);
  PW:=PChar(Edit1.text);}
  x:=0; // initialize count
  for i:=0 to sText-2 do
  begin
    Text[i]:=Chr(Ord(Text[i])-Ord(PW[x]));
    Inc(x);
    if x=(sPW-1)then x:=0;
  end;
  Memo1.Text:=Text;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
x,i,                // count variables
sText,sPW: Integer; // size of Text, PW
Text,PW:   PChar;   // buffer for Text, PW
begin
  sText:=Length(Memo1.text)+1;
  sPW:=Length(Edit1.text)+1;
  Text:=PChar(Trim(Copy(Memo1.text,1,sText)));
  PW:=PChar(Copy(Edit1.text,1,sPW));
  {sText:=Length(Memo1.text)+1;
  sPW:=Length(Edit1.text)+1;
  Text:=PChar(Memo1.text);
  PW:=PChar(Edit1.text);}
  x:=0; // initialize count
  for i:=0 to sText-2 do
  begin
    Text[i]:=Chr(Ord(Text[i])+Ord(PW[x]));
    Inc(x);
    if x=(sPW-1)then x:=0;
  end;
  Memo1.Text:=Text;
end;

end.
