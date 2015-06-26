{*****************************************************************}
{ InterAppComm consists of two components, InterAppSender and     }
{ InterAppReceiver, which can communicate between separate        }
{ applications.                                                   }
{                                                                 }
{ InterAppComm is freeware. Feel free to use and improve it.      }
{ I would be pleased to hear what you think.                      }
{                                                                 }
{ Troels Jakobsen - delphiuser@get2net.dk                         }
{ Copyright (c) 2003                                              }
{*****************************************************************}

unit InterAppComm;

{$IFDEF VER140} {$DEFINE DELPHI_6} {$ENDIF}
{$IFDEF VER150} {$DEFINE DELPHI_7} {$ENDIF}
{$IFDEF DELPHI_6} {$DEFINE DELPHI_6_UP} {$ENDIF}
{$IFDEF DELPHI_7} {$DEFINE DELPHI_6_UP} {$ENDIF}

interface

uses
  Windows, Classes, Messages;

type
  TOnReceiveCall = procedure(Sender: TObject; SenderHandle: HWND) of object;
  TOnReceiveString = procedure(Sender: TObject; SenderHandle: HWND; Text: ShortString) of object;
  TOnReceiveInteger = procedure(Sender: TObject; SenderHandle: HWND; Value: Longint) of object;
  TOnReceiveReal = procedure(Sender: TObject; SenderHandle: HWND; Value: Real) of object;
  TOnReceiveData = procedure(Sender: TObject; SenderHandle: HWND; Data: Pointer;
    DataSize: Cardinal) of object;
  TOnReceiverNotify = procedure(Sender: TObject; ReceiverHandle: HWND) of object;

  THandleArray = array of THandle;

  TInterApp = class(TComponent)
  private
    FHandle: HWND;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Handle: HWND read FHandle; 
  end;

  TInterAppSender = class(TInterApp)
  private
    FEnabled: Boolean;
    FOnReceiverReply:     TOnReceiverNotify;
    FOnReceiverCreated:   TOnReceiverNotify;
    FOnReceiverDestroyed: TOnReceiverNotify;
    FOnReceiverEnabled:   TOnReceiverNotify;
    FOnReceiverDisabled:  TOnReceiverNotify;
  protected
    RespondingReceivers: THandleArray;                // Helper variable; don't use directly
    RespondingNamedReceivers: THandleArray;           // Helper variable; don't use directly
    procedure WndProc(var Msg: TMessage); virtual;    // Application hook method
    procedure DoReceiverReply(ReceiverHandle: HWND); dynamic;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Call(Silent: Boolean): THandleArray;
    function CallGroup(GroupName: ShortString; Silent: Boolean): THandleArray;
    procedure SendString(Receiver: HWND; Text: ShortString);
    procedure SendInteger(Receiver: HWND; Value: Longint);
    procedure SendReal(Receiver: HWND; Value: Real);
    procedure SendData(Receiver: HWND; Data: Pointer; DataSize: Cardinal);
  published
    property Enabled: Boolean read FEnabled write FEnabled default True;
    property OnReceiverReply:     TOnReceiverNotify read FOnReceiverReply write FOnReceiverReply;
    property OnReceiverCreated:   TOnReceiverNotify read FOnReceiverCreated write FOnReceiverCreated;
    property OnReceiverDestroyed: TOnReceiverNotify read FOnReceiverDestroyed write FOnReceiverDestroyed;
    property OnReceiverEnabled:   TOnReceiverNotify read FOnReceiverEnabled write FOnReceiverEnabled;
    property OnReceiverDisabled:  TOnReceiverNotify read FOnReceiverDisabled write FOnReceiverDisabled;
  end;

  TInterAppReceiver = class(TInterApp)
  private
    FEnabled: Boolean;
    FGroupName: ShortString;
    GroupNameAtom: Word;
    FOnReceiveCall:    TOnReceiveCall;
    FOnReceiveString:  TOnReceiveString;
    FOnReceiveInteger: TOnReceiveInteger;
    FOnReceiveReal:    TOnReceiveReal;
    FOnReceiveData:    TOnReceiveData;
    procedure SetEnabled(Value: Boolean);
    procedure SetGroupName(Value: ShortString);
  protected
    procedure Loaded; override;
    procedure WndProc(var Msg: TMessage); virtual;    // Application hook method
    procedure DoReceiveCall(SenderHandle: HWND); dynamic;
    procedure Receive(var Msg: TMessage);
    procedure DoReceiveString(SenderHandle: HWND; Text: ShortString); dynamic;
    procedure DoReceiveInteger(SenderHandle: HWND; Value: Longint); dynamic;
    procedure DoReceiveReal(SenderHandle: HWND; Value: Real); dynamic;
    procedure DoReceiveData(SenderHandle: HWND; Data: Pointer; DataSize: Cardinal); dynamic;
    procedure Reply(Receiver: HWND);                  // Response to Call
    procedure ReplySilent(Receiver: HWND);            // Silent response to Call
    procedure GroupReply(Receiver: HWND);             // Response to CallGroup
    procedure GroupReplySilent(Receiver: HWND);       // Silent response to CallGroup
    procedure NotifyCreated;
    procedure NotifyDestroyed;
    procedure NotifyEnabled;
    procedure NotifyDisabled;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Enabled: Boolean read FEnabled write SetEnabled default True;
    property GroupName: ShortString read FGroupName write SetGroupName;
    property OnReceiveCall:    TOnReceiveCall read FOnReceiveCall write FOnReceiveCall;
    property OnReceiveString:  TOnReceiveString read FOnReceiveString write FOnReceiveString;
    property OnReceiveInteger: TOnReceiveInteger read FOnReceiveInteger write FOnReceiveInteger;
    property OnReceiveReal:    TOnReceiveReal read FOnReceiveReal write FOnReceiveReal;
    property OnReceiveData:    TOnReceiveData read FOnReceiveData write FOnReceiveData;
  end;

  procedure Register;


implementation

uses
  SysUtils{$IFNDEF DELPHI_6_UP}, Forms {$ENDIF};

const
  // Strings used for registering custom messages
  MessageName_Handshake              = 'InterAppHandshake';
  MessageName_HandshakeByGroup       = 'InterAppHandshakeByName';
  MessageName_HandshakeByGroupSilent = 'InterAppHandshakeByNameSilent';
  // LParam constants used with WM_INTERAPP_HANDSHAKE
  HSK_CALL         = 0;
  HSK_CALL_SILENT  = 1;
  HSK_REPLY        = 2;
  HSK_REPLY_SILENT = 3;
  HSK_CREATED      = 4;
  HSK_DESTROYED    = 5;
  HSK_DISABLED     = 6;
  HSK_ENABLED      = 7;
  // dwData constants used with TCopyDataStruct
  DwDataData       = 0;
  DwDataString     = 1;
  DwDataInteger    = 2;
  DwDataReal       = 3;

var
  WM_INTERAPP_HANDSHAKE: Cardinal;
  WM_INTERAPP_HANDSHAKE_GROUP: Cardinal;
  WM_INTERAPP_HANDSHAKE_GROUP_SILENT: Cardinal;

{---------------------- TInterApp ---------------------}

constructor TInterApp.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  WM_INTERAPP_HANDSHAKE := RegisterWindowMessage(PChar(MessageName_Handshake));
  WM_INTERAPP_HANDSHAKE_GROUP := RegisterWindowMessage(PChar(MessageName_HandshakeByGroup));
  WM_INTERAPP_HANDSHAKE_GROUP_SILENT := RegisterWindowMessage(PChar(MessageName_HandshakeByGroupSilent));
end;

{------------------- TInterAppSender ------------------}

constructor TInterAppSender.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  if not (csDesigning in ComponentState) then
  begin
{$IFDEF DELPHI_6_UP}
    FHandle := Classes.AllocateHWnd(WndProc);
{$ELSE}
    FHandle := AllocateHWnd(WndProc);
{$ENDIF}
  end;
  FEnabled := True;
end;


destructor TInterAppSender.Destroy;
begin
  if not (csDesigning in ComponentState) then
  begin
{$IFDEF DELPHI_6_UP}
    Classes.DeallocateHWnd(FHandle);
{$ELSE}
    DeallocateHWnd(FHandle);
{$ENDIF}
  end;
  inherited Destroy;
end;


procedure TInterAppSender.WndProc(var Msg: TMessage);
begin
  if Msg.Msg = WM_INTERAPP_HANDSHAKE then
  begin
    case Msg.LParam of

      HSK_REPLY: begin
        SetLength(RespondingReceivers, High(RespondingReceivers) + 2);
        RespondingReceivers[High(RespondingReceivers)] := Msg.WParam;
        if FEnabled then
          DoReceiverReply(Msg.WParam);
      end;

      HSK_REPLY_SILENT: begin
        SetLength(RespondingReceivers, High(RespondingReceivers) + 2);
        RespondingReceivers[High(RespondingReceivers)] := Msg.WParam;
      end;

      HSK_CREATED:
        if (FEnabled) and (Assigned(FOnReceiverCreated)) then
          FOnReceiverCreated(Self, Msg.WParam);

      HSK_DESTROYED:
        if (FEnabled) and (Assigned(FOnReceiverDestroyed)) then
          FOnReceiverDestroyed(Self, Msg.WParam);

      HSK_ENABLED:
        if (FEnabled) and (Assigned(FOnReceiverEnabled)) then
          FOnReceiverEnabled(Self, Msg.WParam);

      HSK_DISABLED:
        if (FEnabled) and (Assigned(FOnReceiverDisabled)) then
          FOnReceiverDisabled(Self, Msg.WParam);

    end;
    Msg.Result := 0;
  end

  else if (Msg.Msg = WM_INTERAPP_HANDSHAKE_GROUP) or (Msg.Msg = WM_INTERAPP_HANDSHAKE_GROUP_SILENT) then
  begin
    if Cardinal(Msg.WParam) <> FHandle then      // Eliminate messages from ourself
    begin
      // We have a reply from a named receiver
      SetLength(RespondingNamedReceivers, High(RespondingNamedReceivers) + 2);
      RespondingNamedReceivers[High(RespondingNamedReceivers)] := Msg.WParam;
      // Call event method if the reply was not silent
      if (FEnabled) and (Msg.Msg = WM_INTERAPP_HANDSHAKE_GROUP) then
        DoReceiverReply(Msg.WParam);
    end;
    Msg.Result := 0;
  end

  else
    // Default message handling
    Msg.Result := DefWindowProc(FHandle, Msg.Msg, Msg.WParam, Msg.LParam);
end;


function TInterAppSender.Call(Silent: Boolean): THandleArray;
begin
  SetLength(RespondingReceivers, 0);        // Clear array
  if not Silent then
    SendMessage(HWND_BROADCAST, WM_INTERAPP_HANDSHAKE, FHandle, HSK_CALL)
  else
    SendMessage(HWND_BROADCAST, WM_INTERAPP_HANDSHAKE, FHandle, HSK_CALL_SILENT);
  Result := RespondingReceivers;            // Return newly filled array
end;


function TInterAppSender.CallGroup(GroupName: ShortString; Silent: Boolean): THandleArray;
var
  Atom: Word;
begin
  SetLength(RespondingNamedReceivers, 0);   // Clear array
  Atom := GlobalFindAtom(PChar(String(GroupName)));
  if Atom <> 0 then
    if not Silent then
      SendMessage(HWND_BROADCAST, WM_INTERAPP_HANDSHAKE_GROUP, FHandle, Atom)
    else
      SendMessage(HWND_BROADCAST, WM_INTERAPP_HANDSHAKE_GROUP_SILENT, FHandle, Atom);
  Result := RespondingNamedReceivers;       // Return newly filled array
end;


procedure TInterAppSender.SendString(Receiver: HWND; Text: ShortString);
var
  Buffer: array[0..255] of Char;
  CopyData: TCopyDataStruct;
begin
  FillChar(Buffer, 0, SizeOf(Buffer));
  StrPCopy(Buffer, Text);
  CopyData.dwData := DwDataString;
  CopyData.cbData := StrLen(Buffer);
  CopyData.lpData := @Buffer;
  SendMessage(Receiver, WM_COPYDATA, FHandle, LPARAM(@CopyData));
end;


procedure TInterAppSender.SendInteger(Receiver: HWND; Value: Longint);
var
  CopyData: TCopyDataStruct;
begin
  CopyData.dwData := DwDataInteger;
  CopyData.cbData := SizeOf(Value);
  CopyData.lpData := @Value;
  SendMessage(Receiver, WM_COPYDATA, FHandle, LPARAM(@CopyData));
end;


procedure TInterAppSender.SendReal(Receiver: HWND; Value: Real);
var
  CopyData: TCopyDataStruct;
begin
  CopyData.dwData := DwDataReal;
  CopyData.cbData := SizeOf(Value);
  CopyData.lpData := @Value;
  SendMessage(Receiver, WM_COPYDATA, FHandle, LPARAM(@CopyData));
end;


procedure TInterAppSender.SendData(Receiver: HWND; Data: Pointer; DataSize: Cardinal);
var
  CopyData: TCopyDataStruct;
begin
  CopyData.dwData := DwDataData;
  CopyData.cbData := DataSize;
  CopyData.lpData := Data;
  SendMessage(Receiver, WM_COPYDATA, FHandle, LPARAM(@CopyData));
end;


procedure TInterAppSender.DoReceiverReply(ReceiverHandle: HWND);
begin
  if Assigned(FOnReceiverReply) then
    FOnReceiverReply(Self, ReceiverHandle);
end;

{------------------ TInterAppReceiver -----------------}

constructor TInterAppReceiver.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  if not (csDesigning in ComponentState) then
  begin
{$IFDEF DELPHI_6_UP}
    FHandle := Classes.AllocateHWnd(WndProc);
{$ELSE}
    FHandle := AllocateHWnd(WndProc);
{$ENDIF}
  end;
  FEnabled := True;
end;


destructor TInterAppReceiver.Destroy;
begin
  if not (csDesigning in ComponentState) then
  begin
{$IFDEF DELPHI_6_UP}
    Classes.DeallocateHWnd(FHandle);
{$ELSE}
    DeallocateHWnd(FHandle);
{$ENDIF}
  end;
  if GroupNameAtom <> 0 then
    GlobalDeleteAtom(GroupNameAtom);
  NotifyDestroyed;
  inherited Destroy;
end;


procedure TInterAppReceiver.Loaded;
begin
  inherited Loaded;
  NotifyCreated;
end;


procedure TInterAppReceiver.WndProc(var Msg: TMessage);
begin
  if Msg.Msg = WM_INTERAPP_HANDSHAKE then
  begin
    case Msg.LParam of

      HSK_CALL: begin
        // We have a call to all receivers
        if FEnabled then
        begin
          // Notify we received a call from a sender
          DoReceiveCall(Msg.WParam);
          // Answer the call
          Reply(Msg.WParam);
        end;
      end;

      HSK_CALL_SILENT: begin
        // We have a silent call to all receivers
        if FEnabled then
        begin
          // Answer the call silently
          ReplySilent(Msg.WParam);
        end;
      end;

    end;
    Msg.Result := 0;
  end

  else if Msg.Msg = WM_INTERAPP_HANDSHAKE_GROUP then
  begin
    // We have a call to named receivers
    if (FEnabled) and (GroupNameAtom <> 0) and (GroupNameAtom = Msg.LParam) then
    begin
      // Notify we received a call from a sender
      DoReceiveCall(Msg.WParam);
      // Name matches this object; send reply
      GroupReply(Msg.WParam);
    end;
    Msg.Result := 0;
  end

  else if Msg.Msg = WM_INTERAPP_HANDSHAKE_GROUP_SILENT then
  begin
    // We have a silent call to named receivers
    if (FEnabled) and (GroupNameAtom <> 0) and (GroupNameAtom = Msg.LParam) then
    begin
      // Name matches this object; send reply silently
      GroupReplySilent(Msg.WParam);
    end;
    Msg.Result := 0;
  end

  else if Msg.Msg = WM_COPYDATA then
  begin
    if FEnabled then
      Receive(Msg);
    Msg.Result := 0;
  end

  else
    // Default message handling
    Msg.Result := DefWindowProc(FHandle, Msg.Msg, Msg.WParam, Msg.LParam);
end;


procedure TInterAppReceiver.Reply(Receiver: HWND);
begin
  SendMessage(Receiver, WM_INTERAPP_HANDSHAKE, FHandle, HSK_REPLY);
end;


procedure TInterAppReceiver.ReplySilent(Receiver: HWND);
begin
  SendMessage(Receiver, WM_INTERAPP_HANDSHAKE, FHandle, HSK_REPLY_SILENT);
end;


procedure TInterAppReceiver.GroupReply(Receiver: HWND);
begin
  SendMessage(Receiver, WM_INTERAPP_HANDSHAKE_GROUP, FHandle, GroupNameAtom);
end;


procedure TInterAppReceiver.GroupReplySilent(Receiver: HWND);
begin
  SendMessage(Receiver, WM_INTERAPP_HANDSHAKE_GROUP_SILENT, FHandle, GroupNameAtom);
end;


procedure TInterAppReceiver.NotifyCreated;
begin
  SendMessage(HWND_BROADCAST, WM_INTERAPP_HANDSHAKE, FHandle, HSK_CREATED);
end;


procedure TInterAppReceiver.NotifyDestroyed;
begin
  SendMessage(HWND_BROADCAST, WM_INTERAPP_HANDSHAKE, FHandle, HSK_DESTROYED);
end;


procedure TInterAppReceiver.NotifyEnabled;
begin
  SendMessage(HWND_BROADCAST, WM_INTERAPP_HANDSHAKE, FHandle, HSK_ENABLED);
end;


procedure TInterAppReceiver.NotifyDisabled;
begin
  SendMessage(HWND_BROADCAST, WM_INTERAPP_HANDSHAKE, FHandle, HSK_DISABLED);
end;


procedure TInterAppReceiver.Receive(var Msg: TMessage);
var
  CopyData: PCopyDataStruct;
  Text: ShortString;
begin
  CopyData := PCopyDataStruct(Msg.LParam);
  Msg.Result := 0;
  case CopyData.dwData of

    DwDataData: begin
      DoReceiveData(Msg.WParam, CopyData.lpData, CopyData.cbData);
    end;

    DwDataString: begin
      SetString(Text, PChar(CopyData.lpData), CopyData.cbData);
      DoReceiveString(Msg.WParam, Text);
    end;

    DwDataInteger: begin
      DoReceiveInteger(Msg.WParam, Longint(CopyData.lpData^));
    end;

    DwDataReal: begin
      DoReceiveReal(Msg.WParam, Real(CopyData.lpData^));
    end;

  end;
end;


procedure TInterAppReceiver.SetEnabled(Value: Boolean);
begin
  if FEnabled <> Value then
  begin
    FEnabled := Value;
    if FEnabled then
      NotifyEnabled
    else
      NotifyDisabled;
  end;
end;


procedure TInterAppReceiver.SetGroupName(Value: ShortString);
begin
  if FGroupName <> Value then
  begin
    if GroupNameAtom <> 0 then
      GlobalDeleteAtom(GroupNameAtom);
    FGroupName := Value;
    GroupNameAtom := GlobalAddAtom(PChar(String(FGroupName)));
//    GroupNameAtom := GlobalAddAtom(@FGroupName);
  end;
end;


procedure TInterAppReceiver.DoReceiveCall(SenderHandle: HWND);
begin
  if Assigned(FOnReceiveCall) then
    FOnReceiveCall(Self, SenderHandle);
end;


procedure TInterAppReceiver.DoReceiveString(SenderHandle: HWND; Text: ShortString);
begin
  if Assigned(FOnReceiveString) then
    FOnReceiveString(Self, SenderHandle, Text);
end;


procedure TInterAppReceiver.DoReceiveInteger(SenderHandle: HWND; Value: Longint);
begin
  if Assigned(FOnReceiveInteger) then
    FOnReceiveInteger(Self, SenderHandle, Value);
end;


procedure TInterAppReceiver.DoReceiveReal(SenderHandle: HWND; Value: Real);
begin
  if Assigned(FOnReceiveReal) then
    FOnReceiveReal(Self, SenderHandle, Value);
end;


procedure TInterAppReceiver.DoReceiveData(SenderHandle: HWND; Data: Pointer; DataSize: Cardinal);
begin
  if Assigned(FOnReceiveData) then
    FOnReceiveData(Self, SenderHandle, Data, DataSize);
end;


procedure Register;
begin
  RegisterComponents('InterAppComm', [TInterAppSender, TInterAppReceiver]);
end;

end.

