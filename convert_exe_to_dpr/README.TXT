EXE2DPR - Delphi project sources Rescuer. Version 3.1 (23/09/99)
================================================================

Overview
--------
If you lose your Delphi 1.0-4.0 or C++Builder 3.0 project sources, but 
have an executable file, then this tool can rescue part of lost sources.

Rescuer produces all project forms and data modules with all assigned
properties and events. Produced event procedures don't have a body (it is
not a decompiler), but have an address of code in executable file.

For C++Builder executables Rescuer make Delphi-compatible sources.

In most cases, I think, Rescuer saves 50-90% of your time to projects
reconstruction.


Usage notes
-----------
Use command line 'exe2dpr [-o] exeFile'. Project sources will be created
in current directory. If you want overwrite any existing files in current
directory, then use option '-o'.

You can't to process files, that is not 'runnable', ie if unavailable any
dll or dpl, that this file used.


Versions history
----------------
Version 3.1 (23/09/99):
- fixed bug: 'Forms not found' on some Delphi 1.0 executables.

Version 3.0 (24/04/99):
- now supported Delphi 1.0 (win16) executables;
- now supported C++Builder 3.0 executabled;

Version 2.0 (02/10/98):
- now supported Delphi 4.0 executables;
- fixed bug: 'Parsing error' on executables, that was compiled with packages.
  This error occurs only under Windows-NT;
- fixed bug: command line parsing error when was used '"' delimiter, ie some
  like 'exe2dpr "c:\Program Files\My file.exe" -o';
- fixed bug: manually changed names was processed unproperly. For example, if
  event procedure declaration was changed to 'procedure BuTtOn1ClIcK( Sender:
  TOblect );', then it was generated as 'procedure BuTtOn1ClIcK;'

Version 1.0 (15/12/97):
- project created;


Registration
------------
This archive contains demo version of tool, that produces only 3 forms or/and
data modules from project.

If you would like to register Rescuer, you can do the registration online
on the Internet. Registration fee: $39.

See additional information in file register.txt


Author
------
Dmitriy Goldobin (gold@ems.ru, http://www.ems.ru/~gold/ )
Chelyabinsk, Russia.
