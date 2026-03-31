object GroupingAdvanced: TGroupingAdvanced
  Left = 0
  Top = 0
  Cursor = crHandPoint
  ActiveControl = TMSFNCDataGrid1
  Caption = 'TMS FNC DataGrid - Grouping advanced'
  ClientHeight = 722
  ClientWidth = 1188
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
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 1188
    Height = 131
    Align = alTop
    TabOrder = 0
    object GroupBox2: TGroupBox
      Left = 1
      Top = 1
      Width = 140
      Height = 129
      Align = alLeft
      Caption = ' Query '
      Padding.Left = 4
      Padding.Top = 2
      Padding.Right = 4
      TabOrder = 0
      object btnClose: TButton
        AlignWithMargins = True
        Left = 6
        Top = 47
        Width = 128
        Height = 25
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Align = alTop
        Caption = 'Close'
        TabOrder = 0
        OnClick = btnCloseClick
      end
      object btnOpenQuery: TButton
        AlignWithMargins = True
        Left = 6
        Top = 19
        Width = 128
        Height = 25
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Align = alTop
        Caption = 'Open query'
        TabOrder = 1
        OnClick = btnOpenQueryClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 326
      Top = 1
      Width = 652
      Height = 129
      Align = alLeft
      Caption = ' Grouping '
      TabOrder = 1
      DesignSize = (
        652
        129)
      object btnGroupBasic: TButton
        Left = 16
        Top = 19
        Width = 449
        Height = 25
        Caption = 
          'Group by multiple columns (Group code,  Brand name and Condition' +
          ')'
        TabOrder = 0
        OnClick = btnGroupBasicClick
      end
      object btnUngroup: TButton
        Left = 516
        Top = 19
        Width = 130
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Ungroup'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnUngroupClick
      end
      object btnExpandAllNodes: TButton
        Left = 516
        Top = 50
        Width = 130
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Expand All Nodes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = btnExpandAllNodesClick
      end
      object btnCollapseAllNodes: TButton
        Left = 516
        Top = 81
        Width = 130
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Collapse All Nodes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = btnCollapseAllNodesClick
      end
    end
    object GroupBox1: TGroupBox
      Left = 141
      Top = 1
      Width = 185
      Height = 129
      Align = alLeft
      Caption = ' Grouping configs '
      TabOrder = 2
      object ckGroupingHideColumns: TCheckBox
        Left = 6
        Top = 23
        Width = 176
        Height = 17
        Caption = 'Hide Grouped Columns'
        TabOrder = 0
      end
    end
  end
  object TMSFNCDataGrid1: TTMSFNCDataGrid
    Left = 0
    Top = 131
    Width = 1188
    Height = 572
    Cursor = crHandPoint
    Align = alClient
    ParentDoubleBuffered = False
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
    Adapter = TMSFNCDataGridDatabaseAdapter1
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
    Options.Filtering.Enabled = True
    Options.Sorting.Enabled = True
    Options.Banding.Enabled = True
    Options.Column.Stretching.Enabled = True
    Options.Selection.Mode = gsmSingleRow
    RowCount = 1
  end
  object TMSFNCDataGridDatabaseAdapter1: TTMSFNCDataGridDatabaseAdapter
    Left = 552
    Top = 360
    Width = 26
    Height = 26
    Visible = True
    Columns = <>
    DataSource = DataSource1
    ShowMemoFields = True
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 703
    Width = 1188
    Height = 19
    Panels = <
      item
        Width = 500
      end
      item
        Width = 50
      end>
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Code4D\Cursos\TMS\TMS-FNC-DataGrid\Samples\FNC-DataG' +
        'rid-Grouping\Data\products.db'
      'DriverID=SQLite')
    FetchOptions.AssignedValues = [evMode, evCursorKind]
    FetchOptions.Mode = fmAll
    FetchOptions.CursorKind = ckForwardOnly
    LoginPrompt = False
    Left = 552
    Top = 190
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from products')
    Left = 552
    Top = 246
    object FDQuery1product_code: TIntegerField
      DisplayLabel = 'Product code'
      FieldName = 'product_code'
      Origin = 'product_code'
    end
    object FDQuery1name: TWideMemoField
      DisplayLabel = 'Product name'
      FieldName = 'name'
      Origin = 'name'
      BlobType = ftWideMemo
    end
    object FDQuery1group_code: TIntegerField
      DisplayLabel = 'Group code'
      FieldName = 'group_code'
      Origin = 'group_code'
    end
    object FDQuery1brand_name: TWideMemoField
      DisplayLabel = 'Brand name'
      FieldName = 'brand_name'
      Origin = 'brand_name'
      BlobType = ftWideMemo
    end
    object FDQuery1inventory: TFloatField
      DisplayLabel = 'Inventory'
      FieldName = 'inventory'
      Origin = 'inventory'
    end
    object FDQuery1cost_price: TFloatField
      DisplayLabel = 'Cost price'
      FieldName = 'cost_price'
      Origin = 'cost_price'
    end
    object FDQuery1sale_price: TFloatField
      DisplayLabel = 'Sale price'
      FieldName = 'sale_price'
      Origin = 'sale_price'
    end
    object FDQuery1condition: TWideMemoField
      DisplayLabel = 'Condition'
      FieldName = 'condition'
      Origin = 'condition'
      BlobType = ftWideMemo
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    OnDataChange = DataSource1DataChange
    Left = 552
    Top = 302
  end
end
