object MainForm: TMainForm
  Left = 192
  Top = 107
  BorderStyle = bsNone
  Caption = 'Prezentacja pracy dyplomowej'
  ClientHeight = 348
  ClientWidth = 536
  Color = clWhite
  Font.Charset = EASTEUROPE_CHARSET
  Font.Color = clWindowText
  Font.Height = -28
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 34
  object PicShow: TPicShow
    Left = 0
    Top = 0
    Width = 536
    Height = 348
    Align = alClient
    Center = True
    Style = 5
    OnMouseUp = PicShowMouseUp
  end
end
