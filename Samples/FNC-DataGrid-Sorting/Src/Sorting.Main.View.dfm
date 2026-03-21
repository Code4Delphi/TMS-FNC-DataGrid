object SortingMainView: TSortingMainView
  Left = 0
  Top = 0
  ActiveControl = TMSFNCDataGrid1
  Caption = 'TMS FNC DataGrid - Sorting'
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
    Height = 131
    Align = alTop
    TabOrder = 0
    object gBoxConfigs: TGroupBox
      Left = 1
      Top = 1
      Width = 144
      Height = 129
      Align = alLeft
      Caption = ' Configs sorting '
      TabOrder = 0
      object ckSorting: TCheckBox
        Left = 12
        Top = 20
        Width = 106
        Height = 17
        Caption = 'Enabled sorting'
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = ckSortingClick
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
    object GroupBox4: TGroupBox
      Left = 515
      Top = 1
      Width = 294
      Height = 129
      Align = alLeft
      Caption = ' Custom sorting'
      TabOrder = 2
      ExplicitLeft = 275
      object Label2: TLabel
        Left = 11
        Top = 24
        Width = 43
        Height = 15
        Caption = 'Column'
      end
      object Label3: TLabel
        Left = 163
        Top = 24
        Width = 48
        Height = 15
        Caption = 'Direction'
      end
      object cBoxColumn: TComboBox
        Left = 11
        Top = 42
        Width = 150
        Height = 23
        Style = csDropDownList
        DropDownCount = 30
        TabOrder = 0
      end
      object cBoxDirection: TComboBox
        Left = 163
        Top = 42
        Width = 116
        Height = 23
        Style = csDropDownList
        DropDownCount = 30
        ItemIndex = 1
        TabOrder = 1
        Text = 'Ascending'
        Items.Strings = (
          'None'
          'Ascending'
          'Descending')
      end
      object btnSort: TButton
        Left = 215
        Top = 71
        Width = 66
        Height = 25
        Caption = 'Sort'
        TabOrder = 2
        OnClick = btnSortClick
      end
    end
    object GroupBox1: TGroupBox
      Left = 275
      Top = 1
      Width = 240
      Height = 129
      Margins.Right = 0
      Align = alLeft
      Caption = ' Sorting '
      Padding.Left = 4
      Padding.Top = 2
      Padding.Right = 4
      TabOrder = 3
      ExplicitLeft = 272
      ExplicitTop = 2
      object btnSortByDepartment: TButton
        AlignWithMargins = True
        Left = 6
        Top = 19
        Width = 228
        Height = 25
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Align = alTop
        Caption = 'Sort by Department column'
        TabOrder = 0
        OnClick = btnSortByDepartmentClick
      end
      object btnSortingMultiple: TButton
        AlignWithMargins = True
        Left = 6
        Top = 47
        Width = 228
        Height = 25
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Align = alTop
        Caption = 'Sorting with Multiple Columns'
        TabOrder = 1
        OnClick = btnSortingMultipleClick
      end
    end
  end
  object TMSFNCDataGrid1: TTMSFNCDataGrid
    Left = 0
    Top = 131
    Width = 1248
    Height = 481
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
    ColumnCount = 1
    Columns = <
      item
        Appearance.FilterMatchLayout.Font.Charset = DEFAULT_CHARSET
        Appearance.FilterMatchLayout.Font.Color = clWindowText
        Appearance.FilterMatchLayout.Font.Height = -12
        Appearance.FilterMatchLayout.Font.Name = 'Segoe UI'
        Appearance.FilterMatchLayout.Font.Style = []
        Appearance.FilterInverseMatchLayout.Font.Charset = DEFAULT_CHARSET
        Appearance.FilterInverseMatchLayout.Font.Color = clWindowText
        Appearance.FilterInverseMatchLayout.Font.Height = -12
        Appearance.FilterInverseMatchLayout.Font.Name = 'Segoe UI'
        Appearance.FilterInverseMatchLayout.Font.Style = []
        Appearance.BandLayout.Font.Charset = DEFAULT_CHARSET
        Appearance.BandLayout.Font.Color = clBlack
        Appearance.BandLayout.Font.Height = -12
        Appearance.BandLayout.Font.Name = 'Segoe UI'
        Appearance.BandLayout.Font.Style = []
        Appearance.FixedLayout.Font.Charset = DEFAULT_CHARSET
        Appearance.FixedLayout.Font.Color = clBlack
        Appearance.FixedLayout.Font.Height = -12
        Appearance.FixedLayout.Font.Name = 'Segoe UI'
        Appearance.FixedLayout.Font.Style = []
        Appearance.FixedSelectedLayout.Font.Charset = DEFAULT_CHARSET
        Appearance.FixedSelectedLayout.Font.Color = clBlack
        Appearance.FixedSelectedLayout.Font.Height = -12
        Appearance.FixedSelectedLayout.Font.Name = 'Segoe UI'
        Appearance.FixedSelectedLayout.Font.Style = []
        Appearance.FocusedLayout.Font.Charset = DEFAULT_CHARSET
        Appearance.FocusedLayout.Font.Color = clBlack
        Appearance.FocusedLayout.Font.Height = -12
        Appearance.FocusedLayout.Font.Name = 'Segoe UI'
        Appearance.FocusedLayout.Font.Style = []
        Appearance.GroupLayout.Font.Charset = DEFAULT_CHARSET
        Appearance.GroupLayout.Font.Color = clBlack
        Appearance.GroupLayout.Font.Height = -12
        Appearance.GroupLayout.Font.Name = 'Segoe UI'
        Appearance.GroupLayout.Font.Style = []
        Appearance.NormalLayout.Font.Charset = DEFAULT_CHARSET
        Appearance.NormalLayout.Font.Color = clBlack
        Appearance.NormalLayout.Font.Height = -12
        Appearance.NormalLayout.Font.Name = 'Segoe UI'
        Appearance.NormalLayout.Font.Style = []
        Appearance.SelectedLayout.Font.Charset = DEFAULT_CHARSET
        Appearance.SelectedLayout.Font.Color = clBlack
        Appearance.SelectedLayout.Font.Height = -12
        Appearance.SelectedLayout.Font.Name = 'Segoe UI'
        Appearance.SelectedLayout.Font.Style = []
        Appearance.SummaryLayout.Font.Charset = DEFAULT_CHARSET
        Appearance.SummaryLayout.Font.Color = clBlack
        Appearance.SummaryLayout.Font.Height = -12
        Appearance.SummaryLayout.Font.Name = 'Segoe UI'
        Appearance.SummaryLayout.Font.Style = []
        Header = 'ID'
        Width = 1129.000000000000000000
      end>
    FilterActions = <>
    FilterAppearance.Font.Charset = DEFAULT_CHARSET
    FilterAppearance.Font.Color = clBlack
    FilterAppearance.Font.Height = -12
    FilterAppearance.Font.Name = 'Segoe UI'
    FilterAppearance.Font.Style = []
    OnCustomCompare = TMSFNCDataGrid1CustomCompare
    Options.Column.Stretching.Enabled = True
    RowCount = 1
    ExplicitLeft = 1
    ExplicitTop = 136
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
