unit D2ImageHelp;

interface
uses
  SysUtils,
  Windows;

const
  DUPLICATE_CLOSE_SOURCE     = $00000001;
  DUPLICATE_SAME_ACCESS      = $00000002;

{line 3337}
const
  IMAGE_DOS_SIGNATURE                     = $5A4D;      { MZ }
  IMAGE_OS2_SIGNATURE                     = $454E;      { NE }
  IMAGE_OS2_SIGNATURE_LE                  = $454C;      { LE }
  IMAGE_VXD_SIGNATURE                     = $454C;      { LE }
  IMAGE_NT_SIGNATURE                      = $00004550;  { PE00 }

type
  PImageDosHeader = ^TImageDosHeader;
  _IMAGE_DOS_HEADER = packed record      { DOS .EXE header                  }
      e_magic: Word;                     { Magic number                     }
      e_cblp: Word;                      { Bytes on last page of file       }
      e_cp: Word;                        { Pages in file                    }
      e_crlc: Word;                      { Relocations                      }
      e_cparhdr: Word;                   { Size of header in paragraphs     }
      e_minalloc: Word;                  { Minimum extra paragraphs needed  }
      e_maxalloc: Word;                  { Maximum extra paragraphs needed  }
      e_ss: Word;                        { Initial (relative) SS value      }
      e_sp: Word;                        { Initial SP value                 }
      e_csum: Word;                      { Checksum                         }
      e_ip: Word;                        { Initial IP value                 }
      e_cs: Word;                        { Initial (relative) CS value      }
      e_lfarlc: Word;                    { File address of relocation table }
      e_ovno: Word;                      { Overlay number                   }
      e_res: array [0..3] of Word;       { Reserved words                   }
      e_oemid: Word;                     { OEM identifier (for e_oeminfo)   }
      e_oeminfo: Word;                   { OEM information; e_oemid specific}
      e_res2: array [0..9] of Word;      { Reserved words                   }
      _lfanew: LongInt;                  { File address of new exe header   }
  end;
  TImageDosHeader = _IMAGE_DOS_HEADER;
  IMAGE_DOS_HEADER = _IMAGE_DOS_HEADER;


  PImageFileHeader = ^TImageFileHeader;
  _IMAGE_FILE_HEADER = packed record
    Machine: Word;
    NumberOfSections: Word;
    TimeDateStamp: DWORD;
    PointerToSymbolTable: DWORD;
    NumberOfSymbols: DWORD;
    SizeOfOptionalHeader: Word;
    Characteristics: Word;
  end;
  TImageFileHeader = _IMAGE_FILE_HEADER;
  IMAGE_FILE_HEADER = _IMAGE_FILE_HEADER;

  PImageExportDirectory = ^TImageExportDirectory;
  _IMAGE_EXPORT_DIRECTORY = packed record
      Characteristics: DWord;
      TimeDateStamp: DWord;
      MajorVersion: Word;
      MinorVersion: Word;
      Name: DWord;
      Base: DWord;
      NumberOfFunctions: DWord;
      NumberOfNames: DWord;
      AddressOfFunctions: ^PDWORD;
      AddressOfNames: ^PDWORD;
      AddressOfNameOrdinals: ^PWord;
  end;
  TImageExportDirectory = _IMAGE_EXPORT_DIRECTORY;
  IMAGE_EXPORT_DIRECTORY = _IMAGE_EXPORT_DIRECTORY;

const
  IMAGE_SIZEOF_FILE_HEADER                 = 20;

  IMAGE_FILE_RELOCS_STRIPPED               = $0001;  { Relocation info stripped from file. }
  IMAGE_FILE_EXECUTABLE_IMAGE              = $0002;  { File is executable  (i.e. no unresolved externel references). }
  IMAGE_FILE_LINE_NUMS_STRIPPED            = $0004;  { Line nunbers stripped from file. }
  IMAGE_FILE_LOCAL_SYMS_STRIPPED           = $0008;  { Local symbols stripped from file. }
  IMAGE_FILE_AGGRESIVE_WS_TRIM             = $0010;  { Agressively trim working set }
  IMAGE_FILE_BYTES_REVERSED_LO             = $0080;  { Bytes of machine word are reversed. }
  IMAGE_FILE_32BIT_MACHINE                 = $0100;  { 32 bit word machine. }
  IMAGE_FILE_DEBUG_STRIPPED                = $0200;  { Debugging info stripped from file in .DBG file }
  IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP       = $0400;  { If Image is on removable media, copy and run from the swap file. }
  IMAGE_FILE_NET_RUN_FROM_SWAP             = $0800;  { If Image is on Net, copy and run from the swap file. }
  IMAGE_FILE_SYSTEM                        = $1000;  { System File. }
  IMAGE_FILE_DLL                           = $2000;  { File is a DLL. }
  IMAGE_FILE_UP_SYSTEM_ONLY                = $4000;  { File should only be run on a UP machine }
  IMAGE_FILE_BYTES_REVERSED_HI             = $8000;  { Bytes of machine word are reversed. }

  IMAGE_FILE_MACHINE_UNKNOWN               = 0;
  IMAGE_FILE_MACHINE_I386                  = $14c;   { Intel 386. }
  IMAGE_FILE_MACHINE_R3000                 = $162;   { MIPS little-endian, 0x160 big-endian }
  IMAGE_FILE_MACHINE_R4000                 = $166;   { MIPS little-endian }
  IMAGE_FILE_MACHINE_R10000                = $168;   { MIPS little-endian }
  IMAGE_FILE_MACHINE_ALPHA                 = $184;   { Alpha_AXP }
  IMAGE_FILE_MACHINE_POWERPC               = $1F0;   { IBM PowerPC Little-Endian }

{ Directory format. }

type
  PImageDataDirectory = ^TImageDataDirectory;
  _IMAGE_DATA_DIRECTORY = record
    VirtualAddress: DWORD;
    Size: DWORD;
  end;
  TImageDataDirectory = _IMAGE_DATA_DIRECTORY;
  IMAGE_DATA_DIRECTORY = _IMAGE_DATA_DIRECTORY;

const
  IMAGE_NUMBEROF_DIRECTORY_ENTRIES        = 16;

{ Optional header format. }

type
  PImageOptionalHeader = ^TImageOptionalHeader;
  _IMAGE_OPTIONAL_HEADER = packed record
    { Standard fields. }
    Magic: Word;
    MajorLinkerVersion: Byte;
    MinorLinkerVersion: Byte;
    SizeOfCode: DWORD;
    SizeOfInitializedData: DWORD;
    SizeOfUninitializedData: DWORD;
    AddressOfEntryPoint: DWORD;
    BaseOfCode: DWORD;
    BaseOfData: DWORD;
    { NT additional fields. }
    ImageBase: DWORD;
    SectionAlignment: DWORD;
    FileAlignment: DWORD;
    MajorOperatingSystemVersion: Word;
    MinorOperatingSystemVersion: Word;
    MajorImageVersion: Word;
    MinorImageVersion: Word;
    MajorSubsystemVersion: Word;
    MinorSubsystemVersion: Word;
    Win32VersionValue: DWORD;
    SizeOfImage: DWORD;
    SizeOfHeaders: DWORD;
    CheckSum: DWORD;
    Subsystem: Word;
    DllCharacteristics: Word;
    SizeOfStackReserve: DWORD;
    SizeOfStackCommit: DWORD;
    SizeOfHeapReserve: DWORD;
    SizeOfHeapCommit: DWORD;
    LoaderFlags: DWORD;
    NumberOfRvaAndSizes: DWORD;
    DataDirectory: packed array[0..IMAGE_NUMBEROF_DIRECTORY_ENTRIES-1] of TImageDataDirectory;
  end;
  TImageOptionalHeader = _IMAGE_OPTIONAL_HEADER;
  IMAGE_OPTIONAL_HEADER = _IMAGE_OPTIONAL_HEADER;

  PImageRomOptionalHeader = ^TImageRomOptionalHeader;
  _IMAGE_ROM_OPTIONAL_HEADER = packed record
    Magic: Word;
    MajorLinkerVersion: Byte;
    MinorLinkerVersion: Byte;
    SizeOfCode: DWORD;
    SizeOfInitializedData: DWORD;
    SizeOfUninitializedData: DWORD;
    AddressOfEntryPoint: DWORD;
    BaseOfCode: DWORD;
    BaseOfData: DWORD;
    BaseOfBss: DWORD;
    GprMask: DWORD;
    CprMask: packed array[0..3] of DWORD;
    GpValue: DWORD;
  end;
  TImageRomOptionalHeader = _IMAGE_ROM_OPTIONAL_HEADER;
  IMAGE_ROM_OPTIONAL_HEADER = _IMAGE_ROM_OPTIONAL_HEADER;


const
  IMAGE_SIZEOF_ROM_OPTIONAL_HEADER       = 56;
  IMAGE_SIZEOF_STD_OPTIONAL_HEADER       = 28;
  IMAGE_SIZEOF_NT_OPTIONAL_HEADER        = 224;

  IMAGE_NT_OPTIONAL_HDR_MAGIC            = $010B;
  IMAGE_ROM_OPTIONAL_HDR_MAGIC           = $0107;

type
  PImageNtHeaders = ^TImageNtHeaders;
  _IMAGE_NT_HEADERS = packed record
    Signature: DWORD;
    FileHeader: TImageFileHeader;
    OptionalHeader: TImageOptionalHeader;
  end;
  TImageNtHeaders = _IMAGE_NT_HEADERS;
  IMAGE_NT_HEADERS = _IMAGE_NT_HEADERS;


  PImageRomHeaders = ^TImageRomHeaders;
  _IMAGE_ROM_HEADERS = packed record
    FileHeader: TImageFileHeader;
    OptionalHeader: TImageRomOptionalHeader;
  end;
  TImageRomHeaders = _IMAGE_ROM_HEADERS;
  IMAGE_ROM_HEADERS = _IMAGE_ROM_HEADERS;


{ Subsystem Values }

const
  IMAGE_SUBSYSTEM_UNKNOWN                  = 0;  { Unknown subsystem. }
  IMAGE_SUBSYSTEM_NATIVE                   = 1;  { Image doesn't require a subsystem. }
  IMAGE_SUBSYSTEM_WINDOWS_GUI              = 2;  { Image runs in the Windows GUI subsystem. }
  IMAGE_SUBSYSTEM_WINDOWS_CUI              = 3;  { Image runs in the Windows character subsystem. }
  IMAGE_SUBSYSTEM_OS2_CUI                  = 5;  { image runs in the OS/2 character subsystem. }
  IMAGE_SUBSYSTEM_POSIX_CUI                = 7;  { image run  in the Posix character subsystem. }
  IMAGE_SUBSYSTEM_RESERVED8                = 8;  { image run  in the 8 subsystem. }


{ Directory Entries }

  IMAGE_DIRECTORY_ENTRY_EXPORT             = 0;  { Export Directory }
  IMAGE_DIRECTORY_ENTRY_IMPORT             = 1;  { Import Directory }
  IMAGE_DIRECTORY_ENTRY_RESOURCE           = 2;  { Resource Directory }
  IMAGE_DIRECTORY_ENTRY_EXCEPTION          = 3;  { Exception Directory }
  IMAGE_DIRECTORY_ENTRY_SECURITY           = 4;  { Security Directory }
  IMAGE_DIRECTORY_ENTRY_BASERELOC          = 5;  { Base Relocation Table }
  IMAGE_DIRECTORY_ENTRY_DEBUG              = 6;  { Debug Directory }
  IMAGE_DIRECTORY_ENTRY_COPYRIGHT          = 7;  { Description String }
  IMAGE_DIRECTORY_ENTRY_GLOBALPTR          = 8;  { Machine Value (MIPS GP) }
  IMAGE_DIRECTORY_ENTRY_TLS                = 9;  { TLS Directory }
  IMAGE_DIRECTORY_ENTRY_LOAD_CONFIG       = 10;  { Load Configuration Directory }
  IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT      = 11;  { Bound Import Directory in headers }
  IMAGE_DIRECTORY_ENTRY_IAT               = 12;  { Import Address Table }

{ Section header format. }

  IMAGE_SIZEOF_SHORT_NAME                  = 8;

type
  TISHMisc = packed record
    case Integer of
      0: (PhysicalAddress: DWORD);
      1: (VirtualSize: DWORD);
  end;

  PImageSectionHeader = ^TImageSectionHeader;
  _IMAGE_SECTION_HEADER = packed record
    Name: packed array[0..IMAGE_SIZEOF_SHORT_NAME-1] of Byte;
    Misc: TISHMisc;
    VirtualAddress: DWORD;
    SizeOfRawData: DWORD;
    PointerToRawData: DWORD;
    PointerToRelocations: DWORD;
    PointerToLinenumbers: DWORD;
    NumberOfRelocations: Word;
    NumberOfLinenumbers: Word;
    Characteristics: DWORD;
  end;
  TImageSectionHeader = _IMAGE_SECTION_HEADER;
  IMAGE_SECTION_HEADER = _IMAGE_SECTION_HEADER;


const
  IMAGE_SIZEOF_SECTION_HEADER              = 40;


{ Section characteristics. }

{      IMAGE_SCN_TYPE_REG                   0x00000000  // Reserved. }
{      IMAGE_SCN_TYPE_DSECT                 0x00000001  // Reserved. }
{      IMAGE_SCN_TYPE_NOLOAD                0x00000002  // Reserved. }
{      IMAGE_SCN_TYPE_GROUP                 0x00000004  // Reserved. }
  IMAGE_SCN_TYPE_NO_PAD                    = $00000008;  { Reserved. }
{      IMAGE_SCN_TYPE_COPY                  0x00000010  // Reserved. }

  IMAGE_SCN_CNT_CODE                       = $00000020;  { Section contains code. }
  IMAGE_SCN_CNT_INITIALIZED_DATA           = $00000040;  { Section contains initialized data. }
  IMAGE_SCN_CNT_UNINITIALIZED_DATA         = $00000080;  { Section contains uninitialized data. }

  IMAGE_SCN_LNK_OTHER                      = $00000100;  { Reserved. }
  IMAGE_SCN_LNK_INFO                       = $00000200;  { Section contains comments or some other type of information. }
{      IMAGE_SCN_TYPE_OVER                  0x00000400  // Reserved. }
  IMAGE_SCN_LNK_REMOVE                     = $00000800;  { Section contents will not become part of image. }
  IMAGE_SCN_LNK_COMDAT                     = $00001000;  { Section contents comdat. }
{                                           0x00002000  // Reserved. }

{      IMAGE_SCN_MEM_PROTECTED - Obsolete   0x00004000 }
  IMAGE_SCN_MEM_FARDATA                    = $00008000;
{      IMAGE_SCN_MEM_SYSHEAP  - Obsolete    0x00010000 }
  IMAGE_SCN_MEM_PURGEABLE                  = $00020000;
  IMAGE_SCN_MEM_16BIT                      = $00020000;
  IMAGE_SCN_MEM_LOCKED                     = $00040000;
  IMAGE_SCN_MEM_PRELOAD                    = $00080000;

  IMAGE_SCN_ALIGN_1BYTES                   = $00100000;
  IMAGE_SCN_ALIGN_2BYTES                   = $00200000;
  IMAGE_SCN_ALIGN_4BYTES                   = $00300000;
  IMAGE_SCN_ALIGN_8BYTES                   = $00400000;
  IMAGE_SCN_ALIGN_16BYTES                  = $00500000;  { Default alignment if no others are specified. }
  IMAGE_SCN_ALIGN_32BYTES                  = $00600000;
  IMAGE_SCN_ALIGN_64BYTES                  = $00700000;
{ Unused                                    0x00800000 }

  IMAGE_SCN_LNK_NRELOC_OVFL                = $01000000;  { Section contains extended relocations. }
  IMAGE_SCN_MEM_DISCARDABLE                = $02000000;  { Section can be discarded. }
  IMAGE_SCN_MEM_NOT_CACHED                 = $04000000;  { Section is not cachable. }
  IMAGE_SCN_MEM_NOT_PAGED                  = $08000000;  { Section is not pageable. }
  IMAGE_SCN_MEM_SHARED                     = $10000000;  { Section is shareable. }
  IMAGE_SCN_MEM_EXECUTE                    = $20000000;  { Section is executable. }
  IMAGE_SCN_MEM_READ                       = $40000000;  { Section is readable. }
  IMAGE_SCN_MEM_WRITE                      = DWORD($80000000);  { Section is writeable. }


{line 4281}
type
  PImageLoadConfigDirectory = ^TImageLoadConfigDirectory;
  IMAGE_LOAD_CONFIG_DIRECTORY = packed record
    Characteristics: DWORD;
    TimeDateStamp: DWORD;
    MajorVersion: Word;
    MinorVersion: Word;
    GlobalFlagsClear: DWORD;
    GlobalFlagsSet: DWORD;
    CriticalSectionDefaultTimeout: DWORD;
    DeCommitFreeBlockThreshold: DWORD;
    DeCommitTotalFreeThreshold: DWORD;
    LockPrefixTable: Pointer;
    MaximumAllocationSize: DWORD;
    VirtualMemoryThreshold: DWORD;
    ProcessHeapFlags: DWORD;
    ProcessAffinityMask: DWORD;
    Reserved: array[0..2] of DWORD;
  end;
  TImageLoadConfigDirectory = IMAGE_LOAD_CONFIG_DIRECTORY;
//  IMAGE_LOAD_CONFIG_DIRECTORY = _IMAGE_LOAD_CONFIG_DIRECTORY;


// Function table entry format for MIPS/ALPHA images.  Function table is
// pointed to by the IMAGE_DIRECTORY_ENTRY_EXCEPTION directory entry.
// This definition duplicates ones in ntmips.h and ntalpha.h for use
// by portable image file mungers.

  PImageRuntimeFunctionEntry = ^TImageRuntimeFunctionEntry;
  IMAGE_RUNTIME_FUNCTION_ENTRY = record
    BeginAddress: DWORD;
    EndAddress: DWORD;
    ExceptionHandler: Pointer;
    HandlerData: Pointer;
    PrologEndAddress: DWORD;
  end;
  TImageRuntimeFunctionEntry = IMAGE_RUNTIME_FUNCTION_ENTRY;
// IMAGE_RUNTIME_FUNCTION_ENTRY = _IMAGE_RUNTIME_FUNCTION_ENTRY;


//
// Debug Format
//

  PImageDebugDirectory = ^TImageDebugDirectory;
  _IMAGE_DEBUG_DIRECTORY = packed record
    Characteristics: DWORD;
    TimeDateStamp: DWORD;
    MajorVersion: Word;
    MinorVersion: Word;
    _Type: DWORD;
    SizeOfData: DWORD;
    AddressOfRawData: DWORD;
    PointerToRawData: DWORD;
  end;
  TImageDebugDirectory = _IMAGE_DEBUG_DIRECTORY;
  IMAGE_DEBUG_DIRECTORY = _IMAGE_DEBUG_DIRECTORY;


const
  IMAGE_DEBUG_TYPE_UNKNOWN          = 0;
  IMAGE_DEBUG_TYPE_COFF             = 1;
  IMAGE_DEBUG_TYPE_CODEVIEW         = 2;
  IMAGE_DEBUG_TYPE_FPO              = 3;
  IMAGE_DEBUG_TYPE_MISC             = 4;
  IMAGE_DEBUG_TYPE_EXCEPTION        = 5;
  IMAGE_DEBUG_TYPE_FIXUP            = 6;
  IMAGE_DEBUG_TYPE_OMAP_TO_SRC      = 7;
  IMAGE_DEBUG_TYPE_OMAP_FROM_SRC    = 8;

type
  PImageCOFFSymbolsHeader = ^TImageCOFFSymbolsHeader;
  _IMAGE_COFF_SYMBOLS_HEADER = record
    NumberOfSymbols: DWORD;
    LvaToFirstSymbol: DWORD;
    NumberOfLinenumbers: DWORD;
    LvaToFirstLinenumber: DWORD;
    RvaToFirstByteOfCode: DWORD;
    RvaToLastByteOfCode: DWORD;
    RvaToFirstByteOfData: DWORD;
    RvaToLastByteOfData: DWORD;
  end;
  TImageCOFFSymbolsHeader = _IMAGE_COFF_SYMBOLS_HEADER;
  IMAGE_COFF_SYMBOLS_HEADER = _IMAGE_COFF_SYMBOLS_HEADER;


const
  FRAME_FPO       = 0;
  FRAME_TRAP      = 1;
  FRAME_TSS       = 2;
  FRAME_NONFPO    = 3;

type
  PFpoData = ^TFpoData;
  _FPO_DATA = packed record
    ulOffStart: DWORD;             // offset 1st byte of function code
    cbProcSize: DWORD;             // # bytes in function
    cdwLocals: DWORD;              // # bytes in locals/4
    cdwParams: Word;              // # bytes in params/4
{    WORD        cbProlog : 8;           // # bytes in prolog
     WORD        cbRegs   : 3;           // # regs saved
     WORD        fHasSEH  : 1;           // TRUE if SEH in func
     WORD        fUseBP   : 1;           // TRUE if EBP has been allocated
     WORD        reserved : 1;           // reserved for future use
     WORD        cbFrame  : 2;}           // frame type
     cbProlog: Byte;
     OtherStuff: Byte;
  end;
  TFpoData = _FPO_DATA;
  FPO_DATA = _FPO_DATA;


const
  SIZEOF_RFPO_DATA         = 16;
  IMAGE_DEBUG_MISC_EXENAME = 1;

type
  PImageDebugMisc = ^TImageDebugMisc;
  _IMAGE_DEBUG_MISC = packed record
    DataType: DWORD;               // type of misc data, see defines
    Length: DWORD;                 // total length of record, rounded to four
                                   // byte multiple.
    Unicode: ByteBool;             // TRUE if data is unicode string
    Reserved: array[0..2] of Byte;
    Data: array[0..0] of Byte;     // Actual data
  end;
  TImageDebugMisc = _IMAGE_DEBUG_MISC;
  IMAGE_DEBUG_MISC = _IMAGE_DEBUG_MISC;


//
// Function table extracted from MIPS/ALPHA images.  Does not contain
// information needed only for runtime support.  Just those fields for
// each entry needed by a debugger.
//
  PImageFunctionEntry = ^TImageFunctionEntry;
  _IMAGE_FUNCTION_ENTRY = record
    StartingAddress: DWORD;
    EndingAddress: DWORD;
    EndOfPrologue: DWORD;
  end;
  TImageFunctionEntry = _IMAGE_FUNCTION_ENTRY;
  IMAGE_FUNCTION_ENTRY = _IMAGE_FUNCTION_ENTRY;

procedure RaiseLastWin32Error;

implementation

procedure RaiseLastWin32Error;
begin
  raise Exception.Create(SysErrorMessage(GetLastError))
end;

end.
