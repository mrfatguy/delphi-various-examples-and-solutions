{**************************************************************************}
{                                                                          }
{    Calmira shell for Microsoft® Windows(TM) 3.1                          }
{    Source Release 1.0                                                    }
{    Copyright (C) 1997  Li-Hsin Huang                                     }
{                                                                          }
{    This program is free software; you can redistribute it and/or modify  }
{    it under the terms of the GNU General Public License as published by  }
{    the Free Software Foundation; either version 2 of the License, or     }
{    (at your option) any later version.                                   }
{                                                                          }
{    This program is distributed in the hope that it will be useful,       }
{    but WITHOUT ANY WARRANTY; without even the implied warranty of        }
{    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         }
{    GNU General Public License for more details.                          }
{                                                                          }
{    You should have received a copy of the GNU General Public License     }
{    along with this program; if not, write to the Free Software           }
{    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.             }
{                                                                          }
{**************************************************************************}

unit Resource;

interface

uses Graphics, Classes, FileCtrl, ObjList, Strings;

type
  { Icons, cursors and some bitmaps are handled by this module.

    TIconList manages a large number of icons extracted from
    different files.  By keeping track of where each icon comes from,
    it ensures that a particular icon is only loaded once, thus saving
    memory and disk accesses.  Icons are loaded only when they are
    required.

    The icon cache is only maintained for "document" files, because they
    are likely to appear often.  Keeping icons for programs would just
    waste memory because they are only used once or twice.

    The icon list is a string list, with each string associated with an
    icon object, which may be nil. For example,

    bmp   [an icon ]
    txt   [  nil   ]
    bat   [  nil   ]

    ExtensionMap holds a list of file extensions and where the
    representative icon is stored.  For example

    bmp=c:\windows\pbrush.exe(0)
    txt=c:\windows\notepad.exe
    bat=c:\windows\notepad.exe

    FileMap holds a list of filenames, and the objects array holds
    icon objects, which can also be nil.

    c:\windows\pbrush.exe(0)  [ an icon ]
    c:\windows\notepad.exe(0) [   nil   ]


    When Get() is called, the icon list searches itself for a matching
    key.  If it finds a match plus an icon, the icon is returned, making
    the access fast.  If it finds a match but a nil pointer, the search
    extends to ExtensionMap.

    With the data above, Get('bat') will find NIL, so it looks at the
    extensions and finds the reference to Notepad.  Looking through FileMap
    shows that no icon is available for Notepad, so it must be extracted.
    The two nils encountered are overwritten with the TIcon object.

    Now consider Get('txt').  The icon list still has no icon but now,
    FileMap has an icon entry for notepad.exe, so the icon object is
    returned and the main list updated.  The next search for 'txt' will
    find an icon immediately.
  }


  TIconlist = class(TUniqueStrings)
  private
    ExtensionMap, FileMap : TStringList;
    Store : TObjectList;
    function GetDriveIcon(dtype: TDriveType) : TIcon;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddIcon(const s: string; Icon: TIcon);
    procedure DelayLoad(const key: string; filename: string);
    function Get(const s: string): TIcon;
    property Drive[dtype: TDriveType] : TIcon read GetDriveIcon;
  end;

  TResBitmap = class(TBitmap)
  private
    ResID : PChar;
    ExternalFile : PString;
  public
    constructor Load(BitmapName : PChar);
    constructor AlternateLoad(BitmapName : PChar; const Filename: string);
    procedure Reload;
  end;

const
  crDropFile      = -20;
  crDropCopy      = -21;
  crDropMulti     = -22;
  crDropMultiCopy = -23;
  crFinger        = -24;
  crFlutter       = -25;
  crBusyPointer   = -26;


var
  Icons: TIconList;
  FolderIcon  : TIcon;
  FileIcon    : TIcon;
  LetterIcon  : TIcon;
  WindowsIcon : TIcon;
  DOSIcon     : TIcon;
  TinyFile    : TIcon;
  TinyFolder  : TIcon;
  TinyProg    : TIcon;

  Sizebox    : TResBitmap;
  ShortArrow : TResBitmap;
  AliasArrow : TResBitmap;


procedure LoadResources;

implementation

{$R ICONS.RES}
{$R BITMAPS.RES}
{$R CURSORS.RES}

uses SysUtils, WinProcs, ShellAPI, IniFiles, Forms, Controls,
  Files, MiscUtil, Drives, WinTypes, Settings, Environs;

{ TIconList }

constructor TIconList.Create;
begin
  inherited Create;
  Store := TObjectList.Create;
  ExtensionMap := TUniqueStrings.Create;
  FileMap := TUniqueStrings.Create;
end;


destructor TIconList.Destroy;
begin
  Store.Free;
  ExtensionMap.Free;
  FileMap.Free;
  inherited Destroy;
end;


procedure TIconList.AddIcon(const s: string; Icon: TIcon);
begin
  AddObject(s, Icon);
  Store.Add(Icon);
end;


procedure TIconList.DelayLoad(const key: string; filename: string);
begin
  Add(key);
  if ExtensionMap.Values[key] = '' then begin
    filename := EnvironSubst(filename);
    ExtensionMap.Add(Format('%s=%s', [key, filename]));
    FileMap.Add(filename);
  end;
end;


function TIconList.Get(const s: string): TIcon;
var
  i, j, index: Integer;
  h : HIcon;
  filename : TFilename;
begin
  i := IndexOf(s);

  if i <> -1 then begin
    Result := TIcon(Objects[i]);

    if Result = nil then begin
      { no icon in main list }
      j := FileMap.IndexOf(ExtensionMap.Values[s]);

      if j = -1 then
        { shouldn't really happen! }
        j := FileMap.Add(ExtensionMap.Values[s]);

      if FileMap.Objects[j] = nil then begin
        { try to extract icon }
        filename := '';
        index := 0;
        Unformat(FileMap[j], '%s(%d', [@filename, 79, @index]);
        h := ExtractIcon(HInstance, StringAsPChar(filename), index);

        if h > 1 then begin
          { a new icon has been found }
          Result := TIcon.Create;
          Result.Handle := h;
          Store.Add(Result);
          FileMap.Objects[j] := Result;
          Objects[i] := Result
        end
        else begin
          { the file doesn't contain an icon so assign default }
          Result := LetterIcon;
          FileMap.Objects[j] := LetterIcon;
          Objects[i] := LetterIcon;
        end;
      end
      else begin
        { Found an icon in FileMap }
        Result := TIcon(FileMap.Objects[j]);
        Objects[i] := Result;
      end;
    end
  end
  else Result := FileIcon;
end;


function TIconList.GetDriveIcon(dtype : TDriveType) : TIcon;
const
  DriveIdents : array[TDriveType] of string[15] =
   ('HardDrive', 'HardDrive', 'FloppyDrive', 'HardDrive',
    'NetworkDrive', 'CDROMDrive', 'RamDrive');
begin
  Result := Get(DriveIdents[dtype]);
end;


{ TResBitmap }

constructor TResBitmap.Load(BitmapName : PChar);
begin
  inherited Create;
  ResID := BitmapName;
  ExternalFile := NullStr;
  Reload;
end;

constructor TResBitmap.AlternateLoad(BitmapName : PChar; const Filename: string);
begin
  inherited Create;
  ResID := BitmapName;
  AssignStr(ExternalFile, Filename);
  Reload;
end;

procedure TResBitmap.ReLoad;
begin
  if (ExternalFile^ > '') and FileExists(ExternalFile^) then
    LoadFromFile(ExternalFile^)
  else
    Handle := LoadBitmap(HInstance, ResID);
end;


function LoadSystemIcon(const key, alt: string; ResID: PChar): TIcon;
begin
  Result := TIcon.Create;

  if Icons.IndexOf(alt) > -1 then
    Result.Assign(Icons.Get(alt))
  else
    Result.Handle := LoadIcon(HInstance, ResID);

  Icons.AddIcon(key, Result);
end;


function LoadProgmanIcon(const key, alt: string; index: Integer): TIcon;
var buf: array[0..79] of Char;
begin
  Result := TIcon.Create;

  if Icons.IndexOf(alt) > -1 then
    Result.Assign(Icons.Get(alt))
  else
    Result.Handle := ExtractIcon(HInstance,
      StrPCopy(buf, WinPath + 'progman.exe'), index);

  Icons.AddIcon(key, Result);
end;


procedure LoadSystemIcons;
begin
  FolderIcon  := LoadSystemIcon('Folder', '_folder', 'FOLDERICON');
  FileIcon    := LoadSystemIcon('File', '_file', 'FILEICON');
  LetterIcon  := LoadSystemIcon('Letter', '_doc', 'LETTERICON');
  TinyFile    := LoadSystemIcon('TinyFile', '_tfile', 'TINYFILEICON');
  TinyProg    := LoadSystemIcon('TinyProg', '_tprog', 'TINYPROGICON');
  TinyFolder  := LoadSystemIcon('TinyFolder', '_tfolder', 'TINYFOLDERICON');

  DOSIcon     := LoadProgmanIcon('MSDOS', '_msdos', 1);
  WindowsIcon := LoadProgmanIcon('Windows', '_windows', 8);

  LoadSystemIcon('MultiFile', '_multi', 'MULTIFILEICON');
  LoadSystemIcon('HardDrive', '_hard', 'HARDICON');
  LoadSystemIcon('FloppyDrive', '_floppy', 'FLOPPYICON');
  LoadSystemIcon('CDROMDrive', '_cdrom', 'CDROMICON');
  LoadSystemIcon('NetworkDrive', '_network', 'NETWORKICON');
  LoadSystemIcon('RamDrive', '_ramdisk', 'RAMDISKICON');
  LoadSystemIcon('EmptyBin', '_emptbin', 'BINICON');
  LoadSystemIcon('FullBin', '_fullbin', 'FULLBINICON');
  LoadSystemIcon('System', '_system', 'SYSTEMICON');
  LoadSystemIcon('Explorer', '_explore', 'EXPLORERICON');
  LoadSystemIcon('FindDialog', '_finddlg', 'FINDDLGICON');
  LoadSystemIcon('RunDialog', '_rundlg', 'RUNDLGICON');
end;


procedure LoadUserIcons;
var
  key : string[31];
  temp : TStringList;
  i : Integer;
  path, filename : TFilename;
begin
  temp := TStringList.Create;
  try
    { Find all *.ICO files in the home directory (or directory specified in
      the UserIcons value).  Discard their file extensions and add the
      filenames to the internal lists }

    path := ini.ReadString('File System', 'UserIcons', ApplicationPath);
    if path = '' then path := ApplicationPath;
    path := MakePath(path);

    FindFiles(path + '*.ico', faArchive or faReadOnly, temp);

    for i := 0 to temp.Count-1 do begin
      Unformat(Lowercase(temp[i]), '%s.', [@key, 31]);
      Icons.DelayLoad(key, Format('%s%s(0)', [path, temp[i]]));
    end;

    { Add all entries from the [Icons] section }
    temp.Clear;
    ini.ReadSectionValues('Icons', temp);
    for i := 0 to temp.Count-1 do begin
      Unformat(Lowercase(temp[i]), '%s=%s', [@key, 31, @filename, 79]);
      Icons.DelayLoad(key, filename);
    end;
  finally
    temp.Free;
  end;
end;


procedure LoadRegisteredIcons;
var
  ext : string[15];
  win : TIniFile;
  progname : TFilename;
  i : Integer;
  temp : TStringList;
begin
  { Read [Extensions] section from WIN.INI }

  temp := TStringList.Create;
  try
    temp.Clear;
    win := TIniFile.Create('WIN.INI');
    win.ReadSectionValues('Extensions', temp);
    win.Free;

    for i := 0 to temp.Count-1 do begin
      Unformat(Lowercase(temp[i]), '%s=%s ', [@ext, 15, @progname, 79]);
      if ExtractFilePath(progname) = '' then progname := WinPath + progname;
      Icons.DelayLoad(ext, progname + '(0)');
    end;
  finally
    temp.Free;
  end;
end;


procedure LoadCursors;
begin
  with Screen do begin
    Cursors[crDropFile]      := LoadCursor(HInstance, 'DROPFILE');
    Cursors[crDropMulti]     := LoadCursor(HInstance, 'DROPMULTIFILE');
    Cursors[crDropCopy]      := LoadCursor(HInstance, 'DROPFILECOPY');
    Cursors[crDropMultiCopy] := LoadCursor(HInstance, 'DROPMULTIFILECOPY');
    Cursors[crFinger]        := LoadCursor(HInstance, 'FINGERPRESS');
    Cursors[crFlutter]       := LoadCursor(HInstance, 'FILEFLUTTER');
    Cursors[crNoDrop]        := LoadCursor(HInstance, 'DRAGFILE');
    Cursors[crBusyPointer]   := LoadCursor(HInstance, 'BUSYPOINTER');
  end;
end;


procedure LoadResources;
begin
  LoadUserIcons;
  LoadSystemIcons;
  LoadRegisteredIcons;
  LoadCursors;
end;


procedure InitResources;
begin
  Icons := TIconList.Create;
  SizeBox := TResBitmap.Load('SIZEBOX');
  ShortArrow := TResBitmap.Load('SHORTARROW');
  AliasArrow := TResBitmap.Load('SHORTARROW');
end;

procedure DoneResources; far;
begin
  Icons.Free;
  Sizebox.Free;
  ShortArrow.Free;
  AliasArrow.Free;
end;


initialization
  InitResources;
  AddExitProc(DoneResources);
end.
