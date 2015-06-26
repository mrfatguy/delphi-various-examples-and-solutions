object MainForm: TMainForm
  Left = 196
  Top = 108
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'String Coder'
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
    Top = 32
    Width = 110
    Height = 13
    Caption = 'Tekst do zakodowania:'
  end
  object Label3: TLabel
    Left = 8
    Top = 184
    Width = 92
    Height = 13
    Caption = 'Zakodowany tekst:'
  end
  object Label2: TLabel
    Left = 8
    Top = 336
    Width = 98
    Height = 13
    Caption = 'Rozkodowany tekst:'
  end
  object Label4: TLabel
    Left = 8
    Top = 12
    Width = 31
    Height = 13
    Caption = 'Has³o:'
  end
  object mText: TMemo
    Left = 120
    Top = 32
    Width = 489
    Height = 145
    ScrollBars = ssVertical
    TabOrder = 1
    OnChange = CheckIfCanCode
    OnEnter = SelectAllOnEnter
  end
  object mCoded: TMemo
    Left = 120
    Top = 184
    Width = 489
    Height = 145
    Color = clBtnFace
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
    OnEnter = SelectAllOnEnter
  end
  object btnCode: TButton
    Left = 8
    Top = 488
    Width = 75
    Height = 25
    Caption = 'Koduj!'
    Default = True
    Enabled = False
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = btnCodeClick
  end
  object btnExit: TButton
    Left = 536
    Top = 488
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Koniec'
    TabOrder = 5
    OnClick = btnExitClick
  end
  object mDecoded: TMemo
    Left = 120
    Top = 336
    Width = 489
    Height = 145
    Color = clBtnFace
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 3
    OnEnter = SelectAllOnEnter
  end
  object ePass: TEdit
    Left = 120
    Top = 8
    Width = 489
    Height = 21
    TabOrder = 0
  end
end
