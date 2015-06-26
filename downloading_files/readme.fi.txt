DictInstall
The OpenOffice.org Sanastojen Asentaja
v0.9.x



ESITTELY
--------

Tämä on pieni ohjastettu velho-tyyppinen ohjelma joka lataa ja asentaa oikein-
kirjoituksen sanastot toimisto-ohjelmaan OpenOffice.org 1.0.

Ohjelma toimii tällä hetkellä vain Microsoftin Windowsissa. Koska ohjelma on
kirjoitettu käyttäen Borland Delphiä, on sen siirtäminen mahdollista Linuxiin
(käyttäen Kylixiä). Toivottavasti tulen tekemään tämän jossain vaiheessa.


ASENNUS
-------

Ohjelmaa ei tarvitse asentaa pysyvästi. Pura vain .zip tiedosto kansioon ja sitten
tuplaklikkaa 'dictinstall.exe'. Tämän jälkeen seuraat vain ohjeita ruudulta ladataksesi
ja asentaaksesi sanastot.

Huomaa että sanastot täytyy vielä rekisteröidä ohjelman OpenOffice.org asetuksista.

Ohjeet tähän löytyvät osoitteesta:

    http://www.ooodocs.org/dictinstall/fi/nexthelp.html


TÄRKEÄÄ
-------

Tämä on beta ohjelma... ja se voi tehdä kauheita asioita OpenOffice.org asennuksellesi tai
koneellesi. Tähän mennessä ei vielä kylläkään ole tiedossani yhtään tapausta, mutta... tiedät
kyllä ehdot -- käytä ohjelmaa omalla vastuullasi.


KIITOKSET
---------

Erityiset kiitokset:

Marco Huggenberger, OpenOffice.org Kehittäjä: Saksan kielen käännös ohjelmasta,
web sivusta ja asennusoppaasta.

Kiitos myös kaikille, jotka ovat testanneet DictInstall ohjelmaa ja antaneet hyvin
arvokasta palautetta.


TEKNISTÄ
--------

DictInstall on kirjoitettu Borland Delphi 6:lla. Lähdekoodi on saatavilla kotisivulta
ja on annettu käyttöön LGPL lisenssin alaisena (lisätietoa license.txt tiedostosta).
Se käyttää alla lueteltuja komponentteja, jotka sinun täytyy ladata ja asentaa Delphiin
ennen kuin voit uudelleen rakentaa DictInstallin.


ICS
Internet Component Suite; täysi paketti TCP/IP komponentteja.

    Saatavilla: http://www.overbyte.be

TZip
Ei visuaalinen zip komponentti, jonka on kirjoittanut Angus Johnson. Tämä hyödyntää
Eric Englerin zip kirjastoja, jotka taasen perustuvat InfoZIP ohjelmaan.
  
    TZip: http://rpi.net.au/~ajohnson/delphi/
    Eric Engler: http://www.geocities.com/siliconvalley/network/2114/
    InfoZIP: http://www.info-zip.org


Kiitoksia näiden komponenttien luojille DictInstall ohjelman teon mahdollistamisesta!


PALAUTE
-------

Lähetä sähköpostilla bugi-raportit, kysymykset tai kommenttisi:
leecorbin@openoffice.org.

Kotisivu: http://www.ooodocs.org/dictinstall/


Lee Corbin
April - May 2002