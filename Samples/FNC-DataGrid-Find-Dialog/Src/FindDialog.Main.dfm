object FindDialogMain: TFindDialogMain
  Left = 0
  Top = 0
  Cursor = crHandPoint
  ActiveControl = TMSFNCDataGrid1
  Caption = 'TMS FNC DataGrid - Find Dialog'
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
      Left = 370
      Top = 0
      Width = 215
      Height = 145
      Align = alLeft
      Caption = ' Find '
      TabOrder = 0
      ExplicitLeft = 376
      ExplicitTop = -6
      object btnShowFindDialogDataGrid: TButton
        Left = 6
        Top = 25
        Width = 203
        Height = 25
        Cursor = crHandPoint
        Caption = 'Show Find Dialog (DataGrid)'
        TabOrder = 0
        OnClick = btnShowFindDialogDataGridClick
      end
    end
    object rdGroupUILanguage: TRadioGroup
      Left = 185
      Top = 0
      Width = 185
      Height = 145
      Cursor = crHandPoint
      Align = alLeft
      Caption = ' UILanguage '
      ItemIndex = 0
      Items.Strings = (
        'English'
        'Portuguese')
      TabOrder = 1
      ExplicitHeight = 113
    end
    object GroupBox2: TGroupBox
      Left = 0
      Top = 0
      Width = 185
      Height = 145
      Align = alLeft
      Caption = ' Configs '
      TabOrder = 2
      ExplicitLeft = -6
      ExplicitTop = -6
      object Label1: TLabel
        Left = 13
        Top = 90
        Width = 88
        Height = 15
        Caption = 'Find Text Default'
      end
      object ckAutoHistory: TCheckBox
        Left = 13
        Top = 19
        Width = 92
        Height = 17
        Cursor = crHandPoint
        Caption = 'Auto History'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object ckCaseSensitive: TCheckBox
        Left = 13
        Top = 67
        Width = 155
        Height = 17
        Cursor = crHandPoint
        Caption = 'Case Sensitive (Checked)'
        TabOrder = 1
      end
      object ckCaseSensitiveVisible: TCheckBox
        Left = 13
        Top = 42
        Width = 144
        Height = 17
        Cursor = crHandPoint
        Caption = 'Case Sensitive (Visible)'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object edtFindText: TEdit
        Left = 13
        Top = 106
        Width = 155
        Height = 23
        TabOrder = 3
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
    OnAfterShowFindDialog = TMSFNCDataGrid1AfterShowFindDialog
    OnBeforeShowFindDialog = TMSFNCDataGrid1BeforeShowFindDialog
    Options.Column.Stretching.Enabled = True
    ExplicitTop = 151
  end
end
