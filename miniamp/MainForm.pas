unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, SkinForm, Menus, StdCtrls, IniFiles, OleCtrls, ComCtrls,
  XAudioPlayer, MPGTools, FileCtrl;

const
     MAIN_FORM_GUID = 'B2982200-7C32-11D3-831B-444553540001';
     MAIN_FORM_CLASS = 'TPlayerForm';
     { UM stands for User Message }
     UM_APP_ID_CHECK = WM_APP + 101;
     UM_RESTORE_APPLICATION = WM_APP + 102;
     UM_PREVIOUS_INST_PARAMS = WM_APP + 103;
     { a user defined unique app id }
     APP_ID = 1234321;
type
  TPlayerForm = class(TForm)
    PlayerSkin: TSkinForm;
    PlayerMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    menuAbout: TMenuItem;
    menuPlayFile: TMenuItem;
    menuRecentFiles: TMenuItem;
    menuFavorites: TMenuItem;
    menuExit: TMenuItem;
    menuLanguage: TMenuItem;
    menuPlayback: TMenuItem;
    menuChinese: TMenuItem;
    menuEnglish: TMenuItem;
    menuJapanese: TMenuItem;
    menuPlay: TMenuItem;
    menuStop: TMenuItem;
    menuPause: TMenuItem;
    menuNext: TMenuItem;
    menuPrevious: TMenuItem;
    menuRepeat: TMenuItem;
    menuShuffle: TMenuItem;
    menuSkin: TMenuItem;
    menuDefaultSkin: TMenuItem;
    menuGerman: TMenuItem;
    menuSkinBrowser: TMenuItem;
    menuAlwaysOnTop: TMenuItem;
    menuAddToFavorites: TMenuItem;
    menuClearHistory: TMenuItem;
    menuOrganizeFavorites: TMenuItem;
    menuChineseBig5: TMenuItem;
    menuKorean: TMenuItem;
    menuSetup: TMenuItem;
    menuPlayList: TMenuItem;
    XAudioPlayer: TXaudioPlayer;

    procedure FormCreate(Sender: TObject);
    procedure PlayerSkinMouseUpNotify(ID: String; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure menuAboutClick(Sender: TObject);
    procedure menuExitClick(Sender: TObject);
    procedure menuRepeatClick(Sender: TObject);
    procedure menuShuffleClick(Sender: TObject);
    procedure menuPlayFileClick(Sender: TObject);
    procedure menuPlayListClick(Sender: TObject);
    procedure XAudioPlayerNotifyInputDuration(Sender: TXaudioPlayer;
      Duration: Cardinal);
    procedure XAudioPlayerNotifyInputTimecode(Sender: TXaudioPlayer; Hours,
      Minutes, Seconds, Fractions: Byte);
    procedure XAudioPlayerNotifyInputPosition(Sender: TXaudioPlayer;
      Offset, Range: Cardinal);
    procedure XAudioPlayerNotifyOutputVolume(Sender: TXaudioPlayer;
      MasterLevel, PcmLevel, Balance: Byte);
    procedure PlayerSkinTrackBarNotify(ID: String; Position: Integer);
    procedure menuPlayClick(Sender: TObject);
    procedure menuStopClick(Sender: TObject);
    procedure menuPauseClick(Sender: TObject);
    procedure menuNextClick(Sender: TObject);
    procedure menuPreviousClick(Sender: TObject);
    procedure XaudioPlayerNotifyPlayerState(Sender: TXaudioPlayer;
      State: Integer);
    procedure PlayerMenuPopup(Sender: TObject);
    procedure menuDefaultSkinClick(Sender: TObject);
    procedure menuGermanClick(Sender: TObject);
    procedure wmHandleMessages(var Msg : TMsg; var Handled : Boolean);
    procedure menuMainWindowClick(Sender: TObject);
    procedure menuSkinBrowserClick(Sender: TObject);
    procedure menuAlwaysOnTopClick(Sender: TObject);
    procedure menuAddToFavoritesClick(Sender: TObject);
    procedure menuClearHistoryClick(Sender: TObject);
    procedure menuOrganizeFavoritesClick(Sender: TObject);
    procedure menuLanguageClick(Sender: TObject);
    procedure menuSetupClick(Sender: TObject);
  private
    { Private declarations }
    procedure RedrawAllInfo;
    procedure UMAppIDCheck(var Msg: TMessage); message UM_APP_ID_CHECK;
    procedure UMRestoreApplication(var Msg: TMessage); message UM_RESTORE_APPLICATION;

    procedure CopyData(var Msg:TWMCOPYDATA);message WM_COPYDATA;
  public
    { Public declarations }
    procedure CloseminiAMP;
    procedure ReadSettingFile;
    procedure WriteSettingFile;
    procedure AddFilesToList(Files: TStrings; List: TListView);
    procedure StartPlayFileInList;
    procedure UpdateLanguage;
    procedure UpdateRecentFilesList(Filename: string);
    procedure GenerateRecentFilesItem;
    procedure GenerateFavoriteItem;
    procedure GenerateSkinsItem;
    procedure RecentFilesItemClick(Sender: TObject);
    procedure SkinsItemClick(Sender: TObject);
    procedure FavoritesItemClick(Sender: TObject);
    procedure FilesDropped(var Msg : TMessage) ; message WM_DROPFILES;
    procedure SaveLastSongList;
    procedure LoadLastSongList;
  end;

  TUpdateTimeInListThread = class(TThread)
  private
    start_num, end_num : integer;
  protected
    procedure Execute;override;
    procedure UpdateItems;
  public
    constructor Create;
    procedure SetRange(startnum, endnum : integer);
  end;

  PTMenuItem = ^TMenuItem;
  PTToolButton = ^TToolButton;
  PTButton = ^TButton;
  PTLabel = ^TLabel;
  PTGroupBox = ^TGroupBox;

var
  PlayerForm: TPlayerForm;
  LanguageList : TStringList;

  //The following is DATA for Player
  AppPath : string;
  SettingFile : TIniFile;
  bRepeatPlay, bShufflePlay : Boolean;
  CurrentLanguage : string;
  LastFolder : string;
  LastSkin : string;
  MPxIconIndex, PlaylistIconIndex: integer;
  CurrentFont : TFont;
  CurrentFileIndex : integer;
  CurrentFile : string;
  CurrentSongName : string;
  CurrentState : string;
  CurrentDuration : string;
  CurrentPos : string;
  bAlwaysOnTop : Boolean;
  iVolume, iPlayerFormLeft, iPlayerFormTop : integer;
  iPlayListFormLeft, iPlayListFormTop : integer;
  bListFormVisible : Boolean;
  UpdateTimeInListThd : TUpdateTimeInListThread;
  LastSongIndex: integer;
  FileInfoString : string;

implementation

uses PlayList, ShellApi, FileInfo, Prefereces;

{$R *.DFM}

function GetLongFileName(const FileName : string) : string;
var
  aInfo: TSHFileInfo;
begin
  if SHGetFileInfo(PChar(FileName),0,aInfo,Sizeof(aInfo),SHGFI_DISPLAYNAME)<>0 then
     Result:= ExtractFilePath(FileName)+string(aInfo.szDisplayName)+ExtractFileExt(FileName)
  else
     Result:= FileName;
end;

function GetSongName(filename : string) : string;
var
   MPEGFile : TMPEGAudio;
   SongName : string;
begin
     MPEGFile := TMPEGAudio.Create;
     try
        MPEGFile.FileName := filename;
        SongName := MPEGFile.Title;
     finally
            MPEGFile.Free;
     end;

     if  SongName= '[notag]' then
     begin
          SongName := ExtractFileName(filename);
     end;
     if Pos('.', SongName) > 0 then
        Result := Copy(SongName, 1, Pos('.', SongName)-1)
     else
         Result := SongName;
end;

procedure TPlayerForm.UMAppIDCheck(var Msg: TMessage);
begin
     Msg.Result :=APP_ID;
end;

procedure TPlayerForm.UMRestoreApplication(var Msg: TMessage);
begin
  if IsIconic(Application.Handle) then
     Application.Restore;
end;

procedure TPlayerForm.CopyData(var Msg: TWMCOPYDATA);
var
   fName : string;
   FileList : TStringList;
   startnum, endnum : integer;
begin
     if IsIconic(Application.Handle) then Application.Restore;
     fName := PChar(Msg.CopyDataStruct.lpData);
     if Pos('~', fName) <> 0 then fName := GetLongFileName(fName);
     if FileExists(fName) then
     begin
          FileList := TStringList.Create;
          FileList.Add(fName);
          startnum := ListForm.PlayListView.Items.Count;
          AddFilesToList(FileList, ListForm.PlayListView);
          StartPlayFileInList;
          endnum := ListForm.PlayListView.Items.Count - 1;
          UpdateTimeInListThd.SetRange(startnum, endnum);
          FileList.Free;
     end
     else
     if DirectoryExists(fName) then
     begin
          FileList := TStringList.Create;
          startnum := ListForm.PlayListView.Items.Count;
          AddDirectoryToStringList(FileList, fName);
          AddFilesToList(FileList, ListForm.PlayListView);
          FileList.Free;
          StartPlayFileInList;
          endnum := ListForm.PlayListView.Items.Count - 1;
          UpdateTimeInListThd.SetRange(startnum, endnum);
     end;
end;

procedure TPlayerForm.AddFilesToList(Files: TStrings; List: TListView);
var
   i, TotalNum, loop : integer;
   Ext, tempstr, S : string;
   Item : TListItem;
   M3UFile : TextFile;
   PLSFile : TIniFile;
   musicPath : string;
begin
     with Files do
     begin
          for i := 0 to Count - 1 do
          begin
               //Strings[i] is the full pathname of file
               Ext := UpperCase(ExtractFileExt(Strings[i]));
               //if it is a MP3 file then add it
               if ((Ext = '.MP1') or (Ext = '.MP2') or (Ext = '.MP3')) then
               begin
                    UpdateRecentFilesList(Strings[i]);
                    Item := List.Items.Add;
                    tempstr := ExtractFileName(Strings[i]);
                    Item.Caption := Format('%.3d.', [List.Items.Count]) + Copy(tempstr, 1, Pos('.', tempstr)-1);
                    Item.SubItems.Add('');
                    Item.SubItems.Add(Strings[i]);
                    Item.SubItems.Add('00:00');
               end;
               //if it is a list file then open it, then add it
               if (Ext = '.PLS') or (Ext = '.INI') then
               begin
                    musicPath := ExtractFilePath(Strings[i]);
                    UpdateRecentFilesList(Strings[i]);
                    PLSFile := TIniFile.Create(Strings[i]);
                    TotalNum := PLSFile.ReadInteger('playlist', 'NumberOfEntries', 0);
                    for loop := 1 to TotalNum do
                    begin
                         S := PLSFile.ReadString('playlist', 'file'+IntToStr(loop), '');
                         if Pos(':', S) <> 0 then
                         begin
                              //with full path
                              Item := List.Items.Add;
                              tempstr := ExtractFileName(S);
                              Item.Caption := Format('%.3d.', [List.Items.Count]) + Copy(tempstr, 1, Pos('.', tempstr)-1);
                              Item.SubItems.Add('');
                              Item.SubItems.Add(S);
                              Item.SubItems.Add('00:00');
                         end
                         else
                         begin
                              //plus musicPath
                              Item := List.Items.Add;
                              S := musicPath + S;
                              tempstr := ExtractFileName(S);
                              Item.Caption := Format('%.3d.', [List.Items.Count]) + Copy(tempstr, 1, Pos('.', tempstr)-1);
                              Item.SubItems.Add('');
                              Item.SubItems.Add(S);
                              Item.SubItems.Add('00:00');
                         end;
                    end;
                    PLSFile.Free;
               end;

               if Ext = '.M3U' then
               begin
                    musicPath := ExtractFilePath(Strings[i]);
                    UpdateRecentFilesList(Strings[i]);
                    AssignFile(M3UFile, Strings[i]);
                    Reset(M3UFile);
                    while not Eof(M3UFile) do
                    begin
                         readln(M3UFile, S);
                         if Pos(':', S) <> 0 then
                         begin
                              //with full path
                              Item := List.Items.Add;
                              tempstr := ExtractFileName(S);
                              Item.Caption := Format('%.3d.', [List.Items.Count]) + Copy(tempstr, 1, Pos('.', tempstr)-1);
                              Item.SubItems.Add('');
                              Item.SubItems.Add(S);
                              Item.SubItems.Add('00:00');
                         end
                         else
                         begin
                              //plus musicPath
                              Item := List.Items.Add;
                              S := musicPath + S;
                              tempstr := ExtractFileName(S);
                              Item.Caption := Format('%.3d.', [List.Items.Count]) + Copy(tempstr, 1, Pos('.', tempstr)-1);
                              Item.SubItems.Add('');
                              Item.SubItems.Add(S);
                              Item.SubItems.Add('00:00');
                         end;
                    end;
                    CloseFile(M3UFile);
               end;
          end;
     end;
     ListForm.FormResize(self);
end;

procedure TPlayerForm.ReadSettingFile;
begin
     SettingFile := TIniFile.Create(AppPath+'miniAMP.ini');
     CurrentLanguage := SettingFile.ReadString('General', 'Language', 'English');
     LastFolder := SettingFile.ReadString('General', 'LastDir', '');
     LastSkin := SettingFile.ReadString('General', 'LastSkin', '');
     if LastSkin <> '' then LastSkin := AppPath+LastSkin;
     bShufflePlay := SettingFile.ReadBool('General', 'Shuffle', FALSE);
     bRepeatPlay := SettingFile.ReadBool('General', 'Repeat', FALSE);
     bAlwaysOnTop := SettingFile.ReadBool('General', 'AlwaysOnTop', FALSE);
     iVolume := SettingFile.ReadInteger('General', 'Volume', 60);
     iPlayerFormLeft := SettingFile.ReadInteger('General', 'PlayerFormLeft', 100);
     iPlayerFormTop := SettingFile.ReadInteger('General', 'PlayerFormTop', 100);
     iPlayListFormLeft := SettingFile.ReadInteger('General', 'PlayListFormLeft', 361);
     iPlayListFormTop := SettingFile.ReadInteger('General', 'PlayListFormLeft', 100);
     bListFormVisible := SettingFile.ReadBool('General', 'ListFormVisible', FALSE);
     LastSongIndex := SettingFile.ReadInteger('General', 'LastSongIndex', 0);
     MPxIconIndex := SettingFile.ReadInteger('General', 'MPxIconIndex', 0);
     PlaylistIconIndex := SettingFile.ReadInteger('General', 'PlaylistIconIndex', 0);
     SettingFile.Free;
end;

procedure TPlayerForm.WriteSettingFile;
begin
     SettingFile := TIniFile.Create(AppPath+'miniAMP.ini');
     SettingFile.WriteString('General', 'Language', CurrentLanguage);
     SettingFile.WriteString('General', 'LastDir', LastFolder);
     if LastSkin <> '' then Delete(LastSkin, 1, Length(AppPath));
     SettingFile.WriteString('General', 'LastSkin', LastSkin);
     SettingFile.WriteBool('General', 'Shuffle', bShufflePlay);
     SettingFile.WriteBool('General', 'Repeat', bRepeatPlay);
     SettingFile.WriteBool('General', 'AlwaysOnTop', bAlwaysOnTop);
     SettingFile.WriteInteger('General', 'Volume', iVolume);
     SettingFile.WriteInteger('General', 'PlayerFormLeft', PlayerForm.Left);
     SettingFile.WriteInteger('General', 'PlayerFormTop', PlayerForm.Top);
     SettingFile.WriteInteger('General', 'PlayListFormLeft', ListForm.Left);
     SettingFile.WriteInteger('General', 'PlayListFormTop', ListForm.Top);
     SettingFile.WriteBool('General', 'ListFormVisible', bListFormVisible);
     SettingFile.WriteInteger('General', 'LastSongIndex', CurrentFileIndex);
     SettingFile.Free;
end;

procedure TPlayerForm.CloseminiAMP;
begin
     CurrentFont.Free;
     LanguageList.Free;
     XAudioPlayer.OutputReset;
     XAudioPlayer.Exit;
     WriteSettingFile;
     SaveLastSongList;
     Close;
end;


procedure TPlayerForm.wmHandleMessages(var Msg : TMsg; var Handled : Boolean);
var
   Item: TMenuItem;
begin
     if (Msg.message = WM_SYSCOMMAND) then
     begin
          Item := PlayerMenu.FindItem(Msg.wParam, fkCommand);
          if Item <> nil then Item.Click;
     end;
end;

procedure TPlayerForm.FormCreate(Sender: TObject);
var
   SystemMenu : HMenu;
begin
     DragAcceptFiles(Handle,True );
     SetWindowText(Handle, PChar(MAIN_FORM_GUID));
     UpdateTimeInListThd := TUpdateTimeInListThread.Create;
     //Add menu to system menu
     SystemMenu := GetSystemMenu(Application.Handle, False );
     InsertMenu(SystemMenu, 0, MF_ByPosition+MF_POPUP, PlayerMenu.Handle, 'mini&AMP' );
     InsertMenu(SystemMenu, 1, MF_ByPosition + MF_SEPARATOR , 0, '');
     AppPath := ExtractFilePath(Application.ExeName);
     ReadSettingFile;
     if ((LastSkin = '') or (FileExists(LastSkin)=FALSE)) then
        PlayerSkin.LoadDefaultSkin
     else
         PlayerSkin.LoadSkinFile(LastSkin);
     PlayerSkin.SetHotAreaState('BUTTON_REPEAT', bRepeatPlay);
     PlayerSkin.SetHotAreaState('BUTTON_SHUFFLE', bShufflePlay);
     bAlwaysOnTop := not bAlwaysOnTop;
     menuAlwaysOnTop.Click;
     XAudioPlayer.SetOutputVolume(XA_OUTPUT_VOLUME_IGNORE_FIELD, iVolume, XA_OUTPUT_VOLUME_IGNORE_FIELD);
     PlayerSkin.SetTrackBarPos('TRACKBAR_VOLUME', iVolume);
     Left := iPlayerFormLeft;
     Top := iPlayerFormTop;
     LanguageList := TStringList.Create;
     LanguageList.Add('English');
     LanguageList.Add('Chinese');
     LanguageList.Add('Big5');
     LanguageList.Add('Japanese');
     LanguageList.Add('German');
     LanguageList.Add('Korean');
     Application.OnMessage := wmHandleMessages;
end;

procedure TPlayerForm.PlayerSkinMouseUpNotify(ID: String;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   pt : TPoint;
begin
     if Button = mbLeft then
     begin
          if ID = 'BUTTON_EXIT' then CloseminiAMP;
          if ID = 'BUTTON_MENU' then
          begin
               pt := Point(X, Y);
               pt := ClientToScreen(pt);
               PlayerMenu.Popup(pt.X, pt.Y);
          end;
          if ID = 'BUTTON_ABOUT' then menuAboutClick(self);
          if ID = 'BUTTON_REPEAT' then menuRepeatClick(self);
          if ID = 'BUTTON_SHUFFLE' then menuShuffleClick(self);
          if ID = 'BUTTON_LIST' then menuPlayListClick(self);
          if ID = 'BUTTON_EJECT' then menuPlayFileClick(self);
          if ID = 'BUTTON_PLAY' then menuPlayClick(self);
          if ID = 'BUTTON_STOP' then menuStopClick(self);
          if ID = 'BUTTON_PAUSE' then menuPauseClick(self);
          if ID = 'BUTTON_NEXT' then menuNextClick(self);
          if ID = 'BUTTON_PREV' then menuPreviousClick(self);
          if ID = 'BUTTON_PLAY' then menuPlayClick(self);
          if ID = 'BUTTON_MINIMIZE' then Application.Minimize;
      end;

     if Button = mbRight then
     begin
          pt := Point(X, Y);
          pt := ClientToScreen(pt);
          PlayerMenu.Popup(pt.X, pt.Y);
     end;
end;

procedure TPlayerForm.menuAboutClick(Sender: TObject);
begin
     SetUpForm.PreferencePageControl.ActivePage := SetUpForm.AboutTabSheet;
     SetupForm.ShowModal;
end;

procedure TPlayerForm.menuExitClick(Sender: TObject);
begin
     CloseminiAMP;
end;

procedure TPlayerForm.menuRepeatClick(Sender: TObject);
begin
     //Repeat
     bRepeatPlay := not bRepeatPlay;
     menuRepeat.Checked := bRepeatPlay;
     PlayerSkin.SetHotAreaState('BUTTON_REPEAT', bRepeatPlay);
end;

procedure TPlayerForm.menuShuffleClick(Sender: TObject);
begin
     //Shuffle
     bShufflePlay := not bShufflePlay;
     menuShuffle.Checked := bShufflePlay;
     PlayerSkin.SetHotAreaState('BUTTON_SHUFFLE', bShufflePlay)
end;

procedure TPlayerForm.menuPlayFileClick(Sender: TObject);
var
   FileOpenDlg : TOpenDialog;
   startnum, endnum : integer;
begin
     //Choose a MP3 audio file to play
     FileOpenDlg := TOpenDialog.Create(self);
     FileOpenDlg.Options := FileOpenDlg.Options + [ofAllowMultiSelect];
     if ((LastFolder <> '') and (DirectoryExists(LastFolder))) then
        FileOpenDlg.InitialDir := LastFolder
     else
         FileOpenDlg.InitialDir := AppPath;
     FileOpenDlg.Filter := 'MPEG Audio Files (*.MP1,*.MP2,*.MP3)|*.MP1;*.MP2;*.MP3|Playlist Files (*.M3U,*.PLS)|*.M3U;*.PLS';
     try
        if FileOpenDlg.Execute then
        begin
             LastFolder := ExtractFilePath(FileOpenDlg.Files.Strings[0]);
             startnum := ListForm.PlayListView.Items.Count;
             AddFilesToList(FileOpenDlg.Files, ListForm.PlayListView);
             StartPlayFileInList;
             endnum := ListForm.PlayListView.Items.Count - 1;
             UpdateTimeInListThd.SetRange(startnum, endnum);
        end;
     finally
            FileOpenDlg.Free;
     end;
end;

procedure TPlayerForm.UpdateLanguage;
var
   LanFile : TIniFile;
   offset : Cardinal;
   S : string;
begin
     //Open language file
     LanFile := TIniFile.Create(AppPath+CurrentLanguage+'.ini');

     //Update PlayerForm menu
     offset := Cardinal(@menuAbout);
     while offset <= Cardinal(@menuPlayList) do
     begin
          S := LanFile.ReadString('PlayerForm', PTMenuItem(offset)^.Name, '');
          if S <> '' then PTMenuItem(offset)^.Caption := S;
          offset := offset + sizeof(PTMenuItem);
     end;

     //Update ListForm menu
     offset := Cardinal(@ListForm.menuAddFiles);
     while offset <= Cardinal(@ListForm.menuClearPlaylist) do
     begin
          S := LanFile.ReadString('ListForm', PTMenuItem(offset)^.Name, '');
          if S <> '' then PTMenuItem(offset)^.Caption := S;
          offset := offset + sizeof(PTMenuItem);
     end;

     if CurrentFont <> nil then CurrentFont.Free;
     CurrentFont := TFont.Create;

     //update ListForm toolbar
     //set font name and size
     CurrentFont.Name := LanFile.ReadString('General', 'FontName', 'MS Sans Serif');
     CurrentFont.Size := LanFile.ReadInteger('General', 'FontSize', 7);
     CurrentFont.Charset := DEFAULT_CHARSET;
     if CurrentLanguage = 'Chinese' then CurrentFont.Charset := GB2312_CHARSET;
     if CurrentLanguage = 'Japanese' then CurrentFont.Charset := SHIFTJIS_CHARSET;
     if CurrentLanguage = 'Korean' then CurrentFont.Charset := HANGEUL_CHARSET;
     if CurrentLanguage = 'Big5' then CurrentFont.Charset := CHINESEBIG5_CHARSET;

     ListForm.Font := CurrentFont;
     ListForm.PlayListToolBar.Font := CurrentFont;
     ListForm.PlayListView.Font := CurrentFont;
     ListForm.PlayListStatus.Font := CurrentFont;

     offset := Cardinal(@ListForm.tbAdd);
     while offset <= Cardinal(@ListForm.tbList) do
     begin
          S := LanFile.ReadString('ListForm', PTToolButton(offset)^.Name, '');
          if S <> '' then PTToolButton(offset)^.Caption := S;
          offset := offset + sizeof(PTToolButton);
     end;
     ListForm.RenameButton.Caption := LanFile.ReadString('ListForm', 'RenameButton', '&Rename');
     ListForm.DeleteButton.Caption := LanFile.ReadString('ListForm', 'DeleteButton', '&Delete');
     ListForm.EditButton.Caption := LanFile.ReadString('ListForm', 'EditButton', '&Edit');
     //update Caption of forms
     ListForm.Caption := LanFile.ReadString('ListForm', 'ListForm', 'Playlist Editor');
//     AboutForm.Caption := LanFile.ReadString('AboutForm', 'AboutForm', 'About miniAMP');

     //update About Dialog
{
     AboutForm.TitleLabel.Caption := LanFile.ReadString('AboutForm', 'TitleLabel', 'miniAMP v1.0 - A small and exquisite MP3 Player');
     AboutForm.CopyrightLabel.Caption := LanFile.ReadString('AboutForm', 'CopyrightLabel', 'Copyright (c) 1994-1999 FriendSoft');
     AboutForm.hpLabel.Caption := LanFile.ReadString('AboutForm', 'hpLabel', 'For more information, please visited');
     AboutForm.mailLabel.Caption := LanFile.ReadString('AboutForm', 'mailLabel', 'Any bugs and suggestions, send mail to');
     AboutForm.CloseButton.Caption := LanFile.ReadString('AboutForm', 'CloseButton', '&Close');
}
     //update FileInfo Dialog
     FileInfoForm.Font := CurrentFont;
     FileInfoForm.Caption := LanFile.ReadString('FileInfoForm', 'FileInfoForm', 'MPEG Info + ID3 TAG Editor');
     FileInfoForm.TitleLabel.Caption := LanFile.ReadString('FileInfoForm', 'TitleLabel', 'Title');
     FileInfoForm.ArtistLabel.Caption := LanFile.ReadString('FileInfoForm', 'ArtistLabel', 'Artist');
     FileInfoForm.AlbumLabel.Caption := LanFile.ReadString('FileInfoForm', 'AlbumLabel', 'Album');
     FileInfoForm.YearLabel.Caption := LanFile.ReadString('FileInfoForm', 'YearLabel', 'Year');
     FileInfoForm.GenreLabel.Caption := LanFile.ReadString('FileInfoForm', 'GenreLabel', 'Genre');
     FileInfoForm.CommentLabel.Caption := LanFile.ReadString('FileInfoForm', 'CommentLabel', 'Comment');
     FileInfoForm.MPEGInfoGroupBox.Caption := LanFile.ReadString('FileInfoForm', 'MPEGInfo', 'MPEG Info');

     FileInfoForm.SaveButton.Caption := LanFile.ReadString('FileInfoForm', 'SaveButton', 'Save');
     FileInfoForm.CancelButton.Caption := LanFile.ReadString('FileInfoForm', 'CancelButton', 'Cancel');
     FileInfoForm.RemoveButton.Caption := LanFile.ReadString('FileInfoForm', 'RemoveButton', 'Remove');

     //other string
     AlbumString := LanFile.ReadString('Others', 'AlbumString', 'Album:');
     ArtistString := LanFile.ReadString('Others', 'ArtistString', 'Artist:');
     DirectoryString := LanFile.ReadString('Others', 'DirectoryString', 'Select a Directory');
     AddtoFavoritesString := LanFile.ReadString('Others', 'AddtoFavoritesString', 'Add to Favorites');
     LanFile.Free;
end;

procedure TPlayerForm.menuGermanClick(Sender: TObject);
begin
     if FileExists(AppPath+'German.ini') = FALSE then
     begin
          ShowMessage('Language file can not be found.');
          Exit;
     end;
     menuGerman.Checked := TRUE;
     CurrentLanguage := 'German';
     UpdateLanguage;
end;

procedure TPlayerForm.menuPlayListClick(Sender: TObject);
begin
     if ListForm.Visible then
        ListForm.Hide
     else
         ListForm.Show;
     bListFormVisible := ListForm.Visible;
end;

procedure TPlayerForm.menuMainWindowClick(Sender: TObject);
begin
     if PlayerForm.Visible then
        PlayerForm.Hide
     else
         PlayerForm.Show;
end;

procedure TPlayerForm.StartPlayFileInList;
var
   TotalFileCount: integer;
begin
     if (CurrentState = 'PLAYING') or (CurrentState = 'PAUSED') then Exit;
     TotalFileCount := ListForm.PlayListView.Items.Count;
     if TotalFileCount > 0 then
     begin
          if (CurrentFileIndex < 0) or (CurrentFileIndex > TotalFileCount) then
             CurrentFileIndex := 0;
          XAudioPlayer.Stop;             
          CurrentFile := ListForm.PlayListView.Items[CurrentFileIndex].Subitems.Strings[1];
          XAudioPlayer.InputOpen(CurrentFile);
          XAudioPlayer.Play;
     end;
end;

procedure TPlayerForm.XaudioPlayerNotifyInputDuration(
  Sender: TXaudioPlayer; Duration: Cardinal);
var
  Hours: Cardinal;
  Minutes: Cardinal;
  Seconds: Cardinal;
begin
  Hours := Duration div 3600;
  Duration := Duration - 3600*Hours;
  Minutes := Duration div 60;
  Duration := Duration - 60*Minutes;
  Seconds := Duration;
  CurrentDuration := Format('%.2d:%.2d', [Minutes, Seconds]);
  PlayerSkin.SetDisplayText('TEXT_LEN', '[' + CurrentDuration + ']');
  CurrentSongName := GetSongName(CurrentFile);
  PlayerSkin.SetDisplayText('TEXT_SONG', CurrentSongName);
end;

procedure TPlayerForm.XAudioPlayerNotifyInputTimecode(
  Sender: TXaudioPlayer; Hours, Minutes, Seconds, Fractions: Byte);
begin
     CurrentPos := Format('%.2d:%.2d', [Minutes, Seconds]);
     PlayerSkin.SetDisplayText('TEXT_POS', CurrentPos);
end;

procedure TPlayerForm.XAudioPlayerNotifyInputPosition(
  Sender: TXaudioPlayer; Offset, Range: Cardinal);
begin
     PlayerSkin.SetTrackBarPos('TRACKBAR_POS', Offset div 4);
end;

procedure TPlayerForm.XAudioPlayerNotifyOutputVolume(Sender: TXaudioPlayer;
  MasterLevel, PcmLevel, Balance: Byte);
begin
     PlayerSkin.SetTrackBarPos('TRACKBAR_VOLUME', PcmLevel);
     iVolume := PcmLevel;
end;

procedure TPlayerForm.PlayerSkinTrackBarNotify(ID: String;
  Position: Integer);
begin
     if ID = 'TRACKBAR_VOLUME' then
     begin
          XAudioPlayer.SetOutputVolume(XA_OUTPUT_VOLUME_IGNORE_FIELD,
                                       Position,
                                       XA_OUTPUT_VOLUME_IGNORE_FIELD);
          iVolume := Position;
     end;


     if ID = 'TRACKBAR_POS' then
        XAudioPlayer.InputSeek(Position*4, 400);
end;

procedure TPlayerForm.menuPlayClick(Sender: TObject);
begin

     if CurrentState = 'PLAYING' then
     begin
          XAudioPlayer.Pause;
          Exit;
     end;

     if CurrentState = 'PAUSED' then
     begin
          XAudioPlayer.Play;
          Exit;
     end;

     if CurrentState = 'STOPPED' then
     begin
          XAudioPlayer.InputOpen(CurrentFile);
          XAudioPlayer.Play;
          Exit;
     end;

//     if CurrentState = '' then
//     begin
//          ShowMessage(IntToStr(CurrentFileIndex));
          XAudioPlayer.InputOpen(CurrentFile);
          XAudioPlayer.Play;
//          Exit;
//     end;
end;

procedure TPlayerForm.menuStopClick(Sender: TObject);
begin
     XAudioPlayer.Stop;
end;

procedure TPlayerForm.menuPauseClick(Sender: TObject);
begin
     if CurrentState = 'PAUSED' then
        XAudioPlayer.Play
     else
         XAudioPlayer.Pause;
end;

procedure TPlayerForm.menuNextClick(Sender: TObject);
label Again;
begin
Again:
     //Play next file
     Inc(CurrentFileIndex);
     if CurrentFileIndex >= ListForm.PlayListView.Items.Count then
        CurrentFileIndex := ListForm.PlayListView.Items.Count - 1;
     if CurrentFileIndex < 0 then CurrentFileIndex := 0;
     if ListForm.PlayListView.Items[CurrentFileIndex] <> nil then
        CurrentFile := ListForm.PlayListView.Items[CurrentFileIndex].SubItems[1]
     else
         CurrentFile := '';
     if (not FileExists(CurrentFile)) and (CurrentFileIndex < ListForm.PlayListView.Items.Count) then
     goto Again;
     PlayerForm.XAudioPlayer.Stop;
     PlayerForm.XAudioPlayer.InputOpen(CurrentFile);
     PlayerForm.XAudioPlayer.Play;
     PlayerForm.XaudioPlayerNotifyPlayerState(XaudioPlayer, XA_PLAYER_STATE_PLAYING);
end;

procedure TPlayerForm.menuPreviousClick(Sender: TObject);
begin
     //Play previous file
     Dec(CurrentFileIndex);
     if CurrentFileIndex < 0 then CurrentFileIndex := 0;
     if ListForm.PlayListView.Items[CurrentFileIndex] <> nil then
        CurrentFile := ListForm.PlayListView.Items[CurrentFileIndex].SubItems[1]
     else
         CurrentFile := '';
     PlayerForm.XAudioPlayer.Stop;
     PlayerForm.XAudioPlayer.InputOpen(CurrentFile);
     PlayerForm.XAudioPlayer.Play;
end;

procedure TPlayerForm.XaudioPlayerNotifyPlayerState(Sender: TXaudioPlayer;
  State: Integer);
var
   i : integer;
begin
     for i := 0 to ListForm.PlayListView.Items.Count-1  do
         ListForm.PlayListView.Items[i].SubItems[0] := '';

     case State of
     XA_PLAYER_STATE_STOPPED:begin
                                  //
                                  CurrentState := 'STOPPED';
                                  if ListForm.PlayListView.Items[CurrentFileIndex] <> nil then
                                  ListForm.PlayListView.Items[CurrentFileIndex].SubItems[0] := '[]';
                             end;

     XA_PLAYER_STATE_PLAYING:begin
                                  //
                                  CurrentState := 'PLAYING';
                                  if ListForm.PlayListView.Items[CurrentFileIndex] <> nil then
                                  ListForm.PlayListView.Items[CurrentFileIndex].SubItems[0] := '>>';
                             end;

     XA_PLAYER_STATE_PAUSED:begin
                                 //
                                 CurrentState := 'PAUSED';
                                  if ListForm.PlayListView.Items[CurrentFileIndex] <> nil then
                                 ListForm.PlayListView.Items[CurrentFileIndex].SubItems[0] := '||';
                            end;

     XA_PLAYER_STATE_EOF:begin
                              //Play next song
                              CurrentState := 'EOF';
                              if bShufflePlay = TRUE then
                              begin
                                   Randomize;
                                   CurrentFileIndex := Random(ListForm.PlayListView.Items.Count);
                                   CurrentFile := ListForm.PlayListView.Items[CurrentFileIndex].SubItems[1];
                                   XAudioPlayer.InputOpen(CurrentFile);
                                   PlayerForm.XAudioPlayer.Play;
                                   Exit;
                              end;
                              if CurrentFileIndex < ListForm.PlayListView.Items.Count - 1 then menuNextClick(self)
                              else
                              if CurrentFileIndex = ListForm.PlayListView.Items.Count - 1 then
                              begin
                                   if bRepeatPlay = TRUE then
                                   begin
                                        CurrentFileIndex := 0;
                                        CurrentFile := ListForm.PlayListView.Items[CurrentFileIndex].SubItems[1];
                                        menuPlayClick(self);
                                   end;
                              end;
                         end;
     end;
end;

procedure TPlayerForm.PlayerMenuPopup(Sender: TObject);
begin
     menuPlayList.Checked := ListForm.Visible;
     menuAlwaysOnTop.Checked := bAlwaysOnTop;
     GenerateRecentFilesItem;
     GenerateFavoriteItem;
     GenerateSkinsItem;

     if CurrentLanguage = 'Chinese' then menuChinese.Checked := TRUE;
     if CurrentLanguage = 'Japanese' then menuJapanese.Checked := TRUE;
     if CurrentLanguage = 'German' then menuGerman.Checked := TRUE;
     if CurrentLanguage = 'English' then menuEnglish.Checked := TRUE;
     if CurrentLanguage = 'Big5' then menuChineseBig5.Checked := TRUE;
     if CurrentLanguage = 'Korean' then menuKorean.Checked := TRUE;


     menuRepeat.Checked := bRepeatPlay;
     menuShuffle.Checked := bShufflePlay;
end;

procedure TPlayerForm.UpdateRecentFilesList(Filename: string);
var
   SettingFile: TIniFile;
   A, B, holder: string;
   n: integer;
begin
     if LowerCase(ExtractFileName(Filename)) = 'lastlist.ini' then Exit;
     SettingFile := TIniFile.Create(AppPath+'miniAMP.ini');
     A := UpperCase(ExpandFilename(Filename));
     Holder := A;
     for n := 1 to 5 do
     begin
          B := SettingFile.ReadString('History', IntToStr(n), '');
          if B = holder then
          begin
               SettingFile.WriteString('History', IntToStr(n), 'ABCDEFG');
               B := SettingFile.ReadString('History', IntToStr(n), '');
          end;
          SettingFile.WriteString('History', IntToStr(n), A);
          A := B;
     end;
     SettingFile.Free;
end;

procedure TPlayerForm.GenerateRecentFilesItem;
var
   SettingFile: TIniFile;
   n, m: integer;
   NewItem: TMenuItem;
   A, B, wipe, Count: string;
Label REDO;
begin
     while menuRecentFiles.Count > 2 do
           menuRecentFiles.Items[menuRecentFiles.Count-1].Free;
     while ListForm.popmenuHistory.Items.Count > 2 do
           ListForm.popmenuHistory.Items[ListForm.popmenuHistory.Items.Count-1].Free;

     SettingFile := TIniFile.Create(AppPath+'miniAMP.ini');

     for n := 1 to 5 do
     begin
          Count := IntToStr(n);
          REDO:
               A := SettingFile.ReadString('History', Count, '');
               if A = '' then exit;
               if not FileExists(A) then
               begin
                    for m := StrToInt(Count) to 6 do
                    begin
                         B := SettingFile.ReadString('History', IntToStr(m+1), '');
                         SettingFile.WriteString('History', IntToStr(m), B);
                         wipe := IntToStr(m+1);
                    end;
                    SettingFile.WriteString('History',wipe,'');
                    goto REDO;
               end;
               NewItem := TMenuItem.Create(menuRecentFiles);
               NewItem.Caption := '&'+ Count + ' ' + A;
               NewItem.Tag := n-1;
               NewItem.OnClick := RecentFilesItemClick;
               menuRecentFiles.Add(NewItem);

               NewItem := TMenuItem.Create(ListForm.popmenuHistory.Items);
               NewItem.Caption := '&'+ Count + ' ' + A;
               NewItem.Tag := n-1;
               NewItem.OnClick := RecentFilesItemClick;
               ListForm.popmenuHistory.Items.Add(NewItem);
     end;
     SettingFile.Free;
end;

procedure TPlayerForm.GenerateFavoriteItem;
var
   NewItem: TMenuItem;
   SearchRec: TSearchRec;
begin
     while menuFavorites.Count > 3 do
           menuFavorites.Items[menuFavorites.Count-1].Free;

     while ListForm.popmenuFavorites.Items.Count > 3 do
           ListForm.popmenuFavorites.Items[ListForm.popmenuFavorites.Items.Count-1].Free;

     if DirectoryExists(AppPath+'Favorites') then
     begin
          if FindFirst(AppPath+'Favorites\'+'*.M3U', faAnyFile, SearchRec) = 0 then
          begin
               NewItem := TMenuItem.Create(self);
               NewItem.Caption := Copy(SearchRec.Name, 1, Pos('.', SearchRec.Name)-1);
               NewItem.OnClick := FavoritesItemClick;
               menuFavorites.Add(NewItem);

               NewItem := TMenuItem.Create(self);
               NewItem.Caption := Copy(SearchRec.Name, 1, Pos('.', SearchRec.Name)-1);
               NewItem.OnClick := FavoritesItemClick;
               ListForm.popmenuFavorites.Items.Add(NewItem);
          end;

          while FindNext(SearchRec) = 0 do
          begin
               NewItem := TMenuItem.Create(self);
               NewItem.Caption := Copy(SearchRec.Name, 1, Pos('.', SearchRec.Name)-1);
               NewItem.OnClick := FavoritesItemClick;
               menuFavorites.Add(NewItem);

               NewItem := TMenuItem.Create(self);
               NewItem.Caption := Copy(SearchRec.Name, 1, Pos('.', SearchRec.Name)-1);
               NewItem.OnClick := FavoritesItemClick;
               ListForm.popmenuFavorites.Items.Add(NewItem);
          end;
          FindClose(SearchRec);
    end;
end;

procedure TPlayerForm.GenerateSkinsItem;
var
   NewItem: TMenuItem;
   SearchRec    : TSearchRec;
begin
     while menuSkin.Count > 3 do
           menuSkin.Items[menuSkin.Count-1].Free;

     if FindFirst(AppPath+'Skins\'+'*.*', faDirectory, SearchRec) = 0 then
     begin
          if SearchRec.Name[1] <> '.' then
          begin
               NewItem := TMenuItem.Create(self);
               NewItem.Caption := SearchRec.Name;
               NewItem.OnClick := SkinsItemClick;
               menuSkin.Add(NewItem);
          end;
     end;
     while FindNext(SearchRec) = 0 do
     begin
          if SearchRec.Name[1] <> '.' then
          begin
               NewItem := TMenuItem.Create(self);
               NewItem.Caption := SearchRec.Name;
               NewItem.OnClick := SkinsItemClick;
               menuSkin.Add(NewItem);
          end;
    end;
     FindClose(SearchRec);
end;

procedure TPlayerForm.RecentFilesItemClick(Sender: TObject);
var
   Filename : string;
   Files : TStringList;
   endnum : integer;
   SettingFile: TIniFile;
begin
     Files := TStringList.Create;
     SettingFile := TIniFile.Create(AppPath+'miniAMP.ini');
     Filename := SettingFile.ReadString('History',IntToStr(TMenuItem(Sender).Tag +1), '');
     SettingFile.Free;
     Files.Add(Filename);
     ListForm.PlayListView.Items.Clear;
     LastFolder := ExtractFilePath(Filename);
     AddFilesToList(Files, ListForm.PlayListView);
     StartPlayFileInList;
     endnum := ListForm.PlayListView.Items.Count - 1;
     UpdateTimeInListThd.SetRange(0, endnum);
     Files.Free;
end;

procedure TPlayerForm.SkinsItemClick(Sender: TObject);
var
   SkinFileName : string;
begin
     SkinFileName := TMenuItem(Sender).Caption;
     SkinFileName := AppPath+'Skins\'+SkinFileName+'\skin.ini';
     if FileExists(SkinFileName) then
     begin
          PlayerSkin.LoadSkinFile(SkinFileName);
          LastSkin := SkinFileName;
          ReDrawAllInfo;
     end;
end;

procedure TPlayerForm.FavoritesItemClick(Sender: TObject);
var
   FileList: TStringList;
   ListFileName : string;
   endnum : integer;
begin
     ListFileName := TMenuItem(Sender).Caption;
     ListFileName := AppPath+'Favorites\'+ListFileName+'.m3u';
     if FileExists(ListFileName) then
     begin
          FileList:= TStringList.Create;
          FileList.Add(ListFileName);
          ListForm.PlayListView.Items.Clear;
          AddFilesToList(FileList, ListForm.PlayListView);
          StartPlayFileInList;
          endnum := ListForm.PlayListView.Items.Count - 1;
          UpdateTimeInListThd.SetRange(0, endnum);
     end;
end;

procedure TPlayerForm.menuDefaultSkinClick(Sender: TObject);
begin
     PlayerSkin.LoadDefaultSkin;
     LastSkin := '';
     ReDrawAllInfo;
end;

procedure TPlayerForm.RedrawAllInfo;
begin
     if CurrentDuration = '' then CurrentDuration := '00:00';
     if CurrentPos = '' then CurrentPos := '00:00';
     PlayerSkin.SetHotAreaState('BUTTON_REPEAT', bRepeatPlay);
     PlayerSkin.SetHotAreaState('BUTTON_SHUFFLE', bShufflePlay);
     PlayerSkin.SetDisplayText('TEXT_LEN', '[' + CurrentDuration + ']');
     PlayerSkin.SetDisplayText('TEXT_POS', CurrentPos);
     PlayerSkin.SetDisplayText('TEXT_SONG', CurrentSongName);
     PlayerSkin.SetTrackBarPos('TRACKBAR_VOLUME', iVolume);
end;

procedure TPlayerForm.menuSkinBrowserClick(Sender: TObject);
var
   SkinDlg : TOpenDialog;
begin
     //open dialog to change the skin
     SkinDlg := TOpenDialog.Create(self);
     SkinDlg.InitialDir := AppPath+'Skins';
     SkinDlg.Filter := 'miniAMP Skin Files (Skin.ini)|Skin.ini';
     try
        if SkinDlg.Execute then
        begin
             PlayerSkin.LoadSkinFile(SkinDlg.Filename);
             LastSkin := SkinDlg.FileName;
        end;
     finally
            SkinDlg.Free;
     end;
     ReDrawAllInfo;
end;

procedure TPlayerForm.menuAlwaysOnTopClick(Sender: TObject);
begin
     if bAlwaysOnTop then
     begin
          bAlwaysOnTop := FALSE;
          SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0,
                       SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE);
     end
     else
     begin
       	  bAlwaysOnTop := TRUE;
          SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0,
                       SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE);
     end;
end;

procedure TPlayerForm.FilesDropped(var Msg : TMessage);
var
   hDrop : THandle ;
   fName : array[0..254] of char;
   NumberOfFiles : integer;
   fCounter : integer ;
   FileList : TStringList;
   startnum, endnum : integer;
begin
     FileList := TStringList.Create;
     hDrop := Msg.WParam ;
     NumberOfFiles := DragQueryFile(hDrop,$FFFFFFFF,fName,254);
     for fCounter := 0 to NumberOfFiles - 1 do
     begin
          DragQueryFile(hDrop,fCounter,fName,254);
          if DirectoryExists(fName) then
             AddDirectoryToStringList(FileList, fName)
          else
              FileList.Add(fName);
     end;
     startnum := ListForm.PlayListView.Items.Count;
     AddFilesToList(FileList, ListForm.PlayListView);
     StartPlayFileInList;
     endnum := ListForm.PlayListView.Items.Count - 1;
     UpdateTimeInListThd.SetRange(startnum, endnum);
     DragFinish(hDrop);
     FileList.Free;
end;

procedure TPlayerForm.menuAddToFavoritesClick(Sender: TObject);
var
   InputString : string;
   M3UFile : TextFile;
   loop : integer;
begin
     if ListForm.PlayListView.Items.Count = 0 then Exit;
     //Check the dir
     if not DirectoryExists(AppPath+'Favorites') then
        if not CreateDir(AppPath+'Favorites') then
           raise Exception.Create('Cannot create favorites directory');

     InputString:= InputBox(AddtoFavoritesString, '', 'My Favorite');

     if InputString <> '' then
     begin
          AssignFile(M3UFile, AppPath+'Favorites\'+InputString+'.M3U');
          ReWrite(M3UFile);
          for loop := 1 to ListForm.PlayListView.Items.Count do
               writeln(M3UFile, ListForm.PlayListView.Items[loop-1].SubItems[1]);
          CloseFile(M3UFile);
     end;
     ListForm.UpdateFavoritesListView;
end;

constructor TUpdateTimeInListThread.Create;
begin
     start_num := 0;
     end_num := 0;
     inherited Create(TRUE);
end;

procedure TUpdateTimeInListThread.SetRange(startnum, endnum : integer);
begin
     start_num := startnum;
     end_num := endnum;
     Resume;
end;

procedure TUpdateTimeInListThread.Execute;
begin
     while (not terminated) do
     begin
          while start_num <= end_num do
          begin
               Synchronize(UpdateItems);
               start_num := start_num + 1;
          end;
          Suspend;
     end;
end;

procedure TUpdateTimeInListThread.UpdateItems;
var
   filename : string;
   MPEGFile : TMPEGAudio;
   timesec, tmpHour, tmpMin, tmpSec : Word;
begin
     MPEGFile := TMPEGAudio.Create;
     try
        filename := ListForm.PlayListView.Items[start_num].Subitems[1];
        MPEGFile.FileName := filename;
        timesec := MPEGFile.Duration;
        tmpHour := timesec DIV (60*60);
        tmpMin := (timesec - (tmpHour * 60 * 60)) DIV 60;
        tmpSec := timesec - (tmpHour * 60 * 60) - (tmpMin * 60);
        ListForm.PlayListView.Items[start_num].Subitems[2] := Format('%.2d:%.2d', [tmpMin, tmpSec]);
     finally
            MPEGFile.Free;
     end;
end;

procedure TPlayerForm.SaveLastSongList;
var
   PLSFile : TIniFile;
   loop : integer;
begin
     PLSFile := TIniFile.Create(AppPath+'lastlist.ini');
     PLSFile.EraseSection('playlist');
     for loop := 1 to ListForm.PlayListView.Items.Count do
         PLSFile.WriteString('playlist', 'file'+IntToStr(loop), ListForm.PlayListView.Items[loop-1].SubItems[1]);
     PLSFile.WriteString('playlist', 'NumberOfEntries', IntToStr(ListForm.PlayListView.Items.Count));
     PLSFile.Free;
end;

procedure TPlayerForm.LoadLastSongList;
var
   FileList : TStringList;
   startnum, endnum : integer;
begin
     if FileExists(AppPath+'lastlist.ini') then
     begin
          FileList := TStringList.Create;
          FileList.Add(AppPath+'lastlist.ini');
          startnum := ListForm.PlayListView.Items.Count;
          AddFilesToList(FileList, ListForm.PlayListView);
          FileList.Free;
          if LastSongIndex <= ListForm.PlayListView.Items.Count then
               CurrentFileIndex := LastSongIndex
          else
              CurrentFileIndex := 0;
          if ListForm.PlayListView.Items[CurrentFileIndex] <> nil then
             CurrentFile := ListForm.PlayListView.Items[CurrentFileIndex].Subitems.Strings[1]
          else
              CurrentFile := '';
          XAudioPlayer.InputOpen(CurrentFile);
          XAudioPlayer.Play;
          endnum := ListForm.PlayListView.Items.Count - 1;
          UpdateTimeInListThd.SetRange(startnum, endnum);
     end;
end;

procedure TPlayerForm.menuClearHistoryClick(Sender: TObject);
var
   SettingFile: TIniFile;
   n: integer;
begin
     SettingFile := TIniFile.Create(AppPath+'miniAMP.ini');
     for n := 1 to 5 do
     begin
          SettingFile.WriteString('History', IntToStr(n), '');
     end;
     SettingFile.Free;
end;

procedure TPlayerForm.menuOrganizeFavoritesClick(Sender: TObject);
begin
     if (ListForm.Visible = FALSE) then ListForm.Show;
     ListForm.menuOrganizeFavoritesClick(self);
end;


procedure TPlayerForm.menuLanguageClick(Sender: TObject);
var
   NewLanguage : string;
begin
     NewLanguage := LanguageList.Strings[TMenuItem(Sender).Tag];
     if FileExists(AppPath+NewLanguage+'.ini') = FALSE then
     begin
          ShowMessage('Language file can not be found.');
          Exit;
     end
     else
     begin
          TMenuItem(Sender).Checked := TRUE;
          CurrentLanguage := NewLanguage;
          UpdateLanguage;
          SetupForm.UpdateLanguage;
     end;
end;

procedure TPlayerForm.menuSetupClick(Sender: TObject);
begin
     ListForm.tbSetup.Click;
end;

end.


