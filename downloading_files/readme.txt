DictInstall
The OpenOffice.org Dictionary Installer
v0.9.x


INTRODUCTION
------------

This is a small wizard-style program which downloads and installs spell checking
dictionaries into OpenOffice.org 1.0.

It currently runs only on Microsoft Windows. Since this program has been written
using Borland Delphi, it should be possible to port it to Linux (using Kylix). I hope
to do this sometime.


INSTALLATION
------------

The program does not need to be permanently installed. Just unzip the .zip file
into a folder, and then double click on 'dictinstall.exe'. After that, you need only
follow the steps on screen to download and install dictionaries.

Note that dictionaries will still need to be registered from within OpenOffice.org.
For instructions on this, please see:

    http://www.ooodocs.org/dictinstall/nexthelp.html


IMPORTANT
---------

This is beta software ... it could do horrible things to your installation of OpenOffice.org
or your computer. As far as I am aware, it hasn't done so to anyone's PC yet, but ... well,
you know the deal -- you use it at your own risk.


CREDITS
-------

Special thanks to:

Marco Huggenberger, OpenOffice.org Developer: German translation of the program,
web site and installation guide.

Thanks also to everyone who has tested DictInstall and provided me with very valuable
feedback.


TECHNICAL
---------

DictInstall is written in Borland Delphi 6. The source is available from the homepage 
and is released under the LGPL (please see license.txt for further information). It uses
the components listed below, which you will need to download and install into Delphi
before you are able to build DictInstall).

ICS
Internet Component Suite; a full suite of TCP/IP components.

    Available from: http://www.overbyte.be

TZip
A non visual zip component written by Angus Johnson which utilises Eric Engler's
zip libraries, those are in turn based on InfoZIP.
  
    TZip: http://rpi.net.au/~ajohnson/delphi/
    Eric Engler: http://www.geocities.com/siliconvalley/network/2114/
    InfoZIP: http://www.info-zip.org


Thank you to the creators of these components for helping to make DictInstall possible!


FEEDBACK
--------

Please email me with any bug reports, questions or comments:
leecorbin@openoffice.org.

Home page: http://www.ooodocs.org/dictinstall/


Lee Corbin
April - May 2002