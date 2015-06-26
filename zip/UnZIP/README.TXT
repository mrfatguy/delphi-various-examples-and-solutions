UNZIPDLL.DLL version 2.06

New in 2.06: Now compiles also with Delphi 2.0 (32 bit)!

This a sixth version of the INFO-UNZIP DLL, based
on info-zip's unzip code. See the file copying for 
info-zip's copying restrictions. Only the non-
copyrighted part of this code is included in this
package. The code was translated from C to Pascal
by Christian Ghisler (100332.1175@compuserve.com) for
a shareware file manager replacement. The unshrinking
and unreducing part was rewritten by Christian Ghisler
to avoid the copyright on the original code by 
Mr. Smith.

Please report all bugs and fixes to the code to the
following internet email address:

100332.1175@compuserve.com

What is it?

unzipdll.dll is a dynamic link library for Windows
Version 3.0 and 3.1 which allows unzipping of data
zipped with pkzip version 1.1 or later. See the file 
info-unz.txt for a short explanation of the functions.
Btw, the units unzip.pas and zipread.pas can also be
used in DOS or Windows programs without any modifications.
See the sample program in example\dos.

unzipd32.dll is a DLL for Windows 95 and Windows NT.
unzip32.dpr compiles with Delphi 2.0. The functions
unzip.pas and readpack.pas can also be used directly
without a DLL.

How this package is structured:

Unzip all files including their directories. In the
root, there will be the files
readme.txt      This file
copying         Info-zip's copying licence
zipinter.pas    Interface unit to access the DLL.

In the directory \example\windows, you find the com-
piled .DLL and a simple compiled example program.
In \example\dos, you find the same program compiled
for DOS, using the same units. The source code for
both units is in \example. When using Borland Pascal,
the conditional variable "windows" is set when 
Windows is selected as target system. So, with
{$ifdef windows} special code for windows was added.

In the directory \source you find the source code of
the DLL and of two units, 

unzipdll.pas    DLL main body code, only calls the
                units
zipread.pas     To read the ZIP central directory
unzip.pas       Unzipping unit, split into multiple
                include files, all starting with z_

Copyright:

I do NOT claim any copyright on those parts of the
code I wrote myself. But I claim that noone else
claims a copyright on it.

Christian Ghisler 100332.1175@compuserve.com
