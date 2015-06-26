unit sUnit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Spin, Buttons;

type
  TMainForm = class(TForm)
    Label1: TLabel;
    eFile: TEdit;
    btnOpen: TBitBtn;
    oDialog: TOpenDialog;
    Bevel1: TBevel;
    oDialogFile: TOpenDialog;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    eFileToAdd: TEdit;
    Label3: TLabel;
    eName: TEdit;
    btnFile: TBitBtn;
    pnlStatus: TPanel;
    btnAdd: TBitBtn;
    Label4: TLabel;
    TabSheet2: TTabSheet;
    Label5: TLabel;
    eNameChk: TEdit;
    Label6: TLabel;
    pnlStatusChk: TPanel;
    btnCheck: TBitBtn;
    TabSheet3: TTabSheet;
    Label7: TLabel;
    eString: TEdit;
    Button6: TButton;
    Label8: TLabel;
    sNumber: TSpinEdit;
    Button7: TButton;
    Label9: TLabel;
    rgLogical: TRadioGroup;
    Button8: TButton;
    eStringName: TEdit;
    eNumberName: TEdit;
    eLogicalName: TEdit;
    TabSheet4: TTabSheet;
    Label10: TLabel;
    eExtractName: TEdit;
    Label11: TLabel;
    pnlStatusE: TPanel;
    btnExtract: TBitBtn;
    Label12: TLabel;
    eFileToExtract: TEdit;
    btnExtractFile: TBitBtn;
    sDialog: TSaveDialog;
    TabSheet5: TTabSheet;
    btnAddAll: TBitBtn;
    btnOpenAll: TBitBtn;
    Label13: TLabel;
    oDialogAll: TOpenDialog;
    list: TListBox;
    list2: TListBox;
    btnCloseList: TButton;
    function GenerateIdentString(aName: String): String;

    procedure AddButtonClick(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure btnFileClick(Sender: TObject);
    procedure btnCheckClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure btnExtractFileClick(Sender: TObject);
    procedure btnExtractClick(Sender: TObject);
    procedure btnOpenAllClick(Sender: TObject);
    procedure btnAddAllClick(Sender: TObject);
    procedure btnCloseListClick(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

uses pasStructureStore;

procedure TMainForm.AddButtonClick(Sender: TObject);
var
        Store: TStructuredStorage;
begin
        Screen.Cursor:=crHourglass;
        if (eFile.Text='') or (eFileToAdd.Text='') or (eName.Text='') then
        begin
                Application.MessageBox('Najpierw wype≥nij prawid≥owo wszystkie pola...','Ostrzeøenie!',MB_OK+MB_ICONWARNING+MB_DEFBUTTON1);
                Screen.Cursor:=crDefault;
                exit;
        end;
        pnlStatus.Caption:='Dodawanie pliku...';
        Store:=TStructuredStorage.Create;
        Store.OpenStorageFile(eFile.Text, True);
        Store.AddItem(eName.Text,Store.LoadFromFile(eFileToAdd.Text));
        Store.CloseStorageFile;
        Store.Free;
        Screen.Cursor:=crDefault;
        pnlStatus.Caption:=' Plik '+ExtractFileName(eFileToAdd.Text)+' zosta≥ prawid≥owo dodany jako '+eName.Text+'...';
end;

procedure TMainForm.btnOpenClick(Sender: TObject);
var
        Store: TStructuredStorage;
begin
        if oDialog.Execute then
        begin
                if not FileExists(oDialog.FileName) then
                begin
                        Store:=TStructuredStorage.Create;
                        Store.CreateStorageFile(oDialog.FileName);
                        Store.CloseStorageFile;
                        Store.Free;
                end;
                eFile.Text:=oDialog.FileName;
        end;
end;

procedure TMainForm.btnFileClick(Sender: TObject);
begin
        if oDialogFile.Execute then
        begin
                eFileToAdd.Text:=oDialogFile.FileName;
                eName.Text:=GenerateIdentString(ChangeFileExt(ExtractFileName(oDialogFile.FileName),''));
        end;
end;

function TMainForm.GenerateIdentString(aName: String): String;
var
        a: Integer;
begin
        for a:=1 to Length(aName) do
        begin
                if aName[a]='Í' then aName[a]:=Char('e');
                if aName[a]='Û' then aName[a]:=Char('o');
                if aName[a]='π' then aName[a]:=Char('a');
                if aName[a]='ú' then aName[a]:=Char('s');
                if aName[a]='≥' then aName[a]:=Char('l');
                if aName[a]='ø' then aName[a]:=Char('z');
                if aName[a]='ü' then aName[a]:=Char('z');
                if aName[a]='Ê' then aName[a]:=Char('c');
                if aName[a]='Ò' then aName[a]:=Char('n');
                if aName[a]=' ' then aName[a]:=Char('e');
                if aName[a]='”' then aName[a]:=Char('o');
                if aName[a]='•' then aName[a]:=Char('a');
                if aName[a]='å' then aName[a]:=Char('s');
                if aName[a]='£' then aName[a]:=Char('l');
                if aName[a]='Ø' then aName[a]:=Char('z');
                if aName[a]='è' then aName[a]:=Char('z');
                if aName[a]='∆' then aName[a]:=Char('c');
                if aName[a]='—' then aName[a]:=Char('n');
                if aName[a]=' ' then aName[a]:=Char('_');
        end;
        Result:=aName;
end;


procedure TMainForm.btnCheckClick(Sender: TObject);
var
        Store: TStructuredStorage;
begin
        Screen.Cursor:=crHourglass;
        if (eFile.Text='') or (eNameChk.Text='') then
        begin
                Application.MessageBox('Najpierw wype≥nij prawid≥owo wszystkie pola...','Ostrzeøenie!',MB_OK+MB_ICONWARNING+MB_DEFBUTTON1);
                Screen.Cursor:=crDefault;
                exit;
        end;
        Store:=TStructuredStorage.Create;
        Store.OpenStorageFile(eFile.Text, False);
        if Store.CheckIfExist(eNameChk.Text) then
                pnlStatusChk.Caption:='Obiekt '+eNameChk.Text+' istnieje w zasobie...'
        else
                pnlStatusChk.Caption:='Obiekt '+eNameChk.Text+' nie zosta≥ znaleziony w zasobie...';
        Store.CloseStorageFile;
        Store.Free;
        Screen.Cursor:=crDefault;
end;

procedure TMainForm.Button6Click(Sender: TObject);
var
        Store: TStructuredStorage;
begin
        Screen.Cursor:=crHourglass;
        if (eFile.Text='') or (eString.Text='') or (eStringName.Text='') then
        begin
                Application.MessageBox('Najpierw wype≥nij prawid≥owo wszystkie pola...','Ostrzeøenie!',MB_OK+MB_ICONWARNING+MB_DEFBUTTON1);
                Screen.Cursor:=crDefault;
                exit;
        end;
        Store:=TStructuredStorage.Create;
        Store.OpenStorageFile(eFile.Text, True);
        Store.WriteString(eStringName.Text,eString.Text);
        Store.CloseStorageFile;
        Store.Free;
        Screen.Cursor:=crDefault;
        ShowMessage('£aÒcuch tekstowy dodany do zasobu jako '+eStringName.Text+'...');
end;

procedure TMainForm.Button7Click(Sender: TObject);
var
        Store: TStructuredStorage;
begin
        if (eFile.Text='') or (eNumberName.Text='') then
        begin
                Application.MessageBox('Najpierw wype≥nij prawid≥owo wszystkie pola...','Ostrzeøenie!',MB_OK+MB_ICONWARNING+MB_DEFBUTTON1);
                Screen.Cursor:=crDefault;
                exit;
        end;
        Screen.Cursor:=crHourglass;
        Store:=TStructuredStorage.Create;
        Store.OpenStorageFile(eFile.Text, True);
        Store.WriteInteger(eNumberName.Text,sNumber.Value);
        Store.CloseStorageFile;
        Store.Free;
        Screen.Cursor:=crDefault;
        ShowMessage('WartoúÊ liczbowa dodana do zasobu jako '+eNumberName.Text+'...');
end;

procedure TMainForm.Button8Click(Sender: TObject);
var
        Store: TStructuredStorage;
begin
        Screen.Cursor:=crHourglass;
        if (eFile.Text='') or (eLogicalName.Text='') then
        begin
                Application.MessageBox('Najpierw wype≥nij prawid≥owo wszystkie pola...','Ostrzeøenie!',MB_OK+MB_ICONWARNING+MB_DEFBUTTON1);
                Screen.Cursor:=crDefault;
                exit;
        end;
        Store:=TStructuredStorage.Create;
        Store.OpenStorageFile(eFile.Text, True);
        if rgLogical.ItemIndex=0 then Store.WriteBoolean(eLogicalName.Text,True) else Store.WriteBoolean(eLogicalName.Text,False);
        Store.CloseStorageFile;
        Store.Free;
        Screen.Cursor:=crDefault;
        ShowMessage('Wyraøenie logiczne dodane do zasobu jako '+eLogicalName.Text+'...');
end;

procedure TMainForm.btnExtractFileClick(Sender: TObject);
begin
        if sDialog.Execute then eFileToExtract.Text:=sDialog.FileName;
end;

procedure TMainForm.btnExtractClick(Sender: TObject);
var
        Store: TStructuredStorage;
        ms: TMemoryStream;
begin
        Screen.Cursor:=crHourglass;
        if (eFile.Text='') or (eExtractName.Text='') or (eFileToExtract.Text='') then
        begin
                Application.MessageBox('Najpierw wype≥nij prawid≥owo wszystkie pola...','Ostrzeøenie!',MB_OK+MB_ICONWARNING+MB_DEFBUTTON1);
                Screen.Cursor:=crDefault;
                exit;
        end;
        ms:=TMemoryStream.Create;
        Store:=TStructuredStorage.Create;
        Store.OpenStorageFile(eFile.Text, False);
        if Store.CheckIfExist(eExtractName.Text) then
        begin
                pnlStatusE.Caption:='Obiekt '+eExtractName.Text+' istnieje w zasobie...';
                ms:=Store.GetItem(eExtractName.Text);
                ms.SaveToFile(eFileToExtract.Text);
                pnlStatusE.Caption:='Obiekt '+eExtractName.Text+' wyodrÍbniono jako '+eFileToExtract.Text+'...';
        end
        else
                pnlStatusE.Caption:='Obiekt '+eExtractName.Text+' nie zosta≥ znaleziony w zasobie...';
        Store.CloseStorageFile;
        Store.Free;
        ms.Free;
        Screen.Cursor:=crDefault;
end;

procedure TMainForm.btnOpenAllClick(Sender: TObject);
begin
        if oDialogAll.Execute then
        begin
                list.Items.Clear;
                list.Items.Assign(oDialogAll.Files);
                ShowMessage('Wybrano '+IntToStr(list.Items.Count)+' plikÛw.');
        end;
end;

procedure TMainForm.btnAddAllClick(Sender: TObject);
var
        Store: TStructuredStorage;
        a: Integer;
        fil,nam: String;
begin
        Screen.Cursor:=crHourglass;
        if (eFile.Text='') or (List.Items.Count<1)  then
        begin
                Application.MessageBox('Najpierw wype≥nij prawid≥owo wszystkie pola...','Ostrzeøenie!',MB_OK+MB_ICONWARNING+MB_DEFBUTTON1);
                Screen.Cursor:=crDefault;
                exit;
        end;

        list2.Clear;
        list2.Show;
        btnCloseList.Show;

        Store:=TStructuredStorage.Create;
        Store.OpenStorageFile(eFile.Text, True);
        for a:=0 to list.Items.Count-1 do
        begin
                fil:=list.Items.Strings[a];
                nam:=GenerateIdentString(ChangeFileExt(ExtractFileName(fil),''));
                Store.AddItem(nam,Store.LoadFromFile(fil));
                list2.Items.Add('Dodano plik '+ExtractFileName(fil)+ ' jako ' +nam +'.');
                Application.ProcessMessages;
        end;
        Store.CloseStorageFile;
        Store.Free;
        Screen.Cursor:=crDefault;
        ShowMessage('Liczba dodanych plikÛw: '+IntToStr(a));
end;

procedure TMainForm.btnCloseListClick(Sender: TObject);
begin
        list2.Hide;
        btnCloseList.Hide;
end;

end.
