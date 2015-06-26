README FILE FOR CHIEFLZ v3.x
----------------------------

This package contains ready-to-compile-and-run Borland Pascal and
Delphi sources for LZSS (LZ77) compression. The original source for
the LZSS compression was called LZSSUNIT. This package develops that
unit further. Although the package is called "CHIEFLZ", it is the joint
work of The African Chief (Dr. Abimbola Adeleke Olowofoyeku), and Chris
Rankin. Most of the Win32 sources were written by Chris Rankin, who also 
ported the 16-bit ASM code in the original LZSSUNIT.PAS (LZSS16.PAS
in this package) to 32-bit ASM for Delphi 2.x (LZSS32.PAS). That was a 
great effort: many thanks to Chris!

Allan Mertner ported the 32-bit ASM code in LZSS32.PAS to compile for 
Virtual Pascal 2.x. Thanks Allan!

Almer Tigelaar has worked with me in rationalising and adding new 
features, and has provided me with ideas in developing my Delphi 
component. Thanks Almer!

* V2.0: saw the addition of another compression algorithm, which I call
LZHSix (based on public domain "SixPack" Huffman compression code). This 
code contained some ASM statements that was coverted to Pascal by 
Christopher Eltschka. Thanks Christopher!

* V3.0: sees the addition of disk spanning, and a new filename matching
routine. It has also seen Win32 parameters changing from Pascal
strings to pChars. 

* This package does not contain too much in the way of documentation. The
existing documentation consists of this file, the comments in the source
code, and test programs. The test programs are sufficient to show how 
to use the routines in this package.

FUTURE DEVELOPMENTS
-------------------
This package is being developed all the time. I have been solely responsible
for developmens subsequent to the release of v1.0. This is becoming too much
work, and I welcome the input of others to take this work further. I would
like to freeze the file formats to what they are at the moment, and to avoid
at all costs any changes to the file formats. This is to that the file format
can become as widespread as the ZIP file format, and so that applications
developed in the future will not have to contend with changing file formats.

Future development paths may include;
  1. OS/2 support (with Virtual Pascal 2.x)
  2. translating the ASM sources in LZSS16.PAS and LZSS32.PAS into
     pure Pascal, for possible porting of the library to GNU Pascal
     and Free Pascal. The aim is to have this library available for
     a variety of operating systems.
  3. improving the password protection

For developments in the main distribution, it is paramount that full support
for *ALL* the currently supported platforms is maintained. This means that
developers must avoid the use of features in one compiler which are not
available in others. We have to use the lowest common denominator in all the
Borland-compatible Pascal compilers (basically, Delphi 2.x syntax for Win32,
and BP/TP 7.0 for the other platforms). There should be no problem doing this,
since the routines only work on files, and the "lowest common denominator"
file I/O routines in BP/TP 7.0 and Delphi 2.x are sufficient for any level
of file manipulation. Features in Delphi 3.x and 4.x which are not available
under Delphi 2.x, should, for example, be avoided at all costs. So should
things like Collections under BP/TP, and Stringlists under Delphi.

If you are interested in working on any of the above features for the
main ChiefLZ distribution, please get in touch with me.

CONTRIBUTIONS
-------------
You may, of course, develop your own units for a particular platform only.
If you do so, please let me have a copy for possible inclusion in a
"Contrib" directory. If you do this, please embed as much commentation as
possible into the sources, so that it is clear what the routines do, and
how to use them. Also include one or two example programs that use the
functionality of the units.


LICENSE
-------
This package is released as FREEWARE. This means that it is FREE, but it
is *NOT* public domain software. Dr A Olowofoyeku and Chris Rankin retain
full copyright in all the source files, except LZSS16.PAS (which is
original to someone else).

You may freely use these routines in your own programs. If you produce
any application that uses the routines in this package, please give credit
to Dr A Olowofoyeku and Chris Rankin.

You may freely redistribute this package, on the conditions;
   [a] that the whole package (and ALL the files therein) is redistributed,
   AND,
   [b] that NO alteration is made to the package, or to any of the files
       in it,
   AND,
   [c] that no charge (other than charges for disk duplication and
       handling, in any case, not exceeding $5.00 (US) or equivalent)
       be made for any redistribution.

Bulletin boards and CD-ROM producers make freely distribute this package,
subject to the above conditions.

***************
**** NOTE:*****
***************
All use of this package is SUBJECT TO THE DISCLAIMER AT THE END OF THIS
FILE.

Supported platforms
-------------------
This package supports the following Pascal platforms;

1. Turbo/Borland Pascal 7.x (DOS, DPMI, Win16)
2. Delphi 1.x
3. Delphi 2.x
4. Delphi 3.x
5. Virtual Pascal 2.0 (Win32)


Features
--------
1. Compiles for all Borland Pascal platforms (DOS, DOS DPMI, Win16, and
   Win32).
2. Functions can be statically linked into programs.
3. Functions can be (for DOS DPMI, Win16 and Win32) compiled into a DLL.
4. Import units for (implicit and explicit) DLL use.
5. Compresses and Decompresses single files.
6. Compiles several files into an archive, and dearchives this.
7. Returns the contents of Chief LZ archives.
8. Stores (for Win16 and Win32) version information from Windows binaries.
9. Pascal object and Delphi component to encapsulate the functionality of
   the package (cannot be exported from the DLL).
10. Supports disk spanning

Limitations
-----------
1. No OS/2 support (yet).
2. The main compression algorithms in LZSS16.PAS and LZSS32.PAS are not
   portable because of heavy reliance on ASM code. If anybody can translate
   them to pure Pascal, please send me a copy  (to be added to future
   releases).
3. Password protection is rudimentary. Since the source code is freely available
   there may be no point in developing an elaborate password protection mechanism
   in the public release version.

Exported routines
-----------------
Below is a simple list of the routines exported by the ChiefLZ
package (unit and/or DLL).

1. Single File LZ Compression
------------------------------
*  function  LZCompress               - compress single file
*  function  LZDecompress             - decompress single file
*  function  LZCompressEx             - compress single file
*  function  LZDeCompressEx           - decompress single file
*  function  IsChiefLZFile            - is it an LZ compressed file?
*  function  IsChiefLZFileEx          - is it an LZ compressed file?
*  function  GetChiefLZFileName       - get filename from inside LZ file
*  function  GetChiefLZFileSize       - get real size from inside LZ file
*  function  GetChiefLZFileInfo       - get full details of a file
*  function  GetLZMarkerChar          - get marker for LZ file extension
*  procedure SetLZMarkerChar          - set marker for LZ file extension

2. Compression into LZ Archives
-------------------------------
*  function  LZHeader_Construct       - allocate memory for the archive header
*  function  LZHeader_Destroy         - free memory for the archive header
*  procedure SetIgnoreExtensions      - set file extension to store without compression
*  function  GetIgnoreExtensions      - get the file extensions to store without compression
*  function  LZArchive                - archive some files
*  function  LZArchiveEx              - archive some files (shell to LZArchive)
*  function  LZDeArchive              - dearchive a ChiefLZ archive
*  function  LZDeArchiveEx            - dearchive a ChiefLZ archive (shell to LZDeArchive)
*  function  LZDeArchive_              - dearchive a ChiefLZ archive (low level)
*  function  LZListArchive            - list the contents of an archive
*  function  IsChiefLZArchive         - is it a ChiefLZ archive?
*  function  IsChiefLZArchiveEx       - is it a ChiefLZ archive?
*  function  GetChiefLZArchiveSize    - get real size of Archive
*  function  GetChiefLZArchiveInfo    - return info in archive header
*  function  GetFullLZName            - return a file name from LZ archive
*  procedure SetDecompressMask        - set dearchive file mask
*  function  GetDecompressMask	      - return the current dearchive file mask
*  function  SetCheckFileCRCs         - set the dearchive CRC checking flag
*  function  SetArchiveHeaderBegin    - set the value of the beginning of the header information
*  function  SetArchiveSetPassWordFunc - specify the callback for setting passwords
*  function  SetArchiveCheckPassWordFunc - specify the callback for checking passwords
*  procedure FreePassWordFlag         - disable password checking temporarily
*  procedure ResetPassWordFlag        - re-enable password checking
*  function  HasPassWord    	      -	is the archive password protected?
*  function  SetFileMatchFunc         - specify the callback to check for file matches
*  function  GetFileMatchFunc         - get the address of the file-matching callback
*  function  FileMatch                - the default filename/filemask matching function
*  function  LocalArchiveHeaderPtr    - return the address of the internal structure for archive details
*  function  ExtractArchiveCommentFile - extract the comment file from the archive
*  function  MarkArchiveCommentFile   - mark a file as a ChiefLZ archive comment file

3. Self-Extracting Archives
---------------------------
*  function  IsChiefLZSfxArchive      - is this a ChiefLZ SFX archive?
*  function  LZSfxArchive             - create an SFX archive
*  function  LZSfxDearchive           - decompress an SFX archive
*  function  LZArchiveFromLZSFXArchive- extract the LZ archive from an SFX archive

4. Disk spanning routines
-------------------------
*  function  IsChiefLZSpannedArchive   - is this a spanned Chief LZ archive?
*  function  IsChiefLZSpannedArchiveEx - is this a spanned Chief LZ archive?
*  function  IsChiefLZSpannedHeader    - is this the header of a spanned archive? 
*  function  SetSpanDiskPromptFunc     - specify the function to request for disks
*  function  LZArchiveSpan	       - create a spanned archive


5. DLL routines
---------------
*  function  ChiefLZDLLVersion        - return version of LZ DLL


File List
---------
1.  CHFTYPES.PAS    -  assorted data types used by the package
2.  CHFUTILS.PAS    -  assorted shared functions and procedures
3.  CHIEFLZ.PAS     -  the main "Chief" LZ unit (can be compiled to a DLL)
4.  CHFCRC.PAS      -  32-bit CRC routines
5.  LZ.PAS          -  test program (for BPW, TPW, TP7, VP2)
6.  LZ.DPR          -  test program (for Delphi 1.x and Delphi 2.x - same as LZ.PAS)
7.  LZDEFINE.INC    -  assorted conditional defines
8.  LZEXPLIC.PAS    -  unit for explicitly loading the LZ DLL
9.  LZSS16.PAS      -  the 16-bit LZSS compression algorithm
10. LZSS32.PAS      -  the 32-bit LZSS compression algorithm
11. LHSIX.PAS       -  "SixPack" Huffman compression algorithm
11A.LH6.PAS         -  test program for SixPack Huffman
12. CHFLZSS.PAS     -  unit for Pascal object/Delphi component
13. LZ_CONST.PAS    -  some constants (Win32)
14. LZ_CONST.RC     -  string table for messages (Win32)
15. LZ_CONST.RES    -  string table resources (Win32)
16. LZ_DLL.PAS      -  some constants for DLL use (Win32)
17. LZ_DLL.RC       -  string table for messages (Win32)
18. LZ_DLL.RES      -  string table resources (Win32)
19. LZ_LINK.PAS     -  more constants for DLL use (Win32)
20. LZ_LINK.RC      -  more constants for DLL use (Win32)
21. LZ_LINK.RES     -  more constants for DLL use (Win32)
22. LZ2.PAS	    -  test program using OOP for archives and single files
23. LZ2.DPR	    -  test program using OOP for archives and single files
24. TESTOBJ1.PAS    -  very simple OOP test program to compress a single file
25. TESTOBJ1.DPR    -  very simple OOP test program to compress a single file
26. STUB.PAS        -  simple SFX stub
27. STUB.DPR        -  simple SFX stub
28. CHFHASH.PAS     -  simple password hashing
29. README.TXT      -  this file
30. FILE_ID.DIZ     -  description file for BBS use
31. HISTORY.TXT	    -  history file


SAMPLE Delphi Program
---------------------
1. Delphi32\testlzss.dpr  - sample Delphi 32 bit project
2. Delphi32\testunit.pas  - project's main unit
3. Delphi32\progress.pas  - unit for progress dialog form
4. Delphi32\ ....         - other support files for the project

Compiled DLLs (compiled without DEBUG information)
-------------
1. DLL\LZDPMI16.DLL - 16-bit DOS Protected Mode DLL
2. DLL\LZWIN16.DLL  - 16-bit Windows DLL
3. DLL\LZWIN32.DLL  - 32-bit Windows DLL
   (this was compiled with Delphi2 - if you want to use this DLL with
    Virtual Pascal programs, you must first recompile the DLL with Virtual Pascal);


!!! Please note the disclaimers below !!!

    DISCLAIMER
    ----------
    WE DO NOT WARANTEE ANYTHING CONCERNING ANY OF THE SOURCES OR FILES
    WHICH MAKE UP THIS CHIEFLZ PACKAGE. WE ACCEPT NO RESPONSIBILITY FOR
    ANY LOSS OR DAMAGE OF ANY KIND, INCLUDING, BUT NOT LIMITED TO, LOSSES
    OF A PHYSICAL, MENTAL, SOCIAL, FINANCIAL, MARITAL, OR OF WHATEVER
    NATURE, RESULTING FROM THE USE, OR THE PURPORTED USE, OF THIS CHIEFLZ
    PACKAGE OR ANY OF THE FILES IN THE PACKAGE, FOR ANY PURPOSE WHATSOEVER.
    WE DO NOT EVEN WARANTEE THAT THE FILES WILL NOT KILL YOU.

    YOU USE THIS CHIEFLZ PACKAGE ENTIRELY AT YOUR OWN RISK, AND YOU SUPPLY
    IT TO YOUR CUSTOMERS, FRIENDS, FAMILY, ACQUAINTANCES, OR ENEMIES,
    ENTIRELY AT YOUR OWN RISK.

    IF THESE TERMS ARE NOT ACCEPTABLE TO YOU, THEN PLEASE DELETE ALL
    THE FILES FROM YOUR DISKS IMMEDIATELY AND PERMANENTLY.


    In this disclaimer, "WE" refers to:
    Dr A Olowofoyeku, Chris Rankin, and Allan Mertner


---------------------------------------------------------------
January 1999
Dr. Abimbola Adeleke Olowofoyeku (The African Chief)
Email:  laa12@keele.ac.uk
http://ourworld.compuserve.com/homepages/African_Chief/
----------------------------------------------------------------
