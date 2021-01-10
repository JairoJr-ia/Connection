object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 357
  ClientWidth = 660
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 144
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Inserir'
    TabOrder = 0
    OnClick = Button1Click
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 180
    Width = 105
    Height = 105
    Caption = 'Escolha a conex'#227'o'
    ItemIndex = 0
    Items.Strings = (
      'FireDAC'
      'InterBase')
    TabOrder = 1
    OnClick = RadioGroup1Click
  end
  object cxGrid1: TcxGrid
    AlignWithMargins = True
    Left = 5
    Top = 5
    Width = 650
    Height = 148
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = cxcbsNone
    TabOrder = 2
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = ''
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsPesqGrupo
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.SeparatorWidth = 2
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Content = cxStyleRow
      Styles.ContentOdd = cxStyleRowOdd
      Styles.FilterBox = cxStyleHeader
      Styles.GroupByBox = cxStyleGroupByBox
      Styles.Header = cxStyleHeader
      object cxGrid1DBTableView1Column1: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'CODIGO'
        Width = 113
      end
      object cxGrid1DBTableView1Column2: TcxGridDBColumn
        Caption = 'Nome'
        DataBinding.FieldName = 'NOME'
        Width = 525
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxLabel1: TcxLabel
    Left = 144
    Top = 180
    Caption = 'C'#243'digo'
  end
  object cxLabel2: TcxLabel
    Left = 144
    Top = 236
    Caption = 'Nome'
  end
  object cxDBTextEdit1: TcxDBTextEdit
    Left = 144
    Top = 200
    DataBinding.DataField = 'CODIGO'
    DataBinding.DataSource = dsGrupo
    Properties.ReadOnly = True
    TabOrder = 5
    Width = 121
  end
  object edNome: TcxDBTextEdit
    Left = 144
    Top = 259
    DataBinding.DataField = 'NOME'
    DataBinding.DataSource = dsGrupo
    Properties.CharCase = ecUpperCase
    TabOrder = 6
    Width = 393
  end
  object Button2: TButton
    Left = 306
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 7
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 225
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Delete'
    TabOrder = 8
    OnClick = Button3Click
  end
  object cdsGRUPO: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT GEN_ID(GEN_GRUPO_ID, 1) AS VLR FROM RDB$DATABASE'
    Params = <>
    Left = 448
    Top = 232
    object cdsGRUPOCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsGRUPONOME: TStringField
      FieldName = 'NOME'
    end
  end
  object dsGrupo: TDataSource
    DataSet = cdsGRUPO
    Left = 352
    Top = 216
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    PopupMenus = <>
    Left = 80
    Top = 80
  end
  object cxStylePrincipal: TcxStyleRepository
    Left = 360
    Top = 304
    PixelsPerInch = 96
    object cxStyleHeader: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8013339
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyleRow: TcxStyle
      AssignedValues = [svColor]
      Color = clWhite
    end
    object cxStyleRowOdd: TcxStyle
      AssignedValues = [svColor]
      Color = 16772573
    end
    object cxStyleGroupByBox: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6305557
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
  end
  object dsPesqGrupo: TDataSource
    DataSet = cdsPesqGrupo
    Left = 568
    Top = 256
  end
  object cdsPesqGrupo: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 568
    Top = 176
    object cdsPesqGrupoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsPesqGrupoNOME: TStringField
      FieldName = 'NOME'
    end
  end
end
