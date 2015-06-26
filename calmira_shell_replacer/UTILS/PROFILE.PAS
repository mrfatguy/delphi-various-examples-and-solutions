{*********************************************************}
{                                                         }
{    Calmira System Library 1.0                           }
{    by Li-Hsin Huang,                                    }
{    released into the public domain January 1997         }
{                                                         }
{*********************************************************}

unit Profile;

{ TProfile is a simple extension of TIniFile that can read and
  write string lists, and properties of fonts and headers.

  The strings and headers are stored in the way Delphi stores
  INI lists, e.g.

  [Strings]
  Count=2
  S0=abc
  S1=def

  Fonts are written so that the values can easily be edited, e.g.

  [Main window]
  FontName=MS Sans Serif
  FontSize=8
  FontStyle=Bold Italic
}

interface

uses Classes, IniFiles, Graphics, ExtCtrls;

type
  TProfile = class(TIniFile)
  public
    procedure ReadStrings(const section: string; s: TStrings);
    procedure WriteStrings(const section: string; s: TStrings);
    procedure WriteSectionValues(const section: string; s: TStrings);
    procedure ReadFont(const section: string; Font: TFont);
    procedure WriteFont(const section: string; Font: TFont);
    procedure ReadHeader(const section: string; Header: THeader);
    procedure WriteHeader(const section: string; Header: THeader);
  end;

implementation

uses SysUtils, Strings;

procedure TProfile.ReadStrings(const section: string; s: TStrings);
var
  i: Integer;
begin
  for i := 0 to ReadInteger(section, 'Count', 0)-1 do
    s.Add(ReadString(section, 'S' + IntToStr(i), ''));
end;


procedure TProfile.WriteStrings(const section: string; s: TStrings);
var i: Integer;
begin
  WriteInteger(section, 'Count', s.Count);
  for i := 0 to s.Count-1 do WriteString(section, 'S' + IntToStr(i), s[i]);
end;


procedure TProfile.WriteSectionValues(const section: string; s: TStrings);
var i: Integer;
begin
  for i := 0 to s.Count-1 do
    WriteString(section, GetStrKey(s[i]), GetStrValue(s[i]));
end;


procedure TProfile.ReadFont(const section: string; Font: TFont);
var
  s : string[63];
  n : Integer;
  fs : TFontStyles;
begin
  s := ReadString(section,  'FontName', '');
  if s > '' then Font.Name := s;

  n := ReadInteger(section, 'FontSize', 0);
  if n > 0 then Font.Size := n;

  s := Lowercase(ReadString(section, 'FontStyle', ''));
  if s > '' then begin
    fs := [];
    if Pos('bold', s) > 0 then Include(fs, fsBold);
    if Pos('italic', s) > 0 then Include(fs, fsItalic);
    if Pos('underline', s) > 0 then Include(fs, fsUnderline);
    if Pos('strikeout', s) > 0 then Include(fs, fsStrikeOut);
    Font.Style := fs;
  end
  else Font.Style := [];

  s := ReadString(section, 'FontColor', '');
  if s > '' then Font.Color := StringToColor(s);
end;


procedure TProfile.WriteFont(const section: string; Font: TFont);
var
  s : string[63];
begin
  with Font do begin
    WriteString(section,  'FontName', Name);
    WriteInteger(section, 'FontSize', Size);
    s := '';
    if fsBold in Style then AppendStr(s, 'Bold ');
    if fsItalic in Style then AppendStr(s, 'Italic ');
    if fsUnderline in Style then AppendStr(s, 'Underline ');
    if fsStrikeOut in Style then AppendStr(s, 'Strikeout ');
    WriteString(section, 'FontStyle', s);
    WriteString(section, 'FontColor', ColorToString(Font.Color));
  end;
end;


procedure TProfile.ReadHeader(const section: string; Header: THeader);
var
  i, w: Integer;
begin
  for i := 0 to ReadInteger(section, 'SectionCount', 0) do
    with Header do
      if i < Sections.Count then begin
        w := ReadInteger(section, 'Section' + IntToStr(i), -1);
        if w > -1 then SectionWidth[i] := w;
      end;
end;


procedure TProfile.WriteHeader(const section: string; Header: THeader);
var
  i: Integer;
begin
  with Header do begin
    WriteInteger(section, 'SectionCount', Sections.Count);
    for i := 0 to Sections.Count-1 do
      WriteInteger(section, 'Section' + IntToStr(i), SectionWidth[i]);
  end;
end;

end.
