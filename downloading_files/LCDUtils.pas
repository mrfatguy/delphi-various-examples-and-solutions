{
    LCDUtils v0.4 - A collection of simple routines

    Last updated: 25 April 2002
    Copyright (C) 2002 Lee Corbin
    lee@lcdweb.co.uk

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
}

unit LCDUtils;

interface

uses Classes, SysUtils;

function SplitString(InStr, SplitStr: String; var StrList: TStringList): Integer;
function EscapeString(RawStr: String): String;
function UnescapeString(RawStr: String): String;
function ReplaceString(var SourceStr: String; FromStr, ToStr: String; CaseSensitive: Boolean): Integer;

implementation

{
  SplitString: Takes an input string, splits it and adds elements to a
  provided StringList. The SplitStr is the character (or characters) used
  to split. Eg:

       SplitString('Hello:There', ':', MyStringList);

  would add "Hello" and "There" to MyStringList, and:

       SplitString('Just==Testing=you=====know', '=', MyStringList);

  would add "Just", "Testing", "you" and "know".
  You can use longer split strings:

       SplitString('Good<->Afternoon', '<->', MyStringList);
}
function SplitString(InStr, SplitStr: String; var StrList: TStringList): Integer;
var
	SplitCount, CurPos: Integer;
	TempStr: String;
begin
	SplitCount := 0;
	CurPos := Pos(SplitStr, InStr);
	while (CurPos > 0) do
	begin
		TempStr := Copy(InStr, 0, curPos - 1);
		{if Length(TempStr) > 0 then
		begin}
			StrList.Add(TempStr);
			Inc(SplitCount);
		{end;}
		InStr := Copy(InStr, CurPos + Length(SplitStr), Length(InStr));
		CurPos := Pos(SplitStr, InStr);
	end;
   {if Length(InStr) > 0 then
   begin}
       StrList.Add(InStr);
       Inc(SplitCount);
   {end;}
   Result := SplitCount;
end;

{
   EscapeString and UnescapeString strip any non alphanumeric characters
   from a string, replacing with a code, eg. "Hi there" becomes "Hi%20there".
}
function EscapeString(RawStr: String): String;
var
   i: Integer;
   ThisChar: String;
   TmpChr: Char;
begin
   Result := '';
   for i := 1 to Length(RawStr) do
   begin
       ThisChar := Copy(RawStr, i, 1);
       if ((ThisChar >= '0') and (ThisChar <= '9')) or
          ((ThisChar >= 'A') and (ThisChar <= 'Z')) or
          ((ThisChar >= 'a') and (ThisChar <= 'z'))
       then begin
          Result := Result + ThisChar;
          Continue;
       end;
       TmpChr := ThisChar[1];
       Result := Result + '%' + IntToHex(Integer(TmpChr), 2);
   end;
end;

function UnescapeString(RawStr: String): String;
var
   i: Integer;
   ThisChar, CharCode: String;
begin
   Result := '';
   i := 1;
   while i < Length(RawStr) + 1 do
   begin
       ThisChar := Copy(RawStr, i, 1);
       if ThisChar <> '%' then
       begin
           Result := Result + ThisChar;
           i := i + 1;
           Continue;
       end;
       CharCode := Copy(RawStr, i + 1, 2);
       i := i + 3;
       Result := Result + Chr(StrToInt('$' + CharCode));
   end;
end;

{
   ReplaceString is a simple string replacing procedure. All occurences in SourceStr
   of FromStr will be replaced with ToStr and the number of replacements returned.
}
function ReplaceString(var SourceStr: String; FromStr, ToStr: String; CaseSensitive: Boolean): Integer;
var
   CurPos, ReplaceCount: Integer;
   RetStr: String;
   TempStr: String;
begin
   if not CaseSensitive then FromStr := LowerCase(FromStr);
   CurPos := 1;
   ReplaceCount := 0;
   RetStr := '';
   while CurPos <= Length(SourceStr) do
   begin
       TempStr := Copy(SourceStr, CurPos, Length(FromStr));
       if not CaseSensitive then
       begin
           TempStr := LowerCase(TempStr);
       end;
       if TempStr = FromStr then
       begin
           RetStr := RetStr + ToStr;
           CurPos := CurPos + Length(FromStr);
           Inc(ReplaceCount);
       end else
       begin
           RetStr := RetStr + SourceStr[CurPos];
           Inc(CurPos);
       end;
   end;
   SourceStr := RetStr;
   Result := ReplaceCount;
end;

end.
