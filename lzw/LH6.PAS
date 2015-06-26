{Sample program to test LHSix unit}
PROGRAM LZ6;

USES LHSix;

{$ifdef Win32}
 {$ifndef VirtualPascal}
 {$ifndef __GPC__}
    {$apptype console}
 {$endif __GPC__}
 {$endif VirtualPascal}
{$endif Win32}

FUNCTION EncodeCallBack ( CONST Count : Longint; Decompressing : Boolean ) : Longint;
BEGIN
   EncodeCallBack := 0;
   Write ( '+' );
END;

FUNCTION DecodeCallBack ( CONST Count : Longint; Decompressing : Boolean ) : Longint;
BEGIN
   DecodeCallBack := 0;
   Write ( '-' );
END;

BEGIN
  IF ( ParamCount < 2 ) OR ( ParamCount > 3 )
  THEN BEGIN
    Writeln ( 'Usage: ', ParamStr ( 0 ), ' <inputfile> <outputfile> [/U]' );
    HALT ( 1 );
  END;

  IF ( ParamStr ( 1 ) = ParamStr ( 2 ) )
  THEN BEGIN
      Writeln ( 'File names must be different' );
      HALT ( 2 );
  END;

  IF ( ParamCount <> 3 )
  THEN Writeln ( EncodeFile ( ParamStr ( 1 ), ParamStr ( 2 ), EncodeCallBack ),
       ' bytes written.' )
  ELSE Writeln ( DecodeFile ( ParamStr ( 1 ), ParamStr ( 2 ), DecodeCallBack ),
       ' bytes extracted.' );
END.

