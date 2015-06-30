unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jpeg, ExtCtrls, StdCtrls, Spin, PicShow;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    Step: TSpinEdit;
    Style: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Threaded: TCheckBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    PicShow: TPicShow;
    Panel2: TPanel;
    Timer: TTimer;
    ManualStyle: TRadioButton;
    TurnStyle: TRadioButton;
    RandomStyle: TRadioButton;
    SelectFolder: TButton;
    CurrentFilename: TPanel;
    FreeMemory: TPanel;
    Label3: TLabel;
    Delay: TSpinEdit;
    Panel3: TPanel;
    ScrollBar: TScrollBar;
    Panel4: TPanel;
    Auto: TCheckBox;
    Label4: TLabel;
    ShowPause: TSpinEdit;
    Label5: TLabel;
    ClearOldImage: TCheckBox;
    Bevel3: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PicShowDblClick(Sender: TObject);
    procedure ThreadedClick(Sender: TObject);
    procedure StyleChange(Sender: TObject);
    procedure StepChange(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure PicShowComplete(Sender: TObject);
    procedure ManualStyleClick(Sender: TObject);
    procedure AutoClick(Sender: TObject);
    procedure SelectFolderClick(Sender: TObject);
    procedure ScrollBarChange(Sender: TObject);
    procedure PicShowProgress(Sender: TObject);
    procedure DelayChange(Sender: TObject);
    procedure PicShowCustomDraw(Sender: TObject; Picture, Screen: TBitmap);
  private
    PicPath: String;
    Pictures: TStringList;
    procedure CheckTimer;
    procedure ShowNextImage;
    procedure LoadNextImage;
    procedure CreateImageList(Path: String);
    procedure UpdateMemoryStatus(Sender: TObject; var Done: Boolean);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

uses
  FileCtrl;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Randomize;
  // Updates controls by PicShow properties
  Style.MaxValue := High(TShowStyle);
  Style.Value := PicShow.Style;
  Threaded.Checked := PicShow.Threaded;
  Step.Value := PicShow.Step;
  Delay.Value := PicShow.Delay;
  ManualStyle.Checked := PicShow.Manual;
  ScrollBar.Enabled := ManualStyle.Checked;
  // On idle time shows percentage of free physical memory
  Application.OnIdle := UpdateMemoryStatus;
  // Creates list of images and fills it by images found in the program path
  Pictures := TStringList.Create;
  CreateImageList(ExtractFilePath(Application.ExeName));
  // Loads an image to Picshow
  LoadNextImage;
  // Updates the timer status
  CheckTimer;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  Pictures.Free;
end;

procedure TMainForm.PicShowDblClick(Sender: TObject);
begin
  ShowNextImage;
end;

procedure TMainForm.StyleChange(Sender: TObject);
begin
  PicShow.Style := Style.Value;
end;

procedure TMainForm.ThreadedClick(Sender: TObject);
begin
  PicShow.Threaded := Threaded.Checked;
end;

procedure TMainForm.StepChange(Sender: TObject);
begin
  PicShow.Step := Step.Value;
end;

procedure TMainForm.TimerTimer(Sender: TObject);
begin
  ShowNextImage;
end;

procedure TMainForm.PicShowComplete(Sender: TObject);
begin
  // When PicShow draws the image completely, we load the next image into it.
  // Of course, we can load the image every time even when PicShow is busy.
  // PicShow converts the image to Bitmap and use this copy in its process.
  LoadNextImage;
  CheckTimer;
end;

procedure TMainForm.ManualStyleClick(Sender: TObject);
begin
  PicShow.Manual := ManualStyle.Checked;
  ScrollBar.Enabled := ManualStyle.Checked;
  if PicShow.Manual then
  begin
    // When PicShow is in manual mode, we must first call execute and after it
    // we can change the progress. If PicShow is already busy, calling execute
    // is not required.
    if not (PicShow.Busy or PicShow.Empty) then
      PicShow.Execute;
    ScrollBar.Position := PicShow.Progress;
  end;
  CheckTimer;
end;

procedure TMainForm.AutoClick(Sender: TObject);
begin
  CheckTimer;
end;

procedure TMainForm.SelectFolderClick(Sender: TObject);
var
  Path: String;
begin
  Path := PicPath;
  if SelectDirectory(Path, [], 0) then
  begin
    CreateImageList(Path);
    CheckTimer;
  end;
end;

procedure TMainForm.ScrollBarChange(Sender: TObject);
begin
  PicShow.Progress := ScrollBar.Position;
end;

procedure TMainForm.PicShowProgress(Sender: TObject);
begin
  if ScrollBar.Enabled then
    ScrollBar.Position := PicShow.Progress;
end;

procedure TMainForm.DelayChange(Sender: TObject);
begin
  PicShow.Delay := Delay.Value;
end;

// This procedure will be called when PicShow.Style is 0
// Picture: This is the image.
// Screen: This is what we should draw on it.
procedure TMainForm.PicShowCustomDraw(Sender: TObject; Picture,
  Screen: TBitmap);
var
  Text: String;
begin
  Text := Format('CUSTOM: PROGRESS = %d%%', [PicShow.Progress]);
  Screen.Canvas.Draw(0, 0, Picture);
  SetTextAlign(Screen.Canvas.Handle, TA_CENTER or TA_BASELINE);
  Screen.Canvas.TextOut(Screen.Width div 2, Screen.Height div 2, Text);
end;

// Turns timer on or off according to state of controls (UPDATED)
procedure TMainForm.CheckTimer;
var
  EnableTimer: Boolean;
begin
  EnableTimer := not PicShow.Busy and Auto.Checked and
    not ManualStyle.Checked and (Pictures.Count > 0);
  if EnableTimer <> Timer.Enabled then
  begin
    if EnableTimer then
      Timer.Interval := ShowPause.Value * 1000;
    Timer.Enabled := EnableTimer;
  end;
end;

// Shows the currently loaded image into PicShow
procedure TMainForm.ShowNextImage;
begin
  // if there is not any image in the list exit
  if Pictures.Count = 0 then Exit;
  // if PicShow is playing, stops it
  if PicShow.Busy then
  begin
    PicShow.Stop;
    // Stop method does not fire OnComplete event then we do it manually
    PicShowComplete(Self);
  end;
  // Sets the animation style according to user sellection
  if RandomStyle.Checked then
    Style.Value := Random(High(TShowStyle))+1
  else if TurnStyle.Checked then
    if Style.Value < High(TShowStyle) then
      Style.Value := Style.Value + 1
    else
      Style.Value := 1;
  // Clears background if it is required (UPDATED)
  if ClearOldImage.Checked then
  begin
    PicShow.Clear;
    PicShow.Update;
  end;
  // Begins the animation
  PicShow.Execute;
  // Checks the timer state, usually turn it off
  CheckTimer;
end;

// Selects randomly an image from the image list and loades it into PicShow
procedure TMainForm.LoadNextImage;
const
  CurrentImage: String = '';
var
  Index: Integer;
begin
  if Pictures.Count > 0 then
  begin
    repeat
      Index := Random(Pictures.Count);
    until (Pictures.Count <= 1) or (CurrentImage <> Pictures[Index]);
    CurrentImage := Pictures[Index];
    PicShow.Picture.LoadFromFile(PicPath + CurrentImage);
    CurrentFilename.Caption := PicPath + CurrentImage;
  end;
end;

// Creates a list of image filenames found in the path
procedure TMainForm.CreateImageList(Path: String);
var
  FileList: TFileListBox;
begin
  FileList := TFileListBox.Create(Self);
  try
    FileList.Parent := Self;
    FileList.Visible := False;
    FileList.Mask := GraphicFileMask(TGraphic);
    FileList.Directory := Path;
    if FileList.Items.Count > 0 then
    begin
      Pictures.Assign(FileList.Items);
      if (Length(Path) > 0) and (Path[Length(Path)] <> '\') then
        PicPath := Path + '\'
      else
        PicPath := Path;
    end
    else
      MessageDlg(Path + #10#13'does not contain any supported image file',
        mtWarning, [mbOK], 0);
  finally
    FileList.Free;
  end;
end;

// Updates percentage of available physical memory on the screen
procedure TMainForm.UpdateMemoryStatus(Sender: TObject; var Done: Boolean);
var
  MemoryStatus: TMemoryStatus;
begin
  GlobalMemoryStatus(MemoryStatus);
  FreeMemory.Caption := Format('Free Memory: %%%.1f',
    [100. * MemoryStatus.dwAvailPhys / MemoryStatus.dwTotalPhys]);
  FreeMemory.Update;
end;

end.
