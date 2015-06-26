object frmMain: TfrmMain
  Left = 195
  Top = 143
  Width = 870
  Height = 640
  Caption = 'Stagenografia'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pcMain: TPageControl
    Left = 0
    Top = 0
    Width = 862
    Height = 587
    ActivePage = tsText
    Align = alClient
    MultiLine = True
    TabOrder = 0
    TabPosition = tpLeft
    object tsText: TTabSheet
      Caption = 'Tekst'
      object memText: TMemo
        Left = 0
        Top = 0
        Width = 835
        Height = 579
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
        OnChange = memTextChange
      end
    end
    object tsImage: TTabSheet
      Caption = 'Obraz'
      ImageIndex = 1
      object imgImage: TImage
        Left = 0
        Top = 0
        Width = 835
        Height = 579
        Align = alClient
      end
    end
  end
  object ActionList1: TActionList
    Left = 327
    Top = 128
    object actOpenText: TAction
      Caption = 'Otw'#243'rz plik tekstowy'
      Hint = 'Otw'#243'rz plik tekstowy'
      ShortCut = 16463
      OnExecute = actOpenTextExecute
    end
    object actOpenImage: TAction
      Caption = 'Otw'#243'rz obraz'
      Hint = 'Otw'#243'rz obraz'
      ShortCut = 16457
      OnExecute = actOpenImageExecute
    end
    object actSaveCypher: TAction
      Caption = 'Zapisz stagenograf'
      Hint = 'Zapisz stagenograf'
      ShortCut = 16467
      OnExecute = actSaveCypherExecute
    end
    object actClose: TAction
      Caption = 'Zamknij program'
      Hint = 'Zamknij program'
      ShortCut = 32883
      OnExecute = actCloseExecute
    end
    object actGenerateImage: TAction
      Caption = 'Wygeneruj obraz'
      Hint = 'Wygeneruj obraz'
      ShortCut = 16455
      OnExecute = actGenerateImageExecute
    end
    object actOpenCypher: TAction
      Caption = 'Otw'#243'rz stagenograf'
      Hint = 'Otw'#243'rz stagenograf'
      ShortCut = 16468
      OnExecute = actOpenCypherExecute
    end
  end
  object MainMenu1: TMainMenu
    Left = 295
    Top = 128
    object Plik1: TMenuItem
      Caption = '&Plik'
      object Otwrzobraz1: TMenuItem
        Action = actOpenText
      end
      object Otwrzobraz2: TMenuItem
        Action = actOpenImage
      end
      object Wygenerujobraz1: TMenuItem
        Action = actGenerateImage
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Zapiszstagenograf1: TMenuItem
        Action = actSaveCypher
      end
      object Otwrzstagenograf1: TMenuItem
        Action = actOpenCypher
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Zamknijprogram1: TMenuItem
        Action = actClose
      end
    end
  end
  object oDialog: TOpenDialog
    Left = 295
    Top = 96
  end
  object sDialog: TSaveDialog
    DefaultExt = 'bmp'
    Filter = 'Bitmapy (*.bmp)|*.bmp'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 327
    Top = 96
  end
end
