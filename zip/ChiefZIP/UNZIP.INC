{
Global Conditional Definitions for Chief's UNZIP package
  By Dr Abimbola Olowofoyeku (The African Chief)
  Homepage: http://ourworld.compuserve.com/homepages/African_Chief
}

{.$define Debug}           {uncomment for debugging}

{$ifndef fpc}
{$ifdef __GPC__}
    {$I-}
    {$W-}
    {$X+}
 {$else} {__GPC__}
  {$IFDEF Debug}
    {$F+,D+,Q-,L+,G+,R+,I-,S+,Y+,A+}
  {$ELSE}
    {$F+,Q-,G+,R-,S-,I-,A+}
  {$ENDIF}
 {$endif} {__GPC__}
{$endif} {fpc}


{$ifdef ver70}
   {$ifdef Windows} {$define Win16} {$endif Windows}
   {$ifdef MSDOS} {$define NO_EXPORTS} {$endif MSDOS}
   {$define OS_16_BIT}
   {$define __OS_DOS__}
   {$ifdef DPMI} {$define BP_DPMI} {$endif}
{$endif ver70}

{$ifdef ver80}
   {$define Delphi}      {Delphi 1.x}
   {$define Delphi16}
   {$define Win16}
   {$define OS_16_BIT}
   {$define __OS_DOS__}
{$endif ver80}

{$ifdef ver90}
   {$define Delphi}      {Delphi 2.x}
   {$define Delphi32}
   {$define __OS_DOS__}
{$endif ver90}

{$ifdef ver100}
   {$define Delphi}      {Delphi 3.x}
   {$define Delphi32}
   {$define __OS_DOS__}
{$endif ver100}

{$ifdef ver93}
   {$define Delphi}      {C++ Builder 1.x}
   {$define Delphi32}
   {$define __OS_DOS__}
{$endif ver93}

{$ifdef ver110}
   {$define Delphi}      {C++ Builder 3.x}
   {$define Delphi32}
   {$define __OS_DOS__}
{$endif ver110}

{$ifdef ver120}
   {$define Delphi}      {Delphi 4.0?}
   {$define Delphi32}
   {$define __OS_DOS__}
{$endif ver120}

{$ifdef VirtualPascal} {  Virtual Pascal 2.0 }
   {$define Delphi}    {  Use Delphi Syntax }
   {$define VP2}
   {&Delphi+}
   {$define USE_STDCALL}
   {$define __OS_DOS__}
{$endif VirtualPascal}

{$ifdef Delphi}
   {$define Windows}
{$endif Delphi}

{$ifdef Win32}
  {$H-}                    { no long strings, please! }
  {$define USE_STDCALL}
  {$define OS_BigMem}
{$else Win32}
  {$define assembler}      {use 16-bit assembler!}
{$endif Win32}

{$ifdef FPC}
  {$undef assembler}
  {$undef USE_STDCALL}
  {$define OS_BigMem}
  {$define NO_EXPORTS}
  {$ifdef linux}
     {$define fpc_linux}
  {$else}
    {$define __OS_DOS__}
  {$endif}
{$endif FPC}

{$ifdef Windows}
  {$define UseWin}
{$endif Windows}

{$ifdef Win16}
  {$K+}   {smart callbacks}
{$endif Win16}

 {$ifdef OS2}
    {$undef assembler}
    {$undef Windows}
    {$define UseWin}
    {$define OS_BigMem}
 {$endif OS2}

{$ifdef __GPC__}
  {$undef assembler}
  {$undef UseWin}
  {$undef USE_STDCALL}
  {$define OS_BigMem}
  {$define NO_EXPORTS}
{$endif}

