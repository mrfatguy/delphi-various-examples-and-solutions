{
 example of a Win16 thunking unit for ChiefLZ.PAS;
 uses routines from TPWIN32 - part of my tpw32 package

 ; to use thunking with CHIEFLZ.DLL, you have to import the
   Set????Thunk functions in LZEXPLIC.PAS

   By default, they are not imported, because their use is too specific
   and probably unlikely.
}
UNIT LZThunk;

INTERFACE
{$i LZdefine.inc}

USES
{$ifdef Enable_Thunks}  { defined in LZDEFINE.INC: edit that file to undefine this !}
TpWin32,  { get the TPW32 package from my homepage, and rename the TPW32 unit to TPWIN32 }
{$endif Enable_Thunks}
ChfTypes
{$ifndef aDLL}
, ChiefLZ
{$endif aDLL};

FUNCTION MyFCreateThunk ( VAR FName : TLZString; IsDir : Boolean ) : Longint;
{$ifdef Win32}STDCALL;{$else}{$ifndef msdos}EXPORT;{$endif}{$endif}

FUNCTION MyFNameThunk ( CONST FName : TLZString;SHName : Boolean ) : TLZString;
{$ifdef Win32}STDCALL;{$else}{$ifndef msdos}EXPORT;{$endif}{$endif}

FUNCTION MyFRenameThunk ( CONST OldFName, NewFName : TLZString ) : Boolean;
{$ifdef Win32}STDCALL;{$else}{$ifndef msdos}EXPORT;{$endif}{$endif}

IMPLEMENTATION
{///////////////////////////////////////////}
FUNCTION MyFCreateThunk ( VAR FName : TLZString;IsDir : Boolean ) : Longint;
BEGIN
 MyFCreateThunk := - 1;
{$ifdef Enable_Thunks}
 IF IsDir THEN BEGIN
    W32MkDir ( FName );
    MyFCreateThunk := ioresult;
 END ELSE IF W32Rewrite ( FName ) <> - 1 THEN MyFCreateThunk := 0;
{$endif Enable_Thunks}
END;

FUNCTION MyFNameThunk ( CONST FName : TLZString;SHName : Boolean ) : TLZString;
BEGIN
  MyFNameThunk := FName;
{$ifdef Enable_Thunks}
    IF SHName
    THEN MyFNameThunk := GetShortFName ( FName )
    ELSE MyFNameThunk := GetLongFName ( FName );
{$endif Enable_Thunks}
END;

FUNCTION MyFRenameThunk ( CONST OldFName, NewFName : TLZString ) : Boolean;
BEGIN
  MyFReNameThunk := True;
{$ifdef Enable_Thunks}
    MyFRenameThunk := W32Rename ( OldFName, NewFName );
{$endif Enable_Thunks}
END;

BEGIN
{$ifdef Enable_Thunks}
   {$ifndef aDLL}
     SetWin16FCreateThunk ( MyFCreateThunk );
     SetWin16FNameThunk   ( MyFNameThunk );
     SetWin16FReNameThunk ( MyFReNameThunk );
   {$endif aDLL}
{$endif Enable_Thunks}
END.
