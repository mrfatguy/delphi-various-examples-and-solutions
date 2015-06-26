{*********************************************************}
{                                                         }
{    Calmira Visual Component Library 1.0                 }
{    by Li-Hsin Huang,                                    }
{    released into the public domain January 1997         }
{                                                         }
{*********************************************************}

unit StylSped;

{ New speed button for Delphi-16.

  TStyleSpeed is the descendant which overrides Paint to draw a new
  border style over TSpeedButton's border.  There doesn't seem to
  be any noticeable impact on performance.  TStyleSpeed provides
  a new Style property to change between the old TSpeedButton, a
  TBitBtn look and a Windows95-like button.  (but Win95 uses a shade
  of grey which I couldn't find in the 3.1 system palette).
}

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Buttons;

type
  TSpeedStyle = (sbSpeed, sbBitBtn, sbWin95);

  TStyleSpeed = class(TSpeedButton)
  private
    FStyle : TSpeedStyle;
    procedure SetStyle(Value : TSpeedStyle);
  protected
    procedure Paint; override;
  published
    property Style : TSpeedStyle read FStyle write SetStyle default sbSpeed;
  end;

procedure Register;

implementation

procedure TStyleSpeed.SetStyle(Value : TSpeedStyle);
begin
  if Value <> FStyle then begin
    FStyle := Value;
    Invalidate;
  end;
end;


procedure TStyleSpeed.Paint;
begin
  inherited Paint;

  if Style = sbSpeed then Exit;

  if Style = sbBitBtn then
    with Canvas do begin
      Pen.Color := clBtnShadow;
      MoveTo(0, Height-2);
      LineTo(0, 0);
      LineTo(Width-2, 0);

      if FState in [bsDown, bsExclusive] then begin
        LineTo(Width-2, Height-2);
        LineTo(0, Height-2);

        Pen.Color := clBlack;
        MoveTo(1, Height-2);
        LineTo(1, 1);
        LineTo(Width-2, 1);

        Pen.Color := clWhite;
        MoveTo(Width-1, 0);
        LineTo(Width-1, Height-1);
        LineTo(-1, Height-1);
      end
    end

  else
    with Canvas do
    if FState in [bsDown, bsExclusive] then begin
      Pen.Color := clWhite;
      MoveTo(Width-1, 0);
      LineTo(Width-1, Height-1);
      LineTo(-1, Height-1);
    end
    else begin
      Pen.Color := clWhite;
      MoveTo(0, Height-1);
      LineTo(0, 0);
      LineTo(Width-1, 0);

      Pen.Color := clBtnFace;
      MoveTo(1, Height-2);
      LineTo(1, 1);
      LineTo(Width-2, 1);

      Pixels[0, Height-1] := clBlack;
      Pixels[1, Height-2] := clBtnShadow;
    end;
end;


procedure Register;
begin
  RegisterComponents('Samples', [TStyleSpeed]);
end;


end.
