unit FileInfo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFileInfoForm = class(TForm)
    EditFileName: TEdit;
    MPEGInfoGroupBox: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    EditTitle: TEdit;
    EditArtist: TEdit;
    EditAlbum: TEdit;
    EditYear: TEdit;
    EditComment: TEdit;
    SaveButton: TButton;
    CancelButton: TButton;
    RemoveButton: TButton;
    TitleLabel: TLabel;
    ArtistLabel: TLabel;
    AlbumLabel: TLabel;
    YearLAbel: TLabel;
    CommentLabel: TLabel;
    GenreLabel: TLabel;
    GenreComboBox: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure RemoveButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FileInfoForm: TFileInfoForm;

implementation

uses MainForm, MPGTools;

{$R *.DFM}
var
   MPEGFile : TMPEGAudio;

procedure TFileInfoForm.FormShow(Sender: TObject);
begin
     EditFileName.Text := FileInfoString;
     MPEGFile := TMPEGAudio.Create;
     try
        MPEGFile.FileName := FileInfoString;
        if MPEGFile.Title <> '[notag]' then EditTitle.Text := MPEGFile.Title;
        if MPEGFile.Artist <> '[notag]' then EditArtist.Text := MPEGFile.Artist;
        if MPEGFile.Album <> '[notag]' then EditAlbum.Text := MPEGFile.Album;
        if MPEGFile.Year <> '[notag]' then EditYear.Text := MPEGFile.Year;
        if MPEGFile.Comment <> '[notag]' then EditComment.Text := MPEGFile.Comment;
        GenreComboBox.ItemIndex := GenreComboBox.Items.IndexOf(MPEGFile.GenreStr);
        Label1.Caption := 'Size: '+ IntToStr(MPEGFile.FileLength) +' bytes';
        Label2.Caption := 'Length: '+ IntToStr(MPEGFile.Duration)+'seconds';
        Label3.Caption := 'MPEG '+ MPEG_VERSIONS[MPEGFile.Version] + ' Layer '+ MPEGFile.LayerStr;
        Label4.Caption := IntToStr(MPEGFile.BitRate)+'kbit '+IntToStr(MPEGFile.FrameLength)+' Frames';
        Label5.Caption := IntToStr(MPEGFile.SampleRate)+'hz ' + MPEGFile.ModeStr;

        if MPEGFile.CRC = 0 then
           Label6.Caption := 'CRCs: No'
        else
           Label6.Caption := 'CRCs: '+IntToStr(MPEGFile.CRC);

        if MPEGFile.Copyright then
           Label7.Caption := 'Copyrighted: Yes'
        else
            Label7.Caption := 'Copyrighted: No';

        if MPEGFile.Original then
           Label8.Caption := 'Original: Yes'
        else
            Label8.Caption := 'Original: No';
     finally
            MPEGFile.Free;
     end;
end;

procedure TFileInfoForm.CancelButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TFileInfoForm.RemoveButtonClick(Sender: TObject);
begin
    EditTitle.Text := '';
    EditArtist.Text := '';
    EditAlbum.Text := '';
    EditYear.Text := '';
    EditComment.Text := '';
    MPEGFile := TMPEGAudio.Create;
    try
       MPEGFile.FileName := FileInfoString;
       MPEGFile.RemoveTag;
     finally
            MPEGFile.Free;
     end;
     Close;
end;

procedure TFileInfoForm.SaveButtonClick(Sender: TObject);
begin
     MPEGFile := TMPEGAudio.Create;
     try
        MPEGFile.FileName := FileInfoString;
        MPEGFile.Title := EditTitle.Text;
        MPEGFile.Artist := EditArtist.Text;
        MPEGFile.Album := EditAlbum.Text;
        MPEGFile.Year := EditYear.Text;
        MPEGFile.Comment := EditComment.Text;
        MPEGFile.Genre := GenreComboBox.ItemIndex;
        MPEGFile.WriteTag;
     finally
        MPEGFile.Free;
     end;
     Close;
end;

procedure TFileInfoForm.FormCreate(Sender: TObject);
var
   i : integer;
begin
     for i := 0 to MaxStyles do
         GenreComboBox.Items.Add(MusicStyle[i]);
end;

end.
