{
* unit for a basic line editor; cannibalised from some PD code
* only for character/console mode programs

THIS CODE WILL COMPILE FOR THE FOLLOWING PLATFORMS;
     Dos Real mode - TP7, BP7
     Dos DPMI      - BP7, BPW
     Win16         - BPW, TPW, Delphi 1.x
     Win32         - Virtual Pascal 2.x

     Dr Abimbola A Olowofoyeku (The African Chief);
     Email:  laa12@keele.ac.uk
     http://ourworld.compuserve.com/homepages/African_Chief/
}
UNIT LZInput;

{$i LZDefine.inc}

INTERFACE

USES ChfTypes;

{  return a string:
   IsPassword = whether to use '*' instead of echoing each character typed
}
FUNCTION GetString ( CONST Prompt : TLZString; CONST MaxLen : Byte; CONST IsPassWord : Boolean ) : TLZString;

IMPLEMENTATION

USES
{$ifdef Win16}
WinCrt;
{$else Win16}
{$ifdef Delphi32}
{ for Delphi, get Claus Ziegler's CRT32 unit: it is not free, but it is good
  check:  http://www.zieglersoft.dk
}
Crt32;
{$else Delphi32}
Crt32;
{$endif Delphi32}
{$endif Win16}


FUNCTION GetString;

CONST
EndKey     = 1000;
HomeKey    = 1001;
InsKey     = 1002;
DelKey     = 1003;
LeftArrow  = 1004;
RightArrow = 1005;
UpArrow    = 1006;
DownArrow  = 1007;
BackSpace  = 8;
Tab        = 9;
ESC        = 27;
ENTER      = 13;
F1         = 1100;
F2         = 1101;
F3         = 1102;
F4         = 1103;
F5         = 1104;
F6         = 1105;
F7         = 1106;
F8         = 1107;
F9         = 1108;
F10        = 1109;


VAR
StartString : TLZString;     {Working copy of the input TLZString}
ch2   : Word;
BegX, BegY : byte;
StartStr  : TLZString;
InsMode   : Boolean;

{ override the built-in Copy function }
FUNCTION Copy ( str : TLZString; CONST start, count : byte ) : TLZString;
VAR
i : byte;
BEGIN
   IF IsPassWord  { replace string with '*' }
   THEN BEGIN
      FOR i := 1 TO length ( str ) DO Str [i] := '*';
   END;
   Copy := System.Copy ( Str, start, count );
END;

{  the main routine }
FUNCTION GetTheInput ( VAR S : TLZString ) : char;
VAR
  ch : char;                {Most recently typed character}
  CursorX, Y : Word;        {Cursor Position}
  InsertionPoint : Word;    {Position in TLZString (not necessarily the same as
                            the cursor position, since there may have been
                            some horizontal scrolling}
  OrigX : Word;             {Starting Cursor Position}
  LineWidth : Word;         {Length of line we have to use - this program
                             decides this based on the amount of screen left
                             from the current cursor position.  This can easily
                             be modified to be accepted as a parameter, or
                             set to a particular constant}
  CursorMoved : boolean;    {True if cursor has moved}
  Scrollmark  : Word;

  FUNCTION max ( v1, v2 : integer ) : integer;
  BEGIN
    IF v1 > v2 THEN
      max := v1
    ELSE
      max := v2;
  END;

  PROCEDURE InsertChar ( c : char );
  BEGIN
    IF not CursorMoved THEN
      BEGIN
        StartString := '';
        GotoXY ( OrigX, Y );
      END;
    IF length ( StartString ) = MAXLEN THEN
      exit;
    CursorMoved := true;
    IF not InsMode THEN
      delete ( StartString, InsertionPoint, 1 );
    Insert ( ch, StartString, InsertionPoint );
    IF ( CursorX - OrigX ) < LineWidth THEN
      BEGIN
        Write ( copy ( StartString, InsertionPoint, LineWidth - CursorX + OrigX ) );
        inc ( CursorX );
      END
    ELSE
      BEGIN
        GotoXY ( OrigX, Y );
        Write ( copy ( StartString, max ( InsertionPoint - LineWidth + 1, 1 ), LineWidth ) );
      END;
    inc ( InsertionPoint );
    GotoXY ( CursorX, Y );
  END;

{--------------------------------------------------------}
            PROCEDURE DoEndKey;
                BEGIN
                   InsertionPoint := length ( StartString );
                   IF InsertionPoint < MAXLEN THEN
                     inc ( InsertionPoint );
                   IF InsertionPoint < LineWidth THEN
                     CursorX := InsertionPoint + OrigX - 1
                   ELSE
                     CursorX := OrigX + LineWidth;
                   GotoXY ( OrigX, Y );
                   Write ( copy ( StartString, max ( InsertionPoint - LineWidth, 1 ),
                              LineWidth ) );
                   GotoXY ( CursorX, Y );
                   CursorMoved := true;
                 END;
{--------------------------------------------------------}
               PROCEDURE DoHomeKey;
                BEGIN
                   InsertionPoint := 1;CursorX := OrigX;
                   GotoXY ( CursorX, Y );
                   Write ( copy ( StartString, 1, LineWidth ) );
                   GotoXY ( CursorX, Y );
                   CursorMoved := true;
                END;
{--------------------------------------------------------}

BEGIN  {GetTheInput}
     Write ( Prompt );
     LineWidth := 80 - WhereX;
     StartString := S;
     OrigX := WhereX;
     BegX := OrigX;
     Y := WhereY;
     BegY := Y;
     InsertionPoint := 1;
     CursorX := OrigX;
     CursorMoved := false;
     Write ( Copy ( StartString, 1, LineWidth ) );
     GotoXY ( CursorX, Y );

    {Main keystroke handling loop}
     REPEAT
      ch := ReadKey;
      ch2 := Ord ( ch );

      IF ch = #0  { extended key }
      THEN BEGIN
         ch := ReadKey; { read again }
         CASE ch OF
            'K' : ch2 := leftarrow;
            'M' : ch2 := rightarrow;
            'H' : ch2 := uparrow;
            'P' : ch2 := downarrow;
            'R' : ch2 := inskey;
            'S' : ch2 := delkey;
            'G' : ch2 := homekey;
            'O' : ch2 := endkey;
            'Q' : ch2 := endkey;  {pgdn}
            'I' : ch2 := homekey; {pgup}
         END;
      END;

      CASE ch2 OF
             {Home Key}
             HomeKey :
             BEGIN
               DoHomeKey;
             END;
             {End Key}
             EndKey :
             BEGIN
               DoEndKey;
             END;
             {Left arrow}
             LeftArrow :
             IF Not IsPassWord THEN
             BEGIN
                IF InsertionPoint > 1 THEN
                BEGIN
                       dec ( InsertionPoint );
                       IF CursorX > OrigX THEN
                         IF ( CursorX = OrigX + 5 )
                            AND ( InsertionPoint > 5 ) THEN
                            {Just check to see if we must scroll left -
                             can change constant 5 above if necessary.}
                           BEGIN
                             GotoXY ( OrigX, Y );
                             Write ( copy ( StartString, InsertionPoint - 5, LineWidth ) );
                           END
                         ELSE
                           dec ( CursorX )
                       ELSE
                         Write ( copy ( StartString, InsertionPoint, LineWidth ) );
                       GotoXY ( CursorX, Y );
                   CursorMoved := true;
                 END ELSE
                 BEGIN
                    DoEndKey;
                 END;
              END;
             {Right arrow}
             RightArrow :
              IF Not IsPassWord THEN
              BEGIN
                IF InsertionPoint < length ( StartString ) + 1 THEN
                BEGIN
                     inc ( InsertionPoint );
                     IF CursorX = ( OrigX + LineWidth - 1 ) THEN
                       BEGIN
                         GotoXY ( OrigX, Y );
                         Write ( copy ( StartString, max ( InsertionPoint - LineWidth + 1, 1 ),
                                    LineWidth ) );

                         IF InsertionPoint = length ( StartString ) + 1 THEN
                         Write ( ' '#8 );

                       END
                     ELSE
                       inc ( CursorX );
                     GotoXY ( CursorX, Y );
                     CursorMoved := true;
                END
                ELSE
                BEGIN
                    DoHomeKey;
                END;
              END;

             {Up arrow}
             UpArrow :
             BEGIN
             END;

             {Down arrow}
             DownArrow :
             BEGIN
             END;

             {Insert key - could add code here to change cursor or
              some other way indicate insert state}
             InsKey :
             BEGIN
                IF ( insmode = true ) THEN
                insmode := false ELSE insmode := true;
             END;

             {Delete key}
             DelKey :
             BEGIN
                   Delete ( StartString, InsertionPoint, 1 );
                   Write ( Copy ( StartString, InsertionPoint, LineWidth ) );
                   IF length ( StartString ) - InsertionPoint < LineWidth
                   THEN Write ( ' ' );
                   GotoXY ( CursorX, Y );
                   CursorMoved := true;
             END;

      BackSpace :
      BEGIN
           scrollmark := 3;

           IF InsertionPoint > 1 THEN
             BEGIN
               dec ( InsertionPoint );
               delete ( StartString, InsertionPoint, 1 );
               startstring := startstring + ' ';
               IF CursorX > OrigX THEN
                 IF ( CursorX = OrigX + scrollmark ) AND ( InsertionPoint > scrollmark )
                 THEN
                    {Just check to see if we must scroll left - can change
                     constant 5 above if necessary.}
                   BEGIN
                     GotoXY ( OrigX, Y );
                     Write ( copy ( StartString, InsertionPoint - scrollmark, LineWidth ) );
                   END
                 ELSE
                   BEGIN
                     dec ( CursorX );
                     GotoXY ( OrigX, Y );
                     Write ( copy ( StartString, InsertionPoint - CursorX + OrigX,
                     LineWidth ) );
                   END;
               GotoXY ( CursorX, Y );
               IF InsertionPoint > length ( StartString ) THEN
                 Write ( ' ' )       {Blank end of line}
               ELSE
                 BEGIN

                   IF Not IsPassWord THEN
                   Write ( copy ( StartString, InsertionPoint, LineWidth - CursorX + 1 ) );

                   IF ( length ( StartString ) - InsertionPoint ) <
                                ( LineWidth - CursorX )     THEN
                     Write ( ' ' );
                 END;
               GotoXY ( CursorX, Y );
               CursorMoved := true;
               Delete ( StartString, Length ( StartString ), 1 );
             END;
         END;

      {TAB - replace with spaces}
      {
      TAB:begin
           ch := #32;
           for loop:=1 to 8 do
             InsertChar(' ');
         end;
      }
      ESC : BEGIN
            IF ( length ( StartString ) > 0 ) OR ( InsertionPoint > 1 ) THEN
            BEGIN
                StartString := '';
                InsertionPoint := 1;
                CursorX := OrigX;
                ch := ' ';
                GotoXY ( OrigX, Y );
                Write ( '' : LineWidth );
                GotoXY ( OrigX, Y );
                CursorMoved := true;
             END
             ELSE BEGIN
                InsertionPoint := 1;
                CursorX := OrigX;
                ch := ' ';
                GotoXY ( OrigX, Y );
                StartString := '';
                Break;
             END;
          END; {Esc}
      ELSE IF ch <> #13 THEN BEGIN
           InsertChar ( ch );
        END;
    END;
  UNTIL ( ch IN [#13, #27] );
    S := StartString;
    GetTheInput := ch;
    writeln;
END  { GetTheInput };

BEGIN  { GetString }
   GetString := '';
   StartStr  := '';
   InsMode   := True;
   GetTheInput ( StartStr );
   GetString := StartStr;
 END;  { GetString }
{//////////////////////////////////////////////////}
END.
