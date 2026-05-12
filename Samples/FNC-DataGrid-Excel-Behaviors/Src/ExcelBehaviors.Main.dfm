object ExcelBehaviorsMain: TExcelBehaviorsMain
  Left = 0
  Top = 0
  Cursor = crHandPoint
  ActiveControl = TMSFNCDataGrid1
  Caption = 'TMS FNC DataGrid - Excel Behaviors'
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
    Top = 129
    Width = 1261
    Height = 523
    Cursor = crHandPoint
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 1
    OnDragOver = TMSFNCDataGrid1DragOver
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
    CellAppearance.FocusedLayout.Fill.Color = 16750605
    CellAppearance.FocusedLayout.Font.Charset = DEFAULT_CHARSET
    CellAppearance.FocusedLayout.Font.Color = clBlack
    CellAppearance.FocusedLayout.Font.Height = -12
    CellAppearance.FocusedLayout.Font.Name = 'Segoe UI'
    CellAppearance.FocusedLayout.Font.Style = [fsBold]
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
    CellAppearance.SelectedLayout.Fill.Color = 16755772
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
    OnBeforeOpenInplaceEditor = TMSFNCDataGrid1BeforeOpenInplaceEditor
    OnDropFiles = TMSFNCDataGrid1DropFiles
    Options.Filtering.Enabled = True
    Options.Sorting.Enabled = True
    Options.Column.Stretching.Enabled = True
    ExplicitLeft = 8
    ExplicitTop = 131
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1261
    Height = 129
    ActivePage = TabSheet6
    Align = alTop
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Merge / Split'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1253
        Height = 99
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitHeight = 243
        object GroupBox3: TGroupBox
          Left = 0
          Top = 0
          Width = 270
          Height = 99
          Align = alLeft
          Caption = ' Merge Range with mouse click selection '
          TabOrder = 0
          ExplicitHeight = 243
          object Label1: TLabel
            AlignWithMargins = True
            Left = 9
            Top = 22
            Width = 252
            Height = 30
            Margins.Left = 7
            Margins.Top = 5
            Margins.Right = 7
            Align = alTop
            Caption = 'Use the mouse click in combination with the Ctrl or Shift keys.'
            WordWrap = True
            ExplicitWidth = 238
          end
          object btnRangeMouseMerge: TButton
            AlignWithMargins = True
            Left = 6
            Top = 58
            Width = 127
            Height = 22
            Cursor = crHandPoint
            Caption = 'Merge'
            TabOrder = 0
            WordWrap = True
            OnClick = btnRangeMouseMergeClick
          end
          object btnRangeMouseSplit: TButton
            AlignWithMargins = True
            Left = 136
            Top = 58
            Width = 127
            Height = 22
            Cursor = crHandPoint
            Caption = 'Split'
            TabOrder = 1
            WordWrap = True
            OnClick = btnRangeMouseSplitClick
          end
        end
        object GroupBox4: TGroupBox
          Left = 270
          Top = 0
          Width = 270
          Height = 99
          Align = alLeft
          Caption = ' Shortcuts '
          TabOrder = 1
          ExplicitHeight = 243
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
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = ckEnableShortcutsClick
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Clipboard Options'
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 1253
        Height = 99
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitLeft = 264
        ExplicitTop = 24
        ExplicitWidth = 185
        ExplicitHeight = 41
        object Label4: TLabel
          Left = 508
          Top = 32
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
          Height = 99
          Align = alLeft
          Caption = ' Config Clipboard Options '
          TabOrder = 0
          ExplicitLeft = 2
          ExplicitTop = -2
          ExplicitHeight = 91
          object Label3: TLabel
            Left = 16
            Top = 45
            Width = 66
            Height = 15
            Caption = 'Paste Action'
          end
          object ckAllowRowGrow: TCheckBox
            Left = 105
            Top = 22
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
            OnClick = ckEnableShortcutsClick
          end
          object ckAllowColumnGrow: TCheckBox
            Left = 228
            Top = 22
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
            OnClick = ckEnableShortcutsClick
          end
          object ckEnabled: TCheckBox
            Left = 16
            Top = 22
            Width = 67
            Height = 17
            Caption = 'Enabled'
            Checked = True
            State = cbChecked
            TabOrder = 2
            OnClick = ckEnableShortcutsClick
          end
          object cBoxPasteAction: TComboBox
            Left = 16
            Top = 62
            Width = 197
            Height = 23
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 3
            Text = 'Replace'
            OnChange = ckEnableShortcutsClick
            Items.Strings = (
              'Replace'
              'Insert')
          end
          object ckIgnoreReadOnly: TCheckBox
            Left = 371
            Top = 22
            Width = 111
            Height = 17
            Hint = 'Colar em c'#233'lulas somente leitura / Paste into read-only cells'
            Caption = 'IgnoreReadOnly'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            OnClick = ckEnableShortcutsClick
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Drop Files'
      ImageIndex = 2
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 1253
        Height = 99
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Label5: TLabel
          Left = 16
          Top = 36
          Width = 430
          Height = 15
          Caption = 
            'Drag and drop files into the DataGrid / Arraste e solte arquivos' +
            ' dentro do DataGrid'
        end
        object btnClearGrid: TButton
          Left = 16
          Top = 57
          Width = 89
          Height = 25
          Caption = 'Clear Grid'
          TabOrder = 0
          OnClick = btnClearGridClick
        end
        object ckDropFilesEnabled: TCheckBox
          Left = 16
          Top = 13
          Width = 73
          Height = 17
          Caption = 'Enabled'
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = ckEnableShortcutsClick
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Auto Complete'
      ImageIndex = 3
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 1253
        Height = 99
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object ckAutoCompleteCaseSensitive: TCheckBox
          Left = 12
          Top = 38
          Width = 109
          Height = 17
          Caption = 'Case sensitive'
          TabOrder = 0
          OnClick = ckEnableShortcutsClick
        end
        object ckAutoCompleteEnabled: TCheckBox
          Left = 12
          Top = 15
          Width = 73
          Height = 17
          Caption = 'Enabled'
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = ckEnableShortcutsClick
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Find / Replace'
      ImageIndex = 4
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 1253
        Height = 99
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitLeft = -3
        ExplicitTop = -2
        object btnShowFindDialogDataGrid: TButton
          AlignWithMargins = True
          Left = 11
          Top = 12
          Width = 205
          Height = 25
          Cursor = crHandPoint
          Caption = 'Show Find Dialog'
          TabOrder = 0
          OnClick = btnShowFindDialogDataGridClick
        end
        object btnShowReplaceDialogDataGrid: TButton
          AlignWithMargins = True
          Left = 222
          Top = 12
          Width = 205
          Height = 25
          Cursor = crHandPoint
          Caption = 'Show Replace Dialog'
          TabOrder = 1
          OnClick = btnShowReplaceDialogDataGridClick
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'AutoFill'
      ImageIndex = 5
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 1253
        Height = 99
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitTop = -2
        object lbInstructions: TLabel
          AlignWithMargins = True
          Left = 817
          Top = 3
          Width = 433
          Height = 93
          Align = alRight
          Caption = 
            'Tip: Select cells with seed values (rows 1-2), then drag the fil' +
            'l handle (small square at selection corner) to auto-fill. Try di' +
            'fferent columns for various patterns.'#13#10#13#10'Dica: selecione c'#233'lulas' +
            ' com valores iniciais (linhas 1'#8211'2) e, em seguida, arraste a al'#231'a' +
            ' de preenchimento (pequeno quadrado no canto da sele'#231#227'o) para pr' +
            'eencher automaticamente. Experimente diferentes colunas para div' +
            'ersos padr'#245'es.'
          WordWrap = True
          ExplicitHeight = 90
        end
        object ckAutoFillEnabled: TCheckBox
          Left = 20
          Top = 23
          Width = 73
          Height = 17
          Caption = 'Enabled'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = ckEnableShortcutsClick
        end
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'TabSheet7'
      ImageIndex = 6
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 1253
        Height = 99
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
      end
    end
  end
end
