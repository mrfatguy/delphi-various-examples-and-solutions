{$G+}

UNIT LZSS16;
{
   LZSSUNIT - Compress and uncompress unit using LZ77 algorithm for
   Borland (Turbo) Pascal version 7.0.

   Assembler Programmer: Andy Tam, Pascal Conversion: Douglas Webb,
   Unit Conversion and Dynamic Memory Allocation: Andrew Eigus.

   Written by Andrew Eigus (aka: Mr. Byte) of:
   Fidonet: 2:5100/33,
   Internet: aeigus@fgate.castle.riga.lv, aeigus@kristin.cclu.lv.

   Modified again by Chris Rankin: apart from a few minor tweaks to the
   code, the only real change is the grouping together of TextBuf, Left,
   Right and Mom into a (large!) record which is allocated in a single
   segment on the Heap. This enables ES to be loaded ONCE at the beginning
   of LZEncode and LZDecode, *drastically* reducing the number of segment
   loads during a typical LZ call. This should enhance performance,
   especially under DPMI and Windows.


   Public Domain version 1.10, last changed on 15.07.96.
   Target platforms: DOS, DPMI, Windows.

}

{
THIS CODE WILL COMPILE FOR THE FOLLOWING PLATFORMS;
     Dos Real mode - TP7, BP7
     Dos DPMI      - BP7, BPW
     Win16         - BPW, TPW, Delphi 1.x

     Dr Abimbola A Olowofoyeku (The African Chief);
     Email:  laa12@keele.ac.uk
     http://ourworld.compuserve.com/homepages/African_Chief/
}


INTERFACE

{#Z+}
{ This unit is ready for use with Dj. Murdoch's ScanHelp utility which
  will make a Borland .TPH file for it ????? }
{#Z-}

TYPE
  TLZSSWord = word;

CONST Log2TLZSSWord = 1;

CONST
  LZRWBufSize     = 32000{8192}; { Read buffer size }

{#Z+}
  N           = 4096;  { Bigger N -> Better compression on big files only. }
  F           = 18;
  Threshold   = 2;
  Nul         = N * SizeOf ( TLZSSWord );
  InBufPtr    : TLZSSWord = LZRWBufSize;
  InBufSize   : TLZSSWord = LZRWBufSize;
  OutBufPtr   : TLZSSWord = 0;
{#Z-}

TYPE
{#X TWriteProc}{#X LZSquash}{#X LZUnsquash}

  TReadProc = FUNCTION ( VAR ReadBuf ) : TLZSSWord;
  { This is declaration for custom read function. It should read
    #LZRWBufSize# bytes from ReadBuf, returning the number of bytes
    actually read. }

{#X TReadProc}{#X LZSquash}{#X LZUnsquash}
  TWriteProc = FUNCTION ( VAR WriteBuf;
                            Count : TLZSSWord ) : TLZSSWord;
  { This is declaration for custom write function. It should write
    Count bytes into WriteBuf, returning the number of actual bytes
    written. }

{#Z+}
  PLZRWBuffer = ^TLZRWBuffer;
  TLZRWBuffer = ARRAY [ 0..LZRWBufSize - 1 ] OF Byte; { file buffers }

  PLZTextBuf = ^TLZTextBuf;
  TLZTextBuf = ARRAY [ 0..N + F - 2 ] OF Byte;

  PLeftMomTree = ^TLeftMomTree;
  TLeftMomTree = ARRAY [ 0..N ] OF TLZSSWord;
  PRightTree = ^TRightTree;
  TRightTree = ARRAY [ 0..N + 256 ] OF TLZSSWord;

  PBinaryTree = ^TBinaryTree;
  TBinaryTree = RECORD
                  TextBuf : TLZTextBuf;
                  Left :    TLeftMomTree;
                  Right :   TRightTree;
                  Mom :     TLeftMomTree
                END;
CONST
  LZSSMemRequired = SizeOf ( TLZRWBuffer ) * 2 + SizeOf ( TBinaryTree );
{#Z-}

FUNCTION LZInit : boolean;
{ This function should be called before any other compression routines
  from this unit - it allocates memory and initializes all internal
  variables required by compression procedures. If allocation fails,
  LZInit returns False, this means that there isn't enough memory for
  compression or decompression process. It returns True if initialization
  was successful. }
{#X LZDone}{#X LZSquash}{#X LZUnsquash}

PROCEDURE LZSquash ( ReadProc : TReadProc; WriteProc : TWriteProc );
{ This procedure is used for compression. ReadProc specifies custom
  read function that reads data, and WriteProc specifies custom write
  function that writes compressed data. }
{#X LZUnsquash}{#X LZInit}{#X LZDone}

PROCEDURE LZUnSquash ( ReadProc : TReadProc; WriteProc : TWriteProc );
{ This procedure is used for decompression. ReadProc specifies custom
  read function that reads compressed data, and WriteProc specifies
  custom write function that writes decompressed data. }
{#X LZSquash}{#X LZInit}{#X LZDone}

PROCEDURE LZDone;
{ This procedure should be called after you finished compression or
  decompression. It deallocates (frees) all memory allocated by LZInit.
  Note: You should always call LZDone after you finished using compression
  routines from this unit. }
{#X LZInit}{#X LZSquash}{#X LZUnsquash}

PROCEDURE LZEncode;
PROCEDURE LZDecode;

{#Z+}
CONST BinaryTree : PBinaryTree = NIL;
CONST InBufP :     PLZRWBuffer = NIL;
CONST OutBufP :    PLZRWBuffer = NIL;

CONST IsLZInitialized : boolean = FALSE;

VAR
  Height, MatchPos, MatchLen, LastLen : TLZSSWord;
  CodeBuf : ARRAY [ 0..16 ] OF Byte;
  LZReadProc  : TReadProc;
  LZWriteProc : TWriteProc;
{#Z-}

IMPLEMENTATION

TYPE
  PtrRec = RECORD
             Ofs, Seg : word
           END;

FUNCTION LZSS_Read : TLZSSWord;    { Returns # of bytes read }
BEGIN
  LZSS_Read := LZReadProc ( InBufP^ );
END; { LZSS_Read }

FUNCTION LZSS_Write : TLZSSWord;  { Returns # of bytes written }
BEGIN
  LZSS_Write := LZWriteProc ( OutBufP^, OutBufPtr );
END; { LZSS_Write }

PROCEDURE GetC; ASSEMBLER;
ASM
{
  getc : return a character from the buffer
          RETURN : AL = input char
                   Carry set when EOF
}
              push    bx
              mov     bx, inBufPtr
              cmp     bx, inBufSize
              jb      @getc1
              push    cx
              push    dx
              push    di
              push    si
              push    es
              call    LZSS_Read
              pop     es
              pop     si
              pop     di
              pop     dx
              pop     cx
              mov     inBufSize, ax
              OR      ax, ax
              jnz     @NewBuf
              stc                         { ; set carry to indicate EOF }
              jmp     @Exit

  @NewBuf :    XOR     bx, bx

  @getc1 :     PUSH    DI
              PUSH    ES
              LES     DI, [ InBufP ]
              MOV     AL, [ ES : DI + BX ]
              POP     ES
              POP     DI
              inc     bx
              mov     inBufPtr, bx
              clc                         { ; clear the carry flag }

  @Exit :      pop bx
END; { Getc }

PROCEDURE PutC; ASSEMBLER;
{
  putc : put a character into the output buffer
             Entry : AL = output char
}
ASM
              push    bx
              mov     bx, outBufPtr
              PUSH    DI
              PUSH    ES
              LES     DI, [ OutBufP ]
              MOV     [ ES : DI + BX ], AL
              POP     ES
              POP     DI
              inc     bx
              cmp     bx, LZRWBufSize
              jb      @putc1
              mov     OutBufPtr, LZRWBufSize   { Just so the flush will work. }
              push    cx
              push    dx
              push    di
              push    si
              push    es
              call    LZSS_Write
              pop     es
              pop     si
              pop     di
              pop     dx
              pop     cx
              XOR     bx, bx
  @putc1 :     mov     outBufPtr, bx
              pop     bx
END; { Putc }

PROCEDURE InitTree; ASSEMBLER;
{
  initTree : initialize all binary search trees.  There are 256 BST's, one
             for all strings started with a particular character.  The
             parent is tree K is the node N + K + 1 and it has only a
             right child
}
ASM
      cld
      MOV     DI, PtrRec [ OFFSET BinaryTree ].Ofs
      ADD     DI, OFFSET TBinaryTree.Mom
      mov     cx, N + 1
      mov     ax, Nul
      rep     stosw
{                                                             }
{ Initialise last 256 elements to BinaryTree.Right to Nul ... }
{                                                             }
      add     di, OFFSET TBinaryTree.Right - OFFSET TBinaryTree.Mom
      mov     ch, ( 256 SHR 8 )
      rep     stosw
END; { InitTree }

PROCEDURE Splay; ASSEMBLER;
{
  splay : use splay tree operations to move the node to the 'top' of
           tree.  Note that it will not actual become the root of the tree
           because the root of each tree is a special node.  Instead, it
           will become the right child of this special node.

             ENTRY : di = the node to be rotated
}
ASM
  @Splay1 :
              PUSH    BX
              MOV     BX, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     SI, [ ES : BX + DI + OFFSET TBinaryTree.Mom ]
              POP     BX
{              mov     si, [Offset Mom + di]}
              cmp     si, Nul           { ; exit if its parent is a special node }
              ja      @Splay4
              MOV     BX, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     BX, [ ES : BX + SI + OFFSET TBinaryTree.Mom ]
{              mov     bx, [Offset Mom + si]}
              cmp     bx, Nul           { ; check if its grandparent is special }
              jbe     @Splay5           { ; if not then skip }
              PUSH    BX
              MOV     BX, PtrRec [ BinaryTree ].Ofs
              CMP     DI, [ ES : BX + SI + OFFSET TBinaryTree.Left ]
              POP     BX
{              cmp     di, [Offset Left + si]} { ; is the current node is a left child ? }
              jne     @Splay2
              PUSH    BX
              MOV     BX, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     DX, [ ES : BX + DI + OFFSET TBinaryTree.Right ]
{              mov     dx, [Offset Right + di]}    { ; perform a left zig operation }
              MOV     [ ES : BX + SI + OFFSET TBinaryTree.Left ], DX
{              mov     [Offset Left + si], dx}
              MOV     [ ES : BX + DI + OFFSET TBinaryTree.Right ], SI
              POP     BX
{              mov     [Offset Right + di], si}
              jmp     @Splay3
  @Splay2 :
              PUSH    BX
              MOV     BX, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     DX, [ ES : BX + DI + OFFSET TBinaryTree.Left ]
{              mov     dx, [Offset Left + di]}     { ; perform a right zig }
              MOV     [ ES : BX + SI + OFFSET TBinaryTree.Right ], DX
{              mov     [Offset Right + si], dx}
              MOV     [ ES : BX + DI + OFFSET TBinaryTree.Left ], SI
              POP     BX
{              mov     [Offset Left + di], si}
  @Splay3 :
              PUSH    SI
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     [ ES : SI + BX + OFFSET TBinaryTree.Right ], DI
              POP     SI
{              mov     [Offset Right + bx], di}
              xchg    bx, dx
              PUSH    AX
              MOV     AX, BX
              MOV     BX, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     BX, AX
              MOV     [ ES : BX + OFFSET TBinaryTree.Mom ], SI
              MOV     BX, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     [ ES : BX + SI + OFFSET TBinaryTree.Mom ], DI
              MOV     [ ES : BX + DI + OFFSET TBinaryTree.Mom ], DX
              MOV     BX, AX
              POP     AX
{              mov     [Offset Mom + bx], si
              mov     [Offset Mom + si], di
              mov     [Offset Mom + di], dx}
  @Splay4 :    jmp     @END
  @Splay5 :
              PUSH    DI
              MOV     DI, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     CX, [ ES : DI + BX + OFFSET TBinaryTree.Mom ]
              POP     DI
{              mov     cx, [Offset Mom + bx]}
              PUSH    BX
              MOV     BX, PtrRec [ OFFSET BinaryTree ].Ofs
              CMP     DI, [ ES : BX + SI + OFFSET TBinaryTree.Left ]
              POP     BX
{              cmp     di, [Offset Left + si]}
              jne     @Splay7
              PUSH    DI
              MOV     DI, PtrRec [ OFFSET BinaryTree ].Ofs
              CMP     SI, [ ES : DI + BX + OFFSET TBinaryTree.Left ]
              POP     DI
{              cmp     si, [Offset Left + bx]}
              jne     @Splay6
              PUSH    AX
              MOV     AX, DI
              MOV     DI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     DI, SI
              MOV     DX, [ ES : DI + OFFSET TBinaryTree.Right ]
{              mov     dx, [Offset Right + si]   } { ; perform a left zig-zig operation }
              MOV     DI, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     [ ES : DI + BX + OFFSET TBinaryTree.Left ], DX
{              mov     [Offset Left + bx], dx}
              xchg    bx, dx
              MOV     [ ES : DI + BX + OFFSET TBinaryTree.Mom ], DX
{              mov     [Offset Mom + bx], dx}
              ADD     DI, AX
              MOV     BX, [ ES : DI + OFFSET TBinaryTree.Right ]
{              mov     bx, [Offset Right + di]}
              MOV     DI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     DI, SI
              MOV     [ ES : DI + OFFSET TBinaryTree.Left ], BX
              MOV     DI, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     [ ES : DI + BX + OFFSET TBinaryTree.Mom ], SI
{              mov     [Offset Left +si], bx
              mov     [Offset Mom + bx], si}
              mov     bx, dx
              ADD     DI, SI
              MOV     [ ES : DI + OFFSET TBinaryTree.Right ], BX
              MOV     DI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     DI, AX
              MOV     [ ES : DI + OFFSET TBinaryTree.Right ], SI
{              mov     [Offset Right + si], bx
              mov     [Offset Right + di], si}
              MOV     DI, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     [ ES : DI + BX + OFFSET TBinaryTree.Mom ], SI
              ADD     DI, SI
              MOV     [ ES : DI + OFFSET TBinaryTree.Mom ], AX
              MOV     DI, AX
              POP     AX
{              mov     [Offset Mom + bx], si
              mov     [Offset Mom + si], di}
              jmp     @Splay9
  @Splay6 :
              PUSH    AX
              MOV     AX, SI
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     SI, DI
              MOV     DX, [ ES : SI + OFFSET TBinaryTree.Left ]
{              mov     dx, [Offset Left + di]}     { ; perform a left zig-zag operation }
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     [ ES : SI + BX + OFFSET TBinaryTree.Right ], DX
{              mov     [Offset Right + bx], dx}
              xchg    bx, dx
              MOV     [ ES : SI + BX + OFFSET TBinaryTree.Mom ], DX
{              mov     [Offset Mom + bx], dx}
              ADD     SI, DI
              MOV     BX, [ ES : SI + OFFSET TBinaryTree.Right ]
{              mov     bx, [Offset Right + di]}
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     SI, AX
              MOV     [ ES : SI + OFFSET TBinaryTree.Left ], BX
{              mov     [Offset Left + si], bx}
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     [ ES : SI + BX + OFFSET TBinaryTree.Mom ], AX
{              mov     [Offset Mom + bx], si}
              mov     bx, dx
              ADD     SI, DI
              MOV     [ ES : SI + OFFSET TBinaryTree.Left ], BX
{              mov     [Offset Left + di], bx}
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     SI, DI
              MOV     [ ES : SI + OFFSET TBinaryTree.Right ], AX
{              mov     [Offset Right + di], si}
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     SI, AX
              MOV     [ ES : SI + OFFSET TBinaryTree.Mom ], DI
{              mov     [Offset Mom + si], di}
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     [ ES : SI + BX + OFFSET TBinaryTree.Mom ], DI
              MOV     SI, AX
              POP     AX
{              mov     [Offset Mom + bx], di}
              jmp     @Splay9
  @Splay7 :
              PUSH    DI
              MOV     DI, PtrRec [ OFFSET BinaryTree ].Ofs
              CMP     SI, [ ES : DI + BX + OFFSET TBinaryTree.Right ]
              POP     DI
{              cmp     si, [Offset Right + bx]}
              jne     @Splay8
              PUSH    AX
              MOV     AX, SI
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     SI, AX
              MOV     DX, [ ES : SI + OFFSET TBinaryTree.Left ]
{              mov     dx, [Offset Left + si]}     { ; perform a right zig-zig }
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     [ ES : SI + BX + OFFSET TBinaryTree.Right ], DX
{              mov     [Offset Right + bx], dx}
              xchg    bx, dx
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     [ ES : SI + BX + OFFSET TBinaryTree.Mom ], DX
{              mov     [Offset Mom + bx], dx}
              ADD     SI, DI
              MOV     BX, [ ES : SI + OFFSET TBinaryTree.Left ]
{              mov     bx, [Offset Left + di]}
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     SI, AX
              MOV     [ ES : SI + OFFSET TBinaryTree.Right ], BX
{              mov     [Offset Right + si], bx}
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     [ ES : SI + BX + OFFSET TBinaryTree.Mom ], AX
{              mov     [Offset Mom + bx], si}
              mov     bx, dx
              ADD     SI, AX
              MOV     [ ES : SI + OFFSET TBinaryTree.Left ], BX
{              mov     [Offset Left + si], bx}
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     SI, DI
              MOV     [ ES : SI + OFFSET TBinaryTree.Left ], AX
{              mov     [Offset Left + di], si}
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     [ ES : SI + BX + OFFSET TBinaryTree.Mom ], AX
{              mov     [Offset Mom + bx], si}
              ADD     SI, AX
              MOV     [ ES : SI + OFFSET TBinaryTree.Mom ], DI
{              mov     [Offset Mom + si], di}
              MOV     SI, AX
              POP     AX
              jmp     @Splay9
  @Splay8 :
              PUSH    AX
              MOV     AX, SI
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     SI, DI
              MOV     DX, [ ES : SI + OFFSET TBinaryTree.Right ]
{              mov     dx, [Offset Right + di]}    { ; perform a right zig-zag }
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     [ ES : SI + BX + OFFSET TBinaryTree.Left ], DX
{              mov     [Offset Left + bx], dx}
              xchg    bx, dx
              MOV     [ ES : SI + BX + OFFSET TBinaryTree.Mom ], DX
{              mov     [Offset Mom + bx], dx}
              ADD     SI, DI
              MOV     BX, [ ES : SI + OFFSET TBinaryTree.Left ]
{              mov     bx, [Offset Left + di]}
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     SI, AX
              MOV     [ ES : SI + OFFSET TBinaryTree.Right ], BX
{              mov     [Offset Right + si], bx}
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     [ ES : SI + BX + OFFSET TBinaryTree.Mom ], AX
{              mov     [Offset Mom + bx], si}
              mov     bx, dx
              ADD     SI, DI
              MOV     [ ES : SI + OFFSET TBinaryTree.Right ], BX
{              mov     [Offset Right + di], bx}
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     SI, DI
              MOV     [ ES : SI + OFFSET TBinaryTree.Left ], AX
{              mov     [Offset Left + di], si}
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     SI, AX
              MOV     [ ES : SI + OFFSET TBinaryTree.Mom ], DI
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     [ ES : SI + BX + OFFSET TBinaryTree.Mom ], DI
{              mov     [Offset Mom + si], di
              mov     [Offset Mom + bx], di}
              MOV     SI, AX
              POP     AX
  @Splay9 :    mov     si, cx
              cmp     si, NUL
              ja      @Splay10
              PUSH    DI
              MOV     DI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     DI, SI
              CMP     BX, [ ES : DI + OFFSET TBinaryTree.Left ]
              POP     DI
{              cmp     bx, [Offset Left + si]}
              jne     @Splay10
              PUSH    BX
              MOV     BX, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     [ ES : BX + SI + OFFSET TBinaryTree.Left ], DI
              POP     BX
{              mov     [Offset Left + si], di}
              jmp     @Splay11
  @Splay10 :
              PUSH    BX
              MOV     BX, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     [ ES : BX + SI + OFFSET TBinaryTree.Right ], DI
              POP     BX
{              mov     [Offset Right + si], di}
  @Splay11 :
              PUSH    BX
              MOV     BX, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     [ ES : BX + DI + OFFSET TBinaryTree.Mom ], SI
              POP     BX
{              mov     [Offset Mom + di], si}
              jmp     @Splay1
  @END :
END; { SPlay }

PROCEDURE InsertNode; ASSEMBLER;
{
  insertNode : insert the new node to the corresponding tree.  Note that the
               position of a string in the buffer also served as the node
               number.
             ENTRY : di = position in the buffer
}
ASM
              push    si
              push    dx
              push    cx
              push    bx
              mov     dx, 1
              XOR     ax, ax
              mov     matchLen, ax
              mov     height, ax
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     SI, DI
              MOV     AL, BYTE PTR [ ES : SI ]
{             mov     al, byte ptr [Offset TextBuf + di]}
              SHL     di, Log2TLZSSWord
              add     ax, N + 1
              SHL     ax, Log2TLZSSWord
              mov     si, ax
              mov     ax, NUL
              PUSH    BX
              MOV     BX, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     [ ES : BX + DI + OFFSET TBinaryTree.Right ], AX
{              mov     word ptr [Offset Right + di], ax}
              MOV     [ ES : BX + DI + OFFSET TBinaryTree.Left ], AX
              POP     BX
{              mov     word ptr [Offset Left + di], ax}
  @Ins1 :      inc     height
              test    dx, dx
              mov     dx, Nul
              js      @Ins3
              PUSH    DI
              MOV     DI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     DI, SI
              MOV     AX, [ ES : DI + OFFSET TBinaryTree.Right ]
              POP     DI
{              mov     ax, word ptr [Offset Right + si]}
              cmp     ax, dx
              jne      @Ins5
              PUSH    BX
              MOV     BX, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     [ ES : BX + SI + OFFSET TBinaryTree.Right ], DI
{              mov     word ptr [Offset Right + si], di}
              MOV     [ ES : BX + DI + OFFSET TBinaryTree.Mom ], SI
              POP     BX
{              mov     word ptr [Offset Mom + di], si}
              jmp     @Ins11
  @Ins3 :
              PUSH    BX
              MOV     BX, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     AX, [ ES : BX + SI + OFFSET TBinaryTree.Left ]
              POP     BX
{              mov     ax, word ptr [Offset Left + si]}
              cmp     ax, dx
              jne      @Ins5
              PUSH    BX
              MOV     BX, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     [ ES : BX + SI + OFFSET TBinaryTree.Left ], DI
{              mov     word ptr [Offset Left + si], di}
              MOV     [ ES : BX + DI + OFFSET TBinaryTree.Mom ], SI
              POP     BX
{              mov     word ptr [Offset Mom + di], si}
              jmp     @Ins11

  @Ins5 :      mov     si, ax
              mov     bx, 1
              SHR     si, Log2TLZSSWord
              SHR     di, Log2TLZSSWord
              XOR     ch, ch
              XOR     dh, dh
  @Ins6 :
              PUSH    SI
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     SI, DI
              MOV     DL, [ ES : SI + BX ]
              POP     SI
              PUSH    DI
              MOV     DI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     DI, SI
              MOV     CL, [ ES : DI + BX ]
              POP     DI
{              mov     dl, byte ptr [Offset Textbuf + di + bx]
              mov     cl, byte ptr [Offset TextBuf + si + bx]}
              sub     dx, cx
              jnz     @Ins7
              inc     bx
              cmp     bx, F
              jb      @Ins6
  @Ins7 :      mov     ax, si
              SHL     si, Log2TLZSSWord
              SHL     di, Log2TLZSSWord
              cmp     bx, matchLen
              jbe     @Ins1
              mov     matchPos, ax
              mov     matchLen, bx
              cmp     bx, F
              jb      @Ins1
  @Ins8 :
              PUSH    CX
              MOV     BX, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     AX, [ ES : BX + SI + OFFSET TBinaryTree.Mom ]
{              mov     ax, word ptr [Offset Mom + si]}
              MOV     [ ES : BX + DI + OFFSET TBinaryTree.Mom ], AX
{              mov     word ptr [Offset Mom + di], ax}
              MOV     CX, [ ES : BX + SI + OFFSET TBinaryTree.Left ]
{              mov     bx, word ptr [Offset Left + si]}
              MOV     [ ES : BX + DI + OFFSET TBinaryTree.Left ], CX
{              mov     word ptr [Offset Left + di], bx}
              ADD     BX, CX
              MOV     [ ES : BX + OFFSET TBinaryTree.Mom ], DI
{              mov     word ptr [Offset Mom + bx], di}
              MOV     BX, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     CX, [ ES : BX + SI + OFFSET TBinaryTree.Right ]
{              mov     bx, word ptr [Offset Right + si]}
              MOV     [ ES : BX + DI + OFFSET TBinaryTree.Right ], CX
{              mov     word ptr [Offset Right + di], bx}
              ADD     BX, CX
              MOV     [ ES : BX + OFFSET TBinaryTree.Mom ], DI
{              mov     word ptr [Offset Mom + bx], di}
              MOV     BX, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     BX, [ ES : BX + SI + OFFSET TBinaryTree.Mom ]
{              mov     bx, word ptr [Offset Mom + si]}
              POP     CX
              PUSH    DI
              MOV     DI, PtrRec [ OFFSET BinaryTree ].Ofs
              CMP     SI, [ ES : DI + BX + OFFSET TBinaryTree.Right ]
              POP     DI
{              cmp     si, word ptr [Offset Right + bx]}
              jne     @Ins9
              PUSH    SI
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     [ ES : SI + BX + OFFSET TBinaryTree.Right ], DI
              POP     SI
{              mov     word ptr [Offset Right + bx], di}
              jmp     @Ins10
  @Ins9 :
              PUSH    SI
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     [ ES : SI + BX + OFFSET TBinaryTree.Left ], DI
              POP     SI
{              mov     word ptr [Offset Left + bx], di}
  @Ins10 :
              PUSH    DI
              MOV     DI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     DI, SI
              MOV     WORD PTR [ ES : DI + OFFSET TBinaryTree.Mom ], Nul
              POP     DI
{              mov     word ptr [Offset Mom + si], NUL}
  @Ins11 :     cmp     height, 30
              jb      @Ins12
              call    Splay
  @Ins12 :     pop     bx
              pop     cx
              pop     dx
              pop     si
              SHR     di, Log2TLZSSWord
END; { InsertNode }


PROCEDURE DeleteNode; ASSEMBLER;
{
   deleteNode : delete the node from the tree

            ENTRY : SI = position in the buffer
}
ASM
              push    di
              push    bx
              SHL     si, Log2TLZSSWord
              PUSH    DI
              MOV     DI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     DI, SI
              CMP     WORD PTR [ ES : DI + OFFSET TBinaryTree.Mom ], Nul
              POP     DI
{              cmp     word ptr [Offset Mom + si], NUL}   { ; if it has no parent then exit }
              je      @del7
              PUSH    DI
              MOV     DI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     DI, SI
              CMP     WORD PTR [ ES : DI + OFFSET TBinaryTree.Right ], Nul
              POP     DI
{              cmp     word ptr [Offset Right + si], NUL} { ; does it have right child ? }
              jne      @HasRight
              PUSH    BX
              MOV     BX, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     DI, [ ES : BX + SI + OFFSET TBinaryTree.Left ]
              POP     BX
{              mov     di, word ptr [Offset Left + si]}
              jmp     @del3
  @HasRight :  PUSH    BX
              MOV     BX, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     DI, [ ES : BX + SI + OFFSET TBinaryTree.Left ]
              POP     BX
{              mov     di, word ptr [Offset Left + si] }  { ; does it have left child ? }
              cmp     di, Nul
              jne     @HasLeft
              PUSH    BX
              MOV     BX, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     DI, [ ES : BX + SI + OFFSET TBinaryTree.Right ]
              POP     BX
{              mov     di, word ptr [Offset Right + si]}
              jmp     @del3
  @HasLeft :   PUSH    SI
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     SI, DI
              MOV     AX, [ ES : SI + OFFSET TBinaryTree.Right ]
              POP     SI
{              mov     ax, word ptr [Offset Right + di]}  { ; does it have right grandchild ? }
              cmp     ax, Nul
              je      @del2                             { ; if no then skip }
  @del1 :      mov     di, ax                            { ; find the rightmost node in }
              PUSH    SI
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     SI, DI
              MOV     AX, [ ES : SI + OFFSET TBinaryTree.Right ]
              POP     SI
{              mov     ax, word ptr [Offset Right + di] } { ;   the right subtree }
              cmp     ax, Nul
              jne     @del1
              PUSH    CX
              MOV     CX, SI
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     SI, DI
              MOV     BX, [ ES : SI + OFFSET TBinaryTree.Mom ]
{              mov     bx, word ptr [Offset Mom + di] }   { ; move this node as the root of }
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     SI, DI
              MOV     AX, [ ES : SI + OFFSET TBinaryTree.Left ]
{              mov     ax, word ptr [Offset Left + di]}   { ;   the subtree }
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     [ ES : SI + BX + OFFSET TBinaryTree.Right ], AX
{              mov     word ptr [Offset Right + bx], ax}
              xchg    ax, bx
              MOV     [ ES : SI + BX + OFFSET TBinaryTree.Mom ], AX
{              mov     word ptr [Offset Mom + bx], ax}
              ADD     SI, CX
              MOV     BX, [ ES : SI + OFFSET TBinaryTree.Left ]
{              mov     bx, word ptr [Offset Left + si]}
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     SI, DI
              MOV     [ ES : SI + OFFSET TBinaryTree.Left ], BX
{              mov     word ptr [Offset Left + di], bx}
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     [ ES : SI + BX + OFFSET TBinaryTree.Mom ], DI
{              mov     word ptr [Offset Mom + bx], di}
              MOV     SI, CX
              POP     CX
  @del2 :
              PUSH    CX
              MOV     CX, SI
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     SI, CX
              MOV     BX, [ ES : SI + OFFSET TBinaryTree.Right ]
{              mov     bx, word ptr [Offset Right + si]}
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     SI, DI
              MOV     [ ES : SI + OFFSET TBinaryTree.Right ], BX
{              mov     word ptr [Offset Right + di], bx}
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     [ ES : SI + BX + OFFSET TBinaryTree.Mom ], DI
              MOV     SI, CX
              POP     CX
{              mov     word ptr [Offset Mom + bx], di}
  @del3 :
              PUSH    CX
              MOV     CX, DI
              MOV     DI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     DI, SI
              MOV     BX, [ ES : DI + OFFSET TBinaryTree.Mom ]
{              mov     bx, word ptr [Offset Mom + si]}
              MOV     DI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     DI, CX
              MOV     [ ES : DI + OFFSET TBinaryTree.Mom ], BX
{              mov     word ptr [Offset Mom + di], bx}
              MOV     DI, CX
              POP     CX
              PUSH    DI
              MOV     DI, PtrRec [ OFFSET BinaryTree ].Ofs
              CMP     SI, [ ES : DI + BX + OFFSET TBinaryTree.Right ]
              POP     DI
{              cmp     si, word ptr [Offset Right + bx]}
              jne     @del4
              PUSH    SI
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     [ ES : SI + BX + OFFSET TBinaryTree.Right ], DI
              POP     SI
{              mov     word ptr [Offset Right + bx], di}
              jmp     @del5
  @del4 :
              PUSH    SI
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     [ ES : SI + BX + OFFSET TBinaryTree.Left ], DI
              POP     SI
{              mov     word ptr [Offset Left + bx], di}
  @del5 :
              PUSH    DI
              MOV     DI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     DI, SI
              MOV     WORD PTR [ ES : DI + OFFSET TBinaryTree.Mom ], Nul
              POP     DI
{              mov     word ptr [Offset Mom + si], NUL}
  @del7 :      pop     bx
              pop     di
              SHR     si, Log2TLZSSWord
  @END :
END; { DeleteNode }

PROCEDURE LZEncode; ASSEMBLER;
ASM
{                                                   }
{ Load ES with segment of Binary Tree structure ... }
{                                                   }
              MOV     ES, PtrRec [ OFFSET BinaryTree ].&Seg
{                }
{ Now encode ... }
{                }
              call    initTree
              XOR     bx, bx
              mov     [ Offset CodeBuf ], bl
              mov     dx, 1
              mov     ch, dl
              XOR     si, si
              mov     di, N - F
  @Encode2 :   call    getc
              jnc     @ReadOK
              OR      bx, bx
              je      @Encode19
              jmp     @Encode4
  @ReadOK :    PUSH    SI
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     SI, DI
              MOV     [ ES : SI + BX ], AL
              POP     SI
{              mov     byte ptr [Offset TextBuf +di + bx], al}
              inc     bx
              cmp     bx, F
              jb      @Encode2
  @Encode4 :   mov     cl, bl
              XOR     bx, bx
              push    di
              dec     di
  @Encode5 :   call    InsertNode
              inc     bx
              dec     di
              cmp     bx, F
              jb      @Encode5
              pop     di
              call    InsertNode
  @Encode6 :   mov     ax, matchLen
              cmp     al, cl
              jbe     @Encode7
              mov     al, cl
              mov     matchLen, ax
  @Encode7 :   cmp     al, THRESHOLD
              ja      @Encode8
              mov     matchLen, 1
              OR      byte ptr codeBuf, ch
              mov     bx, dx
              PUSH    SI
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     SI, DI
              MOV     AL, [ ES : SI ]
              POP     SI
{              mov     al, byte ptr [Offset TextBuf + di]}
              mov     byte ptr [ Offset CodeBuf + bx ], al
              inc     dx
              jmp     @Encode9
  @Encode8 :   mov     bx, dx
              mov     ax, MatchPos
              mov     byte ptr [ Offset Codebuf + bx ], al
              inc     bx
              push    cx
              mov     cl, 4
              SHL     ah, cl
              pop     cx
              mov     al, byte ptr MatchLen
              sub     al, THRESHOLD + 1
              add     ah, al
              mov     byte ptr [ Offset Codebuf + bx ], ah
              inc     bx
              mov     dx, bx
  @Encode9 :   SHL     ch, 1
              jnz     @Encode11
              XOR     bx, bx
  @Encode10 :  mov     al, byte ptr [ Offset CodeBuf + bx ]
              call    putc
              inc     bx
              cmp     bx, dx
              jb      @Encode10
              mov     dx, 1
              mov     ch, dl
              mov     byte ptr codeBuf, dh
  @Encode11 :  mov     bx, matchLen
              mov     lastLen, bx
              XOR     bx, bx
  @Encode12 :  call    getc
{              jc      @Encode14}
              jc      @EncodeY
              push    ax
              call    deleteNode
              pop     ax
              PUSH    DI
              MOV     DI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     DI, SI
              STOSB
              POP     DI
{              mov     byte ptr [Offset TextBuf + si], al}
              cmp     si, F - 1
              jae     @Encode13
              PUSH    DI
              MOV     DI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     DI, SI
              MOV     [ ES : DI + N ], AL
              POP     DI
{              mov     byte ptr [Offset TextBuf + si + N], al}
  @Encode13 :  inc     si
              AND     si, N - 1
              inc     di
              AND     di, N - 1
              call    insertNode
              inc     bx
              cmp     bx, lastLen
              jb      @Encode12
              jmp     @Encode16
(*  @Encode14:  sub     printCount, bx
              jnc     @EncodeY
              mov     ax, printPeriod
              mov     printCount, ax
              push    dx                 { Print out a period as a sign. }
              mov     dl, DBLARROW
              mov     ah, 2
              int     21h
              pop     dx *)
  @EncodeX :   inc     bx
              call    deleteNode
              inc     si
              AND     si, N - 1
              inc     di
              AND     di, N - 1
              dec     cl
              jz      @EncodeY
              call    insertNode
  @EncodeY :   cmp     bx, LastLen
              jb      @EncodeX
  @Encode16 :  test    cl, cl
              jnz     @Encode6
  @Encode17 :  test    dx, dx
              jz      @Encode19
              XOR     bx, bx
  @Encode18 :  mov     al, byte ptr [ Offset Codebuf + bx ]
              call    putc
              inc     bx
              cmp     bx, dx
              jb      @Encode18
  @Encode19 :
              call    LZSS_Write
END; { Encode }

PROCEDURE LZDecode; ASSEMBLER;
ASM
{                                                   }
{ Load ES with segment of Binary Tree structure ... }
{                                                   }
              MOV     ES, PtrRec [ OFFSET BinaryTree ].&Seg
{                }
{ Now decode ... }
{                }
              XOR     dx, dx
              mov     di, N - F
  @Decode2 :   SHR     dx, 1
              OR      dh, dh
              jnz     @Decode3
              call    getc
              jc      @Decode9
              mov     dh, 0ffh
              mov     dl, al
  @Decode3 :   call    getc
              jc      @Decode9
              test    dl, 1
              jz      @Decode4
              PUSH    SI
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              ADD     SI, DI
              MOV     [ ES : SI ], AL
              POP     SI
{              mov     byte ptr [Offset TextBuf + di], al}
              inc     di
              AND     di, N - 1
              call    putc
              jmp     @Decode2
  @Decode4 :   mov     bl, al
              call    getc
              jc      @Decode9
              mov     bh, al
            {$IFOPT G+}
              SHR     bh, 4
            {$ELSE}
              mov     cl, 4
              SHR     bh, cl
            {$ENDIF}
              mov     cl, al
              AND     cl, 0fh
              add     cl, THRESHOLD
              inc     cl
  @Decode5 :   AND     bx, N - 1
              PUSH    SI
              MOV     SI, PtrRec [ OFFSET BinaryTree ].Ofs
              MOV     AL, [ ES : SI + BX ]
              ADD     SI, DI
              MOV     [ ES : SI ], AL
              POP     SI
{              mov     al, byte ptr [Offset TextBuf + bx]
              mov     byte ptr [Offset TextBuf + di], al}
              inc     di
              AND     di, N - 1
              call    putc
              inc     bx
              dec     cl
              jnz     @Decode5
              jmp     @Decode2
  @Decode9 :
              call    LZSS_Write
END; { Decode }

FUNCTION LZInit : boolean;
LABEL
  LZAbort;
BEGIN
{
  *Non-interruptable* test for whether LZ unit is busy ...
}
  ASM
    MOV AL, TRUE          { if IsLZInitialized then goto LZAbort; }
    XCHG IsLZInitialized, AL  { IsLZInitialized := True;              }
    TEST AL, AL
    JNZ LZAbort
  END;
{
  Unit WASN'T busy, but it is now ...
}
  New ( InBufP );
  New ( OutBufP );
  New ( BinaryTree );
  IF ( InBufP = NIL ) OR ( OutBufP = NIL ) OR ( BinaryTree = NIL ) THEN
    LZDone;
LZAbort :
  LZInit := IsLZInitialized
END; { LZInit }

PROCEDURE LZDone;
BEGIN
  IF InBufP <> NIL THEN
    Dispose ( InBufP );
  IF OutBufP <> NIL THEN
    Dispose ( OutBufP );
  IF BinaryTree <> NIL THEN
    Dispose ( BinaryTree );
  IsLZInitialized := FALSE
END; { LZDone }

PROCEDURE LZSquash;
BEGIN
  IF IsLZInitialized THEN
  BEGIN
    InBufPtr := LZRWBufSize;
    InBufSize := LZRWBufSize;
    OutBufPtr := 0;
    Height := 0;
    MatchPos := 0;
    MatchLen := 0;
    LastLen := 0;

    FillChar ( BinaryTree^, SizeOf ( TBinaryTree ), 0 );
    FillChar ( CodeBuf, SizeOf ( CodeBuf ), 0 );

    LZReadProc := ReadProc;
    LZWriteProc := WriteProc;

    LZEncode
  END
END; { LZSquash }

PROCEDURE LZUnSquash;
BEGIN
  IF IsLZInitialized THEN
  BEGIN
    InBufPtr := LZRWBufSize;
    InBufSize := LZRWBufSize;
    OutBufPtr := 0;
    FillChar ( BinaryTree^.TextBuf, SizeOf ( TLZTextBuf ), 0 );

    LZReadProc := ReadProc;
    LZWriteProc := WriteProc;

    LZDecode;
  END
END; { LZUnSquash }

{$IFDEF Windows}
FUNCTION HeapFunc ( Size : word ) : integer; FAR; ASSEMBLER;
ASM
  MOV AX, 1
END; { HeapFunc }
{$ENDIF}

{$IFDEF Windows}
BEGIN
  HeapError := @HeapFunc;
{$ENDIF}
END. { LZSSUNIT }
