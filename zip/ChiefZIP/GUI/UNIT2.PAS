unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    ProgressBar1: TProgressBar;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    Memo1: TMemo;
    Button7: TButton;
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    aList:TStringList;
    { Private declarations }
    Procedure ShowStats;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

Uses ShellApi, FileCtrl, ZipTypes, Unzip;

Var
  Count,
  BytesExtracted,
  CompressedSize,
  UnzippedSize : longint;

PROCEDURE Report ( Retcode : longint; R : pReportRec ); STDCALL;
  var
  pct:Byte;
  R1 : Real;
BEGIN
  WITH r^ DO BEGIN
  CASE Status of
    file_starting  :
    begin
      Application.ProcessMessages;
      Form1.Panel1.Caption := StrPas(FileName);
    end;

    file_completed :
    begin
      Application.ProcessMessages;
      Form1.Panel1.Caption := '';
    end;

    file_unzipping :
    if Retcode > 0 then
    begin
      Inc ( BytesExtracted, Retcode);
      R1 := ( BytesExtracted / UnzippedSize ) * 100;
      Pct := Round ( R1 );
      Application.ProcessMessages;
      Form1.ProgressBar1.position := Pct;
      Application.ProcessMessages;
    end;
    unzip_completed :
    begin
      Application.ProcessMessages;
      Form1.ProgressBar1.position := 0;
    end;
 END {case}
 END;
END; {Report}

PROCEDURE Report2 ( Retcode : longint;R : pReportRec ); STDCALL;
Var
s:String;
BEGIN
   WITH r^ DO begin
        if Status <> unzip_completed then begin
           s := strpas ( filename );
           Form1.ListBox1.Items.Add(s);
        end;
   end;
END; {Report2}

procedure TForm1.FormCreate(Sender: TObject);
begin
    Edit1.Text := 'g:\temp\bmpico30.zip';
    Edit2.Text := 'g:\temp\test2';
    Edit3.Text := '*.*';
    Panel2.Caption := 'Untitled';
    Count := 0;
    BytesExtracted := 0;
    CompressedSize := 0;
    UnzippedSize := 0;
    aList := TStringList.Create;
end;


procedure TForm1.Button1Click(Sender: TObject);
var
s,d,ss : shortstring;
begin
  CompressedSize := 0;
  ProgressBar1.Position := 0;
  BytesExtracted := 0;
  s := Edit1.Text + #0;
  d := Edit2.Text + #0;
  ss:= Edit3.Text + #0;
  UnzippedSize := UnzipSize(@s[1], CompressedSize);
  Count := FileUnzip( @s[1], @d[1], @ss[1], Report, nil);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Button5Click(Sender: TObject);
Var
s:String;
begin
   If opendialog1.execute
   then begin
      s := opendialog1.filename;
      edit1.text := s;
      s := s+#0;
      UnzippedSize := UnzipSize(@s[1], CompressedSize);
      Count := ViewZip(@s[1], pChar(Edit3.Text), Report2);
      ShowStats;
   end;
end;

procedure TForm1.Button6Click(Sender: TObject);
Var
s:AnsiString;
begin
    If Selectdirectory(s, [sdAllowCreate], 0) then Edit2.Text := s;
end;

Procedure TForm1.ShowStats;
Var
s:AnsiString;
Begin
   Panel2.Caption := Edit1.Text;
   s := 'Statistics:';
   Memo1.Lines.Add(s);
   s := 'Files: '+IntToStr(Count);
   Memo1.Lines.Add(s);
   s := 'Real Size:  '+IntToStr(UnzippedSize);
   Memo1.Lines.Add(s);
   s := 'Compressed:  '+IntToStr(CompressedSize);
   Memo1.Lines.Add(s);
   s := 'Comp Ratio: '+IntToStr(CalcRatio(CompressedSize, UnzippedSize))+'%';
   Memo1.Lines.Add(s);

End;

procedure TForm1.Button2Click(Sender: TObject);
begin
   ListBox1.Items.Clear;
   UnzippedSize := UnzipSize(pChar(Edit1.Text), CompressedSize);
   Count := ViewZip(pChar(Edit1.Text), pChar(Edit3.Text), Report2);
   ShowStats;
end;

procedure TForm1.Button3Click(Sender: TObject);
Var
i:integer;
begin
    ListBox1.Items.Clear;
    Edit1.Text := '';
    Edit2.Text := '';
    Panel2.Caption := 'Untitled';
    Memo1.Lines.Clear;
    if aList.Count > 0 then
    for i := 0 to Pred(aList.Count)
    do begin
       Try
        DeleteFile(aList.Strings[i]);
       Except end;
    end;
    aList.Clear;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
   Panel2.Caption := TEdit(Sender).Text;
end;

Function TmpDir : AnsiString;
Var
p:array[0..259] of char;
Begin
  If GetTempPath(sizeof(p), p) > 0
  then Result := StrPas(p) else Result := 'c:\temp';
End;

Function AddBackSlash(Const s:String):AnsiString;
var
i:integer;
Begin
  i := length(s);
  if (s[i] <> '\') and (i>3)
  then Result := s+'\'
  else Result := s;
End;

procedure TForm1.Button7Click(Sender: TObject);
Var
i:integer;
s,d:string;
begin
    i := ListBox1.ItemIndex;
    If i >= 0 then begin
       s := ListBox1.Items[i];
       d := s + #0;
       s := AddbackSlash(TmpDir)+s+#0;
       if FileUnzip( pChar(Edit1.Text), pChar(tmpDir), @d[1], Nil, Nil) > 0
       then begin
          If ShellExecute(Handle,'open', @s[1],Nil,Nil,sw_showNormal) > 32
          then begin
               aList.Add(s);
          end;
       end;
    end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
Var
i:integer;
begin
    if aList.Count > 0 then
    for i := 0 to Pred(aList.Count)
    do begin
       Try
        DeleteFile(aList.Strings[i]);
       Except end;
    end;
    aList.Free;
end;

end.
