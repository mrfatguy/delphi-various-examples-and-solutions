unit MForm;

{ (c)1998 Marcin Wieczorek ( T-1000) }

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TMainForm = class(TForm)
    OpenDialog1: TOpenDialog;
    Memo1: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses FmtEng;

{$R *.DFM}

procedure TMainForm.Button1Click(Sender: TObject);
begin
 if OpenDialog1.Execute then
  Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
 Parameters.LoadFromFile('Formatter.ini');
end;

procedure TMainForm.Button4Click(Sender: TObject);
var L:TStringList;
begin
 L:=TStringList.Create;
 try
  Screen.Cursor:=crHourGlass;
  L.Assign(Memo1.Lines);
  ProcessStringList(L);
  Memo1.Lines.Assign(L);
 finally
  Screen.Cursor:=crDefault;
  L.Free;
 end;
end;

procedure TMainForm.Button2Click(Sender: TObject);
begin
 Memo1.SelectAll;
 Memo1.PasteFromClipboard;
 Memo1.SelLength:=0;
end;

procedure TMainForm.Button3Click(Sender: TObject);
begin
 Memo1.SelectAll;
 Memo1.CopyToClipboard;
 Memo1.SelLength:=0;
end;

procedure TMainForm.Button5Click(Sender: TObject);
begin
 Button2Click(Sender);
 Button4Click(Sender);
 Button3Click(Sender);
end;

end.
