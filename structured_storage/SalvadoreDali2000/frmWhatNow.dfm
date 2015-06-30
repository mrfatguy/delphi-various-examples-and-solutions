object WhatNowForm: TWhatNowForm
  Left = 311
  Top = 236
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Album zosta³ utworzony!'
  ClientHeight = 249
  ClientWidth = 345
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
  object lblSourceSize: TLabel
    Left = 188
    Top = 54
    Width = 27
    Height = 16
    Caption = '0 kB'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 329
    Height = 41
    AutoSize = False
    Caption = 
      'Album fotograficzny wed³ug zadanych parametrów zosta³ prawid³o- ' +
      'wo utworzony w pliku tymczasowym. Wybierz, co chcesz dalej z nim' +
      ' zrobiæ?'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 8
    Top = 54
    Width = 161
    Height = 16
    Caption = 'Rozmiar plików Ÿród³owych:'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 72
    Width = 176
    Height = 16
    Caption = 'Rozmiar utworzonego albumu:'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblAlbumSize: TLabel
    Left = 188
    Top = 72
    Width = 27
    Height = 16
    Caption = '0 kB'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblPhotoCount: TLabel
    Left = 188
    Top = 94
    Width = 8
    Height = 16
    Caption = '0'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 94
    Width = 158
    Height = 16
    Caption = 'Liczba fotografii w albumie:'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 112
    Width = 138
    Height = 16
    Caption = 'Czas tworzenia albumu:'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblTime: TLabel
    Left = 188
    Top = 112
    Width = 37
    Height = 16
    Caption = '00:00'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object rgDecision: TRadioGroup
    Left = 8
    Top = 136
    Width = 329
    Height = 73
    Caption = 'Co chcesz dalej zrobiæ?'
    ItemIndex = 0
    Items.Strings = (
      'Skopiuj utworzony album do mojej galerii fotografii'
      'Zapisz utworzony album w pliku poza galeri¹'
      'Zamknij to okno i kontynuuj tworzenie nowego albumu')
    TabOrder = 0
  end
  object btnOK: TButton
    Left = 262
    Top = 216
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = btnOKClick
  end
  object sDialog: TSaveDialog
    DefaultExt = '*.maf'
    Filter = 'Albumy fotografii|*.maf'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Zapisz album'
    Left = 8
    Top = 8
  end
end
