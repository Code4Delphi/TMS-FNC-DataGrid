object ClipboardOptionsMain: TClipboardOptionsMain
  Left = 0
  Top = 0
  Cursor = crHandPoint
  Caption = 'TMS FNC DataGrid - Clipboard Options'
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
    Height = 137
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label2: TLabel
      Left = 789
      Top = 54
      Width = 480
      Height = 30
      Caption = 
        'Dica: voc'#234' pode copiar e colar dados de uma planilha ou de qualq' +
        'uer outra fonte de dados.'#13#10'Tip: you can copy and paste data from' +
        ' a spreadsheet or any other data source.'
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 500
      Height = 137
      Align = alLeft
      Caption = ' Config Clipboard Options '
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 48
        Width = 66
        Height = 15
        Caption = 'Paste Action'
      end
      object ckAllowRowGrow: TCheckBox
        Left = 105
        Top = 25
        Width = 109
        Height = 17
        Hint = 
          'Add linhas se os dados colados excederem a altura da grade / add' +
          ' rows if pasted data exceeds grid height'
        Caption = 'AllowRowGrow'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 0
        OnClick = ckEnabledClick
      end
      object ckAllowColumnGrow: TCheckBox
        Left = 228
        Top = 25
        Width = 126
        Height = 17
        Hint = 
          'Add colunas se os dados colados excederem a largura da grade / a' +
          'dd columns if pasted data exceeds grid width'
        Caption = 'AllowColumnGrow'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 1
        OnClick = ckEnabledClick
      end
      object ckEnabled: TCheckBox
        Left = 16
        Top = 25
        Width = 67
        Height = 17
        Caption = 'Enabled'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = ckEnabledClick
      end
      object cBoxPasteAction: TComboBox
        Left = 16
        Top = 65
        Width = 197
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 3
        Text = 'Replace'
        OnChange = cBoxPasteActionChange
        Items.Strings = (
          'Replace'
          'Insert')
      end
      object ckIgnoreReadOnly: TCheckBox
        Left = 371
        Top = 25
        Width = 111
        Height = 17
        Hint = 'Colar em c'#233'lulas somente leitura / Paste into read-only cells'
        Caption = 'IgnoreReadOnly'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = ckEnabledClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 500
      Top = 0
      Width = 285
      Height = 137
      Align = alLeft
      Caption = ' Log '
      TabOrder = 1
      object mmLog: TMemo
        Left = 2
        Top = 17
        Width = 281
        Height = 118
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object TMSFNCDataGrid1: TTMSFNCDataGrid
    Left = 0
    Top = 137
    Width = 1292
    Height = 515
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
    OnAfterCopyToClipboard = TMSFNCDataGrid1AfterCopyToClipboard
    OnAfterCutToClipboard = TMSFNCDataGrid1AfterCutToClipboard
    OnAfterPasteFromClipboard = TMSFNCDataGrid1AfterPasteFromClipboard
    OnBeforeCopyToClipboard = TMSFNCDataGrid1BeforeCopyToClipboard
    OnBeforeCutToClipboard = TMSFNCDataGrid1BeforeCutToClipboard
    OnBeforePasteFromClipboard = TMSFNCDataGrid1BeforePasteFromClipboard
    Options.Filtering.Enabled = True
    Options.Sorting.Enabled = True
    Options.Column.Stretching.Enabled = True
    Options.Editing.Enabled = False
    Options.Selection.Mode = gsmCellRange
    ExplicitTop = 141
  end
end
