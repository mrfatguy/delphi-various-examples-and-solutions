LIBRARY Unzipd32;

USES
  wintypes,unzip,zipread;

function GetUnzipDllVersion:word; export;
begin
  GetUnzipDllVersion:=2*256+7;    {Version 2.06}
end;

function GetFirstInZip(zipfilename:pchar;var zprec:tPackRec):integer; export; stdcall;
begin
  GetFirstInZip:=zipread.GetFirstInZip(zipfilename,zprec);
end;

function GetNextInZip(var Zprec:tPackrec):integer; export;  stdcall;
begin
  GetNextInZip:=zipread.GetNextInZip(Zprec);
end;

procedure CloseZipFile(var Zprec:tPackrec); export; stdcall;
begin
  zipread.CloseZipFile(Zprec);
end;

function isZip(filename:pchar):boolean; export; stdcall;
begin
  isZip:=zipread.isZip(filename);
end;

function GetSupportedMethods:longint; export; stdcall; {Method 8 supported -> bit 8 = 1, etc.}
begin
  GetSupportedMethods:=unzip.GetSupportedMethods;
end;

function unzipfile(in_name:pchar;out_name:pchar;attr:word;offset:longint;
  hFileAction:thandle;cm_index:integer):integer; export; stdcall;
BEGIN
  unzipfile:=unzip.unzipfile(in_name,out_name,attr,offset,hFileAction,cm_index);
END;

function unzipfiletomemory(in_name:pchar;out_buf:pchar;var buf_size:longint;
  offset:longint;hFileAction:thandle;cm_index:integer):integer; export; stdcall;
begin
  unzipfiletomemory:=unzip.unzipfiletomemory(in_name,out_buf,buf_size,
    offset,hFileAction,cm_index);
end;

function UnzipTestIntegrity(in_name:pchar;offset:longint;
  hFileAction:thandle;cm_index:integer;var crc:longint):integer; export; stdcall;
begin
  UnzipTestIntegrity:=unzip.UnzipTestIntegrity(in_name,offset,
    hFileAction,cm_index,crc);
end;

EXPORTS
  GetUnzipDllVersion index 1,
  GetFirstInZip index 2,
  GetNextInZip index 3,
  CloseZipFile index 4,
  isZip index 5,
  GetSupportedMethods index 6,
  unzipfile index 7,
  unzipfiletomemory index 8,
  UnzipTestIntegrity index 9;

BEGIN
END.
