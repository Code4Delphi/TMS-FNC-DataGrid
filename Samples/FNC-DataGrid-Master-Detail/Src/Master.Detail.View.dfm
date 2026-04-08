object MasterDetailView: TMasterDetailView
  Left = 0
  Top = 0
  Cursor = crHandPoint
  Caption = 'TMS FNC DataGrid - Master Detail'
  ClientHeight = 709
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
  object TMSFNCDataGrid1: TTMSFNCDataGrid
    Left = 0
    Top = 89
    Width = 1188
    Height = 601
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 6
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
    Options.Banding.BandRowCount = 2
    Options.Banding.Enabled = True
    Options.Banding.NormalRowCount = 2
    Options.Column.Stretching.Enabled = True
    Options.Editing.Enabled = False
    RowCount = 1
    ExplicitTop = 83
    object TMSFNCDataGrid2: TTMSFNCDataGrid
      Left = 173
      Top = 352
      Width = 900
      Height = 225
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
      Adapter = TMSFNCDataGridDatabaseAdapter2
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
      Options.Banding.Enabled = True
      Options.Column.Stretching.Enabled = True
      Options.Editing.Enabled = False
      RowCount = 1
    end
  end
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 1188
    Height = 89
    Align = alTop
    TabOrder = 0
    object GroupBox2: TGroupBox
      Left = 1
      Top = 1
      Width = 208
      Height = 87
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
        Width = 196
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
        Width = 196
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
  end
  object TMSFNCDataGridDatabaseAdapter1: TTMSFNCDataGridDatabaseAdapter
    Left = 552
    Top = 360
    Width = 26
    Height = 26
    Visible = True
    Columns = <>
    DataSource = DataSource1
    DetailControl = TMSFNCDataGrid2
    ShowMemoFields = True
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 690
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
  object TMSFNCDataGridDatabaseAdapter2: TTMSFNCDataGridDatabaseAdapter
    Left = 769
    Top = 360
    Width = 26
    Height = 26
    Visible = True
    Columns = <>
    DataSource = DataSource2
    ShowMemoFields = True
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Code4D\Cursos\TMS\TMS-FNC-DataGrid\Samples\FNC-DataG' +
        'rid-Master-Detail\Data\orders_demo.db'
      'DriverID=SQLite')
    FetchOptions.AssignedValues = [evMode, evCursorKind]
    FetchOptions.Mode = fmAll
    FetchOptions.CursorKind = ckForwardOnly
    Connected = True
    LoginPrompt = False
    Left = 664
    Top = 182
  end
  object FDOrders: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from orders')
    Left = 552
    Top = 246
    object FDOrdersId: TIntegerField
      DisplayLabel = 'Order Code'
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDOrdersregistration_date: TWideMemoField
      DisplayLabel = 'Registration date'
      FieldName = 'registration_date'
      Origin = 'registration_date'
      Required = True
      BlobType = ftWideMemo
    end
    object FDOrderscustomer_code: TIntegerField
      DisplayLabel = 'Customer code'
      FieldName = 'customer_code'
      Origin = 'customer_code'
      Required = True
    end
    object FDOrderscustomer_name: TWideMemoField
      DisplayLabel = 'Customer name'
      FieldName = 'customer_name'
      Origin = 'customer_name'
      Required = True
      BlobType = ftWideMemo
    end
    object FDOrdersinvoice_number: TIntegerField
      DisplayLabel = 'Invoice number'
      FieldName = 'invoice_number'
      Origin = 'invoice_number'
      Required = True
    end
    object FDOrdersclosed: TWideMemoField
      DisplayLabel = 'Closed'
      FieldName = 'closed'
      Origin = 'closed'
      Required = True
      BlobType = ftWideMemo
    end
  end
  object DataSource1: TDataSource
    DataSet = FDOrders
    Left = 552
    Top = 302
  end
  object FDItems: TFDQuery
    IndexFieldNames = 'order_id'
    MasterSource = DataSource1
    MasterFields = 'Id'
    Connection = FDConnection1
    SQL.Strings = (
      'select *from orders_items where order_id = :Id')
    Left = 768
    Top = 248
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object FDItemsId: TIntegerField
      DisplayLabel = 'Item Code'
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDItemsorder_id: TIntegerField
      DisplayLabel = 'Order code'
      FieldName = 'order_id'
      Origin = 'order_id'
      Required = True
    end
    object FDItemsproduct_code: TIntegerField
      DisplayLabel = 'Product code'
      FieldName = 'product_code'
      Origin = 'product_code'
      Required = True
    end
    object FDItemsproduct_name: TWideMemoField
      DisplayLabel = 'Product name'
      FieldName = 'product_name'
      Origin = 'product_name'
      Required = True
      BlobType = ftWideMemo
    end
    object FDItemsquantity: TFloatField
      DisplayLabel = 'Quantity'
      FieldName = 'quantity'
      Origin = 'quantity'
      Required = True
    end
    object FDItemsprice: TFloatField
      DisplayLabel = 'Price'
      FieldName = 'price'
      Origin = 'price'
      Required = True
    end
    object FDItemstotal: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'total'
      Origin = 'total'
      Required = True
    end
  end
  object DataSource2: TDataSource
    DataSet = FDItems
    Left = 768
    Top = 304
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrHourGlass
    Left = 1112
    Top = 337
  end
end
