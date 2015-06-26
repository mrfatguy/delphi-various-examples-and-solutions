unit frmDecompress;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  TDecompress = class(TForm)
    Timer1: TTimer;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Decompress: TDecompress;

implementation

{$R *.DFM}

uses frmBack, Procs;

procedure TDecompress.Timer1Timer(Sender: TObject);
begin
Timer1.Enabled:=False;
InitializeProgram;
ReadData;
ReadSettings;
ProcessSettings;
AssignGraphic;
BackForm.imgLogo.Picture.LoadFromFile(DataPath+'aurelius.bmp');
BackForm.Show;
end;

procedure TDecompress.FormShow(Sender: TObject);
begin
Timer1.Enabled:=True;
end;

end.
