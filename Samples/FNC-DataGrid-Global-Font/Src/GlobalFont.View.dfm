object GlobalFontView: TGlobalFontView
  Left = 0
  Top = 0
  Cursor = crHandPoint
  ActiveControl = TMSFNCDataGrid1
  Caption = 'TMS FNC DataGrid - Global Font'
  ClientHeight = 671
  ClientWidth = 1292
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 652
    Width = 1292
    Height = 19
    Panels = <
      item
        Width = 500
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1292
    Height = 121
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 545
      Height = 121
      Align = alLeft
      Caption = ' Config '
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 32
        Width = 57
        Height = 15
        Caption = 'Font name'
      end
      object Label2: TLabel
        Left = 219
        Top = 32
        Width = 27
        Height = 15
        Caption = 'Scale'
      end
      object Label3: TLabel
        Left = 362
        Top = 32
        Width = 20
        Height = 15
        Caption = 'Size'
      end
      object ckBold: TCheckBox
        Left = 16
        Top = 78
        Width = 67
        Height = 17
        Cursor = crHandPoint
        Caption = 'Bold'
        TabOrder = 0
        OnClick = ckBoldClick
      end
      object cBoxFontName: TComboBox
        Left = 16
        Top = 49
        Width = 199
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 1
        Text = 'Arial'
        OnChange = cBoxFontNameChange
        Items.Strings = (
          'Arial'
          'Courier New'
          'Calibri')
      end
      object edtScale: TEdit
        Left = 218
        Top = 48
        Width = 121
        Height = 24
        NumbersOnly = True
        TabOrder = 2
        Text = '1'
        OnChange = edtScaleChange
      end
      object UpDown1: TUpDown
        Left = 339
        Top = 48
        Width = 16
        Height = 23
        Associate = edtScale
        Min = 1
        Position = 1
        TabOrder = 3
      end
      object edtSize: TEdit
        Left = 361
        Top = 48
        Width = 121
        Height = 24
        NumbersOnly = True
        TabOrder = 4
        Text = '0'
        OnChange = cBoxFontNameChange
      end
      object UpDown2: TUpDown
        Left = 482
        Top = 48
        Width = 16
        Height = 24
        Associate = edtSize
        TabOrder = 5
      end
    end
  end
  object TMSFNCDataGrid1: TTMSFNCDataGrid
    Left = 0
    Top = 121
    Width = 1292
    Height = 531
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 2
    ShowAcceleratorChar = False
    Footer.Bar.Buttons = <>
    Header.VisualGrouping.Layout.Font.Charset = DEFAULT_CHARSET
    Header.VisualGrouping.Layout.Font.Color = clWindowText
    Header.VisualGrouping.Layout.Font.Height = -12
    Header.VisualGrouping.Layout.Font.Name = 'Courier New'
    Header.VisualGrouping.Layout.Font.Style = []
    Header.Bar.Buttons = <>
    CellAppearance.FilterMatchLayout.Font.Charset = DEFAULT_CHARSET
    CellAppearance.FilterMatchLayout.Font.Color = clWindowText
    CellAppearance.FilterMatchLayout.Font.Height = -12
    CellAppearance.FilterMatchLayout.Font.Name = 'Courier New'
    CellAppearance.FilterMatchLayout.Font.Style = []
    CellAppearance.FilterInverseMatchLayout.Font.Charset = DEFAULT_CHARSET
    CellAppearance.FilterInverseMatchLayout.Font.Color = clWindowText
    CellAppearance.FilterInverseMatchLayout.Font.Height = -12
    CellAppearance.FilterInverseMatchLayout.Font.Name = 'Courier New'
    CellAppearance.FilterInverseMatchLayout.Font.Style = []
    CellAppearance.BandLayout.Font.Charset = DEFAULT_CHARSET
    CellAppearance.BandLayout.Font.Color = clBlack
    CellAppearance.BandLayout.Font.Height = -12
    CellAppearance.BandLayout.Font.Name = 'Courier New'
    CellAppearance.BandLayout.Font.Style = []
    CellAppearance.FixedLayout.Font.Charset = DEFAULT_CHARSET
    CellAppearance.FixedLayout.Font.Color = clBlack
    CellAppearance.FixedLayout.Font.Height = -12
    CellAppearance.FixedLayout.Font.Name = 'Courier New'
    CellAppearance.FixedLayout.Font.Style = []
    CellAppearance.FixedSelectedLayout.Font.Charset = DEFAULT_CHARSET
    CellAppearance.FixedSelectedLayout.Font.Color = clBlack
    CellAppearance.FixedSelectedLayout.Font.Height = -12
    CellAppearance.FixedSelectedLayout.Font.Name = 'Courier New'
    CellAppearance.FixedSelectedLayout.Font.Style = []
    CellAppearance.FocusedLayout.Font.Charset = DEFAULT_CHARSET
    CellAppearance.FocusedLayout.Font.Color = clBlack
    CellAppearance.FocusedLayout.Font.Height = -12
    CellAppearance.FocusedLayout.Font.Name = 'Courier New'
    CellAppearance.FocusedLayout.Font.Style = []
    CellAppearance.GroupLayout.Font.Charset = DEFAULT_CHARSET
    CellAppearance.GroupLayout.Font.Color = clBlack
    CellAppearance.GroupLayout.Font.Height = -12
    CellAppearance.GroupLayout.Font.Name = 'Courier New'
    CellAppearance.GroupLayout.Font.Style = []
    CellAppearance.NormalLayout.Font.Charset = DEFAULT_CHARSET
    CellAppearance.NormalLayout.Font.Color = clBlack
    CellAppearance.NormalLayout.Font.Height = -12
    CellAppearance.NormalLayout.Font.Name = 'Courier New'
    CellAppearance.NormalLayout.Font.Style = []
    CellAppearance.SelectedLayout.Font.Charset = DEFAULT_CHARSET
    CellAppearance.SelectedLayout.Font.Color = clBlack
    CellAppearance.SelectedLayout.Font.Height = -12
    CellAppearance.SelectedLayout.Font.Name = 'Courier New'
    CellAppearance.SelectedLayout.Font.Style = []
    CellAppearance.SummaryLayout.Font.Charset = DEFAULT_CHARSET
    CellAppearance.SummaryLayout.Font.Color = clBlack
    CellAppearance.SummaryLayout.Font.Height = -12
    CellAppearance.SummaryLayout.Font.Name = 'Courier New'
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
    Options.Editing.Enabled = False
    Options.Mouse.ColumnSizing = True
    Options.Mouse.FixedColumnSizing = True
    Options.Mouse.FixedRowSizing = True
    Options.Mouse.RowSizing = True
    Options.Selection.Mode = gsmCellRange
    ExplicitTop = 115
  end
end
