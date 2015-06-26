unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TfrmMain = class(TForm)
    reMainTextField: TRichEdit;
    btnROT13: TButton;
    procedure btnROT13Click(Sender: TObject);
    procedure Resized(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.DFM}

function Rot13(zn : Char) : Char;
begin
if (upcase(zn)>='A') and (upcase(zn)<='M') then rot13:=chr(ord(zn)+13)
else if (upcase(zn)>='N') and (upcase(zn)<='Z') then rot13:=chr(ord(zn)-13)
else rot13:=zn;
end;

procedure TfrmMain.btnROT13Click(Sender: TObject);
var i : LongInt;
    str : String;
begin
str:=reMainTextField.Text;
for i:=1 to Length(str) do str[i]:=Rot13(str[i]);
reMainTextField.Text:=str;
end;

procedure TfrmMain.Resized(Sender: TObject);
begin
reMainTextField.Height:=frmMain.Height-29;
reMainTextField.Width:=frmMain.Width-10;
btnROT13.Left:=reMainTextField.Width-btnROT13.Width-8;
end;

end.
