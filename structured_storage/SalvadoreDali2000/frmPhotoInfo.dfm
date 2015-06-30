object PhotoInfoForm: TPhotoInfoForm
  Left = 192
  Top = 107
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Informacje o fotografii'
  ClientHeight = 249
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = EASTEUROPE_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object btnClose: TSpeedButton
    Left = 191
    Top = 218
    Width = 75
    Height = 25
    Hint = 'Zamknij#Zamyka okno z informacjami o fotografii'
    Caption = 'Zamknij'
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = btnCloseClick
  end
  object sbPrev: TSpeedButton
    Left = 8
    Top = 218
    Width = 23
    Height = 25
    Hint = 
      'Poprzednia fotografia#Wyœwietla poprzedni¹ w kolejnoœci fotograf' +
      'iê'
    Enabled = False
    Glyph.Data = {
      66010000424D66010000000000007600000028000000200000000F0000000100
      040000000000F0000000C40E0000C40E00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      8888888888888888888888888888088888888888888808888888888888800888
      888888888880088888888888880E088888888888880808888888888880EE0888
      8888888880880888888888880EEE0000008888880888000000888880EEEEEEEE
      E0888880888888888088880EEEEEEEEEE08888088888888880888880EEEEEEEE
      E088888088888888808888880EEE000000888888088800000088888880EE0888
      888888888088088888888888880E088888888888880808888888888888800888
      8888888888800888888888888888088888888888888808888888888888888888
      88888888888888888888}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = sbPrevClick
  end
  object sbNext: TSpeedButton
    Left = 426
    Top = 218
    Width = 23
    Height = 25
    Hint = 'Nastêpna fotografia#Wyœwietla nastêpn¹ w kolejnoœci fotografiê'
    Enabled = False
    Glyph.Data = {
      66010000424D66010000000000007600000028000000200000000F0000000100
      040000000000F0000000C40E0000C40E00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      8888888888888888888888888880888888888888888088888888888888800888
      8888888888800888888888888880E0888888888888808088888888888880EE08
      8888888888808808888888000000EEE088888800000088808888880EEEEEEEEE
      08888808888888880888880EEEEEEEEEE0888808888888888088880EEEEEEEEE
      0888880888888888088888000000EEE08888880000008880888888888880EE08
      8888888888808808888888888880E08888888888888080888888888888800888
      8888888888800888888888888880888888888888888088888888888888888888
      88888888888888888888}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = sbNextClick
  end
  object gbPhoto: TGroupBox
    Left = 8
    Top = 8
    Width = 441
    Height = 57
    Caption = 'Fotografia'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 29
      Height = 13
      Caption = 'Tytu³:'
    end
    object Label2: TLabel
      Left = 8
      Top = 32
      Width = 31
      Height = 13
      Caption = 'Autor:'
    end
    object lblTitle: TLabel
      Left = 42
      Top = 16
      Width = 3
      Height = 13
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblAuthor: TLabel
      Left = 42
      Top = 32
      Width = 3
      Height = 13
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDims: TLabel
      Left = 430
      Top = 32
      Width = 3
      Height = 13
      Alignment = taRightJustify
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 320
      Top = 32
      Width = 46
      Height = 13
      Caption = 'Wymiary:'
    end
  end
  object gbFile: TGroupBox
    Left = 8
    Top = 72
    Width = 216
    Height = 57
    Caption = 'Plik'
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 16
      Width = 35
      Height = 13
      Caption = 'Numer:'
    end
    object Label4: TLabel
      Left = 8
      Top = 32
      Width = 22
      Height = 13
      Caption = 'Typ:'
    end
    object lblNumber: TLabel
      Left = 46
      Top = 16
      Width = 3
      Height = 13
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblType: TLabel
      Left = 46
      Top = 32
      Width = 3
      Height = 13
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object gbParams: TGroupBox
    Left = 233
    Top = 72
    Width = 216
    Height = 57
    Caption = 'Parametry'
    TabOrder = 2
    object Label7: TLabel
      Left = 8
      Top = 16
      Width = 82
      Height = 13
      Caption = 'Ochrona has³em:'
    end
    object Label8: TLabel
      Left = 8
      Top = 32
      Width = 74
      Height = 13
      Caption = 'Redystrybucja:'
    end
    object lblPass: TLabel
      Left = 92
      Top = 16
      Width = 3
      Height = 13
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblRedist: TLabel
      Left = 92
      Top = 32
      Width = 3
      Height = 13
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object gbDesc: TGroupBox
    Left = 8
    Top = 136
    Width = 441
    Height = 76
    Caption = 'Opis'
    TabOrder = 3
    object lblDesc: TLabel
      Left = 8
      Top = 16
      Width = 425
      Height = 54
      AutoSize = False
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
  end
end
