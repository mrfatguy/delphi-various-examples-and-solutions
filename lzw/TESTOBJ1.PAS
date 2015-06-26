PROGRAM TestObj1;
{trivial program using LZ object to compress a single file}

USES ChfLZSS;

VAR
Obj : TChiefLZObj;

BEGIN
   {$ifdef ver70}   { BP7/TP7 }
   WITH Obj DO BEGIN
        Init ( ParamStr ( 1 ), ParamStr ( 2 ) );
        Writeln ( CompressFile, ' bytes written.' );
        Done;
   END;
   {$else ver70}   { Delphi et. al. }
        Obj := TChiefLZObj.Init ( ParamStr ( 1 ), ParamStr ( 2 ) );
        Obj.CompressFile;
        Obj.Free;
   {$endif ver70}
END.

