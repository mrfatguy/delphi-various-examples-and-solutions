unit PlayList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Menus, ImgList, IniFiles, FileCtrl, ToolWin, ShellApi, MPGTools,
  ExtCtrls, Buttons, StdCtrls;

type
  TListForm = class(TForm)
    ToolbarImageList: TImageList;
    PlayListView: TListView;
    PlayListStatus: TStatusBar;
    CoolBar: TCoolBar;
    PlayListToolBar: TToolBar;
    tbAdd: TToolButton;
    tbFavorites: TToolButton;
    tbHistory: TToolButton;
    tbSetup: TToolButton;
    tbList: TToolButton;
    popmenuList: TPopupMenu;
    popmenuAdd: TPopupMenu;
    popmenuFavorites: TPopupMenu;
    popmenuHistory: TPopupMenu;
    popmenuListContext: TPopupMenu;
    menuAddFiles: TMenuItem;
    menuAddDir: TMenuItem;
    menuOpenList: TMenuItem;
    menuSavePlaylist: TMenuItem;
    menuRandomPlaylist: TMenuItem;
    menuAddToFavorites: TMenuItem;
    menuClearHistory: TMenuItem;
    menuOrganizeFavorites: TMenuItem;
    menuPlayThisFile: TMenuItem;
    menuRemove: TMenuItem;
    menuFileInfo: TMenuItem;
    menuClearPlaylist: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    N1: TMenuItem;
    N2: TMenuItem;
    MainPanel: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    Bevel1: TBevel;
    DeleteButton: TButton;
    RenameButton: TButton;
    FavoritesListView: TListView;
    EditButton: TButton;
    Panel4: TPanel;
    Bevel2: TBevel;
    SpdBtnClose: TSpeedButton;
    ToolButton4: TToolButton;
    procedure tbAddClick(Sender: TObject);
    procedure menuAddFilesClick(Sender: TObject);
    procedure tbListClick(Sender: TObject);
    procedure menuOpenListClick(Sender: TObject);
    procedure menuSavePlaylistClick(Sender: TObject);
    procedure menuClearPlaylistClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure PlayListViewDblClick(Sender: TObject);
    procedure tbHistoryClick(Sender: TObject);
    procedure menuRandomPlaylistClick(Sender: TObject);
    procedure menuAddDirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure menuAddToFavoritesClick(Sender: TObject);
    procedure tbFavoritesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PlayListViewClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure menuClearHistoryClick(Sender: TObject);
    procedure menuOrganizeFavoritesClick(Sender: TObject);
    procedure SpdBtnCloseClick(Sender: TObject);
    procedure MainPanelResize(Sender: TObject);
    procedure menuPlayThisFileClick(Sender: TObject);
    procedure menuRemoveClick(Sender: TObject);
    procedure menuFileInfoClick(Sender: TObject);
    procedure PlayListViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RenameButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure FavoritesListViewEdited(Sender: TObject; Item: TListItem;
      var S: String);
    procedure EditButtonClick(Sender: TObject);
    procedure FavoritesListViewDblClick(Sender: TObject);
    procedure FavoritesListViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tbSetupClick(Sender: TObject);
  private
    { Private declarations }
    procedure FilesDropped(var Msg : TMessage );message WM_DROPFILES;
 public
    { Public declarations }
    procedure UpdateFavoritesListView;
  end;

  procedure AddDirectoryToStringList(FileList : TStringList; returnPath : string);

var
  ListForm: TListForm;

  // for laguange string
  AlbumString, ArtistString,
  DirectoryString, AddtoFavoritesString : string;


implementation

uses MainForm, FileInfo, Prefereces;

{$R *.DFM}

procedure AddDirectoryToStringList(FileList : TStringList; returnPath : string);
var
   SearchRec    : TSearchRec;
begin
     if returnPath[Length(returnPath)] <> '\' then returnPath := returnPath+'\';
     if FindFirst(returnPath+'*.MP?', faAnyFile, SearchRec) = 0 then
     begin
          LastFolder := returnPath;
          FileList.Add(returnPath+SearchRec.Name);
     end;
     while FindNext(SearchRec) = 0 do
           FileList.Add(returnPath+SearchRec.Name);

     if FindFirst(returnPath+'*.PLS', faAnyFile, SearchRec) = 0 then
     begin
          LastFolder := returnPath;
          FileList.Add(returnPath+SearchRec.Name);
     end;
     while FindNext(SearchRec) = 0 do
           FileList.Add(returnPath+SearchRec.Name);

     if FindFirst(returnPath+'*.M3U', faAnyFile, SearchRec) = 0 then
     begin
          LastFolder := returnPath;
          FileList.Add(returnPath+SearchRec.Name);
     end;
     while FindNext(SearchRec) = 0 do
           FileList.Add(returnPath+SearchRec.Name);

     if FindFirst(returnPath+'*.*', faDirectory, SearchRec) = 0 then
     begin
          if SearchRec.Name[1] <> '.' then
          begin
               AddDirectoryToStringList(FileList, returnPath+SearchRec.Name)
          end;
     end;

     while FindNext(SearchRec) = 0 do
     begin
          if SearchRec.Name[1] <> '.' then
          begin
               AddDirectoryToStringList(FileList, returnPath+SearchRec.Name)
          end;
     end;
     FindClose(SearchRec);
     Application.ProcessMessages;
end;

procedure TListForm.tbAddClick(Sender: TObject);
begin
     PlayerForm.menuPlayFileClick(self);
end;

procedure TListForm.menuAddFilesClick(Sender: TObject);
begin
     tbAddClick(self);
end;

procedure TListForm.menuAddDirClick(Sender: TObject);
var
     returnPath   : string;
     FileList     : TStringList;
     startnum, endnum : integer;
begin
     SelectDirectory(DirectoryString,'', returnPath);
     //add directory
     if (Length(returnPath)>0) then
     begin
          FileList := TStringList.Create;
          startnum := PlayListView.Items.Count;
          AddDirectoryToStringList(FileList, returnPath);
          PlayerForm.AddFilesToList(FileList, PlayListView);
          FileList.Free;
          PlayerForm.StartPlayFileInList;
          endnum := PlayListView.Items.Count - 1;
          UpdateTimeInListThd.SetRange(startnum, endnum);
     end;
end;

procedure TListForm.tbListClick(Sender: TObject);
var
   FileOpenDlg : TOpenDialog;
   endnum : integer;
begin
     FileOpenDlg := TOpenDialog.Create(self);
     if ((LastFolder <> '') and (DirectoryExists(LastFolder))) then
        FileOpenDlg.InitialDir := LastFolder
     else
         FileOpenDlg.InitialDir := AppPath;
     FileOpenDlg.Filter := 'PLS or M3U Playlist|*.M3U;*.PLS|PLS Playlist|*.PLS|M3U Playlist|*.M3U';
     try
        if FileOpenDlg.Execute then
        begin
             //Clear PlayList and add it
             PlayListView.Items.Clear;
             LastFolder := ExtractFilePath(FileOpenDlg.Files.Strings[0]);
             PlayerForm.AddFilesToList(FileOpenDlg.Files, PlayListView);
             PlayerForm.StartPlayFileInList;
             endnum := ListForm.PlayListView.Items.Count - 1;
             UpdateTimeInListThd.SetRange(0, endnum);
        end;
     finally
            FileOpenDlg.Free;
     end;
end;

procedure TListForm.menuOpenListClick(Sender: TObject);
begin
     tbListClick(self);
end;

procedure TListForm.menuSavePlaylistClick(Sender: TObject);
var
   FileSaveDlg : TSaveDialog;
   PLSFile : TIniFile;
   M3UFile : TextFile;
   Ext : string;
   loop : integer;
   bWithFullPath : Boolean;
begin
//     if MessageDlg('With full pathname?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        bWithFullPath := TRUE;
//     else
//         bWithFullPath := FALSE;
     //Save Playlist to a file
     FileSaveDlg := TSaveDialog.Create(self);
     FileSaveDlg.InitialDir := LastFolder;
     FileSaveDlg.DefaultExt := 'M3U';
     FileSaveDlg.FilterIndex := 2;
     FileSaveDlg.Filter := 'PLS Playlist|*.PLS|M3U Playlist|*.M3U';
     try
        if FileSaveDlg.Execute then
        begin
             Ext := UpperCase(ExtractFileExt(FileSaveDlg.FileName));
             if Ext = '.M3U' then
             begin
                  AssignFile(M3UFile, FileSaveDlg.FileName);
                  ReWrite(M3UFile);
                  for loop := 1 to PlayListView.Items.Count do
                  begin
                       if bWithFullPath then
                          writeln(M3UFile, PlayListView.Items[loop-1].SubItems[1])
                       else
                           writeln(M3UFile, ExtractFileName(PlayListView.Items[loop-1].SubItems[1]));
                  end;
                  CloseFile(M3UFile);
             end
             else
             if Ext = '.PLS' then
             begin
                  PLSFile := TIniFile.Create(FileSaveDlg.FileName);
                  PLSFile.EraseSection('playlist');
                  for loop := 1 to PlayListView.Items.Count do
                  begin
                       if bWithFullPath then
                          PLSFile.WriteString('playlist', 'file'+IntToStr(loop), PlayListView.Items[loop-1].SubItems[1])
                       else
                           PLSFile.WriteString('playlist', 'file'+IntToStr(loop), ExtractFileName(PlayListView.Items[loop-1].SubItems[1]));

                  end;
                  PLSFile.WriteString('playlist', 'NumberOfEntries', IntToStr(PlayListView.Items.Count));
                  PLSFile.Free;
             end;
        end;
     finally
            FileSaveDlg.Free;
     end;
end;

procedure TListForm.menuClearPlaylistClick(Sender: TObject);
begin
     PlayListView.Items.Clear;
     CurrentFileIndex := 0;
     CurrentFile := '';
end;

procedure TListForm.FormResize(Sender: TObject);
begin
     PlayListView.Columns[1].Width := 40;
     PlayListView.Columns[2].Width := 0;
     PlayListView.Columns[3].Width := 100;
     PlayListView.Columns[0].Width := PlayListView.ClientWidth - 140;
     PlayListView.Scroll(0, 0);
end;

procedure TListForm.PlayListViewDblClick(Sender: TObject);
begin
     //Change current file and play it
     CurrentFileIndex := PLayListView.Selected.Index;
     CurrentFile := PlayListView.Selected.SubItems[1];
     PlayerForm.XAudioPlayer.Stop;
     PlayerForm.XAudioPlayer.InputOpen(CurrentFile);
     PlayerForm.XAudioPlayer.Play;
end;

procedure TListForm.tbHistoryClick(Sender: TObject);
var
   pt : TPoint;
begin
     PlayerForm.GenerateRecentFilesItem;
     pt.x := tbHistory.Left+PlayListToolBar.Left;
     pt.y := CoolBar.Height+1;
     pt := ClientToScreen(pt);
     popmenuHistory.Popup(pt.x, pt.y);
end;

procedure TListForm.menuRandomPlaylistClick(Sender: TObject);
var
   c, i, j, loop1, loop2 : integer;
   temp : string;
begin
     //Random playlist
     Randomize;
     c := PlayListView.Items.Count div 2;
     for loop1 := 1 to c do
     begin
          i := Random(c);
          j := c+Random(c);
          //exchange the i and j
          for loop2 := 0 to PlayListView.Items[i].SubItems.Count-1 do
          begin
               temp := PlayListView.Items[i].SubItems[loop2];
               PlayListView.Items[i].SubItems[loop2] := PlayListView.Items[j].SubItems[loop2];
               PlayListView.Items[j].SubItems[loop2] := temp;
          end;
          temp := Copy(PlayListView.Items[j].Caption, 1, 4)+Copy(PlayListView.Items[i].Caption, 5, 100);
          PlayListView.Items[i].Caption := Copy(PlayListView.Items[i].Caption, 1, 4)+Copy(PlayListView.Items[j].Caption, 5, 100);
          PlayListView.Items[j].Caption := temp;
     end;
end;

procedure TListForm.FormCreate(Sender: TObject);
begin
     DragAcceptFiles(Handle,True);
     ListForm.Visible := bListFormVisible;
end;

procedure TListForm.FilesDropped(var Msg : TMessage);
begin
     PlayerForm.FilesDropped(Msg);
end;

procedure TListForm.menuAddToFavoritesClick(Sender: TObject);
begin
     PlayerForm.menuAddToFavoritesClick(self);
end;

procedure TListForm.tbFavoritesClick(Sender: TObject);
//var
//   pt : TPoint;
begin
//     PlayerForm.GenerateFavoriteItem;
//     pt.x := tbFavorites.Left+PlayListToolBar.Left;
//     pt.y := CoolBar.Height+1;
//     pt := ClientToScreen(pt);
//     popmenuFavorites.Popup(pt.x, pt.y);
       MainPanel.Visible := not MainPanel.Visible;
       if MainPanel.Visible then UpdateFavoritesListView;
end;

procedure TListForm.FormShow(Sender: TObject);
begin
     Top := iPlayListFormTop;
     Left := iPlayListFormLeft;
     bListFormVisible := TRUE;
end;

procedure TListForm.PlayListViewClick(Sender: TObject);
var
   filename : string;
   MPEGFile : TMPEGAudio;
   Info     : string;
   index    : integer;
begin
     if PlayListView.Selected <> nil then
     begin
          index := PlayListView.Selected.Index;
          MPEGFile := TMPEGAudio.Create;
          try
             filename := PlayListView.Items[index].Subitems[1];
             MPEGFile.FileName := filename;
             Info := ArtistString + MPEGFile.Artist;
             Info := Info + '    ' + AlbumString +MPEGFile.Album;
          finally
            MPEGFile.Free;
            end;
          PlayListStatus.SimpleText := Info;
     end;
end;

procedure TListForm.FormHide(Sender: TObject);
begin
     iPlayListFormTop := Top;
     iPlayListFormLeft := Left;
     bListFormVisible := FALSE;
end;

procedure TListForm.menuClearHistoryClick(Sender: TObject);
begin
     PlayerForm.menuClearHistoryClick(self);
end;

procedure TListForm.menuOrganizeFavoritesClick(Sender: TObject);
begin
     MainPanel.Visible := TRUE;
     UpdateFavoritesListView;
end;

procedure TListForm.SpdBtnCloseClick(Sender: TObject);
begin
     MainPanel.Hide;
end;

procedure TListForm.MainPanelResize(Sender: TObject);
begin
     SpdBtnClose.Left := Panel4.Width - 20;
end;

procedure TListForm.menuPlayThisFileClick(Sender: TObject);
begin
     if PlayListView.Selected <> nil then
     begin
          CurrentFileIndex := PLayListView.Selected.Index;
          CurrentFile := PlayListView.Selected.SubItems[1];
          PlayerForm.XAudioPlayer.Stop;
          PlayerForm.XAudioPlayer.InputOpen(CurrentFile);
          PlayerForm.XAudioPlayer.Play;
     end;
end;

procedure TListForm.menuRemoveClick(Sender: TObject);
var
   i : integer;
begin
     if PlayListView.SelCount > 0 then
     begin
          for i:=PlayListView.Items.Count-1 downto 0 do
          begin
               if PlayListView.Items[i].Selected = TRUE then
                  PlayListView.Items.Delete(i);
          end;
     end;
     for i:= 0 to PlayListView.Items.Count-1 do
     begin
          PlayListView.Items[i].Caption := Format('%.3d.', [i+1]) + Copy(PlayListView.Items[i].Caption, 5, 100);
     end;
end;

procedure TListForm.menuFileInfoClick(Sender: TObject);
begin
     if PlayListView.Selected <> nil then
        if FileExists(PlayListView.Selected.SubItems[1]) then
           begin
                FileInfoString := PlayListView.Selected.SubItems[1];
                FileInfoForm.ShowModal;
           end;
end;

procedure TListForm.PlayListViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_DELETE then menuRemoveClick(self);
     if Key = VK_RETURN then menuPlayThisFileClick(self);
     if Key = VK_INSERT then menuFileInfoClick(self);
end;

procedure TListForm.UpdateFavoritesListView;
var
   SearchRec: TSearchRec;
   NewItem : TListItem;
begin
     FavoritesListView.Items.Clear;
     if DirectoryExists(AppPath+'Favorites') then
     begin
          if FindFirst(AppPath+'Favorites\'+'*.M3U', faAnyFile, SearchRec) = 0 then
          begin
               NewItem := FavoritesListView.Items.Add;
               NewITem.Caption := Copy(SearchRec.Name, 1, Pos('.', SearchRec.Name)-1);
               NewItem.ImageIndex := 1;
          end;

          while FindNext(SearchRec) = 0 do
          begin
               NewItem := FavoritesListView.Items.Add;
               NewITem.Caption := Copy(SearchRec.Name, 1, Pos('.', SearchRec.Name)-1);
               NewItem.ImageIndex := 1;
          end;
          FindClose(SearchRec);
    end;
end;

procedure TListForm.RenameButtonClick(Sender: TObject);
label InputAgain;
var
   InputString : string;
   FileName : string;
begin
     if FavoritesListView.Selected <> nil then
     begin
          FileName := FavoritesListView.Selected.Caption;
InputAgain:
          InputString := InputBox(AddtoFavoritesString, '', FileName);
          if InputString <> '' then
          begin
               if InputString <> FileName then
                  if not FileExists(AppPath+'Favorites\'+InputString+'.m3u') then
                     RenameFile(AppPath+'Favorites\'+FileName+'.m3u', AppPath+'Favorites\'+InputString+'.m3u')
                  else
                      goto InputAgain;
          end;
          //FavoritesListView.Selected.EditCaption;
          UpdateFavoritesListView;
     end;

end;

procedure TListForm.DeleteButtonClick(Sender: TObject);
var
//   SHF : TShFileOpStruct;
   FileName : string;
begin
     if FavoritesListView.Selected <> nil then
     begin
          FileName := AppPath+'Favorites\'+FavoritesListView.Selected.Caption+'.m3u';
          if FileExists(FileName) then
          begin
//               SHF.Wnd := Application.Handle;
//               SHF.wFunc := FO_DELETE;
//               SHF.pFrom := PChar(FileName);
//               SHF.fFlags := FOF_SILENT or FOF_ALLOWUNDO;
//               ShFileOperation(SHF);
               DeleteFile(FileName);
          end;
     end;
     UpdateFavoritesListView;
end;

procedure TListForm.FavoritesListViewEdited(Sender: TObject;
  Item: TListItem; var S: String);
begin
//     if not FileExists(AppPath+'Favorites\'+S+'.m3u') then
//        RenameFile(AppPath+'Favorites\'+Item.Caption+'.m3u', AppPath+'Favorites\'+S+'.m3u')
//     else
//         Item.CancelEdit;
end;

procedure TListForm.EditButtonClick(Sender: TObject);
var
   FileName : string;
begin
     if FavoritesListView.Selected <> nil then
     begin
          FileName := AppPath+'Favorites\'+FavoritesListView.Selected.Caption+'.m3u';
          ShellExecute(0, nil, PChar('NotePad.Exe '), PChar(FileName), nil, SW_SHOWNORMAL);
     end;
end;

procedure TListForm.FavoritesListViewDblClick(Sender: TObject);
begin
     EditButtonClick(Self);
end;

procedure TListForm.FavoritesListViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if Key = VK_DELETE then DeleteButtonClick(self);
     if Key = VK_RETURN then EditButtonClick(self);
end;

procedure TListForm.tbSetupClick(Sender: TObject);
begin
     SetupForm.PreferencePageControl.ActivePage := SetupForm.SetupTabSheet;
     SetupForm.ShowModal;
end;

end.
