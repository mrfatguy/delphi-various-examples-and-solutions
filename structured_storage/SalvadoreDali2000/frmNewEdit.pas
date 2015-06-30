unit frmNewEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs,  StdCtrls, ExtCtrls, pasStructureStore,
  ComCtrls, ExtDlgs, Buttons, jpeg, gifimage, FileCtrl;

type
  TNewEditForm = class(TForm)
    pgMain: TPageControl;
    tsParams: TTabSheet;
    tsPhotos: TTabSheet;
    tsProgress: TTabSheet;
    pnlProgress: TPanel;
    Label8: TLabel;
    lblOp: TLabel;
    ProgressBar1: TProgressBar;
    gbInfo: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    ePassword: TEdit;
    eProducer: TEdit;
    eWeb: TEdit;
    eCopy: TEdit;
    mExtraInfo: TMemo;
    eTitle: TEdit;
    eDesc: TEdit;
    gbPhotos: TGroupBox;
    lbPhotos: TListBox;
    pnlPreview: TPanel;
    gbSettings: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ePhotoTitle: TEdit;
    ePhotoAuthor: TEdit;
    ePhotoDesc: TEdit;
    chbHasPass: TCheckBox;
    Label11: TLabel;
    lblPhotoCount: TLabel;
    eFile: TEdit;
    Label10: TLabel;
    Label12: TLabel;
    btnSelectPhotoFile: TButton;
    opDialog: TOpenPictureDialog;
    ImagePaintBox: TPaintBox;
    gbOptimize: TGroupBox;
    chbOptimize: TCheckBox;
    cbOptimize: TComboBox;
    gbMode: TGroupBox;
    Label7: TLabel;
    lblMode: TLabel;
    lblModeDesc: TLabel;
    chbAutoName: TCheckBox;
    lblDims: TLabel;
    btnAddPhoto: TSpeedButton;
    btnDeletePhoto: TSpeedButton;
    btnChangePhoto: TSpeedButton;
    btnMoveUp: TSpeedButton;
    btnMoveDown: TSpeedButton;
    oDialog: TOpenDialog;
    sDialog: TSaveDialog;
    btnNew: TSpeedButton;
    btnImportAlbum: TSpeedButton;
    btnExportAlbum: TSpeedButton;
    btnSave: TSpeedButton;
    btnExit: TSpeedButton;
    Label1: TLabel;
    lblTypeDesc: TLabel;
    lblType: TLabel;
    chbRedistribution: TCheckBox;
    btnImport: TSpeedButton;
    chbStartupPass: TCheckBox;
    function GetFiles(Directory, OfType: String): TStringList;
    function GetImageType(FileName: String): String;
    procedure OpenProject(FileName: String);
    procedure CleanAlbum;

    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnSelectPhotoFileClick(Sender: TObject);
    procedure ImagePaintBoxPaint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAddPhotoClick(Sender: TObject);
    procedure chbAutoNameClick(Sender: TObject);
    procedure lbPhotosClick(Sender: TObject);
    procedure btnDeletePhotoClick(Sender: TObject);
    procedure btnChangePhotoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExportAlbumClick(Sender: TObject);
    procedure eFileChange(Sender: TObject);
    procedure btnMoveUpClick(Sender: TObject);
    procedure btnMoveDownClick(Sender: TObject);
    procedure ImagePaintBoxClick(Sender: TObject);
    procedure btnImportAlbumClick(Sender: TObject);
    procedure chbOptimizeClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure ePasswordChange(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
  private
    Pic: TPicture;
    FilePaths, Photos: TStringList;
    sPreviewDesc: String;
  public
    IsNew, ForceExit: Boolean;
    CurrentProjectName: String;
  end;

var
  NewEditForm: TNewEditForm;

implementation

uses frmPreview, frmProgress, frmWhatNow, frmImport, pasProcs;

{$R *.DFM}

procedure TNewEditForm.FormShow(Sender: TObject);
begin
	sPreviewDesc:='[Wybierz fotografiê]';
	opDialog.InitialDir:=ExtractFilePath(Application.ExeName);
	oDialog.InitialDir:=ExtractFilePath(Application.ExeName);
	sDialog.InitialDir:=ExtractFilePath(Application.ExeName);

	IsNew:=True; // Wypierdoliæ!

	if IsNew then
	begin
		lblModeDesc.Caption:='W tym trybie pracy wszystkie zmiany (na obu kartach) zapisywane s¹ do- piero po naciœniêciu klawisza "Utwórz album".';
		lblMode.Caption:='Tworzenie nowego albumu';
		NewEditForm.Caption:='Tworzenie nowego albumu';
		btnSave.Caption:='Utwórz';
		btnSave.Hint:='Utwórz album#Tworzy nowy album na podstawie wprowadzonych parametrów';
		btnExportAlbum.Enabled:=True;
		btnImportAlbum.Enabled:=True;
	end
	else
	begin
		lblModeDesc.Caption:='W tym trybie pracy zmiany na tej karcie s¹ wykonywane dopiero po klikniê- ciu klawisza "Zmieñ", zaœ zmiany na karcie Fotografie - natychmiast.';
		lblMode.Caption:='Edycja istniej¹cego albumu';
		NewEditForm.Caption:='Edycja istniej¹cego albumu';
		btnSave.Caption:='Zmieñ';
		btnSave.Hint:='Zmieñ#Zapisuje ostatnio wprowadzone zmiany do albumu';
		btnExportAlbum.Enabled:=False;
		btnImportAlbum.Enabled:=False;
	end;
end;

procedure TNewEditForm.FormCreate(Sender: TObject);
var
	sRes: String;
begin
	Pic:=TPicture.Create;
	FilePaths:=TStringList.Create;
	Photos:=TStringList.Create;

	sRes:=IntToStr(Screen.Width)+'x'+IntToStr(Screen.Height);
	if cbOptimize.Items.IndexOf(sRes)<>-1 then cbOptimize.ItemIndex:=cbOptimize.Items.IndexOf(sRes);
end;

procedure TNewEditForm.btnSaveClick(Sender: TObject);
var
	iPosX, dWidth, dHeight, a, TheTime, AlbumSize, TotalSourceSize, tMinutes, tSeconds, iSecs: Integer;
	fil, sMinutes, sSeconds: String;
	ini: TStringList;
	Store: TStructuredStorage;
	ms: TMemoryStream;
	f: file of Byte;
	rPoint: TPoint;
	tPic: TPicture;
	tBmp: TBitmap;
	tJpg: TJPEGImage;
	tGif: TGIFImage;
label
	ExitPoint;
begin
	if IsNew then
	begin
		if lbPhotos.Items.Count=0 then
		begin
			Application.MessageBox('Nie mo¿na tworzyæ pustych albumów. Aby utworzyæ album, dodaj przynajmniej jedno zdjêcie, korzystaj¹c z zak³adki Fotografie.','Ostrze¿enie...',MB_OK+MB_ICONWARNING+MB_DEFBUTTON2);
			exit;
		end;

		TotalSourceSize:=0;

		for a:=0 to lbPhotos.Items.Count-1 do
		begin
			if not FileExists(FilePaths.Strings[a]) then
			begin
				Application.MessageBox(PChar('Plik: "'+FilePaths.Strings[a]+'"'+chr(13)+'Fotografia: "'+Photos.Values['Photo'+IntToStr(a)+'Title']+'"'+chr(13)+''+chr(13)+'Ten plik zosta³ usuniêty lub nie jest dostêpny! Utworzenie albumu jest niemo¿liwe. Popraw ten b³¹d i spróbuj ponownie.'),'B³¹d!',MB_OK+MB_ICONERROR+MB_DEFBUTTON1);
				lbPhotos.ItemIndex:=a;
				lbPhotos.OnClick(self);
				exit;
			end;

			if FileGetAttr(FilePaths.Strings[a]) and faReadOnly=0 then
			begin
				AssignFile(f, FilePaths.Strings[a]);
				Reset(f);
				Inc(TotalSourceSize,FileSize(f));
				CloseFile(f);
			end;
		end;

		if Application.MessageBox('Czy na pewno utworzyæ album na podstawie podanych parametrów?','Kontynuowaæ?',MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2)=ID_NO then exit;

		Screen.Cursor:=crHourglass;

		iPosX:=Pos('x',cbOptimize.Text);
		dWidth:=StrToInt(Copy(cbOptimize.Text,0,iPosX-1));
		dHeight:=StrToInt(Copy(cbOptimize.Text,iPosX+1,Length(cbOptimize.Text)));

		NewEditForm.Enabled:=False;
		ForceExit:=False;
		TheTime:=GetTickCount;

		ProgressForm.Caption:='Tworzenie nowego albumu...';
		ProgressForm.lblStatus.Caption:='Przygotowanie.';
		Application.ProcessMessages;
		ProgressForm.Show;

		tPic:=TPicture.Create;

		fil:=ExtractFilePath(Application.ExeName)+'temp.maf';

		//Przygotowanie albumu i zmiennych
		ini:=TStringList.Create;
		Store:=TStructuredStorage.Create;
		Store.CreateStorageFile(fil);
		Store.OpenStorageFile(fil, True);
		ms:=TMemoryStream.Create;

		//Zebranie informacji podstawowych
		ini.Values['AlbumTitle']:=eTitle.Text;
		ini.Values['AlbumProducer']:=eProducer.Text;
		ini.Values['AlbumDesc']:=eDesc.Text;
		ini.Values['Password']:=ePassword.Text;
		ini.Values['AlbumStartupPass']:=IntToStr(Ord(chbStartupPass.Checked));
		ini.Values['AlbumWeb']:=eWeb.Text;
		ini.Values['AlbumCopyright']:=eCopy.Text;
		ini.Values['AlbumCreationDate']:=DateTimeToStr(Now);

		Photos.Values['PhotoCount']:=IntToStr(lbPhotos.Items.Count);

		ProgressForm.lblStatus.Caption:='Zapisywanie parametrów albumu.';
		Application.ProcessMessages;

		//Zapisanie informacji podstawowych
		ms.Clear;
		ini.SaveToStream(ms);
		Store.AddItem('AlbumGeneralInfo',ms);

		//Zapisanie informacji rozszerzonych
		ms.Clear;
		mExtraInfo.Lines.SaveToStream(ms);
		Store.AddItem('AlbumExtraInfo',ms);

		//Zapisanie informacji o fotografiach
		ms.Clear;
		Photos.SaveToStream(ms);
		Store.AddItem('Photos',ms);

		//Zapisanie plików fotografii
		ProgressForm.pbProgress.Max:=lbPhotos.Items.Count;
		ProgressForm.pbProgress.Min:=0;
		ProgressForm.pbProgress.Position:=0;

		for a:=0 to lbPhotos.Items.Count-1 do
		begin
			if ForceExit then goto ExitPoint;
			ProgressForm.lblStatus.Caption:='Dodawanie fotografii "'+Photos.Values['Photo'+IntToStr(a)+'Title']+'" ('+IntToStr(a+1)+' z '+IntToStr(lbPhotos.Items.Count)+').';
			Application.ProcessMessages;
			ms.Clear;
			if FileExists(FilePaths.Strings[a]) then
			begin
				tPic.LoadFromFile(FilePaths.Strings[a]);
				if not chbOptimize.Checked then
				begin
					tPic.Graphic.SaveToStream(ms);
					Store.AddItem('pic'+IntToStr(a),ms);
				end
				else
				begin
					if ((tPic.Width<dWidth) and (tPic.Height<dHeight)) or (tPic.Graphic is TIcon) then
					begin
						tPic.Graphic.SaveToStream(ms);
						Store.AddItem('pic'+IntToStr(a),ms);
					end
					else
					begin
						tBmp:=TBitmap.Create;
						rPoint:=RecalculateImageSize(tPic.Width,tPic.Height,dWidth,dHeight);
						tBmp.Width:=rPoint.x;
						tBmp.Height:=rPoint.y;
						tBmp.Canvas.StretchDraw(Rect(0,0,rPoint.x,rPoint.y),tPic.Graphic);
						if tPic.Graphic is TJPEGImage then
						begin
							tJpg:=TJPEGImage.Create;
							tJpg.Assign(tBmp);
							tJpg.CompressionQuality:=90;
							tJpg.Compress;
							tJpg.SaveToStream(ms);
							tJpg.Free;
						end;
						if tPic.Graphic is TGIFImage then
						begin
							tGif:=TGIFImage.Create;
							tGif.Assign(tBmp);
							tGif.Transparent:=False;
							tGif.SaveToStream(ms);
							tGif.Free;
						end;
						if tPic.Graphic is TMetafile then
						begin
							tPic.Metafile.Width:=rPoint.x;
							tPic.Metafile.Height:=rPoint.y;
							tPic.Metafile.SaveToStream(ms);
						end;
						if tPic.Graphic is TBitmap then
						begin
							tBmp.SaveToStream(ms);
						end;
						if tPic.Graphic is TIcon then
						begin
							tPic.Icon.SaveToStream(ms);
						end;
						Store.AddItem('pic'+IntToStr(a),ms);
						tBmp.Free;
					end;
				end;
			end;
			ProgressForm.pbProgress.Position:=a+1;
			Application.ProcessMessages;
		end;

ExitPoint:
		//Zamkniêcie i zapisanie pliku albumu
		Store.CloseStorageFile;
		Store.Free;
		ms.Free;
		ini.Free;
		tPic.Free;

		TheTime:=GetTickCount-TheTime;

		ProgressForm.Hide;
		NewEditForm.Enabled:=True;
		Screen.Cursor:=crDefault;

		if ForceExit then exit;

		AssignFile(f, fil);
		Reset(f);
		AlbumSize:=FileSize(f);
		CloseFile(f);

		if TotalSourceSize < 1024000 then
			WhatNowForm.lblSourceSize.Caption:=FloatToStrF(TotalSourceSize/1024,ffFixed,7,0)+' kB'
		else
			WhatNowForm.lblSourceSize.Caption:=FloatToStrF(TotalSourceSize/1048576,ffFixed,7,2)+' MB';

		if AlbumSize < 1024000 then
			WhatNowForm.lblAlbumSize.Caption:=FloatToStrF(AlbumSize/1024,ffFixed,7,0)+' kB'
		else
			WhatNowForm.lblAlbumSize.Caption:=FloatToStrF(AlbumSize/1048576,ffFixed,7,2)+' MB';

		iSecs:=Trunc(TheTime div 1000);
		tMinutes:=iSecs div 60;
		iSecs:=iSecs-60*tMinutes;
		tSeconds:=iSecs;
		sMinutes:=IntToStr(tMinutes);
		sSeconds:=IntToStr(tSeconds);
		if tMinutes<10 then sMinutes:='0'+sMinutes;
		if tSeconds<10 then sSeconds:='0'+sSeconds;

		WhatNowForm.lblTime.Caption:=sMinutes+':'+sSeconds+' ('+IntToStr(TheTime)+' ms).';
		WhatNowForm.lblPhotoCount.Caption:=IntToStr(lbPhotos.Items.Count);
		WhatNowForm.sDialog.InitialDir:=ExtractFilePath(CurrentProjectName);
		WhatNowForm.sDialog.FileName:=ChangeFileExt(ExtractFileName(CurrentProjectName),'.maf');
		WhatNowForm.ShowModal;
	end
	else
	begin
		if not FileExists(fil) then
		begin
			Application.MessageBox(PChar('Wskazany plik'+chr(13)+fil+chr(13)+''+chr(13)+'nie istnieje!'),'B³¹d',MB_OK+MB_ICONERROR+MB_DEFBUTTON2);
			exit;
		end;
	end;
end;

procedure TNewEditForm.btnExitClick(Sender: TObject);
begin
        Close;
end;

procedure TNewEditForm.btnSelectPhotoFileClick(Sender: TObject);
begin
	if not opDialog.Execute then exit;
	Screen.Cursor:=crHourglass;

	eFile.Text:=opDialog.FileName;
	Pic.LoadFromFile(opDialog.FileName);
	ImagePaintBox.Invalidate;

	lblType.Caption:=GetImageType(eFile.Text);
	lblTypeDesc.Left:=lblType.Left-25;

	Screen.Cursor:=crDefault;
end;

procedure TNewEditForm.ImagePaintBoxPaint(Sender: TObject);
var
	DrawRect: TRect;
begin
	with TPaintBox(Sender) do
	begin
		DrawRect := ClientRect;
		if Pic.Width > 0 then
		begin
			with DrawRect do
			begin
				if (Pic.Width > Right - Left) or (Pic.Height > Bottom - Top) then
				begin
					if Pic.Width > Pic.Height then
					begin
						Bottom := Top + MulDiv(Pic.Height, Right - Left, Pic.Width);
						Top:=(ImagePaintBox.Height div 2) - (Bottom div 2);
						Inc(Bottom,Top);
					end
					else
					begin
						Right:=Left + MulDiv(Pic.Width, Bottom - Top, Pic.Height);
						Left:=(ImagePaintBox.Width div 2) - (Right div 2);
						Inc(Right,Left);
					end;
					Canvas.StretchDraw(DrawRect, Pic.Graphic);
				end
				else
				begin
					with DrawRect do
					begin
						Canvas.Draw(Left + (Right - Left - Pic.Width) div 2, Top + (Bottom - Top - Pic.Height) div 2, Pic.Graphic);
					end;
				end;
			end;
			ImagePaintBox.Enabled:=True;
		end
		else
		begin
			with DrawRect, Canvas do
			begin
				TextOut(Left + (Right - Left - TextWidth(sPreviewDesc)) div 2, Top + (Bottom - Top - TextHeight(sPreviewDesc)) div 2, sPreviewDesc);
			end;
			ImagePaintBox.Enabled:=False;
		end;

		lblDims.Caption:='('+IntToStr(Pic.Width)+'x'+IntToStr(Pic.Height)+')';
	end;
end;

procedure TNewEditForm.FormDestroy(Sender: TObject);
begin
	Pic.Free;
	FilePaths.Free;
	Photos.Free;
end;

procedure TNewEditForm.btnAddPhotoClick(Sender: TObject);
var
	poz: Integer;
	sTitle: String;
begin
	if not FileExists(eFile.Text) then
	begin
		Application.MessageBox('Pole "Plik" jest puste lub wskazany plik jest niedostêpny. Okreœl œcie¿kê dostêpu prowadz¹c¹ do istniej¹cego pliku.','Ostrze¿enie...',MB_OK+MB_ICONWARNING+MB_DEFBUTTON2);
		exit;
	end;
	if (not chbAutoName.Checked) and (ePhotoTitle.Text = '') then
	begin
		Application.MessageBox('Podaj tytu³ dla dodawanej fotografii.','Ostrze¿enie...',MB_OK+MB_ICONWARNING+MB_DEFBUTTON2);
		exit;
	end;

	if IsNew then
	begin
		if chbAutoName.Checked then sTitle:='Fotografia nr '+IntToStr(lbPhotos.Items.Count+1) else sTitle:=ePhotoTitle.Text;
		lbPhotos.Items.Add(sTitle);
		FilePaths.Add(eFile.Text);
		poz:=lbPhotos.Items.Count-1;
		Photos.Values['Photo'+IntToStr(poz)+'Title']:=sTitle;
		Photos.Values['Photo'+IntToStr(poz)+'Author']:=ePhotoAuthor.Text;
		Photos.Values['Photo'+IntToStr(poz)+'Desc']:=ePhotoDesc.Text;
		Photos.Values['Photo'+IntToStr(poz)+'Pass']:=IntToStr(Ord(chbHasPass.Checked));
		Photos.Values['Photo'+IntToStr(poz)+'Redist']:=IntToStr(Ord(chbRedistribution.Checked));
		Photos.Values['Photo'+IntToStr(poz)+'Type']:=lblType.Caption;
		lbPhotos.ItemIndex:=poz;
	end;

	lblPhotoCount.Caption:=IntToStr(lbPhotos.Items.Count);
end;

procedure TNewEditForm.chbAutoNameClick(Sender: TObject);
begin
	ePhotoTitle.Enabled:= not chbAutoName.Checked;
end;

procedure TNewEditForm.lbPhotosClick(Sender: TObject);
var
	poz: Integer;
begin
	if lbPhotos.ItemIndex=-1 then exit;
	
	if IsNew then
	begin
		poz:=lbPhotos.ItemIndex;
		
		if FileExists(FilePaths[poz]) then
		begin
			Pic.LoadFromFile(FilePaths[poz]);
		end
		else
		begin
			sPreviewDesc:='[Wskazany plik nie istnieje!]';
			Pic.Graphic:=nil;
		end;
		ImagePaintBox.Invalidate;
		eFile.Text:=FilePaths[poz];
		ePhotoTitle.Text:=Photos.Values['Photo'+IntToStr(poz)+'Title'];
		ePhotoAuthor.Text:=Photos.Values['Photo'+IntToStr(poz)+'Author'];
		ePhotoDesc.Text:=Photos.Values['Photo'+IntToStr(poz)+'Desc'];
		chbHasPass.Checked:=(StrToIntDef(Photos.Values['Photo'+IntToStr(poz)+'Pass'],0) = 1);
		chbRedistribution.Checked:=(StrToIntDef(Photos.Values['Photo'+IntToStr(poz)+'Redist'],0) = 1);
		lblType.Caption:=GetImageType(eFile.Text);
		lblTypeDesc.Left:=lblType.Left-25;
		if (Photos.Values['Photo'+IntToStr(poz)+'Type']<>lblType.Caption) and (lblType.Caption<>'brak pliku') then Photos.Values['Photo'+IntToStr(poz)+'Type']:=lblType.Caption;
	end;
	lblPhotoCount.Caption:=IntToStr(lbPhotos.Items.Count);
end;

procedure TNewEditForm.btnDeletePhotoClick(Sender: TObject);
var
	poz, a: Integer;
begin
	if lbPhotos.ItemIndex=-1 then exit;
	
	if Application.MessageBox(PChar('Tytu³: '+ePhotoTitle.Text+chr(13)+'Autor: '+ePhotoAuthor.Text+chr(13)+''+chr(13)+'Czy na pewno chcesz usun¹æ tê fotografiê z albumu?'),'Potwierdzenie...',MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2)=ID_NO then exit;

	if IsNew then
	begin
		poz:=lbPhotos.ItemIndex;
		FilePaths.Delete(poz);
		if poz<>lbPhotos.Items.Count-1 then
		begin
			for a:=poz to lbPhotos.Items.Count-2 do
			begin
				Photos.Values['Photo'+IntToStr(a)+'Title']:=Photos.Values['Photo'+IntToStr(a+1)+'Title'];
				Photos.Values['Photo'+IntToStr(a)+'Author']:=Photos.Values['Photo'+IntToStr(a+1)+'Author'];
				Photos.Values['Photo'+IntToStr(a)+'Desc']:=Photos.Values['Photo'+IntToStr(a+1)+'Desc'];
				Photos.Values['Photo'+IntToStr(a)+'Pass']:=Photos.Values['Photo'+IntToStr(a+1)+'Pass'];
				Photos.Values['Photo'+IntToStr(a)+'Redist']:=Photos.Values['Photo'+IntToStr(a+1)+'Redist'];
				Photos.Values['Photo'+IntToStr(a)+'Type']:=Photos.Values['Photo'+IntToStr(a+1)+'Type'];
			end;
		end;
		lbPhotos.Items.Delete(poz);
	end;

	lblPhotoCount.Caption:=IntToStr(lbPhotos.Items.Count);
end;

procedure TNewEditForm.btnChangePhotoClick(Sender: TObject);
var
	poz: Integer;
	sTitle: String;
begin
	if lbPhotos.ItemIndex=-1 then exit;
	
	if not FileExists(eFile.Text) then
	begin
		Application.MessageBox('Pole "Plik" jest puste lub wskazany plik jest niedostêpny. Okreœl œcie¿kê dostêpu prowadz¹c¹ do istniej¹cego pliku.','Ostrze¿enie...',MB_OK+MB_ICONWARNING+MB_DEFBUTTON2);
		exit;
	end;
	if (not chbAutoName.Checked) and (ePhotoTitle.Text = '') then
	begin
		Application.MessageBox('Podaj tytu³ dla dodawanej fotografii.','Ostrze¿enie...',MB_OK+MB_ICONWARNING+MB_DEFBUTTON2);
		exit;
	end;

	if IsNew then
	begin
		poz:=lbPhotos.ItemIndex;
		if chbAutoName.Checked then sTitle:='Fotografia nr '+IntToStr(poz+1) else sTitle:=ePhotoTitle.Text;
		lbPhotos.Items.Strings[poz]:=sTitle;
		FilePaths.Strings[poz]:=eFile.Text;
		Photos.Values['Photo'+IntToStr(poz)+'Title']:=sTitle;
		Photos.Values['Photo'+IntToStr(poz)+'Author']:=ePhotoAuthor.Text;
		Photos.Values['Photo'+IntToStr(poz)+'Desc']:=ePhotoDesc.Text;
		Photos.Values['Photo'+IntToStr(poz)+'Pass']:=IntToStr(Ord(chbHasPass.Checked));
		Photos.Values['Photo'+IntToStr(poz)+'Redist']:=IntToStr(Ord(chbRedistribution.Checked));
		Photos.Values['Photo'+IntToStr(poz)+'Type']:=lblType.Caption;
	end;
end;

procedure TNewEditForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	if (lbPhotos.Items.Count>0) and (WhatNowForm.Visible=False) then if Application.MessageBox('Czy na pewno chcesz zamkn¹æ to okno?','Potwierdzenie...',MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2)=ID_NO then Action:=caNone;
end;

procedure TNewEditForm.btnExportAlbumClick(Sender: TObject);
var
	sTemp: TStringList;
	a: Integer;
begin
	if lbPhotos.Items.Count=0 then
	begin
		Application.MessageBox('Tworzony aktualnie album jest pusty - brak informacji do eksportu.','Ostrze¿enie...',MB_OK+MB_ICONWARNING+MB_DEFBUTTON1);
		exit;
	end;

	sDialog.InitialDir:=ExtractFilePath(CurrentProjectName);
	sDialog.FileName:=ExtractFileName(CurrentProjectName);
	if not sDialog.Execute then exit;

	sTemp:=TStringList.Create;
	sTemp.Assign(Photos);

	sTemp.Values['PathCount']:=IntToStr(FilePaths.Count);
	for a:=0 to FilePaths.Count-1 do sTemp.Values['File'+IntToStr(a)+'Path']:=FilePaths.Strings[a];

	sTemp.Values['AlbumTitle']:=eTitle.Text;
	sTemp.Values['AlbumProducer']:=eProducer.Text;
	sTemp.Values['AlbumDesc']:=eDesc.Text;
	sTemp.Values['Password']:=ePassword.Text;
	sTemp.Values['AlbumStartupPass']:=IntToStr(Ord(chbStartupPass.Checked));
	sTemp.Values['AlbumWeb']:=eWeb.Text;
	sTemp.Values['AlbumCopyright']:=eCopy.Text;

	sTemp.SaveToFile(sDialog.FileName);
	sTemp.Free;
	lblPhotoCount.Caption:=IntToStr(lbPhotos.Items.Count);
	NewEditForm.Caption:=lblMode.Caption+' ['+ExtractFileName(sDialog.FileName)+']';
	CurrentProjectName:=sDialog.FileName;
end;

procedure TNewEditForm.OpenProject(FileName: String);
var
	sTemp: TStringList;
	cnt, a: Integer;
begin
	FilePaths.Clear;
	Photos.Clear;
	lbPhotos.Clear;

	sTemp:=TStringList.Create;
	sTemp.LoadFromFile(FileName);
	cnt:=StrToIntDef(sTemp.Values['PathCount'],0)-1;
	for a:=0 to cnt do
	begin
		FilePaths.Add(sTemp.Values['File'+IntToStr(a)+'Path']);
		Photos.Values['Photo'+IntToStr(a)+'Title']:=sTemp.Values['Photo'+IntToStr(a)+'Title'];
		lbPhotos.Items.Add(sTemp.Values['Photo'+IntToStr(a)+'Title']);
		Photos.Values['Photo'+IntToStr(a)+'Author']:=sTemp.Values['Photo'+IntToStr(a)+'Author'];
		Photos.Values['Photo'+IntToStr(a)+'Desc']:=sTemp.Values['Photo'+IntToStr(a)+'Desc'];
		Photos.Values['Photo'+IntToStr(a)+'Pass']:=sTemp.Values['Photo'+IntToStr(a)+'Pass'];
		Photos.Values['Photo'+IntToStr(a)+'Redist']:=sTemp.Values['Photo'+IntToStr(a)+'Redist'];
		Photos.Values['Photo'+IntToStr(a)+'Type']:=sTemp.Values['Photo'+IntToStr(a)+'Type'];
	end;

	eTitle.Text:=sTemp.Values['AlbumTitle'];
	eProducer.Text:=sTemp.Values['AlbumProducer'];
	eDesc.Text:=sTemp.Values['AlbumDesc'];
	ePassword.Text:=sTemp.Values['Password'];
	chbStartupPass.Checked:=(StrToIntDef(sTemp.Values['AlbumStartupPass'],0) = 1);
	eWeb.Text:=sTemp.Values['AlbumWeb'];
	eCopy.Text:=sTemp.Values['AlbumCopyright'];

	sTemp.Free;
	lblPhotoCount.Caption:=IntToStr(lbPhotos.Items.Count);
	NewEditForm.Caption:=lblMode.Caption+' ['+ExtractFileName(FileName)+']';
	CurrentProjectName:=FileName;
end;

procedure TNewEditForm.eFileChange(Sender: TObject);
begin
	eFile.Hint:=eFile.Text;
end;

procedure TNewEditForm.btnMoveUpClick(Sender: TObject);
var
	sPath, sTitle, sAuthor, sDesc, sPass, sType, sRedist: String;
	poz: Integer;
begin
	if (lbPhotos.ItemIndex=-1) or (lbPhotos.ItemIndex<1) then exit;

	if IsNew then
	begin
		poz:=lbPhotos.ItemIndex;

		sPath:=FilePaths.Strings[poz-1];
		FilePaths.Strings[poz-1]:=FilePaths.Strings[poz];
		FilePaths.Strings[poz]:=sPath;

		sTitle:=Photos.Values['Photo'+IntToStr(poz-1)+'Title'];
		sAuthor:=Photos.Values['Photo'+IntToStr(poz-1)+'Author'];
		sDesc:=Photos.Values['Photo'+IntToStr(poz-1)+'Desc'];
		sPass:=Photos.Values['Photo'+IntToStr(poz-1)+'Pass'];
		sRedist:=Photos.Values['Photo'+IntToStr(poz-1)+'Redist'];
		sType:=Photos.Values['Photo'+IntToStr(poz-1)+'Type'];

		Photos.Values['Photo'+IntToStr(poz-1)+'Title']:=Photos.Values['Photo'+IntToStr(poz)+'Title'];
		Photos.Values['Photo'+IntToStr(poz-1)+'Author']:=Photos.Values['Photo'+IntToStr(poz)+'Author'];
		Photos.Values['Photo'+IntToStr(poz-1)+'Desc']:=Photos.Values['Photo'+IntToStr(poz)+'Desc'];
		Photos.Values['Photo'+IntToStr(poz-1)+'Pass']:=Photos.Values['Photo'+IntToStr(poz)+'Pass'];
		Photos.Values['Photo'+IntToStr(poz-1)+'Redist']:=Photos.Values['Photo'+IntToStr(poz)+'Redist'];
		Photos.Values['Photo'+IntToStr(poz-1)+'Type']:=Photos.Values['Photo'+IntToStr(poz)+'Type'];

		Photos.Values['Photo'+IntToStr(poz)+'Title']:=sTitle;
		Photos.Values['Photo'+IntToStr(poz)+'Author']:=sAuthor;
		Photos.Values['Photo'+IntToStr(poz)+'Desc']:=sDesc;
		Photos.Values['Photo'+IntToStr(poz)+'Pass']:=sPass;
		Photos.Values['Photo'+IntToStr(poz)+'Redist']:=sRedist;
		Photos.Values['Photo'+IntToStr(poz)+'Type']:=sType;

		lbPhotos.Items.Exchange(poz,poz-1);
	end;
end;

procedure TNewEditForm.btnMoveDownClick(Sender: TObject);
var
	sPath, sTitle, sAuthor, sDesc, sPass, sType, sRedist: String;
	poz: Integer;
begin
	if (lbPhotos.ItemIndex=-1) or (lbPhotos.ItemIndex=lbPhotos.Items.Count-1) then exit;

	if IsNew then
	begin
		poz:=lbPhotos.ItemIndex;

		sPath:=FilePaths.Strings[poz+1];
		FilePaths.Strings[poz+1]:=FilePaths.Strings[poz];
		FilePaths.Strings[poz]:=sPath;

		sTitle:=Photos.Values['Photo'+IntToStr(poz+1)+'Title'];
		sAuthor:=Photos.Values['Photo'+IntToStr(poz+1)+'Author'];
		sDesc:=Photos.Values['Photo'+IntToStr(poz+1)+'Desc'];
		sPass:=Photos.Values['Photo'+IntToStr(poz+1)+'Pass'];
		sRedist:=Photos.Values['Photo'+IntToStr(poz+1)+'Redist'];
		sType:=Photos.Values['Photo'+IntToStr(poz+1)+'Type'];

		Photos.Values['Photo'+IntToStr(poz+1)+'Title']:=Photos.Values['Photo'+IntToStr(poz)+'Title'];
		Photos.Values['Photo'+IntToStr(poz+1)+'Author']:=Photos.Values['Photo'+IntToStr(poz)+'Author'];
		Photos.Values['Photo'+IntToStr(poz+1)+'Desc']:=Photos.Values['Photo'+IntToStr(poz)+'Desc'];
		Photos.Values['Photo'+IntToStr(poz+1)+'Pass']:=Photos.Values['Photo'+IntToStr(poz)+'Pass'];
		Photos.Values['Photo'+IntToStr(poz+1)+'Redist']:=Photos.Values['Photo'+IntToStr(poz)+'Redist'];
		Photos.Values['Photo'+IntToStr(poz+1)+'Type']:=Photos.Values['Photo'+IntToStr(poz)+'Type'];

		Photos.Values['Photo'+IntToStr(poz)+'Title']:=sTitle;
		Photos.Values['Photo'+IntToStr(poz)+'Author']:=sAuthor;
		Photos.Values['Photo'+IntToStr(poz)+'Desc']:=sDesc;
		Photos.Values['Photo'+IntToStr(poz)+'Pass']:=sPass;
		Photos.Values['Photo'+IntToStr(poz)+'Redist']:=sRedist;
		Photos.Values['Photo'+IntToStr(poz)+'Type']:=sType;

		lbPhotos.Items.Exchange(poz,poz+1);
	end;
end;

procedure TNewEditForm.ImagePaintBoxClick(Sender: TObject);
begin
	PreviewForm.imgPreview.Picture:=Pic;
	PreviewForm.ShowModal;
end;

procedure TNewEditForm.btnImportAlbumClick(Sender: TObject);
begin
	if not oDialog.Execute then exit;
	OpenProject(oDialog.FileName);
end;

procedure TNewEditForm.chbOptimizeClick(Sender: TObject);
begin
	cbOptimize.Enabled:=chbOptimize.Checked;
end;

procedure TNewEditForm.btnNewClick(Sender: TObject);
begin
	if Application.MessageBox('Wszystkie niezapisane zmiany zostan¹ bezpowrotnie utracone!'+chr(13)+''+chr(13)+'Czy na pewno chcesz utworzyæ nowy projekt? ','Pytanie...',MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2)=ID_YES then CleanAlbum;
end;

procedure TNewEditForm.CleanAlbum;
begin
	eTitle.Text:='';
	eProducer.Text:='';
	eDesc.Text:='';
	ePassword.Text:='';
	eWeb.Text:='';
	eCopy.Text:='';

	eFile.Text:='';
	ePhotoTitle.Text:='';
	ePhotoAuthor.Text:='';
	ePhotoDesc.Text:='';
	chbHasPass.Checked:=False;
	chbOptimize.Checked:=False;
	chbAutoName.Checked:=False;

	mExtraInfo.Clear;
	lbPhotos.Clear;
	lblPhotoCount.Caption:=IntToStr(lbPhotos.Items.Count);

	Pic.Graphic:=nil;
	ImagePaintBox.Invalidate;

	Photos.Clear;
	FilePaths.Clear;
end;

function TNewEditForm.GetImageType(FileName: String): String;
var
	pic: TPicture;
begin
	if not FileExists(FileName) then
	begin
		Result:='brak pliku';
		exit;
	end;
	pic:=TPicture.Create;
	pic.LoadFromFile(FileName);
	if pic.Graphic is TBitmap then Result:='bitmapa';
	if pic.Graphic is TIcon then Result:='ikona';
	if pic.Graphic is TMetafile then Result:='metaplik';
	if pic.Graphic is TJPEGImage then Result:='JPEG';
	if pic.Graphic is TGIFImage then Result:='GIF';
	pic.Free;
end;

procedure TNewEditForm.ePasswordChange(Sender: TObject);
begin
	if Length(ePassword.Text)=0 then
	begin
		chbStartupPass.Enabled:=False;
		chbHasPass.Enabled:=False;
		ImportForm.chbHasPass.Enabled:=False;
	end
	else
	begin
		chbStartupPass.Enabled:=True;
		chbHasPass.Enabled:=True;
		ImportForm.chbHasPass.Enabled:=True;
	end;
end;

procedure TNewEditForm.btnImportClick(Sender: TObject);
var
	fil, name, dir: String;
	tList, ext: TStringList;
	poz, a: Integer;
begin
	ImportForm.ShowModal;
	if ImportForm.lblModalResult.Caption<>'1' then exit;
	if ImportForm.FoundFiles=0 then exit;
	if Application.MessageBox(PChar('Liczba fotografii, które zostan¹ dodane do aktualnego projektu: '+IntToStr(ImportForm.FoundFiles)+'.'+chr(13)+''+chr(13)+'Kontynuowaæ? '),'Pytanie...',MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2)=ID_NO then exit;

	dir:=ImportForm.eFolder.Text;
	if not DirectoryExists(dir) then exit;

	tList:=TStringList.Create;
	ext:=TStringList.Create;
	ext.Add('*.jp*g');
	ext.Add('*.gif');
	ext.Add('*.bmp');
	ext.Add('*.emf');
	ext.Add('*.wmf');
	ext.Add('*.ico');

	if ImportForm.rbAll.Checked then
	begin
		for a:=0 to ext.Count-1 do
		begin
			tList.Text:=tList.Text+GetFiles(dir,ext.Strings[a]).Text;
		end;
	end
	else
	begin
		for a:=0 to ImportForm.chblbTypes.Items.Count-1 do
		begin
			if ImportForm.chblbTypes.Checked[a]=True then
			begin
				tList.Text:=tList.Text+GetFiles(dir,ext.Strings[a]).Text;
			end;
		end;
	end;

	if IsNew then
	begin
                poz:=0;
		for a:=0 to tList.Count-1 do
		begin
			if ImportForm.rgName.ItemIndex=1 then name:=ChangeFileExt(ExtractFileName(tList.Strings[a]),'') else name:='Fotografia nr '+IntToStr(a+1);
			fil:=tList.Strings[a];
			lbPhotos.Items.Add(name);
			FilePaths.Add(fil);
			poz:=lbPhotos.Items.Count-1;
			Photos.Values['Photo'+IntToStr(poz)+'Title']:=name;
			Photos.Values['Photo'+IntToStr(poz)+'Author']:=ImportForm.ePhotoAuthor.Text;
			Photos.Values['Photo'+IntToStr(poz)+'Pass']:=IntToStr(Ord(ImportForm.chbHasPass.Checked));
			Photos.Values['Photo'+IntToStr(poz)+'Redist']:=IntToStr(Ord(ImportForm.chbRedistribution.Checked));
			Photos.Values['Photo'+IntToStr(poz)+'Type']:=GetImageType(fil);
		end;
		lbPhotos.ItemIndex:=poz;
		lbPhotosClick(self);
	end;

	ext.Free;
	tList.Free;
end;

function TNewEditForm.GetFiles(Directory, OfType: String): TStringList;
var
	a: Integer;
	SearchRec: TSearchRec;
	tList: TStringList;
begin
	tList:=TStringList.Create;
	Directory:=IncludeTrailingBackslash(Directory);
	a:=FindFirst(Directory+OfType,faanyfile,SearchRec);
	while a=0 do
	begin
		if SearchRec.Name[1]<>'.' then tList.Add(Directory+SearchRec.Name);
                a:=FindNext(SearchRec);
        end;
	FindClose(SearchRec);
	Result:=tList;
end;

end.
