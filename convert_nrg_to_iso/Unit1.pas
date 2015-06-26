unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Edit2: TEdit;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Button3: TButton;
    Label1: TLabel;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private-Deklarationen }
    cancel: Boolean;
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
  OpenDialog1.FileName := Edit1.Text;
  if (OpenDialog1.Execute) then
    begin
      Edit1.Text := OpenDialog1.FileName;
      Edit2.Text := ChangeFileExt(Edit1.Text, '.iso');
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  SaveDialog1.FileName := Edit2.Text;
  if (SaveDialog1.Execute) then
    Edit2.Text := SaveDialog1.FileName;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  src, dst: Integer;
  buf: Pointer;
  n: Cardinal;
  bytes, bytestocopy: Integer;
  lastpart: array [0..4] of Integer;
begin
  if Tag = 0 then
    begin
      Tag := 1;
      cancel := False;
      Button1.Enabled := False; Button2.Enabled := False; Button4.Enabled := False;
      Button3.Caption := '&Quit';
      src := INVALID_HANDLE_VALUE;
      dst := INVALID_HANDLE_VALUE;
      try
        GetMem(buf, 1 shl 20); // 1 Megabyte
        src := CreateFile(PChar(Edit1.Text), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, 0, 0);
        if (src = INVALID_HANDLE_VALUE) then
          raise EInOutError.Create('Source file not found.');
        dst := CreateFile(PChar(Edit2.Text), GENERIC_WRITE, FILE_SHARE_READ, nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
        if (dst = INVALID_HANDLE_VALUE) then
          raise EInOutError.Create('Cannot create destination file.');
        bytestocopy := SetFilePointer(src, 0, nil, FILE_END);
        SetFilePointer(src, -sizeof(lastpart), nil, FILE_END);
        if (not ReadFile(src, lastpart, sizeof(lastpart), n, nil)) then
          raise EInOutError.Create('Source file too short.');
        if (((lastpart[0] = $21444E45) and
             (lastpart[2] = $3552454E)) or
            ((lastpart[1] = $21444E45) and
             (lastpart[3] = $4F52454E))) then
          begin
            bytestocopy := lastpart[4];
            asm
              mov eax, bytestocopy
              xchg ah, al
              rol eax, 16
              xchg ah, al
              mov bytestocopy, eax
            end;
          end;
        Dec(bytestocopy, 512*600);
        if (SetFilePointer(src, 512*600, nil, FILE_BEGIN) = -1) then
          raise EInOutError.Create('Source file too short.');
        while (bytestocopy > 0) do
          begin
            bytes := bytestocopy;
            if (bytes > 1 shl 20) then
              bytes := 1 shl 20;
            if (not ReadFile(src, buf^, bytes, n, nil)) then
              raise EInOutError.Create('Read error');
            if n = 0 then
              break;
            Dec(bytestocopy, n);
            if cancel then
              break;
            if (not WriteFile(dst, buf^, n, n, nil)) then
              raise EInOutError.Create('Write error');
            Label1.Caption := Format('Copied %d bytes', [SetFilePointer(src, 0, nil, FILE_CURRENT)]);
            Label1.Update;
            Application.ProcessMessages;
          end;
        Label1.Caption := 'finished.';
      except
        on e: EInOutError do
          Label1.Caption := 'Error: ' + e.Message;
      end;
      CloseHandle(src);
      CloseHandle(dst);
      Button3.Caption := '&Convert';
      Button1.Enabled := True; Button2.Enabled := True; Button4.Enabled := True;
      Tag := 0;
    end
  else
    cancel := True;
end;


procedure TForm1.Button4Click(Sender: TObject);
begin
  Close;
end;

end.
