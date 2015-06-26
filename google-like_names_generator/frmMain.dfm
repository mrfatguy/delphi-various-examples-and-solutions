object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Google Like Name Finder'
  ClientHeight = 572
  ClientWidth = 201
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblCount: TLabel
    Left = 89
    Top = 68
    Width = 100
    Height = 13
    Caption = 'List contains 0 items.'
  end
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 35
    Height = 13
    Caption = 'Vovels:'
  end
  object Label2: TLabel
    Left = 8
    Top = 39
    Width = 58
    Height = 13
    Caption = 'Non-Vovels:'
  end
  object btnStart: TButton
    Left = 8
    Top = 62
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 2
    OnClick = btnStartClick
  end
  object mMain: TMemo
    Left = 8
    Top = 93
    Width = 185
    Height = 436
    ParentShowHint = False
    ReadOnly = True
    ScrollBars = ssVertical
    ShowHint = True
    TabOrder = 3
    WordWrap = False
  end
  object lblLink: TLinkLabel
    Left = 8
    Top = 535
    Width = 190
    Height = 33
    AutoSize = False
    Caption = 
      'Bulk domain name check is available at <a href="http://www.namec' +
      'heap.com/myaccount/process/bulk.asp?type=bulk&from=simple">Namec' +
      'heap.com</a>. Have fun, searching!'
    TabOrder = 4
    OnLinkClick = lblLinkLinkClick
  end
  object eVovels: TEdit
    Left = 72
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'oea'
  end
  object eNonVovels: TEdit
    Left = 72
    Top = 35
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'bdfgmnrwz'
  end
end
