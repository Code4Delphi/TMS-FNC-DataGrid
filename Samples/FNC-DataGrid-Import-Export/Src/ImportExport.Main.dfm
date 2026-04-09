object ImportExportMain: TImportExportMain
  Left = 0
  Top = 0
  Cursor = crHandPoint
  ActiveControl = TMSFNCDataGrid1
  Caption = 'TMS FNC DataGrid - Import and Export'
  ClientHeight = 671
  ClientWidth = 1261
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object StatusBar1: TStatusBar
    Left = 0
    Top = 652
    Width = 1261
    Height = 19
    Panels = <
      item
        Width = 500
      end
      item
        Width = 50
      end>
  end
  object TMSFNCDataGrid1: TTMSFNCDataGrid
    Left = 0
    Top = 129
    Width = 1261
    Height = 523
    Align = alClient
    ParentDoubleBuffered = False
    Color = 15000804
    DoubleBuffered = True
    TabOrder = 1
    ShowAcceleratorChar = False
    Footer.Bar.Buttons = <>
    Header.VisualGrouping.Layout.Font.Charset = DEFAULT_CHARSET
    Header.VisualGrouping.Layout.Font.Color = clWindowText
    Header.VisualGrouping.Layout.Font.Height = -12
    Header.VisualGrouping.Layout.Font.Name = 'Segoe UI'
    Header.VisualGrouping.Layout.Font.Style = []
    Header.Bar.Buttons = <>
    CellAppearance.FilterMatchLayout.Font.Charset = DEFAULT_CHARSET
    CellAppearance.FilterMatchLayout.Font.Color = clWindowText
    CellAppearance.FilterMatchLayout.Font.Height = -12
    CellAppearance.FilterMatchLayout.Font.Name = 'Segoe UI'
    CellAppearance.FilterMatchLayout.Font.Style = []
    CellAppearance.FilterInverseMatchLayout.Font.Charset = DEFAULT_CHARSET
    CellAppearance.FilterInverseMatchLayout.Font.Color = clWindowText
    CellAppearance.FilterInverseMatchLayout.Font.Height = -12
    CellAppearance.FilterInverseMatchLayout.Font.Name = 'Segoe UI'
    CellAppearance.FilterInverseMatchLayout.Font.Style = []
    CellAppearance.BandLayout.Font.Charset = DEFAULT_CHARSET
    CellAppearance.BandLayout.Font.Color = clBlack
    CellAppearance.BandLayout.Font.Height = -12
    CellAppearance.BandLayout.Font.Name = 'Segoe UI'
    CellAppearance.BandLayout.Font.Style = []
    CellAppearance.FixedLayout.Font.Charset = DEFAULT_CHARSET
    CellAppearance.FixedLayout.Font.Color = clBlack
    CellAppearance.FixedLayout.Font.Height = -12
    CellAppearance.FixedLayout.Font.Name = 'Segoe UI'
    CellAppearance.FixedLayout.Font.Style = []
    CellAppearance.FixedSelectedLayout.Font.Charset = DEFAULT_CHARSET
    CellAppearance.FixedSelectedLayout.Font.Color = clBlack
    CellAppearance.FixedSelectedLayout.Font.Height = -12
    CellAppearance.FixedSelectedLayout.Font.Name = 'Segoe UI'
    CellAppearance.FixedSelectedLayout.Font.Style = []
    CellAppearance.FocusedLayout.Font.Charset = DEFAULT_CHARSET
    CellAppearance.FocusedLayout.Font.Color = clBlack
    CellAppearance.FocusedLayout.Font.Height = -12
    CellAppearance.FocusedLayout.Font.Name = 'Segoe UI'
    CellAppearance.FocusedLayout.Font.Style = []
    CellAppearance.GroupLayout.Font.Charset = DEFAULT_CHARSET
    CellAppearance.GroupLayout.Font.Color = clBlack
    CellAppearance.GroupLayout.Font.Height = -12
    CellAppearance.GroupLayout.Font.Name = 'Segoe UI'
    CellAppearance.GroupLayout.Font.Style = []
    CellAppearance.NormalLayout.Font.Charset = DEFAULT_CHARSET
    CellAppearance.NormalLayout.Font.Color = clBlack
    CellAppearance.NormalLayout.Font.Height = -12
    CellAppearance.NormalLayout.Font.Name = 'Segoe UI'
    CellAppearance.NormalLayout.Font.Style = []
    CellAppearance.SelectedLayout.Font.Charset = DEFAULT_CHARSET
    CellAppearance.SelectedLayout.Font.Color = clBlack
    CellAppearance.SelectedLayout.Font.Height = -12
    CellAppearance.SelectedLayout.Font.Name = 'Segoe UI'
    CellAppearance.SelectedLayout.Font.Style = []
    CellAppearance.SummaryLayout.Font.Charset = DEFAULT_CHARSET
    CellAppearance.SummaryLayout.Font.Color = clBlack
    CellAppearance.SummaryLayout.Font.Height = -12
    CellAppearance.SummaryLayout.Font.Name = 'Segoe UI'
    CellAppearance.SummaryLayout.Font.Style = []
    ColumnCount = 0
    Columns = <>
    FilterActions = <>
    FilterAppearance.Font.Charset = DEFAULT_CHARSET
    FilterAppearance.Font.Color = clBlack
    FilterAppearance.Font.Height = -12
    FilterAppearance.Font.Name = 'Segoe UI'
    FilterAppearance.Font.Style = []
    OnGetCellLayout = TMSFNCDataGrid1GetCellLayout
    Options.Filtering.Enabled = True
    Options.Sorting.Enabled = True
    Options.Column.Stretching.Enabled = True
    ExplicitTop = 124
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1261
    Height = 129
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = -6
    object GroupBox1: TGroupBox
      Left = 355
      Top = 0
      Width = 170
      Height = 129
      Align = alLeft
      Caption = ' CSV '
      TabOrder = 0
      ExplicitLeft = 171
      ExplicitTop = -6
      ExplicitHeight = 113
      DesignSize = (
        170
        129)
      object Label1: TLabel
        Left = 7
        Top = 20
        Width = 48
        Height = 15
        Caption = 'Delimiter'
      end
      object btnImportCSV: TButton
        Left = 7
        Top = 93
        Width = 75
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Import'
        TabOrder = 0
        OnClick = btnImportCSVClick
        ExplicitTop = 77
      end
      object btnExportCSV: TButton
        Left = 88
        Top = 93
        Width = 75
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Export'
        TabOrder = 1
        OnClick = btnExportCSVClick
        ExplicitTop = 117
      end
      object edtDelimiterCSV: TEdit
        Left = 7
        Top = 37
        Width = 121
        Height = 23
        MaxLength = 1
        TabOrder = 2
        Text = ';'
      end
      object ckQuoteEmptyCells: TCheckBox
        Left = 7
        Top = 66
        Width = 128
        Height = 17
        Caption = 'Quote Empty Cells'
        TabOrder = 3
      end
    end
    object GroupBox2: TGroupBox
      Left = 525
      Top = 0
      Width = 170
      Height = 129
      Align = alLeft
      Caption = ' Excel (xls) '
      TabOrder = 1
      ExplicitTop = -6
      DesignSize = (
        170
        129)
      object btnImportarExcel: TButton
        Left = 7
        Top = 29
        Width = 75
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Import'
        TabOrder = 0
        OnClick = btnImportarExcelClick
      end
      object btnExportExcel: TButton
        Left = 88
        Top = 29
        Width = 75
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Export'
        TabOrder = 1
        OnClick = btnExportExcelClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 185
      Top = 0
      Width = 170
      Height = 129
      Align = alLeft
      Caption = ' Proprietary file format '
      TabOrder = 2
      ExplicitLeft = 8
      ExplicitHeight = 81
      DesignSize = (
        170
        129)
      object btnImportProprietary: TButton
        Left = 7
        Top = 29
        Width = 75
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Import'
        TabOrder = 0
        OnClick = btnImportProprietaryClick
      end
      object btnExportProprietary: TButton
        Left = 88
        Top = 29
        Width = 75
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Export'
        TabOrder = 1
        OnClick = btnExportProprietaryClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 695
      Top = 0
      Width = 88
      Height = 129
      Align = alLeft
      Caption = ' HTML files '
      TabOrder = 3
      DesignSize = (
        88
        129)
      object btnExportHTML: TButton
        Left = 6
        Top = 29
        Width = 75
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Export'
        TabOrder = 0
        OnClick = btnExportHTMLClick
      end
    end
    object GroupBox5: TGroupBox
      Left = 0
      Top = 0
      Width = 185
      Height = 129
      Align = alLeft
      Caption = ' Config '
      TabOrder = 4
      ExplicitLeft = 1
      ExplicitTop = -6
      object ckOpenAfterCreation: TCheckBox
        Left = 13
        Top = 24
        Width = 132
        Height = 17
        Caption = 'Open After Creation'
        TabOrder = 0
        OnClick = ckOpenAfterCreationClick
      end
      object btnClearGrid: TButton
        Left = 13
        Top = 62
        Width = 75
        Height = 25
        Caption = 'Clear Grid'
        TabOrder = 1
        OnClick = btnClearGridClick
      end
    end
    object GroupBox6: TGroupBox
      Left = 783
      Top = 0
      Width = 88
      Height = 129
      Align = alLeft
      Caption = ' PDF '
      TabOrder = 5
      DesignSize = (
        88
        129)
      object btnExportPDF: TButton
        Left = 6
        Top = 29
        Width = 75
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Export'
        TabOrder = 0
        OnClick = btnExportPDFClick
      end
    end
  end
  object TMSFNCDataGridExcelIO1: TTMSFNCDataGridExcelIO
    Left = 396
    Top = 159
    Width = 26
    Height = 26
    Visible = True
    DataGrid = TMSFNCDataGrid1
    Options.ExportOverwriteMessage = 'File %s already exists'#13'Ok to overwrite ?'
    UseUnicode = False
    Version = '3.24'
  end
  object TMSFNCDataGridPDFIO1: TTMSFNCDataGridPDFIO
    Left = 839
    Top = 159
    Width = 26
    Height = 26
    Visible = True
    DataGrid = TMSFNCDataGrid1
    Options.DefaultFont.Name = 'Arial'
    Options.Header = 'TMS PDF Header'
    Options.Footer = 'TMS PDF Footer'
    Options.Margins.Left = 20.000000000000000000
    Options.Margins.Top = 50.000000000000000000
    Options.Margins.Right = 20.000000000000000000
    Options.Margins.Bottom = 50.000000000000000000
    Options.HeaderFont.Name = 'Arial'
    Options.FooterFont.Name = 'Arial'
    Options.HeaderMargins.Left = 20.000000000000000000
    Options.HeaderMargins.Top = 5.000000000000000000
    Options.HeaderMargins.Right = 20.000000000000000000
    Options.HeaderMargins.Bottom = 5.000000000000000000
    Options.FooterMargins.Left = 20.000000000000000000
    Options.FooterMargins.Top = 5.000000000000000000
    Options.FooterMargins.Right = 20.000000000000000000
    Options.FooterMargins.Bottom = 5.000000000000000000
    Options.PageNumberMargins.Left = 20.000000000000000000
    Options.PageNumberMargins.Top = 5.000000000000000000
    Options.PageNumberMargins.Right = 20.000000000000000000
    Options.PageNumberMargins.Bottom = 5.000000000000000000
    Options.PageNumberFormat = '%d'
    Options.PageNumberFont.Name = 'Arial'
  end
end
