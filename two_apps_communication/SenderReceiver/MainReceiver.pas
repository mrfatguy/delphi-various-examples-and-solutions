unit MainReceiver;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, Dialogs, StdCtrls, InterAppComm;

type
  // Record used for sending data. Must match the sender app.!!!
  TMyCustomData = packed record
    SomeText: ShortString;
    SomeInteger: Integer;
    SomethingElse: ShortString;
  end;

  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    InterAppReceiver1: TInterAppReceiver;
    Button1: TButton;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure InterAppReceiver1ReceiveCall(Sender: TObject; SenderHandle: HWND);
    procedure InterAppReceiver1ReceiveString(Sender: TObject; SenderHandle: HWND; Text: ShortString);
    procedure InterAppReceiver1ReceiveInteger(Sender: TObject; SenderHandle: HWND; Value: Integer);
    procedure InterAppReceiver1ReceiveReal(Sender: TObject; SenderHandle: HWND; Value: Real);
    procedure InterAppReceiver1ReceiveData(Sender: TObject; SenderHandle: HWND; Data: Pointer;
      DataSize: Cardinal);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Label2.Caption := IntToStr(InterAppReceiver1.Handle);
  CheckBox1Click(Self);
end;


procedure TForm1.InterAppReceiver1ReceiveCall(Sender: TObject; SenderHandle: HWND);
begin
  MessageDlg(IntToStr(InterAppReceiver1.Handle) + ' received call from ' + IntToStr(SenderHandle),
             mtInformation, [mbOk], 0);
end;


procedure TForm1.InterAppReceiver1ReceiveString(Sender: TObject; SenderHandle: HWND;
  Text: ShortString);
begin
  MessageDlg(IntToStr(InterAppReceiver1.Handle) + ' received string from ' +
             IntToStr(SenderHandle) + ':'#13 + Text, mtInformation, [mbOk], 0);
end;


procedure TForm1.InterAppReceiver1ReceiveInteger(Sender: TObject; SenderHandle: HWND; Value: Integer);
begin
  MessageDlg(IntToStr(InterAppReceiver1.Handle) + ' received integer from ' +
             IntToStr(SenderHandle) + ':'#13 + IntToStr(Value), mtInformation, [mbOk], 0);
end;


procedure TForm1.InterAppReceiver1ReceiveReal(Sender: TObject; SenderHandle: HWND; Value: Real);
begin
  MessageDlg(FloatToStr(InterAppReceiver1.Handle) + ' received real from ' +
             FloatToStr(SenderHandle) + ':'#13 + FloatToStr(Value), mtInformation, [mbOk], 0);
end;


procedure TForm1.InterAppReceiver1ReceiveData(Sender: TObject; SenderHandle: HWND;
  Data: Pointer; DataSize: Cardinal);
var
  MyCustomData: ^TMyCustomData;       
begin
  MyCustomData := Data;
  MessageDlg(IntToStr(InterAppReceiver1.Handle) + ' received data from ' +
             IntToStr(SenderHandle) + ':'#13 + MyCustomData.SomeText + ', ' +
             IntToStr(MyCustomData.SomeInteger) + ', ' + MyCustomData.SomethingElse,
             mtInformation, [mbOk], 0);
end;


procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  InterAppReceiver1.Enabled := CheckBox1.Checked;
end;


procedure TForm1.Button1Click(Sender: TObject);
begin
  Close;
end;

end.

