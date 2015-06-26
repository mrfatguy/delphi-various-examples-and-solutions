unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComObj, ActiveX, UrlMon, Math, StdCtrls, ExtCtrls;

type
  TMainForm = class(TForm)
    Panel2: TPanel;
    pnlSystemInstall: TPanel;
    MainTimer: TTimer;
    lblSystemInstallUp: TLabel;
    lblSystemInstallDown: TLabel;
    function GetSystemInstallationDate(): TDateTime;
    function CalculateUpTime_Long(DateTime: TDateTime): String;
    function DopelnijPoPolsku(Value: Integer): Integer;
    procedure ShowSystemInstallationDate();

    procedure MainTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    InstallDate: TDateTime;
  end;

var
  MainForm: TMainForm;

const
  asMonths: array [1..12] of String = ('stycznia', 'lutego', 'marca', 'kwietnia', 'maja', 'czerwca', 'lipca', 'sierpnia', 'wrzeúnia', 'paüdziernika', 'listopada', 'grudnia');

implementation

{$R *.DFM}

function DateTimeToPolishString(DateTime: TDateTime): String;
var
        Year, Month, Day: Word;
        sDate: String;
begin
        DecodeDate(DateTime, Year, Month, Day);

        sDate := IntToStr(Day) + ' ' + asMonths[Month] + ' ' + IntToStr(Year);
        Result := sDate + ' o ' + TimeToStr(DateTime);
end;

function CalculateUpTime(DateTime: TDateTime): String;
var
        Day, Hour, Min, Sec, MSec: Word;
        sDay, sHour, sMin, sSec: String;
        TheDate: TDateTime;
begin
        TheDate := Now() - DateTime;
        Day := Floor(Now() - DateTime);
        DecodeTime(TheDate, Hour, Min, Sec, MSec);

        sHour := IntToStr(Hour); if Hour < 10 then sHour := '0' + sHour;
        sMin := IntToStr(Min); if Min < 10 then sMin := '0' + sMin;
        sSec := IntToStr(Sec); if Sec < 10 then sSec := '0' + sSec;

        sDay := IntToStr(Day);
        if Day = 1 then sDay := sDay + ' dzieÒ' else sDay := sDay + ' dni';

        Result := sDay + ' ' + sHour + ':' + sMin + ':' + sSec;
end;

function TMainForm.GetSystemInstallationDate(): TDateTime;
var
        oBindObj: IDispatch;
        oOperatingSystems, oOperatingSystem, oWMIService: OleVariant;
        i, iValue: Longword;
        oEnum: IEnumVariant;
        oCtx: IBindCtx;
        oMk: IMoniker;
        sFileObj: WideString;
        sResult: String;
begin
        sFileObj := 'winmgmts:\\.\root\cimv2';

        OleCheck(CreateBindCtx(0, oCtx));
        OleCheck(MkParseDisplayNameEx(oCtx, PWideChar(sFileObj), i, oMk));
        OleCheck(oMk.BindToObject(oCtx, nil, IUnknown, oBindObj));
        oWMIService := oBindObj;
        oOperatingSystems := oWMIService.ExecQuery('Select * from Win32_OperatingSystem');
        oEnum := IUnknown(oOperatingSystems._NewEnum) as IEnumVariant;

        while oEnum.Next(1, oOperatingSystem, iValue) = 0 do
        begin
                sResult := oOperatingSystem.InstallDate;
                oOperatingSystem := Unassigned;
        end;

        sResult := Trim(Copy(sResult, 1, Pos('.', sResult) - 1));
        sResult := Copy(sResult, 1, 4) + '-' + Copy(sResult, 5, 2) + '-' + Copy(sResult, 7, 2) + ' ' + Copy(sResult, 9, 2) + ':' + Copy(sResult, 11, 2) + ':' + Copy(sResult, 13, 2);
        sResult := Trim(sResult);

        Result := StrToDateTime(sResult);
end;

function TMainForm.CalculateUpTime_Long(DateTime: TDateTime): String;
var
        Year, Month, Day, Hour, Min, Sec, MSec: Word;
        sYear, sMonth, sDay, sHour, sMin, sSec: String;
        TheDate: TDateTime;
        d: Integer;
begin
        TheDate := Now() - DateTime;
        DecodeDate(TheDate, Year, Month, Day);
        DecodeTime(TheDate, Hour, Min, Sec, MSec);

        sHour := IntToStr(Hour); if Hour < 10 then sHour := '0' + sHour;
        sMin := IntToStr(Min); if Min < 10 then sMin := '0' + sMin;
        sSec := IntToStr(Sec); if Sec < 10 then sSec := '0' + sSec;

        sDay := IntToStr(Day);
        if Day = 1 then sDay := sDay + ' dzieÒ' else sDay := sDay + ' dni';

        d := DopelnijPoPolsku(Month);
        case d of
                1: sMonth := IntToStr(Month) + ' miesiπc';
                2: sMonth := IntToStr(Month) + ' miesiπce';
                3: sMonth := IntToStr(Month) + ' miesiÍcy';
        end;
        if Month = 0 then sMonth := '' else sMonth := sMonth + ', ';

        Year := Year - 1900;
        d := DopelnijPoPolsku(Year);
        case d of
                1: sYear := IntToStr(Year) + ' rok';
                2: sYear := IntToStr(Year) + ' lata';
                3: sYear := IntToStr(Year) + ' lat';
        end;
        if Year = 0 then sYear := '' else sYear := sYear + ', ';

        Result := sYear + sMonth + sDay + ' i ' + sHour + ':' + sMin + ':' + sSec;
end;

function TMainForm.DopelnijPoPolsku(Value: Integer): Integer;
var
        iLast, iLastTwo: Integer;
begin
        //Funkcja zwraca wartoúÊ 1-3 w zaleønoúci, od tego jakie dope≥nienie powinno byÊ:
        //1 - "a": tylko dla jednoúci, np. 1 sekunda, 1 minuta, 1 godzina
        //2 - "y": dla wartoúci jednoúci 2-4, np. 2 sekundy, 22 minuty, 194 godziny (bez liczb 11-19),
        //3 - "[puste]": dla jednoúci (np. 21 sekund), liczb 11-19 (np. 14 minut, 217 godzin) i wszystkich pozosta≥ych.

        Result := 3; //Domyúlnie 3, bo najwiÍcej liczb spe≥nia trzeci warunek

        iLast := StrToIntDef(Copy(IntToStr(Value), Length(IntToStr(Value)), 1),0);
        iLastTwo := StrToIntDef(Copy(IntToStr(Value), Length(IntToStr(Value))-1, 2),0);

        if (iLast > 1) and (iLast < 5) then Result := 2; //Liczby z 2-4 na pozycji jednoúci - drugi warunek

        if (iLastTwo > 10) and (iLastTwo < 20) then Result := 3; //Wymuszenie warunku 3 dla liczb majπcych 11-19 na pozycji dziesiπtek

        if Value = 1 then Result := 1;//Jedyny taki przypadek - warunek pierwszy spe≥nia tylko cyfra 1.
end;

procedure TMainForm.ShowSystemInstallationDate();
begin
        lblSystemInstallUp.Caption := DateTimeToPolishString(InstallDate);
        lblSystemInstallDown.Caption := '(' + CalculateUpTime_Long(InstallDate) + ' temu)';
end;

procedure TMainForm.MainTimerTimer(Sender: TObject);
begin
        ShowSystemInstallationDate();
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
        InstallDate := GetSystemInstallationDate();
        //InstallDate := StrToDateTime('2004-10-23 23:11:51');

        ShowSystemInstallationDate();
end;

end.
