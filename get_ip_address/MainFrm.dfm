object MainForm: TMainForm
  Left = 455
  Top = 323
  Width = 426
  Height = 140
  Caption = 'Przyk³adowy program [http://www.programowanie.of.pl]'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnGetIPName: TButton
    Left = 40
    Top = 48
    Width = 345
    Height = 25
    Caption = 'Pobierz adres IP i nazwê zalogowanego u¿ytkownika'
    TabOrder = 0
    OnClick = btnGetIPNameClick
  end
end
