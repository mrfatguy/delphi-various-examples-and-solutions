unit frmMain;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, ExtDlgs, Dialogs,
  StdCtrls, ExtCtrls, Graphics, Jpeg, dExif, dIPTC, msData, ComCtrls, Grids;

type
  TMainForm = class(TForm)
    pdlg: TOpenPictureDialog;
    pcMain: TPageControl;
    tsExif: TTabSheet;
    tsThumbnail: TTabSheet;
    tsSummary: TTabSheet;
    sgExif: TStringGrid;
    sgSummary: TStringGrid;
    pnlComment: TPanel;
    pnlCommLabel: TPanel;
    mComment: TMemo;
    pnlThumb: TPanel;
    pnlMini: TPanel;
    imgThumb: TImage;
    Panel1: TPanel;
    sgThumb: TStringGrid;
    tsIPTC: TTabSheet;
    sgIPTC: TStringGrid;
    tsMaker: TTabSheet;
    sgMaker: TStringGrid;
    pnlIPTC: TPanel;
    pnlMaker: TPanel;
    gbFile: TGroupBox;
    btnLoad: TButton;
    lblFile: TLabel;

    procedure ReadExifDataFromFile(FileName: String);
    procedure ProcessEXIFString(EXIFString, Separator: String; StringGrid: TStringGrid; StartIndex: Integer);
    procedure ClearStringGrid(StringGrid: TStringGrid);
    procedure DumpEXIF;
    procedure DumpMSpecific;
    procedure DumpThumb;

    procedure btnLoadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  ImgData: TImgData;

implementation

{$R *.DFM}

procedure TMainForm.btnLoadClick(Sender: TObject);
begin
        if pdlg.Execute then ReadExifDataFromFile(pdlg.FileName);
end;

procedure TMainForm.DumpEXIF;
var
        Item: TTagEntry;
        c: Integer;
begin
        ClearStringGrid(sgExif);
        sgExif.Rows[0].Add('Error String');
        sgExif.Rows[0].Add(ImgData.ErrStr);

        if not ImgData.HasEXIF() then exit;

        sgExif.Rows[1].Add('Byte Order Type');
        if ImgData.MotorolaOrder then sgExif.Rows[1].Add('Motorola Byte Order') else sgExif.Rows[1].Add('Intel Byte Order');

        ImgData.ExifObj.ResetIterator;
        c := 2;

        while ImgData.ExifObj.IterateFoundTags(GenericEXIF, Item) do
        begin
                sgExif.Rows[c].Add(Item.Desc);
                sgExif.Rows[c].Add(Item.Data);
                Inc(c);
        end;

        sgExif.RowCount := c;
end;

procedure TMainForm.DumpMSpecific;
var
        Item: TTagEntry;
        c: Integer;
begin
        ClearStringGrid(sgMaker);
        ImgData.ExifObj.ResetIterator;
        c := 0;

        while ImgData.ExifObj.IterateFoundThumbTags(CustomEXIF, Item) do
        begin
                sgMaker.Rows[c].Add(Item.Desc);
                sgMaker.Rows[c].Add(Item.Data);
                Inc(c);
        end;
        sgMaker.RowCount := c;
end;

procedure TMainForm.DumpThumb;
var
        Item: TTagEntry;
        c: Integer;
begin
        ClearStringGrid(sgThumb);
        sgThumb.Rows[0].Add('Thumbnail Start');
        sgThumb.Rows[0].Add(IntToStr(ImgData.ExifObj.ThumbStart));
        sgThumb.Rows[1].Add('Thumbnail Length');
        sgThumb.Rows[1].Add(IntToStr(ImgData.ExifObj.ThumbLength));

        ImgData.ExifObj.ResetThumbIterator;
        c := 2;

        while ImgData.ExifObj.IterateFoundThumbTags(GenericEXIF,item) do
        begin
                sgThumb.Rows[c].Add(Item.Desc);
                sgThumb.Rows[c].Add(Item.Data);
                Inc(c);
        end;
        sgThumb.RowCount := c;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
        ImgData := TImgData.Create;

        sgExif.ColWidths[0] := 164;
        sgExif.ColWidths[1] := 420;
        sgSummary.ColWidths[0] := 164;
        sgSummary.ColWidths[1] := 420;
        sgThumb.ColWidths[0] := 164;
        sgThumb.ColWidths[1] := 420;
        sgIPTC.ColWidths[0] := 164;
        sgIPTC.ColWidths[1] := 420;
        sgMaker.ColWidths[0] := 164;
        sgMaker.ColWidths[1] := 420;

        if ParamStr(1) <> '' then
        begin
                if FileExists(ParamStr(1)) then
                begin
                        ReadExifDataFromFile(ParamStr(1));
                end
                else
                begin
                        Application.MessageBox('Wskazany plik nie istnieje.','B³¹d...',MB_OK+MB_ICONWARNING+MB_DEFBUTTON1);
                        Application.Terminate;
                end;
        end;
        MainForm.Show;
end;

procedure TMainForm.ReadExifDataFromFile(FileName: String);
var
        i, sgsrc: Integer;
        ts: TStringList;
        tmp: String;
        jpegThumb: TJPEGImage;
begin
        ImgData.BuildList := GenAll;
        if not ImgData.ProcessFile(FileName) then
        begin
                Application.MessageBox('Wskazany plik nie zawiera danych EXIF lub jest uszkodzony.','B³¹d...',MB_OK+MB_ICONWARNING+MB_DEFBUTTON1);
                exit;
        end;

        lblFile.Caption := FileName;

        DumpExif;

        if not ImgData.HasMetaData() then exit;

        if ImgData.HasEXIF and ImgData.ExifObj.msAvailable then
        begin
                DumpMSpecific;
                pnlMaker.Visible := False;
        end
        else pnlMaker.Visible := True;

        if ImgData.HasThumbnail then
        begin
                ImgData.ExifObj.ProcessThumbnail;
                DumpThumb;
                jpegThumb := imgData.ExtractThumbnailJpeg();
                imgThumb.Picture.Assign(jpegThumb);
        end
        else pnlMini.Caption := 'Brak miniaturki';


        if ImgData.commentSegment <> nil then
                mComment.Text := ImgData.GetCommentStr()
        else
                mComment.Text := 'Brak komentarza';

        if ImgData.IPTCSegment <> nil then
        begin
                pnlIPTC.Visible := False;
                ClearStringGrid(sgIPTC);

                ts := TStringList.Create;
                ts := ImgData.IptcObj.ParseIPTCStrings(ImgData.IPTCSegment^.Data);
                if ts.Count > 0 then
                        ProcessEXIFString(ts.Text, ' = ', sgIPTC, 0)
                else
                        pnlIPTC.Visible := False;
        end
        else pnlIPTC.Visible := True;

        ClearStringGrid(sgSummary);
        ProcessEXIFString(ImgData.ExifObj.toLongString(), ': ', sgSummary, 0);

        sgsrc := sgSummary.RowCount;

        tmp := ImgData.ExifObj.LookupTagVal('MaxApertureValue');
        if tmp <> '' then
        begin
                sgSummary.Rows[sgsrc].Add('Widest Aperture');
                sgSummary.Rows[sgsrc].Add(tmp);
                Inc(sgsrc);
        end;

        tmp := ImgData.ExifObj.LookupTagVal('ShutterSpeedValue');
        if tmp <> '' then
        begin
                sgSummary.Rows[sgsrc].Add('Shutter Speed Time');
                sgSummary.Rows[sgsrc].Add(tmp);
                Inc(sgsrc);
        end;

        tmp := ImgData.ExifObj.LookupTagVal('MeteringMode');
        if tmp <> '' then
        begin
                sgSummary.Rows[sgsrc].Add('Light Meter Mode');
                sgSummary.Rows[sgsrc].Add(tmp);
                Inc(sgsrc);
        end;

        sgSummary.RowCount := sgsrc;
end;

procedure TMainForm.ProcessEXIFString(EXIFString, Separator: String; StringGrid: TStringGrid; StartIndex: Integer);
var
        ts: TStringList;
        a, p: Integer;
        tStr: String;
begin
        ts := TStringList.Create;
        ts.Text := EXIFString;

        for a :=0 to ts.Count - 1 do
        begin
                tStr := ts[a];
                p := Pos(Separator, tStr);

                StringGrid.Rows[a + StartIndex].Add(Trim(Copy(tStr, 0, p)));
                StringGrid.Rows[a + StartIndex].Add(Trim(Copy(tStr, p + Length(Separator), Length(tStr))));
                StringGrid.RowCount := a + StartIndex + 1;
        end;

        ts.Free;
end;

procedure TMainForm.ClearStringGrid(StringGrid: TStringGrid);
var
        a: Integer;
begin
        for a := 0 to StringGrid.RowCount - 1 do StringGrid.Rows[a].Clear;
end;

end.
