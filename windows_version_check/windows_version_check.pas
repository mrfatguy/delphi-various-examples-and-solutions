unit VersionCheck;

interface

function GetWinVersion():String;

implementation

uses
  Windows, SysUtils, Registry;

  //trzeba przedefiniowaæ funkcjê, bo ta z Windows przyjmuje jako parametr
//var OSVERSIONINFO, a my potrzebujemy OSVERSIONINFOEX
function GetVersionEx(lpVersionInformation:Pointer): Boolean; stdcall;
external 'kernel32.dll' name 'GetVersionExA';

type
   OSVERSIONINFOEX = packed record
                       dwOSVersionInfoSize : DWORD;
                       dwMajorVersion      : DWORD;
                       dwMinorVersion      : DWORD;
                       dwBuildNumber       : DWORD;
                       dwPlatformId        : DWORD;
                       szCSDVersion        : array[0..127] of Char;
                       wServicePackMajor   : Word;
                       wServicePackMinor   : Word;
                       wSuiteMask          : Word;
                       wProductType        : Byte;
                       wReserved           : Byte;
                     end;

const
  VER_NT_WORKSTATION        = 1;
  VER_NT_DOMAIN_CONTROLLER  = 2;
  VER_NT_SERVER             = 3;

  VER_SUITE_ENTERPRISE = $00000002;
  VER_SUITE_DATACENTER = $00000080;
  VER_SUITE_PERSONAL   = $00000200;
  VER_SUITE_BLADE      = $00000400;


function GetWinVersion():String;
var
   osvi    : OSVERSIONINFOEX;
   bInfoEx : Boolean;
   reg     : TRegistry;
   sNTType : String;
begin
   Result:='';
   osvi.dwOSVersionInfoSize:=SizeOf(OSVERSIONINFOEX);
   bInfoEx:=GetVersionEx(@osvi);
   if not bInfoEx then
   begin
     osvi.dwOSVersionInfoSize:=SizeOf(OSVERSIONINFO);
     if not GetVersionEx(@osvi) then
       Exit;
   end;

   case osvi.dwPlatformId of
     VER_PLATFORM_WIN32s:
       Result:='Windows 3.1x + Win32s';

     VER_PLATFORM_WIN32_WINDOWS:
       begin
         //nie badamy dwMajorVersion, bo wszystkie maj¹ wartoœæ 4
         case osvi.dwMinorVersion of
           0 : begin
                 Result:='Windows 95';
                 if (osvi.szCSDVersion='C') or (osvi.szCSDVersion='B') then
                   Result:=Result+' OSR2';
               end;
           10: begin
                 Result:='Windows 98';
                 if osvi.szCSDVersion='A' then
                   Result:=Result+' FE'
                 else
                   Result:=Result+' SE';
               end;
           90: begin
                 Result:='Windows Me';
               end;
         end;
         Result:=Result+Format(' (build %d)',[Word(osvi.dwBuildNumber)]);
       end;

     VER_PLATFORM_WIN32_NT:
       begin
         case osvi.dwMajorVersion of
           3,4 : begin
                   Result:=Format('Windows NT %d.%d',[osvi.dwMajorVersion,osvi.dwMinorVersion]);
                   if bInfoEx then //na pewno jest to WinNT 4 SP6 (lub nowszy)
                   begin
                     case osvi.wProductType of
                       VER_NT_WORKSTATION:
                         Result:=Result+' Workstation';
                       VER_NT_DOMAIN_CONTROLLER,
                       VER_NT_SERVER:
                         Result:=Result+' Server';
                     end
                   end
                   else
                   begin
                     //jeœli jednak jest to starszy system, trzeba u¿yæ Rejestru...
                     reg:=TRegistry.Create(KEY_QUERY_VALUE);
                     reg.RootKey:=HKEY_LOCAL_MACHINE;
                     if
reg.OpenKey('SYSTEM\CurrentControlSet\Control\ProductOptions',False)
then
                     begin
                       sNTType:=reg.ReadString('ProductType');
                       reg.CloseKey();
                     end;

                     if CompareText(sNTType,'WINNT')=0 then
                       Result:=Result+' Workstation';

                     if (CompareText(sNTType,'SERVERNT')=0) or
                        (CompareText(sNTType,'LANMANNT')=0) then
                       Result:=Result+' Server';
                   end;
                 end;
           5   : begin //tu na pewno ju¿ mo¿na by³o skorzystaæ z OSVERSIONINFOEX :)
                   case osvi.dwMinorVersion of
                     0 : Result:='Windows 2000';
                     1 : Result:='WindowsXP';
                     2 : Result:='Windows.NET';
                   end;
                   case osvi.wProductType of
                     VER_NT_WORKSTATION:
                       begin
                         if (osvi.wSuiteMask and VER_SUITE_PERSONAL)<>0 then
                           Result:=Result+' Home'
                         else
                           Result:=Result+' Professional';
                       end;

                     VER_NT_SERVER:
                       begin
                         if (osvi.wSuiteMask and VER_SUITE_DATACENTER)<>0
then
                           Result:=Result+' Datacenter Server'
                         else if (osvi.wSuiteMask and
VER_SUITE_ENTERPRISE)<>0 then
                           Result:=Result+' Advanced Server'
                         else if (osvi.wSuiteMask and VER_SUITE_BLADE)<>0
then
                           Result:=Result+' Web Server'
                         else
                           Result:=Result+' Server'
                       end;
                   end
                 end;
         end;

         //teraz dodajemy info o ServicePacku...
         if osvi.szCSDVersion<>'' then
           Result:=Result+' '+osvi.szCSDVersion;

         //oraz info dot. "build number"
         Result:=Result+Format(' (build %d)',[Word(osvi.dwBuildNumber)]);
       end;
   end;
end;


end.
 
