object MainForm: TMainForm
  Left = 201
  Top = 103
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'MyTimeSync 1.00'
  ClientHeight = 515
  ClientWidth = 708
  Color = clBtnFace
  Font.Charset = EASTEUROPE_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcMain: TPageControl
    Left = 8
    Top = 8
    Width = 692
    Height = 468
    ActivePage = tsInfo
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    OnChange = pcMainChange
    object tsInfo: TTabSheet
      Caption = 'Synchronizacja czasu'
      ImageIndex = 1
      object lblTimeServer: TLabel
        Left = 108
        Top = 8
        Width = 68
        Height = 13
        Caption = 'Serwer czasu:'
      end
      object Label5: TLabel
        Left = 398
        Top = 8
        Width = 235
        Height = 13
        Caption = 'Maksymalny czas synchronizacji w milisekundach:'
      end
      object mInfo: TMemo
        Left = 2
        Top = 32
        Width = 680
        Height = 406
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 3
      end
      object btnSync: TButton
        Left = 2
        Top = 2
        Width = 90
        Height = 25
        Caption = 'Synchronizuj!'
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnSyncClick
      end
      object cbTimeServer: TComboBox
        Left = 180
        Top = 4
        Width = 212
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        Items.Strings = (
          'vega.cbk.poznan.pl'
          'ntp.certum.pl'
          'tempus1.gum.gov.pl'
          'tempus2.gum.gov.pl'
          'ntp.task.gda.pl'
          'time.atman.pl'
          'ntp.icm.edu.pl'
          'ntp.nask.pl'
          'sunflower.man.poznan.pl'
          'ucirtr.agh.edu.pl'
          'info.cyf-kr.edu.pl'
          'time.ien.it'
          'swisstime.ethz.ch'
          'ntp1.fau.de'
          'ntp2.fau.de'
          'ntps1-0.cs.tu-berlin.de'
          'ntps1-1.cs.tu-berlin.de'
          'clock.nc.fukuoka-u.ac.jp'
          'ntp.cs.mu.oz.au'
          'tick.keso.fi'
          'tock.keso.fi'
          'ntp.obspm.fr'
          'ntp.univ-lyon1.fr'
          'time.kfki.hu'
          'fartein.ifi.uio.no'
          'ntp.lth.se'
          'biofiz.mf.uni-lj.si'
          'ntp1.arnes.si'
          'ntp2.arnes.si'
          'time.ijs.si'
          'ntp.cs.tcd.ie'
          'ntp.maths.tcd.ie'
          'ntp.tcd.ie'
          'ntp.cs.strath.ac.uk'
          'ntp0.uk.uu.net'
          'ntp1.uk.uu.net'
          'ntp2.uk.uu.net'
          'ntp2a.mcc.ac.uk'
          'ntp2b.mcc.ac.uk'
          'ntp2c.mcc.ac.uk'
          'ntp2d.mcc.ac.uk'
          'time.nuri.net'
          'ntp.cs.unp.ac.za'
          'augean.eleceng.adelaide.edu.au'
          'ntp.adelaide.edu.au'
          'tick.nap.com.ar'
          'tock.nap.com.ar'
          'time.sinectis.com.ar'
          'ntp.cais.rnp.br'
          'time.windows.com'
          'time.nist.gov'
          'time-a.nist.gov'
          'time-b.nist.gov'
          'time-nw.nist.gov'
          'time-a.timefreq.bldrdoc.gov'
          'time-b.timefreq.bldrdoc.gov'
          'time-c.timefreq.bldrdoc.gov'
          'utcnist.colorado.edu'
          'nist1.datum.com'
          'usno.pa-x.dec.com'
          'timekeeper.isi.edu'
          'tick.usno.navy.mil'
          'tock.usno.navy.mil'
          'bonehed.lcs.mit.edu'
          'clock.isc.org'
          'clock.via.net'
          'tick.wustl.edu'
          'ncnoc.ncren.net'
          'ntp1.delmarva.com'
          'otc1.psu.edu'
          'ntp1.cmc.ec.gc.ca'
          'ntp2.cmc.ec.gc.ca'
          'time.chu.nrc.ca'
          'time.nrc.ca'
          'timelord.uregina.ca'
          'tick.utoronto.ca'
          'tock.utoronto.ca'
          'ntp.ucsd.edu'
          'ntp1.mainecoon.com'
          'ntp2.mainecoon.com'
          'louie.udel.edu'
          'ntp.shorty.com'
          'rolex.peachnet.edu'
          'timex.peachnet.edu'
          'ntp-0.cso.uiuc.edu'
          'ntp-1.cso.uiuc.edu'
          'ntp-2.cso.uiuc.edu'
          'ntp-1.mcs.anl.gov'
          'ntp-2.mcs.anl.gov'
          'ntp1.kansas.net'
          'ntp2.kansas.net'
          'ns.nts.umn.edu'
          'nss.nts.umn.edu'
          'cuckoo.nevada.edu'
          'tick.cs.unlv.edu'
          'tock.cs.unlv.edu'
          'ntp.ctr.columbia.edu'
          'sundial.columbia.edu'
          'timex.cs.columbia.edu'
          'tick.koalas.com'
          'tock.koalas.com'
          'clock.psu.edu'
          'fuzz.psc.edu'
          'ntp-1.ece.cmu.edu'
          'ntp-2.ece.cmu.edu'
          'ntp.tmc.edu'
          'ntp5.tamu.edu'
          'tick.greyware.com'
          'tock.greyware.com'
          'ntp-1.vt.edu'
          'ntp-2.vt.edu'
          'ntp1.cs.wisc.edu'
          'ntp2.cs.wisc.edu'
          'ntp3.cs.wisc.edu')
      end
      object seDelay: TSpinEdit
        Left = 634
        Top = 4
        Width = 48
        Height = 22
        EditorEnabled = False
        Increment = 100
        MaxLength = 4
        MaxValue = 9900
        MinValue = 500
        TabOrder = 2
        Value = 2500
      end
    end
    object tsLog: TTabSheet
      Caption = 'Dziennik synchronizacji'
      object lblEmptyLog: TLabel
        Left = 104
        Top = 8
        Width = 159
        Height = 13
        Caption = 'Dziennik zdarzeñ jest pusty!'
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object fList: TListView
        Left = 2
        Top = 32
        Width = 680
        Height = 406
        Anchors = [akLeft, akTop, akRight]
        Columns = <
          item
            Caption = 'Czas synchronizacji'
            Width = 160
          end
          item
            Caption = 'Serwer czasu'
            Width = 150
          end
          item
            Caption = 'Korekta zegara lokalnego'
            Width = 210
          end
          item
            Alignment = taCenter
            Caption = 'Strefa czasowa'
            Width = 140
          end>
        ColumnClick = False
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        GridLines = True
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        ViewStyle = vsReport
      end
      object btnDeleteLog: TButton
        Left = 2
        Top = 2
        Width = 90
        Height = 25
        Caption = 'Wyczyœæ!'
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnDeleteLogClick
      end
    end
    object tsStratum: TTabSheet
      Caption = 'Wydajnoœæ serwerów'
      ImageIndex = 2
      object lblCurrentServer: TLabel
        Left = 104
        Top = 8
        Width = 3
        Height = 13
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lvStratum: TListView
        Left = 2
        Top = 32
        Width = 680
        Height = 406
        Anchors = [akLeft, akTop, akRight]
        Columns = <
          item
            Caption = 'Badany serwer czasu'
            Width = 210
          end
          item
            Alignment = taCenter
            Caption = 'Adres IP serwera'
            Width = 160
          end
          item
            Alignment = taCenter
            Caption = 'Stratum serwera'
            Width = 140
          end
          item
            Alignment = taCenter
            Caption = 'Czas badania'
            Width = 140
          end>
        ColumnClick = False
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        GridLines = True
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
        ViewStyle = vsReport
      end
      object btnCheck: TButton
        Left = 2
        Top = 2
        Width = 90
        Height = 25
        Caption = 'Badaj!'
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnCheckClick
      end
      object btnInfo: TButton
        Left = 592
        Top = 2
        Width = 90
        Height = 25
        Caption = 'Informacje'
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnInfoClick
      end
    end
  end
  object btnClose: TButton
    Left = 610
    Top = 482
    Width = 90
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Zamknij'
    Default = True
    TabOrder = 1
    OnClick = btnCloseClick
  end
  object btnAbout: TButton
    Left = 8
    Top = 482
    Width = 90
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'O programie...'
    TabOrder = 2
    OnClick = btnAboutClick
  end
  object ThemeManager1: TThemeManager
    Left = 16
    Top = 16
  end
end
