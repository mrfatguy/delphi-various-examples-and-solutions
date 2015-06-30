unit Inet;

interface

uses
  SysUtils,
  WinInet,
  Windows;

  function SendData(SerwerName, DataStr, QueryStr, Header: string): string;
  function Connected: Boolean;

const
  Header = 'Content-type: application/x-www-form-urlencoded';
  MyAppVer = 'MSIE 5.5';
  MyBuffSize = 512;
  MaxErrors = 3;

implementation

function Connected: Boolean;
var
     Flags: DWORD;
begin
     Flags:=INTERNET_CONNECTION_MODEM or INTERNET_CONNECTION_LAN ;
     Result := InternetGetConnectedState(@Flags, 0);
end;

function SendData(SerwerName, DataStr, QueryStr, Header: string): string;
var
     hSession, hConnect, hHttpRequest: HINTERNET;
     ReadOk: Boolean;
     BytesRead: DWORD;
     Buffer: array[0..Pred(MyBuffSize)] of Char;
     ErrorCount: Byte;
     ErrorMsg: string;

     procedure MyErrorHandle(Error: DWORD; var ErrorMsg: string);
     var
          tmpStr: string;
     begin
     try
          SetLength(tmpStr, 255);
          FormatMessage(FORMAT_MESSAGE_FROM_HMODULE, Pointer(GetModuleHandle('wininet.dll')), Error, 0, PChar(tmpStr), Length(tmpStr), nil);
          SetLength(tmpStr, StrLen(PChar(tmpStr)));
          if (tmpStr[Length(tmpStr) -1] = #13) and (tmpStr[Length(tmpStr)] = #10) then SetLength(tmpStr, Length(tmpStr) - 2);
          ErrorMsg := ErrorMsg + ' B³¹d nr: ' + IntToStr(Error) + ' ' + tmpStr + ' ';
     except end;
     end;

begin
     hSession := InternetOpen(MyAppVer, INTERNET_OPEN_TYPE_DIRECT, '', '', 0);
     if (hSession <> nil) then
     begin
          hConnect := InternetConnect(hSession, PChar(SerwerName), INTERNET_DEFAULT_HTTP_PORT, '', '', INTERNET_SERVICE_HTTP, 0, 0);
          if hConnect <> nil then
          begin
               hHttpRequest := HttpOpenRequest(hConnect, PChar('POST'), PChar(QueryStr), HTTP_VERSION, nil, nil, INTERNET_FLAG_NO_AUTH, 0);
               if hHttpRequest <> nil then
               begin
                    if (HttpSendRequest(hHttpRequest, PChar(Header), Length(Header), PChar(DataStr), Length(DataStr))) then
                    begin
                         ErrorCount := 0;
                         repeat
                              ReadOk := InternetReadFile(hHttpRequest, @Buffer, MyBuffSize, BytesRead);
                              if ReadOk then
                              begin
                                   if BytesRead > 0 then Result := Result + Copy(StrPas(Buffer), 1, BytesRead)
                              end
                              else
                              begin
                                   MyErrorHandle(GetLastError, ErrorMsg);
                                   Inc(ErrorCount);
                              end;
                              if (ErrorCount > MaxErrors) then
                              begin
                                   InternetCloseHandle(hHttpRequest);
                                   InternetCloseHandle(hConnect);
                                   InternetCloseHandle(hSession);
                                   Exit;
                              end;
                         until BytesRead=0;
                         Result := Trim(Result);
                    end
                    else MyErrorHandle(GetLastError, ErrorMsg);
                    InternetCloseHandle(hHttpRequest);
               end
               else MyErrorHandle(GetLastError, ErrorMsg);
               InternetCloseHandle(hConnect);
          end
          else MyErrorHandle(GetLastError, ErrorMsg);
          InternetCloseHandle(hSession);
     end
     else MyErrorHandle(GetLastError, ErrorMsg);
end;

end.
