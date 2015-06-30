object PreviewForm: TPreviewForm
  Left = 192
  Top = 103
  Width = 544
  Height = 375
  Caption = 'Podgl¹d fotografii'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  WindowState = wsMaximized
  OnKeyUp = FormKeyUp
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object sbMain: TScrollBox
    Left = 0
    Top = 0
    Width = 536
    Height = 348
    Align = alClient
    TabOrder = 0
    OnClick = CloseForm
    object imgPreview: TImage
      Left = 0
      Top = 0
      Width = 305
      Height = 201
      AutoSize = True
      Center = True
      OnClick = CloseForm
    end
  end
end
