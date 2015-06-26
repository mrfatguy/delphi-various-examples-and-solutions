object MessBox: TMessBox
  Left = 198
  Top = 103
  BorderStyle = bsNone
  Caption = 'Aurelius'
  ClientHeight = 145
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyUp = FormKeyUp
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object back: TPaintBox
    Left = 0
    Top = 0
    Width = 300
    Height = 145
    Align = alClient
  end
  object btnOK: TImgBtn
    Left = 123
    Top = 80
    Width = 54
    Height = 54
    Cursor = crHandPoint
    AutoSize = True
    OnClick = btnOKClick
    Supported = True
  end
  object Label1: TLabel
    Left = 14
    Top = 42
    Width = 273
    Height = 34
    Alignment = taCenter
    AutoSize = False
    Caption = 'Label1'
    Color = 7307103
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
    WordWrap = True
  end
  object btnYes: TImgBtn
    Left = 14
    Top = 80
    Width = 54
    Height = 54
    Cursor = crHandPoint
    AutoSize = True
    OnClick = btnYesClick
    Supported = True
  end
  object btnNo: TImgBtn
    Left = 233
    Top = 80
    Width = 54
    Height = 54
    Cursor = crHandPoint
    AutoSize = True
    OnClick = btnNoClick
    Supported = True
  end
  object Tytul: TPanel
    Left = -80
    Top = 0
    Width = 185
    Height = 41
    Caption = 'Tytul'
    TabOrder = 0
    Visible = False
  end
  object Odpowiedz: TPanel
    Left = 112
    Top = 0
    Width = 185
    Height = 41
    Caption = 'Odpowiedz'
    TabOrder = 1
    Visible = False
  end
end
