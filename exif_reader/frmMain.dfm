object MainForm: TMainForm
  Left = 233
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Dane EXIF'
  ClientHeight = 417
  ClientWidth = 578
  Color = clBtnFace
  Font.Charset = EASTEUROPE_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pcMain: TPageControl
    Left = 8
    Top = 48
    Width = 562
    Height = 361
    ActivePage = tsThumbnail
    TabOrder = 0
    object tsThumbnail: TTabSheet
      Caption = 'Miniaturka i komentarz'
      ImageIndex = 1
      object pnlComment: TPanel
        Left = 0
        Top = 203
        Width = 554
        Height = 130
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object pnlCommLabel: TPanel
          Left = 0
          Top = 0
          Width = 554
          Height = 18
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Caption = ' Komentarz zawarty w pliku:'
          TabOrder = 0
        end
        object mComment: TMemo
          Left = 0
          Top = 18
          Width = 554
          Height = 112
          Align = alClient
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 1
        end
      end
      object pnlThumb: TPanel
        Left = 0
        Top = 0
        Width = 554
        Height = 203
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object pnlMini: TPanel
          Left = 0
          Top = 0
          Width = 208
          Height = 203
          Align = alLeft
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Caption = 'Miniaturka'
          TabOrder = 0
          object imgThumb: TImage
            Left = 0
            Top = 0
            Width = 204
            Height = 199
            Align = alClient
            Center = True
          end
        end
        object Panel1: TPanel
          Left = 208
          Top = 0
          Width = 5
          Height = 203
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
        end
        object sgThumb: TStringGrid
          Left = 213
          Top = 0
          Width = 341
          Height = 203
          Align = alClient
          ColCount = 2
          DefaultColWidth = 170
          DefaultRowHeight = 18
          RowCount = 1
          FixedRows = 0
          Font.Charset = EASTEUROPE_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          GridLineWidth = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 2
          RowHeights = (
            18)
        end
      end
    end
    object tsExif: TTabSheet
      Caption = 'Podstawowe dane EXIF'
      object sgExif: TStringGrid
        Left = 0
        Top = 0
        Width = 562
        Height = 333
        Align = alClient
        ColCount = 2
        DefaultColWidth = 200
        DefaultRowHeight = 18
        RowCount = 1
        FixedRows = 0
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        GridLineWidth = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
        RowHeights = (
          18)
      end
    end
    object tsSummary: TTabSheet
      Caption = 'Rozszerzone dane EXIF'
      ImageIndex = 2
      object sgSummary: TStringGrid
        Left = 0
        Top = 0
        Width = 562
        Height = 333
        Align = alClient
        ColCount = 2
        DefaultColWidth = 200
        DefaultRowHeight = 18
        RowCount = 1
        FixedRows = 0
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        GridLineWidth = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
        RowHeights = (
          18)
      end
    end
    object tsMaker: TTabSheet
      Caption = 'Dane producenta'
      ImageIndex = 3
      object sgMaker: TStringGrid
        Left = 0
        Top = 0
        Width = 554
        Height = 333
        Align = alClient
        ColCount = 2
        DefaultColWidth = 200
        DefaultRowHeight = 18
        RowCount = 1
        FixedRows = 0
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        GridLineWidth = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
        RowHeights = (
          18)
      end
      object pnlMaker: TPanel
        Left = 0
        Top = 0
        Width = 554
        Height = 333
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Dane producenta (Maker Specific Data) nie wystêpuj¹ w tym pliku.'
        TabOrder = 1
      end
    end
    object tsIPTC: TTabSheet
      Caption = 'Nag³ówki IPTC'
      ImageIndex = 3
      object sgIPTC: TStringGrid
        Left = 0
        Top = 0
        Width = 554
        Height = 333
        Align = alClient
        ColCount = 2
        DefaultColWidth = 200
        DefaultRowHeight = 18
        RowCount = 1
        FixedRows = 0
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        GridLineWidth = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
        RowHeights = (
          18)
      end
      object pnlIPTC: TPanel
        Left = 0
        Top = 0
        Width = 554
        Height = 333
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Nag³ówki IPTC nie wystêpuj¹ w tym pliku.'
        TabOrder = 1
      end
    end
  end
  object gbFile: TGroupBox
    Left = 8
    Top = 4
    Width = 562
    Height = 37
    Caption = ' Otwarty plik '
    TabOrder = 1
    object lblFile: TLabel
      Left = 8
      Top = 15
      Width = 129
      Height = 13
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnLoad: TButton
      Left = 536
      Top = 10
      Width = 22
      Height = 22
      Caption = '...'
      Default = True
      TabOrder = 0
      OnClick = btnLoadClick
    end
  end
  object pdlg: TOpenPictureDialog
    Filter = 
      'All (*.gif;*.ani;*.pcx;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf;*.ti' +
      'f;*.nef)|*.gif;*.ani;*.pcx;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf;' +
      '*.tif;*.nef|CompuServe GIF Image (*.gif)|*.gif|ANI Image (*.ani)' +
      '|*.ani|PCX Image (*.pcx)|*.pcx|JPEG Image File (*.jpg)|*.jpg|JPE' +
      'G Image File (*.jpeg)|*.jpeg|Bitmaps (*.bmp)|*.bmp|Icons (*.ico)' +
      '|*.ico|Enhanced Metafiles (*.emf)|*.emf|Metafiles (*.wmf)|*.wmf|' +
      'TIFF Image File (*.tif)|*.tif|Nikon Image File (*.nef)|*.nef'
    InitialDir = '.'
    Left = 456
    Top = 16
  end
end
