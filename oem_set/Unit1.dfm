object Form1: TForm1
  Left = 198
  Top = 103
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'OEMSet 1.00'
  ClientHeight = 382
  ClientWidth = 453
  Color = clBtnFace
  Font.Charset = EASTEUROPE_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ic: TImage
    Left = 0
    Top = 0
    Width = 128
    Height = 128
    Stretch = True
    Visible = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 4
    Width = 438
    Height = 133
    Caption = ' Logo '
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 241
      Height = 26
      AutoSize = False
      Caption = 
        'Obrazek pojawiaj¹cy siê poni¿ej napisu "Wyprodukowany i obs³ugiw' +
        'any przez:"'
      WordWrap = True
    end
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 233
      Height = 54
      AutoSize = False
      Caption = 
        'Aby bitmapa zosta³a wyœwietlona, w poni¿szej ramce wype³nij pole' +
        ' "Manufacturer". Je¿eli pole to pozostanie puste, bitmapa zostan' +
        'ie zignoro- wana.'
      WordWrap = True
    end
    object Panel1: TPanel
      Left = 248
      Top = 10
      Width = 184
      Height = 118
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object i: TImage
        Left = 0
        Top = 0
        Width = 182
        Height = 116
        Hint = 
          'Bitmapa powinna mieæ wymiary 180x114#Starsze systemy Windows nie' +
          ' uwzglêdniaj¹ oryginalnych wymiarów obrazka, tylko narzucaj¹ swo' +
          'je w³asne. Klikaj¹c na ilustracji prze³¹czasz siê miêdzy wyœwiet' +
          'laniem ilustracji w oryginalnych / narzuconych wymiarach.'
        Align = alClient
        ParentShowHint = False
        ShowHint = True
        Stretch = True
        OnClick = iClick
      end
    end
    object Button1: TButton
      Left = 8
      Top = 103
      Width = 113
      Height = 25
      Caption = 'Wybierz rysunek'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 128
      Top = 103
      Width = 113
      Height = 25
      Caption = 'Wyczyœæ'
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 144
    Width = 438
    Height = 63
    Caption = ' Podstawowe informacje '
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 16
      Width = 154
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Zawartoœæ pola "Manufacturer":'
    end
    object Label4: TLabel
      Left = 8
      Top = 38
      Width = 154
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Zawartoœæ pola "Model":'
    end
    object Edit1: TEdit
      Left = 164
      Top = 12
      Width = 268
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 164
      Top = 34
      Width = 268
      Height = 21
      TabOrder = 1
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 216
    Width = 438
    Height = 127
    Caption = ' Informacje pomocy technicznej '
    TabOrder = 2
    object Memo1: TMemo
      Left = 8
      Top = 16
      Width = 422
      Height = 105
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object Button3: TButton
    Left = 8
    Top = 352
    Width = 114
    Height = 25
    Caption = 'O programie...'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 332
    Top = 352
    Width = 114
    Height = 25
    Caption = 'Zakoñcz pracê'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 169
    Top = 352
    Width = 114
    Height = 25
    Caption = 'Uaktualnij dane!'
    TabOrder = 5
    OnClick = Button5Click
  end
  object opd: TOpenPictureDialog
    DefaultExt = '*.bmp'
    Filter = 'Bitmapy (*.bmp)|*.bmp'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Wybierz rysunek...'
    Left = 16
    Top = 16
  end
  object ThemeManager1: TThemeManager
    Left = 8
    Top = 232
  end
  object FlatHint1: TFlatHint
    MaxHintWidth = 400
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 40
    Top = 232
  end
end
