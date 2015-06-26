{
    OpenOffice.org Dictionary Installer - v0.9.3.2 - main unit

    Last updated: 26 June 2002
    Copyright (C) 2002 Lee Corbin / OpenOffice.org
    leecorbin@openoffice.org

    This program is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
}

{
    PLEASE NOTE: I make no claims that this is good code -- it is
    'throw it together quick before the launch of OpenOffice.org 1.0'
    code and it probably shows. :-)

    At the moment, I implement a wizard by cheating and having separate
    panels with their own Next and Cancel buttons, and then jumping from
    function to function. I know this isn't particularly good. There aren't
    even Back buttons yet. This needs to be restructured. I'll try to do
    that post 1.0.

    PORTING

    If anyone is interested in porting this to Kylix, please be aware that
    it may be a good idea to wait until I have done some restructuring (or
    you're welcome to help out of course :-).

    PLEASE NOTE: DictInstall is currently distributed under LGPL. That
    means that it cannot be released if compiled under Kylix Open Edition
    (which sadly stipulates GPL only).

    FUTURE

    It is quite possible that DictInstall will be replaced sometime after
    version 1.0.0 with a cross-platform installer tool.

    Lee Corbin
    leecorbin@openoffice.org
    12 May 2002
}

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, HttpProt, CheckLst, LCDUtils, ExtCtrls, ComCtrls, Zip,
  IniFiles, ShellApi, Registry, TypInfo, Buttons;


{
    Standard type definitions.

    We have a simple object TOOoDictItem. This is basically just a
    structure at the moment, though it's been done as a class in case
    it becomes a proper object in the future.

    Our enum TOOoDictStage gives us the stage in the installing
    process
}
type
    TOOoDictStage = (dsWelcome, dsSearching, dsFound, dsDownloadList,
        dsDictionaries, dsInstall, dsFinish);
    TOOoDictItem = class(TObject)
    public
        Name: String;
        LanguageCode: String;
        CountryCode: String;
        FileName: String;
    end;

  TMainForm = class(TForm)
    HttpClient: THttpCli;
    FileDownloader: THttpCli;
    Zip: TZip;
    spWelcome: TPanel;
    spSearching: TPanel;
    SearchingLabel0: TLabel;
    SearchingLabel1: TLabel;
    SearchingLabel2: TLabel;
    WelcomeButtonNext: TBitBtn;
    spDictionaries: TPanel;
    spFound: TPanel;
    PathListBox: TListBox;
    FoundLabel0: TLabel;
    FoundButtonNext: TBitBtn;
    spDownloadList: TPanel;
    DownloadListLabel0: TLabel;
    DownloadLisTBitBtnNext: TBitBtn;
    DictionariesLabel0: TLabel;
    DictList: TCheckListBox;
    DictionariesButtonNext: TBitBtn;
    spInstall: TPanel;
    InstallButtonNext: TBitBtn;
    ProgressBar: TProgressBar;
    InstallProgressLabelFiles0: TLabel;
    InstallProgressLabelFiles1: TLabel;
    OverallProgressBar: TProgressBar;
    InstallProgressLabelDics: TLabel;
    InstallLabel0: TLabel;
    spFinish: TPanel;
    SearchingButtonNext: TBitBtn;
    SearchingLabel3: TLabel;
    DownloadListLabel1: TLabel;
    BeginInstallPanel: TPanel;
    FinishButtonFinish: TBitBtn;
    TopPanel: TPanel;
    Image1: TImage;
    Bevel1: TBevel;
    WelcomeLabel0: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    FinishLabel0: TLabel;
    WelcomeButtonCancel: TBitBtn;
    SearchingButtonCancel: TBitBtn;
    FoundButtonCancel: TBitBtn;
    DownloadLisTBitBtnCancel: TBitBtn;
    DictionariesButtonCancel: TBitBtn;
    InstallButtonCancel: TBitBtn;
    FinishButtonCancel: TBitBtn;
    MainLabelSuitename: TLabel;
    MainLabelProgname: TLabel;
    FoundLabel1: TLabel;
    InstallLabelPrompt: TLabel;
    WelcomeLabel1: TLabel;
    WelcomeLabel2: TLabel;
    DictionariesLabel1: TLabel;
    DictionariesLabel2: TLabel;
    InstallLabel1: TLabel;
    DownloadListDoNotCB: TCheckBox;
    AbouTBitBtn: TBitBtn;
    Bevel8: TBevel;
    FinishLabel1: TLabel;
    FinishLabel2: TLabel;
    FinishLabel3: TLabel;
    VersionLabel: TLabel;
    WelcomeDoNotCB: TCheckBox;
    InstallLabel2: TLabel;
    InstallDeleteWarningLabel: TLabel;
    FoundLabel2: TLabel;
    WelcomeDoNotLabel: TLabel;
    DownloadListDoNotLabel: TLabel;
    procedure DownloadLisTBitBtnNextClick(Sender: TObject);
    procedure HttpClientDocEnd(Sender: TObject);
    procedure HttpClientDocData(Sender: TObject; Buffer: Pointer;
      Len: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure WelcomeButtonNextClick(Sender: TObject);
    procedure FoundButtonNextClick(Sender: TObject);
    procedure DictionariesButtonNextClick(Sender: TObject);
    procedure InstallButtonNextClick(Sender: TObject);
    procedure FileDownloaderDocBegin(Sender: TObject);
    procedure FileDownloaderDocData(Sender: TObject; Buffer: Pointer;
      Len: Integer);
    procedure FileDownloaderDocEnd(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SearchingButtonNextClick(Sender: TObject);
    procedure WelcomeButtonCancelClick(Sender: TObject);
    procedure PathListBoxClick(Sender: TObject);
    procedure AbouTBitBtnClick(Sender: TObject);
    procedure FinishLabel2Click(Sender: TObject);
    procedure VersionLabelClick(Sender: TObject);
    procedure HttpClientDocBegin(Sender: TObject);
    procedure WelcomeDoNotLabelClick(Sender: TObject);
    procedure DownloadListDoNotLabelClick(Sender: TObject);
  private
    OOoDictList: TList;
    OOoCurrentDictList: TList;
    OOoWantedDictList: TList;
    OOoDeletingDictList: TList;
    OOoDictPath: String;
    LastPath: String;
    OOoFileNonDICT: TStringList;
    OOoDictStage: TOOoDictStage;
    OOoConfBaseURL: String;
    OOoConfListURL: String;
    OOoConfNextHelpURL: String;
    //OOoConfDictFileName: String;
    OOoConfMatchPath: String;
    OOoConfStringList: TStringList;
    UsingLocalPath: Boolean;
    OOoConfLocalPath: String;
    OOoConfLocalList: String;
    OOoProxySetting: String;
    VersionFileName: String;
    DownloadListCollected: Boolean;
    LanguageCode: String;
    LanguageDuplicates: TStringList;
    DownloadOrInstallFailed: Boolean;
    procedure GetMatchedPaths(Root, TargetPath: String; ResultsList: TStringList);
    function LanguageInstallCheck(CheckOOoItem: TOOoDictItem): Boolean;
    function DownloadFile(URL, Name: String): Boolean;
    procedure WriteDictionaryFile;
    procedure UpdateUI;
    procedure ShowDictionaries;
    function GetString(Name: String): String;
    procedure AfterFoundStage;
    procedure InstallFailed;
    procedure DisableCloseButton;
    procedure EnableCloseButton;
    function GetLanguageCode: String;
    //function CheckForDuplicates(InSL: TList): Boolean;
    procedure WriteRegistry;
    procedure ReadRegistry;
    function GetProfilePath: String;
    procedure SetLabelWithEllipsis(NewCaption: String; InLabel: TLabel);
    procedure SetupProxy;
    procedure SetCharSet(CS: TFontCharSet);
    function GetVersionFile: String;
  public
  end;

    {Ugly hack. This allows us to change the protected font
    property of some controls. Used in SetCharSet() }
    TFooClass = class(TControl);

var
  MainForm: TMainForm;
  ProgramCharset: TFontCharset;

{
    Constants

    These are the only "hard coded" strings. I'm considering a better -
    more translatable way to do these, but have reservations about the
    credits and homepage being part of a text file distributed with
    the binary.
}
const
    PROG_NAME = 'DictInstall';
    PROG_VER  = '0.9.3.2';
    PROG_CREDITS = 'Written by Lee Corbin.'#13#10#13#10 +
        'Translations by: Marco Huggenberger, Jean-Bruno Luginbühl, Franz Rogar, ' +
        'Mika Alhainen, Henrik Just, Michalis Kabrianis, Andrea Sanavia, ' +
        'Claus Sørensen, Simon Brouwer, ' +
        'Andre Mazouer and Laurent Balland.'#13#10#13#10 +
        'Special thanks to all translators and everyone who has tested ' +
        'and provided bug reports and other feedback.'#13#10#13#10 +
        'Copyright 2002 Lee Corbin / OpenOffice.org';
    PROG_URL = 'http://www.ooodocs.org/dictinstall/';

implementation

uses about;

{$R *.dfm}

procedure TMainForm.DownloadLisTBitBtnNextClick(Sender: TObject);
begin
    // If user ticked Do not download box, then we'll pretend we've
    // just downloaded it now
    if DownloadListDoNotCB.Checked then DownloadListCollected := True;

    // Check if list downloaded yet
    if not DownloadListCollected then
    begin
        // No, it hasn't!
        DownloadListDoNotCB.Visible := False;
        DownloadListDoNotLabel.Visible := False;

        DownloadLisTBitBtnNext.Enabled := False;

        // Quick and dirty; stop user from being able to cancel
        // in the future, we should do this better
        DisableCloseButton;
        DownloadLisTBitBtnCancel.Enabled := False;
        Screen.Cursor := crHourglass;

        DownloadListLabel1.Caption := GetString('downloadlist_getting');

        HTTPClient.URL := OOoConfListURL;
        try
            HTTPClient.Get;
        except
            on EHttpException do
            begin
                //if EHttpException.
                DownloadListLabel1.Caption := GetString('downloadlist_problem');
                DownloadLisTBitBtnNext.Enabled := False;
                DownloadLisTBitBtnCancel.Caption := GetString('button_close');
                DownloadLisTBitBtnCancel.Enabled := True;
                EnableCloseButton;
                Screen.Cursor := crDefault;
                Exit;
            end;
        end;

        DownloadLisTBitBtnNext.Enabled := True;
        DownloadLisTBitBtnCancel.Enabled := True;
        EnableCloseButton;
        Screen.Cursor := crDefault;
        DownloadListLabel1.Caption := GetString('downloadlist_success');
    end
    else begin
        // List has been downloaded, go to next page
        ShowDictionaries;
        OOoDictStage := dsDictionaries;
        UpdateUI;
    end;
end;


{
    HttpClientDocEnd

    Called by the HTTP client for the dictionary list download only.
    Once the file has been received, it is written to disk
    and DownloadListCollected is set to true.
}
procedure TMainForm.HttpClientDocEnd(Sender: TObject);
begin
    HttpClient.RcvdStream.Free;
    DownloadListCollected := True;
end;


{
    HttpClientDocData

    As data is received, it is added to a string. Eventually this
    becomes the dictionary list file.
}
procedure TMainForm.HttpClientDocData(Sender: TObject; Buffer: Pointer;
  Len: Integer);
begin
    //DatFile := DatFile + String(Buffer);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
    OOoDictList := TList.Create;
    OOoCurrentDictList := TList.Create;
    OOoWantedDictList := TList.Create;
    OOoDeletingDictList := TList.Create;
    OOoFileNonDICT := TStringList.Create;
    OOoConfStringList := TStringList.Create;
    OOoDictPath := '';
    OOoDictStage := dsWelcome;
    DownloadListCollected := False;
    UsingLocalPath := False;
    OOoConfLocalPath := '';
    OOoConfLocalList := '';
    OOoConfNextHelpURL := '';
    OOoProxySetting := '';
    LastPath := '';

    // Set the program charset (in global variable)
    ProgramCharset := ANSI_CHARSET;

    // This stores details of any duplicate language/country
    // code pairs. Having this global is vmessy and should
    // probably be changed.
    LanguageDuplicates := TStringList.Create;
    // TODO: LOAD IN FROM REGISTRY

    // Sets the language code for the current locale
    LanguageCode := GetLanguageCode;

    // Now read in the registry settings
    ReadRegistry;

    VersionFileName := GetVersionFile;
end;

function TMainForm.GetVersionFile: String;
var
    SversionPath: String;
begin
    SversionPath := GetProfilePath + 'Application Data\' + 'sversion.ini';
    if FileExists(SversionPath) then
        Result := SversionPath
    else
        Result := '';

    // Debug
    //ShowMessage('DEBUG: sversion.ini is: ' + SversionPath);
end;

procedure TMainForm.ShowDictionaries;
var
    TempSL, LineSL: TStringList;
    i: Integer;
    TempOOoDictItem: TOOoDictItem;
begin
    // Build OOoDictList
    TempSL := TStringList.Create;
    LineSL := TStringList.Create;
    if UsingLocalPath then
        //here
        TempSL.LoadFromFile(ExtractFilePath(Application.ExeName) + OOoConfLocalPath + OOoConfLocalList)
    else
    begin
        If FileExists(GetProfilePath + 'OOo_dictionary_list.dat') then
            TempSL.LoadFromFile(GetProfilePath + 'OOo_dictionary_list.dat');
    end;
    OOoDictList.Clear;
    for i := 0 to TempSL.Count - 1 do
    begin
        if TempSL[i] = '' then Continue;

        LineSL.Clear;
        SplitString(TempSL[i], #9, LineSL);

        TempOOoDictItem := TOOoDictItem.Create;
        TempOOoDictItem.Name := LineSL[0];
        TempOOoDictItem.LanguageCode := LineSL[1];
        TempOOoDictItem.CountryCode := LineSL[2];
        TempOOoDictItem.FileName := LineSL[3];
        OOoDictList.Add(TempOOoDictItem);
    end;
    LineSL.Free;
    TempSL.Free;

    // Now show in UI
    DictList.Clear;
    for i := 0 to OOoDictList.Count - 1 do
    begin
        TempOOoDictItem := OOoDictList[i];
        DictList.Items.Add(TempOOoDictItem.Name);

        // Check if we already have that one installed
        if LanguageInstallCheck(TempOOoDictItem) then
        begin
            DictList.Checked[DictList.Count - 1] := True;
        end;
    end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
    TempOOoDictItem: TOOoDictItem;
    i: Integer;
begin
    // Save user settings to the registry
    WriteRegistry;

    for i := 0 to OOoDictList.Count - 1 do
    begin
        TempOOoDictItem := OOoDictList[i];
        TempOOoDictItem.Free;
    end;

    for i := 0 to OOoCurrentDictList.Count - 1 do
    begin
        TempOOoDictItem := OOoCurrentDictList[i];
        TempOOoDictItem.Free;
    end;

    // Clear the lists of OOoItems
    OOoDictList.Free;
    OOoCurrentDictList.Free;
    OOoWantedDictList.Free;
    OOoDeletingDictList.Free;

    OOoFileNonDICT.Free;
    OOoConfStringList.Free;
    LanguageDuplicates.Free;

    if FileExists(GetProfilePath + '~OOo_dictinstall_tmp.zip') then
        DeleteFile(GetProfilePath + '~OOo_dictinstall_tmp.zip');
end;

procedure TMainForm.WelcomeButtonNextClick(Sender: TObject);
var
    Drives: array[1..255] of char;
    LWListe: TStringlist;
    i: Byte;
    Len: DWord;
    DriveList: TStringList;
begin
    // If the user has chosen not to search, we'll move onto
    // the next stage
    if WelcomeDoNotCB.Checked then
    begin
        OOoDictPath := LastPath;

        // We have removed the "dictfile" setting in the config file
        // and the detection code too. That means the program will
        // now find any "user\wordbook" folder on a system, but is
        // necessary for OOo1.0.1 compatibility. We will later use
        // the sversion.ini file to determine installations primarily, with
        // a search as a backup so this will be less of a problem.

        // removed
        //if FileExists(OOoDictPath + OOoConfDictFileName) then

        if DirectoryExists(OOoDictPath) then
        begin
            AfterFoundStage;
            Exit;
        end;
    end;

    // Change the UI
    OOoDictStage := dsSearching;
    UpdateUI;
    SearchingButtonNext.Enabled := False;
    SearchingLabel3.Visible := False;

    // Disable cancel button and window close button. This is a bit
    // quick and dirty -- we should really allow users to cancel this
    // operation!
    DisableCloseButton;
    SearchingButtonCancel.Enabled := False;

    Screen.Cursor := crHourglass;

    // Get list of fixed drives first
    DriveList:=TStringLIst.Create;
    LWListe:=TStringList.Create;
    { Get all drives }
    Len:=GetLogicalDriveStrings(255,@Drives);
    for i:=1 to Len-2 do
        if (i mod 4)=1 then
            LWListe.Add(copy(Drives,i,3));
    { count drives of given type }

    DriveList.Clear;
    for i:=0 to LWListe.Count-1 do
    begin
        if GetDriveType(PChar(LWListe[i]))=DRIVE_FIXED then
        begin
            DriveList.Add(copy(LWListe[i],1,2))
        end;
    end;
    LWListe.Destroy;


    // Now search
    for i := 0 to DriveList.Count - 1 do
    begin
        // Dictfile name searching removed for 1.0.1 compatibility

        // removed
        //GetMatchedPaths(DriveList[i], OOoConfMatchPath + OOoConfDictFileName,
        //    TStringList(PathListBox.Items));

        GetMatchedPaths(DriveList[i], OOoConfMatchPath,
            TStringList(PathListBox.Items));
    end;

    SearchingLabel2.Caption := GetString('searching_success');

    SearchingLabel3.Visible := True;
    SearchingButtonNext.Enabled := True;
    SearchingButtonCancel.Enabled := True;
    EnableCloseButton;
    Screen.Cursor := crDefault;

    // And clear up
    DriveList.Free;
end;


{
    SetLabelWithEllipsis

    This will set the text of a TLabel, but will trim the end
    (and add '...' if the text is too wide to fit the label by
    default)
}
procedure TMainForm.SetLabelWithEllipsis(NewCaption: String; InLabel: TLabel);
var
    LabelText: String;
    ElipsisWidth: Integer;
    OldFont: TFont;
begin
    OldFont := TFont.Create;
    OldFont.Assign(Canvas.Font);
    Canvas.Font.Style := InLabel.Font.Style;

    LabelText := NewCaption;
    ElipsisWidth := Canvas.TextWidth('...');
    while Canvas.TextWidth(LabelText) > (InLabel.Width - ElipsisWidth) do
    begin
        LabelText := Copy(LabelText, 0, Length(LabelText) - 1);
    end;
    if LabelText <> NewCaption then LabelText := LabelText + '...';
    InLabel.Caption := LabelText;

    Canvas.Font := OldFont;
    OldFont.Free;
end;


procedure TMainForm.GetMatchedPaths(Root, TargetPath: String; ResultsList: TStringList);
var
    SearchRec: TSearchRec;
    NameOnly: String;
begin
    SetLabelWithEllipsis(Root, SearchingLabel2);
    Application.ProcessMessages;

    if DirectoryExists(Root + TargetPath) then
        ResultsList.Add(Root + '\');

    if FindFirst(Root + '\*.*', faDirectory, SearchRec) = 0 then
        repeat
            NameOnly := ExtractFileName(SearchRec.Name);
            if (SearchRec.Attr and faDirectory) <> 0 then
                if  (NameOnly <> '.') and (NameOnly <> '..') then
                    GetMatchedPaths(Root + '\' + SearchRec.Name, TargetPath, ResultsList);
        until FindNext(SearchRec) <> 0;

    FindClose(SearchRec);
end;

procedure TMainForm.FoundButtonNextClick(Sender: TObject);
var
    i: Integer;
begin
    for i := 0 to PathListBox.Count - 1 do
        if PathListBox.Selected[i] then
        begin
            OOoDictPath := Copy(PathListBox.Items[i], 0,
                Length(PathListBox.Items[i]) - 1) + OOoConfMatchPath;
        end;

    // Write out path
    LastPath := OOoDictPath;

    AfterFoundStage;
end;

procedure TMainForm.AfterFoundStage;
var
    CurrentDictFile: TStringList;
    i: Integer;
    LineBits: TStringList;
    TempOOoDictItem: TOOoDictItem;
begin
    if OOoDictPath = '' then Exit;
    CurrentDictFile := TStringList.Create;
    LineBits := TStringList.Create;

    OOoFileNonDict.Clear;

    // Does TList.Clear free it's objects? We'll do it
    // here as I don't think so.
    for i := 0 to OOoCurrentDictList.Count - 1 do
    begin
        TempOOoDictItem := OOoCurrentDictList[i];
        TempOOoDictItem.Free;
    end;
    OOoCurrentDictList.Clear;

    // Get current installation information
    // Dict file name searching removed for 1.0.1 compatibility

    // removed
    //if FileExists(OOoDictPath + OOoConfDictFileName) then

    if FileExists(OOoDictPath + 'dictionary.lst') then
    begin
        // removed
        //CurrentDictFile.LoadFromFile(OOoDictPath + OOoConfDictFileName);
        CurrentDictFile.LoadFromFile(OOoDictPath + 'dictionary.lst');

        for i := 0 to CurrentDictFile.Count - 1 do
        begin
            if Copy(CurrentDictFile[i], 0, 4) = 'DICT' then
            begin
                LineBits.Clear;
                SplitString(CurrentDictFile[i], ' ', LineBits);

                if LineBits[0] = 'DICT' then
                begin
                    TempOOoDictItem := TOOoDictItem.Create;
                    TempOOoDictItem.Name := '';
                    TempOOoDictItem.LanguageCode := LineBits[1];
                    TempOOoDictItem.CountryCode := LineBits[2];
                    OOoCurrentDictList.Add(TempOOoDictItem);
                end;
            end else
            begin
                OOoFileNonDICT.Add(CurrentDictFile[i]);
            end;
        end;
    end;

    LineBits.Free;
    CurrentDictFile.Free;

    // Update UI
    if UsingLocalPath then
    begin
        ShowDictionaries;
        OOoDictStage := dsDictionaries;
    end
    else begin
        OOoDictStage := dsDownloadList;
        DownloadListDoNotCB.Checked := False;
        if not FileExists(GetProfilePath + 'OOo_dictionary_list.dat') then
        begin
            DownloadListDoNotCB.Visible := False;
            DownloadListDoNotLabel.Visible := False;
        end;
    end;
    UpdateUI;
end;

function TMainForm.LanguageInstallCheck(CheckOOoItem: TOOoDictItem): Boolean;

    function ItemInCurrentList(Item: TOOoDictItem): Boolean;
    var
        i: Integer;
        TestItem: TOOoDictItem;
    begin
        Result := False;
        for i := 0 to OOoCurrentDictList.Count - 1 do
        begin
            TestItem := OOoCurrentDictList[i];
            if (TestItem.LanguageCode = Item.LanguageCode) and
               (TestItem.CountryCode = Item.CountryCode) then
               begin
                    Result := True;
                    Exit;
               end;
        end;
    end;


    function IsDuplicated(La, Co: String): Boolean;
    var
        i: Integer;
        oI: TOOoDictItem;
        NumMatched: Integer;
    begin
        NumMatched := 0;
        for i := 0 to OOoDictList.Count - 1 do
        begin
            oI := OOoDictList[i];
            if (oI.LanguageCode = La) and (oI.CountryCode = Co) then
                Inc(NumMatched);
        end;
        if NumMatched > 1 then
            Result := True
        else
            Result := False;
    end;

var
    i, Index: Integer;
    La, Co, S, FnStr: String;
begin
    Result := False;

    if ItemInCurrentList(CheckOOoItem) then
    begin
        La := CheckOOoItem.LanguageCode;
        Co := CheckOOoItem.CountryCode;
        if IsDuplicated(La, Co) then
        begin
            S := La + '_' + Co;

            Index := -1;
            for i := 0 to LanguageDuplicates.Count - 1 do
                if Copy(LanguageDuplicates[i], 0, Length(S)) = S then
                    Index := i;

            if Index = -1 then
            begin
                Result := True;
                LanguageDuplicates.Add(La + '_' + Co + ' ' + CheckOOoItem.FileName);
            end
            else begin
                FnStr := Copy(LanguageDuplicates[Index], Length(S) + 2,
                    Length(LanguageDuplicates[Index]));
                if FnStr = CheckOOoItem.FileName
                    then
                    begin
                        Result := True;
                    end;
            end;

        end
        else
            Result := True;
    end;
end;

procedure TMainForm.WriteDictionaryFile;
var
    TempFileStrings: TStringList;
    i: Integer;
    TempOOoDictItem: TOOoDictItem;
    Ccd, Lcd: String;
begin
    // Write dictionary file. We will start by making a backup
    // of the current file. If a 'first backup' file does not
    // exist, then we'll make that too.
    if OOoDictPath = '' then Exit;

    TempFileStrings := TStringList.Create;

    // removed
    // TempFileStrings.LoadFromFile(OOoDictPath + OOoConfDictFileName);

    if FileExists(OOoDictPath + 'dictionary.lst') then
        TempFileStrings.LoadFromFile(OOoDictPath + 'dictionary.lst');
    if not FileExists(OOoDictPath + 'dictionary_first.bak') then
        TempFileStrings.SaveToFile(OOoDictPath + 'dictionary_first.bak');
    TempFileStrings.SaveToFile(OOoDictPath + 'dictionary.bak');

    // Now write dictionary file itself
    TempFileStrings.Clear;
    // the non DICT lines first
    for i := 0 to OOoFileNonDICT.Count - 1 do
        TempFileStrings.Add(OOoFileNonDICT[i]);

    // and then the DICT lines
    for i := 0 to OOoWantedDictList.Count - 1 do
    begin
        TempOOoDictItem := OOoWantedDictList[i];
        Lcd := TempOOoDictItem.LanguageCode;
        Ccd := TempOOoDictItem.CountryCode;
        TempFileStrings.Add('DICT ' + Lcd + ' ' + Ccd + ' ' + Lcd + '_' + Ccd);
    end;

    // dictionary file name now hardcoded; part of changes for 1.0.1
    // compatibility
    TempFileStrings.SaveToFile(OOoDictPath + 'dictionary.lst');

    TempFileStrings.Free;
end;

{function TMainForm.CheckForDuplicates(InSL: TList): Boolean;
var
    i, j: Integer;
    Duplicates: Boolean;
    TempOOoDictItem, TestItem: TOOoDictItem;
begin
    Duplicates := False;
    for i := 0 to InSL.Count - 1 do
    begin
        TempOOoDictItem := InSL[i];
        for j := 0 to InSL.Count - 1 do
            if i <> j then
            begin
                TestItem := InSL[j];
                if (TempOOoDictItem.LanguageCode = TestItem.LanguageCode) and
                   (TempOOoDictItem.CountryCode = TestItem.CountryCode) then
                        Duplicates := True;
            end;
    end;
    Result := Duplicates;
end;}

procedure TMainForm.DictionariesButtonNextClick(Sender: TObject);
var
    i, j: Integer;
    TempOOoDictItem, TestItem: TOOoDictItem;
    DeleteThisOne: Boolean;
begin
    OOoWantedDictList.Clear;

    for i := 0 to OOoDictList.Count - 1 do
        if DictList.Checked[i] then
        begin
            TempOOoDictItem := OOoDictList[i];
            OOoWantedDictList.Add(TempOOoDictItem);
        end;

    // Check there are no duplictate language/country pairs
    // (the "double Greek" issue)

    // We are removing the duplication code here. There is no reason
    // why we cannot have two of the same country/language and it is
    // sometimes desirable ... for example, the extra Latin dictionary
    // under it_IT or a technical dictionary added under en_CA.

    // TODO:
    // However, I need to add code to ensure that the correct
    // dictionaries are checked when the list is shown

    {if CheckForDuplicates(OOoWantedDictList) then
    begin
        MessageDlg(GetString('error_duplicates'), mtError, [mbOK], 0);
    end
    else begin}
        // We'll build the 'deletions' list
        OOoDeletingDictList.Clear;

        for i := 0 to OOoCurrentDictList.Count - 1 do
        begin
            TempOOoDictItem := OOoCurrentDictList[i];
            DeleteThisOne := True;
            for j := 0 to OOoWantedDictList.Count - 1 do
            begin
                TestItem := OOoWantedDictList[j];
                if (TempOOoDictItem.LanguageCode = TestItem.LanguageCode) and
                   (TempOOoDictItem.CountryCode = TestItem.CountryCode) then
                        DeleteThisOne := False;
            end;
            if DeleteThisOne then OOoDeletingDictList.Add(TempOOoDictItem);
        end;

        // Now update UI
        OOoDictStage := dsInstall;
        InstallProgressLabelFiles0.Caption := '';
        InstallProgressLabelFiles1.Caption := '';

        if UsingLocalPath then
        begin
            // Hide the "download file" progress bar and labels
            ProgressBar.Visible := False;
            InstallProgressLabelFiles0.Visible := False;
            InstallProgressLabelFiles1.Visible := False;
        end;

        BeginInstallPanel.Visible := True;

        if OOoDeletingDictList.Count > 0 then
        begin
            InstallDeleteWarningLabel.Visible := True;
            InstallDeleteWarningLabel.Caption := GetString('install_deletewarning');
        end
        else
            InstallDeleteWarningLabel.Visible := False;

        UpdateUI;
    {end;}
end;

procedure TMainForm.InstallButtonNextClick(Sender: TObject);

    function GetIndexOfDuplicate(La, Co: String): Integer;
    var
        i: Integer;
        S: String;
    begin
        Result := -1;
        S := La + '_' + Co;
        for i := 0 to LanguageDuplicates.Count - 1 do
            if Copy(LanguageDuplicates[i], 0, Length(S)) = S then
                Result := i;
    end;

var
    i, j, Matches: Integer;
    TempOOoDictItem, CheckOOoDictItem: TOOoDictItem;
    Ccd, Lcd, TLa, TCo, CLa, CCo: String;
    InstallProgressStr: String;
    Delphrase: String;
    ZipName: String;
begin
    if OOoDictPath = '' then Exit;

    // Check if we're at prompt to install, or if that's done
    // already and we want to go to the Finish page
    if BeginInstallPanel.Visible then
    begin
        InstallLabel2.Visible := False;
        BeginInstallPanel.Visible := False;

        OverallProgressBar.Position := 0;
        OverallProgressBar.Max := OOoWantedDictList.Count;

        Screen.Cursor := crHourglass;
        InstallButtonNext.Enabled := False;
        InstallButtonCancel.Enabled := False;
        DisableCloseButton;

        // This is a bit quick and dirty. This code is virtually duplicated
        // from below. It ensures that there is status text while the first
        // dictionary is being downloaded
        InstallProgressStr := GetString('install_installprogress');
        InstallProgressStr := StringReplace(InstallProgressStr, '$d',
            '0', [rfReplaceAll]);
        InstallProgressStr := StringReplace(InstallProgressStr, '$t',
            IntToStr(OOoWantedDictList.Count), [rfReplaceAll]);

        InstallProgressLabelDics.Caption := InstallProgressStr;

        DownloadOrInstallFailed := False;

        for i := 0 to OOoWantedDictList.Count - 1 do
        begin
            TempOOoDictItem := OOoWantedDictList[i];
            Lcd := TempOOoDictItem.LanguageCode;
            Ccd := TempOOoDictItem.CountryCode;
            if (not FileExists(OOoDictPath + Lcd + '_' + Ccd + '.aff')) or
               (not FileExists(OOoDictPath + Lcd + '_' + Ccd + '.dic')) then
               begin
                    if UsingLocalPath then
                    begin
                        ZipName := ExtractFilePath(Application.Exename) + OOoConfLocalPath + TempOOoDictItem.FileName;
                    end
                    else begin
                        // Download the file
                        if not DownloadFile(OOoConfBaseURL + TempOOoDictItem.FileName,
                            TempOOoDictItem.Name)
                                then Exit;

                        // And then install
                        ZipName := GetProfilePath + '~OOo_dictinstall_tmp.zip'
                    end;

                    try
                        // We'll extract only the .aff and .dic files for now
                        // but does this cause problems? for example, the GPL
                        // ends up unextracted here -- also, do any dictionaries
                        // use any other files?
                        Zip.FileSpecList.Add('*.aff');
                        Zip.FileSpecList.Add('*.dic');

                        Zip.ExtractPath := OOoDictPath;
                        Zip.ExtractOptions := [eoUpdate];
                        Zip.Filename := ZipName;

                        Zip.Extract;
                    except
                        InstallFailed;
                    end;
               end;

               OverallProgressBar.Position := OverallProgressBar.Position + 1;

               InstallProgressStr := GetString('install_installprogress');
               InstallProgressStr := StringReplace(InstallProgressStr, '$d',
                    IntToStr(i + 1), [rfReplaceAll]);
               InstallProgressStr := StringReplace(InstallProgressStr, '$t',
                    IntToStr(OOoWantedDictList.Count), [rfReplaceAll]);

               InstallProgressLabelDics.Caption := InstallProgressStr;
        end;

        WriteDictionaryFile;


        // Now delete unwanted dictionaries
        for i := 0 to OOoDeletingDictList.Count - 1 do
        begin
            TempOOoDictItem := OOoDeletingDictList[i];
            TLa := TempOOoDictItem.LanguageCode;
            TCo := TempOOoDictItem.CountryCode;
            Delphrase := TLa + '_' + TCo;
            if FileExists(OOoDictPath + Delphrase + '.aff') then
                DeleteFile(OOoDictPath + Delphrase + '.aff');
            if FileExists(OOoDictPath + Delphrase + '.dic') then
                DeleteFile(OOoDictPath + Delphrase + '.dic');
        end;

        if not DownloadOrInstallFailed then
        begin
            LanguageDuplicates.Clear;
            for i := 0 to OOoWantedDictList.Count - 1 do
            begin
                Matches := 0;
                TempOOoDictItem := OOoWantedDictList[i];
                TLa := TempOOoDictItem.LanguageCode;
                TCo := TempOOoDictItem.CountryCode;

                for j := 0 to OOoDictList.Count - 1 do
                begin
                    CheckOOoDictItem := OOoDictList[j];
                    CLa := CheckOOoDictItem.LanguageCode;
                    CCo := CheckOOoDictItem.CountryCode;

                    if (TLa = CLa) and (TCo = CCo) then Inc(Matches);
                end;

                if Matches > 1 then
                    LanguageDuplicates.Add(TLa + '_' + TCo +
                        ' ' + TempOOoDictItem.FileName);
            end;
        end;

        InstallProgressLabelDics.Caption := GetString('install_installcomplete');
        InstallProgressLabelFiles0.Caption := GetString('install_downloadcomplete');
        InstallProgressLabelFiles1.Caption := '';

        ProgressBar.Position := ProgressBar.Max;

        InstallLabel2.Visible := True;
        InstallLabel2.Caption := GetString('install2_complete');
        Screen.Cursor := crDefault;
        EnableCloseButton;
        InstallButtonNext.Enabled := True;
    end
    else begin
        // Update UI
        OOoDictStage := dsFinish;
        UpdateUI;
    end;
end;


{
    DownloadFile

    Called by the main installation routine, this kicks off the download
    process for the current dictionary.
}
function TMainForm.DownloadFile(URL, Name: String): Boolean;
begin
    Result := True;
    InstallProgressLabelFiles0.Caption := GetString('install_connecting');
    InstallProgressLabelFiles1.Caption := GetString('install_downloading') + ' ' + Name;
    FileDownloader.URL := URL;
    try
        FileDownloader.Get;
    except
        InstallFailed;
        Result := False;
    end;
end;


{
    InstallFailed

    Called by the try...except construct when a download fails -
    maybe a 404 or because of a problem with the network connection.
    Whatever - this resets the user interface: a panel with an error
    message is drawn the Next button disabled; Cancel is enabled and
    becomes Close.
}
procedure TMainForm.InstallFailed;
begin
    BeginInstallPanel.Visible := True;
    InstallDeleteWarningLabel.Visible := False;
    InstallLabelPrompt.Caption := GetString('error_downloaddic');
    InstallButtonNext.Enabled := False;
    InstallButtonCancel.Caption := GetString('button_close');
    InstallButtonCancel.Enabled := True;
    EnableCloseButton;
    Screen.Cursor := crDefault;
    DownloadOrInstallFailed := True;
end;


{
    FileDownloaderDocBegin

    Called by the HTTP component at the beginning of a download.
    Creates a temporary file for the file stream and sets the
    progress bar's position and max
}
procedure TMainForm.FileDownloaderDocBegin(Sender: TObject);
begin
    FileDownloader.RcvdStream :=
        TFileStream.Create(GetProfilePath + '~OOo_dictinstall_tmp.zip', fmCreate);
    ProgressBar.Position := 0;
    ProgressBar.Max := FileDownloader.ContentLength;
end;


{
    FileDownloaderDocData

    Called by the HTTP component when data for a file (a dictinary
    ZIP file) is received. Simply updates the progress bar and
    appropriate label.
}
procedure TMainForm.FileDownloaderDocData(Sender: TObject; Buffer: Pointer;
  Len: Integer);
var
    ProgressStr: String;
begin
    ProgressBar.Position := ProgressBar.Position + Len;

    ProgressStr := GetString('install_downloadprogress');
    ProgressStr := StringReplace(ProgressStr, '$d', IntToStr(ProgressBar.Position), [rfReplaceAll]);
    ProgressStr := StringReplace(ProgressStr, '$t', IntToStr(ProgressBar.Max), [rfReplaceAll]);

    InstallProgressLabelFiles0.Caption := ProgressStr;
end;


{
    FileDownloaderDocEnd

    When a file (a dictionary ZIP file) has finished downloading,
    this sets the progress bar to max and frees (thus closing)
    the filestream.
}
procedure TMainForm.FileDownloaderDocEnd(Sender: TObject);
begin
    ProgressBar.Position := ProgressBar.Max;
    FileDownloader.RcvdStream.Free;
end;


{
    UpdateUI

    Based on the OOoDictStage global variable, this function
    hides all panels except the next one to be used. It's long
    but fairly simple. Each stage sets the visible property for
    each panel -- doing it this long hand way prevents flashing.
}
procedure TMainForm.UpdateUI;
begin
    case OOoDictStage of
        dsWelcome:
            begin
                spWelcome.Visible := True;
                spSearching.Visible := False;
                spFound.Visible := False;
                spDownloadList.Visible := False;
                spDictionaries.Visible := False;
                spInstall.Visible := False;
                spFinish.Visible := False;
            end;
        dsSearching:
            begin
                spWelcome.Visible := False;
                spSearching.Visible := True;
                spFound.Visible := False;
                spDownloadList.Visible := False;
                spDictionaries.Visible := False;
                spInstall.Visible := False;
                spFinish.Visible := False;
            end;
        dsFound:
            begin
                spWelcome.Visible := False;
                spSearching.Visible := False;
                spFound.Visible := True;
                spDownloadList.Visible := False;
                spDictionaries.Visible := False;
                spInstall.Visible := False;
                spFinish.Visible := False;
            end;
        dsDownloadList:
            begin
                spWelcome.Visible := False;
                spSearching.Visible := False;
                spFound.Visible := False;
                spDownloadList.Visible := True;
                spDictionaries.Visible := False;
                spInstall.Visible := False;
                spFinish.Visible := False;
            end;
        dsDictionaries:
            begin
                spWelcome.Visible := False;
                spSearching.Visible := False;
                spFound.Visible := False;
                spDownloadList.Visible := False;
                spDictionaries.Visible := True;
                spInstall.Visible := False;
                spFinish.Visible := False;
            end;
        dsInstall:
            begin
                spWelcome.Visible := False;
                spSearching.Visible := False;
                spFound.Visible := False;
                spDownloadList.Visible := False;
                spDictionaries.Visible := False;
                spInstall.Visible := True;
                spFinish.Visible := False;
            end;
        dsFinish:
            begin
                spWelcome.Visible := False;
                spSearching.Visible := False;
                spFound.Visible := False;
                spDownloadList.Visible := False;
                spDictionaries.Visible := False;
                spInstall.Visible := False;
                spFinish.Visible := True;
            end;
    end;
end;


{
    FormShow

    The standard FormShow. This procedure is responsible for:
    * Reading in the config and strings INI files
    * Setting up the strings and config information based
      on locale - this includes setting captions for most of
      the labels
    * Sizing and positioning the "page panels" so that they
      are all in the right place and then sizing the main form
      appropriately.

    This procedure is getting VERY BIG and would benefit from
    being modularised.
}
procedure TMainForm.FormShow(Sender: TObject);
var
    IniFile: TIniFile;
    ErrorOccurred: Boolean;
    FullIniPath: String;
    TempStr: String;
begin
    // Load INI file
    ErrorOccurred := False;

    // First get the configuration
    FullIniPath := ExtractFilePath(Application.Exename) + 'dictinstall.ini';
    if FileExists(FullIniPath) then
    begin
        IniFile := TIniFile.Create(FullIniPath);

        // Get main configuration first
        OOoConfBaseURL := IniFile.ReadString('config', 'baseurl', '');
        OOoConfListURL := IniFile.ReadString('config', 'listurl', '');
        //OOoConfDictFileName := IniFile.ReadString('config', 'dictfile', '');
        OOoConfMatchPath := IniFile.ReadString('config', 'matchpath', '');
        OOoConfNextHelpURL := IniFile.ReadString('config', 'nexthelp', '');
        OOoConfLocalPath := IniFile.ReadString('config', 'localpath', '');
        OOoConfLocalList := IniFile.ReadString('config', 'locallist', 'dict.txt');
        OOoProxySetting := IniFile.ReadString('config', 'proxy', 'auto');

        // Set up proxy (if in use)
        SetupProxy;

        // now overwrite with locale specific configuration if present
        TempStr := IniFile.ReadString(LanguageCode, 'baseurl', '');
            if TempStr <> '' then OOoConfBaseURL := TempStr;
        TempStr := IniFile.ReadString(LanguageCode, 'listurl', '');
            if TempStr <> '' then OOoConfListURL := TempStr;
        //TempStr := IniFile.ReadString(LanguageCode, 'dictfile', '');
            //if TempStr <> '' then OOoConfDictFileName := TempStr;
        TempStr := IniFile.ReadString(LanguageCode, 'matchpath', '');
            if TempStr <> '' then OOoConfMatchPath := TempStr;
        TempStr := IniFile.ReadString(LanguageCode, 'nexthelp', '');
            if TempStr <> '' then OOoConfNextHelpURL := TempStr;
        TempStr := IniFile.ReadString(LanguageCode, 'localpath', '');
            if TempStr <> '' then OOoConfLocalPath := TempStr;
        TempStr := IniFile.ReadString(LanguageCode, 'locallist', '');
            if TempStr <> '' then OOoConfLocalList := TempStr;
        IniFile.Free;

        if OOoConfLocalPath <> '' then
        begin
            //here
            if FileExists(ExtractFilePath(Application.ExeName) + OOoConfLocalPath + OOoConfLocalList) then
            begin
                UsingLocalPath := True;
            end;
        end;

        // removed: (OOoConfDictFileName = '')
        if (OOoConfBaseURL = '') or (OOoConfListURL = '') or
           (OOoConfMatchPath = '') or (OOoConfNextHelpURL = '') then
                ErrorOccurred := True;
    end
    else ErrorOccurred := True;

    // Now get the strings
    FullIniPath := ExtractFilePath(Application.Exename) + 'strings.ini';
    if FileExists(FullIniPath) then
    begin
        // Get configuration for this locale first
        IniFile := TIniFile.Create(FullIniPath);
        IniFile.ReadSectionValues(LanguageCode, OOoConfStringList);
        IniFile.Free;
    end
    else ErrorOccurred := True;

    if ErrorOccurred then
    begin
        MessageDlg('Sorry, there was a problem loading the configuration', mtError,
            [mbOK], 0);
        Close;
    end;

    // Set the program title from the stringlist
    Application.Title := GetString('suitename') + ' ' + GetString('progname');

    // Resize form and panels, set the panels to no border
    spWelcome.Left := 0;
    spWelcome.Top := 68;
    spWelcome.BevelOuter := bvNone;
    spSearching.Left := 0;
    spSearching.Top := 68;
    spSearching.BevelOuter := bvNone;
    spFound.Left := 0;
    spFound.Top := 68;
    spFound.BevelOuter := bvNone;
    spDownloadList.Left := 0;
    spDownloadList.Top := 68;
    spDownloadList.BevelOuter := bvNone;
    spDictionaries.Left := 0;
    spDictionaries.Top := 68;
    spDictionaries.BevelOuter := bvNone;
    spInstall.Left := 0;
    spInstall.Top := 68;
    spInstall.BevelOuter := bvNone;
    spFinish.Left := 0;
    spFinish.Top := 68;
    spFinish.BevelOuter := bvNone;

    Width := 502;
    Height := 326;

    // Set up initial labels
    MainLabelSuitename.Caption := GetString('suitename');
    MainLabelProgname.Caption := GetString('progname');
    WelcomeLabel0.Caption := GetString('welcome0');
    WelcomeLabel1.Caption := GetString('welcome1');
    WelcomeLabel2.Caption := GetString('welcome2');
    SearchingLabel0.Caption := GetString('searching0');
    SearchingLabel1.Caption := GetString('searching1');
    SearchingLabel2.Caption := GetString('searching2');
    SearchingLabel3.Caption := GetString('searching3');
    FoundLabel0.Caption := GetString('found0');
    FoundLabel1.Caption := GetString('found1');
    DownloadListLabel0.Caption := GetString('downloadlist0');
    DownloadListLabel1.Caption := GetString('downloadlist1');
    DictionariesLabel0.Caption := GetString('dictionaries0');
    DictionariesLabel1.Caption := GetString('dictionaries1');
    DictionariesLabel2.Caption := GetString('dictionaries2');
    InstallLabel0.Caption := GetString('install0');
    if UsingLocalPath then
    begin
        InstallLabel1.Caption := GetString('install1_local');
        InstallLabelPrompt.Caption := GetString('install_prompt_local');
    end
    else begin
        InstallLabel1.Caption := GetString('install1');
        InstallLabelPrompt.Caption := GetString('install_prompt');
    end;
    FinishLabel0.Caption := GetString('finish0');
    FinishLabel1.Caption := GetString('finish1');
    FinishLabel2.Caption := GetString('finish2');
    FinishLabel3.Caption := GetString('finish3');

    // And buttons
    WelcomeButtonNext.Caption := GetString('button_next');
    WelcomeButtonCancel.Caption := GetString('button_cancel');
    SearchingButtonNext.Caption := GetString('button_next');
    SearchingButtonCancel.Caption := GetString('button_cancel');
    FoundButtonNext.Caption := GetString('button_next');
    FoundButtonCancel.Caption := GetString('button_cancel');
    DownloadLisTBitBtnNext.Caption := GetString('button_next');
    DownloadLisTBitBtnCancel.Caption := GetString('button_cancel');
    DictionariesButtonNext.Caption := GetString('button_next');
    DictionariesButtonCancel.Caption := GetString('button_cancel');
    InstallButtonNext.Caption := GetString('button_next');
    InstallButtonCancel.Caption := GetString('button_cancel');
    FinishButtonFinish.Caption := GetString('button_finish');
    FinishButtonCancel.Caption := GetString('button_cancel');
    AbouTBitBtn.Caption := GetString('button_about');

    // And other controls
    DownloadListDoNotLabel.Caption := GetString('downloadlist_donot');
    WelcomeDoNotLabel.Caption := GetString('welcome_donot');
    WelcomeDoNotCB.Checked := False;

    if LastPath = '' then begin
        WelcomeDoNotCB.Visible := False;
        WelcomeDoNotLabel.Visible := False;
    end;

    VersionLabel.Caption := PROG_NAME + ' v' + PROG_VER;
    if UsingLocalPath then
        VersionLabel.Caption := VersionLabel.Caption + ' - ' + GetString('local_mode');

    UpdateUI;
end;


{
    SetupProxy

    This will check the proxy settings from the INI file, and the
    registry and then setup the HTTP components to use a proxy if
    necessary.
}
procedure TMainForm.SetupProxy;
var
    Registry: TRegistry;
    ProxySettings, ProxyAddr, ProxyPort: String;
    //ProxyHttp11: Integer;
    ColonPos: Integer;
    Buffer: array[0..4096] of char;
    ProxySettingInt: Integer;
    StartPos, EndPos: Integer;
    EndStr: String;
begin
    if OOoProxySetting = 'off' then Exit;

    ProxySettings := '';
    //ProxyHttp11 := 0;
    ProxyAddr := '';
    ProxyPort := '';

    if OOoProxySetting = 'auto' then
    begin
        // Check for proxy and implement if IE does
        Registry := TRegistry.Create;
        try
            if Registry.OpenKey('Software\Microsoft\Windows\CurrentVersion\Internet Settings', False) then
            begin
                // The key exists; let's first get the data type as
                // different versions of IE have used different types
                case Registry.GetDataType('ProxyEnable') of
                    rdInteger: begin
                        // It's an integer
                        if Registry.ReadInteger('ProxyEnable') = 1 then
                        begin
                            // Proxy is on ... so we'll get the data
                            //ProxyHttp11 := Registry.ReadInteger('ProxyHttp1.1');
                            ProxySettings := Registry.ReadString('ProxyServer');
                        end;
                    end;
                    rdBinary: begin
                        // Deal with binary version here
                        Registry.ReadBinaryData('ProxyEnable', Buffer, 4096);
                        ProxySettingInt := Ord(Buffer[0]);
                        if ProxySettingInt = 1 then
                        begin
                            // Proxy is on ... get data as above
                            ProxySettings := Registry.ReadString('ProxyServer');
                        end;
                    end;
                end;
            end;

        finally
            Registry.Free;
        end;
    end
    else begin
        // Proxy should be specified ... so we'll copy it out
        ProxySettings := OOoProxySetting;
    end;

    if ProxySettings <> '' then
    begin
        // First check for multiple proxies by searching for 'http='
        // if present, strip out this part
        StartPos := Pos('http=', ProxySettings);
        if StartPos <> 0 then
        begin
            EndStr := Copy(ProxySettings, StartPos + 5, Length(ProxySettings));
            EndPos := Pos(';', EndStr);
            ProxySettings := Copy(EndStr, 0, EndPos - 1);
        end;

        ColonPos := Pos(':', ProxySettings);
        if ColonPos <> -1 then
        begin
            ProxyAddr := Copy(ProxySettings, 0, ColonPos - 1);
            ProxyPort := Copy(ProxySettings, ColonPos + 1, Length(ProxySettings));

            // We should now have ProxyAddr, ProxyPort and ProxyHttp11 all
            // set up correctly, so we'll now make the TWO HTTP components
            // use these -- note that ICS does not seem to use HTTP 1.1
            // so we can't set that
            HttpClient.Proxy := ProxyAddr;
            HttpClient.ProxyPort := ProxyPort;
            FileDownloader.Proxy := ProxyAddr;
            FileDownloader.ProxyPort := ProxyPort;
        end;
    end;
end;


{
    SearchingButtonNextClick

    Once the path search has taken place, this procedure determines
    how many OpenOffice.org paths are found and adjusts the UI
    accordingly.
}
procedure TMainForm.SearchingButtonNextClick(Sender: TObject);
begin
    OOoDictStage := dsFound;

    if PathListBox.Count = 0 then
    begin
        // Nothing found
        FoundLabel1.Caption := GetString('found_none');
        PathListBox.Visible := False;
        FoundLabel2.Visible := False;
        FoundButtonNext.Enabled := False;
        FoundButtonCancel.Caption := GetString('button_close');
    end
    else if PathListBox.Count = 1 then
    begin
        // Only one installation ... we don't need to ask
        FoundLabel1.Caption := GetString('found_one');
        PathListBox.ItemIndex := 0;
        PathListBox.Visible := False;

        // Update path in label
        SetLabelWithEllipsis(PathListBox.Items[0], FoundLabel2);
    end
    else begin
        // Multiple installations -- user must select
        FoundLabel1.Caption := GetString('found_multiple');
        FoundButtonNext.Enabled := False;
    end;

    UpdateUI;
end;


{
    WelcomeButtonCancelClick

    Closes the program!
}
procedure TMainForm.WelcomeButtonCancelClick(Sender: TObject);
begin
    Close;
end;


{
    GetString

    Returns a local specific string ... originally taken
    (in FormShow) from 'strings.ini'.
}
function TMainForm.GetString(Name: String): String;
begin
    Result := OOoConfStringList.Values[Name];
end;


{
    PathListBoxClick

    By default, the page containing the list of dictionaries
    has it's Next button greyed out. This procedure enables
    it once the user has clicked on one of the path entries.
}
procedure TMainForm.PathListBoxClick(Sender: TObject);
var
    i: Integer;
    EnableButton: Boolean;
begin
    EnableButton := False;
    for i := 0 to PathListBox.Count - 1 do
        if PathListBox.Selected[i] then EnableButton := True;

    FoundButtonNext.Enabled := EnableButton;
end;


{
    AbouTBitBtnClick

    Brings up the About box in unit "about"
}
procedure TMainForm.AbouTBitBtnClick(Sender: TObject);
begin
    AboutForm.CloseButton.Caption := GetString('button_close');
    AboutForm.SuiteLabel.Caption := GetString('suitename');
    AboutForm.ProgramLabel.Caption := GetString('progname');
    AboutForm.VersionLabel.Caption := PROG_NAME + ' v' + PROG_VER;
    AboutForm.CreditLabel.Caption := PROG_CREDITS;
    AboutForm.HomepageLabel.Caption := PROG_URL;
    AboutForm.ShowModal;
end;


{
    FinishLabel2Click

    When the user clicks on the blue underlined link on the final
    page, a web page comes up with installation information.
}
procedure TMainForm.FinishLabel2Click(Sender: TObject);
begin
    // Go to the install information page
    ShellExecute(Application.Handle, 'open', PChar(OOoConfNextHelpURL), nil, nil, 0)
end;


{
    VersionLabelClick

    OnClick for the small version label on the Welcome screen -
    brings up the about box.
}
procedure TMainForm.VersionLabelClick(Sender: TObject);
begin
    AbouTBitBtnClick(Sender);
end;


{
    DisableCloseButton

    Simply greys out the 'X' close button for the window.
    This helps to 'lock out' the user while a non-cancellable
    operation is taking place
}
procedure TMainForm.DisableCloseButton;
var
  Flag: UINT;
  AppSysMenu: THandle;
begin
  AppSysMenu:=GetSystemMenu(Handle,False);
  Flag:=MF_GRAYED;
  EnableMenuItem(AppSysMenu,SC_CLOSE,MF_BYCOMMAND or Flag);
end;


{
    EnableCloseButton

    Re-enables the window close button after it has been
    disabled
}
procedure TMainForm.EnableCloseButton;
var
  Flag: UINT;
  AppSysMenu: THandle;
begin
  AppSysMenu:=GetSystemMenu(Handle,False);
  Flag:=MF_ENABLED;
  EnableMenuItem(AppSysMenu,SC_CLOSE,MF_BYCOMMAND or Flag);
end;


{
    GetLanguageCode

    This function uses the Win32 API call GetUserDefaultLangID
    and processes it against a simple table to return a simple
    language code. That code is then used in the program to
    select the appropriate strings, and some configuration.
}
function TMainForm.GetLanguageCode: String;
var
    UserWd: Word;
    PrimaryLangID: Word;
    UserLang: String;
    IniFile: TIniFile;
    SectionsSL: TStringList;
begin
    UserWd := GetUserDefaultLangID;
    PrimaryLangID := UserWd and $3ff;

    case PrimaryLangID of
        // This picks the appropriate primary language
        // this list contains all languages currently available
        // as dictionaries at the time of writing ... if a
        // translation is made that isn't here, please add a line!
        $05: UserLang := 'cs';
        $06: UserLang := 'da';
        $13: UserLang := 'nl';
        $09: UserLang := 'en';
    	$0c: UserLang := 'fr';
    	$07: UserLang := 'de';
    	$08: UserLang := 'el';
    	$0e: UserLang := 'hu';
    	$10: UserLang := 'it';
    	$15: UserLang := 'pl';
    	$16: UserLang := 'pt';
    	$1a: UserLang := 'hr';
    	$0a: UserLang := 'es';
     	$1d: UserLang := 'sv';
        $0b: UserLang := 'fi';
    else
        // Use default language of English
        UserLang := 'en';
    end;

    // Is this language supported?
    // will check strings file
    SectionsSL := TStringList.Create;

    IniFile := TIniFile.Create(ExtractFilePath(Application.Exename) + 'strings.ini');
    IniFile.ReadSections(SectionsSL);
    IniFile.Free;

    if SectionsSL.IndexOf(UserLang) <> - 1 then
        // Yes, we have strings for that language
        Result := UserLang
    else
        // Nope, we'll have to use English
        Result := 'en';

    // Now change character set if necessary
    if Result = 'el' then
    begin
        // Switch to Greek character set
        SetCharSet(GREEK_CHARSET);
    end;

    SectionsSL.Free;
end;


{
    SetCharSet

    This sets the character set for every component on the form.
}
procedure TMainForm.SetCharSet(CS: TFontCharSet);
var
  i: Integer;
begin
    for i := ComponentCount - 1 downto 0 do
        if Components[i] is TControl then
            TFooClass(Components[i]).Font.Charset := CS;

    // Set the CharSet variable so we can pick it up later (for
    // example, in the About form
    ProgramCharset := CS;
end;


{
    WriteRegistry

    This function writes out user config to the registry. By using the
    registry rather than the INI or other files to store user specific
    settings, we will be able to run DictInstall off read only media
    (a CDROM for example).
}
procedure TMainForm.WriteRegistry;
var
    i: Integer;
    Registry: TRegistry;
    S: String;
    SpacePos: Integer;
begin
    Registry := TRegistry.Create;
    try
        Registry.OpenKey('\Software\OOoDictInstall', True);
        Registry.WriteInteger('left', Left);
        Registry.WriteInteger('top', Top);
        Registry.WriteInteger('width', Width);
        Registry.WriteInteger('height', Height);
        Registry.WriteString('lastpath', LastPath);
        Registry.CreateKey('langdups');
        Registry.OpenKey('langdups', True);
        for i := 0 to LanguageDuplicates.Count - 1 do
        begin
            // Split strings into code and filename
            // then write to the registry
            S := LanguageDuplicates[i];
            SpacePos := Pos(' ', S);
            Registry.WriteString(Copy(S, 0, SpacePos - 1),
                Copy(S, SpacePos + 1, Length(S)));
        end;
    finally
        Registry.Free;
    end;
end;


{
    ReadRegistry

    Reads in user specific data at the start of the program
    if it exists in the registry.
}
procedure TMainForm.ReadRegistry;
var
    Registry: TRegistry;
    KeyNames: TStringList;
    i: Integer;
begin
    Registry := TRegistry.Create;
    try
        if Registry.OpenKey('\Software\OOoDictInstall', False) then
        begin
            Position := poDesigned;
            Left := Registry.ReadInteger('left');
            Top := Registry.ReadInteger('top');
            Width := Registry.ReadInteger('width');
            Height := Registry.ReadInteger('height');
            LastPath := Registry.ReadString('lastpath');

            // Now load the language duplicates
            LanguageDuplicates.Clear;
            Registry.OpenKey('langdups', False);
            KeyNames := TStringList.Create;
            try
                KeyNames.Clear;
                Registry.GetKeyNames(KeyNames);
                for i := 0 to KeyNames.Count - 1 do
                    LanguageDuplicates.Add(KeyNames[i] + ' ' +
                        Registry.ReadString(KeyNames[i]));
            finally
                KeyNames.Free;
            end;
        end;
    except
        // Do nothing
        // this should prevent an error
    end;
    Registry.Free;
end;


{
    GetProfilePath

    This function returns a directory which represents the user
    path. We use it to store the OOo_dictionary_list.dat file. It is the
    environment UserProfile if available (which should give us
    the proper directory on NT, Win2K and XP), if that's not
    available, it compiles and looks for the user's Profile directory
    (for Win95). If all fails, we'll use the Windows directory.
}
function TMainForm.GetProfilePath: String;
var
    ProfilePath: String;
    Len: DWORD;
    WinDirP, UserNameP: Array[0..1023] of Char;
begin
    ProfilePath := GetEnvironmentVariable('UserProfile');
    if ProfilePath = '' then
    begin
        Len := 1023;
        Len := GetWindowsDirectory(WinDirP, Len);

        //Len := 1023;
        GetUserName(UserNameP, Len);

        ProfilePath := String(WinDirP) + '\Profiles\' + String(UserNameP);

        if not DirectoryExists(ProfilePath) then
            ProfilePath := String(WinDirP);
    end;

    // Add on the backslash
    Result := ProfilePath + '\';
end;


procedure TMainForm.HttpClientDocBegin(Sender: TObject);
begin
    HttpClient.RcvdStream := TFileStream.Create(GetProfilePath +
        'OOo_dictionary_list.dat', fmCreate);
end;

procedure TMainForm.WelcomeDoNotLabelClick(Sender: TObject);
begin
    WelcomeDoNotCB.Checked := not WelcomeDoNotCB.Checked;
end;

procedure TMainForm.DownloadListDoNotLabelClick(Sender: TObject);
begin
    DownloadListDoNotCB.Checked := not DownloadListDoNotCB.Checked;
end;

end.
