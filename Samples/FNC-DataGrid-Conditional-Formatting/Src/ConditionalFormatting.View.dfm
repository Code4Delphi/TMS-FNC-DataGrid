object ConditionalFormattingView: TConditionalFormattingView
  Left = 0
  Top = 0
  ActiveControl = TMSFNCDataGrid1
  Caption = 'TMS FNC DataGrid - Conditional Formatting'
  ClientHeight = 612
  ClientWidth = 1248
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
    Width = 1248
    Height = 89
    Align = alTop
    TabOrder = 0
    object GroupBox2: TGroupBox
      Left = 1
      Top = 1
      Width = 130
      Height = 87
      Align = alLeft
      Caption = ' Query '
      Padding.Left = 4
      Padding.Top = 2
      Padding.Right = 4
      TabOrder = 0
      ExplicitLeft = 145
      ExplicitHeight = 129
      object btnClose: TButton
        AlignWithMargins = True
        Left = 6
        Top = 47
        Width = 118
        Height = 25
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Align = alTop
        Caption = 'Close'
        TabOrder = 0
        OnClick = btnCloseClick
        ExplicitLeft = 8
      end
      object btnOpenQuery: TButton
        AlignWithMargins = True
        Left = 6
        Top = 19
        Width = 118
        Height = 25
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Align = alTop
        Caption = 'Open query'
        TabOrder = 1
        OnClick = btnOpenQueryClick
        ExplicitLeft = 8
      end
    end
  end
  object TMSFNCDataGrid1: TTMSFNCDataGrid
    Left = 0
    Top = 89
    Width = 1248
    Height = 523
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
    Header.VisualGrouping.Layout.TextMargins.Left = 3.000000000000000000
    Header.VisualGrouping.Layout.TextMargins.Top = 3.000000000000000000
    Header.VisualGrouping.Layout.TextMargins.Right = 3.000000000000000000
    Header.VisualGrouping.Layout.TextMargins.Bottom = 3.000000000000000000
    Header.Bar.Buttons = <>
    Adapter = TMSFNCDataGridDatabaseAdapter1
    CellAppearance.FilterMatchLayout.Font.Charset = DEFAULT_CHARSET
    CellAppearance.FilterMatchLayout.Font.Color = clWindowText
    CellAppearance.FilterMatchLayout.Font.Height = -12
    CellAppearance.FilterMatchLayout.Font.Name = 'Segoe UI'
    CellAppearance.FilterMatchLayout.Font.Style = []
    CellAppearance.FilterMatchLayout.TextMargins.Left = 3.000000000000000000
    CellAppearance.FilterMatchLayout.TextMargins.Top = 3.000000000000000000
    CellAppearance.FilterMatchLayout.TextMargins.Right = 3.000000000000000000
    CellAppearance.FilterMatchLayout.TextMargins.Bottom = 3.000000000000000000
    CellAppearance.FilterInverseMatchLayout.Font.Charset = DEFAULT_CHARSET
    CellAppearance.FilterInverseMatchLayout.Font.Color = clWindowText
    CellAppearance.FilterInverseMatchLayout.Font.Height = -12
    CellAppearance.FilterInverseMatchLayout.Font.Name = 'Segoe UI'
    CellAppearance.FilterInverseMatchLayout.Font.Style = []
    CellAppearance.FilterInverseMatchLayout.TextMargins.Left = 3.000000000000000000
    CellAppearance.FilterInverseMatchLayout.TextMargins.Top = 3.000000000000000000
    CellAppearance.FilterInverseMatchLayout.TextMargins.Right = 3.000000000000000000
    CellAppearance.FilterInverseMatchLayout.TextMargins.Bottom = 3.000000000000000000
    CellAppearance.BandLayout.Font.Charset = DEFAULT_CHARSET
    CellAppearance.BandLayout.Font.Color = clBlack
    CellAppearance.BandLayout.Font.Height = -12
    CellAppearance.BandLayout.Font.Name = 'Segoe UI'
    CellAppearance.BandLayout.Font.Style = []
    CellAppearance.BandLayout.TextMargins.Left = 3.000000000000000000
    CellAppearance.BandLayout.TextMargins.Top = 3.000000000000000000
    CellAppearance.BandLayout.TextMargins.Right = 3.000000000000000000
    CellAppearance.BandLayout.TextMargins.Bottom = 3.000000000000000000
    CellAppearance.FixedLayout.Font.Charset = DEFAULT_CHARSET
    CellAppearance.FixedLayout.Font.Color = clBlack
    CellAppearance.FixedLayout.Font.Height = -12
    CellAppearance.FixedLayout.Font.Name = 'Segoe UI'
    CellAppearance.FixedLayout.Font.Style = []
    CellAppearance.FixedLayout.TextMargins.Left = 3.000000000000000000
    CellAppearance.FixedLayout.TextMargins.Top = 3.000000000000000000
    CellAppearance.FixedLayout.TextMargins.Right = 3.000000000000000000
    CellAppearance.FixedLayout.TextMargins.Bottom = 3.000000000000000000
    CellAppearance.FixedSelectedLayout.Font.Charset = DEFAULT_CHARSET
    CellAppearance.FixedSelectedLayout.Font.Color = clBlack
    CellAppearance.FixedSelectedLayout.Font.Height = -12
    CellAppearance.FixedSelectedLayout.Font.Name = 'Segoe UI'
    CellAppearance.FixedSelectedLayout.Font.Style = []
    CellAppearance.FixedSelectedLayout.TextMargins.Left = 3.000000000000000000
    CellAppearance.FixedSelectedLayout.TextMargins.Top = 3.000000000000000000
    CellAppearance.FixedSelectedLayout.TextMargins.Right = 3.000000000000000000
    CellAppearance.FixedSelectedLayout.TextMargins.Bottom = 3.000000000000000000
    CellAppearance.FocusedLayout.Font.Charset = DEFAULT_CHARSET
    CellAppearance.FocusedLayout.Font.Color = clBlack
    CellAppearance.FocusedLayout.Font.Height = -12
    CellAppearance.FocusedLayout.Font.Name = 'Segoe UI'
    CellAppearance.FocusedLayout.Font.Style = []
    CellAppearance.FocusedLayout.TextMargins.Left = 3.000000000000000000
    CellAppearance.FocusedLayout.TextMargins.Top = 3.000000000000000000
    CellAppearance.FocusedLayout.TextMargins.Right = 3.000000000000000000
    CellAppearance.FocusedLayout.TextMargins.Bottom = 3.000000000000000000
    CellAppearance.GroupLayout.Font.Charset = DEFAULT_CHARSET
    CellAppearance.GroupLayout.Font.Color = clBlack
    CellAppearance.GroupLayout.Font.Height = -12
    CellAppearance.GroupLayout.Font.Name = 'Segoe UI'
    CellAppearance.GroupLayout.Font.Style = []
    CellAppearance.GroupLayout.TextMargins.Left = 3.000000000000000000
    CellAppearance.GroupLayout.TextMargins.Top = 3.000000000000000000
    CellAppearance.GroupLayout.TextMargins.Right = 3.000000000000000000
    CellAppearance.GroupLayout.TextMargins.Bottom = 3.000000000000000000
    CellAppearance.NormalLayout.Font.Charset = DEFAULT_CHARSET
    CellAppearance.NormalLayout.Font.Color = clBlack
    CellAppearance.NormalLayout.Font.Height = -12
    CellAppearance.NormalLayout.Font.Name = 'Segoe UI'
    CellAppearance.NormalLayout.Font.Style = []
    CellAppearance.NormalLayout.TextMargins.Left = 3.000000000000000000
    CellAppearance.NormalLayout.TextMargins.Top = 3.000000000000000000
    CellAppearance.NormalLayout.TextMargins.Right = 3.000000000000000000
    CellAppearance.NormalLayout.TextMargins.Bottom = 3.000000000000000000
    CellAppearance.SelectedLayout.Font.Charset = DEFAULT_CHARSET
    CellAppearance.SelectedLayout.Font.Color = clBlack
    CellAppearance.SelectedLayout.Font.Height = -12
    CellAppearance.SelectedLayout.Font.Name = 'Segoe UI'
    CellAppearance.SelectedLayout.Font.Style = []
    CellAppearance.SelectedLayout.TextMargins.Left = 3.000000000000000000
    CellAppearance.SelectedLayout.TextMargins.Top = 3.000000000000000000
    CellAppearance.SelectedLayout.TextMargins.Right = 3.000000000000000000
    CellAppearance.SelectedLayout.TextMargins.Bottom = 3.000000000000000000
    CellAppearance.SummaryLayout.Font.Charset = DEFAULT_CHARSET
    CellAppearance.SummaryLayout.Font.Color = clBlack
    CellAppearance.SummaryLayout.Font.Height = -12
    CellAppearance.SummaryLayout.Font.Name = 'Segoe UI'
    CellAppearance.SummaryLayout.Font.Style = []
    CellAppearance.SummaryLayout.TextMargins.Left = 3.000000000000000000
    CellAppearance.SummaryLayout.TextMargins.Top = 3.000000000000000000
    CellAppearance.SummaryLayout.TextMargins.Right = 3.000000000000000000
    CellAppearance.SummaryLayout.TextMargins.Bottom = 3.000000000000000000
    ColumnCount = 1
    ConditionalFormatting = <>
    Columns = <
      item
        Appearance.FilterMatchLayout.Font.Charset = DEFAULT_CHARSET
        Appearance.FilterMatchLayout.Font.Color = clWindowText
        Appearance.FilterMatchLayout.Font.Height = -12
        Appearance.FilterMatchLayout.Font.Name = 'Segoe UI'
        Appearance.FilterMatchLayout.Font.Style = []
        Appearance.FilterMatchLayout.TextMargins.Left = 3.000000000000000000
        Appearance.FilterMatchLayout.TextMargins.Top = 3.000000000000000000
        Appearance.FilterMatchLayout.TextMargins.Right = 3.000000000000000000
        Appearance.FilterMatchLayout.TextMargins.Bottom = 3.000000000000000000
        Appearance.FilterInverseMatchLayout.Font.Charset = DEFAULT_CHARSET
        Appearance.FilterInverseMatchLayout.Font.Color = clWindowText
        Appearance.FilterInverseMatchLayout.Font.Height = -12
        Appearance.FilterInverseMatchLayout.Font.Name = 'Segoe UI'
        Appearance.FilterInverseMatchLayout.Font.Style = []
        Appearance.FilterInverseMatchLayout.TextMargins.Left = 3.000000000000000000
        Appearance.FilterInverseMatchLayout.TextMargins.Top = 3.000000000000000000
        Appearance.FilterInverseMatchLayout.TextMargins.Right = 3.000000000000000000
        Appearance.FilterInverseMatchLayout.TextMargins.Bottom = 3.000000000000000000
        Appearance.BandLayout.Font.Charset = DEFAULT_CHARSET
        Appearance.BandLayout.Font.Color = clBlack
        Appearance.BandLayout.Font.Height = -12
        Appearance.BandLayout.Font.Name = 'Segoe UI'
        Appearance.BandLayout.Font.Style = []
        Appearance.BandLayout.TextMargins.Left = 3.000000000000000000
        Appearance.BandLayout.TextMargins.Top = 3.000000000000000000
        Appearance.BandLayout.TextMargins.Right = 3.000000000000000000
        Appearance.BandLayout.TextMargins.Bottom = 3.000000000000000000
        Appearance.FixedLayout.Font.Charset = DEFAULT_CHARSET
        Appearance.FixedLayout.Font.Color = clBlack
        Appearance.FixedLayout.Font.Height = -12
        Appearance.FixedLayout.Font.Name = 'Segoe UI'
        Appearance.FixedLayout.Font.Style = []
        Appearance.FixedLayout.TextMargins.Left = 3.000000000000000000
        Appearance.FixedLayout.TextMargins.Top = 3.000000000000000000
        Appearance.FixedLayout.TextMargins.Right = 3.000000000000000000
        Appearance.FixedLayout.TextMargins.Bottom = 3.000000000000000000
        Appearance.FixedSelectedLayout.Font.Charset = DEFAULT_CHARSET
        Appearance.FixedSelectedLayout.Font.Color = clBlack
        Appearance.FixedSelectedLayout.Font.Height = -12
        Appearance.FixedSelectedLayout.Font.Name = 'Segoe UI'
        Appearance.FixedSelectedLayout.Font.Style = []
        Appearance.FixedSelectedLayout.TextMargins.Left = 3.000000000000000000
        Appearance.FixedSelectedLayout.TextMargins.Top = 3.000000000000000000
        Appearance.FixedSelectedLayout.TextMargins.Right = 3.000000000000000000
        Appearance.FixedSelectedLayout.TextMargins.Bottom = 3.000000000000000000
        Appearance.FocusedLayout.Font.Charset = DEFAULT_CHARSET
        Appearance.FocusedLayout.Font.Color = clBlack
        Appearance.FocusedLayout.Font.Height = -12
        Appearance.FocusedLayout.Font.Name = 'Segoe UI'
        Appearance.FocusedLayout.Font.Style = []
        Appearance.FocusedLayout.TextMargins.Left = 3.000000000000000000
        Appearance.FocusedLayout.TextMargins.Top = 3.000000000000000000
        Appearance.FocusedLayout.TextMargins.Right = 3.000000000000000000
        Appearance.FocusedLayout.TextMargins.Bottom = 3.000000000000000000
        Appearance.GroupLayout.Font.Charset = DEFAULT_CHARSET
        Appearance.GroupLayout.Font.Color = clBlack
        Appearance.GroupLayout.Font.Height = -12
        Appearance.GroupLayout.Font.Name = 'Segoe UI'
        Appearance.GroupLayout.Font.Style = []
        Appearance.GroupLayout.TextMargins.Left = 3.000000000000000000
        Appearance.GroupLayout.TextMargins.Top = 3.000000000000000000
        Appearance.GroupLayout.TextMargins.Right = 3.000000000000000000
        Appearance.GroupLayout.TextMargins.Bottom = 3.000000000000000000
        Appearance.NormalLayout.Font.Charset = DEFAULT_CHARSET
        Appearance.NormalLayout.Font.Color = clBlack
        Appearance.NormalLayout.Font.Height = -12
        Appearance.NormalLayout.Font.Name = 'Segoe UI'
        Appearance.NormalLayout.Font.Style = []
        Appearance.NormalLayout.TextMargins.Left = 3.000000000000000000
        Appearance.NormalLayout.TextMargins.Top = 3.000000000000000000
        Appearance.NormalLayout.TextMargins.Right = 3.000000000000000000
        Appearance.NormalLayout.TextMargins.Bottom = 3.000000000000000000
        Appearance.SelectedLayout.Font.Charset = DEFAULT_CHARSET
        Appearance.SelectedLayout.Font.Color = clBlack
        Appearance.SelectedLayout.Font.Height = -12
        Appearance.SelectedLayout.Font.Name = 'Segoe UI'
        Appearance.SelectedLayout.Font.Style = []
        Appearance.SelectedLayout.TextMargins.Left = 3.000000000000000000
        Appearance.SelectedLayout.TextMargins.Top = 3.000000000000000000
        Appearance.SelectedLayout.TextMargins.Right = 3.000000000000000000
        Appearance.SelectedLayout.TextMargins.Bottom = 3.000000000000000000
        Appearance.SummaryLayout.Font.Charset = DEFAULT_CHARSET
        Appearance.SummaryLayout.Font.Color = clBlack
        Appearance.SummaryLayout.Font.Height = -12
        Appearance.SummaryLayout.Font.Name = 'Segoe UI'
        Appearance.SummaryLayout.Font.Style = []
        Appearance.SummaryLayout.TextMargins.Left = 3.000000000000000000
        Appearance.SummaryLayout.TextMargins.Top = 3.000000000000000000
        Appearance.SummaryLayout.TextMargins.Right = 3.000000000000000000
        Appearance.SummaryLayout.TextMargins.Bottom = 3.000000000000000000
        Header = 'ID'
        Width = 1129.000000000000000000
      end>
    FilterActions = <>
    FilterAppearance.Font.Charset = DEFAULT_CHARSET
    FilterAppearance.Font.Color = clBlack
    FilterAppearance.Font.Height = -12
    FilterAppearance.Font.Name = 'Segoe UI'
    FilterAppearance.Font.Style = []
    SortIndicatorAppearance.IndexFont.Charset = DEFAULT_CHARSET
    SortIndicatorAppearance.IndexFont.Color = -1
    SortIndicatorAppearance.IndexFont.Height = -11
    SortIndicatorAppearance.IndexFont.Name = 'Segoe UI'
    SortIndicatorAppearance.IndexFont.Style = []
    Options.Column.Stretching.Enabled = True
    RowCount = 1
    ExplicitTop = 94
  end
  object TMSFNCDataGridDatabaseAdapter1: TTMSFNCDataGridDatabaseAdapter
    Left = 464
    Top = 440
    Width = 26
    Height = 26
    Visible = True
    Columns = <>
    DataSource = DataSource1
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    FetchOptions.AssignedValues = [evMode, evCursorKind]
    FetchOptions.Mode = fmAll
    FetchOptions.CursorKind = ckForwardOnly
    LoginPrompt = False
    Left = 464
    Top = 270
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from departments')
    Left = 464
    Top = 326
    object FDQuery1Id: TIntegerField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '000000'
    end
    object FDQuery1Department: TWideStringField
      FieldName = 'Department'
      Origin = 'Department'
      Size = 40
    end
    object FDQuery1Description: TWideStringField
      FieldName = 'Description'
      Origin = 'Description'
      Size = 40
    end
    object FDQuery1Number: TIntegerField
      FieldName = 'Number'
      Origin = 'Number'
    end
    object FDQuery1RegistrationDate: TWideStringField
      FieldName = 'RegistrationDate'
      Origin = 'RegistrationDate'
      Size = 10
    end
    object FDQuery1LimitValue: TFloatField
      FieldName = 'LimitValue'
      Origin = 'LimitValue'
    end
    object FDQuery1Status: TIntegerField
      FieldName = 'Status'
      Origin = 'Status'
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 464
    Top = 382
  end
end
