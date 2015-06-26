object LogWindow: TLogWindow
  Left = 192
  Top = 103
  Width = 780
  Height = 560
  Caption = 'Bezpoœrednie po³¹czenie z baz¹ danych...'
  Color = clBtnFace
  Font.Charset = EASTEUROPE_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 8
    Top = 466
    Width = 57
    Height = 13
    Alignment = taCenter
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = 'Kwerenda:'
    FocusControl = MySQLQuery
  end
  object Bevel1: TBevel
    Left = 8
    Top = 492
    Width = 757
    Height = 2
    Anchors = [akLeft, akRight, akBottom]
  end
  object lsLog: TMemo
    Left = 8
    Top = 8
    Width = 757
    Height = 445
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 5
  end
  object btnClear: TButton
    Left = 8
    Top = 500
    Width = 99
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Wyczyœæ dziennik'
    TabOrder = 0
    OnClick = btnClearClick
  end
  object btnClose: TButton
    Left = 110
    Top = 500
    Width = 99
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Zakoñcz pracê'
    TabOrder = 1
    OnClick = btnCloseClick
  end
  object MySQLQuery: TEdit
    Left = 66
    Top = 462
    Width = 619
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
  end
  object btnSend: TButton
    Left = 690
    Top = 460
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Wyœlij!'
    Default = True
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnSendClick
  end
  object btnConfigure: TButton
    Left = 666
    Top = 500
    Width = 99
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Konfiguracja'
    TabOrder = 4
    OnClick = btnConfigureClick
  end
end
