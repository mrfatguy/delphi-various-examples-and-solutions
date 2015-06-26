object MainForm: TMainForm
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Zamieniacz TXT na HTML'
  ClientHeight = 89
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 35
    Height = 13
    Caption = 'èrÛd≥o:'
  end
  object eSource: TEdit
    Left = 48
    Top = 8
    Width = 609
    Height = 21
    TabOrder = 0
  end
  object btnGo: TButton
    Left = 48
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Start!'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnGoClick
  end
  object pbMain: TProgressBar
    Left = 48
    Top = 32
    Width = 634
    Height = 16
    Min = 0
    Max = 100
    TabOrder = 2
  end
  object btnSelectFile: TButton
    Left = 662
    Top = 8
    Width = 21
    Height = 21
    Caption = '...'
    TabOrder = 3
    OnClick = btnSelectFileClick
  end
  object opFile: TOpenDialog
    Filter = 'Pliki tekstowe (*.txt)|*.txt|Wszystkie pliki (*.*)|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 656
    Top = 56
  end
end
