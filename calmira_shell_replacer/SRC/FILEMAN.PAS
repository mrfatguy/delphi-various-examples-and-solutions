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

unit FileMan;

{ FileMan contains the main file management engine used for processing
  files and directories.  It provides high-level operations which can
  be used easily from other units, while allowing full user interaction
  and error handling.

  Application.ProcessMessages is called frequently so that the progress
  bar can be updated and the user can press the Cancel button.

  Almost all of Calmira's filename strings are stored and processed
  as lower case to be consistent, especially useful because there is no
  case insensitive Pos() function.  Also, all filenames should be fully
  qualified to avoid ambiguities.
}

interface

uses Classes, SysUtils, Dialogs;

type
  EFileOpError = class(Exception);

const
  faProtected = faReadOnly or faHidden or faSysFile;
  faFileDir   = faAnyFile and not faVolumeID;

function CopyFile(const Filename, Destname : TFilename): Boolean;
function MoveFile(const Filename, Destname : TFilename; attr: Integer): Boolean;
function CopyDirectory(const Dirname, Destname : TFilename): Boolean;
function MoveDirectory(const Dirname, Destname : TFilename): Boolean;
function DeleteDirectory(const Dirname: TFilename): Boolean;
function EraseFile(const Filename: string; attr: Integer): Boolean;
procedure CreateDirectory(const Dirname: TFilename);
procedure RemoveDirectory(const Dirname : TFilename);
procedure ProcessFiles(files: TStrings; const dest: TFilename);
procedure ExitDirectory(const Dirname : TFilename);

function DefaultExec(FileName, Params, DefaultDir: string;
  ShowCmd: Word): Integer;
{ Encapsulates ShellExecute.  If a filename with no associated
  program is encountered, the default viewer is used to open the file.  Also,
  DOS environment strings are inserted into each string before they are
  passed to Windows }


function ExtensionIn(const ext : TFileExt; const list: string): Boolean;
{ Searches a string containing file extensions separated by
  spaces.  It is case sensitive. }

procedure YesToAll;
procedure NoToAll;
procedure BackgroundProcess;

{ ExtensionIn searches a string containing file extensions separated by
  spaces.  It is case sensitive. }

var BytesTransferred : Longint;



implementation

uses Replace, Controls, FileCtrl, Progress, WinProcs, Settings, Debug,
 Forms, Desk, AskDrop, Files, Strings, MiscUtil, Drives, WinTypes, Environs;

var
  CopyAllFiles  : Boolean;
  MoveAllFiles  : Boolean;
  DelAllFiles   : Boolean;
  RepAllFiles   : Boolean;
  MoveAllProt   : Boolean;
  DelAllProt    : Boolean;
  CopyAllFolders: Boolean;
  MoveAllFolders: Boolean;
  DelAllFolders : Boolean;


procedure NoToAll;
begin
  CopyAllFiles  := False;
  MoveAllFiles  := False;
  DelAllFiles   := False;
  RepAllFiles   := False;
  MoveAllProt   := False;
  DelAllProt    := False;
  CopyAllFolders:= False;
  MoveAllFolders:= False;
  DelAllFolders := False;
end;

procedure YesToAll;
begin
  CopyAllFiles  := True;
  MoveAllFiles  := True;
  DelAllFiles   := True;
  RepAllFiles   := True;
  MoveAllProt   := True;
  DelAllProt    := True;
  CopyAllFolders:= True;
  MoveAllFolders:= True;
  DelAllFolders := True;
end;


function CanReplace(Filename, Destname: TFilename): Boolean;
begin
  { Returns True if the user specifies that the destination file
    (which must exist) can be replaced. }

  if ReplaceBox = nil then ReplaceBox := TReplaceBox.Create(Application);

  case ReplaceBox.Query(Filename, Destname) of
    mrYes   : Result := True;
    mrNo    : begin ProgressBox.UpdateGauge; Result := False; end;
    mrAll   : begin Result := True; RepAllFiles := True; end;
    mrCancel: Abort;
  end;
end;



function ProtectBox(const name, op: string): Word;
begin
  { Asks the user for confirmation before deleting or moving
    a protected file }

  Desktop.SetCursor(crDefault);
  try
    Result := MsgDialog(
     Format('%s is Read Only, Hidden or System.'#13'%s this file?', [name, op]),
       mtConfirmation, mbYesNoCancel + [mbAll], 0);
  finally
    Desktop.ReleaseCursor;
  end;
end;


function ConfirmSingleOperation(Ask: Boolean; var All: Boolean;
  const prompt, filename: string): Boolean;
begin
  Result := True;
  if Ask and not All then begin
    Desktop.SetCursor(crDefault);
    try
      case MsgDialog(Format('%s %s ?', [prompt, filename]),
       mtConfirmation, [mbYes, mbNo, mbAll, mbCancel], 0) of
        mrNo    : Result := False;
        mrAll   : All := True;
        mrCancel: Abort;
      end;
    finally
      Desktop.ReleaseCursor;
    end;
  end;
end;


function CopyFile(const Filename, Destname : TFilename): Boolean;
begin
  Result := False;
  ProgressBox.CheckForAbort;
  ProgressBox.Updatelabel(Filename, Destname);

  if not ConfirmSingleOperation(ConfirmCopyFile, CopyAllFiles,
    'Copy file', Filename) then Exit;

  if Filename = Destname then
    raise EFileOpError.CreateFmt('Cannot copy %s to itself', [Filename]);

  if ConfirmReplace and not RepAllFiles and FFileExists(Destname)
    and not CanReplace(Filename, Destname) then Exit;

  Application.ProcessMessages;
  try
    FCopyFile(Filename, Destname); { low-level copy in Files.pas }
    ProgressBox.UpdateGauge;
  except on EWriteAccessDenied do
    if FileSetAttr(Destname, 0) < 0 then { try removing protection bits }
      raise
    else begin
      FCopyFile(Filename, Destname);     { attempt the copy again }
      ProgressBox.UpdateGauge;
    end;
  end;
  Result := True;
end;


procedure CreateDirectory(const Dirname: TFilename);
begin
  try
    MkDir(Dirname);
  except on EInOutError do
    raise EFileOpError.CreateFmt('Cannot create folder %s', [Dirname])
  end;
end;


procedure CreateDirectoryMerge(const Dirname: TFilename);
begin
  { Similar to CreateDirectory, but used when copying or moving
    whole directory structures.  If the destination already exists,
    then the contents will be merged, in which case any window showing
    the destination must be refreshed afterwards }

  if not FDirectoryExists(Dirname) then CreateDirectory(Dirname)
  else Desktop.RefreshList.Add(Dirname);
end;


procedure ExitDirectory(const Dirname : TFilename);
const
  NewDir : string[3] = 'c:\';
var
  current : TFilename;
begin
  { If the current logged directory is somewhere inside Dirname,
    the directory is changed to the Windows directory.  This is required
    because directories cannot be deleted or renamed while they are logged }

  GetDir(DriveNumber(Dirname[1]), current);
  current := Lowercase(current);
  if (current = Dirname) or IsAncestorDir(Dirname, current) then begin
    NewDir[1] := Dirname[1];
    ChDir(NewDir);
    ChDir(MakeDirname(WinPath));
  end;
end;


procedure RemoveDirectory(const Dirname : TFilename);
begin
  { EInOutError is thrown away because the user may choose not to
    delete a specific file during a directory-delete, in which case
    the parent dir can't be removed.  We want to prevent the entire
    operation from being aborted due to this. }

  try
    ExitDirectory(Dirname);
    RmDir(Dirname);
  except
    on EInOutError do;
  end;
end;



function MoveFile(const Filename, Destname : TFilename; attr: Integer): Boolean;
begin
  Result := False;
  ProgressBox.CheckForAbort;
  ProgressBox.UpdateLabel(Filename, Destname);

  if not ConfirmSingleOperation(ConfirmMoveFile, MoveAllFiles,
    'Move file', Filename) then Exit;

  if Filename = Destname then
    raise EFileOpError.CreateFmt('Cannot move %s to itself', [Filename]);

  if attr < 0 then attr := FileGetAttr(Filename);

  { Check for read-only, hidden or system file }

  if (attr and faProtected > 0) and ConfirmProtect and not MoveAllProt then
    case ProtectBox(Filename, 'Move') of
      mrNo    : begin ProgressBox.UpdateGauge; exit; end;
      mrCancel: Abort;
      mrAll   : MoveAllProt := True;
    end;

  { If destination already exists, ask before replacing it.  If the
    user says "yes", try deleting it so that the move can be performed
    by a rename operation.  If the first delete fails, reset the attributes
    and try again }

  if FFileExists(Destname) then
    if not ConfirmReplace or RepAllFiles or CanReplace(Filename, Destname) then begin
      if not DeleteFile(Destname) then
        if (FileSetAttr(Destname, 0) < 0) or not DeleteFile(Destname) then
          raise EFileOpError.CreateFmt('Cannot replace %s', [Destname])
    end
    else Exit;

  Application.ProcessMessages;

  { Files on the same drive are moved using a rename.  Those on
    different drives are copied, and the original is deleted afterwards. }

  if (UpCase(Filename[1]) <> UpCase(Destname[1])) or
    not RenameFile(Filename, Destname) then begin

    FCopyFile(Filename, Destname);
    if (not DeleteFile(Filename)) and (attr and faReadOnly > 0) and
      ((FileSetAttr(Filename, 0) < 0) or not DeleteFile(Filename)) then
        raise EFileOpError.CreateFmt('Cannot move %s', [Filename]);
  end;

  ProgressBox.UpdateGauge;
  Result := True;
end;



function CopyDirectory(const Dirname, Destname : TFilename):Boolean;
var
  source, target: TFileName;
  code : Integer;
  rec : TSearchRec;
begin
  { CopyDirectory recursively scans a directory structure and recreates
    the contents elsewhere.  Both CreateDirectoryMerge and CopyFile will
    raise exceptions on error, which terminates this procedure.

    We must check that Destname is not the same as, or a subdirectory of
    Dirname, otherwise you will cause an infinite recursion, which XCOPY
    calls a cyclic copy :

    e.g. CopyDirectory('c:\windows', 'c:\windows\temp') }

  Result:= False;
  ProgressBox.CheckForAbort;

  if (Dirname = Destname) or IsAncestorDir(Dirname, Destname) then
    raise EFileOpError.Create('Cannot perform a cyclic copy');

  if not ConfirmSingleOperation(ConfirmCopyFolder, CopyAllFolders,
    'Copy folder', Dirname) then Exit;

  CreateDirectoryMerge(Destname);

  code := FindFirst(Dirname + '\*.*', faFileDir, rec);
  while code = 0 do begin
    if rec.name[1] <> '.' then begin
      rec.name := Lowercase(rec.name);
      source := Dirname + '\' + Lowercase(rec.name);
      target := Destname + '\' + Lowercase(rec.name);

      if rec.attr and faDirectory <> 0 then
        Result := CopyDirectory(source, target)
      else begin
        CopyFile(source, target);
        Inc(BytesTransferred, rec.size);
      end;
    end;
    code := FindNext(rec);
  end;
  Result := True;
end;


function MoveDirectory(const Dirname, Destname : TFilename): Boolean;
var
  source, target: TFilename;
  code : Integer;
  rec : TSearchRec;
begin
  { The structure of this is very similar to CopyDirectory, and the
    same rules about cyclic copying applies }

  Result := False;
  ProgressBox.CheckForAbort;

  if (Dirname = Destname) or IsAncestorDir(Dirname, Destname) then
    raise EFileOpError.Create('Cannot perform a cyclic move');

  if not ConfirmSingleOperation(ConfirmMoveFolder, MoveAllFolders,
    'Move folder', Dirname) then Exit;

  CreateDirectoryMerge(Destname);

  code := FindFirst(Dirname + '\*.*', faFileDir, rec);
  while code = 0 do begin
    if rec.name[1] <> '.' then begin
      source := Dirname + '\' + Lowercase(rec.name);
      target := Destname + '\' + Lowercase(rec.name);

      if rec.attr and faDirectory <> 0 then
        Result := MoveDirectory(source, target)
      else begin
        Result := MoveFile(source, target, rec.attr);
        Inc(BytesTransferred, rec.size);
      end;
    end;
    code := FindNext(rec);
  end;

  RemoveDirectory(Dirname);
  Result := True;
end;


function DeleteDirectory(const Dirname: TFilename): Boolean;
var
  target: TFilename;
  code  : Integer;
  rec   : TSearchRec;
begin
  Result := False;
  ProgressBox.CheckForAbort;

  if not ConfirmSingleOperation(ConfirmDelFolder, DelAllFolders,
    'Delete folder', Dirname) then Exit;

  code := FindFirst(Dirname + '\*.*', faFileDir, rec);
  while code = 0 do begin
    if rec.name[1] <> '.' then begin
      target := Dirname + '\' + Lowercase(rec.name);
      if rec.attr and faDirectory <> 0 then Result := DeleteDirectory(target)
      else EraseFile(target, rec.attr);
    end;
    code := FindNext(rec);
  end;

  RemoveDirectory(Dirname);
  Result := True;
end;



function EraseFile(const Filename: string; attr: Integer): Boolean;
begin
  Result := False;
  ProgressBox.CheckForAbort;

  if not ConfirmSingleOperation(ConfirmDelFile, DelAllFiles,
    'Delete file', Filename) then Exit;

  if attr = -1 then attr := FileGetAttr(Filename);

  if attr and faProtected <> 0 then
    if ConfirmProtect and not DelAllProt then
      case ProtectBox(Filename, 'Delete') of
        mrYes    : FileSetAttr(Filename, 0);
        mrNo     : begin
                     ProgressBox.UpdateGauge;
                     Exit;
                   end;
        mrCancel : Abort;
        mrAll    : begin
                     DelAllProt := True;
                     FileSetAttr(Filename, 0);
                   end;
      end
    else FileSetAttr(Filename, 0);

  if not DeleteFile(Filename) then
    raise EFileOpError.CreateFmt('Cannot delete %s', [Filename]);

  ProgressBox.UpdateGauge;
  Result := True;
end;


procedure ProcessFiles(files: TStrings; const dest: TFilename);
var
  i : Integer;
  CopyDroppedFiles: Boolean;
  destpath : TFilename;
begin
  { Mainly used to handle file drops from other programs.  A list of
    filenames will be copied or moved after asking the user, and all
    affected windows are refreshed.

    Note that file descriptions are NOT preserved. }

  i := 0;
  while i < files.Count do
    if not FileExists(files[i]) then files.Delete(i)
    else inc(i);

  if files.Count = 0 then
    raise EFileOpError.Create('No files found');

  destpath := MakePath(dest);

  try
    AskDropBox := TAskDropBox.Create(Application);
    case AskDropBox.ShowModal of
      mrOK : CopyDroppedFiles := True;
      mrYes: CopyDroppedFiles := False;
      mrCancel: Abort;
    end
  finally
    AskDropBox.Free;
    AskDropBox := nil;
  end;

  if CopyDroppedFiles then ProgressBox.Init(foCopy, files.Count)
  else ProgressBox.Init(foMove, files.Count);

  try
    NoToAll;
    for i := 0 to files.Count-1 do begin
      if CopyDroppedFiles then
        CopyFile(files[i], destpath + ExtractFilename(files[i]))
      else begin
        MoveFile(files[i], destpath + ExtractFilename(files[i]), -1);
        Desktop.RefreshList.Add(ExtractFileDir(files[i]));
      end;
    end;
    Desktop.RefreshList.Add(dest);
  finally
    ProgressBox.Hide;
    Desktop.RefreshNow;
    PlaySound(Sounds.Values['NotifyCompletion']);
  end;
end;


function DefaultExec(Filename, Params, DefaultDir: string;
  ShowCmd: Word): Integer;
begin
  { Substitute environment variables }
  Filename := EnvironSubst(Filename);
  Params := EnvironSubst(Params);
  DefaultDir := EnvironSubst(DefaultDir);

  Result := ExecuteFile(Filename, Params, DefaultDir, 'Open', ShowCmd);

  { ShellExecute sometimes return error code 2 (file not fount), for a
    file with no extension.  Code 31 means that no associated program
    exists. }

  if (Result = 31) or ((Result = 2) and FileExists(Filename)) then begin
    if DefaultProg > ''  then begin
      Result := ExecuteFile(EnvironSubst(DefaultProg), QualifiedFilename(Filename),
        DefaultDir, 'Open', SW_SHOWNORMAL);
      if Result <= 32 then ErrorMsg('Unable to run default viewer.')
    end
    else
      ErrorMsg('This file is not assocated with a program.  Use File Manager to '+
        'make an association, or specify a default file viewer to use.');
  end
  else if Result <= 32 then
    ErrorMsg('Unable to run program or view file.');
end;



function ExtensionIn(const ext : TFileExt; const list: string): Boolean;
var temp: string[5];
begin
  temp[0] := ext[0];
  Inc(temp[0], 2);
  temp[1] := ' ';
  temp[2] := ext[1];
  temp[3] := ext[2];
  temp[4] := ext[3];
  temp[Length(temp)] := ' ';
  Result := Pos(temp, list) > 0;
end;


procedure BackgroundProcess;
begin
  Application.ProcessMessages;
end;


end.
