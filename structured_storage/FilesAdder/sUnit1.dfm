object MainForm: TMainForm
  Left = 198
  Top = 103
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsDialog
  Caption = 'FilesAdder 1.00'
  ClientHeight = 290
  ClientWidth = 452
  Color = clBtnFace
  Font.Charset = EASTEUROPE_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 2
    Top = 8
    Width = 48
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Zasób:'
  end
  object Bevel1: TBevel
    Left = 2
    Top = 32
    Width = 442
    Height = 2
  end
  object eFile: TEdit
    Left = 52
    Top = 4
    Width = 365
    Height = 21
    Color = clMenu
    ReadOnly = True
    TabOrder = 0
  end
  object btnOpen: TBitBtn
    Left = 424
    Top = 2
    Width = 25
    Height = 25
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnOpenClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000CE0E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      77777777777777777777000000000007777700333333333077770B0333333333
      07770FB03333333330770BFB0333333333070FBFB000000000000BFBFBFBFB07
      77770FBFBFBFBF0777770BFB0000000777777000777777770007777777777777
      7007777777770777070777777777700077777777777777777777}
  end
  object PageControl1: TPageControl
    Left = 4
    Top = 40
    Width = 446
    Height = 249
    ActivePage = TabSheet1
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Dodaj plik'
      object Label2: TLabel
        Left = 2
        Top = 8
        Width = 48
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Plik:'
      end
      object Label3: TLabel
        Left = 2
        Top = 32
        Width = 48
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Nazwa:'
      end
      object Label4: TLabel
        Left = 2
        Top = 54
        Width = 48
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Status:'
      end
      object eFileToAdd: TEdit
        Left = 52
        Top = 4
        Width = 357
        Height = 21
        Color = clMenu
        ReadOnly = True
        TabOrder = 0
      end
      object eName: TEdit
        Left = 52
        Top = 28
        Width = 357
        Height = 21
        TabOrder = 1
      end
      object btnFile: TBitBtn
        Left = 412
        Top = 2
        Width = 25
        Height = 25
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = btnFileClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000CE0E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          77777777777777777777000000000007777700333333333077770B0333333333
          07770FB03333333330770BFB0333333333070FBFB000000000000BFBFBFBFB07
          77770FBFBFBFBF0777770BFB0000000777777000777777770007777777777777
          7007777777770777070777777777700077777777777777777777}
      end
      object pnlStatus: TPanel
        Left = 52
        Top = 52
        Width = 357
        Height = 16
        Alignment = taLeftJustify
        TabOrder = 3
      end
      object btnAdd: TBitBtn
        Left = 362
        Top = 70
        Width = 75
        Height = 25
        Caption = 'Dodaj'
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = AddButtonClick
        Glyph.Data = {
          F6000000424DF60000000000000076000000280000000F000000100000000100
          04000000000080000000C40E0000C40E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888000000000000000000EEEEEEEEEEEEE000000000000000000888888808888
          88808888880E08888880888880EEE088888088880EEEEE0888808880EEEEEEE0
          8880880EEEEEEEEE0880800000EEE0000080888880EEE0888880888880EEE088
          8880888880EEE0888880888880EEE08888808888800000888880}
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Dodaj wiele plików'
      ImageIndex = 4
      object Label13: TLabel
        Left = 5
        Top = 8
        Width = 21
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Pliki:'
      end
      object list: TListBox
        Left = 32
        Top = 2
        Width = 377
        Height = 218
        ItemHeight = 13
        TabOrder = 2
      end
      object list2: TListBox
        Left = 32
        Top = 2
        Width = 377
        Height = 218
        ItemHeight = 13
        TabOrder = 3
        Visible = False
      end
      object btnAddAll: TBitBtn
        Left = 412
        Top = 30
        Width = 25
        Height = 25
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btnAddAllClick
        Glyph.Data = {
          F6000000424DF60000000000000076000000280000000F000000100000000100
          04000000000080000000C40E0000C40E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888000000000000000000EEEEEEEEEEEEE000000000000000000888888808888
          88808888880E08888880888880EEE088888088880EEEEE0888808880EEEEEEE0
          8880880EEEEEEEEE0880800000EEE0000080888880EEE0888880888880EEE088
          8880888880EEE0888880888880EEE08888808888800000888880}
      end
      object btnOpenAll: TBitBtn
        Left = 412
        Top = 2
        Width = 25
        Height = 25
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnOpenAllClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000CE0E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          77777777777777777777000000000007777700333333333077770B0333333333
          07770FB03333333330770BFB0333333333070FBFB000000000000BFBFBFBFB07
          77770FBFBFBFBF0777770BFB0000000777777000777777770007777777777777
          7007777777770777070777777777700077777777777777777777}
      end
      object btnCloseList: TButton
        Left = 392
        Top = 4
        Width = 15
        Height = 15
        Caption = 'x'
        TabOrder = 4
        Visible = False
        OnClick = btnCloseListClick
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Dodaj zmienn¹'
      ImageIndex = 2
      object Label7: TLabel
        Left = 0
        Top = 6
        Width = 96
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '£añcuch tekstowy:'
      end
      object Label8: TLabel
        Left = 0
        Top = 38
        Width = 96
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Wartoœæ liczbowa:'
      end
      object Label9: TLabel
        Left = 0
        Top = 70
        Width = 96
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Wyra¿enie logiczne:'
      end
      object eString: TEdit
        Left = 198
        Top = 2
        Width = 161
        Height = 21
        TabOrder = 0
      end
      object Button6: TButton
        Left = 362
        Top = 0
        Width = 75
        Height = 25
        Caption = 'Dodaj...'
        TabOrder = 1
        OnClick = Button6Click
      end
      object sNumber: TSpinEdit
        Left = 198
        Top = 33
        Width = 161
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 2
        Value = 0
      end
      object Button7: TButton
        Left = 362
        Top = 32
        Width = 75
        Height = 25
        Caption = 'Dodaj...'
        TabOrder = 3
        OnClick = Button7Click
      end
      object rgLogical: TRadioGroup
        Left = 198
        Top = 58
        Width = 161
        Height = 33
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Prawda'
          'Fa³sz')
        TabOrder = 4
      end
      object Button8: TButton
        Left = 362
        Top = 64
        Width = 75
        Height = 25
        Caption = 'Dodaj...'
        TabOrder = 5
        OnClick = Button8Click
      end
      object eStringName: TEdit
        Left = 98
        Top = 2
        Width = 96
        Height = 21
        TabOrder = 6
      end
      object eNumberName: TEdit
        Left = 98
        Top = 34
        Width = 96
        Height = 21
        TabOrder = 7
      end
      object eLogicalName: TEdit
        Left = 98
        Top = 66
        Width = 96
        Height = 21
        TabOrder = 8
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'SprawdŸ'
      ImageIndex = 1
      object Label5: TLabel
        Left = 2
        Top = 8
        Width = 48
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Nazwa:'
      end
      object Label6: TLabel
        Left = 2
        Top = 30
        Width = 48
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Status:'
      end
      object eNameChk: TEdit
        Left = 52
        Top = 4
        Width = 384
        Height = 21
        TabOrder = 0
      end
      object pnlStatusChk: TPanel
        Left = 52
        Top = 28
        Width = 384
        Height = 16
        Alignment = taLeftJustify
        TabOrder = 1
      end
      object btnCheck: TBitBtn
        Left = 362
        Top = 46
        Width = 75
        Height = 25
        Caption = 'SprawdŸ'
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = btnCheckClick
        Glyph.Data = {
          F6000000424DF60000000000000076000000280000000F000000100000000100
          04000000000080000000C40E0000C40E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888880000088
          8880888880EEE0888880888880EEE0888880888880EEE0888880888880EEE088
          8880800000EEE0000080880EEEEEEEEE08808880EEEEEEE0888088880EEEEE08
          8880888880EEE08888808888880E088888808888888088888880000000000000
          00000EEEEEEEEEEEEE0000000000000000008888888888888880}
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Wyodrêbnij'
      ImageIndex = 3
      object Label10: TLabel
        Left = 2
        Top = 8
        Width = 48
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Nazwa:'
      end
      object Label11: TLabel
        Left = 2
        Top = 54
        Width = 48
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Status:'
      end
      object Label12: TLabel
        Left = 2
        Top = 32
        Width = 48
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Plik:'
      end
      object eExtractName: TEdit
        Left = 52
        Top = 4
        Width = 357
        Height = 21
        TabOrder = 0
      end
      object pnlStatusE: TPanel
        Left = 52
        Top = 52
        Width = 384
        Height = 16
        Alignment = taLeftJustify
        TabOrder = 1
      end
      object btnExtract: TBitBtn
        Left = 362
        Top = 70
        Width = 75
        Height = 25
        Caption = 'Wyodrêbnij'
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = btnExtractClick
        Glyph.Data = {
          F6000000424DF60000000000000076000000280000000F000000100000000100
          04000000000080000000C40E0000C40E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888880000088
          8880888880EEE0888880888880EEE0888880888880EEE0888880888880EEE088
          8880800000EEE0000080880EEEEEEEEE08808880EEEEEEE0888088880EEEEE08
          8880888880EEE08888808888880E088888808888888088888880000000000000
          00000EEEEEEEEEEEEE0000000000000000008888888888888880}
      end
      object eFileToExtract: TEdit
        Left = 52
        Top = 28
        Width = 357
        Height = 21
        Color = clMenu
        ReadOnly = True
        TabOrder = 3
      end
      object btnExtractFile: TBitBtn
        Left = 412
        Top = 26
        Width = 25
        Height = 25
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = btnExtractFileClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000CE0E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          77777777777777777777000000000007777700333333333077770B0333333333
          07770FB03333333330770BFB0333333333070FBFB000000000000BFBFBFBFB07
          77770FBFBFBFBF0777770BFB0000000777777000777777770007777777777777
          7007777777770777070777777777700077777777777777777777}
      end
    end
  end
  object oDialog: TOpenDialog
    Filter = 'Wszystkie pliki (*.*)|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = 'Otwórz plik...'
    Left = 4
    Top = 4
  end
  object oDialogFile: TOpenDialog
    Filter = 'Wszystkie pliki (*.*)|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Dodaj plik...'
    Left = 68
    Top = 4
  end
  object sDialog: TSaveDialog
    Filter = 'Wszystkie pliki (*.*)|*.*'
    Title = 'Save'
    Left = 4
    Top = 108
  end
  object oDialogAll: TOpenDialog
    Filter = 'Wszystkie pliki (*.*)|*.*'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Dodaj plik...'
    Left = 36
    Top = 4
  end
end
