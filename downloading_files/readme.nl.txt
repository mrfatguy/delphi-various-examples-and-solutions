DictInstall
Het OpenOffice.org Woordenlijst Installatieprogramma
v0.9.x


INLEIDING
------------

Dit is een klein wizard-achtig programma dat woordenlijsten voor spellingcontrole downloadt en 
installeert in OpenOffice.org 1.0.

Het loopt momenteel alleen onder Microsoft Windows. Aangezien dit programma geschreven is met behulp 
van Borland Delphi, zou het mogelijk moeten zijn het te porten naar Linux (gebruik makend van Kylix). 
Ik hoop hier ooit aan toe te komen.


INSTALLATIE
------------

Het programma hoeft niet permanent geïnstalleerd te worden. Pak het .zip bestand eenvoudig uit 
in een map, en dubbelklik dan op 'dictinstall.exe'. Daarna hoeft u slechts de stappen op het scherm
te volgen om de woordenlijsten te downloaden en te installeren.

Let erop dat de woordenlijsten nog moeten worden geactiveerd in OpenOffice.org.
Voor instructies, zie

    http://www.ooodocs.org/dictinstall/nl/nexthelp.html


BELANGRIJK
---------

Dit is beta software ... het kan verschrikkelijke effecten hebben op uw installatie van OpenOffice.org
of uw computer. Voor zover ik weet, is dit nog bij niemand voorgekomen, maar ik wijs er op dat u het
op eigen risico gebruikt. 

BEDANKT
-------

Speciale dank aan:

Marco Huggenberger, OpenOffice.org ontwikkelaar: Duitse vertaling van het programma,
web site en installatiegids.

Iedereen die DictInstall heeft getest en mij van waardevolle suggesties heeft voorzien.


TECHNISCH
---------

DictInstall is geschreven in Borland Delphi 6. De broncode is beschikbaar vanaf de thuispagina 
en wordt onder de LGPL beschikbaar gesteld (zie license.txt voor meer informatie). Het gebruikt de 
hieronder opgesomde componenten, welke u moet downloaden en installeren om Dictinstall te kunnen builden).

ICS
Internet Component Suite; een bibliotheek van TCP/IP componenten

    Verkrijgbaar bij: http://www.overbyte.be

TZip
Een niet interactieve zip component geschreven door Angus Johnson die gebruik maakt van Eric Engler's
zip bibliotheken, welke weer op InfoZIP gebaseerd zijn.
  
    TZip: http://rpi.net.au/~ajohnson/delphi/
    Eric Engler: http://www.geocities.com/siliconvalley/network/2114/
    InfoZIP: http://www.info-zip.org


Dank aan de schrijvers van deze componenten om Dictinstall mogelijk te maken!


FEEDBACK
--------

E-mail mij a.u.b. eventuele foutrapporten, vragen of commentaar (in het Engels)
leecorbin@openoffice.org.

thuispagina: http://www.ooodocs.org/dictinstall/nl


Lee Corbin
April - May 2002