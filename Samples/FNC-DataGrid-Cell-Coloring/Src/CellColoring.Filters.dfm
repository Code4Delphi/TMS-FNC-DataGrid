object CellColoringFilters: TCellColoringFilters
  Left = 0
  Top = 0
  Cursor = crHandPoint
  Caption = 'TMS FNC DataGrid - Dynamic Cell Coloring With Filters'
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
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 1188
    Height = 97
    Align = alTop
    TabOrder = 0
    object GroupBox4: TGroupBox
      Left = 1
      Top = 1
      Width = 688
      Height = 95
      Align = alLeft
      Caption = ' Custom filter '
      TabOrder = 0
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
        ItemIndex = 1
        TabOrder = 0
        Text = 'Name'
        Items.Strings = (
          'Product code'
          'Name'
          'Group code'
          'Brand name'
          'Inventory'
          'Cost price'
          'Sale price'
          'Condition')
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
      object btnFilter: TButton
        Left = 498
        Top = 41
        Width = 66
        Height = 25
        Caption = 'Filter'
        TabOrder = 3
        OnClick = btnFilterClick
      end
      object btnClearFilter: TButton
        Left = 570
        Top = 41
        Width = 80
        Height = 25
        Caption = 'Clear Filter'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = btnClearFilterClick
      end
    end
  end
  object TMSFNCDataGrid1: TTMSFNCDataGrid
    Left = 0
    Top = 97
    Width = 1188
    Height = 612
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
    Options.Filtering.Enabled = True
    Options.Sorting.Enabled = True
    Options.Column.Stretching.Enabled = True
  end
end
