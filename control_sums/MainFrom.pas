unit MainFrom;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls;

type
  TForm1 = class(TForm)
    Button1 : TButton;
    Label1 : TLabel;
    Label2 : TLabel;
    MaskEdit1 : TMaskEdit;
    Button2 : TButton;
    Label3 : TLabel;
    Label4 : TLabel;
    MaskEdit2 : TMaskEdit;
    Button3 : TButton;
    Label5 : TLabel;
    Label6 : TLabel;
    MaskEdit3 : TMaskEdit;
    Button4 : TButton;
    Label7 : TLabel;
    Label8 : TLabel;
    MaskEdit4 : TMaskEdit;
    Button5 : TButton;
    Label9 : TLabel;
    Label10 : TLabel;
    MaskEdit5 : TMaskEdit;
    Bevel1: TBevel;
    procedure Button1Click(Sender : TObject);
    procedure Button2Click(Sender : TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
    function CheckPesel(kod : string) : boolean;
    function CheckNIP(kod : string) : boolean;
    function CheckREGON(kod: string): boolean;
    function CheckKonto(kod: string): boolean;
    function CheckISBN(kod: string): boolean;
  public
    { Public declarations }
  end;

var
  Form1 : TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender : TObject);
begin
  if CheckPesel(MaskEdit1.Text) then
    Label1.Caption := 'Poprawny'
  else
    Label1.Caption := 'Z造 !'
end;

function TForm1.CheckPesel(kod : string) : boolean;
var
  suma, i : integer;
  wagi : array[1..10] of byte;

begin
  wagi[1] := 1; wagi[2] := 3; wagi[3] := 7;
  wagi[4] := 9; wagi[5] := 1; wagi[6] := 3;
  wagi[7] := 7; wagi[8] := 9; wagi[9] := 1;
  wagi[10] := 3;

  suma := 0;
  for i := 1 to 10 do
    suma := (wagi[i] * StrToInt(kod[i])) + suma;

  if StrToInt(kod[11]) = 10 - (suma mod 10) then
    CheckPesel := true else CheckPesel := false;
end;

procedure TForm1.Button2Click(Sender : TObject);
begin
  if CheckNIP(MaskEdit2.Text) then
    Label3.Caption := 'Poprawny'
  else
    Label3.Caption := 'Z造 !'
end;

function TForm1.CheckNIP(kod : string) : boolean;
var
  suma, i : integer;
  wagi : array[1..10] of byte;

begin
  wagi[1] := 6; wagi[2] := 5; wagi[3] := 7;
  wagi[4] := 2; wagi[5] := 3; wagi[6] := 4;
  wagi[7] := 5; wagi[8] := 6; wagi[9] := 7;

  suma := 0;
  for i := 1 to 9 do
    suma := (wagi[i] * StrToInt(kod[i])) + suma;

  if StrToInt(kod[10]) = (suma mod 11) then
    CheckNIP := true else CheckNIP := false;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if CheckREGON(MaskEdit3.Text) then
    Label5.Caption := 'Poprawny'
  else
    Label5.Caption := 'Z造 !'
end;

function TForm1.CheckREGON(kod: string): boolean;
var
 suma, i: integer;
 wagi: array [1..10] of byte;

begin
  wagi[1]:=8;  wagi[2]:=9;  wagi[3]:=2;
  wagi[4]:=3;  wagi[5]:=4;  wagi[6]:=5;
  wagi[7]:=6;  wagi[8]:=7;

   suma:=0;
   for i:=1 to 8 do
    suma:=(wagi[i]*StrToInt(kod[i]))+suma;

    if StrToInt(kod[9])=(suma mod 11) then
     CheckREGON:=true else CheckREGON:=false;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if CheckKonto(MaskEdit4.Text) then
    Label7.Caption := 'Poprawny'
  else
    Label7.Caption := 'Z造 !'
end;

function TForm1.CheckKonto(kod: string): boolean;
var
 suma, i: integer;
 wagi: array [1..10] of byte;

begin
  wagi[1]:=7;  wagi[2]:=1;  wagi[3]:=3;
  wagi[4]:=9;  wagi[5]:=7;  wagi[6]:=11;
  wagi[7]:=3;

   suma:=0;
   for i:=1 to 7 do
    suma:=(wagi[i]*StrToInt(kod[i]))+suma;

    if StrToInt(kod[8])=(suma mod 10) then
     CheckKonto:=true else CheckKonto:=false;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if CheckISBN(MaskEdit5.Text) then
    Label9.Caption := 'Poprawny'
  else
    Label9.Caption := 'Z造 !'
end;

function TForm1.CheckISBN(kod: string): boolean;
var
 suma, i: integer;

begin
   suma:=0;
   for i:=1 to 9 do
     suma:=(11-i)*StrToInt(kod[i])+suma;

    if StrToInt(kod[10])=11-(suma mod 11) then
     CheckISBN:=true else CheckISBN:=false;
end;

end.

