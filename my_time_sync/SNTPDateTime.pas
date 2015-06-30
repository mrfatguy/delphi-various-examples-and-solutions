{*************************************************************}
//                                                           
//   Klient protoko³u SNTP dla Windows 9x/Me/NT/2000/XP      
//                                                           
//   Copyright (c) 2005, 2006 A. Osiciñska-Dudka, A. Dudka   
//                                                           
{*************************************************************}

unit SNTPDateTime;

interface

uses
  Windows, Forms, SysUtils, SNTPExtra;

function GetLocalTime: TDateTime;
function GetTimeZoneInfo(var ABias: TDateTime): string;
function SetLocalTimeWin9xWinNT(const ADateTime: TDateTime): Boolean;
function SetTimeZoneBiasStr(const ATimeZoneBias: TDateTime): string;

var
  TimeZoneName: string[32];
  TimeZoneBias, TimeOrg, TimeDst, GMTTime, LocalTime: TDateTime;

implementation

uses
  SNTPSocket, frmMain;

//Funkcja zwraca offset strefy czasowej w godzinach jako string

function SetTimeZoneBiasStr(const ATimeZoneBias: TDateTime): string;
begin
  if ATimeZoneBias > 0 then
  Result := FormatDateTime('"GMT -"hh:nn', ATimeZoneBias)
  else
  Result := FormatDateTime('"GMT +"hh:nn', ATimeZoneBias);
end;

//Funkcja zwraca czas lokalny (aktualny czas strefowy) w formacie TDateTime

function GetLocalTime: TDateTime;
begin
  Result := Now;
end;

//Funkcja zwraca offset strefy czasowej w dobach (TDateTime) oraz jej nazwe
//Offset (ABias) = GMT - czas lokalny
//czas lokalny = aktualny czas strefowy
//GMT = Greenwich Mean Time, czas poludnika zerowego w Greenwich,
//w Polsce czas letni  = GMT + 2 godziny, czas zimowy = GMT + 1 godzina

function GetTimeZoneInfo(var ABias: TDateTime): string;
var
  AName: string;
  ATimeZone: TIME_ZONE_INFORMATION;
begin
  case GetTimeZoneInformation(ATimeZone) of
    TIME_ZONE_ID_UNKNOWN:
      begin
        AName := ATimeZone.StandardName;
        ABias := ATimeZone.Bias;
      end;
    TIME_ZONE_ID_STANDARD:
      begin
        AName := ATimeZone.StandardName;
        ABias := ATimeZone.Bias + ATimeZone.StandardBias;
      end;
    TIME_ZONE_ID_DAYLIGHT:
      begin
        AName := ATimeZone.DayLightName;
        ABias := AtimeZone.Bias + ATimeZone.DaylightBias;
      end else
    //TIME_ZONE_ID_INVALID
      if MainForm.DontShowErrorMessages = False then MessageBox(Application.Handle, PChar(SysErrorMessage(GetLastError)), 'B³¹d!', $30);
  end;
  //Przeliczenie offsetu z minut na doby (format dla TDateTime)
  ABias := ABias * OneMinute;
  Result := AName;
end;

//Funkcja ustawia czas w Windows

function SetDateTime(const ADateTime: TDateTime): Boolean;
var
  ASystemTime: TSystemTime;
begin
  DateTimeToSystemTime(ADateTime, ASystemTime);
  Result := SetLocalTime(ASystemTime);
end;

//Funkcja umo¿liwia dokonanie zmiany czasu w systemach z rodziny Windows NT,
//bez uprawnieñ administratora dla u¿ytkownika, dzia³a te¿ dla systemow
//z rodziny Windows 9x

function SetLocalTimeWin9xWinNT(const ADateTime: TDateTime): Boolean;
var
   ABuffer: LongWord;
   ATokenPriv, ATokenPrivOrg: TTokenPrivileges;
   AHandleToken: THandle;
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
  begin
    if not Windows.OpenProcessToken(GetCurrentProcess(),
      TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, AHandleToken) then
    begin
      Result := False;
      Exit;
    end;
    Windows.LookupPrivilegeValue(nil, 'SE_SYSTEMTIME_NAME',
      ATokenPriv.Privileges[0].LUID);
    ATokenPriv.PrivilegeCount := 1;
    ATokenPriv.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
    if not Windows.AdjustTokenPrivileges(AHandleToken, FALSE, ATokenPriv,
      SizeOf(ATokenPriv), ATokenPrivOrg, ABuffer) then
    begin
      Result := False;
      Exit;
    end;
    Result := SetdateTime(ADateTime);
    Windows.AdjustTokenPrivileges(AHandleToken, FALSE, ATokenPrivOrg,
      SizeOf(ATokenPrivOrg), ATokenPriv, ABuffer);
    Windows.CloseHandle(AHandleToken);
  end else
  Result := SetDateTime(ADateTime);
end;

end.
