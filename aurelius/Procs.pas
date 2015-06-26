unit Procs;

interface

uses SysUtils, Forms, Stdctrls, controls, Windows, graphics,
     Chflzss, INIFiles, Dialogs, extctrls, Classes;

procedure InitializeProgram;
procedure CenterControl(Control: TControl);
procedure ClearTemp;
procedure ReadData;
procedure DecompressDataFile(FileName: String);
procedure ReadSettings;
procedure WriteSettings;
procedure ProcessSettings;
procedure MakeDelay(MSecs: Longint);
procedure DrawOutline(con: TPaintBox; Caption: String);
procedure AssignGraphic;
function ShowInfo(Tytul, Tresc: String; Buttons: Integer): Integer;

type TUserData = record
    Name: String[50];
end;

type TProgramSettings = record
    DeactivateScreenSaver: Boolean;
end;

var
   ProgramPath, DataPath: String;
   pl: TUserData;
   sett: TProgramSettings;
   czas: TDateTime;

const
   GameVersion: String = '0.10'; 
   crlf=chr(13)+chr(10);

implementation

uses frmBack, frmIntro, frmSetup, frmDecompress, frmHelp, frmMessBox, frmNewGame;

procedure AssignGraphic;
begin
SetupForm.btnCancel.Picture.LoadFromFile(DataPath+'btn_cancel_up.bmp');
SetupForm.btnCancel.Pic.LoadFromFile(DataPath+'btn_cancel_up.bmp');
SetupForm.btnCancel.PicDown.LoadFromFile(DataPath+'btn_cancel_dn.bmp');
SetupForm.btnCancel.PicUp.LoadFromFile(DataPath+'btn_cancel_up.bmp');

NewGame.btnCancel.Picture.LoadFromFile(DataPath+'btn_cancel_up.bmp');
NewGame.btnCancel.Pic.LoadFromFile(DataPath+'btn_cancel_up.bmp');
NewGame.btnCancel.PicDown.LoadFromFile(DataPath+'btn_cancel_dn.bmp');
NewGame.btnCancel.PicUp.LoadFromFile(DataPath+'btn_cancel_up.bmp');

NewGame.btnHelp.Picture.LoadFromFile(DataPath+'btn_help_up.bmp');
NewGame.btnHelp.Pic.LoadFromFile(DataPath+'btn_help_up.bmp');
NewGame.btnHelp.PicDown.LoadFromFile(DataPath+'btn_help_dn.bmp');
NewGame.btnHelp.PicUp.LoadFromFile(DataPath+'btn_help_up.bmp');

SetupForm.btnOK.Picture.LoadFromFile(DataPath+'btn_ok_up.bmp');
SetupForm.btnOK.Pic.LoadFromFile(DataPath+'btn_ok_up.bmp');
SetupForm.btnOK.PicDown.LoadFromFile(DataPath+'btn_ok_dn.bmp');
SetupForm.btnOK.PicUp.LoadFromFile(DataPath+'btn_ok_up.bmp');

Help.btnHistoryBack.Picture.LoadFromFile(DataPath+'btn_back_up.bmp');
Help.btnHistoryBack.Pic.LoadFromFile(DataPath+'btn_back_up.bmp');
Help.btnHistoryBack.PicDown.LoadFromFile(DataPath+'btn_back_dn.bmp');
Help.btnHistoryBack.PicUp.LoadFromFile(DataPath+'btn_back_up.bmp');

Help.btnClose.Picture.LoadFromFile(DataPath+'btn_close_up.bmp');
Help.btnClose.Pic.LoadFromFile(DataPath+'btn_close_up.bmp');
Help.btnClose.PicDown.LoadFromFile(DataPath+'btn_close_dn.bmp');
Help.btnClose.PicUp.LoadFromFile(DataPath+'btn_close_up.bmp');

MessBox.btnOK.Picture.LoadFromFile(DataPath+'btn_ok_up.bmp');
MessBox.btnOK.Pic.LoadFromFile(DataPath+'btn_ok_up.bmp');
MessBox.btnOK.PicDown.LoadFromFile(DataPath+'btn_ok_dn.bmp');
MessBox.btnOK.PicUp.LoadFromFile(DataPath+'btn_ok_up.bmp');

MessBox.btnYes.Picture.LoadFromFile(DataPath+'btn_yes_up.bmp');
MessBox.btnYes.Pic.LoadFromFile(DataPath+'btn_yes_up.bmp');
MessBox.btnYes.PicDown.LoadFromFile(DataPath+'btn_yes_dn.bmp');
MessBox.btnYes.PicUp.LoadFromFile(DataPath+'btn_yes_up.bmp');

MessBox.btnNo.Picture.LoadFromFile(DataPath+'btn_no_up.bmp');
MessBox.btnNo.Pic.LoadFromFile(DataPath+'btn_no_up.bmp');
MessBox.btnNo.PicDown.LoadFromFile(DataPath+'btn_no_dn.bmp');
MessBox.btnNo.PicUp.LoadFromFile(DataPath+'btn_no_up.bmp');
end;

procedure DrawOutline(con: TPaintBox; Caption: String);
var
        x,y,h,v,cp: Integer;
        bmp: TBitmap;
begin
bmp:=TBitmap.Create;
bmp.LoadFromFile(DataPath+'d_we.bmp');
x:=(con.Width div 25);
y:=((con.Height-58) div 29);
//ShowMessage(IntToStr(x)+' : '+IntToStr(y));

con.Canvas.CopyRect(Rect(0,0,25,20),bmp.Canvas,Rect(0,0,25,20));
for h:=1 to x-2 do con.Canvas.CopyRect(Rect(h*25,0,(h*25)+25,20),bmp.Canvas,Rect(26,0,51,20));
con.Canvas.CopyRect(Rect((x-1)*25,0,((x-1)*25)+25,20),bmp.Canvas,Rect(52,0,77,20));

for v:=0 to y-1 do
begin
        con.Canvas.CopyRect(Rect(0,20+(v*29),25,49+(v*29)),bmp.Canvas,Rect(0,21,25,50));
        con.Canvas.CopyRect(Rect((x-1)*25,20+(v*29),((x-1)*25)+25,49+(v*29)),bmp.Canvas,Rect(52,21,77,50));
end;

con.Canvas.CopyRect(Rect(0,20+(y*29),25,58+(y*29)),bmp.Canvas,Rect(0,51,25,89));
for h:=1 to x-2 do con.Canvas.CopyRect(Rect(h*25,20+(y*29),(h*25)+25,58+(y*29)),bmp.Canvas,Rect(26,51,51,89));
con.Canvas.CopyRect(Rect((x-1)*25,20+(y*29),((x-1)*25)+25,58+(y*29)),bmp.Canvas,Rect(52,51,77,89));

con.Canvas.Brush.Color:=$006F7F5F;
con.Canvas.Brush.Style:=bsSolid;
con.Canvas.FillRect(Rect(25,20,(x-1)*25,20+(y*29)));

cp:=(con.Width - con.Canvas.TextWidth(Caption)) div 2;
con.Canvas.Font.Style:=[fsBold];
con.Canvas.TextOut(cp,20,Caption);
con.Canvas.MoveTo(20,36);
con.Canvas.LineTo(con.Width - 16,36);

bmp.Free;
end;

procedure InitializeProgram;
var
        Buffer: array[0..1023] of Char;
begin
GetTempPath(1023,Buffer);
DataPath:=Buffer+'Aurelius\';
ProgramPath:=ExtractFilePath(Application.ExeName);
end;

procedure ReadSettings;
var
        ini: TINIFile;
begin
ini:=TINIFile.Create(ProgramPath+'aurelius.ini');
sett.DeactivateScreenSaver:=ini.ReadBool('Main','TurnOffScreenSaver',True);
ini.Free;
if FileExists(ProgramPath+'aurelius.ini')=False then
begin
        Application.MessageBox('Nie odnaleziono pliku konfiguracyjnego aurelius.ini !!! Utworzono nowy i wype³niono go parametrami domyœlnymi.','Ostrze¿enie!',MB_OK+MB_ICONWARNING+MB_DEFBUTTON1);
        WriteSettings;
end;
end;

procedure WriteSettings;
var
        ini: TINIFile;
begin
ini:=TINIFile.Create(ProgramPath+'aurelius.ini');
ini.WriteBool('Main','TurnOffScreenSaver',sett.DeactivateScreenSaver);
ini.Free;
end;

procedure ProcessSettings;
begin
if sett.DeactivateScreenSaver=True then SystemParametersInfo(SPI_SETSCREENSAVEACTIVE,0,nil,0) else SystemParametersInfo(SPI_SETSCREENSAVEACTIVE,1,nil,0);
end;

procedure ClearTemp;
var
   a : Integer;
   f: TextFile;
   nazwa: String;
   SearchRec: TSearchRec;
begin
//jego
  a:=FindFirst(DataPath+'*.*',faanyfile,SearchRec);
  while a=0 do
  begin
     if SearchRec.Name[1]<>'.' then
     begin
          nazwa:=DataPath+SearchRec.Name;
          AssignFile(f,nazwa);
          Erase(f);
     end;
     a:=findnext(SearchRec);
end;
  RemoveDir(DataPath);
end;

procedure ReadData;
var
        path: String;
begin
path:=ExtractFilePath(Application.Exename)+'Dane\';
DecompressDataFile(path+'mus.dat');
DecompressDataFile(path+'gfx.dat');
DecompressDataFile(path+'i.dat');
DecompressDataFile(path+'des.dat');
DecompressDataFile(path+'help.dat');
end;

procedure DecompressDataFile(FileName: String);
var
   Lzw: TChiefLZObj;
begin
Lzw:=TChiefLZObj.Create(BackForm);
Lzw.ArchiveName := FileName;
if FileExists(Lzw.ArchiveName)=False then
begin
        Application.MessageBox(PChar('Nie odnaleziono pliku:'+chr(13)+FileName+chr(13)+''+chr(13)+'Nast¹pi zakoñczenie programu.'),'B³¹d!',MB_OK+MB_ICONERROR+MB_DEFBUTTON1);
        Application.Terminate;
        Exit;
end;
Decompress.Label2.Caption:='Odczytywanie pliku ' + ExtractFileName(FileName);
Application.ProcessMessages;
Lzw.DeArchiveTargetDirectory := DataPath;
Lzw.DearchiveMask := '*.*';
Lzw.DearchiveRecurse := False;
Lzw.CheckFileCRCs    := False;
Lzw.ExtractUnExpanded := False;
Lzw.DecompressArchive;
end;

procedure CenterControl(Control: TControl);
var
  X, Y: Integer;
begin
  X := Control.Left;
  Y := Control.Top;
  if Control is TForm then begin
    with Control do begin
      if (TForm(Control).FormStyle = fsMDIChild) and
        (Application.MainForm <> nil) then
      begin
        X := (Application.MainForm.ClientWidth - Width) div 2;
        Y := (Application.MainForm.ClientHeight - Height) div 2;
      end
      else begin
        X := (Screen.Width - Width) div 2;
        Y := (Screen.Height - Height) div 2;
      end;
    end;
  end
  else if Control.Parent <> nil then begin
    with Control do begin
      Parent.HandleNeeded;
      X := (Parent.ClientWidth - Width) div 2;
      Y := (Parent.ClientHeight - Height) div 2;
    end;
  end;
  if X < 0 then X := 0;
  if Y < 0 then Y := 0;
  with Control do SetBounds(X, Y, Width, Height);
end;

procedure MakeDelay(MSecs: Longint);
var
  FirstTickCount, Now: Longint;
begin
  FirstTickCount := GetTickCount;
  repeat
    Application.ProcessMessages;
    { allowing access to other controls, etc. }
    Now := GetTickCount;
  until (Now - FirstTickCount >= MSecs) or (Now < FirstTickCount);
end;

function ShowInfo(Tytul, Tresc: String; Buttons: Integer): Integer;
begin
if Buttons=1 then
begin
MessBox.btnYes.Visible:=False;
MessBox.btnOK.Visible:=True;
MessBox.btnNo.Visible:=False;
end;

if Buttons=2 then
begin
MessBox.btnYes.Visible:=True;
MessBox.btnOK.Visible:=False;
MessBox.btnNo.Visible:=True;
end;

MessBox.Tytul.Caption:=Tytul;
MessBox.Label1.Caption:=Tresc;
MessBox.ShowModal;
Result:=StrToInt(MessBox.Odpowiedz.Caption);
end;

end.
