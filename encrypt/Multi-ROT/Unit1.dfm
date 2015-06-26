object MainForm: TMainForm
  Left = 192
  Top = 107
  Width = 545
  Height = 580
  Caption = 'MainForm'
  Color = clBtnFace
  Font.Charset = EASTEUROPE_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object b: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'ROT!'
    TabOrder = 0
    OnClick = bClick
  end
  object e: TEdit
    Left = 88
    Top = 8
    Width = 441
    Height = 21
    TabOrder = 1
    Text = 'abcdefghijklmnoprstuwxyz'
  end
  object m: TMemo
    Left = 8
    Top = 40
    Width = 521
    Height = 505
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 2
  end
end
