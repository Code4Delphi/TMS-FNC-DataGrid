object FilteringMainView: TFilteringMainView
  Left = 0
  Top = 0
  ActiveControl = TMSFNCDataGrid1
  Caption = 'TMS FNC DataGrid - Filtering'
  ClientHeight = 638
  ClientWidth = 1324
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object pnTop1: TPanel
    Left = 0
    Top = 0
    Width = 1324
    Height = 121
    Align = alTop
    TabOrder = 0
    ExplicitTop = -6
    object gBoxConfigs: TGroupBox
      Left = 137
      Top = 1
      Width = 176
      Height = 119
      Align = alLeft
      Caption = ' Configs Filters '
      TabOrder = 0
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
        Top = 89
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
      Left = 1186
      Top = 41
      Width = 127
      Height = 25
      Caption = 'Clear Filter'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnClearFilterClick
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 136
      Height = 119
      Align = alLeft
      Caption = ' Configs Grid '
      TabOrder = 2
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
    end
    object GroupBox2: TGroupBox
      Left = 313
      Top = 1
      Width = 130
      Height = 119
      Align = alLeft
      Caption = ' Query '
      Padding.Left = 4
      Padding.Top = 2
      Padding.Right = 4
      TabOrder = 3
      ExplicitLeft = 316
      ExplicitTop = -3
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
        ExplicitLeft = 17
        ExplicitTop = 71
        ExplicitWidth = 107
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
        ExplicitTop = 16
        ExplicitWidth = 107
      end
    end
    object GroupBox3: TGroupBox
      Left = 443
      Top = 1
      Width = 230
      Height = 119
      Align = alLeft
      Caption = ' Add filters via code '
      TabOrder = 4
      object Label1: TLabel
        Left = 9
        Top = 24
        Width = 181
        Height = 15
        Caption = 'Filter Department and Description '
      end
      object btnFilter: TButton
        Left = 154
        Top = 71
        Width = 66
        Height = 25
        Caption = 'Filter'
        TabOrder = 0
        OnClick = btnFilterClick
      end
      object edtFilter: TEdit
        Left = 9
        Top = 42
        Width = 210
        Height = 23
        TabOrder = 1
      end
    end
    object GroupBox4: TGroupBox
      Left = 673
      Top = 1
      Width = 507
      Height = 119
      Align = alLeft
      Caption = ' Custom filter '
      TabOrder = 5
      ExplicitLeft = 862
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
        Width = 54
        Height = 15
        Caption = 'Filter Type'
      end
      object Label4: TLabel
        Left = 282
        Top = 24
        Width = 48
        Height = 15
        Caption = 'Text filter'
      end
      object cBoxColumns: TComboBox
        Left = 11
        Top = 42
        Width = 150
        Height = 23
        Style = csDropDownList
        DropDownCount = 30
        TabOrder = 0
      end
      object cBoxFilterType: TComboBox
        Left = 163
        Top = 42
        Width = 116
        Height = 23
        Style = csDropDownList
        DropDownCount = 30
        ItemIndex = 2
        TabOrder = 1
        Text = 'Contains'
        Items.Strings = (
          'StartsWith'
          'EndsWith'
          'Contains'
          'NotContains'
          'Equal'
          'NotEqual'
          'Empty'
          'NotEmpty'
          'LargerThan'
          'SmallerThan'
          'LargerOrEqualThan'
          'SmallerOrEqualThan')
      end
      object edtTextCustomFilter: TEdit
        Left = 282
        Top = 42
        Width = 210
        Height = 23
        TabOrder = 2
      end
      object btnCustomFilter: TButton
        Left = 426
        Top = 71
        Width = 66
        Height = 25
        Caption = 'Filter'
        TabOrder = 3
        OnClick = btnCustomFilterClick
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 619
    Width = 1324
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
    ExplicitTop = 629
    ExplicitWidth = 1513
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
    Top = 200
    Width = 1324
    Height = 419
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
    ExplicitLeft = 1
    ExplicitTop = 194
  end
  object pnTop2: TPanel
    Left = 0
    Top = 121
    Width = 1324
    Height = 79
    Align = alTop
    Padding.Bottom = 4
    TabOrder = 5
    ExplicitLeft = 1
    ExplicitTop = 126
    object GroupBox5: TGroupBox
      Left = 1
      Top = 1
      Width = 442
      Height = 73
      Align = alLeft
      Caption = ' Text filter (only if advanced filter is checked) '
      TabOrder = 0
      ExplicitLeft = -63
      ExplicitTop = 0
      object Label5: TLabel
        Left = 12
        Top = 20
        Width = 21
        Height = 15
        Caption = 'Text'
      end
      object edtTextFilter: TEdit
        Left = 12
        Top = 36
        Width = 352
        Height = 23
        TabOrder = 0
        Text = '([Status] = 1)'
      end
      object btnTextFilter: TButton
        Left = 370
        Top = 36
        Width = 66
        Height = 25
        Caption = 'Text filter'
        TabOrder = 1
        OnClick = btnTextFilterClick
      end
    end
    object GroupBox6: TGroupBox
      Left = 443
      Top = 1
      Width = 230
      Height = 73
      Align = alLeft
      Caption = ' Filter Dialog '
      TabOrder = 1
      ExplicitTop = 0
      object btnShowFilterDialog: TButton
        Left = 6
        Top = 35
        Width = 213
        Height = 25
        Caption = ' Show Filter Dialog '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnShowFilterDialogClick
      end
    end
    object GroupBox7: TGroupBox
      Left = 673
      Top = 1
      Width = 230
      Height = 73
      Align = alLeft
      Caption = ' Filter expressions '
      TabOrder = 2
      ExplicitLeft = 668
      ExplicitTop = 0
      object btnAddExpression: TButton
        Left = 6
        Top = 35
        Width = 213
        Height = 25
        Caption = 'Add Expression'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnAddExpressionClick
      end
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    FetchOptions.AssignedValues = [evMode, evCursorKind]
    FetchOptions.Mode = fmAll
    FetchOptions.CursorKind = ckForwardOnly
    LoginPrompt = False
    Left = 768
    Top = 238
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from departments')
    Left = 768
    Top = 294
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
    Left = 768
    Top = 350
  end
end
