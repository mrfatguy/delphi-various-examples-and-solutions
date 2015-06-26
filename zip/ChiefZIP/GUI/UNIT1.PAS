unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Chfunzip, Unzip, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    ProgressBar1: TProgressBar;
    Button3: TButton;
    OpenDialog1: TOpenDialog;
    Button4: TButton;
    ChiefUnzip1: TChiefUnzip;
    Label4: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

Uses FileCtrl, ZipTypes;

Var
  LRec,
  TotCount,
  ReachedCount : longint;

procedure TForm1.Button2Click(Sender: TObject);
begin
     Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    Edit1.Text := ChiefUnzip1.ZipFileName;
    Edit2.Text := ChiefUnzip1.TargetDirectory;
    Edit3.Text := ChiefUnzip1.FilesToExtract;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
   ChiefUnzip1.ZipFileName := TEdit(Sender).Text;
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
   ChiefUnzip1.TargetDirectory := TEdit(Sender).Text;
end;

procedure TForm1.Edit3Change(Sender: TObject);
begin
   ChiefUnzip1.FilesToExtract := TEdit(Sender).Text;
end;

PROCEDURE Report ( Retcode : longint; R : pReportRec );STDCALL;
  var
  pct:Byte;
  R1 : Real;
BEGIN
  WITH r^ DO BEGIN
  CASE Status of

    file_starting  :
    Begin
      Application.ProcessMessages;
      Form1.Label4.Caption := Strpas(FileName);
    End;

    file_completed :
    Begin
      Application.ProcessMessages;
      Form1.Label4.Caption := '';
    End;

    file_unzipping :
    if Retcode > 0 then
    begin
      Inc ( LRec, Retcode);
      R1 := ( LRec / ReachedCount ) * 100;
      Pct := Round ( R1 );
      Application.ProcessMessages;
      Form1.ProgressBar1.position := Pct;
    end;

    unzip_completed :
    begin
       Form1.ProgressBar1.position := 0;
       Form1.Label4.Caption := '';
    end;
 END {case}

 END;
END; {Report}

procedure TForm1.Button1Click(Sender: TObject);
var
s,d :string;
begin
  If (Edit1.Text > '') and (Edit2.Text > '')
  then begin
     s := Edit1.Text + #0;
     d := Edit2.Text + #0;
     TotCount := 0;
     ProgressBar1.position := 0;
     LRec := 0;
     With ChiefUnzip1
     do begin
        ReportProc := Report;
        ReachedCount := Size;
        Unzip;
     end;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
   If opendialog1.execute then edit1.text := opendialog1.filename;
end;

procedure TForm1.Button4Click(Sender: TObject);
Var
s:AnsiString;
begin
    s := Edit2.Text;
    If Selectdirectory(s, [sdAllowCreate], 0) then Edit2.Text := s;
end;

end.
