{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
{\\\\\\\\\\\\ CONDITIONAL COMPILATION DIRECTIVES FOR CHIEFLZ \\\\\\\\\\}
{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}


{\\\\\\\\\\\ release or debug mode?  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
{ Conditional compilation to check for any `impossible' scenarios...
  Remove for release code. }

{.$DEFINE Debug}   {!! comment out this line after testing !!}

{$ifdef os2}
    {$define msdos}
{$endif}

{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
{\\\\\\\\\\\\\\\ DLL or static link?  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
{$ifdef MSDOS}
  {$define OS_DOS} { && }
{$else MSDOS}
  {.$DEFINE aDLL}  { Remove dot to create a Windows/DPMI DLL }
{$IFDEF aDLL}
  {$UNDEF Debug}
  {$ifndef Win32}
    {$define Shared_Buffers}  {DLLs share buffers under Win16}
  {$endif Win32}
{$ENDIF aDLL}
{$endif MSDOS}


{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
{\\\\\\\\\\\\\\\ DOS DPMI program?   \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}

{$ifdef DPMI}
   {$define OS_DOS}
 {$ifdef aDLL}
   {$define Windows} {use Windows data types for DOS DPMI DLL}
 {$Endif aDLL}
{$endif DPMI}

{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
{\\\\\\\\\\\\\\\  Virtual Pascal 2.x     ?\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
{$ifdef VirtualPascal}
   {$define VP2}
   {$define Delphi}
{$endif VirtualPascal}


{$IFDEF Debug}
  {$D+,L+,Q-,R-,K+,F+,S+,Y+,V-}
{$ELSE}
  {$Q-,R-,K+,F+,S-,V-}
{$ENDIF}


{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
{\\\\\\\\\\\\\\\ Win32 or other platform ?\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
{$ifdef Win32}
  {$B-}  { Use short-circuit logic }
  {$H-}  { Don't Use long strings  }
  {$I+}  { IO-errors as exceptions }
  {$J+}  { assignable const variables. }
 {$ifndef VP2}
  {$Z1}  { Byte-sized enumerated types }
  {$Define Delphi}
  {$Define Delphi32}
  {$Define Windows}
  {$IFDEF Debug}
    {$W+}           { <<< Stack frames in Debug Code }
    {$WARNINGS On}  { <<< Force compiler to use bacon-saving options }
    {$HINTS On}
  {$ENDIF}
{$endif VP2}
{$else Win32}
  {$B-}  { Use short-circuit logic }
  {$F+)  { Use FAR-calls. This is *essential* in DEBUG code }
  {$I-}  { IO-Error handling performed manually }
  {$ifdef Windows}
   {$ifndef DPMI}
    {$define Win16}
   {$endif DPMI}
  {$endif Windows}
{$endif Win32}


{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
{\\\\\\\\\\\\\\\ Delphi 1.0?         \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}

{$ifDef Ver80}
  {$Z-}  { Byte-sized enumerated types }
  {$Define Delphi}
{$endif Ver80}

{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
{\\\\\\\\\\\\\\\ Windows or like platform ?\\\\\\\\\\\\\\\\\\\\\\\\\\\\}

{$ifdef Windows}
{$ifndef Delphi}
  {$define TPW}
{$endif Delphi}
{$endif Windows}

{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
{\\\\\\\\\\\\ should we enable thunks: for 16-bit Windows? \\\\\\\\\\\\}
{$ifdef Win16}
   {$ifndef aDLL}
     { comment out to disable thunking: see LZTHUNK.PAS for a
       thunking template, using the TPW32 package from my homepage }
     {$define Enable_Thunks}
   {$endif aDLL}
{$endif Win16}
