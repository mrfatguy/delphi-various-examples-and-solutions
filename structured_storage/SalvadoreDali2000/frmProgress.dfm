object ProgressForm: TProgressForm
  Left = 251
  Top = 114
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Trwa tworzenie nowego albumu...'
  ClientHeight = 81
  ClientWidth = 328
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblStatus: TLabel
    Left = 8
    Top = 8
    Width = 70
    Height = 13
    Caption = 'Oczekiwanie...'
  end
  object pbProgress: TProgressBar
    Left = 8
    Top = 24
    Width = 313
    Height = 17
    Min = 0
    Max = 100
    TabOrder = 0
  end
  object btnCancel: TButton
    Left = 246
    Top = 48
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Anuluj'
    TabOrder = 1
    OnClick = btnCancelClick
  end
end
