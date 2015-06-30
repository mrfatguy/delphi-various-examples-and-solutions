unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ExtDlgs, INIFIles, TFlatHintUnit, ThemeMgr;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    i: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    opd: TOpenPictureDialog;
    Button2: TButton;
    ic: TImage;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox3: TGroupBox;
    Memo1: TMemo;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    ThemeManager1: TThemeManager;
    FlatHint1: TFlatHint;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure iClick(Sender: TObject);
  private
    { Private declarations }
  public
    SysPath: String;
  end;

var
  Form1: TForm1;

implementation

uses frmInfo;

{$R *.DFM}
{$R WinXP.res}

procedure TForm1.Button1Click(Sender: TObject);
begin
if opd.Execute then i.Picture.LoadFromFile(opd.FileName);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
i.Picture:=ic.Picture;
end;

procedure TForm1.FormShow(Sender: TObject);
var
        Buffer: array[0..1023] of Char;
        ini: TINIFile;
        a: Integer;
        tmp: String;
begin
GetSystemDirectory(Buffer,1023);
SysPath:=Buffer;
SysPath:=SysPath+'\';
if FileExists(SysPath+'oemlogo.bmp') then i.Picture.LoadFromFile(SysPath+'oemlogo.bmp');
if FileExists(SysPath+'oeminfo.ini') then
begin
        ini:=TINIFile.Create(SysPath+'oeminfo.ini');
        Edit1.Text:=ini.ReadString('General','Manufacturer','');
        Edit2.Text:=ini.ReadString('General','Model','');
        for a:=1 to 100 do if ini.ValueExists('Support Information','Line'+IntToStr(a)) then Memo1.Lines.Add(ini.ReadString('Support Information','Line'+IntToStr(a),''));
        ini.Free;
end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
Info.ShowModal;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
        ini: TINIFile;
        a: Integer;
        tmp: String;
begin
if Application.MessageBox('Uaktualniæ dane ???','Pytanie...',MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2)=ID_NO then exit;
i.Picture.SaveToFile(SysPath+'oemlogo.bmp');
ini:=TINIFile.Create(SysPath+'oeminfo.ini');
ini.WriteString('General','Manufacturer',Edit1.Text);
ini.WriteString('General','Model',Edit2.Text);
for a:=1 to 100 do if ini.ValueExists('Support Information','Line'+IntToStr(a)) then ini.DeleteKey('Support Information','Line'+IntToStr(a));
for a:=0 to Memo1.Lines.Count-1 do ini.WriteString('Support Information','Line'+IntToStr(a+1),Memo1.Lines.Strings[a]);
ini.Free;
end;

procedure TForm1.iClick(Sender: TObject);
begin
i.Stretch:= not i.Stretch;
end;

end.
