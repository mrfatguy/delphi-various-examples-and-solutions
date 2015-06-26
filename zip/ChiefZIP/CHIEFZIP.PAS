LIBRARY ChiefZip;
{
DLL for the UNZIP functions
  * original version by Christian Ghisler

  * extended by Dr Abimbola Olowofoyeku (The African Chief)
     Homepage: http://ourworld.compuserve.com/homepages/African_Chief
     * the main exported functions are now linked in directly
       from UNZIP.PAS
}

{$I unzip.Inc}

USES unzip;

FUNCTION GetUnzipDllVersion : word;
{$ifdef USE_STDCALL}STDCALL;{$else}EXPORT;{$endif}
BEGIN
  GetUnzipDllVersion := 2 * 256 + 10;    {Version 2.10}
END;

EXPORTS
  GetUnzipDllVersion   index 1{$ifdef USE_STDCALL}  name  'GetUnzipDllVersion' {$endif},
  GetFirstInZip        index 2{$ifdef USE_STDCALL}  name  'GetFirstInZip' {$endif},
  GetNextInZip         index 3{$ifdef USE_STDCALL}  name  'GetNextInZip' {$endif},
  CloseZipFile         index 4{$ifdef USE_STDCALL}  name  'CloseZipFile' {$endif},
  IsZip                index 5{$ifdef USE_STDCALL}  name  'IsZip' {$endif},
  GetSupportedMethods  index 6{$ifdef USE_STDCALL}  name  'GetSupportedMethods' {$endif},
  UnzipFile            index 7{$ifdef USE_STDCALL}  name  'UnzipFile' {$endif},

  {*** the African Chief's functions ***}
  FileUnzip            index 8{$ifdef USE_STDCALL}  name  'FileUnzip' {$endif},
  ViewZip              index 9{$ifdef USE_STDCALL}  name  'ViewZip' {$endif},
  UnzipSize            index 10{$ifdef USE_STDCALL} name  'UnzipSize' {$endif},
  SetUnzipReportProc   index 11{$ifdef USE_STDCALL} name  'SetUnzipReportProc' {$endif},
  SetUnzipQuestionProc index 12{$ifdef USE_STDCALL} name  'SetUnzipQuestionProc' {$endif},
  FileUnzipEx          index 13{$ifdef USE_STDCALL} name  'FileUnzipEx' {$endif},
  ChfUnzip_Init        index 14{$ifdef USE_STDCALL} name  'ChfUnzip_Init' {$endif},
  SetNoRecurseDirs     index 15{$ifdef USE_STDCALL} name  'SetNoRecurseDirs' {$endif};
BEGIN
END.
