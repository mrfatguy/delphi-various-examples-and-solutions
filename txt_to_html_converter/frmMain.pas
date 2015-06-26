unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl, ComCtrls;

const

   chsISO: String ='ÍÛ±∂≥øºÊÒ ”°¶£Ø¨∆—';
   chsWin: String ='ÍÛπú≥øüÊÒ ”•å£Øè∆—';

type
  TMainForm = class(TForm)
    Label1: TLabel;
    eSource: TEdit;
    btnGo: TButton;
    pbMain: TProgressBar;
    btnSelectFile: TButton;
    opFile: TOpenDialog;

    function ConvertToISO(Line: String): String;

    procedure btnGoClick(Sender: TObject);
    procedure btnSelectFileClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

function TMainForm.ConvertToISO(Line: String): String;
var
        a, b: Integer;
begin
        Result:=Line;
        for a:=1 to Length(Line) do
        begin
                b:=AnsiPos(Line[a],chsWin);
                if b<>0 then Line[a]:=chsISO[b];
        end;
        Result:=Line;
end;

procedure TMainForm.btnGoClick(Sender: TObject);
var
        slList: TStringList;
        a: Integer;
        sNewFile, sFirstPart, sLine: String;
begin
        if not FileExists(eSource.Text) then
        begin
                ShowMessage('Plik ürÛd≥owy nie istnieje!');
                exit;
        end;

        slList := TStringList.Create;
        slList.LoadFromFile(eSource.Text);

        pbMain.Max := slList.Count - 1;
        pbMain.Min := 0;
        pbMain.Position := 0;

        for a := 1 to pbMain.Max do
        begin
                pbMain.Position := a;

                sLine := slList.Strings[a];
                sFirstPart := Copy(sLine, 1, 7);

                if sFirstPart <> '' then
                begin
                        if sFirstPart = 'http://' then
                        begin
                                sLine := '<a href="' + sLine + '">' + sLine + '</a>';
                        end
                        else
                        begin
                                sLine := '<strong>' + sLine + '</strong>';
                        end;
                end
                else sLine := '<br />';

                //ShowMessage('"' + sFirstPart + '"');

                slList.Strings[a] := ConvertToISO(sLine + '<br />');

                Application.ProcessMessages();
        end;

        //ShowMessage(ChangeFileExt(eSource.Text, '.html'));

        sNewFile := ChangeFileExt(eSource.Text, '.html');

        slList.Text := '<?xml version="1.0" encoding="iso-8859-2"?>' + '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "DTD/xhtml1-strict.dtd"><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pl" lang="pl"><head><meta http-equiv="Content-type" content="application/xhtml+xml; charset=iso-8859-2" />' + '<meta name="Description" content="' + eSource.Text + ' zamieniony na ' + sNewFile + '" />' + '<meta name="Generator" content="Zamieniacz TXT na HTML" /><title>' + sNewFile + '</title></head><body>' + slList.Text;

        slList.Text := slList.Text + '</body></html>';

        slList.SaveToFile(sNewFile);
        Application.MessageBox(PChar('Plik:'+chr(13)+eSource.Text+chr(13)+''+chr(13)+'zosta≥ przetworzony i zapisany jako:'+chr(13)+sNewFile),'Zadanie wykonane!',MB_OK+MB_ICONINFORMATION+MB_DEFBUTTON1);

        slList.Free;
        pbMain.Position := 0;
end;

procedure TMainForm.btnSelectFileClick(Sender: TObject);
begin
        if opFile.Execute then eSource.Text := opFile.FileName;
end;

end.
