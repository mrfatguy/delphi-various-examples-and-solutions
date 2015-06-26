object MainForm: TMainForm
  Left = 195
  Top = 17
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'po2_add_notes'
  ClientHeight = 682
  ClientWidth = 697
  Color = clBtnFace
  Font.Charset = EASTEUROPE_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlButtons: TPanel
    Left = 8
    Top = 640
    Width = 681
    Height = 33
    BevelOuter = bvNone
    TabOrder = 6
    object btnExit: TButton
      Left = 0
      Top = 0
      Width = 73
      Height = 33
      Cancel = True
      Caption = 'Koniec'
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnExitClick
    end
    object btnStart: TButton
      Left = 608
      Top = 0
      Width = 73
      Height = 33
      Caption = 'Dodaj!'
      Default = True
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnStartClick
    end
  end
  object gbSourceData: TGroupBox
    Left = 8
    Top = 8
    Width = 681
    Height = 76
    Caption = ' Plik '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label4: TLabel
      Left = 8
      Top = 44
      Width = 31
      Height = 19
      Caption = 'Plik:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 16
      Width = 532
      Height = 16
      Caption = 
        'Wska¿ plik Ÿród³owy (w formacie *.xls lub *.xlsx), do którego ch' +
        'cesz dodaæ poni¿sze notatki:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object eFile: TEdit
      Left = 48
      Top = 40
      Width = 593
      Height = 27
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
    end
    object btnSelectFolder: TButton
      Left = 648
      Top = 41
      Width = 27
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnSelectFolderClick
    end
  end
  object gbExportOptions: TGroupBox
    Left = 8
    Top = 88
    Width = 337
    Height = 97
    Caption = ' Zawartoœæ arkusza '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label21: TLabel
      Left = 8
      Top = 16
      Width = 302
      Height = 16
      Caption = 'Zaznacz opcje wybrane przy eksportowaniu arkusza:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object chbTableHeaders: TCheckBox
      Left = 8
      Top = 40
      Width = 321
      Height = 17
      Caption = 'Nag³ówki kolumn z nazwami eksportowanych danych'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object chbDateColumn: TCheckBox
      Left = 8
      Top = 58
      Width = 313
      Height = 17
      Caption = 'Dodatkowa (pierwsza) kolumna z datami pomiarów'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object chbExtraSelectionInfo: TCheckBox
      Left = 8
      Top = 76
      Width = 281
      Height = 17
      Caption = 'Informacje o zakresie eksportowanych danych'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
  end
  object gbSelections3: TGroupBox
    Left = 8
    Top = 225
    Width = 73
    Height = 118
    Caption = ' Notatki '
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object sbNoteRemove: TSpeedButton
      Left = 10
      Top = 20
      Width = 52
      Height = 40
      Caption = 'Usuñ'
      Enabled = False
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        040000000000000100000000000000000000100000000000000004FE04008482
        8400FCFEFC009496940080000000E000000018000000000000000000A8000000
        ED000000120000000000040100000000EE000000120000000000222222222222
        2222222222222222222222222222222222222222222222222222222222222222
        2222222222222222222222222222222222222222222222222222222222222222
        2222222222222222222222222222222222222222222222222222211111111111
        1112211111111111111221000000000000122133333333333312210000000000
        0012213333333333331221111111111111122111111111111112222222222222
        2222222222222222222222222222222222222222222222222222222222222222
        2222222222222222222222222222222222222222222222222222222222222222
        2222222222222222222222222222222222222222222222222222}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      OnClick = sbNoteRemoveClick
    end
    object sbNoteEdit: TSpeedButton
      Left = 10
      Top = 68
      Width = 52
      Height = 40
      Caption = 'Edytuj'
      Enabled = False
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000C40E0000C40E0000100000000000000004FE04008482
        8400C4C2C400FCFEFC0000000100000000000000000000000000DF013000DA00
        1800D300160077000000001C380000E818000012160000000000333333333333
        3333333333333333333333333333333333333333333333333333311113111131
        1113311113111131111331001310013100133122131221312213310013100131
        0013312213122131221331111311113111133111131111311113333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      OnClick = sbNoteEditClick
    end
  end
  object pnlList: TPanel
    Left = 88
    Top = 232
    Width = 601
    Height = 401
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object lbNotes: TListBox
      Left = 8
      Top = 8
      Width = 585
      Height = 385
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 19
      ParentFont = False
      TabOrder = 0
      OnClick = lbNotesClick
      OnEnter = lbNotesClick
      OnExit = lbNotesClick
      OnKeyPress = lbNotesKeyPress
    end
  end
  object gbTools3: TGroupBox
    Left = 8
    Top = 467
    Width = 73
    Height = 166
    Caption = ' Lista '
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object sbClearNotes: TSpeedButton
      Left = 10
      Top = 20
      Width = 52
      Height = 40
      Caption = 'Wyczyœæ'
      Enabled = False
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        040000000000000100000000000000000000100000000000000004020400DCDA
        DC00FCFEFC00DCEAEC0082000000000000000000000000000000000004000000
        0000000000000000000091010000B100EE00370012007E000000333333333333
        3333333333333333333333300000000000333331111111111133333022222222
        2033333122222222213333302222222220333331222222222133333022222222
        2033333122222222213333302222222220333331222222222133333022222222
        2033333122222222213333302222222220333331222222222133333022222222
        2033333122222222213333302222222220333331222222222133333022222222
        2033333122222222213333302222220000333331222222111133333022222202
        0333333122222212133333302222220033333331222222113333333000000003
        3333333111111113333333333333333333333333333333333333}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      OnClick = sbClearNotesClick
    end
    object sbNotesOpen: TSpeedButton
      Left = 10
      Top = 68
      Width = 52
      Height = 40
      Caption = 'Otwórz'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777777777777777777000000000007777700333333333077770B0333333333
        07770FB03333333330770BFB0333333333070FBFB000000000000BFBFBFBFB07
        77770FBFBFBFBF0777770BFB0000000777777000777777770007777777777777
        7007777777770777070777777777700077777777777777777777}
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      OnClick = sbNotesOpenClick
    end
    object sbNotesSave: TSpeedButton
      Left = 10
      Top = 116
      Width = 52
      Height = 40
      Caption = 'Zapisz'
      Enabled = False
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000040204000482
        8400DCEAEC0074767400FCFEFC00000000000000000000000000000004000000
        0000000000000000000091010000B100EE00370012007E000000222222222222
        2222222222222222222222000000000000022233333333333332201100000044
        0102232233333344323220110000004401022322333333443232201100000044
        0102232233333344323220110000000001022322333333333232201111111111
        1102232222222222223220110000000011022322333333332232201044444444
        0102232344444444323220104444444401022323444444443232201044444444
        0102232344444444323220104444444401022323444444443232201044444444
        0002232344444444333220104444444404022323444444443432200000000000
        0002233333333333333222222222222222222222222222222222}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      OnClick = sbNotesSaveClick
    end
  end
  object gbNotes: TGroupBox
    Left = 352
    Top = 88
    Width = 337
    Height = 97
    Caption = ' Rodzaj dodawanych notatek '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 212
      Height = 16
      Caption = 'Wybierz rodzaj dodawanych notatek:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object chbNotesAsComments: TCheckBox
      Left = 8
      Top = 40
      Width = 289
      Height = 17
      Caption = 'Notatki jako komentarze do komórek w arkuszu'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object chbNotesAsShapes: TCheckBox
      Left = 8
      Top = 58
      Width = 308
      Height = 17
      Caption = 'Notatki jako "baloniki" ponad pierwszym wykresem'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object chbNotesAsSeries: TCheckBox
      Left = 8
      Top = 76
      Width = 300
      Height = 17
      Caption = 'Notatki jako specjalne serie danych na wykresach'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
  end
  object lblInfo: TPanel
    Left = 88
    Top = 640
    Width = 521
    Height = 33
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'Wybierz skoroszyt, do którego chcesz dodaæ notatki.'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
  object lblCnt: TPanel
    Left = 8
    Top = 192
    Width = 681
    Height = 33
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'Otwarty skoroszyt zawiera w sumie 0 arkuszy i 0 wykresów.'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object NotesOpenDialog: TOpenDialog
    DefaultExt = 'not'
    Filter = 'Zbiór notatek (*.not)|*.not'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofExtensionDifferent, ofPathMustExist, ofFileMustExist, ofShareAware, ofEnableSizing]
    Title = 'Otwórz listê notatek'
    Left = 40
    Top = 8
  end
  object NotesSaveDialog: TSaveDialog
    DefaultExt = 'not'
    Filter = 'Zbiór notatek (*.not)|*.not'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofExtensionDifferent, ofPathMustExist, ofFileMustExist, ofShareAware, ofNoReadOnlyReturn, ofEnableSizing]
    Title = 'Zapisz notatki jako...'
    Left = 8
    Top = 8
  end
  object ExcelOpenDialog: TOpenDialog
    DefaultExt = 'xlsx'
    Filter = 
      'Arkusze kalkulacyjne Excel 2007 (*.xlsx)|*.xlsx|Arkusze kalkulac' +
      'yjne Excel 2003 i starszych (*.xls)|*.xls'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofExtensionDifferent, ofPathMustExist, ofFileMustExist, ofShareAware, ofEnableSizing]
    Title = 'Otwórz arkusz kalkulacyjny'
    Left = 72
    Top = 8
  end
end
