unit rUnit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, RVScroll, RichView, RVStyle, ComCtrls, ShellAPI,
  FileCtrl, jpeg;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Button1: TButton;
    Image1: TImage;
    Button2: TButton;
    Memo1: TMemo;
    Button3: TButton;
    rv: TRichView;
    RVStyle1: TRVStyle;
    TabSheet4: TTabSheet;
    Label1: TLabel;
    Button4: TButton;
    Label2: TLabel;
    TabSheet5: TTabSheet;
    PageControl2: TPageControl;
    TabSheet6: TTabSheet;
    Memo2: TMemo;
    Button8: TButton;
    TabSheet7: TTabSheet;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    TabSheet8: TTabSheet;
    Button9: TButton;
    Image2: TImage;
    Button10: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses pasStructureStore;

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var
	Store: TStructuredStorage;
	ms: TMemoryStream;
begin
	Screen.Cursor:=crHourglass;
	Store:=TStructuredStorage.Create;
	TMemoryStream.Create;
	Store.OpenStorageFile('test.store', False);
	ms:=Store.GetItem('IMAGE1');
	Image1.Picture.Bitmap.LoadFromStream(ms);
	Store.CloseStorageFile;
	Store.Free;
	ms.Free;
	Screen.Cursor:=crDefault;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
        Store: TStructuredStorage;
        ms: TMemoryStream;
begin
        Screen.Cursor:=crHourglass;
        Store:=TStructuredStorage.Create;
        TMemoryStream.Create;
        Store.OpenStorageFile('test.store', False);
        ms:=Store.GetItem('TEXT1');
        Memo1.Clear;
        Memo1.Lines.LoadFromStream(ms);
        Store.CloseStorageFile;
        Store.Free;
        ms.Free;
        Screen.Cursor:=crDefault;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
        Store: TStructuredStorage;
        ms: TMemoryStream;
begin
        Screen.Cursor:=crHourglass;
        Store:=TStructuredStorage.Create;
        TMemoryStream.Create;
        Store.OpenStorageFile('test.store', False);
        ms:=Store.GetItem('DOC1');
        rv.Clear;
        rv.LoadRVFFromStream(ms);
        rv.Format;
        Store.CloseStorageFile;
        Store.Free;
        ms.Free;
        Screen.Cursor:=crDefault;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
        Store: TStructuredStorage;
        ms: TMemoryStream;
        Buffer: array[0..1023] of Char;
        TempPath: String;
begin
        Screen.Cursor:=crHourglass;
        Label2.Caption:='Status: extracting';
        Application.ProcessMessages;
        GetTempPath(1023,Buffer);
        TempPath:=Buffer+'StorageTempFolder\';
        ForceDirectories(TempPath);
        Store:=TStructuredStorage.Create;
        TMemoryStream.Create;
        Store.OpenStorageFile('test.store', False);
        ms:=Store.GetItem('VIDEO1');
        Store.SaveToFile(TempPath+'temp.mpg',ms);
        Store.CloseStorageFile;
        Store.Free;
        ms.Free;
        Label2.Caption:='Status: executing';
        ShellExecute(Handle,'open','temp.mpg','',PCHar(TempPath),SW_SHOW);
        Screen.Cursor:=crDefault;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
        Store: TStructuredStorage;
begin
        Store:=TStructuredStorage.Create;
        Store.OpenStorageFile('test.store', False);
        ShowMessage(Store.ReadString('STRING1'));
        Store.CloseStorageFile;
        Store.Free;
end;

procedure TForm1.Button6Click(Sender: TObject);
var
        Store: TStructuredStorage;
begin
        Store:=TStructuredStorage.Create;
        Store.OpenStorageFile('test.store', False);
        ShowMessage(IntToStr(Store.ReadInteger('INTEGER1')));
        Store.CloseStorageFile;
        Store.Free;
end;

procedure TForm1.Button7Click(Sender: TObject);
var
        Store: TStructuredStorage;
begin
        Store:=TStructuredStorage.Create;
        Store.OpenStorageFile('test.store', False);
        if Store.ReadBoolean('BOOL1') then ShowMessage('True') else ShowMessage('False');
        Store.CloseStorageFile;
        Store.Free;
end;

procedure TForm1.Button8Click(Sender: TObject);
var
        Store: TStructuredStorage;
        ms: TMemoryStream;
begin
        Screen.Cursor:=crHourglass;
        Store:=TStructuredStorage.Create;
        TMemoryStream.Create;
        Store.OpenStorageFile('test.store', False);
        ms:=Store.GetItem('MEMO1');
        Memo2.Clear;
        Memo2.Lines.LoadFromStream(ms);
        Store.CloseStorageFile;
        Store.Free;
        ms.Free;
        Screen.Cursor:=crDefault;
end;

procedure TForm1.Button9Click(Sender: TObject);
var
	Store: TStructuredStorage;
	ms: TMemoryStream;
	jpg: TJPEGImage;
begin
	jpg:=TJPEGImage.Create;
	Screen.Cursor:=crHourglass;
	Store:=TStructuredStorage.Create;
	TMemoryStream.Create;
	Store.OpenStorageFile('test.store', False);
	ms:=Store.GetItem('JPEG1');
	jpg.LoadFromStream(ms);
	Image2.Picture.Assign(jpg);
	Store.CloseStorageFile;
	Store.Free;
	ms.Free;
	jpg.Free;
	Screen.Cursor:=crDefault;
end;

procedure TForm1.Button10Click(Sender: TObject);
var
	ms: TMemoryStream;
begin
	ms:=TMemoryStream.Create;
	Image1.Picture.Graphic.SaveToStream(ms);
	Image2.Picture.Bitmap.LoadFromStream(ms);
	ms.Free;
end;

end.
