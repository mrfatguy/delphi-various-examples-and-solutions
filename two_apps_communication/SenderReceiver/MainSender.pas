unit MainSender;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, Dialogs, StdCtrls, InterAppComm;

type
  // Record used for sending data. Must match the receiver app.!!!
  TMyCustomData = packed record
    SomeText: ShortString;
    SomeInteger: Integer;
    SomethingElse: ShortString;
  end;

  TForm1 = class(TForm)
    InterAppSender1: TInterAppSender;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ListBox1: TListBox;
    Label4: TLabel;
    Label3: TLabel;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure InterAppSender1ReceiverReply(Sender: TObject; ReceiverHandle: HWND);
    procedure InterAppSender1ReceiverStateChanged(Sender: TObject; ReceiverHandle: HWND);
  private
    function RefreshReceivers(Silent: Boolean): Word;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Label2.Caption := IntToStr(InterAppSender1.Handle);
  RefreshReceivers(True);
end;


function TForm1.RefreshReceivers(Silent: Boolean): Word;
var
  I: Integer;
  ActiveReceivers: THandleArray;
begin
  ActiveReceivers := InterAppSender1.Call(Silent);
  ListBox1.Clear;
  for I := 0 to High(ActiveReceivers) do
    ListBox1.Items.Add(IntToStr(ActiveReceivers[I]));
  // Return # active receivers found
  Result := High(ActiveReceivers) + 1;
end;


procedure TForm1.InterAppSender1ReceiverReply(Sender: TObject; ReceiverHandle: HWND);
begin
  MessageDlg(IntToStr(InterAppSender1.Handle) + ' received reply from ' + IntToStr(ReceiverHandle),
             mtInformation, [mbOk], 0);
end;


procedure TForm1.InterAppSender1ReceiverStateChanged(Sender: TObject; ReceiverHandle: HWND);
begin
  RefreshReceivers(True);
end;


procedure TForm1.Button1Click(Sender: TObject);
var
  Receivers: Word;
begin
  Receivers := RefreshReceivers(False);
  MessageDlg(IntToStr(Receivers) + ' active receiver(s) detected.', mtInformation, [mbOk], 0);
end;


procedure TForm1.Button2Click(Sender: TObject);
var
  MyCustomData: TMyCustomData;
  I: Integer;
begin
  MyCustomData.SomeText := 'Sending data';
  MyCustomData.SomeInteger := 42;
  MyCustomData.SomethingElse := 'Hello';
  for I := 0 to ListBox1.Count - 1 do
    if ListBox1.Selected[I] then
      InterAppSender1.SendData(StrToInt(ListBox1.Items[I]), @MyCustomData, SizeOf(MyCustomData));
end;


procedure TForm1.Button3Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ListBox1.Count - 1 do
    if ListBox1.Selected[I] then
      InterAppSender1.SendString(StrToInt(ListBox1.Items[I]), 'This is a test');
end;


procedure TForm1.Button4Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ListBox1.Count - 1 do
    if ListBox1.Selected[I] then
      InterAppSender1.SendInteger(StrToInt(ListBox1.Items[I]), 10000);
end;


procedure TForm1.Button5Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ListBox1.Count - 1 do
    if ListBox1.Selected[I] then
      InterAppSender1.SendReal(StrToInt(ListBox1.Items[I]), 3.1415);
end;


procedure TForm1.Button6Click(Sender: TObject);
begin
  Close;
end;

end.

