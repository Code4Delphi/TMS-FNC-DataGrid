object ExcelBehaviorsMain: TExcelBehaviorsMain
  Left = 0
  Top = 0
  Cursor = crHandPoint
  ActiveControl = TMSFNCDataGrid1
  Caption = 'TMS FNC DataGrid - Excel Behaviors'
  ClientHeight = 691
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
  object TMSFNCDataGrid1: TTMSFNCDataGrid
    Left = 0
    Top = 153
    Width = 1261
    Height = 538
    Cursor = crHandPoint
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 0
    OnDragOver = TMSFNCDataGrid1DragOver
    OnKeyDown = TMSFNCDataGrid1KeyDown
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
    CellAppearance.FocusedLayout.Fill.Color = 16773087
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
    OnAfterCloseInplaceEditor = TMSFNCDataGrid1AfterCloseInplaceEditor
    OnBeforeOpenInplaceEditor = TMSFNCDataGrid1BeforeOpenInplaceEditor
    OnDropFiles = TMSFNCDataGrid1DropFiles
    OnGetCellFormatting = TMSFNCDataGrid1GetCellFormatting
    OnGetCellLayout = TMSFNCDataGrid1GetCellLayout
    Options.Filtering.Enabled = True
    Options.Sorting.Enabled = True
    Options.Column.Stretching.Enabled = True
    ExplicitHeight = 509
    object TMSFNCDataGridExcelIO1: TTMSFNCDataGridExcelIO
      Left = 503
      Top = 103
      Width = 26
      Height = 26
      Visible = True
      DataGrid = TMSFNCDataGrid1
      Options.ExportOverwriteMessage = 'File %s already exists'#13'Ok to overwrite ?'
      UseUnicode = False
      Version = '3.24'
    end
    object TMSFNCDataGridPDFIO1: TTMSFNCDataGridPDFIO
      Left = 705
      Top = 103
      Width = 26
      Height = 26
      Visible = True
      DataGrid = TMSFNCDataGrid1
      Options.DefaultFont.Name = 'Arial'
      Options.Header = 'TMS PDF Header'
      Options.Footer = 'TMS PDF Footer'
      Options.Margins.Left = 20.000000000000000000
      Options.Margins.Top = 50.000000000000000000
      Options.Margins.Right = 20.000000000000000000
      Options.Margins.Bottom = 50.000000000000000000
      Options.HeaderFont.Name = 'Arial'
      Options.FooterFont.Name = 'Arial'
      Options.HeaderMargins.Left = 20.000000000000000000
      Options.HeaderMargins.Top = 5.000000000000000000
      Options.HeaderMargins.Right = 20.000000000000000000
      Options.HeaderMargins.Bottom = 5.000000000000000000
      Options.FooterMargins.Left = 20.000000000000000000
      Options.FooterMargins.Top = 5.000000000000000000
      Options.FooterMargins.Right = 20.000000000000000000
      Options.FooterMargins.Bottom = 5.000000000000000000
      Options.PageNumberMargins.Left = 20.000000000000000000
      Options.PageNumberMargins.Top = 5.000000000000000000
      Options.PageNumberMargins.Right = 20.000000000000000000
      Options.PageNumberMargins.Bottom = 5.000000000000000000
      Options.PageNumberFormat = '%d'
      Options.PageNumberFont.Name = 'Arial'
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1261
    Height = 153
    ActivePage = tabMergeSplit
    Align = alTop
    TabOrder = 1
    TabStop = False
    object tabMergeSplit: TTabSheet
      Caption = 'Merge / Split'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1253
        Height = 123
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object GroupBox3: TGroupBox
          Left = 0
          Top = 0
          Width = 270
          Height = 123
          Align = alLeft
          Caption = ' Merge Range with mouse click selection '
          TabOrder = 0
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
            Left = 137
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
          Height = 123
          Align = alLeft
          Caption = ' Shortcuts '
          TabOrder = 1
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
        Height = 123
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
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
          Height = 123
          Align = alLeft
          Caption = ' Config Clipboard Options '
          TabOrder = 0
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
        Height = 123
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
        Height = 123
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
        Height = 123
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
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
        Height = 123
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object lbInstructions: TLabel
          AlignWithMargins = True
          Left = 120
          Top = 3
          Width = 1108
          Height = 60
          Caption = 
            'Tip: Select cells with seed values (rows 1-2), then drag the fil' +
            'l handle (small square at selection corner) to auto-fill. Try di' +
            'fferent columns for various patterns.'#13#10#13#10'Dica: selecione c'#233'lulas' +
            ' com valores iniciais (linhas 1'#8211'2) e, em seguida, arraste a al'#231'a' +
            ' de preenchimento (pequeno quadrado no canto da sele'#231#227'o) para pr' +
            'eencher automaticamente. Experimente diferentes colunas para div' +
            'ersos padr'#245'es.'
          WordWrap = True
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
    object TabSheet8: TTabSheet
      Caption = 'Comments'
      ImageIndex = 7
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1253
        Height = 123
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Label6: TLabel
          AlignWithMargins = True
          Left = 160
          Top = 4
          Width = 637
          Height = 45
          Caption = 
            'Tip: To add a comment, right-click on a cell and select '#8220'Add Com' +
            'ment'#8221#13#10#13#10'Dica: Para adicionar um coment'#225'rio, clique com o bot'#227'o ' +
            'direito do mouse sobre uma c'#233'lula e selecione "Add Comment"'
          WordWrap = True
        end
        object btnClearComments: TButton
          Left = 8
          Top = 18
          Width = 129
          Height = 25
          Caption = 'Clear comments'
          TabOrder = 0
          OnClick = btnClearCommentsClick
        end
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'Context Menu'
      ImageIndex = 6
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 1253
        Height = 123
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object ckPopupMenuForAll: TCheckBox
          Left = 16
          Top = 18
          Width = 169
          Height = 17
          Caption = 'Set PopupMenu for all cells'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = ckEnableShortcutsClick
        end
      end
    end
    object TabSheet9: TTabSheet
      Caption = 'Import / Export'
      ImageIndex = 8
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 1253
        Height = 123
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object GroupBox2: TGroupBox
          Left = 185
          Top = 0
          Width = 170
          Height = 123
          Align = alLeft
          Caption = ' CSV '
          TabOrder = 0
          DesignSize = (
            170
            123)
          object Label7: TLabel
            Left = 7
            Top = 20
            Width = 48
            Height = 15
            Caption = 'Delimiter'
          end
          object btnImportCSV: TButton
            Left = 7
            Top = 87
            Width = 75
            Height = 25
            Anchors = [akLeft, akBottom]
            Caption = 'Import'
            TabOrder = 0
            OnClick = btnImportCSVClick
          end
          object btnExportCSV: TButton
            Left = 88
            Top = 87
            Width = 75
            Height = 25
            Anchors = [akLeft, akBottom]
            Caption = 'Export'
            TabOrder = 1
            OnClick = btnExportCSVClick
          end
          object edtDelimiterCSV: TEdit
            Left = 7
            Top = 37
            Width = 157
            Height = 23
            MaxLength = 1
            TabOrder = 2
            Text = ';'
          end
          object ckQuoteEmptyCells: TCheckBox
            Left = 7
            Top = 66
            Width = 128
            Height = 17
            Caption = 'Quote Empty Cells'
            TabOrder = 3
          end
        end
        object GroupBox5: TGroupBox
          Left = 355
          Top = 0
          Width = 170
          Height = 123
          Align = alLeft
          Caption = ' Excel (xls) '
          TabOrder = 1
          DesignSize = (
            170
            123)
          object btnImportarExcel: TButton
            Left = 6
            Top = 23
            Width = 75
            Height = 25
            Anchors = [akLeft, akBottom]
            Caption = 'Import'
            TabOrder = 0
            OnClick = btnImportarExcelClick
          end
          object btnExportExcel: TButton
            Left = 88
            Top = 23
            Width = 75
            Height = 25
            Anchors = [akLeft, akBottom]
            Caption = 'Export'
            TabOrder = 1
            OnClick = btnExportExcelClick
          end
        end
        object GroupBox6: TGroupBox
          Left = 701
          Top = 0
          Width = 170
          Height = 123
          Align = alLeft
          Caption = ' Proprietary file format '
          TabOrder = 2
          DesignSize = (
            170
            123)
          object btnImportProprietary: TButton
            Left = 7
            Top = 23
            Width = 75
            Height = 25
            Anchors = [akLeft, akBottom]
            Caption = 'Import'
            TabOrder = 0
            OnClick = btnImportProprietaryClick
          end
          object btnExportProprietary: TButton
            Left = 88
            Top = 23
            Width = 75
            Height = 25
            Anchors = [akLeft, akBottom]
            Caption = 'Export'
            TabOrder = 1
            OnClick = btnExportProprietaryClick
          end
        end
        object GroupBox7: TGroupBox
          Left = 525
          Top = 0
          Width = 88
          Height = 123
          Align = alLeft
          Caption = ' HTML files '
          TabOrder = 3
          DesignSize = (
            88
            123)
          object btnExportHTML: TButton
            Left = 6
            Top = 23
            Width = 75
            Height = 25
            Anchors = [akLeft, akBottom]
            Caption = 'Export'
            TabOrder = 0
            OnClick = btnExportHTMLClick
          end
        end
        object GroupBox8: TGroupBox
          Left = 0
          Top = 0
          Width = 185
          Height = 123
          Align = alLeft
          Caption = ' Configs general '
          TabOrder = 4
          object btnClear2: TButton
            Left = 13
            Top = 50
            Width = 124
            Height = 25
            Caption = 'Clear Grid'
            TabOrder = 0
            OnClick = btnClearGridClick
          end
          object ckOpenAfterCreation: TCheckBox
            Left = 13
            Top = 27
            Width = 132
            Height = 17
            Caption = 'Open After Creation'
            TabOrder = 1
            OnClick = ckEnableShortcutsClick
          end
        end
        object GroupBox9: TGroupBox
          Left = 613
          Top = 0
          Width = 88
          Height = 123
          Align = alLeft
          Caption = ' PDF '
          TabOrder = 5
          DesignSize = (
            88
            123)
          object btnExportPDF: TButton
            Left = 7
            Top = 23
            Width = 75
            Height = 25
            Anchors = [akLeft, akBottom]
            Caption = 'Export'
            TabOrder = 0
            OnClick = btnExportPDFClick
          end
        end
      end
    end
    object tabKeyboard: TTabSheet
      Caption = 'Keyboard'
      ImageIndex = 9
      object pnKeyboard: TPanel
        Left = 0
        Top = 0
        Width = 1253
        Height = 123
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object gBoxTabKey: TGroupBox
          Left = 0
          Top = 0
          Width = 217
          Height = 123
          Align = alLeft
          Caption = ' Tab Key '
          TabOrder = 0
          object lbTabKeyHandling: TLabel
            Left = 8
            Top = 20
            Width = 71
            Height = 15
            Caption = 'Key Handling'
          end
          object lbTabKeyDirection: TLabel
            Left = 8
            Top = 66
            Width = 70
            Height = 15
            Caption = 'Key Direction'
          end
          object cBoxTabKeyHandling: TComboBox
            Left = 8
            Top = 36
            Width = 122
            Height = 23
            Hint = 'Define como a tecla Tab se comporta dentro do grid.'
            Style = csDropDownList
            ItemIndex = 1
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Text = 'Next Cell'
            OnChange = ckEnableShortcutsClick
            Items.Strings = (
              'Next Control'
              'Next Cell'
              'Mixed')
          end
          object cBoxTabKeyDirection: TComboBox
            Left = 8
            Top = 82
            Width = 122
            Height = 23
            Hint = 'Define se a tecla Tab avanca por coluna ou por linha.'
            Style = csDropDownList
            ItemIndex = 0
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            Text = 'Next Column Cell'
            OnChange = ckEnableShortcutsClick
            Items.Strings = (
              'Next Column Cell'
              'Next Row Cell')
          end
          object ckTabKeyDirectEdit: TCheckBox
            Left = 135
            Top = 39
            Width = 76
            Height = 17
            Hint = 
              'Inicia a edicao automaticamente quando a tecla Tab chega em uma ' +
              'celula.'
            Caption = 'Direct Edit'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 2
            OnClick = ckEnableShortcutsClick
          end
        end
        object gBoxEnterKey: TGroupBox
          Left = 217
          Top = 0
          Width = 212
          Height = 123
          Align = alLeft
          Caption = ' Enter Key '
          TabOrder = 1
          object lbEnterKeyHandling: TLabel
            Left = 8
            Top = 20
            Width = 71
            Height = 15
            Caption = 'Key Handling'
          end
          object cBoxEnterKeyHandling: TComboBox
            Left = 8
            Top = 36
            Width = 197
            Height = 23
            Hint = 'Define a acao executada ao pressionar Enter no grid.'
            Style = csDropDownList
            ItemIndex = 2
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Text = 'Next Row'
            OnChange = ckEnableShortcutsClick
            Items.Strings = (
              'None'
              'Next Column'
              'Next Row'
              'Next Column In Row'
              'Next Row In Column'
              'Next Column And Append'
              'Next Row And Append'
              'Next Row And Column Append'
              'Next Column And Row Append')
          end
          object ckEnterKeyDirectEdit: TCheckBox
            Left = 8
            Top = 72
            Width = 76
            Height = 17
            Hint = 
              'Inicia a edicao automaticamente quando Enter move para outra cel' +
              'ula.'
            Caption = 'Direct Edit'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 1
            OnClick = ckEnableShortcutsClick
          end
        end
        object gBoxArrowKeys: TGroupBox
          Left = 429
          Top = 0
          Width = 234
          Height = 123
          Align = alLeft
          Caption = ' Arrow Keys '
          TabOrder = 2
          object ckAppendRowOnArrowKeyDown: TCheckBox
            Left = 8
            Top = 24
            Width = 206
            Height = 17
            Hint = 
              'Adiciona uma nova linha ao navegar para baixo alem da ultima lin' +
              'ha.'
            Caption = 'Append Row On Arrow Key Down'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = ckEnableShortcutsClick
          end
          object ckAppendColumnOnArrowKeyRight: TCheckBox
            Left = 8
            Top = 50
            Width = 222
            Height = 17
            Hint = 
              'Adiciona uma nova coluna ao navegar para a direita alem da ultim' +
              'a coluna.'
            Caption = 'Append Column On Arrow Key Right'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = ckEnableShortcutsClick
          end
          object ckArrowKeyDirectEdit: TCheckBox
            Left = 8
            Top = 76
            Width = 86
            Height = 17
            Hint = 'Inicia a edicao automaticamente ao navegar com as setas.'
            Caption = 'Direct Edit'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 2
            OnClick = ckEnableShortcutsClick
          end
        end
        object gBoxOtherKeys: TGroupBox
          Left = 663
          Top = 0
          Width = 590
          Height = 123
          Align = alClient
          Caption = ' Other Keys '
          TabOrder = 3
          object lbDeleteKeyHandling: TLabel
            Left = 8
            Top = 20
            Width = 85
            Height = 15
            Caption = 'Delete Handling'
          end
          object lbInsertKeyHandling: TLabel
            Left = 148
            Top = 20
            Width = 81
            Height = 15
            Caption = 'Insert Handling'
          end
          object lbHomeKeyHandling: TLabel
            Left = 286
            Top = 20
            Width = 85
            Height = 15
            Caption = 'Home Handling'
          end
          object lbEndKeyHandling: TLabel
            Left = 402
            Top = 20
            Width = 72
            Height = 15
            Caption = 'End Handling'
          end
          object lbPageScrollSize: TLabel
            Left = 8
            Top = 88
            Width = 81
            Height = 15
            Caption = 'Page Scroll Size'
          end
          object cBoxDeleteKeyHandling: TComboBox
            Left = 8
            Top = 36
            Width = 133
            Height = 23
            Hint = 'Define o que a tecla Delete faz no grid.'
            Style = csDropDownList
            ItemIndex = 2
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Text = 'Clear Selected Cells'
            OnChange = ckEnableShortcutsClick
            Items.Strings = (
              'None'
              'Delete Row'
              'Clear Selected Cells')
          end
          object cBoxInsertKeyHandling: TComboBox
            Left = 148
            Top = 36
            Width = 133
            Height = 23
            Hint = 'Define o que a tecla Insert faz no grid.'
            Style = csDropDownList
            ItemIndex = 1
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            Text = 'Insert Row Before'
            OnChange = ckEnableShortcutsClick
            Items.Strings = (
              'None'
              'Insert Row Before'
              'Insert Row After')
          end
          object cBoxHomeKeyHandling: TComboBox
            Left = 286
            Top = 36
            Width = 112
            Height = 23
            Hint = 'Define para onde a tecla Home navega.'
            Style = csDropDownList
            ItemIndex = 2
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            Text = 'First Column'
            OnChange = ckEnableShortcutsClick
            Items.Strings = (
              'None'
              'First Row'
              'First Column')
          end
          object cBoxEndKeyHandling: TComboBox
            Left = 402
            Top = 36
            Width = 112
            Height = 23
            Hint = 'Define para onde a tecla End navega.'
            Style = csDropDownList
            ItemIndex = 2
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            Text = 'Last Column'
            OnChange = ckEnableShortcutsClick
            Items.Strings = (
              'None'
              'Last Row'
              'Last Column')
          end
          object edtPageScrollSize: TEdit
            Left = 92
            Top = 84
            Width = 41
            Height = 23
            Hint = 
              'Define a quantidade de linhas roladas por Page Up e Page Down. U' +
              'se 0 para uma pagina.'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            Text = '0'
            OnChange = ckEnableShortcutsClick
          end
          object ckFindShortcut: TCheckBox
            Left = 152
            Top = 86
            Width = 84
            Height = 17
            Hint = 'Habilita o atalho Ctrl+F para abrir a janela de pesquisa.'
            Caption = 'Find Ctrl+F'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 5
            OnClick = ckEnableShortcutsClick
          end
          object ckReplaceShortcut: TCheckBox
            Left = 241
            Top = 86
            Width = 106
            Height = 17
            Hint = 'Habilita o atalho Ctrl+H para abrir a janela de substituir.'
            Caption = 'Replace Ctrl+H'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 6
            OnClick = ckEnableShortcutsClick
          end
          object ckCellMergeShortcut: TCheckBox
            Left = 353
            Top = 86
            Width = 141
            Height = 17
            Hint = 'Habilita os atalhos para mesclar e dividir celulas.'
            Caption = 'Merge / Split Shortcut'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 7
            OnClick = ckEnableShortcutsClick
          end
        end
      end
    end
  end
  object PopupMenuCell: TPopupMenu
    Left = 333
    Top = 249
    object Merge1: TMenuItem
      Caption = 'Merge'
      OnClick = btnRangeMouseMergeClick
    end
    object Split1: TMenuItem
      Caption = 'Split'
      OnClick = btnRangeMouseSplitClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object AddComment1: TMenuItem
      Caption = 'Add Comment'
      OnClick = AddComment1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object GetHeaderAndValueOuther1: TMenuItem
      Caption = 'Get Header and Value'
      OnClick = GetHeaderAndValueOuther1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Item031: TMenuItem
      Caption = 'Item 03'
      object Subitem011: TMenuItem
        Caption = 'Subitem 01'
      end
      object Subitem021: TMenuItem
        Caption = 'Subitem 02'
      end
    end
  end
end
