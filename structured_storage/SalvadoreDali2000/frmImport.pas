unit frmImport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, FoldrDlg, CheckLst, Buttons,
  FileCtrl, ExtCtrls;

type
  TImportForm = class(TForm)
    gbFolder: TGroupBox;
    Label1: TLabel;
    eFolder: TEdit;
    btnSelectPhotoFile: TButton;
    fdImport: TFolderDialog;
    gbFileType: TGroupBox;
    rbAll: TRadioButton;
    rbSelected: TRadioButton;
    chblbTypes: TCheckListBox;
    btnNo: TBitBtn;
    btnGo: TBitBtn;
    rgName: TRadioGroup;
    lblModalResult: TLabel;
    gbDefault: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    ePhotoAuthor: TEdit;
    chbHasPass: TCheckBox;
    chbRedistribution: TCheckBox;
    function CountFiles(Directory, OfType: String): Integer;

    procedure btnSelectPhotoFileClick(Sender: TObject);
    procedure rbAllClick(Sender: TObject);
    procedure rbSelectedClick(Sender: TObject);
    procedure btnGoClick(Sender: TObject);
    procedure btnNoClick(Sender: TObject);
  private
    { Private declarations }
  public
    FoundFiles: Integer;
  end;

var
  ImportForm: TImportForm;

implementation

{$R *.DFM}

procedure TImportForm.btnSelectPhotoFileClick(Sender: TObject);
begin
        if DirectoryExists(eFolder.Text) then fdImport.Directory:=eFolder.Text;
	if not fdImport.Execute then exit;
	eFolder.Text:=fdImport.Directory;
	eFolder.Hint:='Wybrany folder:#'+fdImport.Directory;
end;

procedure TImportForm.rbAllClick(Sender: TObject);
begin
	chblbTypes.Enabled:=False;	
end;

procedure TImportForm.rbSelectedClick(Sender: TObject);
begin
	chblbTypes.Enabled:=True;
end;

procedure TImportForm.btnGoClick(Sender: TObject);
var
	a: Integer;
	ext: TStringList;
	AtLeastOne: Boolean;
begin
	ext:=TStringList.Create;
	ext.Add('*.jp*g');
	ext.Add('*.gif');
	ext.Add('*.bmp');
	ext.Add('*.emf');
	ext.Add('*.wmf');
	ext.Add('*.ico');

	if not DirectoryExists(eFolder.Text) then
	begin
		Application.MessageBox('Wskazany folder nie istnieje lub jest niedostêny.','B³¹d...',MB_OK+MB_ICONWARNING+MB_DEFBUTTON1);
		lblModalResult.Caption:='0';
		exit;
	end;

	FoundFiles:=0;

	if rbAll.Checked then
	begin
		for a:=0 to ext.Count-1 do
		begin
			Inc(FoundFiles,CountFiles(eFolder.Text,ext.Strings[a]));
		end;
		if FoundFiles=0 then
		begin
			Application.MessageBox('W wybranym folderze nie znaleziono ani jednego pliku, który mo¿na by zaimportowaæ.','B³¹d...',MB_OK+MB_ICONWARNING+MB_DEFBUTTON1);
			ext.Free;
			lblModalResult.Caption:='0';
			exit;
		end
		else
		begin
			lblModalResult.Caption:='1';
			Close;
			exit;
		end;
	end;

	AtLeastOne:=False;

	for a:=0 to chblbTypes.Items.Count-1 do
	begin
		if chblbTypes.Checked[a]=True then
		begin
			AtLeastOne:=True;
			Inc(FoundFiles,CountFiles(eFolder.Text,ext.Strings[a]));
		end;
	end;
	if not AtLeastOne then
	begin
		Application.MessageBox('Zaznacz przynajmniej jeden typ pliku.','B³¹d...',MB_OK+MB_ICONWARNING+MB_DEFBUTTON1);
		ext.Free;
		lblModalResult.Caption:='0';
		exit;
	end;
	if FoundFiles=0 then
	begin
		Application.MessageBox('W wybranym folderze nie znaleziono ani jednego pliku o typie nale¿¹cym do grupy zaznaczonych. Wybierz wiêcej typów plików lub wska¿ inny folder.','B³¹d...',MB_OK+MB_ICONWARNING+MB_DEFBUTTON1);
		ext.Free;
		lblModalResult.Caption:='0';
		exit;
	end;
	ext.Free;
	lblModalResult.Caption:='1';
	Close;
end;

function TImportForm.CountFiles(Directory, OfType: String): Integer;
var
        a,c: Integer;
        SearchRec: TSearchRec;
begin
        c:=0;
        a:=FindFirst(Directory+'\'+OfType,faanyfile,SearchRec);
        while a=0 do
        begin
                if SearchRec.Name[1]<>'.' then Inc(c);
                a:=FindNext(SearchRec);
        end;
        FindClose(SearchRec);
        Result:=c;
end;

procedure TImportForm.btnNoClick(Sender: TObject);
begin
	lblModalResult.Caption:='2';
	Close;
end;

end.
