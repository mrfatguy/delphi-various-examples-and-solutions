object MainForm: TMainForm
  Left = 196
  Top = 108
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'HTML Stripper'
  ClientHeight = 521
  ClientWidth = 617
  Color = clBtnFace
  Font.Charset = EASTEUROPE_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 51
    Height = 13
    Caption = 'Kod HTML:'
  end
  object Label3: TLabel
    Left = 8
    Top = 248
    Width = 72
    Height = 13
    Caption = '"Czysty" tekst:'
  end
  object mHTML: TMemo
    Left = 88
    Top = 8
    Width = 521
    Height = 233
    ScrollBars = ssVertical
    TabOrder = 0
    OnChange = CheckIfCanCode
    OnEnter = SelectAllOnEnter
  end
  object mText: TMemo
    Left = 88
    Top = 248
    Width = 521
    Height = 233
    Color = clBtnFace
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
    OnEnter = SelectAllOnEnter
  end
  object btnStrip: TButton
    Left = 8
    Top = 488
    Width = 75
    Height = 25
    Caption = 'Wytnij'
    Default = True
    Enabled = False
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnStripClick
  end
  object btnExit: TButton
    Left = 536
    Top = 488
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Koniec'
    TabOrder = 3
    OnClick = btnExitClick
  end
end
