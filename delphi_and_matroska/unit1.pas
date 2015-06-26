unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Inc_matroska;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    ListBox1: TListBox;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Label6: TLabel;
    ListBox2: TListBox;
    Label7: TLabel;
    ListBox3: TListBox;
    Label8: TLabel;
    Label9: TLabel;
    Edit6: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    matroska: Pointer;
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function Nanosec2String(time: Int64): String;
begin
  time := time div 1000000;
  Nanosec2String:=IntToStr(time div 3600000)+'h' + IntToStr((time div 60000) mod 60)
    + 'min' + IntToStr((time div 1000) mod 60)+'sec' + IntToStr(time mod 1000);
end;

procedure TForm1.Button1Click(Sender: TObject);
var i,j:integer;
    f: single;
    freq: single;
    iTracks:integer;
    S: String;
    C: PChar;
    D: PChar;

    chp: TGetChapterInfo;
    att: TGetAttachmentStruct;
    seg: TGetSegmentInfo;
    trk: TGetTrackInfo;
    mof: TOpenFileStruct;

    indx: packed array[0..2] of integer;

    chapter_count: integer;
    attachment_count: integer;
begin
  getmem(C,20480);
  if OpenDialog1.Execute then begin
    ListBox1.Clear;
    ListBox2.Clear;
    ListBox3.Clear;
    S:=Opendialog1.FileName;
    Edit1.Text := '';
    Edit2.Text := '';
    Edit3.Text := S;
    Edit5.Text := '';

    mof.cbSize := sizeof(mof);
    mof.charset := MTROF_ANSI;
    mof.access := MTR_OPEN_READ;
    mof.filename := PChar(S);
    mtrOpen(@mof,matroska);

    if (matroska = NIL) then begin
      MessageBox(0,'File does not appear to be a valid Matroska file!',
        'Error', MB_OK);
      exit;
    end;

    seg.cbsize := sizeof(seg);
    seg.index := 0;
    seg.pBuffer := C;
    seg.max_buffer_len := 1024;
    seg.charset := MTRSI_ANSI;
    mtrGetSegmentInfo(matroska, @seg);
    if (seg.number_of_titles_returned > 0) then
        Edit6.Text := seg.title_txt[0] +
                      ' (required buffer size: ' +
                      IntToStr(seg.required_buffer_size)+')';

    if ((seg.flags and GSISF_MUXINGAPP) = GSISF_MUXINGAPP) then
        Edit1.Text := seg.muxing_app;

    if ((seg.flags and GSISF_WRITINGAPP) = GSISF_WRITINGAPP) then
        Edit2.Text := seg.writing_app;

    f := seg.duration;
    f := f * seg.timecode_scale / 1000000000;
    S:=FloatToStrF(f,ffNumber,8,2)+' sec';
    Edit5.Text := S;

    iTracks:=seg.number_of_tracks;
    for i:=0 to iTracks-1 do begin
      trk.cbsize := sizeof(trk);
      trk.index := i;
      trk.max_buffer_len := 1024;
      trk.pBuffer := C;
      trk.charset := MTRSI_ANSI;
      mtrGetTrackInfo(matroska, @trk);

      S:='';
      S:=S+'Track '+IntToStr(trk.track_number);
      case trk.track_type of
        MTR_TRACKTYPE_VIDEO: S:=S+' video (';
        MTR_TRACKTYPE_AUDIO:
            begin
            freq := trk.sampling_frequency;
            S:=S+' audio ('+
              FloatToStrF(freq,ffNumber,6,0)+' Hz, '+
              IntToStr(trk.channels)+' ch, ';
            end;
        MTR_TRACKTYPE_SUBTITLES: S:=S+' subtitles (';
      end;
      S:=S + trk.codec_id +')';
      if (trk.flags and GTISF_BITRATE) = GTISF_BITRATE then begin
        f := trk.bitrate;
        S:=S+' - '+FloatToStrF(f/1000,ffNumber,8,2)+' kbps';
      end;

      if (trk.number_of_titles_returned > 0) then
        S:=S + ', Name: ' + trk.title_txt[0];

      S:=S + ', required buffer size: ' + IntToStr(trk.required_buffer_size);

      ListBox1.Items.Add(S);
    end;

    chp.cbSize := sizeof(chp);
    chp.pIndex := @indx;
    chp.max_buffer_len := 0;
    chp.charset := MTRCHI_ANSI;
    indx[0] := 1;
    indx[1] := 0;
    i:=mtrGetChapter(matroska, @chp);
    chapter_count := chp.number_of_subchapters;

    for i:=0 to chapter_count-1 do begin
      indx[0] := 2;
      indx[1] := 0;
      indx[2] := i;
      chp.max_buffer_len := 20480;
      chp.pBuffer := C;
      chp.title_lng := nil;
      chp.title_txt := nil;
      mtrGetChapter(matroska, @chp);
      if (chp.end_time = -1) then begin
        S:='Chapter ' + IntToStr(i+1) + ':  ' +
           Nanosec2String(chp.start_time);
      end else
        S:='Chapter ' + IntToStr(i+1) + ':  ' +
           Nanosec2String(chp.start_time) + ' - ' + Nanosec2String(chp.end_time);

      S:=S+': ' + IntToStr(chp.number_of_titles) +
           ' Titles, required buffer size: '+IntToStr(chp.required_buffer_size) + ')';

      ListBox2.Items.Add(S);

      for j:=0 to chp.number_of_titles_returned-1 do begin
        S:='    ' + chp.title_lng[j] + ': ' + chp.title_txt[j];
        ListBox2.Items.Add(S)
      end;
    end;
    attachment_count := seg.number_of_attachments;

    for j:=0 to attachment_count-1 do begin
      att.cbSize := sizeof(att);
      att.index := j;
      att.pBuffer := C;
      att.max_buffer_len := 20480;
      att.charset := MTRATTI_ANSI;

      i:=mtrGetAttachment(matroska, @att);

      ListBox3.Items.Add(att.filename + ' (' + att.mime_type + ',' +
        att.description + '), UID: ' + IntToStr(att.uid));
    end;

    mtrClose(matroska);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  C: pChar;
  Version: DWORD;
begin
  getmem(C, 2048);
  Version := mtrGetDLLInfo(MTRDLL_VERNBR, nil);

  mtrGetDLLInfo(MTRDLL_BUILDDATE, C);
  Edit4.Text := IntToStr(Version shr 16) + '.'+
                IntToStr(Version and $FFFF) + ' (' + C + ')';
  freemem(C);
end;

end.
