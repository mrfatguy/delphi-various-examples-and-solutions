object MainForm: TMainForm
  Left = 194
  Top = 40
  Width = 738
  Height = 660
  Caption = 'Nietypowa internetowo-wikipediowa tablica Mendelejewa :)'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object pnlWeb: TPanel
    Left = 8
    Top = 8
    Width = 714
    Height = 620
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 0
    object WebBrowser: TWebBrowser
      Left = 0
      Top = 0
      Width = 714
      Height = 620
      Align = alClient
      TabOrder = 0
      ControlData = {
        4C0000008E450000452A00000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126200000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
end
