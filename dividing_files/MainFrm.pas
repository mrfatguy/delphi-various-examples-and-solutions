                  
(************************************************************************)
(*                                                                      *)
(*                   Copyright (c) 2002 by Adam Boduch                  *)
(*                     http://4programmers.net                          *)
(*                      adam@4programmers.net                           *)
(*                                                                      *)
(************************************************************************)

unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, FileCtrl;

type
  TMainForm = class(TForm)
    BufferTrack: TTrackBar;
    lblBuffor: TLabel;
    DirListBox: TDirectoryListBox;
    FileListBox: TFileListBox;
    DriveCombo: TDriveComboBox;
    btnDivFile: TButton;
    ProgressBar: TProgressBar;
    btnConnectFile: TButton;
    procedure BufferTrackChange(Sender: TObject);
    procedure btnDivFileClick(Sender: TObject);
    procedure btnConnectFileClick(Sender: TObject);
  private
  { procedura dzielenia plikow }
    procedure DivFile(const FileName:  String);
  { procedura laczenia plikow }
    procedure ConnectFile(const Dir : String);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

{ TMainForm }

procedure TMainForm.DivFile(const FileName: String);
var
  Input : TFileStream;
  Output : TFileStream;
  i : Integer;
  DirPath : String;
  BuffSize : Integer;
begin
  BuffSize := BufferTrack.Position; // pobierz rozmiar bufora ( rozmiar jednego pliku )
  DirPath :=  FileName + '.temp'; // dodaj rozszerzenie
  mkDir(DirPath);  // utworz folder
  Input := TFileStream.Create(FileName, fmOpenRead);
  try
    ProgressBar.Max := (Input.Size div BuffSize);

  { po podzieleniu rozmiaru pliku przez bufor daje to nam ilosc kawalkow z ktorch
    skladal sie bedzie podzielony plik }
    for I := 0 to (Input.Size div BuffSize) do
    begin
      Application.ProcessMessages;
      ProgressBar.Position := i;

    { za kazda iteracja petli - przesun sie w zawartosic pliku o rozmiar bufora }
      Input.Seek(i * BuffSize, soFromBeginning);

    { utworz w nowo utworzonym folderze plik odpowiadajacy fragmentowi dzielonego pliku }
      Output := TFileStream.Create((DirPath + '\' + ExtractFileName(FileName) + IntToStr(i) + '.temp'),
      fmCreate);
      try
      { nastepnie za pomoca funkcji CopyFrom ze strumienia zostaje przekopiowana
        okreslona ilosc bajtow (bufor) do strumienia Output. Jezeli pozostala do
        skopiowania czesc jest mniejsza od bufora to trzeba skopiowac tylko te
        czesc, ktora pozostala do skopiowania... :))
      }
        if (Input.Size - (i * BuffSize)) < BuffSize then
          Output.CopyFrom(Input, (Input.Size - (i * BuffSize)))
        else Output.CopyFrom(Input, BuffSize);
      finally
        Output.Free;
      end;
    end;   
  finally
    Input.Free;
  end;  
end;

procedure TMainForm.BufferTrackChange(Sender: TObject);
begin
  lblBuffor.Caption := 'Bufor: ' + IntToStr(BufferTrack.Position);
end;

procedure TMainForm.btnDivFileClick(Sender: TObject);
begin
  DivFile(FileListBox.FileName);
end;

procedure TMainForm.ConnectFile(const Dir: String);
var
  SR : TSearchRec;
  Found : Integer;
  I : Integer;
  Input : TFileStream;
  Output : TfileStream;
  NumberOfFiles : Integer;
begin
  NumberOfFiles := 0;
{
  te instrukcje maja na celu uzyskanie ilosci plikow .temp znajdujacych sie
  w okreslonej lokalizacji - ilosc plikow oznacza zmienna NumberOfFile.
}
  Found := FindFirst(Dir + '\*.temp', faAnyFile, SR);
  while Found = 0 do
  begin
    Inc(NumberOfFiles);
    Found := FindNext(SR);
  end;
  FindClose(SR);

{
   te instrukcje odpowiadaja za stworzenie pliku - to do niego zostanie wlaczona
   zawartosci pliczkow - kwalkow...
}
  if not FileExists(ExtractFileDir(Dir) + ChangeFileExt(ExtractFileName(Dir), '')) then
    Output := TFileStream.Create(ExtractFileDir(Dir) + ChangeFileExt(ExtractFileName(Dir), ''), fmCreate)
  else Output := TFileStream.Create(ExtractFileDir(Dir) + ChangeFileExt(ExtractFileName(Dir), ''), fmOpenWrite);

  ProgressBar.Max := NumberOfFiles;

  try
    for I := 0 to NumberOfFiles -1 do
    begin
      Application.ProcessMessages;
      ProgressBar.Position := i;
    { tutaj nastepuje otwarcie pliku-kawalka do skopiowania }
      Input := TFileStream.Create(Dir + '\' + ExtractFileName(ChangeFileExt(DirListBox.Directory, '')) + IntToStr(i) + '.temp',
      fmOpenRead);
      try
      { tutaj do pliku laczonego kopiujemy zawartosc malego pliczku (czesci) }
        Output.CopyFrom(Input, Input.Size);
      finally
        Input.Free;
      end;
    end;
  finally
    Output.Free;
  end;
end;

procedure TMainForm.btnConnectFileClick(Sender: TObject);
begin
  ConnectFile(DirListBox.Directory);
end;

end.
