{*************************************************************}
//                                                           
//   Klient protoko³u SNTP dla Windows 9x/Me/NT/2000/XP      
//                                                           
//   Copyright (c) 2005, 2006 A. Osiciñska-Dudka, A. Dudka   
//                                                           
{*************************************************************}

unit SNTPFunctions;

interface

uses
  SysUtils, Forms, Windows, Math, SNTPSocket, SNTPDateTime, SNTPExtra;

type
  TLr = packed record
    L1: Byte;
    L2: Byte;
    L3: Byte;
    L4: Byte;
  end;

procedure ChkDatePC(ADateTime: TDateTime);
function GetHead1Byte1(const ANTPMessage: TNTPGram): Byte;
function GetLeapIndicator(const ANTPMessage: TNTPGram): Byte;
function GetVersionNumber(const ANTPMessage: TNTPGram): Byte;
function GetMode(const ANTPMessage: TNTPGram): Byte;
function GetStratum(const ANTPMessage: TNTPGram): Byte;
function GetPollInterval(const ANTPMessage: TNTPGram): Extended;
function GetPrecision(const ANTPMessage: TNTPGram): Extended;
function Flip(const ANumber: LongWord): LongWord; overload;
function Flip(const ANumber: LongInt): LongWord; overload;
function GetRootDelay(const ANTPMessage: TNTPGram): Double;
function GetRootDispersion(const ANTPMessage: TNTPGram): Double;
function GetReferenceIdentifier(const ANTPMessage: TNTPGram;
  const AStratum: Byte): string;
procedure DateTimeToNTP(const ADateTime: TDateTime;
  var ASecond, AFraction: LongWord);
function GetReferenceTimestamp(const ANTPMessage: TNTPGram): TDateTime;
function GetOriginateTimestamp(const ANTPMessage: TNTPGram): TDateTime;
function GetReceiveTimestamp(const ANTPMessage: TNTPGram): TDateTime;
function GetTransmitTimestamp(const ANTPMessage: TNTPGram): TDateTime;
function SetRoundtripDelay: TDateTime;
function SetLocalClockOffset: TDateTime;
function IsNTPGramOK(const ALeapIndicator : Byte;
  const ATransmitTimeStamp : TDateTime): Boolean;

var
  ExpPoll, ExpPrecision, VersionNumber : ShortInt;
  Head1Byte1, LeapIndicator, Mode, Stratum : Byte;
  OriginateTimestamp, TransmitTimestamp, ReceiveTimestamp,
    DestinationTimestamp, ReferenceTimeStamp : TDateTime;
  LocalClockOffset, RoundTripDelay, RootDelay, RootDispersion : Double;
  PollInterval, Precision : Extended;
  ReferenceIdentifier : string;

const
  //Wartoœæ sta³a, s³u¿y do zamiany formatu czasu NTP na TDateTime dla Delphi,
  //2^32 = 4294967296, mo¿e lepiej bedzie High(LongWord) = 4294967295?
  //W pliku IdSNTP.pas z pakietu Indy wartoœæ ta wynosi 4294967297 - czemu?
  NTPMaxInt = High(LongWord);
  //Ro¿nica w dniach pomiêdzy pocz¹tkiem liczenia czasu NTP i Delphi
  DateTimeDiff = 2;

implementation

uses frmMain;

//Sprawdzenie czy data naszego PC mieœci siê w zakresie dostêpnym dla NTP,
//tj. zakres od 1 stycznia 1900 00:00:00 do 7 lutego 2036 06:28:15

procedure ChkDatePC(ADateTime: TDateTime);
var
  ABeginDateNTP, AEndDateNTP: TDateTime;
begin
  ABeginDateNTP := EncodeDateTime(1900, 1, 1, 0, 0, 0, 0);
  AEndDateNTP := EncodeDateTime(2036, 2, 7, 6, 28, 15, 0);
  ADateTime := ADateTime - TimeZoneBias;
  if (ADateTime < ABeginDateNTP) or  (ADateTime > AEndDateNTP) then
  begin
    if MainForm.DontShowErrorMessages = False then if MainForm.DontShowErrorMessages = False then MessageBox(Application.Handle, PChar('Data na Twoim PC poza zakresem od 1900-01-01 00:00:00 do 2036-02-07 06:28:15'), 'B³¹d!', $30);
  end;
end;

//Funkcja zwraca wartoœæ pierwszego bajtu z pierwszego nag³ówka datagramu,
//wiêcej informacji odnoœnie dzia³aniu tej i natêpnych funkcji z tego modu³u
//mo¿na odszukaæ na: http://www.rfc.net/rfc2030.html

function GetHead1Byte1(const ANTPMessage: TNTPGram): Byte;
begin
  Result := ANTPMessage.Head1;
end;

//Funkcja zwraca wskaŸnik sekundy przestêpnej (Leap Indicator)

function GetLeapIndicator(const ANTPMessage: TNTPGram): Byte;
begin
  Result := (ANTPMessage.Head1 and $C0) shr 6;
end;

//Funkcja zwraca numer wersji protokolu SNTP (Version Number)

function GetVersionNumber(const ANTPMessage: TNTPGram): Byte;
begin
  Result := (ANTPMessage.Head1 and $38) shr 3;
end;

//Funkcja zwraca kod trybu pracy (Mode)

function GetMode(const ANTPMessage: TNTPGram): Byte;
begin
  Result := (ANTPMessage.Head1 and $7);
end;

//Funkcja zwraca numer stratum serwera NTP (Stratum)

function GetStratum(const ANTPMessage: TNTPGram): Byte;
begin
  Result := ANTPMessage.Head2;
end;

//Funkcja zwraca interwa³ odpytujacy (Poll Interval)

function GetPollInterval(const ANTPMessage: TNTPGram): Extended;
begin
  ExpPoll := ANTPMessage.Head3;
  Result := Power(2, ExpPoll);
end;

//Funkcja zwraca precyzje zegara serwera NTP (Precision)

function GetPrecision(const ANTPMessage: TNTPGram): Extended;
begin
  ExpPrecision := ANTPMessage.Head4;
  Result := Power(2, ExpPrecision);
end;

//Funkcja wykonuje odwrócenie kolejnoœci bajtow dla LongWord

function Flip(const ANumber: LongWord): LongWord; overload;
var
  ANumber1, ANumber2: TLr;
begin
  ANumber1 := TLr(ANumber);
  ANumber2.L1 := ANumber1.L4;
  ANumber2.L2 := ANumber1.L3;
  ANumber2.L3 := ANumber1.L2;
  ANumber2.L4 := ANumber1.L1;
  Result := LongWord(ANumber2);
end;

//Funkcja wykonuje odwrócenie kolejnoœci bajtow dla LongInt

function Flip(const ANumber: LongInt): LongWord; overload;
var
  ANumber1, ANumber2: TLr;
begin
  ANumber1 := TLr(ANumber);
  ANumber2.L1 := ANumber1.L4;
  ANumber2.L2 := ANumber1.L3;
  ANumber2.L3 := ANumber1.L2;
  ANumber2.L4 := ANumber1.L1;
  Result := LongWord(ANumber2);
end;

//Funkcja zwraca True dla 1 i False dla 0, jest pomocnicz¹ funkcj¹
//dla funkcji BinToFrac(AValue: LongInt): Double;

function GetBit(const ABinValue: LongInt; const AValue: Byte): Boolean;
begin
  Result := (ABinValue and (1 shl AValue)) <> 0;
end;

//Funkcja zwraca liczbê binarn¹ 32 bitow¹ (sta³oprzecinkow¹),
//przecinek pomiêdzy bitem 15 i 16, tylko jako jej czêœæ dziesiêtna
//Funkcja u¿ywana do obliczeñ (Root dispersion) i (Root delay)

function BinToFrac(const AValue: LongInt): Double;
var
  ADigits: Byte;
begin
  Result := 0.0;
  //Czytamy tylko czêœæ u³amkow¹ z ca³ej liczby, czyli bity od 0 do 15
  for ADigits := 0 to 15 do
  Result := (Result + Ord(GetBit(AValue, ADigits))) / 2;
end;

//Funkcja zwraca opóŸnienie wzglêdem pierwszorzêdnego
//Ÿród³a czasu (Root Delay)
//Przed obliczeniem wykonane jest odwrócenie bajtów funkcj¹ Flip

function GetRootDelay(const ANTPMessage: TNTPGram): Double;
begin
  Result := BinToFrac(Flip(ANTPMessage.RootDelay));
end;

//Funkcja zwraca wspó³czynnik dyspersji (Root Dispersion)
//Przed obliczeniem wykonane jest odwrócenie bajtow funkcj¹ Flip

function GetRootDispersion(const ANTPMessage: TNTPGram): Double;
begin
  Result := BinToFrac(Flip(ANTPMessage.RootDispersion));
end;

//Uzyskanie danych o Ÿródle synchronizacji serwera NTP
//(Reference Identifier) jest zwracany jako kod Ÿród³a lub
//jako adres IP, je¿eli Ÿród³o ma Stratum wiêksze od 1

function GetReferenceIdentifier(const ANTPMessage: TNTPGram;
  const AStratum: Byte): string;
var
  ARefID0, ARefID1, ARefID2, ARefID3: Byte;
  AStringIP : string;
begin
  //Odczyt poszczególnych znakow kodu Ÿród³a
  ARefID0 := (ANTPMessage.RefID and $FF);
  ARefID1 := (ANTPMessage.RefID and $FF00) shr 8;
  ARefID2 := (ANTPMessage.RefID and $FF0000) shr 16;
  ARefID3 := (ANTPMessage.RefID and $FF000000) shr 24;
  if AStratum = 1 then
  //Stratum = 1, to zapis jako 3 lub 4 znaki w kodzie ASCII np. kod: PPS
  Result := Format('%s%s%s%s', [Chr(ARefID0), Chr(ARefID1), Chr(ARefID2),
    Chr(ARefID3)])
  else
  //Stratum > 1, to zapis jako adres IPv4 32 bity
  begin
    AStringIP := Format('%d.%d.%d.%d', [ARefID0, ARefID1, ARefID2, ARefID3]);
    Result := Format('Serwer: %s [%s]', [AStringIP,
      AddrConvert(Addr, AStringIP)]);
  end;
end;

//Zamiana formatu czasu NTP time na TDateTime
//funkcja na podstawie funkcji z pakietu Indy (unit IdSNTP.pas)

function NTPToDateTime(const ASecond, AFraction: LongWord): TDateTime;
var
  Value1, Value2: Double;
begin
  Value1 := ASecond;
  Value2 := AFraction;
  Value2 := Trunc(Value2 / NTPMaxInt * 1000) / 1000;
  Result := ((Value1 + Value2) * OneSecond) - TimeZoneBias + DateTimeDiff;
end;

//funkcja mojego pomys³u

{function NTPToDateTime(ASecond, AFraction: LongWord): TDateTime;
var
  AFracDbl: Double;
begin
  AFracDbl := ((Int64(AFraction) * 1000) shr 32) / 1000;
  Result := ((ASecond + AFracDbl) * OneSecond) - TimeZoneBias + DateTimeDelta;
end;}

//Zamiana formatu czasu TDateTime na NTP time
//funkcja na podstawie funkcji z pakietu Indy (unit IdSNTP.pas)

procedure DateTimeToNTP(const ADateTime: TDateTime;
  var ASecond, AFraction: LongWord);
var
  ASecDbl, AFracDbl: Double;
begin
  ASecDbl := (ADateTime + TimeZoneBias - DateTimeDiff) * SecsPerDay;
  AFracDbl := ASecDbl;
  if AFracDbl > NTPMaxInt then
  AFracDbl := AFracDbl - NTPMaxInt;
  ASecond := LongWord(Trunc(AFracDbl));
  AFracDbl := Frac(ASecDbl) * NTPMaxInt;
  if AFracDbl > NTPMaxInt then
  AFracDbl := AFracDbl - NTPMaxInt;
  AFraction := LongWord(Trunc(AFracDbl));
end;

//Odczyt czasu Ÿród³a (Reference Timestamp)

function GetReferenceTimestamp(const ANTPMessage: TNTPGram): TDateTime;
begin
  Result := NTPToDateTime(Flip(ANTPMessage.Ref1), Flip(ANTPMessage.Ref2));
end;

//Odczyt czasu wys³ania przez Twój PC, T1 (Originate Timestamp)

function GetOriginateTimestamp(const ANTPMessage: TNTPGram): TDateTime;
begin
  Result := NTPToDateTime(Flip(ANTPMessage.Org1), Flip(ANTPMessage.Org2));
end;

//Odczyt czasu odbioru przez serwer, T2 (Receive Timestamp)

function GetReceiveTimestamp(const ANTPMessage: TNTPGram): TDateTime;
begin
  Result := NTPToDateTime(Flip(ANTPMessage.Rcv1), Flip(ANTPMessage.Rcv2));
end;

//Odczyt czasu odes³ania przez serwer, T3 (Transmit Timestamp)

function GetTransmitTimestamp(const ANTPMessage: TNTPGram): TDateTime;
begin
  Result := NTPToDateTime(Flip(ANTPMessage.Xmit1), Flip(ANTPMessage.Xmit2));
end;

//Pobranie czasu odbioru przez Twój PC, T4 (Destination Timestamp)

function GetDestinationTimestamp: TDateTime;
begin
  Result := TimeDst;
end;

//Obliczenie tzw. opóŸnienia podró¿y (Roundtrip Delay)

function SetRoundtripDelay: TDateTime;
begin
  Result := (DestinationTimestamp - OriginateTimestamp) - (ReceiveTimestamp -
    TransmitTimestamp);
end;

//Obliczenie przesuniêcia zegara (ClockOffset),
//pomiedzy zegarem serwera czasu, a Twoim PC

function SetLocalClockOffset: TDateTime;
begin
  Result := ((ReceiveTimestamp - OriginateTimestamp) + (TransmitTimestamp -
    DestinationTimestamp)) / 2;
end;

//Tylko wynik tej funkcji = True oznacza poprawny komunikat SNTP

function IsNTPGramOK(const ALeapIndicator: Byte;
  const ATransmitTimeStamp: TDateTime): Boolean;
begin
  if (ALeapIndicator = 3) or (TransmitTimestamp = 0) then
  Result := False
  else
  Result := True;
end;

end.
