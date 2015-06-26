object NewGame: TNewGame
  Left = 198
  Top = 103
  BorderStyle = bsNone
  Caption = 'Aurelius'
  ClientHeight = 232
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
  object Back: TPaintBox
    Left = 0
    Top = 0
    Width = 300
    Height = 232
    Align = alClient
  end
  object Label2: TLabel
    Left = 18
    Top = 42
    Width = 273
    Height = 29
    AutoSize = False
    Caption = 
      'Aby utworzyæ swój obraz, musisz podaæ garœæ poni¿szych informacj' +
      'i:'
    Color = 7307103
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object btnCancel: TImgBtn
    Left = 230
    Top = 168
    Width = 54
    Height = 54
    Cursor = crHandPoint
    AutoSize = True
    OnClick = btnCancelClick
    Supported = True
  end
  object btnHelp: TImgBtn
    Left = 166
    Top = 168
    Width = 54
    Height = 54
    Cursor = crHandPoint
    AutoSize = True
    OnClick = btnHelpClick
    Supported = True
  end
  object Label1: TLabel
    Left = 18
    Top = 80
    Width = 84
    Height = 13
    Caption = 'Nazwa gracza:'
    Color = 7307103
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label3: TLabel
    Left = 18
    Top = 100
    Width = 93
    Height = 13
    Caption = 'Nazwa komórki:'
    Color = 7307103
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 120
    Top = 80
    Width = 168
    Height = 17
    BorderStyle = bsNone
    Color = 7307103
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    MaxLength = 30
    ParentFont = False
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 120
    Top = 100
    Width = 168
    Height = 17
    BorderStyle = bsNone
    Color = 7307103
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    MaxLength = 30
    ParentFont = False
    TabOrder = 1
  end
end
