                         ELDOS SOUNDS 1.11

      1. WHAT'S ELDOS SOUNDS?

EldoS  Sounds is the freeware collection of decoders for different sound formats
and supplementary components. EldoS Sounds started its  life  as  a continuation
of  MPegPlay  project. The open scheme of EldoS Sounds allows different decoders
to  be  developed  and  used.  You can plug these decoders to  your  program  in
run-time.

      2. IS ELDOS SOUNDS REALLY FREE?

Yes. It is freeware, under the terms of the license, included  in  this package.

      3. HOW DO I INSTALL ELDOS SOUNDS?

As   with   any   component,  you  use Component|Install Component command  from
Delphi IDE menu.

      4. HOW DO I USE ELDOS SOUNDS?

The  help  file  is  included  in  this package.

      5. HOW IS ELDOS SOUNDS RELATED  TO  OPEN-SOURCE  CONCEPT?

It  is  related  :).  EldoS  needs  help  with  EldoS Sounds  development.  Your
suggestions,  bug-fixes,  improvements  and support are welcome.  Everyone   may
request  the  source  code for the modules, made by EldoS (please,  explain  the
reason).

      6.  WHO'S  GUILTY?

Good   question.

The  Delphi  component   itself   is  the   creature   constructed by me, Eugene
Mayevski.

Windows  Media   Audio  interface module is written by Eugene Mayevski.  Windows
Media  Audio  decoder   core   is   the  property  of Microsoft.

Original WAVMP module was coded by Eugene Mayevski. Versio 1.11 includes rebuilt
decoder by Sandro Cumerlato.

OGGMP reference code has been developerd by XIPHOPHORUS Company (www.xiph.org). 
The decoder module was built by Dmitry Bogovich (bogovich@eldos.org).

The  history   of ElAMP,  MPEG  decoder  module  used  in  EldoS  Sounds is long
...  The  ISO   MPEG  Audio   Subgroup  Software  Simulation   Group  wrote  the
public   C   code  for a MPEG  Audio  decoder,  and  the  layer    III  code  of
maplay     for     Win32     was    adapted     from     here.   Tobias   Bading
(bading@cs.tu-berlin.de)   wrote  the original maplay   source  for  UNIX.  Jeff
Tsay  (ctsay@pasteur.eecs.berkeley.edu)   ported  the    original    maplay   to
Win32,   wrote   the   interface   code and adapted and optimized the layer  III
code  from  the  public  c   code.  Me,  Eugene  Mayevski, made MPegPlay    1.x,
which      was      based      on      maplay      1.20.      Stephan     Koenig
(Thunderboy@gmx.net) helped a bit to  make  MPegPlay  1.x (mainly error  fixes).
While  working  on commercial ActiveMP control, Stephan Koenig and   I,  we both
improved  audio  subsystem (it was a total nightmare; WinMM is a heap  of shit!)
and  streaming. Stephan Koenig decided to change the decoder core and changed it
:).    He  took   Michael   Hipp's  (hippm@informatik.uni-tuebingen.de)  mpeg123
core.  !!!!!!!!!!!  BIG THANKS TO MICHAEL HIPP FOR THE PERFECT DECODER !!!!!!!!!
The   rest   of  the  code  with  some   modifications  came  from  ActiveMP and
MPegPlay   1.x.   After   Stephan   Koenig  had disappeared and no  releases  of
MPegPlay   2.0  were  avaiable,  I decided to take the code assembled by Stephan
Koenig   and release MPegPlay 2.0. But, well, further modifications of this code
were big enough to start a new product. You know the rest ...
