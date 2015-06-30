{*************************************************************}
//                                                           
//   Klient protoko³u SNTP dla Windows 9x/Me/NT/2000/XP      
//                                                           
//   Copyright (c) 2005, 2006 A. Osiciñska-Dudka, A. Dudka   
//                                                           
{*************************************************************}

unit SNTPSocket;

interface

uses
  Windows, Forms, SysUtils, Dialogs, WinSock, SNTPDateTime;

type
  //Zawartoœæ pól rekordu jaki sk³ada siê na datagram SNTP,
  //wiêcej informacji na: http://www.rfc.net/rfc2030.html
  TNTPGram = packed record
    Head1         : Byte;     //Typ ca³kowity 8-bitowy bez znaku  
    Head2         : Byte;     //Typ ca³kowity 8-bitowy bez znaku  
    Head3         : ShortInt; //Typ ca³kowity 8-bitowy ze znakiem 
    Head4         : ShortInt; //Typ ca³kowity 8-bitowy ze znakiem 
    RootDelay     : LongInt;  //Typ ca³kowity 32-bitowy ze znakiem
    RootDispersion: LongWord; //Typ ca³kowity 32-bitowy bez znaku 
    RefID         : LongWord; //Typ ca³kowity 32-bitowy bez znaku 
    Ref1          : LongWord; //Typ ca³kowity 32-bitowy bez znaku 
    Ref2          : LongWord; //Typ ca³kowity 32-bitowy bez znaku 
    Org1          : LongWord; //Typ ca³kowity 32-bitowy bez znaku 
    Org2          : LongWord; //Typ ca³kowity 32-bitowy bez znaku 
    Rcv1          : LongWord; //Typ ca³kowity 32-bitowy bez znaku 
    Rcv2          : LongWord; //Typ ca³kowity 32-bitowy bez znaku 
    Xmit1         : LongWord; //Typ ca³kowity 32-bitowy bez znaku 
    Xmit2         : LongWord; //Typ ca³kowity 32-bitowy bez znaku 
  end;

  function StrToOem(const AAnsiStr: string): string;
  function StartWSAStartup: Boolean;
  function AddrConvert(var AAddr: TSockAddrIn; AAddrStr: string): string;
  function SendAndRecvData(ABuffer: TNTPGram; const APort, ALengthBuffer,
    AFlags: Word; const ARcvTime: Integer): TNTPGram;
  function CloseConnect(const ASocket: Integer): Boolean;
  procedure GetLocalIPAndName(var ALocalIP, ALocalName: string);

var
  Addr: TSockAddrIn;
  MySocket, RecvTime: Word;
  Host, LocalIP, LocalName, HostIn: string;

const
  Flags = 0;
  //Domyœlny port dla protokolu SNTP/NTP: 123
  Port: Word = 123;
  //Maksymalna d³ugoœæ nazwy hosta
  MaxHostNameLen = High(Byte);
  SD_BOTH = $02;

implementation

uses frmMain;

//Konwersja kodowania Windows 1250 na OEM 852 (DOS lub konsola Windows),
//umo¿liwia to poprawne wyœwietlenie polskich czcionek w oknie konsoli

function StrToOem(const AAnsiStr: string): string;
begin
  SetLength(Result, Length(AAnsiStr));
  if Length(Result) > 0 then
  CharToOem(PChar(AAnsiStr), PChar(Result));
end;

//Obs³uga b³êdow zwi¹zanych Socketem

procedure MsgWSAError;
begin
        if MainForm.DontShowErrorMessages = False then MessageBox(Application.Handle, PChar(SysErrorMessage(WSAGetLastError)), 'B³¹d!', $30);
end;

//Pobranie nazwy i adresu lokalnej maszyny

procedure GetLocalIPAndName(var ALocalIP, ALocalName: string);
var
  APHostEnt: PHostEnt;
  APHostName: PChar;
begin
  APHostName := nil;
  //Pobranie IP i nazwy lokalnego komputera
  gethostname(APHostName, SizeOf(MaxHostNameLen));
  //Wpisanie do struktury HostEnt nazwy i adresu maszyny
  APHostEnt := gethostbyname(APHostName);
  if APHostEnt <> nil then
  begin
    ALocalIP := inet_ntoa(PInAddr(APHostEnt^.h_addr_list^)^);
    ALocalName := APHostEnt^.h_name
  end else
  MsgWSAError;
end;

//Uruchomienie biblioteki Windows Sockets (WinSock)

function StartWSAStartup: Boolean;
var
  WSAData: TWSAData;
begin
  Result := False;
  //Inicjujemu u¿ycie biblioteki Windows Sockets
  if WSAStartup(MAKEWORD(2, 2), WSAData) = NO_ERROR then
  begin
    //Utworzenie nowego socketu dla po³¹czenia User Datagram Protocol (UDP)
    MySocket := socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
    Result := True;
  end else
  MsgWSAError;
end;

//Konwersja adresu IP na Nazwê DNS i odwrotnie

function AddrConvert(var AAddr: TSockAddrIn; AAddrStr: string): string;
var
        AHostEnt: PHostEnt;
begin
        FillChar(AAddr, SizeOf(AAddr), 0);
        AAddr.sin_family := AF_INET;

        //Jeœli podano adres IP
        if AAddrStr[1] in ['0'..'9'] then
        begin
                AAddr.sin_addr.S_addr := inet_addr(PChar(AAddrStr));
                AHostEnt := gethostbyaddr(@AAddr.sin_addr.S_addr,
                SizeOf(AAddr.sin_addr.S_addr), AAddr.sin_family);
                Result := AHostEnt^.h_name
        end
        else
        //Jeœli podano nazwe DNS
        begin
                AHostEnt := gethostbyname(PChar(AAddrStr));
                if AHostEnt <> nil then
                begin
                        move(AHostEnt^.h_addr_list^^, AAddr.sin_addr.S_addr,
                        SizeOf(AAddr.sin_addr.S_addr));
                        AAddr.sin_addr.S_addr := LongInt(PLongWord(AHostEnt^.h_addr^)^);
                        Result := inet_ntoa(AAddr.sin_addr)
                end
                else
                begin
                        MsgWSAError();
                        Result := '--';
                end;
        end;
end;

//Wysy³anie i odbieranie danych z serwera

function SendAndRecvData(ABuffer: TNTPGram; const APort, ALengthBuffer,
  AFlags: Word; const ARcvTime: Integer): TNTPGram;
begin
  //Ustawienie dopuszczalnego czasu odpowiedzi serwera
  if setsockopt(MySocket, SOL_SOCKET, SO_RCVTIMEO, @ARcvTime,
    SizeOf(ARcvTime)) = SOCKET_ERROR then
    MsgWSAError;
  //Okreœlenie i konwersja portu
  Addr.sin_port := htons(APort);
  //Próba po³¹czenia z serwerem
  if connect(MySocket, Addr, SizeOf(Addr)) = SOCKET_ERROR then
    MsgWSAError
  else
  begin
    //Wys³anie danych
    if send(MySocket, ABuffer, ALengthBuffer, AFlags) = SOCKET_ERROR then
    MsgWSAError;
    //Odbiór danych
    if recv(MySocket, ABuffer, ALengthBuffer, AFlags) = SOCKET_ERROR then
    MsgWSAError;
  end;
  Result := ABuffer;
end;

//Zamkniêcie u¿ywanego Socketa

function CloseConnect(const ASocket: Integer): Boolean;
begin
  if shutdown(MySocket, SD_BOTH) = SOCKET_ERROR then
  begin
    Result := False;
    MsgWSAError;
  end else
  if CloseSocket(ASocket) = SOCKET_ERROR then
  begin
    Result := False;
    MsgWSAError;
  end else
  Result := True;
end;

initialization
  StartWSAStartup;
  GetLocalIPAndName(LocalIP, LocalName);

finalization
  CloseConnect(MySocket);
  //Konczymy uzywanie biblioteki Windows Sockets
  WSACleanup;

end.
