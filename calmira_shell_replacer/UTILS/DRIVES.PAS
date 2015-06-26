{*********************************************************}
{                                                         }
{    Calmira System Library 1.0                           }
{    by Li-Hsin Huang,                                    }
{    released into the public domain January 1997         }
{                                                         }
{*********************************************************}

unit Drives;

{ Disk drive detecting functions }

interface

uses FileCtrl; { defines TDriveType }

const
  DriveDesc : array[TDriveType] of string[15] =
    ('Unknown drive', 'No drive', 'Floppy drive', 'Hard drive', 'Network drive',
     'CD-ROM drive', 'RAM disk');

type
  TDriveRange = 'A'..'Z';
  TDriveFlag = (dfValid, dfFloppy, dfFixed, dfNetwork, dfCDROM, dfRAM,
                dfRemoveable, dfWriteable);
  TDriveFlags = set of TDriveFlag;

var
  ValidDrives : set of TDriveRange;


function DriveNumber(Drive : Char) : Integer;
{ Maps drive characters to Integers used by Delphi. A = 1, B = 2, ... }

function WinDriveNumber(Drive: Char): Integer;
{ Maps drive characters to Integers used by Windows. A = 0, B = 1, ... }

function FindDriveType(Drive: Char): TDriveType;
{ Detects the type of the specified drive }

function GuessDriveType(Drive : Char) : TDriveType;
{ Returns the type of the drive without needing disk access --
  the information is obtained and stored during initialization }

function GetDriveFlags(drive: Char) : TDriveFlags;
{ Returns the flag set for the given drive }

function IsRAMDrive(DriveNum: Integer): Boolean;
{ Returns true if the drive is a RAM disk }

function IsCDROM(DriveNum: Integer): Boolean;
{ Returns true if the drive is a CD-ROM drive }

function GetNetworkVolume(Drive: Char): string;
{ Returns the network name of the drive if available, otherwise
  just returns the volume label }

function GetVolumeID(Drive: Char): string;
{ Returns the volume label of the disk }

procedure DetectDrives;
{ Refreshes this unit's information about drives on the system.
  Called automatically during initialization. }


implementation

uses SysUtils, WinProcs, WinTypes;

var
  DriveFlags  : array[TDriveRange] of TDriveFlags;
  DriveTypes  : array[TDriveRange] of TDriveType;


function DriveNumber(Drive : Char) : Integer;
begin
  Result := Ord(UpCase(Drive)) - Ord('A') + 1;
end;


function WinDriveNumber(Drive: Char): Integer;
begin
  Result := DriveNumber(Drive) - 1;
end;


function IsCDROM(DriveNum: Integer): Boolean; assembler;
asm
  MOV   AX, 1500h { look for MSCDEX }
  XOR   BX, BX
  INT   2Fh
  OR    BX, BX
  JZ    @Finish
  MOV   AX, 150Bh { check for using CD driver }
  MOV   CX, DriveNum
  INT   2fh
  OR    AX, AX
  @Finish:
end;


function IsRAMDrive(DriveNum: Integer): Boolean; assembler;
var
  Temp: Boolean;
asm
  MOV   Temp, False
  PUSH  DS
  MOV   BX, SS
  MOV   DS, BX
  SUB   SP, 0200h
  MOV   BX, SP
  MOV   AX, DriveNum
  MOV   CX, 1
  XOR   DX, DX
  INT   25h  { read boot sector }
  ADD   SP, 2
  JC    @@1
  MOV   BX, SP
  CMP   BYTE PTR SS:[BX+15h], 0F8h  { reverify fixed disk }
  JNE   @@1
  CMP   BYTE PTR SS:[BX+10h], 1     { check for single FAT }
  JNE   @@1
  MOV   Temp, True
@@1:
  ADD   SP, 0200h
  POP   DS
  MOV   AL, Temp
end;


function FindDriveType(Drive: Char): TDriveType;
var
  n : Integer;
begin
  n := WinDriveNumber(Drive);

  case GetDriveType(n) of
    0               : Result := dtNoDrive;
    DRIVE_REMOVABLE : Result := dtFloppy;
    DRIVE_FIXED     : if IsRAMDrive(n) then Result := dtRAM
                      else Result := dtFixed;
    DRIVE_REMOTE    : if IsCDROM(n) then Result := dtCDROM
                      else Result := dtNetwork;
  end;
end;



procedure DetectDrives;
var
  d: Char;
begin
  ValidDrives := [];
  for d := 'A' to 'Z' do begin
    DriveTypes[d] := FindDriveType(d);
    case DriveTypes[d] of
      dtUnknown : DriveFlags[d] := [dfValid, dfFixed, dfWriteable];
      dtNoDrive : DriveFlags[d] := [];
      dtFloppy  : DriveFlags[d] := [dfValid, dfFloppy, dfRemoveable, dfWriteable];
      dtFixed   : DriveFlags[d] := [dfValid, dfFixed, dfWriteable];
      dtNetwork : DriveFlags[d] := [dfValid, dfNetwork, dfWriteable];
      dtCDROM   : DriveFlags[d] := [dfValid, dfCDROM, dfRemoveable];
      dtRAM     : DriveFlags[d] := [dfValid, dfRAM, dfWriteable];
    end;
    if dfValid in DriveFlags[d] then Include(ValidDrives, d);
  end;
end;


function GuessDriveType(Drive : Char) : TDriveType;
begin
  Drive := UpCase(Drive);
  if Drive in ['A'..'Z'] then Result := DriveTypes[Drive]
  else Result := dtNoDrive;
end;


function GetDriveFlags(Drive: Char) : TDriveFlags;
begin
  Drive := UpCase(Drive);
  if Drive in ['A'..'Z'] then Result := DriveFlags[Drive]
  else Result := [];
end;


function GetVolumeID(Drive: Char): string;
var
  SR: TSearchRec;
begin
  Result := '';
  if FindFirst(Drive + ':\*.*', faVolumeID, SR) = 0 then
    Result := Uppercase(SR.Name);
end;


function GetNetworkVolume(Drive: Char): string;
const
  LocalName: array[0..2] of Char = 'C:'#0;
var
  BufSize: Word;
  Temp: array[0..128] of Char;
begin
  LocalName[0] := Drive;
  BufSize := 127;
  if WNetGetConnection(LocalName, Temp, @BufSize) = WN_SUCCESS then
    Result := StrPas(Temp)
  else
    Result := GetVolumeID(Drive);
end;




initialization
  DetectDrives;
end.
