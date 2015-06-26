{*********************************************************}
{                                                         }
{    Calmira Visual Component Library 1.0                 }
{    by Li-Hsin Huang,                                    }
{    released into the public domain January 1997         }
{                                                         }
{*********************************************************}

unit BarGauge;

{ TBarGauge }

{ TBarGauge is a simplified version of Borland's sample TGauge, but is around
  10 times faster at drawing, because it doesn't bother to draw the
  clever "inverse" text effect.  Use it for speed critical applications.
}

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls;

type
  TBarKind = (bkHorizontal, bkVertical);

  TBarGauge = class(TGraphicControl)
  private
    { Private declarations }
    FMinValue: Longint;
    FMaxValue: Longint;
    FCurValue: Longint;
    FShowText: Boolean;
    FBorderStyle: TBorderStyle;
    FForeColor: TColor;
    FBackColor: TColor;
    FCtl3D : Boolean;
    FKind : TBarKind;
    procedure SetShowText(Value: Boolean);
    procedure SetBorderStyle(Value: TBorderStyle);
    procedure SetForeColor(Value: TColor);
    procedure SetBackColor(Value: TColor);
    procedure SetMinValue(Value: Longint);
    procedure SetMaxValue(Value: Longint);
    procedure SetProgress(Value: Longint);
    procedure SetCtl3D(Value: Boolean);
    procedure SetKind(Value: TBarKind);
    function GetPercentDone: Integer;
  protected
    { Protected declarations }
    procedure Paint; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure AddProgress(Value: Longint);
    property PercentDone: Integer read GetPercentDone;
  published
    { Published declarations }
    property Align;
    property Ctl3D : Boolean read FCtl3D write SetCtl3D default True;
    property Enabled;
    property ShowText: Boolean read FShowText write SetShowText default True;
    property Font;
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle default bsSingle;
    property ForeColor: TColor read FForeColor write SetForeColor default clBlack;
    property BackColor: TColor read FBackColor write SetBackColor default clWhite;
    property Kind : TBarKind read FKind write SetKind default bkHorizontal;
    property MinValue: Longint read FMinValue write SetMinValue default 0;
    property MaxValue: Longint read FMaxValue write SetMaxValue default 100;
    property ParentFont;
    property ParentShowHint;
    property Progress: Longint read FCurValue write SetProgress;
    property ShowHint;
    property Visible;
  end;

procedure Register;

implementation

uses ExtCtrls;

constructor TBarGauge.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csFramed, csOpaque];
  { default values }
  FMinValue := 0;
  FMaxValue := 100;
  FCurValue := 0;
  FShowText := True;
  FBorderStyle := bsSingle;
  FForeColor := clBlack;
  FBackColor := clWhite;
  FCtl3D := True;
  Width := 100;
  Height := 100;
end;


function TBarGauge.GetPercentDone: Integer;
begin
  if (FMaxValue = FMinValue) or (FCurValue = FMinValue) then Result := 0
  else Result := Trunc((FCurValue - FMinValue) / (FMaxValue - FMinValue) * 100);
end;


procedure TBarGauge.SetShowText(Value: Boolean);
begin
  if Value <> FShowText then begin
    FShowText := Value;
    Repaint;
  end;
end;

procedure TBarGauge.SetBorderStyle(Value: TBorderStyle);
begin
  if Value <> FBorderStyle then begin
    FBorderStyle := Value;
    Repaint;
  end;
end;

procedure TBarGauge.SetForeColor(Value: TColor);
begin
  if Value <> FForeColor then begin
    FForeColor := Value;
    Repaint;
  end;
end;

procedure TBarGauge.SetBackColor(Value: TColor);
begin
  if Value <> FBackColor then begin
    FBackColor := Value;
    Repaint;
  end;
end;

procedure TBarGauge.SetMinValue(Value: Longint);
begin
  if Value <> FMinValue then begin
    FMinValue := Value;
    Repaint;
  end;
end;

procedure TBarGauge.SetMaxValue(Value: Longint);
begin
  if Value <> FMaxValue then begin
    FMaxValue := Value;
    Repaint;
  end;
end;


procedure TBarGauge.SetProgress(Value: Longint);
var PrevPercent : Integer;
begin
  if (FCurValue <> Value) and (Value >= FMinValue) and (Value <= FMaxValue) then begin
    PrevPercent := GetPercentDone;
    FCurValue := Value;
    if GetPercentDone <> PrevPercent then Repaint;
  end;
end;


procedure TBarGauge.SetCtl3D(Value: Boolean);
begin
  if Value <> FCtl3D then begin
    FCtl3D := Value;
    Repaint;
  end;
end;


procedure TBarGauge.SetKind(Value: TBarKind);
begin
  if Value <> FKind then begin
    FKind := Value;
    Repaint;
  end;
end;


procedure TBarGauge.AddProgress(Value: Longint);
begin
  Progress := FCurValue + Value;
end;



procedure TBarGauge.Paint;
var
  r: TRect;
  x, y: Integer;
  s: string[4];
begin
  r := Rect(0, 0, Width, Height);
  with Canvas do begin

    if BorderStyle = bsSingle then begin
      if Ctl3D then Frame3D(Canvas, r, clBtnShadow, clBtnHighlight, 1);
      Frame3D(Canvas, r, clBlack, clBlack, 1);
    end;

    if Kind = bkHorizontal then begin
      x := MulDiv(r.Right - r.Left, PercentDone, 100);
      Brush.Color := ForeColor;
      FillRect(Rect(r.Left, r.Top, r.Left + x, r.Bottom));
      Brush.Color := BackColor;
      FillRect(Rect(r.Left + x, r.Top, r.Right, r.Bottom));
    end
    else begin
      y := MulDiv(r.Bottom - r.Top, PercentDone, 100);
      Brush.Color := ForeColor;
      FillRect(Rect(r.Left, r.Bottom - y, r.Right, r.Bottom));
      Brush.Color := BackColor;
      FillRect(Rect(r.Left, r.Top, r.Right, r.Bottom - y));
    end;

    if ShowText then begin
      s := Format('%d%%', [PercentDone]);
      Brush.Style := bsClear;
      Font.Assign(Self.Font);
      with r do begin
        x := (Width + 1 - TextWidth(s)) div 2;
        y := (Height + 1 - TextHeight(s)) div 2;
      end;
      TextRect(r, x, y, S);
    end;
  end;
end;


procedure Register;
begin
  RegisterComponents('Samples', [TBarGauge]);
end;

end.
