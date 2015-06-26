{******************************************}
{  SIXPACK.C -- Data compression program   }
{  Written by Philip G. Gage, April 1991   }
{    Translated into Pascal Nov. 1991      }
{    by Douglas Webb                       }
{                                          }
{******************************************}

{*****************************************************************}
{*****************************************************************}
{ Amended August 1998 by Dr. A. Olowofoyeku (The African Chief)   }
{      * program converted to unit                                }
{      * Encode and Decode procedures converted to LH6Encode     }
{        and LH6Decode functions, each with 2 parameters         }
{      * EncodeFile and DecodeFile functions added                }
{      * file globals removed in exchange for file parameters     }
{      * callbacks added                                          }
{      * LZInit and LZDone added                                  }
{      * amended to compile for 32-bit Delphi and Virtual Pascal  }
{      * some global routines changed to nested routines          }
{      * InitVars routine added                                   }
{      * FreeVars routine added                                   }
{      * some static data changed to dynamic                      }
{                                                                 }
{      *** ASM code in function Uncompress translated to Pascal   }
{          by Christopher Eltschka                                }
{*****************************************************************}
{*****************************************************************}

UNIT LHSix;

INTERFACE
{$ifdef __GPC__}
{$W-}
{$X+}
TYPE
 Longint   = Integer ( 32 );   { normal LONGINT under GPC is 64-bit }
 Word      = Cardinal ( 16 );  { normal WORD under GPC is 32-bit }
{$else}
  {$i lzdefine.inc}
  {$R-,A+,F+}
{$endif __GPC__}

{ GPC barfs if "Var foo: File" is used as a parameter,
  so we have to use a type definition here }
TYPE LZFile = File;

{ compress from infile to outfile; both files must be open;
 and you must close then afterwards }
FUNCTION LH6Encode ( VAR InFile, OutFile : LZFile ) : Longint;

{ decompress from infile to outfile; both files must be open;
 and you must close then afterwards }
FUNCTION LH6Decode ( VAR InFile, OutFile : LZFile ) : Longint;

{ for compatibility }
FUNCTION  LZInit : boolean;
PROCEDURE LZDone;

{ CallBack Procedural Type }
TYPE
TLH6CallBack = FUNCTION
             ( CONST Count : Longint; Decompressing : Boolean ) : Longint;

{ global callbacks }
VAR
LH6ReadProc  : TLH6CallBack;
LH6WriteProc : TLH6CallBack;

CONST IsLH6Initialized : boolean = FALSE;

TYPE LZHString = String [255];

FUNCTION EncodeFile ( CONST Src, Dest : LZHString;CallBack : TLH6CallBack ) : Longint;
FUNCTION DecodeFile ( CONST Src, Dest : LZHString;CallBack : TLH6CallBack ) : Longint;

IMPLEMENTATION

{$ifdef __GPC__}
TYPE
TLZSSWord = Integer;

CONST
LZCode_MemAllocFailure    = - 20;
LZCode_EndOfFileError     = - 21;
{$else __GPC__}
USES
ChfTypes;
{$I-}
TYPE
{$ifdef Win32}
TLZSSWord = Longint;
Integer = Longint;
{$else Win32}
TLZSSWord = Word;
{$endif Win32}
{$endif __GPC__}

CONST
  TEXTSEARCH = 1000;   { Max strings to search in text file - smaller -> Faster compression}
  BINSEARCH  =  200;   { Max strings to search in binary file }
  TEXTNEXT   =   50;   { Max search at next character in text file - Smaller -> better compression }
  BINNEXT    =   20;   { Max search at next character in binary file }
  MAXFREQ    = 2000;   { Max frequency count before table reset }
  MINCOPY    =    3;   { Shortest string COPYING length }
  MAXCOPY    =   64;   { Longest string COPYING length }
  SHORTRANGE =    3;   { Max distance range for shortest length COPYING }
  COPYRANGES =    6;   { Number of string COPYING distance bit ranges @@@}
  CopyBits : ARRAY [0..PRED ( COPYRANGES ) ] OF INTEGER = ( 4, 6, 8, 10, 12, 14 );   { Distance bits }
  CODESPERRANGE = ( MAXCOPY - MINCOPY + 1 );

  NUL = - 1;                    { End of linked list marker }
  HASHSIZE = 16384;            { Number of entries in hash table }
  HASHMASK = ( HASHSIZE - 1 );   { Mask for hash key wrap }

{ Adaptive Huffman variables }
  TERMINATE = 256;             { EOF code }
  FIRSTCODE = 257;             { First code for COPYING lengths }
  MAXCHAR   = ( FIRSTCODE + COPYRANGES * CODESPERRANGE - 1 );
  SUCCMAX   = ( MAXCHAR + 1 );
  TWICEMAX  = ( 2 * MAXCHAR + 1 );
  ROOT      = 1;
  MAXBUF    = 1024 * {$ifdef MSDOS}4{$else}{$ifdef Win32}16{$else}8{$endif Win32}{$endif MSDOS}; { buffer size }

{** Bit packing routines **}
  Input_Bit_Count  : WORD = 0;                   { Input bits buffered }
  Input_Bit_Buffer : WORD = 0;                   { Input buffer }
  Output_Bit_Count : WORD = 0;                   { Output bits buffered }
  Output_Bit_Buffer : WORD = 0;                   { Output buffer }
  Bytes_Out        : Longint = 0;                { File size counters }
  Bytes_In         : LongINT = 0;
  OutBufCount      : INTEGER = 0;
  InBufCount       : INTEGER = 0;

TYPE
  Copy_Type = ARRAY [0..PRED ( CopyRanges ) ] OF Integer;

CONST
  CopyMin : Copy_Type = ( 0, 16, 80, 336, 1360, 5456 );
  CopyMax : Copy_Type = ( 15, 79, 335, 1359, 5455, 21839 );
  MaxSize = 21839 + MAXCOPY;   { @@@ }
  MaxDistance = 21839{: Integer = CopyMax[PRED(COPYRANGES)]};

TYPE
  HashType    = ARRAY [0..PRED ( HashSize ) ] OF Integer;
  Hash_Ptr    = ^HashType;
  ListType    = ARRAY [0..MaxSize] OF Integer;
  List_Ptr    = ^ListType;
  Buffer_Type = ARRAY [0..MaxSize] OF BYTE;            { Convenient typecast. }
  Buffer_Ptr  = ^Buffer_Type;
  HTree_Type  = ARRAY [0..MaxChar] OF WORD;
  HTree_TypePtr = ^HTree_Type;
  THTree_Type   = ARRAY [0..TwiceMax] OF WORD;
  THTree_TypePtr = ^THTree_Type;

  BufType = ARRAY [0..PRED ( MAXBUF ) ] OF BYTE;
  BufPtr = ^BufType;
  WDBufType = ARRAY [0..PRED ( MAXBUF ) ] OF WORD;
  WDBufPtr = ^WDBufType;


VAR
  Head, Tail : Hash_Ptr;          { Hash table }
  Next, Prev : List_Ptr;          { Doubly linked lists }
  Buffer : Buffer_Ptr;            { Text buffer }
  LeftC, RightC : HTree_TypePtr;  { Huffman tree }
  Parent, Freq  : THTree_TypePtr;
  InBuf, OutBuf : BufPtr;
  WDBuf : WDBufPtr;
  Distance, Insrt, DictFile, Binary : Integer;


{$ifdef __GPC__}
{ GPC complains about type incompatibility, so we do a different "Assign" here }
FUNCTION Assigned ( p : TLH6CallBack ) : Boolean;
BEGIN
   Assigned := @p <> NIL;
END;
{$endif __GPC__}


PROCEDURE InitVars;
BEGIN
   InBufCount := 0;
   OutBufCount := 0;
   New ( RightC );
   New ( LeftC );
   New ( Parent );
   New ( Freq );
   FillChar ( RightC^, Sizeof ( RightC^ ), 0 );
   FillChar ( LeftC^, Sizeof ( LeftC^ ), 0 );
   FillChar ( Parent^, Sizeof ( Parent^ ), 0 );
   FillChar ( Freq^, Sizeof ( Freq^ ), 0 );
END;

PROCEDURE FreeVars;
BEGIN
   Dispose ( Freq );
   Dispose ( Parent );
   Dispose ( LeftC );
   Dispose ( RightC );
   Freq := NIL;
   Parent := Nil;
   LeftC := Nil;
   RightC := Nil;
END;

FUNCTION DummyReadCallBack ( CONST Count : Longint; Decompressing : Boolean ) : Longint;
BEGIN
   DummyReadCallBack := 0;
   {compressing - return bytes read}
   IF NOT Decompressing THEN Write ( '+' );
END;

FUNCTION DummyWriteCallBack ( CONST Count : Longint; Decompressing : Boolean ) : Longint;
BEGIN
   DummyWriteCallBack := 0;
   {de-compressing - return bytes written}
   IF Decompressing THEN Write ( '-' );
END;

{***************** Compression & Decompression *****************}

{ Initialize data for compression or decompression }

PROCEDURE INITIALIZE;
VAR
   I : Integer;
BEGIN
  { Initialize Huffman frequency tree }
  FOR I := 2 TO TWICEMAX DO
    BEGIN
      Parent^ [I] := I DIV 2;
      Freq^ [I] := 1;
    END;
  FOR I := 1 TO MAXCHAR DO
    BEGIN
      LeftC^ [I] := 2 * I;
      RightC^ [I] := 2 * I + 1;
    END;
END;


{ Add node to head of list }
PROCEDURE Add_Node ( N : Integer );
VAR
  Key :  Integer;

BEGIN
{ Define hash key function using MINCOPY characters of string prefix }
  Key := ( Buffer^ [N] XOR ( Buffer^ [ ( N + 1 ) MOD MaxSize] SHL 4 ) ) XOR
                   ( Buffer^ [ ( N + 2 ) MOD Maxsize] SHL 8 ) AND HASHMASK;
  IF ( Head^ [Key] = NUL ) THEN
    BEGIN
      Tail^ [Key] := N;
      Next^ [N] := NUL;
    END
  ELSE
    BEGIN
      Next^ [N] := Head^ [Key];
      Prev^ [Head^ [Key]] := N;
    END;
  Head^ [Key] := N;
  Prev^ [N] := NUL;
END;

{ Delete node from tail of list }
PROCEDURE Delete_Node ( N : Integer );
VAR
  Key :  Integer;

BEGIN
{ Define hash key function using MINCOPY characters of string prefix }
  Key := ( Buffer^ [N] XOR ( Buffer^ [ ( N + 1 ) MOD MaxSize] SHL 4 ) ) XOR
                   ( Buffer^ [ ( N + 2 ) MOD Maxsize] SHL 8 ) AND HASHMASK;
  IF ( Head^ [Key] = Tail^ [Key] ) THEN
    Head^ [Key] := NUL
  ELSE
    BEGIN
      Next^ [Prev^ [Tail^ [Key]]] := NUL;
      Tail^ [Key] := Prev^ [Tail^ [Key]];
    END;
END;


{ Find longest string matching lookahead buffer string }
FUNCTION Match ( N, Depth : Integer ) : Integer;
LABEL 1;
VAR
   I, J, Index, Key, Dist, Len, Best, Count  : Integer;
BEGIN
  Best := 0;
  Count := 0;

  IF ( N = MaxSize ) THEN
    N := 0;

{ Define hash key function using MINCOPY characters of string prefix }
  Key := ( Buffer^ [N] XOR ( Buffer^ [ ( N + 1 ) MOD MaxSize] SHL 4 ) ) XOR
                   ( Buffer^ [ ( N + 2 ) MOD Maxsize] SHL 8 ) AND HASHMASK;
  Index := Head^ [Key];
  WHILE ( Index <> NUL ) DO
    BEGIN
      INC ( Count );
      IF ( Count > Depth ) THEN GOTO 1;     { Quit IF depth exceeded }
      IF ( Buffer^ [ ( N + Best ) MOD MaxSize] = Buffer^ [ ( Index + Best ) MOD MaxSize] ) THEN
        BEGIN
          Len := 0;
          I := N;
          J := Index;
          WHILE ( Buffer^ [I] = Buffer^ [J] ) AND ( Len < MAXCOPY ) AND ( ( J <> N ) AND ( I <> Insrt ) ) DO
            BEGIN
              INC ( Len );
              INC ( I );
              IF ( I = MaxSize ) THEN
                I := 0;
              INC ( J );
              IF ( J = MaxSize ) THEN
                J := 0;
            END;
          Dist := N - Index;
          IF ( Dist < 0 ) THEN
            Dist := Dist + MaxSize;
          Dist := Dist - Len;
      { IF dict file, quit at shortest distance range }
          IF ( DictFile AND Dist > CopyMax [0] ) THEN GOTO 1;
          IF ( Len > Best ) AND ( Dist <= MaxDistance ) THEN
            BEGIN     { Update best match }
              IF ( Len > MINCOPY ) OR ( Dist <= CopyMax [SHORTRANGE + Binary] ) THEN
                BEGIN
                  Best := Len;
                  Distance := Dist;
                END;
            END;
        END;
      Index := Next^ [Index];
    END;
1 : Match := Best;
END;


{** Finite Window compression routines **}

CONST
  IDLE = 0;    { Not processing a COPYING }
  COPYING = 1;    { Currently processing COPYING }

{ Check first buffer for ordered dictionary file }
{ Better compression using short distance copies }

PROCEDURE Dictionary;
VAR
  i, j, k, count : Integer;
BEGIN
  I := 0;
  J := 0;
  Count := 0;

  { Count matching chars at start of adjacent lines }
  INC ( J );
  WHILE ( J < MINCOPY + MAXCOPY ) DO
    BEGIN
      IF ( Buffer^ [J - 1] = 10 ) THEN
        BEGIN
          K := J;
          WHILE ( Buffer^ [I] = Buffer^ [K] ) DO
            BEGIN
              INC ( I );
              INC ( K );
              INC ( count );
            END;
          I := J;
        END;
      INC ( J );
    END;
  { IF matching line prefixes > 25% assume dictionary }
  IF ( Count > ( MINCOPY + MAXCOPY ) DIV 4 ) THEN
    DictFile := 1;
END;

{ Update frequency counts from leaf to root }
PROCEDURE Update_Freq ( A, B : Integer );
BEGIN
  REPEAT
    Freq^ [Parent^ [A]] := Freq^ [A] + Freq^ [B];
    A := Parent^ [A];
    IF ( A <> ROOT ) THEN
      BEGIN
        IF ( LeftC^ [Parent^ [A]] = A ) THEN
          B := RightC^ [Parent^ [A]]
        ELSE B := LeftC^ [Parent^ [A]];
      END;
  UNTIL A = ROOT;

  { Periodically scale frequencies down by half to avoid overflow }
  { This also provides some local adaption and better compression }

  IF ( Freq^ [ROOT] = MAXFREQ ) THEN
    FOR A := 1 TO TWICEMAX DO
      Freq^ [a] := Freq^ [a] SHR 1;
END;

{ Update Huffman model for each character code }
PROCEDURE Update_Model ( Code : Integer );
VAR
  A, B, C, Ua, Uua : Integer;

BEGIN
  A := Code + SUCCMAX;
  INC ( Freq^ [A] );
  IF ( Parent^ [A] <> ROOT ) THEN
    BEGIN
      ua := Parent^ [a];
      IF ( LeftC^ [ua] = a ) THEN update_freq ( a, RightC^ [ua] )
      ELSE update_freq ( a, LeftC^ [ua] );
      REPEAT
        uua := Parent^ [ua];
        IF ( LeftC^ [uua] = ua ) THEN
          b := RightC^ [uua]
        ELSE b := LeftC^ [uua];

        { IF high Freq lower in tree, swap nodes }
        IF Freq^ [a] > Freq^ [b] THEN
          BEGIN
            IF LeftC^ [Uua] = ua THEN
              RightC^ [Uua] := A
            ELSE LeftC^ [Uua] := A;
            IF ( LeftC^ [ua] = a ) THEN
              BEGIN
                LeftC^ [Ua] := B;
                C := RightC^ [ua];
              END
            ELSE
              BEGIN
                RightC^ [Ua] := B;
                C := LeftC^ [Ua];
              END;
            Parent^ [b] := Ua;
            Parent^ [a] := Uua;
            Update_Freq ( B, C );
            A := B;
          END;
        A := Parent^ [A];
        Ua := Parent^ [A];
      UNTIL Ua = ROOT;
    END;
END;

{ Encode file from input to output }
FUNCTION LH6Encode;

{******* Compression Routines *******}
{ Write one bit to output file }
PROCEDURE Output_Bit ( Bit : Integer );
VAR aResult : TLZSSWord;
BEGIN
  Output_Bit_Buffer := Output_Bit_Buffer SHL 1;
  IF Boolean ( Bit ) THEN Output_Bit_Buffer := Output_Bit_Buffer OR 1;
  INC ( OutPut_Bit_Count );
  IF ( Output_Bit_Count = 16 ) THEN
    BEGIN
      WdBuf^ [OutBufCount] := Output_Bit_Buffer;
      INC ( OutBufCount );
      Output_Bit_Count := 0;
      INC ( Bytes_Out, 2 );
      IF OutBufCount = MAXBUF THEN
        BEGIN
          BlockWrite ( OutFile, WdBuf^, MAXBUF * 2, aResult );
          IF Assigned ( LH6WriteProc ) THEN LH6WriteProc ( aResult, False );
          OutBufCount := 0;
        END;
    END;
END;


{ Write multibit code to output file }
PROCEDURE Output_Code ( Code, Bits : Integer );
VAR
  I : Integer;
BEGIN
  FOR I := 0 TO PRED ( Bits ) DO
    BEGIN
      Output_Bit ( Code AND $1 );
      Code := Code SHR 1;
    END;
END;


{ Flush any remaining bits to output file before closing file }
PROCEDURE Flush_Bits;
VAR
aResult : TLZSSWord;
BEGIN
  IF ( Output_Bit_Count > 0 ) THEN
    BEGIN
      Output_Bit_Buffer := Output_Bit_Buffer SHL ( 16 - Output_Bit_Count );
      WdBuf^ [OutBufCount] := Output_Bit_Buffer;
      INC ( OutBufCount );
      Output_Bit_Count := 0;
      INC ( Bytes_Out, 2 );
    END;
  BlockWrite ( OutFile, WdBuf^, OutBufCount * 2, aResult );
  IF Assigned ( LH6WriteProc ) THEN LH6WriteProc ( aResult, False );
END;

{ Compress a character code to output stream }
PROCEDURE Compress ( code : Integer );
VAR
  a, sp : Integer;
  Stack : ARRAY [0..49] OF Integer;
BEGIN
  Sp := 0;
  A := Code + SUCCMAX;
  REPEAT
    Stack [Sp] := Integer ( RightC^ [Parent^ [A]] = A );
    INC ( Sp );
    A := Parent^ [A];
  UNTIL ( A = ROOT );

  REPEAT
    DEC ( Sp );
    Output_Bit ( Stack [Sp] );
  UNTIL sp = 0;
  Update_Model ( Code );
END;

{** Hash table linked list string search routines **}

LABEL 1, 2;

VAR
  C, I, N, Addpos, Len, Full, State, Nextlen, aResult : Integer;

BEGIN  { LH6Encode }
  Insrt := MINCOPY;
  Dictfile := 0;
  Binary := 0;
  Input_Bit_Count := 0;           { Input bits buffered }
  Input_Bit_Buffer := 0;          { Input buffer }
  Output_Bit_Count := 0;          { Output bits buffered }
  Output_Bit_Buffer := 0;         { Output buffer }
  Bytes_In := 0;
  Bytes_Out := 0;                 { File size counters }
  InBufCount := 0;

  N := MINCOPY;
  Addpos := 0;
  Len := 0;
  Full := 0;
  State := IDLE;

  New ( InBuf );
  New ( WdBuf );
  GetMem ( Head, HASHSIZE * Sizeof ( INTEGER ) );
  GetMem ( Tail, HASHSIZE * Sizeof ( INTEGER ) );
  GetMem ( Next, MaxSize * Sizeof ( INTEGER ) );
  GetMem ( Prev, MaxSize * Sizeof ( INTEGER ) );
  GetMem ( Buffer, MaxSize * Sizeof ( BYTE ) );

  IF ( head = NIL ) OR ( Tail = NIL ) OR ( Next = NIL ) OR ( Prev = NIL ) OR ( Buffer = NIL ) THEN
    BEGIN
      Dispose ( Wdbuf );
      Dispose ( InBuf );
      IF Head <> NIL THEN FreeMem ( Head, HASHSIZE * Sizeof ( INTEGER ) );
      IF Tail <> NIL THEN FreeMem ( Tail, HASHSIZE * Sizeof ( INTEGER ) );
      IF Next <> NIL THEN FreeMem ( Next, MaxSize * Sizeof ( INTEGER ) );
      IF Prev <> NIL THEN FreeMem ( Prev, MaxSize * Sizeof ( INTEGER ) );
      IF Buffer <> NIL THEN FreeMem ( buffer, MaxSize * Sizeof ( BYTE ) );
      LH6Encode := LZCode_MemAllocFailure;
      Exit;
    END;

  InitVars;

  INITIALIZE;

  { Initialize hash table to empty }
  FOR I := 0 TO PRED ( HASHSIZE ) DO
    BEGIN
      Head^ [I] := NUL;
    END;

  BlockRead ( InFile, InBuf^, MAXBUF, aResult );
  IF Assigned ( LH6ReadProc ) THEN LH6ReadProc ( aResult, False );
  { Compress first few characters using Huffman }
  FOR I := 0 TO PRED ( MINCOPY ) DO
    BEGIN
      C := InBuf^ [InBufCount];
      INC ( InBufCount );
      IF InBufCount = aResult THEN
        BEGIN
          Compress ( TERMINATE );
          Flush_bits;
          FreeMem ( Head, HASHSIZE * Sizeof ( INTEGER ) );
          FreeMem ( Tail, HASHSIZE * Sizeof ( INTEGER ) );
          FreeMem ( Next, MaxSize * Sizeof ( INTEGER ) );
          FreeMem ( Prev, MaxSize * Sizeof ( INTEGER ) );
          FreeMem ( buffer, MaxSize * Sizeof ( BYTE ) );
          Dispose ( Wdbuf );
          Dispose ( InBuf );
          LH6Encode := Bytes_out;
          FreeVars;
          Exit;
        END;
      Compress ( C );
      INC ( Bytes_In );
      Buffer^ [I] := C;
  END; { for i }


  { Preload next few characters into lookahead buffer }
  FOR I := 0 TO PRED ( MAXCOPY ) DO
    BEGIN
      C := InBuf^ [InBufCount];
      INC ( InBufCount );
      IF InBufCount = aResult THEN GOTO 1;
      Buffer^ [Insrt] := C;
      INC ( Insrt );
      INC ( Bytes_In );
      IF ( C > 127 ) THEN
        Binary := 1;     { Binary file ? }
    END;

1 :
  Dictionary;  { Check for dictionary file }

  WHILE ( N <> Insrt ) DO
    BEGIN
    { Check compression to insure really a dictionary file }
      IF ( Boolean ( dictfile ) AND ( ( Bytes_In MOD MAXCOPY ) = 0 ) ) THEN
        IF ( Bytes_In / Bytes_Out < 2 ) THEN
          Dictfile := 0;     { Oops, not a dictionary file ! }

    { Update nodes in hash table lists }
      IF BOOLEAN ( Full )  THEN Delete_Node ( Insrt );
      Add_node ( Addpos );

    { IF doing COPYING, process character, ELSE check for new COPYING }
      IF ( State = COPYING ) THEN
        BEGIN
          DEC ( Len );
          IF ( len = 1 ) THEN
            State := IDLE;
        END
      ELSE
        BEGIN

      { Get match length at next character and current char }
          IF BOOLEAN ( binary ) THEN
            BEGIN
              Nextlen := Match ( N + 1, BINNEXT );
              Len := Match ( N, BINSEARCH );
            END
          ELSE
            BEGIN
              Nextlen := Match ( N + 1, TEXTNEXT );
              Len := Match ( N, TEXTSEARCH );
            END;

      { IF long enough and no better match at next char, start COPYING }
          IF ( Len >= MINCOPY ) AND ( len >= NextLen ) THEN
            BEGIN
              State := COPYING;

        { Look up minimum bits to encode distance }
              FOR I := 0 TO PRED ( COPYRANGES ) DO
                BEGIN
                  IF ( distance <= CopyMax [i] ) THEN
                    BEGIN
                      Compress ( FIRSTCODE - MINCOPY + Len + I * CODESPERRANGE );
                      Output_code ( Distance - CopyMin [I], CopyBits [I] );
                      GOTO 2;
                    END;
                END;
2 :
            END
          ELSE   { ELSE output single literal character }
            Compress ( Buffer^ [N] );
        END;

    { Advance buffer pointers }
      INC ( N );
      IF ( N = MaxSize ) THEN
        N := 0;
      INC ( Addpos );
      IF ( Addpos = MaxSize ) THEN
        Addpos := 0;

    { Add next input character to buffer }
      IF InBufCount < aResult THEN
        BEGIN
          C := InBuf^ [InBufCount];
          INC ( InBufCount );
          IF InBufCount = MAXBUF THEN
            BEGIN
              BlockRead ( InFile, InBuf^, MAXBUF, aResult );
              IF Assigned ( LH6ReadProc ) THEN LH6ReadProc ( aResult, False );
              InBufCount := 0;
            END;
          Buffer^ [Insrt] := C;
          Inc ( Insrt );
          INC ( Bytes_In );
          IF ( Insrt = MaxSize ) THEN
            BEGIN
              Insrt := 0;
              Full := 1;
            END;
        END
      ELSE Full := 0;
    END;

  { Output EOF code and free memory }
  compress ( TERMINATE );
  Flush_Bits;
  LH6Encode := Bytes_out;
  FreeMem ( Head, HASHSIZE * Sizeof ( INTEGER ) );
  FreeMem ( Tail, HASHSIZE * Sizeof ( INTEGER ) );
  FreeMem ( Next, MaxSize * Sizeof ( INTEGER ) );
  FreeMem ( Prev, MaxSize * Sizeof ( INTEGER ) );
  FreeMem ( buffer, MaxSize * Sizeof ( BYTE ) );
  Dispose ( WDBuf );
  Dispose ( InBuf );
  FreeVars;
  Head := NIL;
  Tail := NIL;
  Prev := NIL;
  Next := NIL;
  WdBuf := NIL;
  InBuf := NIL;
  Buffer := NIL;
END;   { LH6Encode }

{ Decode file from input to output }
FUNCTION LH6Decode;

{** Decompression Routines ****}
{ Read multibit code from input file }
FUNCTION Input_Code ( Bits : Integer ) : Longint;
CONST
  Bit : ARRAY [1..14] OF WORD = ( 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024,
                                2048, 4096, 8192 );
VAR
  I, aResult : TLZSSWord;
  Code : Longint;
BEGIN
  Code := 0;
  FOR I := 1 TO Bits DO
    BEGIN
      IF ( Input_Bit_Count = 0 ) THEN
        BEGIN
          IF ( InBufCount = MAXBUF ) THEN
            BEGIN
              BlockRead ( InFile, WdBuf^, MAXBUF * 2, aResult );
              INC ( Bytes_In, aResult );
              InBufCount := 0;
              IF ( aResult = 0 ) THEN
                BEGIN
                  Input_Code := LZCode_EndOfFileError;
                  Exit;
                END;
              IF Assigned ( LH6ReadProc ) THEN LH6ReadProc ( aResult, True );
            END;
          Input_Bit_Buffer := Wdbuf^ [InBufCount];
          INC ( InBufCount );
          Input_Bit_Count := 15;
        END
      ELSE DEC ( Input_Bit_Count );
      IF Input_Bit_Buffer > $7FFF THEN Code := Code OR Bit [I];
      Input_Bit_Buffer :=  Input_Bit_Buffer SHL 1;
    END;
  Input_Code := Code;
END;


{ Uncompress a character code from input stream }
FUNCTION Uncompress : Longint;
VAR
  aResult : TLZSSWord;
  A : Longint;
BEGIN
  A := 1;
  REPEAT
    IF Input_Bit_Count = 0 THEN
      BEGIN
        IF InBufCount = MAXBUF THEN
          BEGIN
            BlockRead ( InFile, WdBuf^, MAXBUF * 2, aResult );
            INC ( Bytes_In, aResult );
            IF ( aResult = 0 ) THEN
              BEGIN
                UnCompress := LZCode_EndOfFileError;
                Exit;
              END;
            IF Assigned ( LH6ReadProc ) THEN LH6ReadProc ( aResult, True );
            InBufCount := 0;
          END;
        Input_Bit_Buffer := WdBuf^ [InBufCount];
        INC ( InBufCount );
        Input_Bit_Count := 15;
      END
    ELSE DEC ( Input_Bit_Count );
    IF Input_Bit_Buffer > $7FFF THEN
      A := RightC^ [A]
    ELSE A := LeftC^ [A];
    Input_Bit_Buffer := Input_Bit_Buffer SHL 1;
  UNTIL A > MAXCHAR;
  DEC ( A, SUCCMAX );
  Update_Model ( A );
  Uncompress := A;
END;


VAR
  I, J, Dist, Len, Index, K, T : INTEGER;
  N, aResult, C : TLZSSWord;

BEGIN  { LH6Decode }
  Insrt := MINCOPY;
  Dictfile := 0;
  Binary := 0;
  Input_Bit_Count := 0;           { Input bits buffered }
  Input_Bit_Buffer := 0;          { Input buffer }
  Output_Bit_Count := 0;          { Output bits buffered }
  Output_Bit_Buffer := 0;         { Output buffer }
  Bytes_In := 0;
  Bytes_Out := 0;                 { File size counters }

  InitVars;

  New ( WDBuf );
  New ( OutBuf );

  N := 0;
  InBufCount := MAXBUF;
  INITIALIZE;
  GetMem ( Buffer, MaxSize * Sizeof ( BYTE ) );
  IF ( Buffer = NIL ) THEN
    BEGIN
      Dispose ( OutBuf );
      Dispose ( WdBuf );
      LH6Decode := LZCode_MemAllocFailure;
      FreeVars;
      Exit;
    END;
  C := Uncompress;
  IF C = LZCode_EndOfFileError THEN BEGIN
     Dispose ( OutBuf );
     Dispose ( WdBuf );
     FreeMem ( buffer, MaxSize * Sizeof ( BYTE ) );
     LH6Decode := C;
     FreeVars;
     Exit;
  END;

  WHILE ( C <> TERMINATE ) DO
    BEGIN
      IF ( C < 256 ) THEN
        BEGIN     { Single literal character ? }
          OutBuf^ [OutBufCount] := C;
          INC ( OutBufCount );
          IF OutBufCount = MAXBUF THEN
            BEGIN
              BlockWrite ( OutFile, OutBuf^, MAXBUF, aResult );
              OutBufCount := 0;
              INC ( Bytes_Out, aResult );
              IF Assigned ( LH6WriteProc ) THEN LH6WriteProc ( aResult, True );
            END;
          Buffer^ [N] := C;
          INC ( N );
          IF ( N = MaxSize ) THEN
            N := 0;
        END
      ELSE
        BEGIN            { ELSE string copy length/distance codes }
          T := C - FIRSTCODE;
          Index := ( T ) DIV CODESPERRANGE;
          Len := T + MINCOPY - Index * CODESPERRANGE;
          Dist := Input_Code ( CopyBits [Index] ) + Len + CopyMin [Index];
          IF Dist = LZCode_EndOfFileError
          THEN BEGIN
             Dispose ( OutBuf );
             Dispose ( WdBuf );
             FreeMem ( buffer, MaxSize * Sizeof ( BYTE ) );
             LH6Decode := Dist;
             FreeVars;
             Exit;
          END;
          J := N;
          K := N - Dist;
          IF ( K < 0 ) THEN
            INC ( K, MaxSize );
          FOR i := 0 TO PRED ( Len ) DO
            BEGIN
              OutBuf^ [OutBufCount] := Buffer^ [K];
              INC ( OutBufCount );
              IF OutBufCount = MAXBUF THEN
                BEGIN
                  BlockWrite ( OutFile, OutBuf^, MAXBUF, aResult );
                  OutBufCount := 0;
                  INC ( Bytes_Out, aResult );
                  IF Assigned ( LH6WriteProc ) THEN LH6WriteProc ( aResult, True );
                END;
              Buffer^ [J] := Buffer^ [K];
              INC ( J );
              INC ( K );
              IF ( J = Maxsize ) THEN J := 0;
              IF ( K = Maxsize ) THEN K := 0;
            END;
          INC ( N, Len );
          IF ( N >= Maxsize ) THEN
            DEC ( N, MaxSize );
        END;
      C := Uncompress;
      IF C = LZCode_EndOfFileError THEN BEGIN
         Dispose ( OutBuf );
         Dispose ( WdBuf );
         FreeMem ( buffer, MaxSize * Sizeof ( BYTE ) );
         LH6Decode := C;
         FreeVars;
         Exit;
      END;
    END;
  BlockWrite ( OutFile, OutBuf^, OutBufCount, aResult );
  INC ( Bytes_Out, aResult );
  IF Assigned ( LH6WriteProc ) THEN LH6WriteProc ( aResult, True );
  LH6Decode := Bytes_Out;
  FreeMem ( buffer, MaxSize * Sizeof ( BYTE ) );
  Dispose ( OutBuf );
  Dispose ( WdBuf );
  Buffer := NIL;
  WdBuf := NIL;
  OutBuf := NIL;
  FreeVars;
END;   { LH6Decode }

FUNCTION LZInit : boolean;
BEGIN
  IF IsLH6Initialized THEN BEGIN
      LZInit := False;
      Exit;
  END;
  LZInit := TRUE;
  IsLH6Initialized := TRUE;
END;

PROCEDURE LZDone;
BEGIN
  IsLH6Initialized := False;
END;

FUNCTION EncodeFile ( CONST Src, Dest : LZHString;CallBack : TLH6CallBack ) : Longint;
VAR
SrcFile, DestFile : LZFile;
OldCallBack : TLH6CallBack;

BEGIN
   EncodeFile := - 1;        {can't open source file}
   Assign ( SrcFile, Src );
   Assign ( DestFile, Dest );
   Reset ( SrcFile, 1 );
   IF IoResult <> 0 THEN exit;
   EncodeFile := - 2;        {can't create target file}
   Rewrite ( DestFile, 1 );
   IF IoResult <> 0 THEN BEGIN
      Close ( SrcFile );
      exit;
   END;
   OldCallBack := LH6ReadProc;
   LH6ReadProc := CallBack;
   EncodeFile := LH6Encode ( SrcFile, DestFile );
   LH6ReadProc := OldCallBack;
   Close ( SrcFile );
   Close ( DestFile );
END;

FUNCTION DecodeFile ( CONST Src, Dest : LZHString;CallBack : TLH6CallBack ) : Longint;
VAR
SrcFile, DestFile : LZFile;
OldCallBack : TLH6CallBack;

BEGIN
   DecodeFile := - 1;
   Assign ( SrcFile, Src );
   Assign ( DestFile, Dest );
   Reset ( SrcFile, 1 );
   IF IoResult <> 0 THEN exit;
   DecodeFile := - 2;
   Rewrite ( DestFile, 1 );
   IF IoResult <> 0 THEN BEGIN
      Close ( SrcFile );
      exit;
   END;
   OldCallBack := LH6WriteProc;
   LH6WriteProc := CallBack;
   DecodeFile := LH6Decode ( SrcFile, DestFile );
   LH6WriteProc := OldCallBack;
   Close ( SrcFile );
   Close ( DestFile );
END;

{  ( initialisation )  }
BEGIN
     (*
     LH6ReadProc  := DummyReadCallBack;
     LH6WriteProc := DummyWriteCallBack;
     *)
END.

