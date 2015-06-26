{ Unit to implement simple password protection

THIS CODE WILL COMPILE FOR THE FOLLOWING PLATFORMS;
     Dos Real mode - TP7, BP7
     Dos DPMI      - BP7, BPW
     Win16         - BPW, TPW, Delphi 1.x
     Win32         - Delphi 2.x
     Win32         - Delphi 3.x
     Win32         - Virtual Pascal 2.x

     Dr Abimbola A Olowofoyeku (The African Chief);
     Email:  laa12@keele.ac.uk
     http://ourworld.compuserve.com/homepages/African_Chief/
}


UNIT CHFHASH;
{$i lzdefine.inc}
INTERFACE

USES
CHFTYPES;

{ a simple "one-way" hash function; this can be as complex as you wish }
FUNCTION SimpleHash ( CONST s : TLZString ) : TLZCount;

{ example of a simple way to manipulate the header, to store a password }
FUNCTION SetHeaderPassWord ( CONST PassWd : TLZString; VAR Header : TLZArchiveHeader ) : TLZCount;

{ example of a simple way to manipulate the header, to check a password }
FUNCTION CheckHeaderPassWord ( CONST PassWd : TLZString; CONST Header : TLZArchiveHeader ) : TLZCount;

{ simple function to retrieve string input - for text mode applications only }
FUNCTION GetStringValue ( CONST Prompt : TLZString ) : TLZString;

IMPLEMENTATION

FUNCTION SimpleHash ( CONST s : TLZString ) : TLZCount;
VAR
i, j, l : TLZCount;
BEGIN
   l := ( ( 517 ) + Length ( s ) ) * ( 71351 - Length ( s ) );
   FOR i := 1 TO length ( s ) DO BEGIN
       j := ( Ord ( s [i] ) + i ) * ( Ord ( s [i] ) * 3 );
       Inc ( l, j );
   END;
   SimpleHash := l;
END;
{/////////////////////////////////////////////////}
FUNCTION SetHeaderPassWord ( CONST PassWd : TLZString; VAR Header : TLZArchiveHeader ) : TLZCount;
BEGIN
   SetHeaderPassWord := LZCode_NoPassWord;
   WITH Header.Reserved DO BEGIN
        MagicN [4] := - 2050;     { no password is supplied }
        IF PassWd = '' THEN EXIT;
        SetHeaderPassWord := LZCode_NewPassWord;
        MagicN [4] := SimpleHash ( PassWd );
        MagicN [5] := ( MagicN [4] * 25 );
   END;
END;
{/////////////////////////////////////////////////}
FUNCTION CheckHeaderPassWord ( CONST PassWd : TLZString; CONST Header : TLZArchiveHeader ) : TLZCount;
BEGIN
   CheckHeaderPassWord := LZCode_NoPassWord;
   WITH Header.Reserved DO BEGIN
        IF ( MagicN [4] = - 2050 ) THEN Exit; { no password is there }

        CheckHeaderPassWord := LZCode_WrongPassWord;

        IF PassWd = '' THEN Exit;

        IF  ( MagicN [4] = SimpleHash ( PassWd ) )
         AND ( MagicN [4] = MagicN [5] / 25 )
          THEN CheckHeaderPassWord := LZCode_CorrectPassWord;
   END;
END;
{/////////////////////////////////////////////////}
FUNCTION GetStringValue ( CONST Prompt : TLZString ) : TLZString;
VAR
s : TLZString;
BEGIN
    Write ( Prompt );
    Readln ( s );
    GetStringValue := s;
END;
{/////////////////////////////////////////////////}


END.

