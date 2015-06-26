{$A+,B-,C-,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N-,O+,P-,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{
  LZ77 compression for 32-bit Delphi and Virtual Pascal:

  * Ported by C.J.Rankin from the 16-bit unit LZSSUnit.

  Rumour has it that the Pentium Pro cannot handle `partial register
  loads' efficiently; apparently, assigning a value to AL,AH,AX (e.g.)
  and then reading EAX, or assigning AL,AH and reading AX causes the
  pipelines to stall. Call me optimistic/pedantic, but I have tried to
  avoid this where possible.

  * Amended for Virtual Pascal by Allan Mertner

  Original unit credits:
   Assembler Programmer: Andy Tam, Pascal Conversion: Douglas Webb,
   Unit Conversion and Dynamic Memory Allocation: Andrew Eigus.

   Written by Andrew Eigus (aka: Mr. Byte) of:
   Fidonet: 2:5100/33,
   Internet: aeigus@fgate.castle.riga.lv, aeigus@kristin.cclu.lv.
}
UNIT LZSS32;
{
THIS CODE WILL COMPILE FOR THE FOLLOWING PLATFORMS;
     Win32         - Delphi 2.x
     Win32         - Delphi 3.x
     Win32         - Virtual Pascal 2.x

     Dr Abimbola A Olowofoyeku (The African Chief);
     Email:  laa12@keele.ac.uk
     http://ourworld.compuserve.com/homepages/African_Chief/
}


INTERFACE

{#Z+}
{ This unit is ready for use with Dj. Murdoch's ScanHelp utility which
  will make a Borland .TPH file for it. }
{#Z-}

CONST Log2TLZSSWord = 2;
{#Z+}
TYPE TLZSSWord = Cardinal;
{#Z-}

CONST
  LZRWBufSize = ( 256 * 1024 ) {8192};  { Read Buffer Size }

{#Z+}
CONST
  N         = 4096;
  F         = 18;
  Threshold = 2;
  Nul       = N * SizeOf ( TLZSSWord );

VAR
  InBufPtr :  TLZSSWord = LZRWBufSize;
  InBufSize : TLZSSWord = LZRWBufSize;
  OutBufPtr : TLZSSWord = 0;

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
TYPE
  PLZRWBuffer = ^TLZRWBuffer;
  TLZRWBuffer = ARRAY [ 0..LZRWBufSize - 1 ] OF Byte; { file buffers }

  TLZTextBuf = ARRAY [ 0..N + F - 2 ] OF Byte;
  TLeftMomTree = ARRAY [ 0..N ] OF TLZSSWord;
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

{#Z+}
VAR IsLZInitialized : boolean = FALSE;

VAR
  Height, MatchPos, MatchLen, LastLen : TLZSSWord;
  CodeBuf : ARRAY [ 0..16 ] OF Byte;
  LZReadProc :  TReadProc;
  LZWriteProc : TWriteProc;

VAR BinaryTree : PBinaryTree = NIL;
VAR InBufP :     PLZRWBuffer = NIL;
VAR OutBufP :    PLZRWBuffer = NIL;
{#Z-}

PROCEDURE LZEncode; pascal;
PROCEDURE LZDecode; pascal;

IMPLEMENTATION

FUNCTION LZSS_Read : TLZSSWord;    { Returns # of bytes read }
BEGIN
  Result := LZReadProc ( InBufP^ )
END; { LZSS_Read }

FUNCTION LZSS_Write : TLZSSWord;  { Returns # of bytes written }
BEGIN
  Result := LZWriteProc ( OutBufP^, OutBufPtr )
END; { LZSS_Write }

PROCEDURE GetC; pascal; ASSEMBLER; {&Frame-} {&uses none}
{
  GetC : return a character from the buffer
          RETURN : AL = input char
                   Carry set when EOF
}
ASM
{                                          }
{ Check for characters in Input Buffer ... }
{                                          }
  MOV EAX, InBufPtr
  CMP EAX, InBufSize
  JB @GetC2
{                                           }
{ All chars read. Need to refill buffer ... }
{                                           }
  PUSHAD
  CALL LZSS_Read
  MOV InBufSize, EAX
  TEST EAX, EAX
  POPAD
  JNZ @GetC1
{                                        }
{ No bytes read, so EOF: set carry flag. }
{                                        }
  STC
  JMP @Exit
@GetC1 :
  XOR EAX, EAX
@GetC2 :
  PUSH EBX
  MOV EBX, [ OFFSET InBufP ]
  MOV EBX, [ EBX + EAX ]    // Only interested IN BL
  INC EAX
  MOV [ OFFSET InBufPtr ], EAX
  MOV EAX, EBX  // Only interested IN AL
  POP EBX
  CLC
@Exit :
END;

PROCEDURE PutC; pascal; ASSEMBLER; {&Frame-} {&uses none}
{
  PutC : put a character into the output buffer
             Entry : AL = output char
}
ASM
  PUSH EBX
{                               }
{ Store AL in Output buffer ... }
{                               }
  MOV EBX, [ OFFSET OutBufPtr ]
  PUSH EDI
  MOV EDI, [ OFFSET OutBufP ]
  MOV [ EBX + EDI ], AL
  POP EDI
{                                  }
{ Check whether buffer is full ... }
{                                  }
  INC EBX
  CMP EBX, LZRWBufSize
  MOV [ OFFSET OutBufPtr ], EBX
  POP EBX
  JB @Exit
{                                                                          }
{ Buffer *IS* full, so flush it (having just set OutBufPtr to LZWRBufSize) }
{                                                                          }
  PUSHAD
  CALL LZSS_Write  // Returns bytes written IN EAX ... ( NOT! )
  POPAD
  XOR EAX, EAX
  MOV [ OFFSET OutBufPtr ], EAX
@Exit :
END;

PROCEDURE InitTree; pascal; ASSEMBLER; {&Frame-} {&uses edi}
{
  InitTree : initialize all binary search trees.  There are 256 BST's, one
             for all strings started with a particular character.  The
             parent of tree K is the node N + K + 1 and it has only a
             right child
}
ASM
  MOV EDI, [ OFFSET BinaryTree ]
  ADD EDI, OFFSET TBinaryTree.Mom
  MOV ECX, N + 1
  MOV EAX, Nul
  REP STOSD
{                                                         }
{ Initialise last 256 elements of BinaryTree.Right to Nul }
{                                                         }
  ADD EDI, OFFSET TBinaryTree.Right - OFFSET TBinaryTree.Mom
  MOV CH, ( 256 SHR 8 )    (* i.e. MOV ECX, 256 *)
  REP STOSD
END;

{
{ These procedures used by Splay:   }
{    EBP      = Addr of Mom         }
{    EAX, ECX = Addr of Left, Right }
{                                   }
PROCEDURE ZigZig; pascal; ASSEMBLER; {&Frame-} {&uses none}
ASM
  MOV EDX, [ EAX + ESI ]
  MOV [ ECX + EBX ], EDX
  MOV [ EBP + EDX ], EBX
  MOV EDX, [ EAX + EDI ]
  MOV [ ECX + ESI ], EDX
  MOV [ EBP + EDX ], ESI
  MOV [ EAX + ESI ], EBX
  MOV [ EAX + EDI ], ESI
  MOV [ EBP + EBX ], ESI
  MOV [ EBP + ESI ], EDI
END;

PROCEDURE ZigZag; pascal; ASSEMBLER; {&Frame-} {&uses none}
ASM
  MOV EDX, [ ECX + EDI ]
  MOV [ EAX + EBX ], EDX
  MOV [ EBP + EDX ], EBX
  MOV EDX, [ EAX + EDI ]
  MOV [ ECX + ESI ], EDX
  MOV [ EBP + EDX ], ESI
  MOV [ ECX + EDI ], EBX
  MOV [ EAX + EDI ], ESI
  MOV [ EBP + ESI ], EDI
  MOV [ EBP + EBX ], EDI
END;

PROCEDURE Splay; pascal; ASSEMBLER; {&Frame+} {&uses ebx,esi,edi}
{
  Splay : use splay tree operations to move the node to the 'top' of
           tree.  Note that it will not actual become the root of the tree
           because the root of each tree is a special node.  Instead, it
           will become the right child of this special node.

             ENTRY : EDI = the node to be rotated

  All registers except EDI are expendable
}
ASM
{                                                               }
{ Load location of Binary Tree Structure's Mom-array into EBP   }
{                                          Right-array into ECX }
{                                          Left-array into EAX  }
  MOV EAX, [ OFFSET BinaryTree ]
  LEA EBP, TBinaryTree [ EAX ].Mom
  LEA ECX, TBinaryTree [ EAX ].Right
  ADD EAX, OFFSET TBinaryTree.Left
{                           }
{ Begin Splay operation ... }
{                           }
@Splay1 :
  MOV ESI, [ EBP + EDI ]
  CMP ESI, Nul
  JA @Exit      // Exit IF parent IS special

  MOV EBX, [ EBP + ESI ]
  CMP EBX, Nul
  JBE @Splay5  // IF nodes's grandparent is NOT special, skip it

  CMP EDI, [EAX+ESI] // Check whether current node is left-child
  JNE @Splay2

  MOV EDX, [ECX+EDI]  // Perform Left-Zig
  MOV [EAX+ESI], EDX
  MOV [ECX+EDI], ESI
  JMP @Splay3

@Splay2:
  MOV EDX, [EAX+EDI]  // Perform Right-Zig
  MOV [ECX+ESI], EDX
  MOV [EAX+EDI], ESI

@Splay3:
  MOV [ECX+EBX], EDI
  MOV [EBP+EDX], ESI
  MOV [EBP+ESI], EDI
  MOV [EBP+EDI], EBX
  JMP @Exit

@Splay5:
  PUSH DWORD PTR [EBP+EBX]
  CMP EDI, [EAX+ESI]
  JNE @Splay7
  CMP ESI, [EAX+EBX]
  XCHG EAX, ECX       // Swap Left and Right over (temporarily!)
  JNE @Splay6
{                             }
{ Perform Left-operations ... }
{                             }
  CALL ZigZig
  XCHG EAX, ECX       // Swap Left and Right back
  JMP @Splay9

@Splay6:
  CALL ZigZag
  XCHG EAX, ECX      // Swap Left and Right back
  JMP @Splay9
{                              }
{ Perform Right-operations ... }
{                              }
@Splay7:
  CMP ESI, [ECX+EBX]
  JNE @Splay8
  CALL ZigZig
  JMP @Splay9

@Splay8:
  CALL ZigZag
{                    }
{ Done operations... }
{                    }
@Splay9:
  POP ESI
  CMP ESI, Nul
  JA @Splay10
  CMP EBX, [EAX+ESI]
  JNE @Splay10
  MOV [EAX+ESI], EDI
  JMP @Splay11

@Splay10:
  MOV [ECX+ESI], EDI

@Splay11:
  MOV [EBP+EDI], ESI
  JMP @Splay1

@Exit:
end;

procedure InsertNode; pascal; assembler; {&Frame-} {&uses none}
{
  InsertNode : insert the new node to the corresponding tree.  Note that the
               position of a string in the buffer also served as the node
               number.
             ENTRY : EDI = position in the buffer
}
asm
  PUSHAD
  MOV EBP, [OFFSET BinaryTree]  // EBP now holds address of TextBuf
{                }
{ Initialise ... }
{                }
  XOR EDX, EDX
  INC EDX

  XOR EAX, EAX
  MOV [OFFSET MatchLen], EAX
  MOV [OFFSET Height], EAX

  MOVZX EAX, BYTE PTR [EBP+EDI]
  SHL EDI, Log2TLZSSWord
  LEA ESI, [EAX*(TYPE TLZSSWord)+(N+1)*(TYPE TLZSSWord)]
  MOV EAX, Nul
  MOV [EBP+EDI+OFFSET TBinaryTree.Right], EAX
  MOV [EBP+EDI+OFFSET TBinaryTree.Left], EAX
{                                                 }
{ Initialisation complete. Now to insert node ... }
{                                                 }
@Ins1:
  INC Height
  TEST EDX, EDX
  MOV EDX, Nul
  JS @Ins3
{                                         }
{ Does this character have a Right-tree ? }
{                                         }
  MOV EAX, [EBP+ESI+OFFSET TBinaryTree.Right]
  CMP EAX, EDX   // EDX = Nul
  JNE @Ins5
  MOV [EBP+ESI+OFFSET TBinaryTree.Right], EDI   // New Tree
  MOV [EBP+EDI+OFFSET TBinaryTree.Mom], ESI
  JMP @Ins11
{                                        }
{ Does this character have a Left-tree ? }
{                                        }
@Ins3:
  MOV EAX, [EBP+ESI+OFFSET TBinaryTree.Left]
  CMP EAX, EDX  // EDX = Nul
  JNE @Ins5
  MOV [EBP+ESI+OFFSET TBinaryTree.Left], EDI   // New Tree
  MOV [EBP+EDI+OFFSET TBinaryTree.Mom], ESI
  JMP @Ins11
{                                                               }
{ Prepare to scan TextBuf: starting points ESI, EDI; length EBX }
{                                                               }
@Ins5:
  MOV ESI, EAX
  XOR EBX, EBX
  INC EBX
  SHR ESI, Log2TLZSSWord
  ADD ESI, EBP
  SHR EDI, Log2TLZSSWord
  ADD EDI, EBP
@Ins6:
  MOVZX EDX, BYTE PTR [EDI+EBX]
  MOVZX ECX, BYTE PTR [ESI+EBX]
  SUB EDX, ECX
  JNZ @Ins7
  INC EBX
  CMP EBX, F
  JB @Ins6
@Ins7:
  SUB ESI, EBP
  SUB EDI, EBP
  MOV EAX, ESI
  SHL ESI, Log2TLZSSWord
  SHL EDI, Log2TLZSSWord
  CMP EBX, [OFFSET MatchLen]
  JBE @Ins1
  MOV [OFFSET MatchPos], EAX
  MOV [OFFSET MatchLen], EBX
  CMP EBX, F
  JB @Ins1

@Ins8:
  LEA ECX, [EBP+OFFSET TBinaryTree.Left]
  LEA EDX, [EBP+OFFSET TBinaryTree.Right]
  ADD EBP, OFFSET TBinaryTree.Mom

  MOV EAX, [EBP+ESI]
  MOV [EBP+EDI], EAX
  MOV EAX, [ECX+ESI]
  MOV [ECX+EDI], EAX
  MOV [EBP+EAX], EDI
  MOV EAX, [EDX+ESI]
  MOV [EDX+EDI], EAX
  MOV [EBP+EAX], EDI
  MOV EAX, [EBP+ESI]

  CMP ESI, [EDX+EAX]
  JNE @Ins9

  MOV [EDX+EAX], EDI
  JMP @Ins10
@Ins9:
  MOV [ECX+EAX], EDI

@Ins10:
  MOV DWORD PTR [EBP+ESI], Nul

@Ins11:
  CMP Height, 30
  JB @Exit
  CALL Splay

@Exit:
  POPAD
end;

procedure DeleteNode; pascal; assembler; {&Frame-} {&uses none}
{
   DeleteNode : delete the node from the tree

            ENTRY : ESI = position in the buffer
}
asm
  PUSHAD
  MOV EBP, [OFFSET BinaryTree]
  LEA ECX, [EBP+OFFSET TBinaryTree.Left]
  LEA EDX, [EBP+OFFSET TBinaryTree.Right]
  ADD EBP, OFFSET TBinaryTree.Mom

  SHL ESI, Log2TLZSSWord
  MOV EAX, Nul

  CMP [EBP+ESI], EAX  { ; if it has no parent then exit }
  JE @Exit
  CMP [EDX+ESI], EAX  { ; does it have a right child ? }
  JNE @HasRight
  MOV EDI, [ECX+ESI]
  JMP @Del3
@HasRight:
  MOV EDI, [ESI+ECX]  { ; does it have a left child ? }
  CMP EDI, EAX
  JNE @HasLeft
  MOV EDI, [ESI+EDX]
  JMP @Del3
@HasLeft:
  MOV EBX, [EDI+EDX]  { ; does it have a right grandchild ? }
  CMP EBX, EAX
  JE @Del2            { ; if no, then skip }
{                                                  }
{ Find the rightmost node in the right subtree ... }
{                                                  }
@Del1:
  MOV EDI, EBX
  MOV EBX, [EDX+EDI]
  CMP EBX, EAX
  JNE @Del1
{                                               }
{ Move this node as the root of the subtree ... }
{                                               }
  MOV EBX, [EBP+EDI]
  MOV EAX, [ECX+EDI]
  MOV [EDX+EBX], EAX
  MOV [EBP+EAX], EBX
  MOV EBX, [ECX+ESI]
  MOV [ECX+EDI], EBX
  MOV [EBP+EBX], EDI

@Del2:
  MOV EBX, [EDX+ESI]
  MOV [EDX+EDI], EBX
  MOV [EBP+EBX], EDI

@Del3:
  MOV EBX, [EBP+ESI]
  MOV [EBP+EDI], EBX
  CMP ESI, [EDX+EBX]
  JNE @Del4
  MOV [EDX+EBX], EDI
  JMP @Del5
@Del4:
  MOV [ECX+EBX], EDI
@Del5:
  MOV DWORD PTR [EBP+ESI], Nul

@Exit:
  POPAD
end;

procedure LZEncode; assembler; {&Frame-} {&uses none}
asm
{                                       }
{ Need to preserve registers for Delphi }
{                                       }
  PUSHAD
{                }
{ Initialise ... }
{                }
  CALL InitTree
  XOR EBX, EBX
  MOV byte ptr [OFFSET CodeBuf], BL

  XOR ESI, ESI
  XOR EDX, EDX
  INC EDX

  PUSH EDX  // Temporary variable; accessed as [ESP]

  MOV EBP, [OFFSET BinaryTree]
  LEA EDI, [EBP+OFFSET TBinaryTree.TextBuf+N-F]
@Encode2:
  CALL GetC
  JNC @ReadOK
  TEST EBX, EBX
  JZ @Exit
  JMP @Encode4
@ReadOK:
  MOV [EDI+EBX], AL
  INC EBX
  CMP EBX, F
  JB @Encode2

@Encode4:
  SUB EDI, EBP
  MOV ECX, EBX
  XOR EBX, EBX
  PUSH EDI
  DEC EDI
@Encode5:
  CALL InsertNode
  INC EBX
  DEC EDI
  CMP EBX, F
  JB @Encode5
  POP EDI
  CALL InsertNode

@Encode6:
  MOV EAX, MatchLen
  CMP EAX, ECX
  JBE @Encode7
  MOV EAX, ECX
  MOV MatchLen, EAX
@Encode7:
  CMP EAX, Threshold
  JA @Encode8
  XOR EAX, EAX
  INC EAX
  MOV MatchLen, EAX             // Loads MatchLen with 1
                                // Only interested in AL
  MOV EAX, [ESP]
  OR  byte ptr [OFFSET CodeBuf], AL
  MOV EAX, [EBP+EDI]            // Only interested in AL
  MOV byte ptr [EDX+OFFSET CodeBuf], AL
  INC EDX
  JMP @Encode9

@Encode8:
  MOV EAX, MatchPos
  MOV byte ptr [EDX+OFFSET CodeBuf], AL
  INC EDX
  SHL AH, 4
  MOV AL, byte ptr [OFFSET MatchLen]
  SUB AL, Threshold+1
  ADD AH, AL
  MOV byte ptr [EDX+OFFSET CodeBuf], AH
  INC EDX

@Encode9:
  SHL BYTE PTR [ESP], 1
  JNZ @Encode11

  XOR EBX, EBX
@Encode10:
  MOV EAX, [EBX+OFFSET CodeBuf]   // PutC only stores AL
  CALL PutC
  INC EBX
  CMP EBX, EDX
  JB @Encode10
  XOR EDX, EDX
  INC EDX
  MOV [ESP], EDX
  MOV byte ptr [OFFSET CodeBuf], DH

@Encode11:
  MOV EBX, MatchLen
  MOV LastLen, EBX

  XOR EBX, EBX
@Encode12:
  CALL GetC
  JC @EncodeY
  CALL DeleteNode
  MOV [EBP+ESI], AL
  CMP ESI, F-1
  JAE @Encode13
  MOV [EBP+ESI+N], AL
@Encode13:
  INC ESI
  AND ESI, N-1
  INC EDI
  AND EDI, N-1
  CALL InsertNode
  INC EBX
  CMP EBX, LastLen
  JB @Encode12
  JMP @Encode16

@EncodeX:
  INC EBX
  CALL DeleteNode
  MOV EAX, N-1
  INC ESI
  AND ESI, EAX
  INC EDI
  AND EDI, EAX
  DEC ECX
  JZ @EncodeY
  CALL InsertNode
@EncodeY:
  CMP EBX, LastLen
  JB @EncodeX

@Encode16:
  TEST ECX, ECX
  JNZ @Encode6
@Encode17:
  TEST EDX, EDX
  JZ @Exit
{                                                   }
{ Write EDX chars from CodeBuf to Output buffer ... }
{                                                   }
  XOR EBX, EBX
@Encode18:
  MOV EAX, [EBX+OFFSET CodeBuf]  // PutC only stores AL
  CALL PutC
  INC EBX
  CMP EBX, EDX
  JB @Encode18
{                                           }
{ Restore registers and flush Output buffer }
{                                           }
@Exit:
  POP EDX
  POPAD
  CALL LZSS_Write
end;

procedure LZDecode; assembler; {&Frame-} {&uses none}
asm
{                                       }
{ Need to preserve registers for Delphi }
{                                       }
  PUSHAD
{                }
{ Initialise ... }
{                }
  XOR EDX, EDX
  MOV EDI, N-F
  MOV ESI, [OFFSET BinaryTree] // First field in BTree is TextBuf
{                }
{ Main loops ... }
{                }
@Decode2:
  SHR EDX, 1
  TEST DH, DH
  JNZ @Decode3
  CALL GetC
  JC @Exit
  MOV DH, $FF
  MOV DL, AL
@Decode3:
  CALL GetC
  JC @Exit
// Two alternatives ... Either:
  TEST DL, 1
  JZ @Decode4
// Or:
//  bt edx, 0
//  jnc @Decode4
  MOV [ESI+EDI], AL
  INC EDI
  AND EDI, N-1
  CALL PutC
  JMP @Decode2
@Decode4:
  MOV EBX, EAX   // Only require MOV BL, AL
  CALL GetC
  JC @Exit
  MOV BH, AL
  SHR BH, 4
  MOVZX ECX, AL
  AND CL, $F
  ADD CL, Threshold
  INC ECX
@Decode5:
  AND EBX, N-1
  MOV EAX, [ESI+EBX]  // Only interested in AL ...
  MOV [ESI+EDI], AL
  INC EDI
  AND EDI, N-1
  CALL PutC
  INC EBX
  DEC ECX
  JNZ @Decode5
  JMP @Decode2
{                                               }
{ Restore registers and flush Output buffer ... }
{                                               }
@Exit:
  POPAD
  CALL LZSS_Write
end;

function LZInit: boolean;
var
  Ok: Boolean;
Begin
{
  *Non-interruptable* test for whether this unit is busy...
}
  asm
    mov Ok,0
    BTS DWORD PTR [OFFSET IsLZInitialized], 0 // If IsLZInitialized then goto Abort;
    JC @@Abort                                  // IsLZInitialized := True;
    mov Ok,1
  @@Abort:
  end;
{
  Unit WASN'T busy, but it IS now ...
}
  IF Ok THEN
    TRY
      New ( InBufP );
      New ( OutBufP );
      New ( BinaryTree )
    EXCEPT
      LZDone   // Flag UNIT AS `free' again ...
    end;

  LZInit := IsLZInitialized
End; { LZInit }

Procedure LZDone;
Begin
  if InBufP <> nil then
    Dispose(InBufP);
  if OutBufP <> nil then
    Dispose(OutBufP);
  if BinaryTree <> nil then
    Dispose(BinaryTree);
  IsLZInitialized := False
End; { LZDone }

Procedure LZSquash(ReadProc: TReadProc; WriteProc: TWriteProc);
Begin
  if IsLZInitialized then
  begin
    InBufPtr := LZRWBufSize;
    InBufSize := LZRWBufSize;
    OutBufPtr := 0;
    Height := 0;
    MatchPos := 0;
    MatchLen := 0;
    LastLen := 0;

    FillChar(BinaryTree^, SizeOf(TBinaryTree), 0);
    FillChar(CodeBuf, SizeOf(CodeBuf), 0);

    LZReadProc := ReadProc;
    LZWriteProc := WriteProc;

    LZEncode
  end
End; { LZSquash }

Procedure LZUnSquash(ReadProc: TReadProc; WriteProc: TWriteProc);
Begin
  if IsLZInitialized then
  begin
    InBufPtr := LZRWBufSize;
    InBufSize := LZRWBufSize;
    OutBufPtr := 0;
    FillChar(BinaryTree^.TextBuf, SizeOf(TLZTextBuf), 0);

    LZReadProc := ReadProc;
    LZWriteProc := WriteProc;

    LZDecode
  end
End; { LZUnSquash }

end.

