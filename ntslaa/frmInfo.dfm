object InfoForm: TInfoForm
  Left = 487
  Top = 228
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'About...'
  ClientHeight = 161
  ClientWidth = 353
  Color = clBtnFace
  Font.Charset = EASTEUROPE_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object Label1: TLabel
    Left = 8
    Top = 128
    Width = 248
    Height = 26
    AutoSize = False
    Caption = 
      'Nazwa wywodzi si'#281' od angielskiego zwrotu: "komini- kator sieciow' +
      'y prosty, jak dupa!" :) (patrz wy'#380'ej).'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object bntClose: TButton
    Left = 264
    Top = 128
    Width = 81
    Height = 25
    Caption = 'Zamknij'
    ModalResult = 1
    TabOrder = 0
    OnClick = bntCloseClick
  end
  object pnlTitle: TPanel
    Left = 8
    Top = 8
    Width = 337
    Height = 81
    Caption = 'ntSLaA 1.00'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -53
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object pnlSubtitle: TPanel
    Left = 8
    Top = 89
    Width = 337
    Height = 25
    Caption = 'Net Talk Simple Like an Ass!'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clGray
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
end
