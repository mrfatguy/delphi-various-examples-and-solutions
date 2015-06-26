object MainMenu: TMainMenu
  Left = 350
  Top = 155
  BorderStyle = bsNone
  Caption = 'Aurelius'
  ClientHeight = 174
  ClientWidth = 326
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Back: TPaintBox
    Left = 0
    Top = 0
    Width = 326
    Height = 174
    Align = alClient
  end
  object rv: TRichView
    Left = 16
    Top = 46
    Width = 300
    Height = 92
    Cursor = crDefault
    Ctl3D = False
    ParentCtl3D = False
    BorderStyle = bsSingle
    TabStop = True
    TabOrder = 1
    Tracking = True
    VScrollVisible = False
    HScrollVisible = False
    Options = [rvoScrollToEnd, rvoShowPageBreaks, rvoAutoCopyText, rvoAutoCopyRVF, rvoAutoCopyImage, rvoAutoCopyRTF, rvoFormatInvalidate, rvoDblClickSelectsWord, rvoRClickDeselects]
    Color = 7307103
    FirstJumpNo = 0
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
  object Edit1: TEdit
    Left = 16
    Top = 144
    Width = 300
    Height = 19
    Color = 7307103
    Ctl3D = False
    Enabled = False
    ParentCtl3D = False
    TabOrder = 0
    OnKeyUp = Edit1KeyUp
  end
  object Button1: TButton
    Left = 128
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Button1'
    Default = True
    TabOrder = 2
  end
  object RVStyle1: TRVStyle
    TextStyles = <
      item
        FontName = 'Verdana'
        Size = 8
        StyleName = 'Normal'
      end
      item
        FontName = 'Verdana'
        Size = 8
        Style = [fsBold]
        StyleName = 'Bold'
      end>
    ParaStyles = <
      item
        StyleName = 'Paragraph Style'
      end
      item
        Alignment = rvaCenter
        StyleName = 'Centered'
      end>
    JumpCursor = crHandPoint
    UseSound = False
    Left = 8
    Top = 8
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 40
    Top = 8
  end
end
