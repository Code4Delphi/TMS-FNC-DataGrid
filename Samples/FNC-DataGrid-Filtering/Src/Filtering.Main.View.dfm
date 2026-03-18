object FilteringMainView: TFilteringMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC DataGrid - Filtering'
  ClientHeight = 648
  ClientWidth = 1513
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 1513
    Height = 121
    Align = alTop
    TabOrder = 0
    ExplicitTop = -6
    object gBoxConfigs: TGroupBox
      Left = 201
      Top = 1
      Width = 200
      Height = 119
      Align = alLeft
      Caption = ' Configs Filters '
      TabOrder = 0
      ExplicitLeft = 204
      ExplicitTop = -4
      ExplicitHeight = 111
      object ckFilter: TCheckBox
        Left = 12
        Top = 20
        Width = 97
        Height = 17
        Caption = 'Filter'
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = ckFilterClick
      end
      object ckAdvancedFilter: TCheckBox
        Left = 12
        Top = 96
        Width = 107
        Height = 17
        Caption = 'Advanced Filter'
        TabOrder = 1
        OnClick = ckFilterClick
      end
      object ckShowControlButton: TCheckBox
        Left = 30
        Top = 41
        Width = 136
        Height = 17
        Caption = 'Show control button'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = ckFilterClick
      end
      object ckShowControlEditor: TCheckBox
        Left = 30
        Top = 60
        Width = 134
        Height = 17
        Caption = 'Show Control Editor'
        TabOrder = 3
        OnClick = ckFilterClick
      end
    end
    object btnClearFilter: TButton
      Left = 966
      Top = 38
      Width = 177
      Height = 25
      Caption = 'Clear Filter'
      TabOrder = 1
      OnClick = btnClearFilterClick
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 200
      Height = 119
      Align = alLeft
      Caption = ' Configs Grid '
      TabOrder = 2
      ExplicitLeft = 3
      ExplicitTop = -4
      ExplicitHeight = 111
      object ckStretching: TCheckBox
        Left = 12
        Top = 23
        Width = 98
        Height = 17
        Caption = 'Stretching'
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = ckFilterClick
      end
      object CheckBox2: TCheckBox
        Left = 12
        Top = 46
        Width = 157
        Height = 17
        Caption = 'eee'
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 401
      Top = 1
      Width = 200
      Height = 119
      Align = alLeft
      Caption = ' Query '
      TabOrder = 3
      ExplicitLeft = 407
      ExplicitTop = -4
      ExplicitHeight = 111
      object btnClose: TButton
        Left = 9
        Top = 19
        Width = 183
        Height = 25
        Caption = 'Close'
        TabOrder = 0
        OnClick = btnCloseClick
      end
      object btnOpenQuery: TButton
        Left = 9
        Top = 47
        Width = 183
        Height = 25
        Caption = 'Open query'
        TabOrder = 1
        OnClick = btnOpenQueryClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 601
      Top = 1
      Width = 352
      Height = 119
      Align = alLeft
      Caption = 'GroupBox3'
      TabOrder = 4
      object Label1: TLabel
        Left = 12
        Top = 23
        Width = 181
        Height = 15
        Caption = 'Filter Department and Description '
      end
      object btnFilter: TButton
        Left = 257
        Top = 39
        Width = 78
        Height = 25
        Caption = 'Filter'
        TabOrder = 0
        OnClick = btnFilterClick
      end
      object edtFilter: TEdit
        Left = 6
        Top = 42
        Width = 245
        Height = 23
        TabOrder = 1
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 629
    Width = 1513
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
    ExplicitWidth = 1135
  end
  object TMSFNCDataGridDatabaseAdapter1: TTMSFNCDataGridDatabaseAdapter
    Left = 760
    Top = 336
    Width = 26
    Height = 26
    Visible = True
    Columns = <>
    DataSource = DataSource1
  end
  object TMSFNCDataGrid1: TTMSFNCDataGrid
    Left = 0
    Top = 121
    Width = 1513
    Height = 508
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 4
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
    Options.Filtering.Controls = []
    Options.Filtering.Enabled = True
    Options.Sorting.Enabled = True
    RowCount = 1
    ExplicitWidth = 1135
  end
  object TMSFNCDataGrid2: TTMSFNCDataGrid
    Left = 232
    Top = 223
    Width = 660
    Height = 400
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 5
    Visible = False
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
        Width = 70.000000000000000000
      end
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
        Header = 'Name'
        Width = 250.000000000000000000
      end
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
        Header = 'Joined'
        Width = 100.000000000000000000
      end
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
        Header = 'Status'
        Width = 100.000000000000000000
      end>
    FilterActions = <>
    FilterAppearance.Font.Charset = DEFAULT_CHARSET
    FilterAppearance.Font.Color = clBlack
    FilterAppearance.Font.Height = -12
    FilterAppearance.Font.Name = 'Segoe UI'
    FilterAppearance.Font.Style = []
    Options.Filtering.Enabled = True
    Options.Sorting.Enabled = True
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    FetchOptions.AssignedValues = [evMode, evCursorKind]
    FetchOptions.Mode = fmAll
    FetchOptions.CursorKind = ckForwardOnly
    LoginPrompt = False
    Left = 760
    Top = 158
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from departments')
    Left = 760
    Top = 214
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
    OnDataChange = DataSource1DataChange
    Left = 760
    Top = 270
  end
end
