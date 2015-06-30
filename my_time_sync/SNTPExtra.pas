unit SNTPExtra;

interface

uses Sysutils;

const
        OneMinute: Double = 0.000694444444444444;
        OneSecond: Double = 0.0000115740740740741;

function EncodeDateTime (Year, Month, Day, Hour, Min, Sec, MSec: Word): TDateTime;

implementation

function EncodeDateTime (Year, Month, Day, Hour, Min, Sec, MSec: Word): TDateTime;
begin
        Result := EncodeDate(Year, Month, Day) + EncodeTime(Hour, Min, Sec, MSec);
end;

end.
