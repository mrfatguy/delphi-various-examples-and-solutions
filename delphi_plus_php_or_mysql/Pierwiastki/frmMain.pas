unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OleCtrls, SHDocVw, ExtCtrls, WinInet;

type
  TMainForm = class(TForm)
    pnlWeb: TPanel;
    WebBrowser: TWebBrowser;
    procedure CreateButtons();
    function Connected: Boolean;

    procedure ButtonClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    but: array [0..117] of TButton;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

function TMainForm.Connected: Boolean;
var
     Flags: DWORD;
begin
     Flags:=INTERNET_CONNECTION_MODEM or INTERNET_CONNECTION_LAN ;
     Result := InternetGetConnectedState(@Flags, 0);
end;

procedure TMainForm.CreateButtons();
var
        fil: TStringList;
        a, aLeft, iLeft, iTop: Integer;
        sTmp, sNazwa, sSymbol: String;
begin
        if not FileExists('Pierwiastki.txt') then
        begin
                Application.MessageBox('Nie znaleziono pliku Pierwiastki.txt!','B³¹d!',MB_OK+MB_ICONWARNING+MB_DEFBUTTON1);
                exit;
        end;

        for a := 0 to 117 do but[a].Free;

        fil := TStringList.Create;
        fil.LoadFromFile('Pierwiastki.txt');

        iTop := 0;
        aLeft := 0;

        for a := 0 to fil.Count - 1 do
        begin
                but[a] := TButton.Create(MainForm);
                but[a].Parent := MainForm;
                but[a].Width := 24;
                but[a].Height := 24;
                but[a].Tag := a;
                but[a].OnClick := ButtonClick;

                iLeft := (aLeft * 30) + 8;

                if iLeft > (MainForm.ClientWidth - 16) then
                begin
                        Inc(iTop);
                        aLeft := 0;
                        iLeft := (aLeft * 30) + 8;
                end;

                Inc(aLeft);

                but[a].Left := iLeft;
                but[a].Top := (iTop * 30) + 8;

                sTmp := fil[a];
                sSymbol := Copy(sTmp, 1, Pos('#', sTmp) - 1);
                sNazwa := Copy(sTmp, Pos('#', sTmp) + 1, Length(sTmp));

                but[a].ShowHint := True;
                but[a].Hint := sNazwa;
                but[a].Caption := sSymbol;
        end;

        pnlWeb.Top := (iTop * 30) + 40;
        pnlWeb.Height := MainForm.ClientHeight - ((iTop * 30) + 40) - 8;
        fil.Free;
end;

procedure TMainForm.ButtonClick(Sender: TObject);
var
        fil: TStringList;
        sTmp, sNazwa: String;
begin
        if not Connected then
        begin
                Application.MessageBox('Brak aktywnego po³¹czenia internetowego!','B³¹d!',MB_OK+MB_ICONWARNING+MB_DEFBUTTON1);
                exit;
        end;

        fil := TStringList.Create;
        fil.LoadFromFile('pierwiastki.txt');
        sTmp := fil[(Sender as TButton).Tag];
        sNazwa := Copy(sTmp, Pos('#', sTmp) + 1, Length(sTmp));
        WebBrowser.Navigate('http://pl.wikipedia.org/wiki/'+sNazwa);
        fil.Free
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
        CreateButtons();
end;

end.
