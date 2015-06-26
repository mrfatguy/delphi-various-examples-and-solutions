unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  chuj: TStringList;
begin
  ShowMessage('Before duplicates remove there was ' + IntToStr(Memo1.Lines.Count) + ' items.');

  chuj := TStringList.Create;
  chuj.Sorted := True;
  chuj.Duplicates := dupIgnore;
  chuj.Assign(Memo1.Lines);
  Memo1.Clear;
  Memo1.Lines.Assign(chuj);

  ShowMessage('After duplicates remove there are ' + IntToStr(Memo1.Lines.Count) + ' items.');
end;

end.
