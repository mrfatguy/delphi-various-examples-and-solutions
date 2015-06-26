unit frmHelp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, INIFiles, StdCtrls, RVStyle, RVScroll, RichView, ImgBtn,
  ImgList;

type
  THelp = class(TForm)
    back: TPaintBox;
    RVStyle1: TRVStyle;
    rvList: TRichView;
    rvText: TRichView;
    btnClose: TImgBtn;
    HistoryListBox: TListBox;
    btnHistoryBack: TImgBtn;
    TrybPracy: TPanel;
    procedure FormPaint(Sender: TObject);
    procedure OpenHelp;
    procedure rvListJump(Sender: TObject; id: Integer);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rvTextJump(Sender: TObject; id: Integer);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnHistoryBackClick(Sender: TObject);
    procedure AddToHistory(FileName: String);
  private
    fillist: TStringList;
    namlist: TStringList;
    afillist: TStringList;
    anamlist: TStringList;
  public
    { Public declarations }
  end;

var
  Help: THelp;

implementation

{$R *.DFM}

uses Procs;

procedure THelp.FormPaint(Sender: TObject);
begin
if TrybPracy.Caption='Help' then DrawOutline(back,'Pomoc on-line') else DrawOutline(back,'Historia gry');
btnClose.Repaint;
btnHistoryBack.Repaint;
end;

procedure THelp.OpenHelp;
var
        ini: TINIFile;
        a,max: Integer;
begin
rvList.Clear;
if TrybPracy.Caption='Help' then
begin
        ini:=TINIFile.Create(DataPath+'help.ini');
        max:=ini.ReadInteger('General','ListCount',0);
        for a:=1 to max do
        begin
                rvList.AddNL(ini.ReadString('List','Item'+IntToStr(a),''),5,0);
                namlist.Add(AnsiLowerCase(ini.ReadString('List','Item'+IntToStr(a),'')));
                fillist.Add(ini.ReadString('List','File'+IntToStr(a),''));
        end;
        rvList.Format;
        max:=ini.ReadInteger('General','ExtendedCount',0);
        for a:=1 to max do
        begin
                anamlist.Add(AnsiLowerCase(ini.ReadString('Extended','Item'+IntToStr(a),'')));
                afillist.Add(ini.ReadString('Extended','File'+IntToStr(a),''));
        end;
        rvList.Format;
        ini.Free;
end
else
begin
        ini:=TINIFile.Create(ProgramPath+'Dane\hist.dat');
        max:=ini.ReadInteger('General','Entries',0);
        for a:=1 to max do
        begin
                rvList.AddNL(ini.ReadString('Entry'+IntToStr(a),'Date',''),5,0);
        end;
        rvList.Format;
        ini.Free;
end;
end;

procedure THelp.rvListJump(Sender: TObject; id: Integer);
var
        ini: TINIFile;
        a,max: Integer;
        tx: String;
begin
if TrybPracy.Caption='Help' then
begin
        rvText.LoadRVF(DataPath+fillist.Strings[id]);
        rvText.Format;
        AddToHistory(DataPath+fillist.Strings[id]);
end
else
begin
        rvText.Clear;
        ini:=TINIFile.Create(ProgramPath+'Dane\hist.dat');
        max:=ini.ReadInteger('Entry'+IntToStr(id+1),'Entries',0);
        rvText.AddNL('Raport postêpów w grze z dnia ',0,0);
        rvText.Add(ini.ReadString('Entry'+IntToStr(id+1),'Date',''),1);
        rvText.Add(' r.',1);
        rvText.Add(':',0);
        for a:=1 to max do
        begin
                tx:=ini.ReadString('Entry'+IntToStr(id+1),'Entry'+IntToStr(a),'');
                if a=max then rvText.AddNL('• '+tx,2,0) else rvText.AddNL('• '+tx,0,0);
        end;
        rvText.Format;
        ini.Free;
end;
end;

procedure THelp.btnCloseClick(Sender: TObject);
begin
Close;
end;

procedure THelp.FormCreate(Sender: TObject);
begin
fillist:=TStringList.Create;
fillist.Clear;
namlist:=TStringList.Create;
namlist.Clear;
afillist:=TStringList.Create;
afillist.Clear;
anamlist:=TStringList.Create;
anamlist.Clear;
HistoryListBox.Items.Clear;
end;

procedure THelp.rvTextJump(Sender: TObject; id: Integer);
var
        lookfor: String;
        ItemNo, NotUsedTag, a: Integer;
begin
if TrybPracy.Caption='History' then
begin
        exit;
end;
        ItemNo := rvText.GetJumpPointItemNo(id);
        rvText.GetTextInfo(ItemNo, lookfor, NotUsedTag);
        lookfor:=AnsiLowerCase(lookfor);
        for a:=0 to namlist.Count-1 do
        begin
             if namlist.Strings[a]=lookfor then
             begin
                  rvText.LoadRVF(DataPath+fillist.Strings[a]);
                  rvText.Format;
                  AddToHistory(DataPath+fillist.Strings[a]);
                  exit;
             end;
        end;
        for a:=0 to anamlist.Count-1 do
        begin
             if anamlist.Strings[a]=lookfor then
             begin
                  rvText.LoadRVF(DataPath+afillist.Strings[a]);
                  rvText.Format;
                  AddToHistory(DataPath+afillist.Strings[a]);
                  exit;
             end;
        end;
ShowInfo('Brak danych...','Brak dodatkowych informacji na ten temat.',1);
end;

procedure THelp.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=27 then btnCloseClick(self);
end;

procedure THelp.AddToHistory(FileName: String);
begin
HistoryListBox.Items.Add(FileName);
if HistoryListBox.Items.Count<=1 then btnHistoryBack.Visible:=False else btnHistoryBack.Visible:=True;
end;

procedure THelp.btnHistoryBackClick(Sender: TObject);
begin
rvText.LoadRVF(HistoryListBox.Items.Strings[HistoryListBox.Items.Count-2]);
rvText.Format;
HistoryListBox.Items.Delete(HistoryListBox.Items.Count-1);
if HistoryListBox.Items.Count<=1 then btnHistoryBack.Visible:=False else btnHistoryBack.Visible:=True;
end;

end.
