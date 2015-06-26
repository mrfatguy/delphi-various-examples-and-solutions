{*********************************************************}
{                                                         }
{    Calmira System Library 1.0                           }
{    by Li-Hsin Huang,                                    }
{    released into the public domain January 1997         }
{                                                         }
{*********************************************************}

unit Files;

{ Medium level file utilities }

interface

uses Classes, WinTypes, SysUtils;

type
  TDirInfo = record
    files : Integer;
    dirs  : Integer;
    size  : Longint;
  end;

  TDropInfo = record
    files : TStringList;
    posn  : TPoint;
  end;

  EFileIOError = class(Exception);

  EFileMoveError = class(EFileIOError);
  EInsufficientSpace = class(EFileIOError);

  EFileNotFound = class(EFileIOError);
  EPathNotFound = class(EFileIOError);
  EAccessDenied = class(EFileIOError);

  EReadAccessDenied = class(EAccessDenied);
  EWriteAccessDenied = class(EAccessDenied);

  EReadFileNotFound = class(EFileNotFound);
  EWriteFileNotFound = class(EFileNotFound);

  EReadPathNotFound = class(EPathNotFound);
  EWritePathNotFound = class(EPathNotFound);


procedure FindFiles(const FileSpec : TFilename; attrib : Word; List: TStrings);
{ Executes a FindFirst/FindNext loop using the given file specifications.
  The search results are added to the strings object }

function DirInfo(const Dirname: TFilename; Subs : Boolean) : TDirInfo;
{ Returns a record giving information about the specified directory.
  If Subs is True, this information includes details taken from
  subdirectories. }

function FFileExists(const Filename: TFilename): Boolean;
function FFileCreate(const Filename: TFilename): Integer;
function FFileOpen(const Filename: TFilename; mode: word): Integer;
function FDirectoryExists(const Filename: TFilename): Boolean;
{ These functions perform the same tasks as those without the
  F prefix but raise an EPathNotFound exception if the parent
  directory doesn't exist.  Typically, this catches situations when a
  floppy disk is not in the drive }

function HDirectoryExists(const Filename: TFilename): Boolean;
{ Same as DirectoryExists in FileCtrl except that hidden ones are detected }

function FCopyFile(const Filename, Destname : TFilename): Longint;
{ Copies any file while preserving the attributes and DOS timestamp.
  If there is not enough room on the destination disk, EInsufficientSpace
  is raised and if the destination has been created then it is deleted. }

procedure FMoveFile(const Filename, Destname : TFilename);
{ Moves a file, first by attempting a rename (which is fast), and
  then by copying the file and deleting the original }

function ExecuteFile(const FileName, Params, DefaultDir: string;
  Op: PChar; ShowCmd: Word): THandle;
{ Encapsulates the API ShellExecute function using Pascal strings }

function RandomFilename(const path, prefix, ext: TFilename): TFilename;
{ Generates a random filename in the given path (you must add
  a trailing backslash), which does not already exist.  The prefix
  can be up to 4 characters and the extension is optional.

  For example, RandomFilename('c:\temp\', 'abcd', 'txt') will
  return filenames like 'abcd4723.txt' }

function IsAncestorDir(const parent, child: TFilename): Boolean;
{ Returns True if the first parameter is an an ancestor directory
  of the second parameter.  This function just analyses the strings,
  and doesn't check the disk. }

function IsValidFilename(const s: TFilename): Boolean;
{ Returns True if the string is a valid 8.3 character MS-DOS filename }

function WildcardMatch(const filename, wildcard: string): Boolean;
{ Returns True if the filename is specified by the wildcard }

function ShowCmdsEx(n : Integer): Word;
{ Converts and integer into a ShowWindow command.  Returns SW_SHOWMINNOACTIVE
  if the parameter is 1, SW_SHOWMAXIMIZED if the parameter is 2, and
  SW_SHOWNORMAL otherwise.  Use it with ExecuteFile and similar commands }

function QualifiedFilename(const s: TFilename) : TFilename;

const
  { Use this to convert a "ShowMinimized" variable into a command }
  ShowCmds : array[Boolean] of Word = (SW_SHOWNORMAL, SW_SHOWMINNOACTIVE);

  BackgroundProc : procedure = nil;

implementation

uses ShellAPI;


procedure FindFiles(const Filespec : TFilename; attrib : Word; List : TStrings);
var
  rec : TSearchRec;
  code : Integer;
begin
  code := FindFirst(Filespec, attrib, rec);
  while code = 0 do begin
    List.Add(rec.name);
    code := FindNext(rec);
  end;
end;



function FFileCreate(const Filename: TFilename): Integer;
var s: string;
begin
  Result := FileCreate(Filename);
  if Result < 0 then begin
    s := 'Cannot create ' + Filename;
    case Result of
    -5 : raise EWriteAccessDenied.Create('Access denied. ' + s);
    -3 : raise EWritePathNotFound.Create('Path not found. ' + s);
    else raise EFCreateError.Create(s);
    end;
  end;
end;


function FFileOpen(const Filename: TFilename; mode: word): Integer;
var s: string;
begin
  Result := FileOpen(Filename, mode);
  if Result < 0 then begin
    s := 'Cannot open ' + Filename;
    case Result of
    -5 : raise EReadAccessDenied.Create('Access denied. ' + s);
    -3 : raise EReadPathNotFound.Create('Path not found. ' + s);
    -2 : raise EReadFileNotFound.Create('File not found. ' + s);
    else raise EFOpenError.Create(s);
    end;
  end;
end;


function FFileExists(const Filename: TFilename): Boolean;
var
  rec: TSearchRec;
  code: Integer;
begin
  code := FindFirst(Filename,
    faAnyFile and not (faVolumeID or faDirectory), rec);

  if code = -3 then
    raise EPathNotFound.CreateFmt('Path %s not found.', [ExtractFilePath(Filename)])
  else
    Result := code = 0;
end;


function FDirectoryExists(const Filename: TFilename): Boolean;
var
  rec: TSearchRec;
  code: Integer;
begin
  code := FindFirst(Filename,
    faDirectory or faHidden or faSysFile or faReadOnly, rec);

  if code = -3 then
    raise EPathNotFound.CreateFmt('Path %s not found.', [ExtractFilePath(Filename)])
  else
    Result := code = 0;
end;


function HDirectoryExists(const Filename: TFilename): Boolean;
var rec : TSearchRec;
begin
  Result := FindFirst(Filename,
    faDirectory or faHidden or faSysFile or faReadOnly, rec) = 0;
end;


function FCopyFile(const Filename, Destname : TFilename): Longint;
const CopyBufSize : Word = 8192;
var
  source, dest, attr: Integer;
  Bytes, TimeStamp: Longint;
  success : Boolean;
  CopyBuf : Pointer;
begin
  Result := 0;
  attr := FileGetAttr(Filename);

  source := FFileOpen(Filename, fmShareDenyWrite);
  try
    success := False;
    TimeStamp := FileGetDate(source);
    dest   := FFileCreate(Destname);
    try
      Getmem(CopyBuf, CopyBufSize);
      try
        repeat
          Bytes := FileRead(Source, CopyBuf^, CopyBufSize);
          Inc(Result, Bytes);
          if (Bytes > 0) and (FileWrite(Dest, CopyBuf^, Bytes) <> Bytes) then
            raise EInsufficientSpace.CreateFmt(
              'Insufficient disk space to copy %s to %s', [Filename, Destname]);
          if Assigned(BackgroundProc) then BackgroundProc;
        until Bytes < CopyBufSize;
        success := True;
      finally
        Freemem(CopyBuf, CopyBufSize);
      end;
    finally
      if Success then begin
        FileSetDate(dest, TimeStamp);
        if attr <> faArchive then FileSetAttr(Destname, attr);
      end;
      FileClose(dest);
      if not Success then DeleteFile(Destname);
    end;
  finally
    FileClose(source);
  end;
end;



procedure FMoveFile(const Filename, Destname : TFilename);
begin
  if not RenameFile(FileName, Destname) then
  begin
    if FileGetAttr(FileName) and faReadOnly = faReadOnly then
      raise EFileMoveError.Create('Cannot move ' + FileName);
    FCopyFile(FileName, Destname);
    if not DeleteFile(FileName) then begin
      FileSetAttr(Destname, 0);
      DeleteFile(Destname);
      raise EFileMoveError.Create('Cannot move ' + Filename);
    end;
  end;
end;



function ExecuteFile(const FileName, Params, DefaultDir: string;
  Op: PChar; ShowCmd: Word): THandle;
var
  zFileName, zParams, zDir: array[0..255] of Char;
begin
  Result := ShellExecute(0, Op,
    StrPCopy(zFileName, FileName), StrPCopy(zParams, Params),
    StrPCopy(zDir, DefaultDir), ShowCmd);
end;


function DirInfo(const Dirname: TFilename; Subs : Boolean) : TDirInfo;
var
  rec : TSearchRec;
  code : Integer;
begin
  Result.files := 0;
  Result.dirs := 0;
  Result.size := 0;

  code := FindFirst(Dirname + '\*.*', faAnyfile and not faVolumeID, rec);
  while code = 0 do begin
    Inc(Result.size, rec.size);
    if rec.attr and faDirectory <> 0 then begin
      if rec.name[1] <> '.' then begin
        Inc(Result.dirs);
        if Subs then with DirInfo(Dirname + '\' + rec.name, true) do begin
          Inc(Result.files, files);
          Inc(Result.dirs, dirs);
          Inc(Result.size, size);
        end;
      end
    end
    else Inc(Result.files);
    code := FindNext(rec);
  end;
end;


function RandomFilename(const path, prefix, ext: TFilename): TFilename;
var
  i: Integer;
begin
  i := Random(10000);
  repeat
    Inc(i);
    Result := Format('%s%.4s%d%s', [path, prefix, i, ext]);
  until not FileExists(Result);
end;


function IsAncestorDir(const parent, child: TFilename): Boolean;
begin
  if (child[0] <= parent[0]) or (child[1] <> parent[1]) then
    Result := False
  else
    Result := (parent[0] = #3) or (Pos(parent + '\', child) = 1);
end;



function IsValidFilename(const s: TFilename): Boolean;
var
  i : Integer;
  seendot : Boolean;
begin
  i := 1;
  Result := Length(s) <= 12;
  seendot := False;
  while (i <= Length(s)) and Result do begin
    if s[i] = '.' then begin
      Result := not seendot and (i <= 9) and (Length(s) - i <= 3);
      seendot := True;
    end
    else
      Result := not (s[i] in ['"', '/', '\', ':', ';', '|', '=', ',']);
    Inc(i);
  end;
  Result := Result and (seendot or (Length(s) <= 8));
end;


function ShowCmdsEx(n : Integer): Word;
begin
  if n = 1 then Result := SW_SHOWMINNOACTIVE
  else if n = 2 then Result := SW_SHOWMAXIMIZED
  else Result := SW_SHOWNORMAL;
end;

function QualifiedFilename(const s: TFilename) : TFilename;
begin
  Result := s;
  if ExtractFileExt(Result) = '' then AppendStr(Result, '.');
end;

function WildcardMatch(const filename, wildcard: string): Boolean;
var i, j: Integer;
begin
  i := 1;
  j := 1;
  while (i <= Length(filename)) and (j <= Length(wildcard)) and Result do begin
    case wildcard[j] of
      '?' : begin
              Result := filename[i] <> '.';
              Inc(i);
              Inc(j);
            end;
      '*' : begin
              while (i <= Length(filename)) and (filename[i] <> '.') do
                Inc(i);
              Inc(j);
            end;
      else begin
        Result := filename[i] = wildcard[j];
        Inc(i);
        Inc(j);
      end;
    end;
  end;
  Result := Result and (i = Length(filename) + 1) and (j = Length(wildcard) + 1);
end;

end.
