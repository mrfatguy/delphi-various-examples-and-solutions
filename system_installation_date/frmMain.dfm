object MainForm: TMainForm
  Left = 192
  Top = 107
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'System Installation Date'
  ClientHeight = 113
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 8
    Top = 8
    Width = 177
    Height = 18
    Caption = 'Instalacja systemu operacyjnego'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object pnlSystemInstall: TPanel
    Left = 8
    Top = 26
    Width = 577
    Height = 76
    Alignment = taLeftJustify
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -28
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object lblSystemInstallUp: TLabel
      Left = 1
      Top = 1
      Width = 575
      Height = 35
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'lblSystemInstallUp'
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -28
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSystemInstallDown: TLabel
      Left = 1
      Top = 36
      Width = 575
      Height = 35
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'lblSystemInstallDown'
      Layout = tlBottom
    end
  end
  object MainTimer: TTimer
    OnTimer = MainTimerTimer
    Left = 8
    Top = 8
  end
end
