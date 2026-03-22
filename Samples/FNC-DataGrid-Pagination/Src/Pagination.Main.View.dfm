object PaginationMainView: TPaginationMainView
  Left = 0
  Top = 0
  ActiveControl = TMSFNCDataGrid1
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
    object gBoxConfigs: TGroupBox
      Left = 1
      Top = 1
      Width = 140
      Height = 129
      Align = alLeft
      Caption = ' Configs sorting '
      TabOrder = 0
      ExplicitTop = -4
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
      Left = 141
      Top = 1
      Width = 140
      Height = 129
      Align = alLeft
      Caption = ' Query '
      Padding.Left = 4
      Padding.Top = 2
      Padding.Right = 4
      TabOrder = 1
      ExplicitTop = -4
      object btnClose: TButton
        AlignWithMargins = True
        Left = 6
        Top = 47
        Width = 128
        Height = 25
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Align = alTop
        Caption = 'Close'
        TabOrder = 0
        OnClick = btnCloseClick
        ExplicitWidth = 118
      end
      object btnOpenQuery: TButton
        AlignWithMargins = True
        Left = 6
        Top = 19
        Width = 128
        Height = 25
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Align = alTop
        Caption = 'Open query'
        TabOrder = 1
        OnClick = btnOpenQueryClick
        ExplicitWidth = 118
      end
    end
    object GroupBox1: TGroupBox
      Left = 461
      Top = 1
      Width = 268
      Height = 129
      Align = alLeft
      Caption = ' Integrated controls in the footer '
      TabOrder = 2
      ExplicitLeft = 421
      object ckVisibleFooter: TCheckBox
        Left = 16
        Top = 20
        Width = 97
        Height = 17
        Caption = 'Visible footer'
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = ckPagingClick
      end
      object ckShowPageSelector: TCheckBox
        Left = 16
        Top = 44
        Width = 130
        Height = 17
        Caption = 'Show Page Selector'
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = ckPagingClick
      end
      object ckShowPageInfo: TCheckBox
        Left = 16
        Top = 67
        Width = 108
        Height = 16
        Caption = 'Show Page Info'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = ckPagingClick
      end
      object btnShowNavigationButtons: TCheckBox
        Left = 16
        Top = 89
        Width = 160
        Height = 16
        Caption = 'Show Navigation Buttons'
        Checked = True
        State = cbChecked
        TabOrder = 3
        OnClick = ckPagingClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 281
      Top = 1
      Width = 180
      Height = 129
      Align = alLeft
      Caption = ' Formats '
      TabOrder = 3
      OnExit = GroupBox3Exit
      ExplicitLeft = 278
      ExplicitTop = -4
      object Label1: TLabel
        Left = 16
        Top = 25
        Width = 91
        Height = 15
        Caption = 'Page Info Format'
      end
      object Label2: TLabel
        Left = 16
        Top = 73
        Width = 112
        Height = 15
        Caption = 'Page Selector Format'
      end
      object edtPageInfoFormat: TEdit
        Left = 16
        Top = 44
        Width = 149
        Height = 23
        TabOrder = 0
        Text = 'Page %d of %d'
      end
      object edtPageSelectorFormat: TEdit
        Left = 16
        Top = 90
        Width = 149
        Height = 23
        TabOrder = 1
        Text = 'Page %d'
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
    ExplicitLeft = -8
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
