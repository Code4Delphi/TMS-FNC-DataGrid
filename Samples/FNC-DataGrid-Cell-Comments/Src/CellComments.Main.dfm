object CellCommentsMain: TCellCommentsMain
  Left = 0
  Top = 0
  Cursor = crHandPoint
  ActiveControl = TMSFNCDataGrid1
  Caption = 'TMS FNC DataGrid - Cell Comments'
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
  object TMSFNCDataGrid1: TTMSFNCDataGrid
    Left = 0
    Top = 177
    Width = 1261
    Height = 475
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
    OnGetCellProperties = TMSFNCDataGrid1GetCellProperties
    Options.Filtering.Enabled = True
    Options.IO.HTML.ExportColors = False
    Options.Sorting.Enabled = True
    Options.Column.Stretching.Enabled = True
    Options.Selection.Mode = gsmSingleRow
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1261
    Height = 177
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 161
      Top = 0
      Width = 456
      Height = 177
      Align = alLeft
      Caption = ' Comments Customized '
      Padding.Left = 5
      Padding.Top = 2
      Padding.Right = 5
      TabOrder = 0
      DesignSize = (
        456
        177)
      object Label3: TLabel
        Left = 7
        Top = 63
        Width = 442
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Comment (Accepts HTML)'
        ExplicitLeft = 2
        ExplicitTop = 61
        ExplicitWidth = 293
      end
      object btnAddCommetCustomized: TButton
        Left = 377
        Top = 142
        Width = 75
        Height = 25
        Anchors = [akTop, akRight, akBottom]
        Caption = 'Add'
        TabOrder = 0
        OnClick = btnAddCommetCustomizedClick
      end
      object mmCommentCustomized: TMemo
        Left = 7
        Top = 81
        Width = 442
        Height = 56
        Align = alTop
        Lines.Strings = (
          'Test comment in Cell <br>'
          'Line 2 in <b>bold</b>')
        TabOrder = 1
      end
      object Panel2: TPanel
        Left = 7
        Top = 19
        Width = 442
        Height = 44
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object Label1: TLabel
          Left = 1
          Top = -3
          Width = 43
          Height = 15
          Caption = 'Column'
        end
        object Label2: TLabel
          Left = 96
          Top = -1
          Width = 23
          Height = 15
          Caption = 'Row'
        end
        object edtColumn: TEdit
          Left = 1
          Top = 15
          Width = 93
          Height = 23
          NumbersOnly = True
          TabOrder = 0
          Text = '3'
        end
        object edtRow: TEdit
          Left = 96
          Top = 15
          Width = 93
          Height = 23
          NumbersOnly = True
          TabOrder = 1
          Text = '5'
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 0
      Top = 0
      Width = 161
      Height = 177
      Align = alLeft
      Caption = ' Comments '
      TabOrder = 1
      object btnAdd: TButton
        Left = 16
        Top = 29
        Width = 129
        Height = 25
        Caption = 'Add commnet'
        TabOrder = 0
        OnClick = btnAddClick
      end
      object btnClearComments: TButton
        Left = 16
        Top = 77
        Width = 129
        Height = 25
        Caption = 'Clear comments'
        TabOrder = 1
        OnClick = btnClearCommentsClick
      end
    end
  end
end
