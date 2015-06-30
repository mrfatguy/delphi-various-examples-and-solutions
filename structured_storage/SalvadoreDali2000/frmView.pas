unit frmView;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, pasStructureStore, StdCtrls, ExtCtrls,
  ComCtrls, Buttons, jpeg, gifimage, Menus, ShellAPI,
  clipbrd, RogerColorComboBox, ExtDlgs, printers, ImageButton;

type
  TViewAlbum = class(TForm)
    pnlMenu: TPanel;
    nTab: TNotebook;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    eFile: TEdit;
    eProducer: TEdit;
    eWeb: TEdit;
    eCopy: TEdit;
    mExtraInfo: TMemo;
    eTitle: TEdit;
    eDesc: TEdit;
    sbOpen: TSpeedButton;
    sbShowPicture: TSpeedButton;
    sbShowInfo: TSpeedButton;
    btnWebsite: TBitBtn;
    MainLogo: TImage;
    mSource: TMemo;
    sbPrev: TSpeedButton;
    odAlbumFile: TOpenDialog;
    SpeedButton2: TSpeedButton;
    sbNext: TSpeedButton;
    lblDesc: TLabel;
    lblDescShadow: TLabel;
    eDate: TEdit;
    Label1: TLabel;
    gbPass: TGroupBox;
    lblInfo: TLabel;
    Label2: TLabel;
    ePassword: TEdit;
    btnOK: TBitBtn;
    sbGoTo: TSpeedButton;
    pmGoTo: TPopupMenu;
    mnuGoTo: TMenuItem;
    N1: TMenuItem;
    mnuNext: TMenuItem;
    mnuPrev: TMenuItem;
    mnuLast: TMenuItem;
    mnuFirst: TMenuItem;
    N2: TMenuItem;
    mnuRandom: TMenuItem;
    sbFullScreen: TSpeedButton;
    sbMain: TPanel;
    Panels0: TLabel;
    Panels1: TLabel;
    Panels2: TLabel;
    pnlInfo: TPanel;
    gbPhoto: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    lblTitle: TLabel;
    lblAuthor: TLabel;
    lblDims: TLabel;
    Label6: TLabel;
    gbDesc: TGroupBox;
    lblTableDesc: TLabel;
    sbShowTable: TSpeedButton;
    imgPic: TPaintBox;
    pmRedist: TPopupMenu;
    mnuCopyToClipboard: TMenuItem;
    mnuSaveAs: TMenuItem;
    mnuPrint: TMenuItem;
    sbExport: TSpeedButton;
    N3: TMenuItem;
    rvccBack: TRogerColorComboBox;
    spDialog: TSavePictureDialog;
    pdDialog: TPrintDialog;
    psDialog: TPrinterSetupDialog;
    mnuPrinterSettings: TMenuItem;
    pmPic: TPopupMenu;
    mnuPicGoTo: TMenuItem;
    mnuPicExport: TMenuItem;
    mnuOpenAlbum: TMenuItem;
    N4: TMenuItem;
    mnuShow: TMenuItem;
    N5: TMenuItem;
    mnuFullScreen: TMenuItem;
    mnuShowPhoto: TMenuItem;
    mnuShowInfo: TMenuItem;
    mnuShowIndex: TMenuItem;
    N6: TMenuItem;
    mnuShowInfoTable: TMenuItem;
    sbShowIndex: TSpeedButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    scrIndex: TScrollBox;
    procedure SaveProgramSettings;
    procedure LoadProgramSettings;
    procedure OpenAlbum(FileName: String);
    procedure CleanAlbum();
    procedure ShowPhoto(PhotoNumber: Integer);
    procedure FillInfoForm;
    procedure PrevPhoto;
    procedure NextPhoto;
    procedure CheckUpPass;
    procedure ProcessKeys(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CreateDynaMenus;
    procedure DrawMinis;
    procedure IndexPictureClick(Sender: TObject);

    function ParseDate(Date: TDateTime): String;
    function LoadImageFromStream(PhotoNumber: Integer; Stream: TStream): TPicture;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbShowPictureClick(Sender: TObject);
    procedure sbShowInfoClick(Sender: TObject);
    procedure btnWebsiteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbOpenClick(Sender: TObject);
    procedure sbPrevClick(Sender: TObject);
    procedure sbNextClick(Sender: TObject);
    procedure pnlMenuMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormResize(Sender: TObject);
    procedure sbMainDblClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure sbGoToClick(Sender: TObject);
    procedure mnuNextClick(Sender: TObject);
    procedure mnuPrevClick(Sender: TObject);
    procedure mnuRandomClick(Sender: TObject);
    procedure mnuLastClick(Sender: TObject);
    procedure mnuFirstClick(Sender: TObject);
    procedure mnuGoToClick(Sender: TObject);
    procedure sbFullScreenClick(Sender: TObject);
    procedure sbShowTableClick(Sender: TObject);
    procedure rvccBackColorChange(Sender: TObject);
    procedure imgPicPaint(Sender: TObject);
    procedure ProcessMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ProcessMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ProcessMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sbExportClick(Sender: TObject);
    procedure mnuCopyToClipboardClick(Sender: TObject);
    procedure mnuSaveAsClick(Sender: TObject);
    procedure mnuPrintClick(Sender: TObject);
    procedure mnuPrinterSettingsClick(Sender: TObject);
    procedure sbShowIndexClick(Sender: TObject);
    procedure mnuShowInfoTableClick(Sender: TObject);
  private
     CurrentFormState: TWindowState;
     ButtonsCreated, CurrentFormWidth, CurrentFormHeight, CurrentFormTop, CurrentFormLeft: Integer;
     FullScreen: Boolean;
     tPic: TPicture;
     MD: Boolean;
     P: TPoint;
     imb: array [0..999] of TImageButton;
  public
     CurrentFileName: String;
     CurrentPhotoNumber: Integer;
     GeneralInfo, Photos: TStringList;
     StorageCompnentBusy, AwaitingPassword, PasswordGiven: Boolean;
  end;

var
  ViewAlbum: TViewAlbum;

implementation

uses frmPhotoInfo, pasProcs;

{$R *.DFM}

procedure TViewAlbum.OpenAlbum(FileName: String);
var
	Store: TStructuredStorage;
	ms: TMemoryStream;
	cPage: String;
begin
	Screen.Cursor:=crHourglass;

	AwaitingPassword:=False;
	PasswordGiven:=False;
	cPage:=nTab.ActivePage;

	if StorageCompnentBusy=True then exit;
	//Otwarcie pliku
	Store:=TStructuredStorage.Create;
	Store.OpenStorageFile(FileName, False);
	StorageCompnentBusy:=True;

	//Odczytanie podstawowych danych
	ms:=Store.GetItem('AlbumGeneralInfo');
	GeneralInfo.LoadFromStream(ms);
	ms:=Store.GetItem('AlbumExtraInfo');
	mExtraInfo.Lines.LoadFromStream(ms);
	ms:=Store.GetItem('Photos');
	Photos.LoadFromStream(ms);

	mSource.Clear;
	mSource.Text:=GeneralInfo.Text;
	mSource.Text:=mSource.Text+Photos.Text;

	//Wype³nienie pól informacji podstawowych
	ViewAlbum.Caption:='Album: '+GeneralInfo.Values['AlbumTitle'];

	eTitle.Text:=GeneralInfo.Values['AlbumTitle'];
	eProducer.Text:=GeneralInfo.Values['AlbumProducer'];
	eDesc.Text:=GeneralInfo.Values['AlbumDesc'];
	eFile.Text:=CurrentFileName;
	eWeb.Text:=GeneralInfo.Values['AlbumWeb'];
	eCopy.Text:=GeneralInfo.Values['AlbumCopyright'];
	eDate.Text:=ParseDate(StrToDateTime(GeneralInfo.Values['AlbumCreationDate']))+' o '+Copy(GeneralInfo.Values['AlbumCreationDate'],12,8);

	if eWeb.Text='' then btnWebsite.Enabled:=False else btnWebsite.Enabled:=True;

	//Zamkniecie pliku i zwolnienie zasobów
	Store.CloseStorageFile;
	Store.Free;
	ms.Free;
	StorageCompnentBusy:=False;

	CurrentFileName:=FileName;
	CurrentPhotoNumber:=0;

	if (GeneralInfo.Values['AlbumStartupPass']='1') and (GeneralInfo.Values['Password']<>'') then
	begin
		lblInfo.Caption:='Album chroniony has³em';
		nTab.ActivePage:='Pass';
		Color:=clBtnFace;
		AwaitingPassword:=True;
		ePassword.SetFocus;
	end
	else ShowPhoto(CurrentPhotoNumber);

	Screen.Cursor:=crDefault;
end;

procedure TViewAlbum.CleanAlbum();
begin
	CurrentFileName:='';
	ViewAlbum.Caption:='Album: ';
	eTitle.Text:='';
	eProducer.Text:='';
	eDesc.Text:='';
	eFile.Text:='';
	eWeb.Text:='';
	eCopy.Text:='';
	mExtraInfo.Clear;
	btnWebsite.Enabled:=False;
end;

procedure TViewAlbum.FormCreate(Sender: TObject);
begin
	LoadProgramSettings;

	GeneralInfo:=TStringList.Create;
	Photos:=TStringList.Create;
	tPic:=TPicture.Create;

	odAlbumFile.InitialDir:=ExtractFilePath(Application.ExeName);
	spDialog.InitialDir:=ExtractFilePath(Application.ExeName);
	btnWebsite.Caption:='Kliknij, aby odwiedziæ'+chr(13)+'stronê internetow¹'+chr(13)+'twórcy tego albumu';

	FullScreen:=False;
	ButtonsCreated:=0;
	Randomize;

	CreateDynaMenus;
end;

procedure TViewAlbum.FormDestroy(Sender: TObject);
begin
	SaveProgramSettings;
	GeneralInfo.Free;
	Photos.Free;
	tPic.Free;
end;

procedure TViewAlbum.FormShow(Sender: TObject);
begin
	if not FileExists(CurrentFileName) then
	begin
		if not odAlbumFile.Execute then exit;
		CurrentFileName:=odAlbumFile.FileName;
	end;
	if CurrentFileName<>'' then OpenAlbum(CurrentFileName);
end;

procedure TViewAlbum.sbShowPictureClick(Sender: TObject);
begin
	if AwaitingPassword=True then exit;
	nTab.ActivePage:='Picture';
	Color:=rvccBack.ColorValue;
	mnuShowPhoto.Checked:=True;
	sbShowPicture.Down:=True;
end;

procedure TViewAlbum.sbShowInfoClick(Sender: TObject);
begin
	if AwaitingPassword=True then exit;
	nTab.ActivePage:='Info';
	Color:=clBtnFace;
	mnuShowInfo.Checked:=True;
	sbShowInfo.Down:=True;
end;

procedure TViewAlbum.sbShowIndexClick(Sender: TObject);
begin
	if AwaitingPassword=True then exit;
	if CurrentFileName='' then exit;

	nTab.ActivePage:='Index';
	Color:=rvccBack.ColorValue;
	scrIndex.Color:=Color;
	mnuShowIndex.Checked:=True;
	sbShowIndex.Down:=True;

	DrawMinis;
end;

procedure TViewAlbum.btnWebsiteClick(Sender: TObject);
begin
	ShellExecute(Handle,'open',PChar(eWeb.Text),'','',SW_SHOW);
end;

procedure TViewAlbum.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	CleanAlbum();
end;

procedure TViewAlbum.sbOpenClick(Sender: TObject);
begin
	if not odAlbumFile.Execute then exit;
	CurrentFileName:=odAlbumFile.FileName;
	if not FileExists(CurrentFileName) then exit;
	OpenAlbum(CurrentFileName);
end;

procedure TViewAlbum.ShowPhoto(PhotoNumber: Integer);
var
	Store: TStructuredStorage;
	ms: TMemoryStream;
	cPage: String;
begin
	if CurrentFileName='' then exit;
	Screen.Cursor:=crHourglass;
	cPage:=nTab.ActivePage;

	if StorageCompnentBusy=True then exit;
	Store:=TStructuredStorage.Create;
	Store.OpenStorageFile(CurrentFileName, False);
	ms:=Store.GetItem('pic'+IntToStr(PhotoNumber));
	StorageCompnentBusy:=True;

	tPic.Assign(LoadImageFromStream(PhotoNumber,ms));
	imgPic.Invalidate;

	Store.CloseStorageFile;
	Store.Free;
	ms.Free;
	StorageCompnentBusy:=False;

	if PhotoNumber=0 then
	begin
		PhotoInfoForm.sbPrev.Enabled:=False;
		sbPrev.Enabled:=False;
		mnuPrev.Enabled:=False;
		mnuPicGoTo.Items[3].Enabled:=False;
	end
	else
	begin
		PhotoInfoForm.sbPrev.Enabled:=True;
		sbPrev.Enabled:=True;
		mnuPrev.Enabled:=True;
		mnuPicGoTo.Items[3].Enabled:=True;
	end;
	if PhotoNumber=StrToIntDef(Photos.Values['PhotoCount'],1)-1 then
	begin
		PhotoInfoForm.sbNext.Enabled:=False;
		sbNext.Enabled:=False;
		mnuNext.Enabled:=False;
		mnuPicGoTo.Items[2].Enabled:=False;
	end
	else
	begin
		PhotoInfoForm.sbNext.Enabled:=True;
		sbNext.Enabled:=True;
		mnuNext.Enabled:=True;
		mnuPicGoTo.Items[2].Enabled:=True;
	end;

	FillInfoForm;

	CurrentPhotoNumber:=PhotoNumber;
	if (Photos.Values['Photo'+IntToStr(PhotoNumber)+'Pass']='1') and (not PasswordGiven) and (GeneralInfo.Values['Password']<>'') then
	begin
                lblInfo.Caption:='Fotografia chroniona has³em';
		nTab.ActivePage:='Pass';
		Color:=clBtnFace;
		ePassword.SetFocus;
	end
	else
	begin
		if cPage='Picture' then sbShowPictureClick(self);
		if cPage='Info' then sbShowInfoClick(self);
		if cPage='Index' then sbShowIndexClick(self);
	end;
	Screen.Cursor:=crDefault;
end;

procedure TViewAlbum.PrevPhoto;
begin
	if AwaitingPassword=True then exit;
	if CurrentFileName='' then exit;
	if CurrentPhotoNumber<1 then exit;

	Dec(CurrentPhotoNumber);
	ShowPhoto(CurrentPhotoNumber);
end;

procedure TViewAlbum.NextPhoto;
var
	max: Integer;
begin
	if AwaitingPassword=True then exit;
	if CurrentFileName='' then exit;

	max:=StrToIntDef(Photos.Values['PhotoCount'],0)-1;
	if max=-1 then exit;
	if CurrentPhotoNumber>max-1 then exit;

	Inc(CurrentPhotoNumber);
	ShowPhoto(CurrentPhotoNumber);
end;

procedure TViewAlbum.sbPrevClick(Sender: TObject);
begin
	PrevPhoto;
end;

procedure TViewAlbum.sbNextClick(Sender: TObject);
begin
	NextPhoto;
end;

procedure TViewAlbum.pnlMenuMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
	if AwaitingPassword=True then exit;
	if ((ssShift in Shift) and (ssCtrl in Shift)) then nTab.ActivePage:='Source';
end;

procedure TViewAlbum.ProcessKeys(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
	max: Integer;
begin
	//ShowMessage(IntToStr(Key));
	if (Key=38) or (Key=37) or (Key=33) or (Key=8) then PrevPhoto;
	if (Key=39) or (Key=40) or (Key=34) or (Key=32) then NextPhoto;
	if Key=36 then ShowPhoto(0);
	if Key=35 then
	begin
		max:=StrToIntDef(Photos.Values['PhotoCount'],0)-1;
		if max=-1 then exit;
		ShowPhoto(max);
	end;

	if (ssCtrl in Shift) and (Key=83) then mnuSaveAsClick(self);
	if (ssCtrl in Shift) and (Key=82) then mnuRandomClick(self);
	if (ssCtrl in Shift) and (Key=80) then mnuPrintClick(self);
	if (ssCtrl in Shift) and (Key=79) then sbOpenClick(self);
	if (ssCtrl in Shift) and (Key=71) then mnuGoToClick(self);
	if (ssCtrl in Shift) and (Key=67) then mnuCopyToClipboardClick(self);
	if Key=116 then sbShowPictureClick(self);
	if Key=117 then sbShowInfoClick(self);
	if Key=118 then sbShowIndexClick(self);

	if (ssCtrl in Shift) and (Key=73) then
	begin
		sbShowTable.Down:= not sbShowTable.Down;
		sbShowTableClick(self);
	end;

        if Key=122 then sbFullScreenClick(self);
	if (FullScreen=True) and (Key=27) then sbFullScreenClick(self);
end;

procedure TViewAlbum.FormResize(Sender: TObject);
begin
	Panels2.Left:=sbMain.Width-Panels2.Width-4;
	Panels1.Left:=(sbMain.Width div 2)-(Panels1.Width div 2);

	lblDescShadow.Width:=imgPic.Width-24;
	lblDescShadow.Top:=imgPic.Height-50-10;
	lblDescShadow.BringToFront;

	lblDesc.Width:=imgPic.Width-24;
	lblDesc.Top:=imgPic.Height-50-12;
	lblDesc.BringToFront;

	gbPass.Top:=(nTab.Height div 2)-(gbPass.Height div 2);
	gbPass.Left:=(nTab.Width div 2)-(gbPass.Width div 2);

	eFile.Width:=Width-264;
	eTitle.Width:=Width-264;
	eProducer.Width:=Width-264;
	eDesc.Width:=Width-264;
	eWeb.Width:=Width-264;
	eCopy.Width:=Width-264;
	eDate.Width:=Width-264;
	mExtraInfo.Width:=Width-105;
	mExtraInfo.Height:=nTab.Height-213;
	Label22.Top:=mExtraInfo.Top+(mExtraInfo.Height div 2)-(Label22.Height div 2);
	btnWebsite.Left:=Width-165;
	MainLogo.Left:=Width-160;

	rvccBack.Left:=Width-152;

	if nTab.ActivePage='Index' then DrawMinis;
end;

procedure TViewAlbum.FillInfoForm;
var
	cPhotoRedis, cPhotoMax, cPhotoNum, cPhotoType, cPhotoAuthor, cPhotoPass, cPhotoTitle, cPhotoDesc: String;
begin
	cPhotoTitle:=Photos.Values['Photo'+IntToStr(CurrentPhotoNumber)+'Title'];
	cPhotoDesc:=Photos.Values['Photo'+IntToStr(CurrentPhotoNumber)+'Desc'];

	Panels0.Caption:='Fotografia '+IntToStr(CurrentPhotoNumber+1)+' z '+Photos.Values['PhotoCount'];
	Panels1.Caption:=cPhotoTitle;
	Panels2.Caption:=Photos.Values['Photo'+IntToStr(CurrentPhotoNumber)+'Author'];

	if cPhotoDesc<>'' then
	begin
		lblDescShadow.Caption:=cPhotoDesc;
		lblDesc.Caption:=cPhotoDesc;
		lblDescShadow.Visible:=True;
		lblDesc.Visible:=True;

		lblDescShadow.Width:=imgPic.Width-24;
		lblDescShadow.Top:=imgPic.Height-50-10;
		lblDescShadow.BringToFront;

		lblDesc.Width:=imgPic.Width-24;
		lblDesc.Top:=imgPic.Height-50-12;
		lblDesc.BringToFront;
	end
	else
	begin
		lblDescShadow.Visible:=False;
		lblDesc.Visible:=False;
	end;

	Panels2.Left:=sbMain.Width-Panels2.Width-4;
	Panels1.Left:=(sbMain.Width div 2)-(Panels1.Width div 2);
	cPhotoTitle:=Photos.Values['Photo'+IntToStr(CurrentPhotoNumber)+'Title'];
	cPhotoAuthor:=Photos.Values['Photo'+IntToStr(CurrentPhotoNumber)+'Author'];
	cPhotoDesc:=Photos.Values['Photo'+IntToStr(CurrentPhotoNumber)+'Desc'];
	cPhotoType:=Photos.Values['Photo'+IntToStr(CurrentPhotoNumber)+'Type'];
	if (Photos.Values['Photo'+IntToStr(CurrentPhotoNumber)+'Pass']='1') and (GeneralInfo.Values['Password']<>'') then cPhotoPass:='tak' else cPhotoPass:='nie';
	if Photos.Values['Photo'+IntToStr(CurrentPhotoNumber)+'Redist']='1' then cPhotoRedis:='tak' else cPhotoRedis:='nie';
	cPhotoNum:=IntToStr(CurrentPhotoNumber+1);
	cPhotoMax:=Photos.Values['PhotoCount'];

	if cPhotoTitle<>'' then
	begin
		PhotoInfoForm.lblTitle.Caption:=cPhotoTitle;
		lblTitle.Caption:=cPhotoTitle;
	end
	else
	begin
		PhotoInfoForm.lblTitle.Caption:='';
		lblTitle.Caption:='';
	end;
	if cPhotoAuthor<>'' then
	begin
		PhotoInfoForm.lblAuthor.Caption:=cPhotoAuthor;
		lblAuthor.Caption:=cPhotoAuthor;
	end
	else
	begin
		PhotoInfoForm.lblAuthor.Caption:='';
		lblAuthor.Caption:='';
	end;
	if cPhotoDesc<>'' then
	begin
		PhotoInfoForm.lblDesc.Caption:=cPhotoDesc;
		lblTableDesc.Caption:=cPhotoDesc;
		pnlInfo.Height:=146;
		gbDesc.Show;
	end
	else
	begin
		PhotoInfoForm.lblDesc.Caption:='';
		lblTableDesc.Caption:='';
		pnlInfo.Height:=67;
		gbDesc.Hide;
	end;
	PhotoInfoForm.lblNumber.Caption:=cPhotoNum+' z '+cPhotoMax;
	gbPhoto.Caption:='Fotografia '+cPhotoNum+' z '+cPhotoMax;
	PhotoInfoForm.lblType.Caption:=cPhotoType;
	PhotoInfoForm.lblPass.Caption:=cPhotoPass;
	PhotoInfoForm.lblRedist.Caption:=cPhotoRedis;

	PhotoInfoForm.lblDims.Caption:=IntToStr(tPic.Width)+'x'+IntToStr(tPic.Height);
	PhotoInfoForm.Label6.Left:=PhotoInfoForm.lblDims.Left-50;
	lblDims.Caption:=IntToStr(tPic.Width)+'x'+IntToStr(tPic.Height);
	Label6.Left:=lblDims.Left-50;
end;

procedure TViewAlbum.sbMainDblClick(Sender: TObject);
begin
	if AwaitingPassword=True then exit;
	PhotoInfoForm.ShowModal;
end;

function TViewAlbum.ParseDate(Date: TDateTime): String;
var
	data: String;
	a: Integer;
const
	months_org :array[1..12] of String = ('styczeñ','luty','marzec','kwiecieñ','maj','czerwiec','lipiec','sierpieñ','wrzesieñ','paŸdziernik','listopad','grudzieñ');
	months_my :array[1..12] of String = ('stycznia','lutego','marca','kwietnia','maja','czerwca','lipca','sierpnia','wrzeœnia','paŸdziernika','listopada','grudnia');
begin
	data:=FormatDateTime('dddddd',Date);
	for a:=1 to 12 do data:=StringReplace(data,months_org[a],months_my[a],[rfReplaceAll]);
        Result:=data+' r.';
end;

procedure TViewAlbum.CheckUpPass;
var
	pass: String;
begin
	pass:=GeneralInfo.Values['Password'];
	if ePassword.Text=pass then
	begin
		AwaitingPassword:=False;
		PasswordGiven:=True;
		ShowPhoto(CurrentPhotoNumber);
	end
	else
	begin
		Application.MessageBox('Wprowadzone has³o jest NIEPRAWID£OWE!','B³¹d!',MB_OK+MB_ICONERROR+MB_DEFBUTTON1);
		ePassword.Text:='';
		ePassword.SetFocus;
	end;
end;

procedure TViewAlbum.btnOKClick(Sender: TObject);
begin
	CheckUpPass;
end;

procedure TViewAlbum.sbGoToClick(Sender: TObject);
begin
	pmGoTo.Popup(ViewAlbum.Left+sbGoTo.Left+3,ViewAlbum.Top+sbGoTo.Top+sbGoTo.Height+24);
end;

procedure TViewAlbum.mnuNextClick(Sender: TObject);
begin
	NextPhoto;
end;

procedure TViewAlbum.mnuPrevClick(Sender: TObject);
begin
	PrevPhoto;
end;

procedure TViewAlbum.mnuRandomClick(Sender: TObject);
var
	rnd, max: Integer;
begin
	if AwaitingPassword=True then exit;
	if CurrentFileName='' then exit;
	
	max:=StrToIntDef(Photos.Values['PhotoCount'],-1);
	if max=-1 then exit;
	rnd:=Random(max);
	ShowPhoto(rnd);
end;

procedure TViewAlbum.mnuLastClick(Sender: TObject);
var
	max: Integer;
begin
	if AwaitingPassword=True then exit;
	if CurrentFileName='' then exit;
	
	max:=StrToIntDef(Photos.Values['PhotoCount'],0)-1;
	if max=-1 then exit;
	ShowPhoto(max);
end;

procedure TViewAlbum.mnuFirstClick(Sender: TObject);
begin
	if AwaitingPassword=True then exit;
	if CurrentFileName='' then exit;
	
	ShowPhoto(0);
end;

procedure TViewAlbum.mnuGoToClick(Sender: TObject);
var
	go, max: Integer;
	ret,mess: String;
begin
	if AwaitingPassword=True then exit;
	if CurrentFileName='' then exit;
	
	max:=StrToIntDef(Photos.Values['PhotoCount'],0);
	if max=-1 then exit;
	mess:='Podaj numer fotografii (od 1 do '+IntToStr(max+1)+'), któr¹ chcesz wyœwietliæ.';
	ret:=MyInputDialog('IdŸ do...',mess,IntToStr(CurrentPhotoNumber+1), False);
	if ret='$#CANCEL%#$' then exit;
	go:=StrToIntDef(ret,-1);
	if (go<1) or (go=CurrentPhotoNumber+1) or (go>max) then exit;
        ShowPhoto(go-1);
end;

procedure TViewAlbum.SaveProgramSettings;
var
	sett: TStringList;
begin
	sett:=TStringList.Create;

	if ViewAlbum.WindowState=wsMaximized then sett.Values['AlbumFormState']:='max' else sett.Values['AlbumFormState']:='normal';
	sett.Values['AlbumLeft']:=IntToStr(ViewAlbum.Left);
	sett.Values['AlbumTop']:=IntToStr(ViewAlbum.Top);
	sett.Values['AlbumWidth']:=IntToStr(ViewAlbum.Width);
	sett.Values['AlbumHeight']:=IntToStr(ViewAlbum.Height);
	sett.Values['AlbumBackColor']:=ColorToString(rvccBack.ColorValue);
	sett.Values['TableLeft']:=IntToStr(pnlInfo.Left);
	sett.Values['TableTop']:=IntToStr(pnlInfo.Top);
	sett.Values['TableVisible']:=IntToStr(Ord(pnlInfo.Visible));

	sett.SaveToFile(ExtractFilePath(Application.ExeName)+'sdali2k.dat');
	sett.Free;
end;

procedure TViewAlbum.LoadProgramSettings;
var
	sett: TStringList;
begin
	if not FileExists(ExtractFilePath(Application.ExeName)+'sdali2k.dat') then exit;
	sett:=TStringList.Create;
	sett.LoadFromFile(ExtractFilePath(Application.ExeName)+'sdali2k.dat');

	if sett.Values['AlbumFormState']='max' then
	begin
		ViewAlbum.WindowState:=wsMaximized
	end
	else
	begin
		ViewAlbum.WindowState:=wsNormal;
		ViewAlbum.Left:=StrToIntDef(sett.Values['AlbumLeft'],192);
		ViewAlbum.Top:=StrToIntDef(sett.Values['AlbumTop'],107);
		ViewAlbum.Width:=StrToIntDef(sett.Values['AlbumWidth'],600);
		ViewAlbum.Height:=StrToIntDef(sett.Values['AlbumHeight'],400);
	end;

	pnlInfo.Left:=StrToIntDef(sett.Values['TableLeft'],8);
	pnlInfo.Top:=StrToIntDef(sett.Values['TableTop'],8);
	pnlInfo.Visible:=(StrToIntDef(sett.Values['TableVisible'],0) = 1);
	sbShowTable.Down:=(StrToIntDef(sett.Values['TableVisible'],0) = 1);
	mnuShowInfoTable.Checked:=sbShowTable.Down;

	try
		ViewAlbum.Color:=StringToColor(sett.Values['AlbumBackColor']);
	except
		on EConvertError do ViewAlbum.Color:=clBlack;
	end;
	rvccBack.ColorValue:=ViewAlbum.Color;
	sett.Free;
end;

procedure TViewAlbum.sbFullScreenClick(Sender: TObject);
var
	tPhoto: Integer;
begin
	if (AwaitingPassword=True) or (CurrentFileName='') then
	begin
		sbFullScreen.Down:=False;
		mnuFullScreen.Checked:=False;
		exit;
	end;
	
	if FullScreen=False then
	begin
		CurrentFormWidth:=ViewAlbum.Width;
		CurrentFormHeight:=ViewAlbum.Height;
		CurrentFormTop:=ViewAlbum.Top;
		CurrentFormLeft:=ViewAlbum.Left;
		CurrentFormState:=ViewAlbum.WindowState;

		mnuFullScreen.Checked:=True;
		tPhoto:=CurrentPhotoNumber;
		pnlMenu.Hide;
		sbMain.Hide;
		ViewAlbum.BorderStyle:=bsNone;
		ViewAlbum.WindowState:=wsMaximized;
		FullScreen:=True;
		ShowPhoto(tPhoto);
	end
	else
	begin
		ViewAlbum.Width:=CurrentFormWidth;
		ViewAlbum.Height:=CurrentFormHeight;
		ViewAlbum.Top:=CurrentFormTop;
		ViewAlbum.Left:=CurrentFormLeft;
		ViewAlbum.WindowState:=CurrentFormState;

		mnuFullScreen.Checked:=False;
		tPhoto:=CurrentPhotoNumber;
		pnlMenu.Show;
		sbMain.Show;
		ViewAlbum.BorderStyle:=bsSizeable;
		FullScreen:=False;
		ShowPhoto(tPhoto);
	end;
end;

procedure TViewAlbum.sbShowTableClick(Sender: TObject);
begin
	pnlInfo.Visible:=sbShowTable.Down;
	mnuShowInfoTable.Checked:=sbShowTable.Down;
end;

procedure TViewAlbum.rvccBackColorChange(Sender: TObject);
begin
	nTab.SetFocus;
	if nTab.ActivePage='Picture' then Color:=rvccBack.ColorValue;
	if nTab.ActivePage='Index' then
	begin
		Color:=rvccBack.ColorValue;
		DrawMinis;
	end;
end;

procedure TViewAlbum.imgPicPaint(Sender: TObject);
var
	DrawRect: TRect;
	sPreviewDesc: String;
begin
	DrawRect := imgPic.ClientRect;
	if tPic.Width > 0 then
	begin
		with DrawRect do
		begin
			if (tPic.Width > Right - Left) or (tPic.Height > Bottom - Top) then
			begin
				if tPic.Width > tPic.Height then
				begin
					Bottom := Top + MulDiv(tPic.Height, Right - Left, tPic.Width);
					Top:=(imgPic.Height div 2) - (Bottom div 2);
					Inc(Bottom,Top);
				end
				else
				begin
					Right:=Left + MulDiv(tPic.Width, Bottom - Top, tPic.Height);
					Left:=(imgPic.Width div 2) - (Right div 2);
					Inc(Right,Left);
				end;
				imgPic.Canvas.StretchDraw(DrawRect, tPic.Graphic);
				end
			else
			begin
				with DrawRect do
				begin
					imgPic.Canvas.Draw(Left + (Right - Left - tPic.Width) div 2, Top + (Bottom - Top - tPic.Height) div 2, tPic.Graphic);
				end;
			end;
		end;
	end
	else
	begin
		with DrawRect, Canvas do
		begin
			sPreviewDesc:='Fotografia niedostêpna';
			TextOut(Left + (Right - Left - TextWidth(sPreviewDesc)) div 2, Top + (Bottom - Top - TextHeight(sPreviewDesc)) div 2, sPreviewDesc);
		end;
	end;
end;

procedure TViewAlbum.ProcessMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
	MD:=True;
  	P:=Point(X, Y);
end;

procedure TViewAlbum.ProcessMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
	if MD then
	begin
		pnlInfo.Left:=pnlInfo.Left+(X-P.X);
		pnlInfo.Top:=pnlInfo.Top+(Y-P.Y);
	end;
end;

procedure TViewAlbum.ProcessMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
	MD:=False;
end;

procedure TViewAlbum.sbExportClick(Sender: TObject);
begin
	pmRedist.Popup(ViewAlbum.Left+sbExport.Left+3,ViewAlbum.Top+sbExport.Top+sbExport.Height+24);
end;

procedure TViewAlbum.mnuCopyToClipboardClick(Sender: TObject);
var
	clp: TClipboard;
begin
	if AwaitingPassword=True then exit;
	if CurrentFileName='' then exit;

	if Photos.Values['Photo'+IntToStr(CurrentPhotoNumber)+'Redist']<>'1' then
	begin
		Application.MessageBox('Aktualnie wyœwietlona fotografia ma zablokowan¹ opcjê redystrybucji, dlatego te¿ nie mo¿na jej skopiowaæ do Schowka.','Ostrze¿enie...',MB_OK+MB_ICONWARNING+MB_DEFBUTTON1);
		exit;
	end;
	
	if Photos.Values['Photo'+IntToStr(CurrentPhotoNumber)+'Type']='ikona' then
	begin
		Application.MessageBox('Nie mo¿na skopiowaæ ikony - ten format nie jest obs³ugiwany przez Schowek.','Ostrze¿enie...',MB_OK+MB_ICONWARNING+MB_DEFBUTTON1);
	end
	else
	begin
		clp:=TClipboard.Create;
		clp.Assign(tPic);
		clp.Free;
	end;
end;

procedure TViewAlbum.mnuSaveAsClick(Sender: TObject);
begin
	if AwaitingPassword=True then exit;
	if CurrentFileName='' then exit;
	
	if Photos.Values['Photo'+IntToStr(CurrentPhotoNumber)+'Redist']<>'1' then
	begin
		Application.MessageBox('Aktualnie wyœwietlona fotografia ma zablokowan¹ opcjê redystrybucji, dlatego te¿ nie mo¿na jej zapisaæ.','Ostrze¿enie...',MB_OK+MB_ICONWARNING+MB_DEFBUTTON1);
		exit;
	end;
	
	if not spDialog.Execute then exit;
	tPic.SaveToFile(spDialog.FileName);
end;

procedure TViewAlbum.mnuPrintClick(Sender: TObject);
begin
	if AwaitingPassword=True then exit;
	if CurrentFileName='' then exit;
	
	if Photos.Values['Photo'+IntToStr(CurrentPhotoNumber)+'Redist']<>'1' then
	begin
		Application.MessageBox('Aktualnie wyœwietlona fotografia ma zablokowan¹ opcjê redystrybucji, dlatego te¿ nie mo¿na jej wydrukowaæ.','Ostrze¿enie...',MB_OK+MB_ICONWARNING+MB_DEFBUTTON1);
		exit;
	end;

	if not pdDialog.Execute then exit;
	with Printer do
	begin
		BeginDoc;
		Canvas.Draw((PageWidth - tPic.Width) div 2, (PageHeight - tPic.Height) div 2, tPic.Graphic);
		EndDoc;
	end;
end;

procedure TViewAlbum.mnuPrinterSettingsClick(Sender: TObject);
begin
	psDialog.Execute;
end;

procedure TViewAlbum.CreateDynaMenus;
var
	a: Integer;
	tMenu: TMenuItem;
begin
	for a:=0 to pmGoTo.Items.Count-1 do
	begin
		tMenu:=TMenuItem.Create(self);
		tMenu.Caption:=pmGoTo.Items[a].Caption;
		tMenu.Enabled:=pmGoTo.Items[a].Enabled;
		tMenu.ShortCut:=pmGoTo.Items[a].ShortCut;
		tMenu.OnClick:=pmGoTo.Items[a].OnClick;
		mnuPicGoTo.Add(tMenu);
	end;
	for a:=0 to pmRedist.Items.Count-1 do
	begin
		tMenu:=TMenuItem.Create(self);
		tMenu.Caption:=pmRedist.Items[a].Caption;
		tMenu.Enabled:=pmRedist.Items[a].Enabled;
		tMenu.ShortCut:=pmRedist.Items[a].ShortCut;
		tMenu.OnClick:=pmRedist.Items[a].OnClick;
		mnuPicExport.Add(tMenu);
	end;
end;

procedure TViewAlbum.mnuShowInfoTableClick(Sender: TObject);
begin
	sbShowTable.Down:=not sbShowTable.Down;
	pnlInfo.Visible:=sbShowTable.Down;
	mnuShowInfoTable.Checked:=sbShowTable.Down;
end;

procedure TViewAlbum.DrawMinis;
var
	pWidth, pHeight, a, c, x,y, cRows, cPhotos, cInW: Integer;
	Store: TStructuredStorage;
	ms: TMemoryStream;
label
	enough_buttons;
begin
	if AwaitingPassword=True then exit;
	if CurrentFileName='' then exit;
	cPhotos:=StrToIntDef(Photos.Values['PhotoCount'],0);
	if cPhotos=0 then exit;

	Screen.Cursor:=crHourglass;
	scrIndex.Enabled:=False;

	if StorageCompnentBusy=True then exit;
	Store:=TStructuredStorage.Create;
	Store.OpenStorageFile(CurrentFileName, False);
	StorageCompnentBusy:=True;

	c:=0;
	//cInW:=(scrIndex.Width-20) div 190;
	cInW:=4;
	pWidth:=((scrIndex.ClientWidth-27) div cInW);
	Dec(pWidth,20);
	pHeight:=Trunc(pWidth / 1.333);
	cRows:=cPhotos div cInW;
	if (cRows*cInW)<cPhotos then Inc(cRows);

	if ButtonsCreated>0 then for a:=0 to ButtonsCreated-1 do
	begin
		imb[a].Free;
	end;

	for y:=0 to cRows-1 do
	begin
		for x:=0 to cInW-1 do
		begin
			if c=cPhotos then goto enough_buttons;
			imb[c]:=TImageButton.Create(scrIndex);
			imb[c].Parent:=scrIndex;
			imb[c].Width:=pWidth;
			imb[c].Height:=pHeight;
			imb[c].Left:=(x*pWidth)+10;
			imb[c].Top:=(y*pHeight)+10;

			ms:=Store.GetItem('pic'+IntToStr(c));
			imb[c].Picture.Assign(LoadImageFromStream(c,ms));
			imb[c].Invalidate;

			imb[c].BackColor:=scrIndex.Color;
			imb[c].Cursor:=crHandPoint;
			imb[c].DrawBorder:=False;

			imb[c].ShowHint:=True;
			imb[c].Hint:='Fotografia nr '+IntToStr(c+1)+'#Kliknij, aby wyœwietliæ fotografiê nr '+IntToStr(c+1);

			imb[c].Tag:=c;
			imb[c].OnClick:=IndexPictureClick;
			//imb[c].AlternativeText:='Fotografia nr '+IntToStr(c+1);
			Inc(c);
			ButtonsCreated:=c;
			Application.ProcessMessages;
		end;
	end;

enough_buttons:
	Store.CloseStorageFile;
	Store.Free;
	ms.Free;
	StorageCompnentBusy:=False;

        scrIndex.Enabled:=True;
	Screen.Cursor:=crDefault;
end;

procedure TViewAlbum.IndexPictureClick(Sender: TObject);
var
	ClickedPhoto: Integer;
begin
	if AwaitingPassword=True then exit;
	if CurrentFileName='' then exit;

	ClickedPhoto:=(Sender as TImageButton).Tag;
	nTab.ActivePage:='Picture';
	ShowPhoto(ClickedPhoto);
end;

function TViewAlbum.LoadImageFromStream(PhotoNumber: Integer; Stream: TStream): TPicture;
var
	cPhotoType: String;
	Error: Boolean;
	tempPic: TPicture;
	jpg: TJPEGImage;
	gif: TGIFImage;
begin
	tempPic:=TPicture.Create;
	Error:=True;
	cPhotoType:=Photos.Values['Photo'+IntToStr(PhotoNumber)+'Type'];

	if cPhotoType='bitmapa' then
	begin
		tempPic.Bitmap.LoadFromStream(Stream);
		spDialog.DefaultExt:='bmp';
		spDialog.Filter:='Bitmapy (*.bmp)|*.bmp';
		Error:=False;
	end;
	if cPhotoType='ikona' then
	begin
		tempPic.Icon.LoadFromStream(Stream);
		spDialog.DefaultExt:='ico';
		spDialog.Filter:='Ikony (*.ico)|*.ico';
		Error:=False;
	end;
	if cPhotoType='metaplik' then
	begin
		tempPic.Metafile.LoadFromStream(Stream);
		spDialog.DefaultExt:='emf';
		spDialog.Filter:='Ulepszone metapliki (*.emf)|*.emf|Metapliki (*.wmf)|*.wmf';
		Error:=False;
	end;
	if cPhotoType='JPEG' then
	begin
		jpg:=TJPEGImage.Create;
		jpg.LoadFromStream(Stream);
		tempPic.Assign(jpg);
		jpg.Free;
		spDialog.DefaultExt:='jpg';
		spDialog.Filter:='Fotografie JPG (*.jpg)|*.jpg|Fotografie JPEG (*.jpeg)|*.jpeg';
		Error:=False;
	end;
	if cPhotoType='GIF' then
	begin
		gif:=TGIFImage.Create;
		gif.LoadFromStream(Stream);
		gif.Transparent:=False;
		tempPic.Assign(gif);
		gif.Free;
		spDialog.DefaultExt:='gif';
		spDialog.Filter:='Statyczne GIFy (*.gif)|*.gif';
		Error:=False;
	end;

	if Error then tempPic:=nil;
	Result:=tempPic;
end;

end.
