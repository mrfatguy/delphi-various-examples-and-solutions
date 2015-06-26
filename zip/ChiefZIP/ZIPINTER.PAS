UNIT ZipInter;
{
Interface to the UNZIP DLL
  * original version by Christian Ghisler
  * extended by Dr Abimbola Olowofoyeku (The African Chief)
      Homepage: http://ourworld.compuserve.com/homepages/African_Chief

  * amended for Win32 by the African Chief
  * amended for OS/2 by the African Chief
}

{$i unzip.inc}

INTERFACE

USES
{$ifdef UseWin}
WinTypes,
WinProcs,
{$endif UseWin}
Ziptypes;

{$ifdef BP_DPMI}
TYPE hWnd = Word;
{$endif}
{*********************************************************************}
{*********************************************************************}
{************** The African Chief's functions ************************}
{*********************************************************************}
{*********************************************************************}
FUNCTION FileUnzip
( SourceZipFile, TargetDirectory, FileSpecs : pChar;
 Report : UnzipReportProc;Question : UnzipQuestionProc ) : integer;
{$ifdef USE_STDCALL}STDCALL;{$endif}

FUNCTION FileUnzipEx ( SourceZipFile, TargetDirectory, FileSpecs : pChar ) : integer;
{$ifdef USE_STDCALL}STDCALL;{$endif}

FUNCTION Viewzip ( SourceZipFile, FileSpecs : pChar; Report : UnzipReportProc ) : integer;
{$ifdef USE_STDCALL}STDCALL;{$endif}

FUNCTION UnZipSize ( SourceZipFile : pChar;VAR Compressed : Longint ) : longint;
{$ifdef USE_STDCALL}STDCALL;{$endif}

FUNCTION  SetUnZipReportProc ( aProc : UnzipReportProc ) : Pointer;
{$ifdef USE_STDCALL}STDCALL;{$endif}

FUNCTION  SetUnZipQuestionProc ( aProc : UnzipQuestionProc ) : Pointer;
{$ifdef USE_STDCALL}STDCALL;{$endif}

PROCEDURE ChfUnzip_Init;
{$ifdef USE_STDCALL}STDCALL;{$endif}

FUNCTION SetNoRecurseDirs ( DontRecurse : Boolean ) : Boolean;
{$ifdef USE_STDCALL}STDCALL;{$endif}

{*********************************************************************}
{*********************************************************************}
{*************************** original functions **********************}
{*********************************************************************}
{*********************************************************************}

{******************* DLL version *************************************}
FUNCTION GetUnzipDllVersion : word;
{$ifdef USE_STDCALL}STDCALL;{$endif}

{Hi byte=number before period, Lo byte=number after period}
{Later versions will be downward compatible}

{******************** ZIP central directory access *******************}
{The following 3 functions can be called in a loop to retreive all
 the files in the given zip file.
 Use these functions similar to findfirst and findnext:

 Example:
 var r:tziprec;

 rc:=GetFirstInZip(zipname,r);
 while rc=zip_ok do
   DosomethingWithData(r);
   rc:=GetNextInZip(r);
 end;
 closezipfile(r);
 case rc of
   zip_FileError:messagebox(hwindow,'Error reading ZIP file!',zipname,mb_ok);
   zip_InternalError:messagebox(hwindow,'Internal error in ZIP file!',zipname,mb_ok);
 end;
}
FUNCTION GetFirstInZip ( zipfilename : pchar;VAR zprec : tZipRec ) : integer;
{$ifdef USE_STDCALL}STDCALL;{$endif}
{zipfilename: filename of zip file}
{zprec:       record, will be filled with zipfile data}

FUNCTION GetNextInZip ( VAR Zprec : tZiprec ) : integer;
{$ifdef USE_STDCALL}STDCALL;{$endif}
{zprec:       record, will be filled with zipfile data,
 do not change the 'internal' field received from previous calls!}

PROCEDURE CloseZipFile ( VAR Zprec : tZiprec );
{$ifdef USE_STDCALL}STDCALL;{$endif}
{Call after last GetNextInZip call to free buffer}

{********************* Test if file is a ZIP file ********************}

FUNCTION isZip ( filename : pchar ) : boolean;
{$ifdef USE_STDCALL}STDCALL;{$endif}
{Tests if given file is a zip file (only test for PK#3#4 at the beginning)}

{***************** Get Unzip Methods supported by DLL ****************}
{Currently (version 1.0) these are stored (0), shrunk (1),
                            imploded (6) and deflated (8)}

FUNCTION GetSupportedMethods : longint;
{$ifdef USE_STDCALL}STDCALL;{$endif}
{Method 0 supported -> bit 0 = 1,
 Method 8 supported -> bit 8 = 1,
 etc.}

{********************* unzip a file from ZIP-file ********************}
FUNCTION unzipfile ( in_name : pchar;out_name : pchar;offset : longint;
  hFileAction : hwnd;cm_index : integer ) : integer;
{$ifdef USE_STDCALL}STDCALL;{$endif}
{usage:
 in_name:      name of zip file with full path
 out_name:     desired name for out file
 offset:       header position of desired file in zipfile, found in tZiprec
 hFileAction:  handle to dialog box showing advance of decompression (optional),
               or zero when only keyboard shall be checked
 cm_index:     - if hfileaction<>0 : notification code sent in a wm_command
                 message to the dialog to update percent-bar
               - if hfileaction=0  : virtual key code of key the user must press
                 to interrupt unzipping, i.e. vk_escape

 Return value: one of the above unzip_xxx codes

 Example for handling the cm_index message in a progress dialog:

 unzipfile(......,cm_showpercent);

 ...

 procedure TFileActionDialog.wmcommand(var msg:tmessage);
 var ppercent:^word;
 begin
   TDialog.WMCommand(msg);
   if msg.wparam=cm_showpercent then begin
     ppercent:=pointer(lparam);
     if ppercent<>nil then begin
       if (ppercent^>=0) and (ppercent^<=100) then
         SetProgressBar(ppercent^);
       if UserPressedAbort then
         ppercent^:=$ffff
       else
         ppercent^:=0;
       end;
     end;
   end;
 end;
}

IMPLEMENTATION
CONST
DllName = {$ifdef Win32}'CHIEFZIP.DLL'{$else}'CHIEFZIP'{$endif Win32};

FUNCTION  GetUnzipDllVersion;  external DllName index 1;
FUNCTION  GetFirstInZip;       external DllName index 2;
FUNCTION  GetNextInZip;        external DllName index 3;
PROCEDURE CloseZipFile;        external DllName index 4;
FUNCTION  IsZip;               external DllName index 5;
FUNCTION  GetSupportedMethods; external DllName index 6;
FUNCTION  UnzipFile;           external DllName index 7;

{The Chief!}
FUNCTION  FileUnzip;           external DllName index 8;
FUNCTION  ViewZip;             external DllName index 9;
FUNCTION  UnZipSize;           external DllName index 10;
FUNCTION  SetUnZipReportProc;  external DllName index 11;
FUNCTION  SetUnZipQuestionProc;external DllName index 12;
FUNCTION  FileUnzipEx;         external DllName index 13;
PROCEDURE ChfUnzip_Init;       external DllName index 14;
FUNCTION  SetNoRecurseDirs;    external DllName index 15;

END.
