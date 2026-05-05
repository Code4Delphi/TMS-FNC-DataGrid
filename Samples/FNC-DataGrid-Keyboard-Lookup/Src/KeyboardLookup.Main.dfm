object KeyboardLookupMain: TKeyboardLookupMain
  Left = 0
  Top = 0
  Cursor = crHandPoint
  Caption = 'TMS FNC DataGrid - Keyboard Lookup'
  ClientHeight = 671
  ClientWidth = 1261
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
    Width = 1261
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
    Width = 1261
    Height = 145
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 270
      Height = 145
      Align = alLeft
      Caption = ' Programmatic cell merging and splitting '
      TabOrder = 0
      object Button1: TButton
        AlignWithMargins = True
        Left = 5
        Top = 20
        Width = 260
        Height = 22
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Merge (2, 3, 3, 2)'
        TabOrder = 0
        WordWrap = True
        OnClick = Button1Click
      end
      object Button2: TButton
        AlignWithMargins = True
        Left = 5
        Top = 48
        Width = 260
        Height = 22
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Split (2, 3)'
        TabOrder = 1
        WordWrap = True
      end
    end
    object GroupBox2: TGroupBox
      Left = 270
      Top = 0
      Width = 270
      Height = 145
      Align = alLeft
      Caption = ' Merge Range with mouse click selection '
      TabOrder = 1
      object Label1: TLabel
        AlignWithMargins = True
        Left = 9
        Top = 27
        Width = 252
        Height = 30
        Margins.Left = 7
        Margins.Top = 10
        Margins.Right = 7
        Align = alTop
        Caption = 'Use the mouse click in combination with the Ctrl or Shift keys.'
        WordWrap = True
        ExplicitWidth = 238
      end
      object Button3: TButton
        AlignWithMargins = True
        Left = 5
        Top = 63
        Width = 260
        Height = 22
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Merge'
        TabOrder = 0
        WordWrap = True
      end
      object Button4: TButton
        AlignWithMargins = True
        Left = 5
        Top = 91
        Width = 260
        Height = 22
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Split'
        TabOrder = 1
        WordWrap = True
      end
    end
    object GroupBox3: TGroupBox
      Left = 540
      Top = 0
      Width = 270
      Height = 145
      Align = alLeft
      Caption = ' Shortcuts '
      TabOrder = 2
      object Label2: TLabel
        AlignWithMargins = True
        Left = 9
        Top = 27
        Width = 252
        Height = 30
        Margins.Left = 7
        Margins.Top = 10
        Margins.Right = 7
        Align = alTop
        Caption = 
          'CTRL + M: merge a selection of cells.'#13#10'CTRL + S: split a merged ' +
          'cell.'
        WordWrap = True
        ExplicitWidth = 195
      end
      object ckEnableShortcuts: TCheckBox
        Left = 11
        Top = 65
        Width = 121
        Height = 17
        Cursor = crHandPoint
        Caption = 'Enable shortcuts'
        TabOrder = 0
      end
    end
  end
  object TMSFNCDataGrid1: TTMSFNCDataGrid
    Left = 0
    Top = 145
    Width = 1261
    Height = 507
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 2
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
    Options.Editing.Enabled = False
  end
end
