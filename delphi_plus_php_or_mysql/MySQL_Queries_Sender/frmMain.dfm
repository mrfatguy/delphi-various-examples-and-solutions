object MainForm: TMainForm
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Konfiguracja dostêpu do serwera MySQL'
  ClientHeight = 233
  ClientWidth = 382
  Color = clBtnFace
  Font.Charset = EASTEUROPE_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object LabelHost: TLabel
    Left = 4
    Top = 52
    Width = 70
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Adres:'
    FocusControl = MySQLHost
  end
  object LabelUser: TLabel
    Left = 4
    Top = 76
    Width = 70
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Login:'
    FocusControl = MySQLUser
  end
  object LabelPass: TLabel
    Left = 222
    Top = 76
    Width = 31
    Height = 13
    Alignment = taRightJustify
    Caption = 'Has³o:'
    FocusControl = MySQLPass
  end
  object LabelPort: TLabel
    Left = 314
    Top = 52
    Width = 24
    Height = 13
    Alignment = taCenter
    Caption = 'Port:'
    FocusControl = MySQLHost
  end
  object LabelTime: TLabel
    Left = 4
    Top = 101
    Width = 70
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Baza danych:'
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 366
    Height = 28
    AutoSize = False
    Caption = 
      'Proszê podaæ parametry niezbêdne do nawi¹zania bezpoœredniego po' +
      '³¹cze- nia z serwerem baz danych MySQL.'
    WordWrap = True
  end
  object Label19: TLabel
    Left = 8
    Top = 152
    Width = 366
    Height = 41
    AutoSize = False
    Caption = 
      'Uwaga! Metoda u¿ywana do kodowania hase³ przy ich zapisywa- niu ' +
      'nie jest bezpieczna! Has³a tak zakodowane mo¿na relatywnie doœæ ' +
      '³atwo z³amaæ...'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Label2: TLabel
    Left = 8
    Top = 120
    Width = 366
    Height = 28
    AutoSize = False
    Caption = 
      'Powy¿sze pole okreœla czas w sekundach, po up³ywie którego progr' +
      'am uzna wyst¹pienie przekroczenia czasu (ang. timeout) i przerwi' +
      'e po³¹czenie...'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label3: TLabel
    Left = 256
    Top = 101
    Width = 70
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Czas:'
  end
  object MySQLTime: TEdit
    Left = 333
    Top = 96
    Width = 40
    Height = 21
    MaxLength = 3
    ParentShowHint = False
    ShowHint = False
    TabOrder = 5
    Text = '30'
  end
  object MySQLHost: TEdit
    Left = 78
    Top = 48
    Width = 227
    Height = 21
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
  end
  object MySQLUser: TEdit
    Left = 78
    Top = 72
    Width = 116
    Height = 21
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
  end
  object MySQLPass: TEdit
    Left = 257
    Top = 72
    Width = 116
    Height = 21
    ParentShowHint = False
    PasswordChar = '*'
    ShowHint = False
    TabOrder = 3
  end
  object MySQLPort: TEdit
    Left = 340
    Top = 48
    Width = 33
    Height = 21
    MaxLength = 4
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    Text = '3306'
  end
  object MySQLDatabase: TEdit
    Left = 78
    Top = 96
    Width = 211
    Height = 21
    ParentShowHint = False
    ShowHint = False
    TabOrder = 4
  end
  object btnClose: TButton
    Left = 298
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Zamknij'
    Default = True
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = btnCloseClick
  end
end
