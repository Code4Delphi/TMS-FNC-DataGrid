object PaginationMainView: TPaginationMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC DataGrid - Pagination'
  ClientHeight = 623
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
    ExplicitTop = -6
    object gBoxConfigs: TGroupBox
      Left = 1
      Top = 1
      Width = 144
      Height = 129
      Align = alLeft
      Caption = ' Configs sorting '
      TabOrder = 0
      object ckPaging: TCheckBox
        Left = 12
        Top = 20
        Width = 110
        Height = 17
        Caption = 'Enabled Paging'
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = ckPagingClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 145
      Top = 1
      Width = 130
      Height = 129
      Align = alLeft
      Caption = ' Query '
      Padding.Left = 4
      Padding.Top = 2
      Padding.Right = 4
      TabOrder = 1
      object btnClose: TButton
        AlignWithMargins = True
        Left = 6
        Top = 47
        Width = 118
        Height = 25
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
        Width = 118
        Height = 25
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
  object TMSFNCDataGrid1: TTMSFNCDataGrid
    Left = 0
    Top = 131
    Width = 1188
    Height = 492
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
    RowCount = 1
    ExplicitLeft = 1
    ExplicitTop = 136
  end
  object TMSFNCDataGridDatabaseAdapter1: TTMSFNCDataGridDatabaseAdapter
    Left = 552
    Top = 360
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
    Left = 552
    Top = 190
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from departments')
    Left = 552
    Top = 246
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
    Left = 552
    Top = 302
  end
end
