unit sUnit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Spin, jpeg;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    Memo1: TMemo;
    Button5: TButton;
    TabSheet4: TTabSheet;
    Label2: TLabel;
    Edit2: TEdit;
    Button6: TButton;
    SpinEdit1: TSpinEdit;
    Button7: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Button8: TButton;
    RadioGroup1: TRadioGroup;
    Button9: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

uses pasStructureStore;

procedure TForm1.Button1Click(Sender: TObject);
var
	ms: TMemoryStream;
	bmp: TBitmap;
	Store: TStructuredStorage;
begin
	Screen.Cursor:=crHourglass;
	Store:=TStructuredStorage.Create;
	ms:=TMemoryStream.Create;
	bmp:=TBitmap.Create;
	bmp.LoadFromFile('sample.bmp');
	bmp.SaveToStream(ms);
	Store.OpenStorageFile('test.store', True);
	Store.AddItem('IMAGE1',ms);
	Store.CloseStorageFile;
	Store.Free;
	ms.Free;
        bmp.Free;
	Screen.Cursor:=crDefault;
        ShowMessage('Done!');
end;

procedure TForm1.Button2Click(Sender: TObject);
var
	Store: TStructuredStorage;
begin
        Screen.Cursor:=crHourglass;
        Store:=TStructuredStorage.Create;
        Store.OpenStorageFile('test.store', True);
        Store.AddItem('DOC1',Store.LoadFromFile('sample.rvf'));
        Store.CloseStorageFile;
        Store.Free;
        Screen.Cursor:=crDefault;
        ShowMessage('Done!');
end;

procedure TForm1.Button3Click(Sender: TObject);
var
        Store: TStructuredStorage;
begin
        Screen.Cursor:=crHourglass;
        Store:=TStructuredStorage.Create;
        Store.OpenStorageFile('test.store', True);
        Store.AddItem('TEXT1',Store.LoadFromFile('sample.txt'));
        Store.CloseStorageFile;
        Store.Free;
        Screen.Cursor:=crDefault;
        ShowMessage('Done!');
end;

procedure TForm1.FormCreate(Sender: TObject);
var
        Store: TStructuredStorage;
begin
if FileExists('test.store')=False then
begin
        Store:=TStructuredStorage.Create;
        Store.CreateStorageFile('test.store');
        Store.CloseStorageFile;
        Store.Free;
end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
        Store: TStructuredStorage;
begin
        Screen.Cursor:=crHourglass;
        Store:=TStructuredStorage.Create;
        Store.OpenStorageFile('test.store', True);
        Store.AddItem('VIDEO1',Store.LoadFromFile('sample.mpg'));
        Store.CloseStorageFile;
        Store.Free;
        Screen.Cursor:=crDefault;
        ShowMessage('Done!');
end;

procedure TForm1.Button6Click(Sender: TObject);
var
        Store: TStructuredStorage;
begin
        if edit2.Text='' then exit;
        Screen.Cursor:=crHourglass;
        Store:=TStructuredStorage.Create;
        Store.OpenStorageFile('test.store', True);
        Store.WriteString('STRING1',Edit2.Text);
        Store.CloseStorageFile;
        Store.Free;
        Screen.Cursor:=crDefault;
        ShowMessage('Done!');
end;

procedure TForm1.Button7Click(Sender: TObject);
var
        Store: TStructuredStorage;
begin
        Screen.Cursor:=crHourglass;
        Store:=TStructuredStorage.Create;
        Store.OpenStorageFile('test.store', True);
        Store.WriteInteger('INTEGER1',SpinEdit1.Value);
        Store.CloseStorageFile;
        Store.Free;
        Screen.Cursor:=crDefault;
        ShowMessage('Done!');
end;

procedure TForm1.Button8Click(Sender: TObject);
var
        Store: TStructuredStorage;
begin
        Screen.Cursor:=crHourglass;
        Store:=TStructuredStorage.Create;
        Store.OpenStorageFile('test.store', True);
        if RadioGroup1.ItemIndex=0 then
        Store.WriteBoolean('BOOL1',True)
        else
        Store.WriteBoolean('BOOL1',False);
        Store.CloseStorageFile;
        Store.Free;
        Screen.Cursor:=crDefault;
        ShowMessage('Done!');
end;

procedure TForm1.Button5Click(Sender: TObject);
var
        ms: TMemoryStream;
        Store: TStructuredStorage;
begin
        Screen.Cursor:=crHourglass;
        Store:=TStructuredStorage.Create;
        ms:=TMemoryStream.Create;
        Memo1.Lines.SaveToStream(ms);
        Store.OpenStorageFile('test.store', True);
        Store.AddItem('MEMO1',ms);
        Store.CloseStorageFile;
        Store.Free;
        ms.Free;
        Screen.Cursor:=crDefault;
        ShowMessage('Done!');
end;

procedure TForm1.Button9Click(Sender: TObject);
var
	ms: TMemoryStream;
	pic: TPicture;
	Store: TStructuredStorage;
begin
	Screen.Cursor:=crHourglass;
	Store:=TStructuredStorage.Create;
	ms:=TMemoryStream.Create;
	pic:=TPicture.Create;
	pic.LoadFromFile('sample.jpg');
	pic.Graphic.SaveToStream(ms);
	Store.OpenStorageFile('test.store', True);
	Store.AddItem('JPEG1',ms);
	Store.CloseStorageFile;
	Store.Free;
	ms.Free;
	pic.Free;
	Screen.Cursor:=crDefault;
        ShowMessage('Done!');
end;

end.
