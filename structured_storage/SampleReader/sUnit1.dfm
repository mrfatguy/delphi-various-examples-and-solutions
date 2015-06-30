object Form1: TForm1
  Left = 198
  Top = 103
  BorderIcons = [biSystemMenu, biMaximize, biHelp]
  BorderStyle = bsSingle
  Caption = 'Saver'
  ClientHeight = 270
  ClientWidth = 395
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 395
    Height = 270
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Elements'
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 387
        Height = 242
        ActivePage = TabSheet4
        Align = alClient
        Style = tsFlatButtons
        TabOrder = 0
        object TabSheet3: TTabSheet
          Caption = 'StringList'
          object Memo1: TMemo
            Left = 4
            Top = 28
            Width = 373
            Height = 185
            ScrollBars = ssBoth
            TabOrder = 0
            WordWrap = False
          end
          object Button5: TButton
            Left = 300
            Top = 0
            Width = 75
            Height = 25
            Caption = 'Store It!'
            TabOrder = 1
            OnClick = Button5Click
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'String && Integer'
          ImageIndex = 1
          object Label2: TLabel
            Left = 4
            Top = 6
            Width = 30
            Height = 13
            Caption = 'Value:'
          end
          object Label3: TLabel
            Left = 4
            Top = 38
            Width = 30
            Height = 13
            Caption = 'Value:'
          end
          object Label4: TLabel
            Left = 4
            Top = 70
            Width = 30
            Height = 13
            Caption = 'Value:'
          end
          object Edit2: TEdit
            Left = 36
            Top = 2
            Width = 261
            Height = 21
            TabOrder = 0
          end
          object Button6: TButton
            Left = 300
            Top = 0
            Width = 75
            Height = 25
            Caption = 'Store It!'
            TabOrder = 1
            OnClick = Button6Click
          end
          object SpinEdit1: TSpinEdit
            Left = 36
            Top = 33
            Width = 261
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 2
            Value = 0
          end
          object Button7: TButton
            Left = 300
            Top = 32
            Width = 75
            Height = 25
            Caption = 'Store It!'
            TabOrder = 3
            OnClick = Button7Click
          end
          object Button8: TButton
            Left = 300
            Top = 64
            Width = 75
            Height = 25
            Caption = 'Store It!'
            TabOrder = 4
            OnClick = Button8Click
          end
          object RadioGroup1: TRadioGroup
            Left = 36
            Top = 58
            Width = 261
            Height = 33
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'True'
              'False')
            TabOrder = 5
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Files on hard drive'
      ImageIndex = 1
      object Button1: TButton
        Left = 8
        Top = 8
        Width = 169
        Height = 25
        Caption = 'Save bitmap (sample.bmp)'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 8
        Top = 72
        Width = 169
        Height = 25
        Caption = 'Save RVF (sample.rvf)'
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 8
        Top = 104
        Width = 169
        Height = 25
        Caption = 'Save text (sample.txt)'
        TabOrder = 2
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 8
        Top = 136
        Width = 169
        Height = 25
        Caption = 'Save MPEG (sample.mpg)'
        TabOrder = 3
        OnClick = Button4Click
      end
      object Button9: TButton
        Left = 8
        Top = 40
        Width = 169
        Height = 25
        Caption = 'Save JPEG (sample.jpg)'
        TabOrder = 4
        OnClick = Button9Click
      end
    end
  end
end
