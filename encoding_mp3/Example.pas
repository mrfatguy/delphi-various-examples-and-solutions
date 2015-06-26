unit Example;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Gauges, StdCtrls;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    BitBtn1: TBitBtn;
    Gauge1: TGauge;
    BitBtn2: TBitBtn;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
  private
    { Private declarations }
    RawFileName,
    Mp3FileName : String;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

const
  FormCap = 'Blade Encoder shell (Bladeenc.dll v.0.82)';

implementation

{$R *.DFM}

uses bladedll;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  if openDialog1.Execute then begin
    SpeedButton1.Caption := OpenDialog1.Filename;
    RawFileName := OpenDialog1.Filename;
  end;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
var
  TmpStr : String;
begin
  if RawFileName <> '' then begin
    TmpStr := RawFileName;
    Delete(TmpStr,Pos(ExtractFileExt(RawFileName),RawFileName),Length(RawFileName));
    SaveDialog1.FileName := TmpStr+'.mp3';
  end;
  if SaveDialog1.Execute then begin
    SaveDialog1.DefaultExt := '.mp3';
    SpeedButton2.Caption := SaveDialog1.Filename;
    Mp3FileName := SaveDialog1.FileName;
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  BladeHandle : THbeStream;
  beConfig    : TBeConfig;
  NumSamples,
  mp3bufferSize : DWORD;
  Err         : TBeErr;
  Mp3Buffer,
  rawBuffer   : pointer;

  Mp3File,
  RawFile     : TFileStream;
  FileLength,
  Done,
  dwWrite,
  toread,
  isread,
  toWrite,
  IsWritten   : DWORD;

procedure CleanUp;
begin
  beCloseStream(BladeHandle);
  RawFile.Free;
  Mp3File.Free;
  FreeMem(Mp3Buffer);
  FreeMem(RawBuffer);
end;

begin
  RawBuffer := nil;
  Mp3Buffer := nil;

  if RawFileName = '' then begin
    SpeedButton1Click(Sender);
    if RawFileName = '' then exit;
  end;

  if Mp3FileName = '' then begin
    SpeedButton2Click(Sender);
    if Mp3FileName = '' then exit;
  end;

  RawFile := TFileStream.Create(RawFileName,fmOpenRead);
  mp3File := TFileStream.Create(Mp3FileName,fmCreate or fmShareDenyNone);

  FillChar(BeConfig,SizeOf(BeConfig),#0);
  With BeConfig.Format do begin
    dwConfig := BE_CONFIG_MP3;
    mp3.dwSampleRate := 44100;
    mp3.byMode := BE_MP3_MODE_STEREO;
    mp3.wBitrate := 128;
    mp3.bPrivate := False;
    mp3.bCRC     := False;
    mp3.bCopyright := False;
    mp3.bOriginal := False;
  end;

  Err := BeInitStream(BeConfig, NumSamples, Mp3BufferSize, BladeHandle);
  if Err <> BE_ERR_SUCCESSFUL then begin
    MessageDlg('Error opening encoding stream '+IntToStr(Err),MtError,[MbOk],0);
    Exit;
  end;

  GetMem(Mp3Buffer,mp3BufferSize);
  GetMem(RawBuffer,NumSamples);

  FileLength := RawFile.Size;
  Done := 0;
  Gauge1.MinValue := 0;
  Gauge1.MaxValue := FileLength;

  while done <> FileLength do begin
    if (done + (NumSamples * 2) < FileLength) then
      toRead := NumSamples * 2
    else
      toRead := Filelength - done;

    isread := RawFile.Read(Rawbuffer^,ToRead);
    if IsRead <> ToRead then begin
      Messagedlg('Read Error',MtError,[MbOk],0);
      Cleanup;
      Exit;
    end;
    Err := beEncodeChunk(BladeHandle,(Toread div 2), RawBuffer, mp3Buffer, toWrite);
    if Err <> BE_ERR_SUCCESSFUL then begin
      MessageDlg('beEncodeChunk failed '+IntToStr(Err),mtError,[MbOk],0);
      CleanUp;
      Exit;
    end;
    IsWritten := mp3File.Write(mp3buffer^,ToWrite);
    if ToWrite <> isWritten then begin
      Messagedlg('Write Error',MtError,[MbOk],0);
      Cleanup;
      Exit;
    end;
    done := Done + ToRead;
    Gauge1.AddProgress(ToRead);
    Application.processMessages;
  end;
  Err := beDeinitStream(BladeHandle, mp3Buffer, dwWrite);
  if Err <> BE_ERR_SUCCESSFUL then begin
    MessageDlg('beExitStream failed '+intToStr(Err),mtError,[MbOk],0);
    Cleanup;
    Exit;
  end;
  isWritten := mp3File.Write(mp3Buffer^,dwWrite);
  if dwWrite <> isWritten then begin
    MessageDlg('Write error',MtError,[MbOk],0);
    CleanUp;
    exit;
  end;

  CleanUp;
  Messagedlg('Done',Mtinformation,[Mbok],0);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  RawFileName := '';
  mp3FileName := '';
  Form1.Caption := formCap;
end;

procedure TForm1.FormDblClick(Sender: TObject);
var
  Version : TBeVersion;

begin
  beVersion(Version);
  ShowMessage(
  'BladeEnc DLL version : '+IntToStr(Version.byDLLMajorVersion)+'.'+IntToStr(Version.byDLLMinorVersion)+#13+
  'BladeEnc version : '+IntToStr(Version.byMajorVersion)+'.'+IntToStr(Version.byMinorVersion)+#13+
  'BladeEnc date : '+IntToStr(Version.byDay)+'-'+IntToStr(Version.byMonth)+'/'+IntToStr(Version.wYear)+#13+
  'BladeEnc Homepage : '+Version.zHomepage);
end;

end.
