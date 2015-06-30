unit pasProcs;

interface

uses
  SysUtils, Classes, Types, Winsock, WinInet, StdCtrls;

  function GetIP(): String;
  function IsConnected(): Boolean;
  function LoadStringFromFile(FileName: String): String;

  procedure SaveStringToFile(FileName, What: String);

var
  MainPath: String;

const
  VersionNumber: String = '0.10';

implementation

function GetIP(): String;
type
  TaPInAddr = array[0..10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  phe: PHostEnt;
  pptr: PaPInAddr;
  Buffer: array[0..63] of Char;
  I: Integer;
  GInitData: TWSAData;
begin
  WSAStartup($101, GInitData);
  GetHostName(Buffer, SizeOf(Buffer));

  phe := GetHostByName(Buffer);
  if phe = nil then Exit;

  pPtr := PaPInAddr(phe^.h_addr_list);
  I := 0;

  while pPtr^[I] <> nil do
  begin
    Result := inet_ntoa(pptr^[I]^);
    Inc(I);
  end;

  WSACleanup;
end;

function IsConnected(): Boolean;
const
  INTERNET_CONNECTION_MODEM = 1; //Using a modem to connect to Internet
  INTERNET_CONNECTION_LAN = 2; //Using LAN to connect to Internet
  INTERNET_CONNECTION_PROXY = 4; //Using a proxy server to connect to Internet

var
  dwConnectionTypes: DWORD;
begin
  dwConnectionTypes := INTERNET_CONNECTION_MODEM + INTERNET_CONNECTION_LAN + INTERNET_CONNECTION_PROXY;

  Result := InternetGetConnectedState(@dwConnectionTypes,0);
end;

function LoadStringFromFile(FileName: String): String;
var
  slTemp: TStringList;
begin
  Result := '';

  if not FileExists(FileName) then Exit;

  slTemp := TStringList.Create;
  try
    slTemp.LoadFromFile(FileName);
    Result := slTemp.Text;
  finally
    slTemp.Free;
  end;
end;

procedure SaveStringToFile(FileName, What: String);
var
  slTemp: TStringList;
begin
  slTemp := TStringList.Create;
  try
    slTemp.Text := What;
    slTemp.SaveToFile(FileName);
  finally
    slTemp.Free;
  end;
end;

end.

