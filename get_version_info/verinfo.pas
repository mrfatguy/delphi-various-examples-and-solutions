{
Copyright © 1998 by Delphi 4 Developer's Guide - Xavier Pacheco and Steve Teixeira
}

unit VerInfo;

interface

uses SysUtils, WinTypes, Dialogs, Classes;

type
  { define a generic exception class for version info, and an exception
    to indicate that no version info is available. }
  EVerInfoError   = class(Exception);
  ENoVerInfoError = class(Exception);
  eNoFixeVerInfo  = class(Exception);

  // define enum type representing different types of version info
  TVerInfoType =
    (viCompanyName,
     viFileDescription,
     viFileVersion,
     viInternalName,
     viLegalCopyright,
     viLegalTrademarks,
     viOriginalFilename,
     viProductName,
     viProductVersion,
     viComments);

const

  // define an array constant of strings representing the pre-defined
  // version information keys.
  VerNameArray: array[viCompanyName..viComments] of String[20] =
  ('CompanyName',
   'FileDescription',
   'FileVersion',
   'InternalName',
   'LegalCopyright',
   'LegalTrademarks',
   'OriginalFilename',
   'ProductName',
   'ProductVersion',
   'Comments');

type

  // Define the version info class
  TVerInfoRes = class
  private
    Handle            : DWord;
    Size              : Integer;
    RezBuffer         : String;
    TransTable        : PLongint;
    FixedFileInfoBuf  : PVSFixedFileInfo;
    FFileFlags        : TStringList;
    FFileName         : String;
    procedure FillFixedFileInfoBuf;
    procedure FillFileVersionInfo;
    procedure FillFileMaskInfo;
  protected
    function GetFileVersion   : String;
    function GetProductVersion: String;
    function GetFileOS        : String;
  public
    constructor Create(AFileName: String);
    destructor Destroy; override;
    function GetPreDefKeyString(AVerKind: TVerInfoType): String;
    function GetUserDefKeyString(AKey: String): String;
    property FileVersion    : String read GetFileVersion;
    property ProductVersion : String read GetProductVersion;
    property FileFlags      : TStringList read FFileFlags;
    property FileOS         : String read GetFileOS;
  end;

implementation

uses Windows;

const
  // strings that must be fed to VerQueryValue() function
  SFInfo                = '\StringFileInfo\';
  VerTranslation: PChar = '\VarFileInfo\Translation';
  FormatStr             = '%s%.4x%.4x\%s%s';


constructor TVerInfoRes.Create(AFileName: String);
begin
  FFileName := aFileName;
  FFileFlags := TStringList.Create;
  // Get the file version information
  FillFileVersionInfo;
  //Get the fixed file info
  FillFixedFileInfoBuf;
  // Get the file mask values
  FillFileMaskInfo;
end;


destructor TVerInfoRes.Destroy;
begin
  FFileFlags.Free;
end;

procedure TVerInfoRes.FillFileVersionInfo;
var
  SBSize: UInt;
begin
  // Determine size of version information
  Size := GetFileVersionInfoSize(PChar(FFileName), Handle);
  if Size <= 0 then         { raise exception if size <= 0 }
    raise ENoVerInfoError.Create('Niedostêpna informacja o wersji.');

  // Set the length accordingly
  SetLength(RezBuffer, Size);
  // Fill the buffer with version information, raise exception on error
  if not GetFileVersionInfo(PChar(FFileName), Handle, Size, PChar(RezBuffer)) then
    raise EVerInfoError.Create('Niedostêpna informacja o wersji.');

  // Get translation info, raise exception on error
  if not VerQueryValue(PChar(RezBuffer), VerTranslation,  pointer(TransTable),
  SBSize) then
    raise EVerInfoError.Create('Brak informacji o wersji jêzykowej.');
end;

procedure TVerInfoRes.FillFixedFileInfoBuf;
var
  Size: Cardinal;
begin
  if VerQueryValue(PChar(RezBuffer), '\', Pointer(FixedFileInfoBuf), Size) then begin
     if Size < SizeOf(TVSFixedFileInfo) then
        raise eNoFixeVerInfo.Create('Brak informacji "Fixed File Info"');
  end
  else
    raise eNoFixeVerInfo.Create('Brak informacji "Fixed File Info"')
end;

procedure TVerInfoRes.FillFileMaskInfo;
begin
  with FixedFileInfoBuf^ do begin
    if (dwFileFlagsMask and dwFileFlags and VS_FF_PRERELEASE) <> 0then
      FFileFlags.Add('Pre-release');
    if (dwFileFlagsMask and dwFileFlags and VS_FF_PRIVATEBUILD) <> 0 then
      FFileFlags.Add('Wersja prywatna');
    if (dwFileFlagsMask and dwFileFlags and VS_FF_SPECIALBUILD) <> 0 then
      FFileFlags.Add('Wersja specjalna');
    if (dwFileFlagsMask and dwFileFlags and VS_FF_DEBUG) <> 0 then
      FFileFlags.Add('Wersja testowa');
  end;
end;

function TVerInfoRes.GetPreDefKeyString(AVerKind: TVerInfoType): String;
var
  P: PChar;
  S: UInt;
begin
  Result := Format(FormatStr, [SfInfo, LoWord(TransTable^),HiWord(TransTable^),
    VerNameArray[aVerKind], #0]);
  // get and return version query info, return empty string on error
  if VerQueryValue(PChar(RezBuffer), @Result[1], Pointer(P), S) then
    Result := StrPas(P)
  else
    Result := '';
end;

function TVerInfoRes.GetUserDefKeyString(AKey: String): String;
var
  P: Pchar;
  S: UInt;
begin
  Result := Format(FormatStr, [SfInfo, LoWord(TransTable^),HiWord(TransTable^),
    aKey, #0]);
  // get and return version query info, return empty string on error
  if VerQueryValue(PChar(RezBuffer), @Result[1], Pointer(P), S) then
    Result := StrPas(P)
  else
    Result := '';
end;


function VersionString(Ms, Ls: Longint): String;
begin
  Result := Format('%d.%d.%d.%d', [HIWORD(Ms), LOWORD(Ms),
     HIWORD(Ls), LOWORD(Ls)]);
end;

function TVerInfoRes.GetFileVersion: String;
begin
  with FixedFileInfoBuf^ do
    Result := VersionString(dwFileVersionMS, dwFileVersionLS);
end;

function TVerInfoRes.GetProductVersion: String;
begin
  with FixedFileInfoBuf^ do
    Result := VersionString(dwProductVersionMS, dwProductVersionLS);
end;

function TVerInfoRes.GetFileOS: String;
begin
  with FixedFileInfoBuf^ do
    case dwFileOS of
      VOS_UNKNOWN:  // Same as VOS__BASE
        Result := 'Nieznana platforma systemowa';
      VOS_DOS:
        Result := 'Przeznaczony dla MS-DOS';
      VOS_OS216:
        Result := 'Przeznaczony dla 16-bitowego OS/2';
      VOS_OS232:
        Result := 'Przeznaczony dla 32-bitowego OS/2';
      VOS_NT:
        Result := 'Przeznaczony dla Windows NT';


      VOS__WINDOWS16:
        Result := 'Przeznaczony dla 16-bitowych Windows';
      VOS__PM16:
        Result := 'Przeznaczony dla 16-bit Protected Mode';
      VOS__PM32:
        Result := 'Przeznaczony dla 32-bit Protected Mode';
      VOS__WINDOWS32:
        Result := 'Przeznaczony dla 32-bitowych Windows';

      VOS_DOS_WINDOWS16:
        Result := 'Aplikacja DOSowa 16-bitowych Windows';
      VOS_DOS_WINDOWS32:
        Result := 'Aplikacja DOSowa Win32 API';
      VOS_OS216_PM16:
        Result := 'Przeznaczona dla 16-bit Protected Mode na 16-bitowym OS/2';
      VOS_OS232_PM32:
        Result := 'Przeznaczona dla 32-bit Protected Mode na 32-bitowym OS/2';
      VOS_NT_WINDOWS32:
        Result := 'Przeznaczona dla Win32 API w Windows NT';
    else
      Result := 'Nieznana platforma systemowa';
    end;
end;


end.


