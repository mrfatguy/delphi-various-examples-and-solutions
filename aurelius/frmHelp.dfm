object Help: THelp
  Left = 198
  Top = 107
  BorderStyle = bsNone
  Caption = 'Aurelius'
  ClientHeight = 348
  ClientWidth = 525
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object back: TPaintBox
    Left = 0
    Top = 0
    Width = 525
    Height = 348
    Align = alClient
  end
  object btnClose: TImgBtn
    Left = 459
    Top = 275
    Width = 54
    Height = 54
    Cursor = crHandPoint
    AutoSize = True
    OnClick = btnCloseClick
    Supported = True
  end
  object btnHistoryBack: TImgBtn
    Left = 144
    Top = 275
    Width = 54
    Height = 54
    Cursor = crHandPoint
    AutoSize = True
    Visible = False
    OnClick = btnHistoryBackClick
    Supported = True
  end
  object rvList: TRichView
    Left = 16
    Top = 40
    Width = 121
    Height = 289
    Cursor = crDefault
    Ctl3D = False
    ParentCtl3D = False
    BorderStyle = bsSingle
    TabStop = True
    TabOrder = 0
    ScrollBarColor = 7307103
    Tracking = True
    VScrollVisible = True
    HScrollVisible = False
    Options = [rvoScrollToEnd, rvoShowPageBreaks, rvoAutoCopyText, rvoAutoCopyRVF, rvoAutoCopyImage, rvoAutoCopyRTF, rvoFormatInvalidate, rvoDblClickSelectsWord, rvoRClickDeselects]
    Color = 7307103
    FirstJumpNo = 0
    OnJump = rvListJump
    Style = RVStyle1
    MaxTextWidth = 0
    MinTextWidth = 0
    LeftMargin = 5
    RightMargin = 5
    TopMargin = 5
    BottomMargin = 5
    BackgroundStyle = bsNoBitmap
    Delimiters = ' .;,:(){}"/\'
    RVFOptions = [rvfoSavePicturesBody, rvfoSaveControlsBody, rvfoSaveBinary]
    DoInPaletteMode = rvpaCreateCopies
    CPEventKind = cpeNone
  end
  object rvText: TRichView
    Left = 144
    Top = 40
    Width = 369
    Height = 230
    Cursor = crDefault
    Ctl3D = False
    ParentCtl3D = False
    BorderStyle = bsSingle
    TabStop = True
    TabOrder = 1
    ScrollBarStyle = rvssHotTrack
    ScrollBarColor = 7307103
    Tracking = True
    VScrollVisible = True
    HScrollVisible = False
    Options = [rvoScrollToEnd, rvoShowPageBreaks, rvoAutoCopyText, rvoAutoCopyRVF, rvoAutoCopyImage, rvoAutoCopyRTF, rvoFormatInvalidate, rvoDblClickSelectsWord, rvoRClickDeselects]
    Color = 7307103
    FirstJumpNo = 0
    OnJump = rvTextJump
    Style = RVStyle1
    MaxTextWidth = 0
    MinTextWidth = 0
    LeftMargin = 5
    RightMargin = 5
    TopMargin = 5
    BottomMargin = 5
    BackgroundStyle = bsNoBitmap
    Delimiters = ' .;,:(){}"/\'
    RVFOptions = [rvfoSavePicturesBody, rvfoSaveControlsBody, rvfoSaveBinary]
    DoInPaletteMode = rvpaCreateCopies
    CPEventKind = cpeNone
  end
  object HistoryListBox: TListBox
    Left = 8
    Top = 8
    Width = 241
    Height = 73
    ItemHeight = 13
    TabOrder = 2
    Visible = False
  end
  object TrybPracy: TPanel
    Left = 232
    Top = 288
    Width = 185
    Height = 41
    Caption = 'TrybPracy'
    TabOrder = 3
    Visible = False
  end
  object RVStyle1: TRVStyle
    TextStyles = <
      item
        FontName = 'Verdana'
        Size = 8
        StyleName = 'Normalny'
        JumpCursor = crDefault
      end
      item
        FontName = 'Verdana'
        Size = 8
        Style = [fsBold]
        StyleName = 'Pogrubiony'
        Color = clBlack
        JumpCursor = crDefault
      end
      item
        FontName = 'Verdana'
        Size = 8
        Style = [fsItalic]
        StyleName = 'Pochy³y'
        Color = clBlack
        JumpCursor = crDefault
      end
      item
        FontName = 'Verdana'
        Size = 8
        Style = [fsUnderline]
        StyleName = 'Podkreœlony'
        Color = clBlack
        JumpCursor = crDefault
      end
      item
        FontName = 'Courier New'
        Style = [fsBold]
        StyleName = 'Polecenie'
        Color = clYellow
        JumpCursor = crDefault
      end
      item
        FontName = 'Verdana'
        Size = 8
        Style = [fsUnderline]
        StyleName = 'Odnoœnik'
        Color = clYellow
        HoverColor = clLime
        Jump = True
        JumpCursor = crHandPoint
      end>
    ParaStyles = <
      item
        NextParaNo = 0
        StyleName = 'Do lewej'
      end
      item
        LeftIndent = 50
        NextParaNo = 0
        StyleName = 'Do lewej (wciêty)'
      end
      item
        LeftIndent = 50
        RightIndent = 50
        Alignment = rvaCenter
        NextParaNo = 0
        StyleName = 'Wyœrodkowany'
      end
      item
        Alignment = rvaRight
        NextParaNo = 0
        StyleName = 'Do prawej'
      end
      item
        FirstIndent = 30
        Alignment = rvaJustify
        NextParaNo = 0
        StyleName = 'Wyjustowany'
      end
      item
        LeftIndent = 20
        RightIndent = 20
        SpaceBefore = 5
        SpaceAfter = 5
        Alignment = rvaCenter
        Border.Style = rvbSingle
        Border.BorderOffsets.Left = 2
        Border.BorderOffsets.Right = 2
        Border.BorderOffsets.Top = 2
        Border.BorderOffsets.Bottom = 2
        NextParaNo = 0
        StyleName = 'W ramce'
      end>
    HoverColor = clRed
    CheckpointColor = clLime
    DefUnicodeStyle = 11
    Left = 8
    Top = 8
  end
end
