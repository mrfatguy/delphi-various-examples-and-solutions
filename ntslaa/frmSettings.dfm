object SettingsForm: TSettingsForm
  Left = 487
  Top = 228
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Settings'
  ClientHeight = 281
  ClientWidth = 489
  Color = clBtnFace
  Font.Charset = EASTEUROPE_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object Label3: TLabel
    Left = 26
    Top = 216
    Width = 353
    Height = 13
    Caption = 
      '(przy ka'#380'dym uruchomieniu programu b'#281'd'#261' ustawiane warto'#347'ci domy'#347 +
      'lne)'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnOK: TButton
    Left = 400
    Top = 248
    Width = 81
    Height = 25
    Caption = 'OK'
    Default = True
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 3
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 312
    Top = 248
    Width = 81
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 4
  end
  object gbConnection: TGroupBox
    Left = 8
    Top = 4
    Width = 233
    Height = 189
    Caption = ' Po'#322#261'czenie '
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 22
      Width = 217
      Height = 39
      AutoSize = False
      Caption = 
        'NIE zmieniaj poni'#380'szych ustawie'#324', je'#347'li wszy- stko dzia'#322'a lub je' +
        #347'li nie masz bladego poj'#281'cia, o co w tym wszystkim chodzi! :)'
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object eLocalPort: TLabeledEdit
      Left = 104
      Top = 68
      Width = 121
      Height = 27
      BevelEdges = [beRight, beBottom]
      EditLabel.Width = 90
      EditLabel.Height = 19
      EditLabel.Caption = 'Port lokalny:'
      LabelPosition = lpLeft
      TabOrder = 0
      OnKeyPress = GlobalKeyPress
    end
    object eRemotePort: TLabeledEdit
      Left = 104
      Top = 100
      Width = 121
      Height = 27
      BevelEdges = [beRight, beBottom]
      EditLabel.Width = 85
      EditLabel.Height = 19
      EditLabel.Caption = 'Port zdalny:'
      LabelPosition = lpLeft
      TabOrder = 1
      OnKeyPress = GlobalKeyPress
    end
    object eIP: TLabeledEdit
      Left = 104
      Top = 132
      Width = 121
      Height = 27
      BevelEdges = [beRight, beBottom]
      EditLabel.Width = 67
      EditLabel.Height = 19
      EditLabel.Caption = 'Adres IP:'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 2
      Text = '127.0.0.1'
    end
    object btnTest: TButton
      Left = 104
      Top = 162
      Width = 121
      Height = 21
      Caption = 'Testuj...'
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnTestClick
    end
  end
  object gbProgram: TGroupBox
    Left = 248
    Top = 4
    Width = 233
    Height = 105
    Caption = ' Program '
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 22
      Width = 217
      Height = 39
      AutoSize = False
      Caption = 
        'Ustaw poni'#380'ej domy'#347'lny status, kt'#243'ry b'#281'dzie wybrany przy uruchom' +
        'ieniu programu (je'#347'li komputer b'#281'dzie pod'#322#261'czony do Internetu):'
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object cbStatus: TComboBox
      Left = 8
      Top = 68
      Width = 217
      Height = 27
      Style = csOwnerDrawFixed
      ItemHeight = 21
      TabOrder = 0
    end
  end
  object chbSaveState: TCheckBox
    Left = 8
    Top = 200
    Width = 425
    Height = 18
    Caption = 
      'Nie zapisuj ustawie'#324' programu (np. wymiary i pozycja g'#322#243'wnego ok' +
      'na)'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
end
