unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  TMainForm = class(TForm)
    eFile: TEdit;
    Timer: TTimer;
    lblInfo: TLabel;
    btnLoad: TButton;
    opMain: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
  private
    { Private declarations }
  public
    FileTime: Integer;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);
begin
        FileTime := 0;
        opMain.InitialDir := ExtractFilePath(Application.ExeName);
end;

procedure TMainForm.TimerTimer(Sender: TObject);
var
        iTemp: Integer;
        FWinfo: TFlashWInfo;
begin
        if FileExists(eFile.Text) then
        begin
                iTemp := FileAge(eFile.Text);
                if iTemp <> FileTime then
                begin
                        Timer.Enabled := False;

                        Application.Title := '[Zmiana!] ' + MainForm.Caption;

                        FWinfo.cbSize := 20;
                        FWinfo.hwnd := Application.Handle; // Handle of Window to flash
                        FWinfo.dwflags := FLASHW_ALL;
                        FWinfo.ucount := 10; // number of times to flash
                        FWinfo.dwtimeout := 0; // speed in ms, 0 default blink cursor rate
                        FlashWindowEx(FWinfo); // make it flash!

                        lblInfo.Caption := 'Zmiana!';
                        lblInfo.Font.Size := 18;
                        lblInfo.Font.Style := [fsBold];

                        Application.Restore();

                        ShowMessage('Data i czas pliku uleg³ zmianie!' + #10#13 + 'By³o: ' + DateTimeToStr(FileDateToDateTime(FileTime)) + #10#13 + 'Jest: ' + DateTimeToStr(FileDateToDateTime(iTemp)));

                        FWinfo.cbSize := 20;
                        FWinfo.hwnd := Application.Handle;
                        FWinfo.dwflags := FLASHW_STOP;
                        FWinfo.ucount := 0;
                        FWinfo.dwtimeout := 0;
                        FlashWindowEx(FWinfo);

                        Application.Title := MainForm.Caption;

                        lblInfo.Caption := 'Program sprawdza co sekundê, czy data i czas wybranego pliku nie uleg³y zmianie i jeœli tak - wyœwietla stosowny komunikat.';
                        lblInfo.Font.Size := 10;
                        lblInfo.Font.Style := [];
                        btnLoad.Caption := 'Wybierz';
                end;
        end
        else ShowMessage('Plik nie istnieje (' + eFile.Text + ') !!!');
end;

procedure TMainForm.btnLoadClick(Sender: TObject);
begin
        if btnLoad.Caption = 'Wybierz' then
        begin
                if opMain.Execute then eFile.Text := opMain.FileName;

                btnLoad.Caption := 'Stop!';
                Application.Title := '[Pilnujê...] ' + MainForm.Caption;

                lblInfo.Caption := 'Pilnujê...';
                lblInfo.Font.Size := 18;
                lblInfo.Font.Style := [fsBold];

                FileTime := FileAge(eFile.Text);
                Timer.Enabled := True;
                Application.Minimize;
        end
        else
        begin
                btnLoad.Caption := 'Wybierz';
                lblInfo.Caption := 'Program sprawdza co sekundê, czy data i czas wybranego pliku nie uleg³y zmianie i jeœli tak - wyœwietla stosowny komunikat.';
                lblInfo.Font.Size := 10;
                lblInfo.Font.Style := [];
                Timer.Enabled := False;
        end;
end;

end.
