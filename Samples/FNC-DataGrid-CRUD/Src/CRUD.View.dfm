object CRUDView: TCRUDView
  Left = 0
  Top = 0
  ActiveControl = TMSFNCDataGrid1
  Caption = 'TMS FNC DataGrid - CRUD directly in the DataGrid'
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
  object TMSFNCDataGrid1: TTMSFNCDataGrid
    Left = 0
    Top = 129
    Width = 1248
    Height = 483
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
    OnCanDeleteRow = TMSFNCDataGrid1CanDeleteRow
    OnGetCellFormatting = TMSFNCDataGrid1GetCellFormatting
    Options.Keyboard.DeleteKeyHandling = gdkhDeleteRow
    Options.Keyboard.EndKeyHandling = genkhLastRow
    Options.Keyboard.HomeKeyHandling = ghkhFirstRow
    Options.Keyboard.InsertKeyHandling = gikhInsertRowAfter
    RowCount = 1
    ExplicitLeft = 1
    ExplicitTop = 134
  end
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 1248
    Height = 129
    Align = alTop
    TabOrder = 0
    object GroupBox2: TGroupBox
      Left = 1
      Top = 1
      Width = 130
      Height = 127
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
      end
    end
    object GroupBox4: TGroupBox
      Left = 131
      Top = 1
      Width = 175
      Height = 127
      Align = alLeft
      Caption = ' Configs '
      TabOrder = 1
      object ckEditing: TCheckBox
        Left = 16
        Top = 23
        Width = 145
        Height = 17
        Cursor = crHandPoint
        Caption = 'Editing'
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = ckEditingClick
      end
      object ckColumnSizing: TCheckBox
        Left = 16
        Top = 42
        Width = 145
        Height = 17
        Cursor = crHandPoint
        Caption = 'Column Sizing'
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = ckEditingClick
      end
      object ckFixedColumnSizing: TCheckBox
        Left = 16
        Top = 60
        Width = 145
        Height = 17
        Cursor = crHandPoint
        Caption = 'Fixed Column Sizing'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = ckEditingClick
      end
      object ckColumnDragging: TCheckBox
        Left = 16
        Top = 78
        Width = 145
        Height = 17
        Cursor = crHandPoint
        Caption = 'Column Dragging'
        Checked = True
        State = cbChecked
        TabOrder = 3
        OnClick = ckEditingClick
      end
      object ckStretching: TCheckBox
        Left = 16
        Top = 97
        Width = 145
        Height = 17
        Cursor = crHandPoint
        Caption = 'Stretching'
        TabOrder = 4
        OnClick = ckEditingClick
      end
    end
    object GroupBox1: TGroupBox
      Left = 306
      Top = 1
      Width = 399
      Height = 127
      Align = alLeft
      Caption = ' Shortcuts '
      TabOrder = 2
      ExplicitLeft = 312
      ExplicitTop = -4
      object Label1: TLabel
        Left = 6
        Top = 23
        Width = 50
        Height = 15
        Caption = 'Insert key'
      end
      object Label2: TLabel
        Left = 6
        Top = 71
        Width = 55
        Height = 15
        Caption = 'Delete Key'
      end
      object cBoxInsertKeyHandling: TComboBox
        Left = 6
        Top = 40
        Width = 323
        Height = 23
        Style = csDropDownList
        ItemIndex = 2
        TabOrder = 0
        Text = 'Inserts a row after the current row'
        OnChange = ckEditingClick
        Items.Strings = (
          'None'
          'Inserts a row before the current row'
          'Inserts a row after the current row')
      end
      object cBoxDeleteKeyHandling: TComboBox
        Left = 6
        Top = 88
        Width = 323
        Height = 23
        Style = csDropDownList
        ItemIndex = 2
        TabOrder = 1
        Text = 'Clears the content of all selected cells'
        OnChange = ckEditingClick
        Items.Strings = (
          'None'
          'Deletes the focused row'
          'Clears the content of all selected cells')
      end
    end
  end
  object TMSFNCDataGridDatabaseAdapter1: TTMSFNCDataGridDatabaseAdapter
    Left = 280
    Top = 392
    Width = 26
    Height = 26
    Visible = True
    Columns = <>
    DataSource = DataSource1
    ShowMemoFields = True
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Code4D\Cursos\TMS\TMS-FNC-DataGrid\Samples\FNC-DataG' +
        'rid-CRUD\Data\CRUD.db'
      'DriverID=SQLite')
    FetchOptions.AssignedValues = [evMode, evCursorKind]
    FetchOptions.Mode = fmAll
    FetchOptions.CursorKind = ckForwardOnly
    LoginPrompt = False
    Left = 280
    Top = 222
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from category')
    Left = 280
    Top = 278
    object FDQuery1Id: TFDAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object FDQuery1Name: TWideMemoField
      FieldName = 'Name'
      Origin = 'Name'
      Required = True
      BlobType = ftWideMemo
    end
    object FDQuery1Description: TWideMemoField
      FieldName = 'Description'
      Origin = 'Description'
      BlobType = ftWideMemo
    end
    object FDQuery1Active: TBooleanField
      FieldName = 'Active'
      Origin = 'Active'
      Required = True
    end
    object FDQuery1Limit: TIntegerField
      FieldName = 'Limit'
      Origin = '"Limit"'
    end
    object FDQuery1Value: TFloatField
      FieldName = 'Value'
      Origin = 'Value'
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 280
    Top = 334
  end
end
