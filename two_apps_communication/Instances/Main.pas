unit Main;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, Dialogs, StdCtrls, InterAppComm;

type
  TForm1 = class(TForm)
    InterAppSender1: TInterAppSender;
    InterAppReceiver1: TInterAppReceiver;
    ListBox1: TListBox;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure InterAppReceiver1ReceiveReal(Sender: TObject; SenderHandle: HWND; Value: Real);
    procedure InterAppReceiver1ReceiveString(Sender: TObject; SenderHandle: HWND; Text: ShortString);
    procedure Button1Click(Sender: TObject);
  protected
    procedure Loaded; override;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Loaded;
var
  NamedReceivers: THandleArray;
  I: Integer;
  FoundApp: Boolean;
begin
  inherited Loaded;
  FoundApp := False;
  // Search for receivers with InterAppReceiver1's GroupName
  NamedReceivers := InterAppSender1.CallGroup(InterAppReceiver1.GroupName, True);
  for I := 0 to High(NamedReceivers) do
    if NamedReceivers[I] <> InterAppReceiver1.Handle then
    begin
      // We've found a receiver object with the matching group name
      FoundApp := True;
      Break;
    end;
  if FoundApp then
  begin
//    MessageDlg('Found a running instance. Terminating.', mtInformation, [mbOk], 0);
    // Send time of day to running app.
    InterAppSender1.SendReal(NamedReceivers[I], Time);
    // Send a string to running app. so it will know it should go to the foreground
    InterAppSender1.SendString(NamedReceivers[I], 'GoToForeground');
    // Terminate this app.
    Application.Terminate;
  end
  else
    { In order to avoid unnecessary blinking on the taskbar Application.ShowMainForm is set
      to False (see src. in the dpr file), so we need to set the form's visibility manually. }
    Visible := True;
end;


procedure TForm1.InterAppReceiver1ReceiveReal(Sender: TObject; SenderHandle: HWND; Value: Real);
begin
  // We receive time of day from the new app. here
  ListBox1.Items.Add(TimeToStr(Value))
end;


procedure TForm1.InterAppReceiver1ReceiveString(Sender: TObject; SenderHandle: HWND; Text: ShortString);
begin
  // We receive text from the new app. here
  if Text = 'GoToForeground' then
  begin
    Application.Restore;
    Application.BringToFront;
  end;
end;


procedure TForm1.Button1Click(Sender: TObject);
begin
  Close;
end;

end.

