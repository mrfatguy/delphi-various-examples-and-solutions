unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ComCtrls, ExtCtrls, SNTPSocket,
  SNTPDateTime, SNTPFunctions, SNTPExtra, Spin, WinInet, ShellAPI, ThemeMgr;

type
  TMainForm = class(TForm)
    pcMain: TPageControl;
    tsLog: TTabSheet;
    tsInfo: TTabSheet;
    mInfo: TMemo;
    fList: TListView;
    btnClose: TButton;
    btnDeleteLog: TButton;
    btnSync: TButton;
    cbTimeServer: TComboBox;
    lblTimeServer: TLabel;
    Label5: TLabel;
    seDelay: TSpinEdit;
    btnAbout: TButton;
    tsStratum: TTabSheet;
    lvStratum: TListView;
    btnCheck: TButton;
    lblCurrentServer: TLabel;
    btnInfo: TButton;
    ThemeManager1: TThemeManager;
    lblEmptyLog: TLabel;
    function DopelnijPoPolsku(Value: Integer): Integer;
    function Split(StringToSplit: String; DelimeterChar: String): TStringList;
    function Connected: Boolean;

    procedure RefreshList();
    procedure CheckTimeServers();
    procedure SynchronizeTime(HostIn: String; RecvTime: Integer);
    procedure SaveSNTPLog(const APathToLogFile, AHostIn, ATimeZoneBias: string; const ADateTime: TDateTime; const AClockOffset: Double);

    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDeleteLogClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSyncClick(Sender: TObject);
    procedure pcMainChange(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
    procedure btnCheckClick(Sender: TObject);
    procedure btnInfoClick(Sender: TObject);
  private
    //Private declarations
  public
    sLogFile: String;
    DNSError, DontShowErrorMessages: Boolean;
  end;

var
  MainForm: TMainForm;
  AdjErrorCode: LongWord;
  //StringList: TStringlist;
  LeapIndicatorStr, ModeStr, StratumStr, TimeZoneBiasStr: String;

const
  //Sta³e zawieraj¹ce format treœci rezultatów wyœwietlanych na ekranie
  SLocalPC              = '%-25s%s %s [%s]';
  STimeServer           = '%-25s%s %s [%s]';
  SPort                 = '%-25s%s %d';
  SHead1Byte1           = '%-25s%s Dec(%d), Hex(%s) [pierwszy bajt datagramu]';
  SLeapInicator         = '%-25s%s %d [%s]';
  SVersionNumber        = '%-25s%s %d [oznaczenie wer. protoko³u]';
  SMode                 = '%-25s%s %d [%s]';
  SStratum              = '%-25s%s %d [%s]';
  SPollInterval         = '%-25s%s %d [2**%d = %.0f s, maks. odst. pomiêdzy komunikatami]';
  SPrecision            = '%-25s%s %d [2**%.0d = %.12f... s = %.1f Hz]';
  SRootDelay            = '%-25s%s %.3f s [wzglêdem pierwszorzêdnego Ÿród³a]';
  SRootDispersion       = '%-25s%s %.3f s [wzglêdem pierwszorzêdnego Ÿród³a]';
  SReferenceIdentifier  = '%-25s%s %s';
  SReferenceTimestamp   = '%-25s%s %s';
  SOriginateTimeStamp   = '%-25s%s %s [T1]';
  SReceiveTimestamp     = '%-25s%s %s [T2]';
  STransmitTimestamp    = '%-25s%s %s [T3]';
  SDestinationTimestamp = '%-25s%s %s [T4]';
  SRoundTripDelay       = '%-25s%s %.3f s [(T4 - T1) - (T3 - T2)]';
  SLocalClockOffset     = '%-25s%s %.3f s [((T2 - T1) + (T3 - T4)) / 2]';
  STimeZoneName         = '%-25s%s %s [%s]';
  SLocalTime            = '%-25s%s %s';
  SGMTTime              = '%-25s%s %s';
  SAdjStatus            = '%-25s%s %s [kod rezultatu: %d]';

implementation

uses frmInfo;

{$R *.DFM}
{$R WinXP.res}

procedure TMainForm.btnCloseClick(Sender: TObject);
begin
        Close();
end;

procedure TMainForm.RefreshList();
var
        slLog, slLogEntry: TStringList;
        a, b: Integer;
        sTemp: String;
        lst: TListItem;
begin
        slLog := TStringList.Create();
        fList.Items.Clear;

        if FileExists(sLogFile) then
        begin
                slLog.LoadFromFile(sLogFile);

                if slLog.Count = 0 then
                begin
                        lblEmptyLog.Caption := 'Dziennik zdarzeñ jest pusty!';
                        btnDeleteLog.Enabled := False;
                        slLog.Free;
                        Exit;
                end;

                fList.Items.BeginUpdate;

                lblEmptyLog.Caption := 'Dziennik zawiera ' + IntToStr(slLog.Count) + ' ';
                b := DopelnijPoPolsku(slLog.Count);

                case b of
                        1: lblEmptyLog.Caption := lblEmptyLog.Caption + 'zdarzenie';
                        2: lblEmptyLog.Caption := lblEmptyLog.Caption + 'zdarzenia';
                        3: lblEmptyLog.Caption := lblEmptyLog.Caption + 'zdarzeñ';
                end;

                btnDeleteLog.Enabled := True;

                for a := 0 to slLog.Count - 1 do
                begin
                        sTemp := slLog.Strings[a];
                        slLogEntry := Split(sTemp, '|');

                        lst := fList.Items.Add;
                        lst.Caption := slLogEntry[0];
                        lst.SubItems.Add(slLogEntry[1]);
                        lst.SubItems.Add(slLogEntry[2]);
                        lst.SubItems.Add(slLogEntry[3]);
                end;

                fList.Items.EndUpdate;
        end
        else
        begin
                lblEmptyLog.Visible := True;
                btnDeleteLog.Enabled := False;
        end;

        slLog.Free;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
        sTemp, sFile: String;
begin
        sLogFile := ExtractFilePath(Application.ExeName) + 'sync_log.dat';
        MainForm.Caption := Application.Title;
        cbTimeServer.ItemIndex := 0;

        sFile := ExtractFilePath(Application.ExeName) + 'sync_last.dat';
        if FileExists(sFile) then
        begin
                mInfo.Lines.LoadFromFile(sFile);
                sTemp := Trim(mInfo.Lines[2]);
                sTemp := Copy(sTemp, Pos(' [', sTemp) + 2, Length(sTemp));
                sTemp := Copy(sTemp, 1, Pos(']', sTemp) - 1);

                if cbTimeServer.Items.IndexOf(sTemp) >= 0 then cbTimeServer.ItemIndex := cbTimeServer.Items.IndexOf(sTemp);
        end;
end;

procedure TMainForm.btnDeleteLogClick(Sender: TObject);
var
        slLog: TStringList;
begin
        if Application.MessageBox(PChar('Czy na pewno wyczyœciæ zawartoœæ dziennika zdarzeñ?' + #13 + #10 + 'Ta operacja jest NIEODWRACALNA!'), 'Pytanie...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2 + MB_APPLMODAL) = ID_NO then exit;

        slLog := TStringList.Create();
        slLog.Clear;
        slLog.SaveToFile(sLogFile);
        slLog.Free;

        RefreshList();
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
        RefreshList();
end;

function TMainForm.DopelnijPoPolsku(Value: Integer): Integer;
var
        iLast, iLastTwo: Integer;
begin
        //Funkcja zwraca wartoœæ 1-3 w zale¿noœci, od tego jakie dope³nienie powinno byæ:
        //1 - "a": tylko dla jednoœci, np. 1 sekunda, 1 minuta, 1 godzina
        //2 - "y": dla wartoœci jednoœci 2-4, np. 2 sekundy, 22 minuty, 194 godziny (bez liczb 11-19),
        //3 - "[puste]": dla jednoœci (np. 21 sekund), liczb 11-19 (np. 14 minut, 217 godzin) i wszystkich pozosta³ych.

        Result := 3; //Domyœlnie 3, bo najwiêcej liczb spe³nia trzeci warunek

        iLast := StrToIntDef(Copy(IntToStr(Value), Length(IntToStr(Value)), 1),0);
        iLastTwo := StrToIntDef(Copy(IntToStr(Value), Length(IntToStr(Value))-1, 2),0);

        if (iLast > 1) and (iLast < 5) then Result := 2; //Liczby z 2-4 na pozycji jednoœci - drugi warunek

        if (iLastTwo > 10) and (iLastTwo < 20) then Result := 3; //Wymuszenie warunku 3 dla liczb maj¹cych 11-19 na pozycji dziesi¹tek

        if Value = 1 then Result := 1;//Jedyny taki przypadek - warunek pierwszy spe³nia tylko cyfra 1.
end;

procedure TMainForm.SaveSNTPLog(const APathToLogFile, AHostIn, ATimeZoneBias: string; const ADateTime: TDateTime; const AClockOffset: Double);
var
        ATextFile: TextFile;
begin
        if FileExists(APathToLogFile) then
        begin
                AssignFile(ATextFile, APathToLogFile);
                Append(ATextFile)
        end
        else
        begin
                AssignFile(ATextFile, APathToLogFile);
                Rewrite(ATextFile);
        end;

        try
                WriteLn(ATextFile, FormatDateTime('yyyy/mm/dd hh:nn:ss', TimeDst) + '|' + AHostIn + '|' + FloatToStr(AClockOffset) + ' sekundy|' + ATimeZoneBias);
        finally
                CloseFile(ATextFile);
        end;
end;

procedure TMainForm.btnSyncClick(Sender: TObject);
begin
        DontShowErrorMessages := False;

        SynchronizeTime(cbTimeServer.Text, seDelay.Value);
end;

procedure TMainForm.SynchronizeTime(HostIn: String; RecvTime: Integer);
var
        NTPGram: TNTPGram;
        sErrorMessage: String;
        iTime: Cardinal;
begin
        if not Connected then
        begin
                MessageBox(Application.Handle, PChar('Brak po³¹czenia z Internetem!'), 'B³¹d!', $30);
                Exit;
        end;

        Screen.Cursor := crHourglass;
        btnSync.Enabled := False;
        iTime := GetTickCount();

        {Domyœlny serwer NTP: vega.cbk.poznan.pl, jeden z pewniejszych
        w Polsce, Stratum 1, serwer jest zlokalizowany w Centrum Badañ
        Kosmicznych PAN, w Borowcu niedaleko Poznania, jest synchronizowany
        bezpoœrednio do cezowego wzorca czasu HP5071A, oznaczenie Ÿród³a
        czasu PPS - Adres IP tego serwera NTP to: 150.254.183.15}

        mInfo.Clear();
        mInfo.Lines.Add('*** Synchornizacja lokalnego zegara uruchomiona: ' + DateTimeToStr(Now()) + '! ***');
        Application.ProcessMessages();

        //Pobranie danych strefy czasowej
        TimeZoneName := GetTimeZoneInfo(TimeZoneBias);

        //Konwersja nazwy podanego serwera NTP
        Host := AddrConvert(Addr, HostIn);
        FillChar(NTPGram, SizeOf(NTPGram), 0);

        //Ustawienie pierwszego bajtu datagramu, które odpowiada zg³oszeniu
        //Twojego PC jako klienta oraz zg³oszenie informacji o u¿ytej wersji
        //protokolu SNTP jako wer. 3, Hex(1B) = Dec(27)
        NTPGram.Head1 := $1B;
        TimeOrg := GetLocalTime;

        //Sprawdzenie zakresu daty
        ChkDatePC(TimeOrg);
        DateTimeToNTP(TimeOrg, NTPGram.Xmit1, NTPGram.Xmit2);
        NTPGram.Xmit1 := Flip(NTPGram.Xmit1);
        NTPGram.Xmit2 := Flip(NTPGram.Xmit2);

        //Wys³anie i odczyt danych z serwera czasu
        NTPGram := SendAndRecvData(NTPGram, Port, SizeOf(NTPGram), Flags, RecvTime);

        //Opracowanie danych zawartych w zwrotnym datagramie z serwera
        TimeDst := GetLocalTime;
        Head1Byte1 := GetHead1Byte1(NTPGram);

        mInfo.Lines.Add(Format(SLocalPC, ['Twój PC:', '', LocalIP, LocalName]));
        mInfo.Lines.Add(Format(STimeServer, ['Serwer czasu:', '', Host, HostIn]));
        mInfo.Lines.Add(Format(SPort, ['Numer portu:', '', Port]));
        mInfo.Lines.Add(Format(SHead1Byte1, ['Head1.Byte1:', '', Head1Byte1, LowerCase(IntToHex(Head1Byte1, 8))]));

        LeapIndicator := GetLeapIndicator(NTPGram);
        case LeapIndicator of
                0: LeapIndicatorStr := 'brak ostrze¿eñ';
                1: LeapIndicatorStr := 'ostatnia minuta ma 61 sekund';
                2: LeapIndicatorStr := 'ostatnia minuta ma 59 sekund';
                3: LeapIndicatorStr := 'stan alarmu (zegar bez synchronizacji)';
        end;

        mInfo.Lines.Add(Format(SLeapInicator, ['WskaŸnik sekundy (LI):', '', LeapIndicator, LeapIndicatorStr]));

        if LeapIndicator = 3 then
        begin
                sErrorMessage := 'Nieprawid³owa wartoœæ parametru LeapIndicator! Synchronizacja przerwana!';
                MessageBox(Application.Handle, PChar(sErrorMessage), 'B³¹d!', $30);
                mInfo.Lines.Add('*** ' + sErrorMessage + ' ***');
                mInfo.Text := Trim(mInfo.Text);
                btnSync.Enabled := True;
                Screen.Cursor := crDefault;
                Exit;
        end;

        VersionNumber := GetVersionNumber(NTPGram);

        mInfo.Lines.Add(Format(SVersionNumber, ['Numer wersji (VN):', '', VersionNumber]));

        Mode := GetMode(NTPGram);
        case Mode of
                0: ModeStr := 'zarezerwowany';
                1: ModeStr := 'symetryczny aktywny';
                2: ModeStr := 'symetryczny pasywny';
                3: ModeStr := 'klient';
                4: ModeStr := 'serwer';
                5: ModeStr := 'broadcast';
                6: ModeStr := 'komunikat kontrolny NTP';
                7: ModeStr := 'zarezerwowany dla prywatnego u¿ytku';
        end;

        mInfo.Lines.Add(Format(SMode, ['Tryb pracy:', '', Mode, ModeStr]));

        Stratum := GetStratum(NTPGram);
        case Stratum of
                0:     StratumStr := 'nieokreœlony lub niedostêpny';
                1:     StratumStr := 'pierwszorzêdne Ÿród³o (np. zegar radiowy)';
                2..15: StratumStr := 'drugorzêdne Ÿród³o (NTP lub SNTP)';
                16:    StratumStr := 'zarezerwowany';
        end;

        mInfo.Lines.Add(Format(SStratum, ['Stratum:', '', Stratum, StratumStr]));

        if Stratum = 0 then
        begin
                sErrorMessage := 'Nieprawid³owa wartoœæ parametru Stratum! Synchronizacja przerwana!';
                MessageBox(Application.Handle, PChar(sErrorMessage), 'B³¹d!', $30);
                mInfo.Lines.Add('*** ' + sErrorMessage + ' ***');
                mInfo.Text := Trim(mInfo.Text);
                btnSync.Enabled := True;
                Screen.Cursor := crDefault;
                Exit;
        end;

        PollInterval := GetPollInterval(NTPGram);
        Precision := GetPrecision(NTPGram);
        RootDelay := GetRootDelay(NTPGram);
        RootDispersion := GetRootDispersion(NTPGram);
        ReferenceIdentifier := GetReferenceIdentifier(NTPGram, Stratum);
        ReferenceTimeStamp := GetReferenceTimestamp(NTPGram);
        OriginateTimeStamp := GetOriginateTimestamp(NTPGram);
        ReceiveTimeStamp := GetReceiveTimestamp(NTPGram);
        TransmitTimeStamp := GetTransmitTimestamp(NTPGram);
        DestinationTimeStamp := TimeDst;
        RoundTripDelay := SetRoundTripDelay * SecsPerDay;
        LocalClockOffset := SetLocalClockOffset * SecsPerDay;

        mInfo.Lines.Add(Format(SPollInterval, ['Interwa³ odpytuj¹cy:', '', ExpPoll, ExpPoll, PollInterval]));
        mInfo.Lines.Add(Format(SPrecision, ['Precyzja zegara serwera:', '', ExpPrecision, ExpPrecision, Precision, 1 / Precision]));
        mInfo.Lines.Add(Format(SRootDelay, ['OpóŸnienie podró¿y:', '', RootDelay]));
        mInfo.Lines.Add(Format(SRootDispersion, ['Wspó³czynnik dyspersji:', '', RootDispersion]));
        mInfo.Lines.Add(Format(SReferenceIdentifier, ['ID Ÿród³a czasu:', '', ReferenceIdentifier]));
        mInfo.Lines.Add(Format(SReferenceTimestamp, ['Ostatni czas Ÿród³a:', '', FormatDateTime('yyyy/mm/dd hh:nn:ss,zzz', ReferenceTimeStamp)]));
        mInfo.Lines.Add(Format(SOriginateTimeStamp, ['Czas wys³ania PC:', '', FormatDateTime('yyyy/mm/dd hh:nn:ss,zzz', OriginateTimeStamp)]));
        mInfo.Lines.Add(Format(SReceiveTimestamp, ['Czas odbioru serwera:', '', FormatDateTime('yyyy/mm/dd hh:nn:ss,zzz', ReceiveTimestamp)]));
        mInfo.Lines.Add(Format(STransmitTimestamp, ['Czas odes³ania serwera:', '', FormatDateTime('yyyy/mm/dd hh:nn:ss,zzz', TransmitTimestamp)]));
        mInfo.Lines.Add(Format(SDestinationTimestamp, ['Czas odbioru PC:', '', FormatDateTime('yyyy/mm/dd hh:nn:ss,zzz', DestinationTimestamp)]));
        mInfo.Lines.Add(Format(SRoundTripDelay, ['OpóŸnienie podró¿y:', '', RoundTripDelay]));
        mInfo.Lines.Add(Format(SLocalClockOffset, ['Poprawka zegara PC:', '', LocalClockOffset]));

        //Sprawdzenie poprawnoœci datagramu
        if IsNTPGramOK(LeapIndicator, TransmitTimeStamp) then
        begin
                //Sprawdzenie powodzenia wykonania przestawienia czasu w systemie
                if SetLocalTimeWin9xWinNT(TimeOrg + LocalClockOffset * OneSecond + RoundTripDelay * OneSecond) then
                begin
                        AdjErrorCode := GetLastError;

                        //Ponowne pobranie danych strefy czasowej - ju¿ poprawionej
                        TimeZoneName := GetTimeZoneInfo(TimeZoneBias);
                        TimeZoneBiasStr := SetTimeZoneBiasStr(TimeZoneBias);
                        LocalTime := GetLocalTime;
                        GMTTime := LocalTime + TimeZoneBias;
                        SaveSNTPLog(sLogFile, HostIn, TimeZoneBiasStr, GetLocalTime, LocalClockOffset);
                end
                else AdjErrorCode := GetLastError;
        end
        else AdjErrorCode := GetLastError;

        if AdjErrorCode = 0 then
        begin
                mInfo.Lines.Add(Format(STimeZoneName, ['Twoja strefa czasowa:', '', TimeZoneName, TimeZoneBiasStr]));
                mInfo.Lines.Add(Format(SLocalTime, ['Poprawiony czas lokalny:', '', FormatDateTime('yyyy/mm/dd hh:nn:ss [dddd]', LocalTime)]));
                mInfo.Lines.Add(Format(SGMTTime, ['Poprawiony czas GMT:', '', FormatDateTime('yyyy/mm/dd hh:nn:ss [dddd]', GMTTime)]));
                mInfo.Lines.Add('*** Synchornizacja lokalnego zegara zakoñczona! Czas operacji: ' + IntToStr(GetTickCount() - iTime) + ' ms. ***');
        end
        else mInfo.Lines.Add('*** Synchornizacja lokalnego zegara nie powiod³a siê! Kod b³êdu = ' + IntToStr(AdjErrorCode) + '! ***');

        mInfo.Text := Trim(mInfo.Text);
        mInfo.Lines.SaveToFile(ExtractFilePath(Application.ExeName) + 'sync_last.dat');

        btnSync.Enabled := True;
        Screen.Cursor := crDefault;
end;

procedure TMainForm.CheckTimeServers();
var
        NTPGram: TNTPGram;
        b, a, opTime, opAll: Cardinal;
        lst: TListItem;
begin
        Screen.Cursor := crHourglass;
        btnCheck.Enabled := False;
        lvStratum.Items.Clear();
        Application.ProcessMessages();

        RecvTime := 2500;
        opAll := GetTickCount();

        for a := 0 to cbTimeServer.Items.Count - 1 do
        begin
                opTime := GetTickCount();
                HostIn := cbTimeServer.Items[a];

                //Pobranie danych strefy czasowej
                //TimeZoneName := GetTimeZoneInfo(TimeZoneBias);

                //Konwersja nazwy podanego serwera NTP
                Host := AddrConvert(Addr, HostIn);
                FillChar(NTPGram, SizeOf(NTPGram), 0);

                lblCurrentServer.Caption := 'Badanie servera ' + HostIn + ' [' + Host + ']';

                lst := lvStratum.Items.Add;
                lst.Caption := HostIn;
                lst.SubItems.Add(Host);

                //Ustawienie pierwszego bajtu datagramu, które odpowiada zg³oszeniu
                //Twojego PC jako klienta oraz zg³oszenie informacji o u¿ytej wersji
                //protokolu SNTP jako wer. 3, Hex(1B) = Dec(27)
                NTPGram.Head1 := $1B;
                TimeOrg := GetLocalTime;

                //Sprawdzenie zakresu daty
                ChkDatePC(TimeOrg);
                DateTimeToNTP(TimeOrg, NTPGram.Xmit1, NTPGram.Xmit2);
                NTPGram.Xmit1 := Flip(NTPGram.Xmit1);
                NTPGram.Xmit2 := Flip(NTPGram.Xmit2);

                //Wys³anie i odczyt danych z serwera czasu
                NTPGram := SendAndRecvData(NTPGram, Port, SizeOf(NTPGram), Flags, RecvTime);

                //Opracowanie danych zawartych w zwrotnym datagramie z serwera
                TimeDst := GetLocalTime;
                Head1Byte1 := GetHead1Byte1(NTPGram);

                Stratum := GetStratum(NTPGram);

                if Stratum = 0 then
                        lst.SubItems.Add('--')
                else
                        lst.SubItems.Add(IntToStr(Stratum));

                b := GetTickCount() - opTime;
                if b = 0 then
                        lst.SubItems.Add('< 1 ms.')
                else
                        lst.SubItems.Add(IntToStr(b) + ' ms.');

                Application.ProcessMessages();
        end;

        lblCurrentServer.Caption := 'Badanie zakoñczone. Zbadano stratum ' + IntToStr(cbTimeServer.Items.Count) + ' serwerów. Czas operacji: ' + FloatToStr((GetTickCount() - opAll) / 1000) + ' sekundy';
        Application.ProcessMessages();

        btnCheck.Enabled := True;
        Screen.Cursor := crDefault;
end;

procedure TMainForm.pcMainChange(Sender: TObject);
begin
        if pcMain.ActivePageIndex = 1 then RefreshList();
end;

function TMainForm.Split(StringToSplit: String; DelimeterChar: String): TStringList;
var
        buffer: string;
begin
        Result := TStringlist.Create;

        repeat
        begin
                if (copy(StringToSplit,1,1) = copy(DelimeterChar,1,1)) and (copy(StringToSplit,1,length(DelimeterChar)) = DelimeterChar) then
                begin
                        Result.Add(buffer);
                        buffer := '';
                        StringToSplit := copy(StringToSplit,2,length(StringToSplit));
                end
                else
                begin
                        buffer := buffer + copy(StringToSplit,1,1);
                        StringToSplit := copy(StringToSplit,2,length(StringToSplit));
                end;

                if StringToSplit = '' then
                begin
                        buffer := buffer + StringToSplit;
                        Result.Add(buffer);
                        buffer := '';
                        StringToSplit := '';
                end;
        end;
        until StringToSplit = '';
end;

procedure TMainForm.btnAboutClick(Sender: TObject);
begin
        InfoForm.ShowModal();
end;

procedure TMainForm.btnCheckClick(Sender: TObject);
begin
        if not Connected then
        begin
                MessageBox(Application.Handle, PChar('Brak po³¹czenia z Internetem!'), 'B³¹d!', $30);
                Exit;
        end;

        DontShowErrorMessages := True;
        
        CheckTimeServers();
end;

function TMainForm.Connected: Boolean;
var
     Flags: DWORD;
begin
     Flags:=INTERNET_CONNECTION_MODEM or INTERNET_CONNECTION_LAN ;
     Result := InternetGetConnectedState(@Flags, 0);
end;

procedure TMainForm.btnInfoClick(Sender: TObject);
begin
        ShellExecute(Handle,'open','http://pl.wikipedia.org/wiki/Network_Time_Protocol#Struktura_warstw_STRATUM_0-15','','',SW_SHOW);
end;

end.
