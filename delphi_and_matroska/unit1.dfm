object Form1: TForm1
  Left = 194
  Top = 107
  Width = 613
  Height = 556
  Caption = 'Sample App for matroska.dll'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 136
    Width = 58
    Height = 13
    Caption = 'Muxing app:'
  end
  object Label2: TLabel
    Left = 8
    Top = 156
    Width = 55
    Height = 13
    Caption = 'Writing App'
  end
  object Label3: TLabel
    Left = 8
    Top = 176
    Width = 33
    Height = 13
    Caption = 'Tracks'
  end
  object Label4: TLabel
    Left = 8
    Top = 56
    Width = 45
    Height = 13
    Caption = 'File name'
  end
  object Label5: TLabel
    Left = 8
    Top = 32
    Width = 85
    Height = 13
    Caption = 'Matroska.dll build:'
  end
  object Label6: TLabel
    Left = 8
    Top = 80
    Width = 40
    Height = 13
    Caption = 'Duration'
  end
  object Label7: TLabel
    Left = 12
    Top = 280
    Width = 42
    Height = 13
    Caption = 'Chapters'
  end
  object Label8: TLabel
    Left = 16
    Top = 424
    Width = 59
    Height = 13
    Caption = 'Attachments'
  end
  object Label9: TLabel
    Left = 8
    Top = 116
    Width = 20
    Height = 13
    Caption = 'Title'
  end
  object Edit1: TEdit
    Left = 96
    Top = 132
    Width = 497
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 516
    Top = 24
    Width = 75
    Height = 21
    Caption = 'Open'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit2: TEdit
    Left = 96
    Top = 152
    Width = 497
    Height = 21
    TabOrder = 2
  end
  object ListBox1: TListBox
    Left = 96
    Top = 172
    Width = 497
    Height = 109
    ItemHeight = 13
    TabOrder = 3
  end
  object Edit3: TEdit
    Left = 96
    Top = 52
    Width = 497
    Height = 21
    TabOrder = 4
  end
  object Edit4: TEdit
    Left = 96
    Top = 28
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object Edit5: TEdit
    Left = 96
    Top = 76
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object ListBox2: TListBox
    Left = 96
    Top = 280
    Width = 497
    Height = 141
    ItemHeight = 13
    TabOrder = 7
  end
  object ListBox3: TListBox
    Left = 96
    Top = 420
    Width = 497
    Height = 97
    ItemHeight = 13
    TabOrder = 8
  end
  object Edit6: TEdit
    Left = 96
    Top = 112
    Width = 497
    Height = 21
    TabOrder = 9
  end
  object OpenDialog1: TOpenDialog
    Left = 20
    Top = 208
  end
end
