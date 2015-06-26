unit testunit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, Tabnotbk, StdCtrls, CHFLZSS, CHFTYPES, ChiefLZ, Grids;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Edit1: TEdit;
    Edit2: TEdit;
    ChiefLZObj1: TChiefLZObj;
    Label1: TLabel;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    Edit3: TEdit;
    Edit4: TEdit;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Label3: TLabel;
    Label4: TLabel;
    Button3: TButton;
    Label5: TLabel;
    Edit5: TEdit;
    Button4: TButton;
    OpenDialog1: TOpenDialog;
    Button5: TButton;
    Button6: TButton;
    OpenDialog2: TOpenDialog;
    TabSheet3: TTabSheet;
    Button7: TButton;
    Label6: TLabel;
    StringGrid1: TStringGrid;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    CheckBox4: TCheckBox;
    Button8: TButton;
    RadioGroup1: TRadioGroup;
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    function ChiefLZObj1ConfirmOverwrite(Sender: TObject;
      const CurrentRecord, ExistingFileRecord: TLZReportRec): TLZReply;
    function ChiefLZObj1CheckPassWord(Sender: TObject;
      const Header: TLZArchiveHeader; const Code: Integer): Integer;
    function ChiefLZObj1RequestPassWord(Sender: TObject;
      var Header: TLZArchiveHeader): Integer;
    function ChiefLZObj1ViewArchive(Sender: TObject;
      const ArchiveInfo: PChiefLZArchiveHeader;
      const CurrentNum: Integer): Integer;
    function ChiefLZObj1ProgressReport(Sender: TObject;
      const CurrentRecord: TLZReportRec; const Number: Integer): Integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Progress, ChfUtils, MMSystem;

{$R *.DFM}

Const
C_Choices:Array[0..2] of TLZCompressionChoices =
(LZNoCompression, LZFastCompression, LZMaxCompression);

Const InternalFreePassCode = -43028472;

Var
TotCount, ReachedCount:Longint;

function SafeYield(WaitForMessage: Boolean): Boolean;
{ Yield control to other applications
  WaitForMessage parameter:
    true  - yields until a message appears in the message queue
    false - yields only once
  Returns
    true  - performed normal yield
    false - found wm_Quit message
}
var
  Msg: TMsg;
begin
  SafeYield := False;
  if PeekMessage(Msg, 0, 0, 0, pm_Remove) then begin
    if Msg.Message = wm_Quit then
    begin
      PostQuitMessage(Msg.wParam); { repost wm_Quit message }
      exit;
    end;
    if (Application <> nil) then Application.ProcessMessages
    else begin
       TranslateMessage(Msg);
       DispatchMessage(Msg)
    end
  end {peekmessage}
  else begin
       if WaitForMessage then WaitMessage else Sleep(0);
  end;
  SafeYield := True;
end; { function SafeYield }

{//////////////////////////////////////}
Procedure Delay(msecs: Longint);
{ emulation of the Crt Delay routine - yields control until a certain amount of
time
  in millisecods has passed - returns actual time waited }
var
  StartTime: longint;
begin
  StartTime := timeGetTime;
  { mind the boolean evaluation - we always want to do a SafeYield }
  while SafeYield(false) and (StartTime + msecs > timeGetTime) do ;
end;  { Delay }

procedure TForm1.Button2Click(Sender: TObject);
begin
    Close;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
    ChiefLZObj1.ArchiveFileSpecs := Edit1.Text;
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
     ChiefLZObj1.ArchiveName := Edit2.Text;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
i:longint;
s:string[255];
begin
    TotCount := 0;
    ReachedCount := 0;
    ProgressForm.ProgressBar1.position := 0;
    With ChiefLZObj1
    do begin
         If CheckBox1.Checked
         then RecurseDirs := LZfullRecurse
         else RecurseDirs := LZNoRecurse;
         
         CompressionChoice := C_Choices[RadioGroup1.ItemIndex];

         ArchiveFileSpecs := Edit1.Text;
         ArchiveName := Edit2.Text;
         If  (ArchiveFileSpecs>'') and (ArchiveName>'')
         then begin
            If FileExists(ArchiveName) then begin
               s := 'The LZ archive '+ArchiveName+' already exists!'+#13#10+' Should I overwrite it?'+#0;
               If MessageBox(Handle, @s[1], 'Attention', mb_YesNo+Mb_IconQuestion)
               <> id_Yes then Exit;
            end;
            With ProgressForm
            do begin
               ProgressForm.Label2.Caption := 'Scanning directories';
               ProgressForm.Label4.Caption := 'Please wait ... ';
               Show;
               Delay(4);
            end;
            i := CreateArchive;
            ProgressForm.Hide;
            If i > 0 then begin
               FreePassWordFlag (InternalFreePassCode);
               Label6.Caption := ArchiveName;
               ViewArchive;
               ResetPassWordFlag;
            end;
            str(i, s);
            s := s+' file(s) archived.'+#0;
            MessageBox(Handle, @s[1],'Chief LZ', mb_ok);
         end
         else MessageBeep(0);
    end;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
   With ChiefLZObj1
   do begin
      If CheckBox1.Checked then RecurseDirs := LZfullRecurse
      else RecurseDirs := LZNoRecurse;
   end
end;

procedure TForm1.Button3Click(Sender: TObject);
var
i:longint;
s:string[255];
begin
   TotCount := 0;
   ReachedCount := 0;
   ProgressForm.ProgressBar1.position := 0;
   With ChiefLZObj1
   do begin
      ArchiveName := Edit3.Text;
      DeArchiveTargetDirectory := Edit4.Text;
      DearchiveMask := Edit5.Text;
      DearchiveRecurse := CheckBox2.Checked;
      CheckFileCRCs    := CheckBox3.Checked;
      ExtractUnExpanded := CheckBox4.Checked;
      if (ArchiveName > '') and (DeArchiveTargetDirectory > '')
      then begin
         ProgressForm.Show;
         i := DecompressArchive;
         str(i, s);
         ProgressForm.Hide;
         If i > 0 then begin
            FreePassWordFlag (InternalFreePassCode);
            Label6.Caption := ArchiveName;
            ViewArchive;
            ResetPassWordFlag;
         end;
         s := s+' file(s) extracted from archive.'+#0;
         MessageBox(Handle, @s[1],'Chief LZ', mb_ok);
      end
      else MessageBeep(0);
   end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   With ChiefLZObj1
   do begin
      Edit1.Text := ArchiveFileSpecs;
      Edit2.Text := ArchiveName;
      Edit3.Text := ArchiveName;
      Edit4.Text := DeArchiveTargetDirectory;
      CheckBox1.Checked := RecurseDirs = LZFullRecurse;
      CheckBox2.Checked := True;
      CheckBox3.Checked := CheckFileCRCs;
      CheckBox4.Checked := ExtractUnExpanded;
      DearchiveRecurse  := True;
      {OnConfirmOverwrite := ConfirmOverwriteW;}
      With StringGrid1 do begin
           ColWidths[0] := 80;
           ColWidths[1] := 80;
           ColWidths[2] := 40;
           ColWidths[3] := 60;
           ColWidths[4] := 80;
           ColWidths[5] := 100;
           ColWidths[6] := 192;
      end;
      StringGrid1.Cells[0, 0] := 'Normal Size';
      StringGrid1.Cells[1, 0] := 'Compressed';
      StringGrid1.Cells[2, 0] := 'Ratio';
      StringGrid1.Cells[3, 0] := 'Version';
      StringGrid1.Cells[4, 0] := 'CRC-32';
      StringGrid1.Cells[5, 0] := 'Date';
      StringGrid1.Cells[6, 0] := 'File Name in archive';
   end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
     If OpenDialog1.Execute then begin
        Edit3.Text := OpenDialog1.Filename;
     end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
   If OpenDialog1.Execute then begin
        Edit2.Text := OpenDialog1.Filename;
   end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
    If OpenDialog2.Execute then
    Edit1.Text := '/F='+OpenDialog2.FileName;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
   If OpenDialog1.Execute then
   With ChiefLZObj1
   do begin
      Label6.Caption := '';
      ArchiveName := OpenDialog1.FileName;
      Label6.Caption := ArchiveName;
      Edit2.Text := ArchiveName;
      Edit3.Text := ArchiveName;
      ViewArchive;
   end;
end;

FUNCTION Time2Str ( CONST l : LongInt ) : string;
BEGIN
  Result := FormatDateTime ( 'dd/mm/yy  hh:nn', FileDateToDateTime ( l ) )
END;

procedure TForm1.Button8Click(Sender: TObject);
Var
i: integer;
begin
   With StringGrid1
   do begin
        For i := 7 to Pred(ColCount) do Cols[i].Clear;
        For i := 1 to Pred(RowCount) do Rows[i].Clear;
   end;
   Label6.Caption  := 'Archive name';
   Label13.Caption := 'Size';
   Label14.Caption := 'Compressed';
   Label15.Caption := 'Ratio';
   Label16.Caption := 'Count';
end;

function TForm1.ChiefLZObj1ConfirmOverwrite(Sender: TObject;
  const CurrentRecord, ExistingFileRecord: TLZReportRec): TLZReply;
  VAR
  i : integer;
  p : pchar;
  s : string [48];
  s1 : string [5];

BEGIN
  Result := LZYes;
  WITH CurrentRecord
  DO BEGIN
    Getmem ( p, 512 );
    strpcopy ( p, 'The file "' + ExistingFileRecord.Names + '" already exists: ' + #13#10#13#10 );
    Strpcat ( p, 'Details of the source file: '+#13#10#13#10);
    Strpcat ( p, 'File Name : ' + CurrentRecord.Names + #13#10#13#10 );

    str ( Sizes, s );
    strpcat ( p, 'Compressed Size  : ' + s + ' bytes' + #13#10#13#10 );

    str ( uSizes, s );
    strpcat ( p, 'Uncompressed Size: ' + s + ' bytes' + #13#10#13#10 );

    s1 := 'HRSA';
    IF fAttrs AND faHidden   = 0 THEN s1 [1] := '_';
    IF fAttrs AND faReadOnly = 0 THEN s1 [2] := '_';
    IF fAttrs AND faSysFile  = 0 THEN s1 [3] := '_';
    IF fAttrs AND faArchive  = 0 THEN s1 [4] := '_';

    strpcat ( p, 'File Version : ' + CurrentRecord.FileVersion + #13#10#13#10 );

    s := HexL ( CRCs );
    strpcat ( p, '32-bit CRC: ' + s + '' + #13#10#13#10 );

    str ( GetCompressionRatio ( Sizes, uSizes ), s );
    strpcat ( p, 'Compression ratio: ' + s + '%' + #13#10#13#10 );

    strpcat ( p, 'Well, Should I overwrite the existing file?' );

    i := messagebox ( Handle, p, 'ChiefLZ', mb_IconQuestion + mb_YesNoCancel );
    CASE i OF
         id_Yes : Result := LZYes;
         id_No  : Result := LZNo;
         id_Cancel : Result := LZQuit;
    end; { Case }
    freemem ( p, 512 );
  end;  { With }
end;

{ here, we use a password hashing algorithm which is very
  different from the one in CHFHASH.PAS - just to show how
  a different password protection can be implemented, while
  maintaining compatibility with the file format
  }
function NewHash(Const s:String):TLZCount;
Var
i:Word;
j:TLZCount;
Begin
    i := length(s)+35;
    j := (i * i)+length(s);
    for i := 1 to length(s) do inc(j, Ord(s[i])*i);
    NewHash := (j * 15) - (length(s) div 3);
End;

function TForm1.ChiefLZObj1CheckPassWord(Sender: TObject;
  const Header: TLZArchiveHeader; const Code: Integer): Integer;
  Var
  s:String;
begin
    If Code = (InternalFreePassCode)
    then begin
       Result := LZCode_CorrectPassWord;
       Exit;
    end;

    Result := LZCode_WrongPassWord;
    s := InputBox('Password','Please supply your password:','');
    If s = '' then exit;
    With Header.Reserved
    do begin
        If  (MagicN[5] = NewHash(s))
        and (MagicN[7] = (MagicN[5] Div 15))
        then
        Result := LZCode_CorrectPassWord;
    end;
end;

{again, we use different fields in the header to store our
password, again, to be different from the others}
function TForm1.ChiefLZObj1RequestPassWord(Sender: TObject;
  var Header: TLZArchiveHeader): Integer;
  Var
  s:String;
begin
    Result := LZCode_NoPassWord;
    s := InputBox('Password protection?','Archive password (or click on CANCEL)',
    '');

    If s = '' then exit;
    With Header.Reserved do begin
        MagicN[5] := NewHash(s);
        MagicN[7] := MagicN[5] Div 15;
        Result := LZCode_NewPassWord;
    end;
end;

function TForm1.ChiefLZObj1ViewArchive(Sender: TObject;
  const ArchiveInfo: PChiefLZArchiveHeader;
  const CurrentNum: Integer): Integer;
begin
   If CurrentNum > 0 then
   With ArchiveInfo^.Files[CurrentNum]^
   do begin
      StringGrid1.RowCount := Succ(ArchiveInfo^.Count);
      StringGrid1.Cells[5, CurrentNum] := Time2Str(Times);
      If IsDir then begin
         StringGrid1.Cells[0, CurrentNum] := '[DIR]';
         StringGrid1.Cells[1, CurrentNum] := '-';
         StringGrid1.Cells[2, CurrentNum] := '-';
         StringGrid1.Cells[3, CurrentNum] := '-';
         StringGrid1.Cells[4, CurrentNum] := '-';
         StringGrid1.Cells[6, CurrentNum] := ChiefLZObj1.FullLZName ( CurrentNum )+'\';
      end else begin
         StringGrid1.Cells[0, CurrentNum] := IntToStr(uSizes);
         StringGrid1.Cells[1, CurrentNum] := IntToStr(Sizes);
         StringGrid1.Cells[2, CurrentNum] := IntToStr(GetCompressionRatio ( Sizes, uSizes ))+'%';
         StringGrid1.Cells[3, CurrentNum] := FileVersion;
         StringGrid1.Cells[4, CurrentNum] := HexL(Crcs);
         StringGrid1.Cells[6, CurrentNum] := ChiefLZObj1.FullLZName ( CurrentNum );
      end;

      With ChiefLZObj1.MainArchiveHeader do begin
         Label13.Caption :=  IntToStr(uSize);
         Label14.Caption :=  IntToStr(cSize);
         Label15.Caption :=  IntToStr(GetCompressionRatio ( cSize, uSize))+'%';
         Label16.Caption :=  IntToStr(Count)+' file(s)';
      end;
   end;
   Result := 1;
end;

function TForm1.ChiefLZObj1ProgressReport(Sender: TObject;
  const CurrentRecord: TLZReportRec; const Number: Integer): Integer;
  var
  pct:Byte;
begin
     ChiefLZObj1ProgressReport := 1;
     If (Number = LZCode_CallBackStartArchive) {begin archive}
     then begin
         TotCount := CurrentRecord.fAttrs;
     end else
     If  (Length(CurrentRecord.Names)>0)
     and (Number = LZCode_CallBackStartFile) {begin new file}
     then begin
         Delay(20);
         ProgressForm.Label2.Caption := ChiefLZObj1.ArchiveName;
         ProgressForm.Label4.Caption := CurrentRecord.Names;
         ProgressForm.Show;
         Inc(ReachedCount);
         Pct := Round ( ( ReachedCount / TotCount ) * 100 );
         ProgressForm.Label5.Caption := IntToStr(Pct)+'%';
         ProgressForm.ProgressBar1.position := Pct;
         Delay(4);
     end else
     if (Number = LZCode_CallBackEndFile) {end file}
     then begin
     end else
     if (Number > 0) then begin

     end;
end;

end.

