unit main;

(*******************************************************************************
  change the following directive to use MP3, WMA, WAV or RAW files as input...

  I hope someone will code a powerful player including all modules at the same
  time... in this way testing of input modules will be really easy...
*******************************************************************************)

{$DEFINE ELAMP} // You can define "ELAMP", "WMAMP", "WAVMP" or "RAWMP"

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ElSounds, StdCtrls, slider, ExtCtrls, ComCtrls, Db, DBTables,
  ELAMPDefs, WMAMPDefs, WAVMPDefs, RAWMPDefs;

type
  TPlayForm = class(TForm)
    OpenBtn: TButton;
    OpenDlg: TOpenDialog;
    PauseBtn: TButton;
    StopBtn: TButton;
    PlayBtn: TButton;
    Timer: TTimer;
    Label1: TLabel;
    AboutBtn: TButton;
    InfoBtn: TButton;
    ID3Btn: TButton;
    DirectXCB: TCheckBox;
    WaveCB: TCheckBox;
    SaveDlg: TSaveDialog;
    LeftVU: TProgressBar;
    RightVU: TProgressBar;
    PlayerMan: TElPlayerMan;
    procedure OpenBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PauseBtnClick(Sender: TObject);
    procedure PlayBtnClick(Sender: TObject);
    procedure StopBtnClick(Sender: TObject);
    procedure SliderStopTracking(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure Slider1StopTracking(Sender: TObject);
    procedure AboutBtnClick(Sender: TObject);
    procedure InfoBtnClick(Sender: TObject);
    procedure ID3BtnClick(Sender: TObject);
    procedure Slider2Change(Sender: TObject);
    procedure PlayerManPlayers0InputClose(Sender: TObject;
      UserData: Integer; var Success: Boolean);
    procedure PlayerManPlayers0InputOpen(Sender: TObject;
       var UserData: Integer; var CanSetPos : boolean; var Success: Boolean);
    procedure PlayerManPlayers0InputGetSize(Sender: TObject;
      UserData: Integer; var Size: Integer; var Success: Boolean);
    procedure PlayerManPlayers0InputSeek(Sender: TObject; UserData : integer; var NewPos : integer;
      SeekMode: Integer; var Success: Boolean);
    procedure PlayerManPlayers0InputRead(Sender: TObject;
      UserData: Integer; Buffer: Pointer; BytesToRead: Integer;
      var BytesRead: Integer; var Success: Boolean);
    procedure FormShow(Sender: TObject);
    procedure PlayerManPlayers0OutputInit(Sender: TObject;
      var Success: Boolean);
    procedure PlayerManPlayers0OutputDone(Sender: TObject;
      var Success: Boolean);
    procedure PlayerManPlayers0Output(Sender: TObject; SampleData: Pointer;
      SBits, Channels, SampleRate, Size: Integer; var success: Boolean);
    procedure DirectXCBClick(Sender: TObject);
    procedure WaveCBClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    LeftVUValue : integer;
    RightVUValue: integer;
    LeftVUMax   : integer;
    RightVUMax  : integer;
    Left, Right : array[0..255] of integer;
    Buffers, Count  : integer;
  public
    { Public declarations }
    Player : TElPlayer;
    procedure UpdateVU(var Msg : TMessage); message WM_USER + 123;
  end;

var
  PlayForm: TPlayForm;

implementation

{$R *.DFM}

procedure TPlayForm.OpenBtnClick(Sender: TObject);
var S,E : String;
    i : integer;
    TPl : TElPlayer;
begin
  S := '';
  E := '';
  for i := 0 to PlayerMan.Players.Count - 1 do
  begin
    TPl := PlayerMan.Players[i];
    if TPl.Initialized then begin
      S := S + TPl.ModuleName + ' (' + TPl.Extensions + ')' + '|' + TPl.Extensions + '|';
      E := E + TPl.Extensions + ';';
    end;
  end;
  if Length(E) > 0 then Delete(E, Length(E), 1);
  S := 'All Supported Files' + '|' + E + '|' + S;
  if Length(S) > 0 then Delete(S, Length(S), 1);
  OpenDlg.Filter := S;

  if OpenDlg.Execute then
  begin
    StopBtnClick(Self);
    Player := PlayerMan.WhoseType(ExtractFileExt(OpenDlg.FileName));
    if Player = nil then
    begin
      MessageDlg(Format('Failed to play %s: no decoder for this type of file found.', [OpenDlg.FileName]), mtError, [mbOk], 0);
      exit;
    end;

    if(Player.PlayerMode > pmClosed) then
    begin
      Timer.Enabled := false;
      //Slider.Value := 0;
      //Slider.Enabled := false;
      Player.Close;
    end;
(*******************************************************************************
    for the best VU results use small buffers... 4096 is a really good value.
    you can use a lot of buffers!! I synchronized the VU Meter at all!!

    To know VU Meter FPS (Frames Per Second) use the following function:
    FPS := 176400 / BufferSize  (assuming 16Bit 44100 Stereo samples)
*******************************************************************************)
    Buffers := 8; Player.BuffersCount := Buffers;
    Player.BufferSize := 8196;

    Player.InputName := OpenDlg.FileName;
    Player.Open;
    Player.InitStream;
  end;
end;

procedure TPlayForm.FormShow(Sender: TObject);
begin
  if not assigned(Player) then exit;

  Player := PlayerMan.Players[0];
  Player.Init;

  //Slider2.Value := (Player.LeftVolume + Player.RightVolume) div 2;
end;

procedure TPlayForm.UpdateVU(var Msg : TMessage);
begin
  LeftVU.Position := LeftVUValue;
  RightVU.Position := RightVUValue;
end;

procedure TPlayForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not assigned(Player) then exit;
  Player.Deinit;
end;

procedure TPlayForm.PauseBtnClick(Sender: TObject);
begin
  if not assigned(Player) then exit;

  if (Player.PlayerMode <> pmPlaying) and
     (Player.PlayerMode <> pmPaused) then exit;

  if Player.Paused then
    begin
      Player.Resume;
      if not Player.Paused then PauseBtn.Caption := 'Pause';
    end
  else
    begin
      Player.Pause;
     if Player.Paused then PauseBtn.Caption := 'Resume';
    end;
end;

procedure TPlayForm.PlayBtnClick(Sender: TObject);
begin
  if not assigned(Player) then exit;

  if (Player.PlayerMode <> pmReady) and
     (Player.PlayerMode <> pmPlaying) then exit;

  if Player.PlayerMode = pmPlaying then begin
    Player.position := 0;
    exit;
  end;

  //Slider.MaxValue := Player.Size div 1000;

  PlayBtn.enabled := false;
  try
    Player.Play;
  finally
    PlayBtn.enabled := true;
  end;
  Timer.Enabled := true;
  //Slider.Enabled := true;
end;

procedure TPlayForm.StopBtnClick(Sender: TObject);
begin
  if not assigned(Player) then exit;

  if Player.PlayerMode <> pmPlaying then exit;

  StopBtn.Enabled := false;
  try
    Player.Stop;
  finally
    StopBtn.Enabled := true;
  end;
  Player.InitStream;
  //Slider.Value := 0;
  Timer.Enabled := false;
  //Slider.Enabled := false;
end;

procedure TPlayForm.SliderStopTracking(Sender: TObject);
begin
  if not assigned(Player) then exit;

  //Player.Position := Slider.Value * 1000;
  //Slider.Value := Player.Position div 1000;
end;

procedure TPlayForm.TimerTimer(Sender: TObject);
begin
  if not assigned(Player) then exit;

  if Player.PlayerMode = pmStopped then
  begin
    //Slider.Value := 0;
    Timer.Enabled := false;
    //Slider.Enabled := false;
    Player.InitStream;
  end else
  if (Player.PlayerMode = pmPlaying) or (Player.PlayerMode = pmPaused) then
  begin
    //Slider.Value := Player.Position div 1000;
    //Slider2.Value := (Player.LeftVolume + Player.RightVolume) div 2;
  end;
end;

procedure TPlayForm.Slider1StopTracking(Sender: TObject);
var x : integer;
begin
  if not assigned(Player) then exit;

  //x := Slider1.Value;
  //Player.Priority := ThreadPriorities[Slider1.Value];
  //Slider1.Value := x;
end;

procedure TPlayForm.AboutBtnClick(Sender: TObject);
begin
  if not assigned(Player) then exit;

  MessageDlg(Player.About, mtInformation, [mbOk], 0);
end;

procedure TPlayForm.InfoBtnClick(Sender: TObject);
var i : integer;
    p : Pointer;
    Layer,
    Bitrate,
    Frequency : integer;
    StereoMode : TElSStereoMode;
const stereomodes : array[TElSStereoMode] of string = ('Stereo', 'Joint Stereo', 'Dual Channel', 'Mono');
begin
  if not assigned(Player) then exit;

  if player.Extensions = '*.mp1;*.mp2;*.mp3' then
  begin
    Player.GetInfo1(nil, i);
    inc(i);
    GetMem(P, i);
    if Player.GetInfo1(P, i) then
    begin
      ELAMPDefs.DecodeMPEGInfo1(p, Layer, Bitrate, Frequency, StereoMode);
      MessageDlg(Format('Stream info:'#13#10'Layer: %d'#13#10'Bitrate: %d'#13#10'Frequency: %d'#13#10'StereoMode: %s', [Layer, Bitrate, Frequency, StereoModes[StereoMode]]), mtInformation, [mbOk], 0);
    end else
    begin
      MessageDlg('Failed to get stream info', mtError, [mbOk], 0);
    end;
    exit;
  end;

  if player.Extensions = '*.wma' then
  begin
    Player.GetInfo1(nil, i);
    inc(i);
    GetMem(P, i);
    if Player.GetInfo1(P, i) then
    begin
      WMAMPDefs.DecodeWMAInfo1(P, Bitrate, Frequency, StereoMode);
      MessageDlg(Format('Stream info:'#13#10'Bitrate: %d'#13#10'Frequency: %d'#13#10'StereoMode: %s', [Bitrate, Frequency, StereoModes[StereoMode]]), mtInformation, [mbOk], 0);
    end else
    begin
      MessageDlg('Failed to get stream info', mtError, [mbOk], 0);
    end;
    exit;
  end;

  if player.Extensions = '*.wav' then
  begin
    Player.GetInfo1(nil, i);
    inc(i);
    GetMem(P, i);
    if Player.GetInfo1(P, i) then
    begin
      WAVMPDefs.DecodeWAVInfo1(P, Bitrate, Frequency, StereoMode);
      MessageDlg(Format('Stream info:'#13#10'Bitrate: %d'#13#10'Frequency: %d'#13#10'StereoMode: %s', [Bitrate, Frequency, StereoModes[StereoMode]]), mtInformation, [mbOk], 0);
    end else
    begin
      MessageDlg('Failed to get stream info', mtError, [mbOk], 0);
    end;
    exit;
  end;

  if player.Extensions = '*.raw' then
  begin
    Player.GetInfo1(nil, i);
    inc(i);
    GetMem(P, i);
    if Player.GetInfo1(P, i) then
    begin
      RAWMPDefs.DecodeRAWInfo1(P, Bitrate, Frequency, StereoMode);
      MessageDlg(Format('Stream info:'#13#10'Bitrate: %d'#13#10'Frequency: %d'#13#10'StereoMode: %s', [Bitrate, Frequency, StereoModes[StereoMode]]), mtInformation, [mbOk], 0);
    end else
    begin
      MessageDlg('Failed to get stream info', mtError, [mbOk], 0);
    end;
    exit;
  end;
end;

procedure TPlayForm.ID3BtnClick(Sender: TObject);
var
    p : pointer;
    genre : byte;
    Title,
    Artist,
    Album,
    Year,
    Comment,
    CopyrightS,
    GenreS : string;
begin
  if not assigned(Player) then exit;

  if player.Extensions = '*.mp1;*.mp2;*.mp3' then
  begin
    p := Player.GetInfo2;
    if Assigned(p) then
    begin
      ELAMPDefs.DecodeMPEGInfo2(p, title, Artist, Album, Year, Comment, Genre);
      MessageDlg(Format('Stream ID3 info:'#13#10'Title: %s'#13#10'Artist: %s'#13#10'Album: %s'#13#10'Year: %s'#13#10'Comment: %s', [title, Artist, Album, Year, Comment]), mtInformation, [mbOk], 0);
    end else
    begin
      MessageDlg('Failed to get stream ID3 info', mtError, [mbOk], 0);
    end;
    exit;
  end;

  if player.Extensions = '*.wma' then
  begin
    p := Player.GetInfo2;
    if Assigned(p) then
    begin
      WMAMPDefs.DecodeWMAInfo2(p, title, Artist, Album, CopyRightS, Comment, GenreS, Year);
      MessageDlg(Format('Stream main tags info:'#13#10'Title: %s'#13#10'Artist: %s'#13#10'Album: %s'#13#10'Year: %s'#13#10'Comment: %s', [title, Artist, Album, Year, Comment]), mtInformation, [mbOk], 0);
    end else
    begin
      MessageDlg('Failed to get stream ID3 info', mtError, [mbOk], 0);
    end;
    exit;
  end;

  if player.Extensions = '*.wav' then
  begin
    MessageDlg('Unable to get stream ID3 info', mtError, [mbOk], 0);
    exit;
  end;

  if player.Extensions = '*.raw' then
  begin
    MessageDlg('Unable to get stream ID3 info', mtError, [mbOk], 0);
    exit;
  end;
end;

procedure TPlayForm.Slider2Change(Sender: TObject);
begin
  if not assigned(Player) then exit;

  //Player.LeftVolume  := Slider2.Value;
  //Player.RightVolume := Slider2.Value;
end;

procedure TPlayForm.PlayerManPlayers0InputClose(Sender: TObject;
  UserData: Integer; var Success: Boolean);
begin
  If (TObject(UserData) is TFileStream) then TFileStream(UserData).Free;
end;

procedure TPlayForm.PlayerManPlayers0InputOpen;
var Stream : TFileStream;
begin
  if not assigned(Player) then exit;

  try
    Stream := TFileStream.Create(Player.InputName, fmOpenRead or fmShareDenyWrite);
    UserData := Integer(Stream);
    CanSetPos := true;
    Success := true;
  except
    Success := false;
  end;
end;

procedure TPlayForm.PlayerManPlayers0InputGetSize(Sender: TObject;
  UserData: Integer; var Size: Integer; var Success: Boolean);
begin
  if (TObject(UserData) is TFileStream) then
  begin
    Size := TFileStream(UserData).Size;
    Success := true;
  end else Success := false;
end;

procedure TPlayForm.PlayerManPlayers0InputSeek;
var Poss: longint;
begin
  LeftVUValue := 0;
  RightVUValue := 0;
  PostMessage(Handle, WM_USER + 123, 0, 0);

  FillChar( Left, SizeOf(Left), 0);
  FillChar( Right, SizeOf(Right), 0);

  if (TObject(UserData) is TFileStream) then
  begin
    try
      if SeekMode = soFromBeginning
         then Poss := NewPos
         else Poss := TFileStream(UserData).Size + NewPos;
      NewPos := TFileStream(UserData).Seek(NewPos, SeekMode);
      Success := NewPos = Poss;
    except
      Success := false;
    end;
  end else Success := false;
end;

procedure TPlayForm.PlayerManPlayers0InputRead(Sender: TObject;
  UserData: Integer; Buffer: Pointer; BytesToRead: Integer;
  var BytesRead: Integer; var Success: Boolean);
var P : PChar;
begin
  if (TObject(UserData) is TFileStream) then
  begin
    P := PChar(Buffer);
    try
      BytesRead := TFileStream(UserData).Read(P^, BytesToRead);
      Success   := true;
    except
      Success := false;
    end;
  end else Success := false;
end;

procedure TPlayForm.PlayerManPlayers0OutputInit(Sender: TObject;
  var Success: Boolean);
begin
  LeftVUValue := 0;
  RightVUValue := 0;
  PostMessage(Handle, WM_USER + 123, 0, 0);

  FillChar( Left, SizeOf(Left), 0);
  FillChar( Right, SizeOf(Right), 0);

  Success := true;
end;

procedure TPlayForm.PlayerManPlayers0OutputDone(Sender: TObject;
  var Success: Boolean);
begin
  LeftVUValue := 0;
  RightVUValue := 0;
  PostMessage(Handle, WM_USER + 123, 0, 0);

  FillChar( Left, SizeOf(Left), 0);
  FillChar( Right, SizeOf(Right), 0);

  Success := true;
end;

procedure TPlayForm.PlayerManPlayers0Output(Sender: TObject;
  SampleData: Pointer; SBits, Channels, SampleRate, Size: Integer;
  var success: Boolean);

type
     TWordArray = array [0 .. 0] of SmallInt;
     PWordArray = ^TWordArray;
     TByteArray = array [0 .. 0] of ShortInt;
     PByteArray = ^TByteArray;

var i, j, L, R : integer;
    pb : PByteArray;
    pw : PWordArray;
    Step : byte;

begin
//  if not assigned(Player) then exit;

  pb := nil;
  pw := nil;

(*******************************************************************************
  just send to output a previuos buffered VU Meter values...
*******************************************************************************)
  LeftVUValue := Left[Count];
  RightVUValue := Right[Count];
  PostMessage(Handle, WM_USER + 123, 0, 0);

  Step := 8;

  j := Size div Channels;
  if SBits = 16 then
  begin
    j := j div 2;
    LeftVUMax := 65535;
    RightVUMax := 65535;
    pw := PWordArray(SampleData);
  end else
  begin
    LeftVUMax := 255;
    RightVUMax := 255;
    pb := PByteArray(SampleData);
  end;
  L := 0; R := 0;
  i := 0; j := j - Step;
  while i < j do
  begin
    if SBits = 16 then
    begin
      if Channels = 2 then
      begin
        if L < abs(pw^[i]) then L := abs(pw^[i]);
        if R < abs(pw^[i + 1]) then R := abs(pw^[i + 1]);
        inc(i, Step shl 1);
      end else
      begin
        if L < abs(pw^[i]) then L := abs(pw^[i]);
        R := L;
        inc(i, Step);
      end;
    end else
    begin
      if Channels = 2 then
      begin
        if L < abs(pb^[i]) then L := abs(pb^[i]);
        if R < abs(pb^[i + 1]) then R := abs(pb^[i + 1]);
        inc(i, Step shl 1);
      end else
      begin
        if L < abs(pb^[i]) then L := abs(pb^[i]);
        R := L;
        inc(i, Step);
      end;
    end;
  end;

  Left[Count] := Trunc( sqrt(L / (LeftVUMax shr 1)) * 100 );
  Right[Count] := Trunc( sqrt(R / (RightVUMax shr 1)) * 100 );

  inc(Count);
  Count := Count mod Buffers;

  Success := true;
end;

procedure TPlayForm.DirectXCBClick(Sender: TObject);
begin
  if not assigned(Player) then exit;

  if DirectXCB.Checked then
  begin
    try
      Player.OutputMode := omDirectSound;
    except
      begin
        DirectXCB.Checked := false;
        raise;
      end;
    end;
  end else Player.OutputMode := omMMSystem;
end;

procedure TPlayForm.WaveCBClick(Sender: TObject);
begin
  if not assigned(Player) then exit;

  Player.OutputMode := omMMSystem;
  if WaveCB.Checked then
  begin
    if SaveDlg.Execute then
    begin
      Player.OutputName := SaveDlg.FileName;
      Player.OutputMode := omFile;
    end;
  end;
end;

procedure TPlayForm.FormCreate(Sender: TObject);
var S : String;
    TPl : TElPlayer;
    SRec : TSearchRec;
begin
  S := ExtractFilePath(Application.ExeName);
  if FindFirst(S+'*.esp', faAnyFile, SRec) = 0 then
  begin
    repeat
      TPl := PlayerMan.Players.Add;
      TPl.PathToDLL := S + SRec.FindData.cFileName;
      try
        TPl.Init;
        TPl.inputMode := imFile;
        TPl.outputMode := omMMSystem;
        TPl.outputDevNum := -1;

        TPl.OnInputClose := PlayerManPlayers0InputClose;
        TPl.OnInputGetSize := PlayerManPlayers0InputGetSize;
        TPl.OnInputOpen := PlayerManPlayers0InputOpen;
        TPl.OnInputRead := PlayerManPlayers0InputRead;
        TPl.OnInputSeek := PlayerManPlayers0InputSeek;

        TPl.OnOutput := PlayerManPlayers0Output;
        TPl.OnOutputDone := PlayerManPlayers0OutputDone;
        TPl.OnOutputInit := PlayerManPlayers0OutputInit;
      except
        TPl.Free;
      end;
    until FindNext(SRec) <> 0;
  end;
  FindClose(SRec);
end;

end.

