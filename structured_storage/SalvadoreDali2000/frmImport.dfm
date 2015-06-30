object ImportForm: TImportForm
  Left = 260
  Top = 14
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Import fotografii z folderu'
  ClientHeight = 412
  ClientWidth = 297
  Color = clBtnFace
  Font.Charset = EASTEUROPE_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblModalResult: TLabel
    Left = 133
    Top = 390
    Width = 31
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = '2'
    Visible = False
  end
  object gbFolder: TGroupBox
    Left = 8
    Top = 8
    Width = 281
    Height = 62
    Caption = 'Folder do importu'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 104
      Height = 13
      Caption = 'Importuj fotografie z:'
    end
    object eFolder: TEdit
      Left = 8
      Top = 32
      Width = 241
      Height = 21
      Hint = 'Wybrany folder:#'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object btnSelectPhotoFile: TButton
      Left = 252
      Top = 32
      Width = 21
      Height = 21
      Hint = 
        'Wska¿ folder#Kliknij aby zmieniæ folder z którego bêd¹ importowa' +
        'ne fotografie'
      Caption = '...'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnSelectPhotoFileClick
    end
  end
  object gbFileType: TGroupBox
    Left = 8
    Top = 74
    Width = 281
    Height = 140
    Caption = 'Typ plików'
    TabOrder = 1
    object rbAll: TRadioButton
      Left = 8
      Top = 16
      Width = 241
      Height = 17
      Caption = 'Importuj fotografie wszystkie dostêpne typów'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rbAllClick
    end
    object rbSelected: TRadioButton
      Left = 8
      Top = 32
      Width = 230
      Height = 17
      Caption = 'Importuj tylko fotografie wybranych typów:'
      TabOrder = 1
      OnClick = rbSelectedClick
    end
    object chblbTypes: TCheckListBox
      Left = 8
      Top = 50
      Width = 265
      Height = 82
      Enabled = False
      ItemHeight = 13
      Items.Strings = (
        'Fotografie typu JPEG (*.jpg, *.jpeg)'
        'Fotografie typu GIF (*.gif) - maks. 256 kolorów'
        'Bitmapy (*.bmp)'
        '32-bitowe Metapliki (*.emf)'
        '16-bitowe Metapliki (*.wmf)'
        'Ikony (*.ico)')
      TabOrder = 2
    end
  end
  object btnNo: TBitBtn
    Left = 8
    Top = 384
    Width = 100
    Height = 25
    Cancel = True
    Caption = 'Anuluj'
    TabOrder = 5
    OnClick = btnNoClick
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
  end
  object btnGo: TBitBtn
    Left = 189
    Top = 384
    Width = 100
    Height = 25
    Caption = 'Importuj'
    Default = True
    TabOrder = 4
    OnClick = btnGoClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object rgName: TRadioGroup
    Left = 8
    Top = 218
    Width = 281
    Height = 55
    Caption = 'Tytu³ fotografii'
    ItemIndex = 0
    Items.Strings = (
      'W postaci "Fotografia nr" + numer kolejny'
      'Tak jak nazwa pliku, bez rozszerzenia')
    TabOrder = 2
  end
  object gbDefault: TGroupBox
    Left = 8
    Top = 280
    Width = 281
    Height = 97
    Caption = 'Parametry domyœlne'
    TabOrder = 3
    object Label2: TLabel
      Left = 8
      Top = 16
      Width = 264
      Height = 26
      AutoSize = False
      Caption = 
        'Dla ka¿dej importowanej fotografii dostan¹ domyœlnie ustawione w' +
        'ybrane parametry, okreœlone poni¿ej:'
      WordWrap = True
    end
    object Label5: TLabel
      Left = 8
      Top = 50
      Width = 32
      Height = 13
      AutoSize = False
      Caption = 'Autor:'
    end
    object ePhotoAuthor: TEdit
      Left = 44
      Top = 46
      Width = 230
      Height = 21
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 40
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
    end
    object chbHasPass: TCheckBox
      Left = 8
      Top = 72
      Width = 96
      Height = 17
      Caption = 'Ochrona has³em'
      Enabled = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
    end
    object chbRedistribution: TCheckBox
      Left = 114
      Top = 72
      Width = 90
      Height = 17
      Caption = 'Redystrybucja'
      Checked = True
      ParentShowHint = False
      ShowHint = False
      State = cbChecked
      TabOrder = 2
    end
  end
  object fdImport: TFolderDialog
    Top = 24
    Left = 16
    Title = 'Wska¿ folder'
    Text = 
      'Wybierz folder z którego bêd¹ importowane fotografie o wskazanym' +
      ' typie:'
  end
end
