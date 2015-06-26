unit pasStructureStore;
{*
 * StructuredStore - this unit introduce a new class
 * TStructureStorage. Adding it to your project will allow
 * you to store many data types. This could be a single
 * variable like String, Integer, Boolean to any data type
 * you can save to a TStream or store on hard disk.
 * The most advantage of this solution, is that all this
 * stuff will be stored in one file plus compression (You
 * have to provide zlib.pas form ZLib package by yourself)
 * and simple encryption.
 * See for yourself - the best way to figure out many
 * possibilites introduced here, is to test it...
 *
 * This unit is distributed as freeware.
 * Author allows any modifications to this component as long
 * as this copyright notice will be included (with updated
 * Version History) and when you send modified version to
 * address shown below...
 *
 * Version 1.00 by Eric Walmsley (eric@kestrelsoftware.co.uk)
 * Version 1.01 by Tomasz Trejderowski (trejderowski@qs.pl)
 *
 * Version History:
 *
 * 1.00 - November 25, 2001:  Initial release
 * 1.01 - December 3, 2001:  Some minor enchancements
 *
 **********************************************************************
 *
 * This program is distributed in the hope that it will be
 * useful, but WITHOUT ANY WARRANTY; without even the implied
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
 * PURPOSE.
 *
 **********************************************************************
 *}
interface

uses
  ActiveX, SysUtils, Windows, ZLib, Classes, ComObj, axctrls,
  INIFiles;

type
  TStructuredStorage = class
  private
    destructor Destroy; override;
  public
    hr: HResult;
    StorageFile: IStorage;
    constructor Create; virtual;
    procedure CreateStorageFile(const FileName: string);
    procedure OpenStorageFile(const FileName: string; AllowWrite: Boolean);
    procedure AddItem(Item: String; AnItem: TMemoryStream);
    procedure DeleteItem(Item: String);
    procedure PackFile(NewFile : TFileName);
    procedure CloseStorageFile;
    procedure SaveToFile(FileName: TFilename; Stream: TMemoryStream);
    procedure WriteString(Name, Value: String);
    procedure WriteInteger(Name: String; Value: Integer);
    procedure WriteBoolean(Name: String; Value: Boolean);
    function GetItem(Item: String): TMemoryStream;
    function LoadFromFile(FileName: TFilename): TMemoryStream;
    function ReadString(Name: String): String;
    function ReadInteger(Name: String): Integer;
    function ReadBoolean(Name: String): Boolean;
    function CheckIfExist(Item: String): Boolean;
end;

implementation

constructor TStructuredStorage.Create;
begin
  inherited Create;
  StorageFile := nil;
end;

procedure TStructuredStorage.CreateStorageFile(const FileName: string);
begin
  OLECheck(StgCreateDocFile(PWideChar(WideString(FileName)), STGM_CREATE or STGM_DIRECT or STGM_READWRITE or STGM_SHARE_EXCLUSIVE, 0, StorageFile));
end;

destructor TStructuredStorage.Destroy;
begin
  inherited;
end;

procedure TStructuredStorage.OpenStorageFile(const FileName: string; AllowWrite: Boolean);
begin
        if AllowWrite then
                OLECheck(StgOpenStorage(PWideChar(WideString(FileName)), nil, STGM_DIRECT or STGM_READWRITE or STGM_SHARE_EXCLUSIVE, nil, LongInt(nil), StorageFile))
        else
                OLECheck(StgOpenStorage(PWideChar(WideString(FileName)), nil, STGM_DIRECT or STGM_READ or STGM_SHARE_EXCLUSIVE, nil, LongInt(nil), StorageFile));
end;

function TStructuredStorage.GetItem(Item: String): TMemoryStream;
var
   ms    : TMemoryStream;
   n     : WideString;
   stm   : IStream;
   os    : TOleStream;
   p     : pointer;
   Size  : integer;
begin
   ms := TMemoryStream.Create;
   n := Item;
   OLECheck(StorageFile.OpenStream(PWideChar(n), nil, STGM_DIRECT or STGM_READ or STGM_SHARE_EXCLUSIVE, 0, stm));
   os := TOleStream.Create(stm);
   ms.LoadFromStream(os);
   DecompressBuf(ms.Memory, ms.Size, 0, p, Size);
   ms.Size := 0;
   ms.Write(p^, Size);
   ms.Position := 0;
   FreeMem(p);
   os.Free;
   Result := ms;
end;

function TStructuredStorage.CheckIfExist(Item: String): Boolean;
var
   n     : WideString;
   stm   : IStream;
begin
   n := Item;
   Result:=True;
   try
        OLECheck(StorageFile.OpenStream(PWideChar(n), nil, STGM_DIRECT or STGM_READ or STGM_SHARE_EXCLUSIVE, 0, stm));
   except
        on EOleSysError do Result:=False;
   end;
end;

procedure TStructuredStorage.AddItem(Item: String; AnItem: TMemoryStream);
var
   n     : WideString;
   stm   : IStream;
   os    : TOleStream;
   p     : pointer;
   Size  : integer;
begin
      n := Item;
      OleCheck(StorageFile.CreateStream(PWideChar(n), STGM_CREATE or STGM_DIRECT or STGM_READWRITE or STGM_SHARE_EXCLUSIVE, 0, 0, stm));
      CompressBuf(AnItem.Memory, AnItem.Size, p, Size);
      os := TOleStream.Create(stm);
      os.Write(p^, Size);
      FreeMem(p);
      os.Free;
end;

procedure TStructuredStorage.DeleteItem(Item: String);
var
   n  : WideString;
begin
   n := Item;
   StorageFile.DestroyElement(PWideChar(n));
end;

procedure TStructuredStorage.PackFile(NewFile : TFileName);
var
   n : WideString;
   s : IStorage;
begin
      try
         n := NewFile;
         StgCreateDocfile(PWideChar(n), STGM_CREATE or STGM_DIRECT or STGM_READWRITE or STGM_SHARE_EXCLUSIVE, 0, s);
         OleCheck(StorageFile.CopyTo(0, nil, nil, s));
         s := nil;
      finally
      end;
end;

procedure TStructuredStorage.CloseStorageFile;
begin
  StorageFile := nil;
end;

procedure TStructuredStorage.WriteString(Name, Value: String);
var
        ms: TMemoryStream;
        Len: Integer;
begin
        ms:=TMemoryStream.Create;
        Len:=Length(Value);
        ms.Write(Len,SizeOf(Len));
        ms.Write(PChar(Value)^,Len);
        AddItem(Name,ms);
        ms.Free;
end;

function TStructuredStorage.ReadString(Name: String): String;
var
        ms: TMemoryStream;
        Len: Integer;
        Val: String;
begin
        ms:=TMemoryStream.Create;
        ms:=GetItem(Name);
        ms.Read(Len,SizeOf(Len));
        SetLength(Val, Len);
        ms.Read(PChar(Val)^,Len);
        Result:=Val;
        ms.Free;
end;

procedure TStructuredStorage.WriteInteger(Name: String; Value: Integer);
var
        ms: TMemoryStream;
begin
        ms:=TMemoryStream.Create;
        ms.Write(Value,SizeOf(Value));
        AddItem(Name,ms);
        ms.Free;
end;

function TStructuredStorage.ReadInteger(Name: String): Integer;
var
        ms: TMemoryStream;
        Val: Integer;
begin
        ms:=TMemoryStream.Create;
        ms:=GetItem(Name);
        ms.Read(Val,SizeOf(Val));
        Result:=Val;
        ms.Free;
end;

procedure TStructuredStorage.WriteBoolean(Name: String; Value: Boolean);
begin
        if Value=True then WriteInteger(Name,0) else WriteInteger(Name,-1);
end;

function TStructuredStorage.ReadBoolean(Name: String): Boolean;
var
        Val: Integer;
begin
        Val:=ReadInteger(Name);
        if Val=0 then Result:=True else Result:=False;
end;

function TStructuredStorage.LoadFromFile(FileName: TFilename): TMemoryStream;
var
  fs: TFileStream;
  ms: TMemoryStream;
begin
  fs := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  ms:=TMemoryStream.Create;
  ms.CopyFrom(fs, 0);
  Result:=ms;
end;

procedure TStructuredStorage.SaveToFile(FileName: TFilename; Stream: TMemoryStream);
var
        fs: TFileStream;
begin
        fs := TFileStream.Create(FileName, fmCreate or fmShareDenyWrite);
        fs.CopyFrom(Stream, 0);
        fs.Free;
end;

end.
