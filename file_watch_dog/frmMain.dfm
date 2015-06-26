object MainForm: TMainForm
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'File Watch Dog 1.00'
  ClientHeight = 69
  ClientWidth = 455
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblInfo: TLabel
    Left = 8
    Top = 32
    Width = 440
    Height = 32
    AutoSize = False
    Caption = 
      'Program sprawdza co sekundê, czy data i czas wybranego pliku nie' +
      ' uleg³y zmianie i jeœli tak - wyœwietla stosowny komunikat.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object eFile: TEdit
    Left = 8
    Top = 8
    Width = 377
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 0
  end
  object btnLoad: TButton
    Left = 392
    Top = 8
    Width = 57
    Height = 21
    Caption = 'Wybierz'
    Default = True
    TabOrder = 1
    OnClick = btnLoadClick
  end
  object Timer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TimerTimer
    Left = 40
  end
  object opMain: TOpenDialog
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 8
  end
end
