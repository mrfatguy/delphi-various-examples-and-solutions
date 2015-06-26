UNIT Chfunzip;
{
Simple Delphi Component for UNZIP
 * by Dr Abimbola Olowofoyeku (The African Chief)
 Homepage: http://ourworld.compuserve.com/homepages/African_Chief
}

{$I unzip.Inc}

{.$define UseDLL}   { /// uncomment this line to use the DLL /// }

INTERFACE
USES
{$ifdef __GPC__}
GPC,
{$endif}

{$ifdef Delphi}
Classes,
{$endif Delphi}
{$ifdef UseDLL}
zipinter,
{$else UseDLL}
unzip,
{$endif UseDLL}
ziptypes;

TYPE
TChiefUnzip = {$ifdef Delphi}CLASS ( TComponent ) {$else}OBJECT{$endif}
{$ifndef __GPC__}
   PRIVATE
{$endif}
      FName,                          {source ZIP file name}
      FDir,                           {target directory}
      FSpec     : TString;            {file specifications to process in ZIP file}
      FReport   : UnzipReportProc;    {points to callback procedure}
      FQuestion : UnzipQuestionProc;  {points to callback procedure}
      CompSize  : Word64;             {compressed size}
      fNoRecurse: Boolean;            {whether to recurse into dirs}

{$ifndef __GPC__}
  PUBLIC
{$endif}
   CONSTRUCTOR Create{$ifdef Delphi} ( aOwner : TComponent ); OVERRIDE{$endif};
   DESTRUCTOR  Destroy;{$ifndef Delphi}VIRTUAL;{$else}OVERRIDE;{$endif}
   FUNCTION    Unzip : Int32;VIRTUAL;  {unzip the archive}
   FUNCTION    View : Int32;VIRTUAL;   {view the archive;must provide callback procedure}
   FUNCTION    Size : Word64;VIRTUAL;    {uncompressed size of the archive}
   FUNCTION    CompressedSize : Word64; VIRTUAL; {compressed size}

   PROCEDURE   SetFileName ( CONST aName : String ); VIRTUAL;
   PROCEDURE   SetDirectoryName ( CONST aName : String ); VIRTUAL;
   PROCEDURE   SetFileSpecs ( CONST Spec : String ); VIRTUAL;
   PROCEDURE   SetReportProc ( aProc   : UnzipReportProc ); VIRTUAL;
   PROCEDURE   SetQuestionProc ( aProc : UnzipQuestionProc ); VIRTUAL;
   PROCEDURE   SetNoRecurse ( aRecurse : Boolean ); VIRTUAL;

  {$ifdef Delphi}
   PROPERTY      ReportProc : UnzipReportProc     Read FReport   Write SetReportProc;
   PROPERTY      QuestionProc : UnzipQuestionProc Read FQuestion Write SetQuestionProc;
  PUBLISHED
   PROPERTY      ZipFileName : TString           Read FName      Write SetFileName;
   PROPERTY      TargetDirectory : TString       Read FDir       Write SetDirectoryName;
   PROPERTY      FilesToExtract : TString        Read FSpec      Write SetFileSpecs;
   PROPERTY      DontRecurse : boolean           Read FNoRecurse Write SetNoRecurse;
  {$endif Delphi}
END;

{$ifdef Delphi}
PROCEDURE Register;
{$endif Delphi}

{/////////////////////////////////////////////////////}
IMPLEMENTATION
{/////////////////////////////////////////////////////}
{$ifdef Delphi}
PROCEDURE Register;
BEGIN
   RegisterComponents ( 'Unzip', [ TChiefUnZip ] );
END;
{$endif Delphi}


CONSTRUCTOR TChiefUnzip.Create;
BEGIN
  {$ifdef Delphi}INHERITED Create ( aOwner );{$endif Delphi}
  CompSize := 0;
  FName := '';
  FDir  := '';
  FSpec := '*.*' + #0;       { default to all files }
  {$ifdef __GPC__}@{$endif}FReport := NIL;       { no report callback }
  {$ifdef __GPC__}@{$endif}FQuestion := NIL;     { no question callback }
  fNoRecurse := FALSE;  { default to full recursion }
END;

DESTRUCTOR  TChiefUnzip.Destroy;
BEGIN
  SetUnZipReportProc ( NIL );
  SetUnZipQuestionProc ( NIL );
  SetNoRecurseDirs ( FALSE );   {reset recursion flag to default}
  {$ifdef __GPC__}@{$endif}FReport := NIL;
  {$ifdef __GPC__}@{$endif}FQuestion := NIL;
  CompSize := 0;
  {$ifdef Delphi}INHERITED Destroy;{$endif}
END;

FUNCTION    TChiefUnzip.Unzip : Int32;
BEGIN
  Unzip := unzip_MissingParameter; {no zipfilename or target directory}
  IF ( FName = '' ) OR ( FDir = '' ) THEN exit;
  SetNoRecurseDirs ( fNoRecurse );   {set recursion flag}
  Unzip := FileUnzip (
                     pChar ( @FName [ 1 ] ),
                     pChar ( @FDir [ 1 ] ),
                     pChar ( @FSpec [ 1 ] ),
                     FReport,
                     FQuestion );
END;

FUNCTION    TChiefUnzip.View : Int32;
BEGIN
  {$ifdef ver70}View{$else}Result{$endif} := unzip_MissingParameter;

  IF ( FName = '' ) OR ( @FReport = NIL ) THEN exit;

  {$ifdef ver70}
  View
  {$else}
  Result
  {$endif} :=
  ViewZip (
          pChar ( @FName [ 1 ] ),
          pChar ( @FSpec [ 1 ] ),
          FReport );
END;

FUNCTION    TChiefUnzip.Size;
BEGIN
  Size := UnZipSize ( pChar ( @FName [ 1 ] ), Compsize );
END;

FUNCTION    TChiefUnzip.CompressedSize;
Var
rS : Word64;
BEGIN
  rS := UnZipSize ( pChar ( @FName [ 1 ] ), Compsize );
  CompressedSize := CompSize;
END;

PROCEDURE   TChiefUnzip.SetFileName ( CONST aName : String );
BEGIN
   FName := aName + #0;
END;

PROCEDURE   TChiefUnzip.SetDirectoryName ( CONST aName : String );
BEGIN
    FDir := aName + #0;
END;

PROCEDURE   TChiefUnzip.SetFileSpecs ( CONST Spec : String );
BEGIN
    FSpec := Spec + #0;
END;

PROCEDURE   TChiefUnzip.SetReportProc ( aProc : UnzipReportProc );
BEGIN
   FReport := aProc;
END;

PROCEDURE   TChiefUnzip.SetQuestionProc ( aProc : UnzipQuestionProc );
BEGIN
   FQuestion := aProc;
END;

PROCEDURE   TChiefUnzip.SetNoRecurse ( aRecurse : Boolean );
BEGIN
   FNoRecurse := aRecurse;
END;

END.
