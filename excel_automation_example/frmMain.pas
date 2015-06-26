unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, ComObj, Excel_TLB;

type
  TMainForm = class(TForm)
    NotesOpenDialog: TOpenDialog;
    NotesSaveDialog: TSaveDialog;
    gbSourceData: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    eFile: TEdit;
    btnSelectFolder: TButton;
    ExcelOpenDialog: TOpenDialog;
    gbExportOptions: TGroupBox;
    Label21: TLabel;
    chbTableHeaders: TCheckBox;
    chbDateColumn: TCheckBox;
    chbExtraSelectionInfo: TCheckBox;
    gbSelections3: TGroupBox;
    sbNoteRemove: TSpeedButton;
    sbNoteEdit: TSpeedButton;
    pnlList: TPanel;
    lbNotes: TListBox;
    gbTools3: TGroupBox;
    sbClearNotes: TSpeedButton;
    sbNotesOpen: TSpeedButton;
    sbNotesSave: TSpeedButton;
    gbNotes: TGroupBox;
    Label1: TLabel;
    pnlButtons: TPanel;
    btnExit: TButton;
    btnStart: TButton;
    lblInfo: TPanel;
    lblCnt: TPanel;
    chbNotesAsComments: TCheckBox;
    chbNotesAsShapes: TCheckBox;
    chbNotesAsSeries: TCheckBox;

    function CheckNotesList(iPoint: Integer): Boolean;
    function DopelnijPoPolsku(Value: Integer; String1, String2, String5: String; UseSpaces: Boolean): String;

    procedure ChangeSelectionButtons();
    procedure ChangeFormState(State: Boolean);
    procedure GlobalChangeState(Control: TWinControl; State: Boolean);
    procedure RefreshNotesList();

    procedure sbNoteRemoveClick(Sender: TObject);
    procedure sbNoteEditClick(Sender: TObject);
    procedure sbClearNotesClick(Sender: TObject);
    procedure sbNotesOpenClick(Sender: TObject);
    procedure sbNotesSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lbNotesClick(Sender: TObject);
    procedure lbNotesKeyPress(Sender: TObject; var Key: Char);
    procedure btnExitClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnSelectFolderClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    slNotes: TStringList;
    Excel: Variant;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

uses pasProcs;

procedure TMainForm.sbNoteRemoveClick(Sender: TObject);
begin
        if lbNotes.ItemIndex < 0 then exit;
        if MessageBox(Handle, 'Czy na pewno usun¹æ zaznaczon¹ notatkê?', 'Pytanie...', $124) = ID_NO then exit;

        slNotes.Delete(lbNotes.ItemIndex);
        RefreshNotesList();
end;

procedure TMainForm.sbNoteEditClick(Sender: TObject);
var
        sTemp, sNote: String;
        iPoint: Integer;
begin
        if lbNotes.ItemIndex = -1 then Exit;

        sTemp := slNotes[lbNotes.ItemIndex];
        iPoint := StrToIntDef(Copy(sTemp, 1, Pos('-', sTemp) - 1), 0);
        sNote := Copy(sTemp, Pos('-', sTemp) + 1, Length(sTemp));

        sNote := MyInputDialog('Zmieñ notatkê...', 'Zmieñ notatkê dla pomiaru nr ' + IntToStr(iPoint) + '.' + chr(13) + chr(10) + chr(13) + chr(10) + 'Znak # - przejœcie do nowej linii.', sNote, False);

        if sNote = '$#%CANCEL%#$' then Exit;

        slNotes[lbNotes.ItemIndex] := IntToStr(iPoint) + '-' + sNote;
        RefreshNotesList();
end;

procedure TMainForm.sbClearNotesClick(Sender: TObject);
begin
        slNotes.Clear();
        RefreshNotesList();
end;

procedure TMainForm.sbNotesOpenClick(Sender: TObject);
var
        iCnt, iCntIgn, iPoint, a: Integer;
        sNote, sMess, sTemp: String;
        slTemp: TStringList;
        isError: Boolean;
begin
        if not NotesOpenDialog.Execute then Exit;

        slTemp := TStringList.Create;
        slTemp.LoadFromFile(NotesOpenDialog.FileName);

        iCnt := 0;
        iCntIgn := 0;
        slNotes.Clear;

        for a := 0 to slTemp.Count - 1 do
        begin
                Inc(iCnt);
                isError := False;

                sTemp := slTemp[a];
                iPoint := StrToIntDef(Copy(sTemp, 1, Pos('-', sTemp) - 1), 0);
                sNote := Copy(sTemp, Pos('-', sTemp) + 1, Length(sTemp));

                if CheckNotesList(iPoint) then isError := True;

                if not isError then
                begin
                        slNotes.Add(IntToStr(iPoint) + '-' + sNote);
                end
                else Inc(iCntIgn);
        end;

        RefreshNotesList();
        slTemp.Free();

        if iCntIgn > 0 then
        begin
                if iCntIgn = iCnt then
                        sMess := 'Nie dodano ¿adnej notatki - wszystkie pozycje ju¿ wystêpuj¹ na liœcie lub format pliku jest nieprawid³owy.'
                else
                        sMess := 'Na listê dodano ' + IntToStr(iCnt - iCntIgn) + ' elementów z ' + IntToStr(iCnt) + ' pozycji w wybranym pliku. Pozosta³e ju¿ wystêpuj¹ na liœcie lub s¹ nieprawid³owe.';

                MessageBox(Handle, PChar(sMess), 'Ostrze¿enie...', $30);
        end;

        Application.ProcessMessages;
end;

procedure TMainForm.sbNotesSaveClick(Sender: TObject);
begin
        if NotesSaveDialog.Execute then slNotes.SaveToFile(NotesSaveDialog.FileName);
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
        ExcelInstalled: Boolean;
begin
        slNotes := TStringList.Create();

        //Sprawdzanie, czy Excel (jakikolwiek) jest zainstalowany?
        try
                Excel := CreateOleObject('Excel.Application');
                Excel.Visible := False;
                Excel.DisplayAlerts := False;

                ExcelInstalled := True;
        except
                MessageBox(Handle, PChar('Nie uda³o siê po³¹czyæ z programem Microsoft Excel.' + #13 + #10 + #13 + #10 + 'Program nie jest zainstalowany lub nie dzia³a poprawnie.' + #13 + #10 + 'Opcje eksportu programu po2_export bêd¹ nieaktywne.'), 'Ostrze¿enie...', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1 + MB_APPLMODAL);

                ExcelInstalled := False;
        end;

        GlobalChangeState(gbSourceData, ExcelInstalled);
        GlobalChangeState(gbSelections3, ExcelInstalled);
        GlobalChangeState(gbTools3, ExcelInstalled);
        GlobalChangeState(pnlList, ExcelInstalled);
        btnStart.Enabled := ExcelInstalled;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
        slNotes.Free();
        if not VarIsEmpty(Excel) then Excel.Quit;
end;

procedure TMainForm.RefreshNotesList();
var
        iIndex, iPoint, a: Integer;
        sNote, sTemp: String;
begin
        iIndex := lbNotes.ItemIndex;
        lbNotes.Items.Clear();

        for a := 0 to slNotes.Count - 1 do
        begin
                sTemp := slNotes[a];
                iPoint := StrToIntDef(Copy(sTemp, 1, Pos('-', sTemp) - 1), 0);
                sNote := Copy(sTemp, Pos('-', sTemp) + 1, Length(sTemp));
                sTemp := '' + IntToStr(iPoint) + ' - ' + sNote;

                lbNotes.Items.Add(sTemp);
        end;

        lbNotes.ItemIndex := iIndex;

        ChangeSelectionButtons();

        if lbNotes.Items.Count > 0 then
        begin
                if FileExists(eFile.Text) then
                        lblInfo.Caption := 'Program gotowy do pracy.'
                else
                        lblInfo.Caption := 'Wybierz skoroszyt, do którego chcesz dodaæ notatki.';
        end
        else lblInfo.Caption := 'Wybierz listê notatek, które chcesz dodaæ do skoroszytu.';
end;

function TMainForm.CheckNotesList(iPoint: Integer): Boolean;
var
        sTemp: String;
        a: Integer;
begin
        Result := False;

        for a := 0 to slNotes.Count - 1 do
        begin
                sTemp := slNotes[a];
                if Pos(IntToStr(iPoint), sTemp) > 0 then
                begin
                        Result := True;
                        Break;
                end;
        end;
end;

procedure TMainForm.ChangeSelectionButtons();
begin
        sbNoteRemove.Enabled := lbNotes.ItemIndex <> - 1;
        sbNoteEdit.Enabled := lbNotes.ItemIndex <> - 1;

        sbClearNotes.Enabled := lbNotes.Items.Count > 0;
        sbNotesSave.Enabled := lbNotes.Items.Count > 0;
end;

procedure TMainForm.lbNotesClick(Sender: TObject);
begin
        ChangeSelectionButtons();
end;

procedure TMainForm.lbNotesKeyPress(Sender: TObject; var Key: Char);
begin
        ChangeSelectionButtons();
end;

procedure TMainForm.btnExitClick(Sender: TObject);
begin
        Application.Terminate();
end;

procedure TMainForm.btnStartClick(Sender: TObject);
var
        a, iSerieCnt, iCntIgn, iMaxNumbers, iPoint, iSheetsCnt, iChartsCntTot, iChartsCnt, iRDel, i, j, k, iChartZeroPoint, iChartWidth, iShapeLeft: Integer;
        dPerPointWidth: Double;
        V, Vd, Shape, Range, Sheet, Chart: Variant;
        sDate, sFileName, sTemp, sNote: String;
        NeedSave: Boolean;
begin
        if eFile.Text = '' then
        begin
                MessageBox(Handle, 'Wska¿ arkusz, do którego chcesz dodaæ notatki!', 'Ostrze¿enie...', $30);
                Exit;
        end;

        if not FileExists(eFile.Text) then
        begin
                MessageBox(Handle, 'Wybrany plik nie istnieje!', 'Ostrze¿enie...', $30);
                Exit;
        end;

        if lbNotes.Items.Count = 0 then
        begin
                MessageBox(Handle, 'Lista notatek jest pusta!', 'Ostrze¿enie...', $30);
                Exit;
        end;

        if (not chbNotesAsComments.Checked or not chbNotesAsComments.Enabled) and (not chbNotesAsShapes.Checked or not chbNotesAsShapes.Enabled) and (not chbNotesAsSeries.Checked or not chbNotesAsSeries.Enabled) then
        begin
                MessageBox(Handle, 'Wybierz przynajmniej jeden rodzaj notatek do dodania!', 'Ostrze¿enie...', $30);
                Exit;
        end;

        sFileName := ChangeFileExt(ExtractFileName(eFile.Text), '');
        if Pos(' (dane)', sFileName) > 0 then sFileName := Copy(sFileName, 1, Pos(' (dane)', sFileName) - 1);
        if Pos(' (wykresy)', sFileName) > 0 then sFileName := Copy(sFileName, 1, Pos(' (wykresy)', sFileName) - 1);
        sFileName := ExtractFilePath(eFile.Text) + sFileName;
        sFileName := sFileName + ' (charakterystyka)' + ExtractFileExt(eFile.Text);

        if FileExists(sFileName) then if MessageBox(Handle, 'Plik docelowy ju¿ istnieje! Nadpisaæ?', 'Pytanie...', $124) = ID_NO then Exit;

        ChangeFormState(False);

        iChartsCntTot := 0;

        //Przesuniêcie kolumn i rzêdów w zale¿noœci od parametrów
        iRDel := 0;
        iCntIgn := 0;
        if chbTableHeaders.Checked then Inc(iRDel);
        if chbExtraSelectionInfo.Checked then Inc(iRDel, 4);

        lblInfo.Caption := 'Otwieranie wskazanego skoroszytu Microsoft Excel...';
        Application.ProcessMessages;
        
        //Excel.Workbooks.Open(eFile.Text);

        NeedSave := False;

        //Notatki jako komentarze
        if chbNotesAsComments.Checked then
        begin
                iSheetsCnt := Excel.Workbooks[1].Sheets.Count;
                NeedSave := True;

                for j := 1 to iSheetsCnt do
                begin
                        Sheet := Excel.Workbooks[1].Sheets[j];
                        iChartsCnt := Sheet.ChartObjects.Count;
                        Inc(iChartsCntTot, iChartsCnt);

                        lblInfo.Caption := 'Sprawdzanie arkusza nr ' + IntToStr(j) + ' z ' + IntToStr(iSheetsCnt);
                        Application.ProcessMessages;

                        //Sztuczne "znalezienie" wymiarów matrycy danych danych
                        i := 0;
                        repeat Inc(i) until Sheet.Cells[i + iRDel, 1].Text = '';
                        iMaxNumbers := i - 1;
                        i := 0;
                        repeat Inc(i) until Sheet.Cells[iRDel + 1, i].Text = '';
                        iChartWidth := i - 1;

                        lblInfo.Caption := 'Dodawanie komentarzy do arkusza nr ' + IntToStr(j) + ' z ' + IntToStr(iSheetsCnt);
                        Application.ProcessMessages;

                        for k := 0 to slNotes.Count - 1 do
                        begin
                                sTemp := slNotes[k];
                                iPoint := StrToIntDef(Copy(sTemp, 1, Pos('-', sTemp) - 1), 0) + 1;

                                if iPoint < iMaxNumbers then
                                begin
                                        sNote := Copy(sTemp, Pos('-', sTemp) + 1, Length(sTemp));
                                        sNote := StringReplace(sNote, '#', chr(10), [rfReplaceAll]);

                                        Range := Sheet.Cells[iPoint + iRDel, 1];
                                        sNote := Range.Text + chr(10) + '(pomiar nr ' + IntToStr(iPoint) + '): ' + chr(10) + sNote;
                                        Range.AddComment(sNote);

                                        //Dodawanie koloru t³a
                                        for a := 1 to iChartWidth do Sheet.Cells[iPoint + iRDel, a].Interior.ColorIndex := 4;
                                end
                                else Inc(iCntIgn);
                        end;
                end;
        end;

        //Notatki jako baloniki
        if chbNotesAsShapes.Checked then
        begin
                if NeedSave then
                begin
                        lblInfo.Caption := 'Zapisywanie skoroszytu Microsoft Excel...';
                        Application.ProcessMessages;

                        Excel.ActiveWorkbook.SaveAs(sFileName);
                end;

                iCntIgn := 0;
                NeedSave := True;

                iSheetsCnt := Excel.Workbooks[1].Sheets.Count;

                for j := 1 to iSheetsCnt do
                begin
                        Sheet := Excel.Workbooks[1].Sheets[j];
                        iChartsCnt := Sheet.ChartObjects.Count;
                        Inc(iChartsCntTot, iChartsCnt);

                        lblInfo.Caption := 'Dodawanie "baloników" do arkusza nr ' + IntToStr(j) + ' z ' + IntToStr(iSheetsCnt);
                        Application.ProcessMessages;

                        if iChartsCnt > 0 then
                        begin
                                Chart := Sheet.ChartObjects(1).Chart;

                                iChartZeroPoint := Chart.ChartArea.Left + Chart.Axes(xlValue).Left + Chart.Axes(xlValue).Width - 8;
                                iChartWidth := Chart.PlotArea.Width - Chart.Axes(xlValue).Width - Chart.Axes(xlValue).Left - 36;
                                iMaxNumbers := Chart.SeriesCollection(1).Points.Count;
                                dPerPointWidth := iChartWidth / (iMaxNumbers - 1);

                                for k := 0 to slNotes.Count - 1 do
                                begin
                                        sTemp := slNotes[k];
                                        iPoint := StrToIntDef(Copy(sTemp, 1, Pos('-', sTemp) - 1), 0) + 1;
                                        if iPoint < iMaxNumbers then
                                        begin
                                                sNote := Copy(sTemp, Pos('-', sTemp) + 1, Length(sTemp));
                                                sNote := StringReplace(sNote, '#', chr(10), [rfReplaceAll]);

                                                Range := Sheet.Cells[iPoint + iRDel, 1];
                                                sDate := Copy(Range.Text, 6, Length(Range.Text));
                                                sDate := StringReplace(sDate, ' ', ', ', [rfReplaceAll]);
                                                sNote := sDate + chr(10) + sNote;

                                                iShapeLeft := Round(iChartZeroPoint + (dPerPointWidth * (iPoint - 1)));

                                                //106 - rounded rectangle-shaped callout, 5 - rounded rectangle. 
                                                Shape := Sheet.Shapes.AddShape(106, iShapeLeft, Sheet.Rows[1].Top, 42, 63);
                                                Shape.Fill.ForeColor.RGB := ColorToRGB(clWhite);
                                                Shape.Line.Weight := 1;

                                                Shape.TextFrame.Characters.Font.Color := ColorToRGB(clBlack);
                                                Shape.TextFrame.Characters.Font.Size := 10;
                                                Shape.TextFrame.Characters.Text := sNote;
                                                Shape.TextFrame.Characters(1, Length(sDate)).Font.Bold := True;
                                                Shape.TextFrame.Orientation := 2;
                                                Shape.TextFrame.MarginBottom := 1;
                                                Shape.TextFrame.MarginLeft := 1;
                                                Shape.TextFrame.MarginRight := 1;
                                                Shape.TextFrame.MarginTop := 1;
                                        end
                                        else Inc(iCntIgn);
                                end;
                        end;
                end;
        end;

        //Notatki jako specjalne serie
        if chbNotesAsSeries.Checked then
        begin
                if NeedSave then
                begin
                        lblInfo.Caption := 'Zapisywanie skoroszytu Microsoft Excel...';
                        Application.ProcessMessages;

                        Excel.ActiveWorkbook.SaveAs(sFileName);
                end;

                V := VarArrayCreate([0,1], varDouble);
                Vd := VarArrayCreate([0,1], varDouble);

                iSheetsCnt := Excel.Workbooks[1].Sheets.Count;

                for j := 1 to iSheetsCnt do
                begin
                        Sheet := Excel.Workbooks[1].Sheets[j];
                        iChartsCnt := Sheet.ChartObjects.Count;
                        Inc(iChartsCntTot, iChartsCnt);

                        lblInfo.Caption := 'Dodawanie specjalnych serii danych do arkusza nr ' + IntToStr(j) + ' z ' + IntToStr(iSheetsCnt);
                        Application.ProcessMessages;

                        for i := 1 to iChartsCnt do
                        begin
                                Chart := Sheet.ChartObjects(i).Chart;
                                iMaxNumbers := Chart.SeriesCollection(1).Points.Count;
                                iSerieCnt := 1;
                                iCntIgn := 0;

                                for k := 0 to slNotes.Count - 1 do
                                begin
                                        sTemp := slNotes[k];
                                        iPoint := StrToIntDef(Copy(sTemp, 1, Pos('-', sTemp) - 1), 0) + 1;

                                        if iPoint < iMaxNumbers then
                                        begin
                                                V[0] := Chart.Axes(xlValue).MinimumScale;
                                                V[1] := Chart.Axes(xlValue).MaximumScale;
                                                Vd[0] := Sheet.Cells[iPoint + iRDel, 1].Value;
                                                Vd[1] := Sheet.Cells[iPoint + iRDel, 1].Value;

                                                Inc(iSerieCnt);
                                                Chart.SeriesCollection.NewSeries;
                                                Chart.SeriesCollection(iSerieCnt).XValues := Vd;
                                                Chart.SeriesCollection(iSerieCnt).Values := V;
                                                Chart.SeriesCollection(iSerieCnt).Smooth := False;
                                                Chart.SeriesCollection(iSerieCnt).MarkerStyle := xlMarkerStyleNone;
                                                Chart.SeriesCollection(iSerieCnt).Border.Weight := xlThin;
                                                Chart.SeriesCollection(iSerieCnt).Border.Color := ColorToRGB(clBlack);
                                                Chart.SeriesCollection(iSerieCnt).Border.LineStyle := xlDash;

                                                Chart.Legend.LegendEntries(2).Delete;
                                        end
                                        else Inc(iCntIgn);
                                end;
                        end;
                end;
        end;

        lblInfo.Caption := 'Zapisywanie skoroszytu Microsoft Excel...';
        Application.ProcessMessages;

        Excel.ActiveWorkbook.SaveAs(sFileName);

        if iCntIgn = 0 then
                lblInfo.Caption := 'Dodawanie notatek zosta³o pomyœlnie zakoñczone...'
        else
                lblInfo.Caption := 'Nie dodano ' + DopelnijPoPolsku(iCntIgn, 'notatki, gdy¿ by³a ona', 'notatek, gdy¿ by³y one', 'notatek, gdy¿ by³y one', False) + ' poza zakresem!';

        Application.ProcessMessages;

        ChangeFormState(True);

        chbNotesAsShapes.Enabled := (iChartsCntTot > 0);
        chbNotesAsSeries.Enabled := (iChartsCntTot > 0);
        if iChartsCntTot = 0 then
        begin
                chbNotesAsShapes.Checked := False;
                chbNotesAsSeries.Checked := False;
        end;
end;

procedure TMainForm.btnSelectFolderClick(Sender: TObject);
var
        Sheet: Variant;
        iSheetsCnt, iChartsCnt, i, j: Integer;
begin
        if not ExcelOpenDialog.Execute then exit;
        if not FileExists(ExcelOpenDialog.FileName) then exit;

        ChangeFormState(False);

        eFile.Text := ExcelOpenDialog.FileName;

        iSheetsCnt := 0;
        iChartsCnt := 0;

        lblInfo.Caption := 'Otwieranie wskazanego skoroszytu Microsoft Excel...';
        Application.ProcessMessages;
        Excel.Workbooks.Open(eFile.Text);

        for i := 1 to Excel.Workbooks[1].Sheets.Count do
        begin
                Inc(iSheetsCnt);
                Sheet := Excel.Workbooks[1].Sheets[i];
                j := Sheet.ChartObjects.Count;
                Inc(iChartsCnt, j);
        end;

        lblCnt.Caption := 'Otwarty skoroszyt zawiera w sumie ' + DopelnijPoPolsku(iSheetsCnt, 'arkusz', 'arkusze', 'arkuszy', False) + ' i ' + DopelnijPoPolsku(iChartsCnt, 'wykres', 'wykresy', 'wykresów', False) + '.';
        
        if lbNotes.Items.Count > 0 then
                lblInfo.Caption := 'Program gotowy do pracy.'
        else
                lblInfo.Caption := 'Wybierz listê notatek, które chcesz dodaæ do skoroszytu.';

        Application.ProcessMessages;

        ChangeFormState(True);

        chbNotesAsShapes.Enabled := (iChartsCnt > 0);
        chbNotesAsSeries.Enabled := (iChartsCnt > 0);
        if iChartsCnt = 0 then
        begin
                chbNotesAsShapes.Checked := False;
                chbNotesAsSeries.Checked := False;
        end;
end;

procedure TMainForm.ChangeFormState(State: Boolean);
begin
        GlobalChangeState(gbSourceData, State);
        GlobalChangeState(gbExportOptions, State);
        GlobalChangeState(gbNotes, State);
        GlobalChangeState(gbSelections3, State);
        GlobalChangeState(pnlList, State);
        GlobalChangeState(pnlButtons, State);
        GlobalChangeState(gbTools3, State);
        ChangeSelectionButtons();

        Application.ProcessMessages();

        if State then
        begin
                Screen.Cursor := crDefault;
                ChangeSelectionButtons();
        end
        else Screen.Cursor := crHourglass;
end;

procedure TMainForm.GlobalChangeState(Control: TWinControl; State: Boolean);
var
        a: Integer;
        cTemp: TControl;
begin
        for a := 0 to Control.ControlCount -1 do
        begin
                cTemp := Control.Controls[a];
                cTemp.Enabled := State;

                if (cTemp is TWinControl) and ((cTemp as TWinControl).ControlCount > 0) then GlobalChangeState((cTemp as TWinControl), State);
                if cTemp is TListBox then if State then (cTemp as TListBox).Color := clWindow else (cTemp as TListBox).Color := clBtnFace;
        end;

        Control.Enabled := State;
end;

function TMainForm.DopelnijPoPolsku(Value: Integer; String1, String2, String5: String; UseSpaces: Boolean): String;
var
        iLast, iLastTwo, iResult: Integer;
begin
        //Funkcja zwraca wartoœæ 1-3 w zale¿noœci, od tego jakie dope³nienie powinno byæ:
        //1 - "a": tylko dla jednoœci, np. 1 sekunda, 1 minuta, 1 godzina
        //2 - "y": dla wartoœci jednoœci 2-4, np. 2 sekundy, 22 minuty, 194 godziny (bez liczb 11-19),
        //3 - "[puste]": dla jednoœci (np. 21 sekund), liczb 11-19 (np. 14 minut, 217 godzin) i wszystkich pozosta³ych.

        Result := '';

        iResult := 3; //Domyœlnie 3, bo najwiêcej liczb spe³nia trzeci warunek

        iLast := StrToIntDef(Copy(IntToStr(Value), Length(IntToStr(Value)), 1),0);
        iLastTwo := StrToIntDef(Copy(IntToStr(Value), Length(IntToStr(Value))-1, 2),0);

        if (iLast > 1) and (iLast < 5) then iResult := 2; //Liczby z 2-4 na pozycji jednoœci - drugi warunek

        if (iLastTwo > 10) and (iLastTwo < 20) then iResult := 3; //Wymuszenie warunku 3 dla liczb maj¹cych 11-19 na pozycji dziesi¹tek

        if Value = 1 then iResult := 1;//Jedyny taki przypadek - warunek pierwszy spe³nia tylko cyfra 1.

        if UseSpaces then Result := FloatToStrF(Value, ffNumber, 15, 0) else Result := IntToStr(Value);

        case iResult of
                1: Result := Result + ' ' + String1;
                2: Result := Result + ' ' + String2;
                3: Result := Result + ' ' + String5;
        end;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
        ChangeSelectionButtons();
end;

end.
