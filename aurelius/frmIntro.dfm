object IntroForm: TIntroForm
  Left = 192
  Top = 107
  BorderStyle = bsNone
  Caption = 'Aurelius'
  ClientHeight = 348
  ClientWidth = 602
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  WindowState = wsMaximized
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 602
    Height = 348
    Align = alClient
    Center = True
    OnClick = Image1Click
  end
  object mm: TMediaPlayer
    Left = 8
    Top = 8
    Width = 253
    Height = 30
    Visible = False
    TabOrder = 0
  end
end
