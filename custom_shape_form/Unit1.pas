unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var h1,h2: Integer;
    pts: array[0..5] of TPoint;
begin
 
{pts[0] := Point(0,0);
pts[1] := Point(200,300);
pts[2] := Point(200,400);
pts[3] := Point(300,50);
pts[4] := Point(100,100);
pts[5] := Point(0,0);}
 
h1:=CreateEllipticRgn(0,44,128,124);
h2:=CreateRectRgn(64,44,500,124);
//h2 := CreatePolygonRgn(pts,6,WINDING);
//CombineRgn(h1,h1,h2,RGN_XOR);
CombineRgn(h1,h1,h2,RGN_OR);
h2:=CreateRectRgn(360,0,460,44);
CombineRgn(h1,h1,h2,RGN_OR);
h2:=CreateRectRgn(60,114,500,614);
CombineRgn(h1,h1,h2,RGN_OR);
//h2:=CreateEllipticRgn(7,120,64,268);
//CombineRgn(h1,h1,h2,RGN_XOR);
SetWindowRgn(Form1.Handle,h1,True);
end;

end.
