object PaginationProgrammatic: TPaginationProgrammatic
  Left = 0
  Top = 0
  Cursor = crHandPoint
  ActiveControl = TMSFNCDataGrid1
  Caption = 'TMS FNC DataGrid - Programmatic Navigation'
  ClientHeight = 647
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
    Height = 131
    Align = alTop
    TabOrder = 0
    object gBoxConfigs: TGroupBox
      Left = 1
      Top = 1
      Width = 140
      Height = 129
      Align = alLeft
      Caption = ' Configs sorting '
      TabOrder = 0
      object ckPaging: TCheckBox
        Left = 12
        Top = 20
        Width = 110
        Height = 17
        Cursor = crHandPoint
        Caption = 'Enabled Paging'
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = ckPagingClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 141
      Top = 1
      Width = 140
      Height = 129
      Align = alLeft
      Caption = ' Query '
      Padding.Left = 4
      Padding.Top = 2
      Padding.Right = 4
      TabOrder = 1
      object btnClose: TButton
        AlignWithMargins = True
        Left = 6
        Top = 47
        Width = 128
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
        Width = 128
        Height = 25
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Align = alTop
        Caption = 'Open query'
        TabOrder = 1
        OnClick = btnOpenQueryClick
        ExplicitLeft = 8
      end
    end
    object GroupBox1: TGroupBox
      Left = 461
      Top = 1
      Width = 268
      Height = 129
      Align = alLeft
      Caption = ' Programmatic Controls '
      TabOrder = 2
      ExplicitLeft = 467
      ExplicitTop = -4
      object Panel1: TPanel
        Left = 2
        Top = 17
        Width = 264
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object btnFirstPage: TSpeedButton
          Left = 0
          Top = 0
          Width = 30
          Height = 30
          Cursor = crHandPoint
          Align = alLeft
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
            6666666666666666666666660000666666666666666666666666666666666666
            0000666666666666666666666666666666666666000066FFF6666666666FF666
            FFF6666666666FF600006844F66666666F44F66888F66666666F88F600006844
            F666666F4444F66888F666666F8888F600006844F6666F444444F66888F6666F
            888888F600006844F66F44444444F66888F66F88888888F600006844F6444444
            4444F66888F68888888888F600006844F84444444444F66888F88888888888F6
            00006844F88844444444F66888F88888888888F600006844F66888444444F668
            88F66888888888F600006844F66668884444F66888F66668888888F600006844
            F66666688844F66888F66666688888F600006888666666666888666888666666
            6668886600006666666666666666666666666666666666660000666666666666
            6666666666666666666666660000666666666666666666666666666666666666
            0000}
          NumGlyphs = 2
          OnClick = btnFirstPageClick
          ExplicitHeight = 27
        end
        object btnPreviousPage: TSpeedButton
          Left = 30
          Top = 0
          Width = 30
          Height = 30
          Cursor = crHandPoint
          Align = alLeft
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
            6666666666666666666666660000666666666666666666666666666666666666
            00006666666666666666666666666666666666660000666666666666FF666666
            6666666666FF666600006666666666F44F66666666666666F88F666600006666
            6666F4444F666666666666F8888F66660000666666F444444F6666666666F888
            888F666600006666F44444444F66666666F88888888F6666000066F444444444
            4F666666F8888888888F666600006684444444444F66666688888888888F6666
            00006688844444444F66666688888888888F666600006666888444444F666666
            66888888888F666600006666668884444F66666666668888888F666600006666
            666688844F66666666666688888F666600006666666666888666666666666666
            8886666600006666666666666666666666666666666666660000666666666666
            6666666666666666666666660000666666666666666666666666666666666666
            0000}
          NumGlyphs = 2
          OnClick = btnPreviousPageClick
          ExplicitLeft = 36
          ExplicitHeight = 27
        end
        object btnNextPage: TSpeedButton
          Left = 204
          Top = 0
          Width = 30
          Height = 30
          Cursor = crHandPoint
          Align = alRight
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
            6666666666666666666666660000666666666666666666666666666666666666
            0000666666666666666666666666666666666666000066666FFF666666666666
            666FFF666666666600006666844FFF666666666666888FFF6666666600006666
            84444FFF666666666688888FFF666666000066668444444FFF66666666888888
            8FFF666600006666844444444FFF666666888888888FFF660000666684444444
            444F66666688888888888F660000666684444444444666666688888888888666
            0000666684444444486666666688888888886666000066668444444866666666
            6688888888666666000066668444486666666666668888886666666600006666
            8448666666666666668888666666666600006666886666666666666666886666
            6666666600006666666666666666666666666666666666660000666666666666
            6666666666666666666666660000666666666666666666666666666666666666
            0000}
          NumGlyphs = 2
          OnClick = btnNextPageClick
          ExplicitLeft = 214
          ExplicitHeight = 27
        end
        object btnLastPage: TSpeedButton
          Left = 234
          Top = 0
          Width = 30
          Height = 30
          Cursor = crHandPoint
          Align = alRight
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
            6666666666666666666666660000666666666666666666666666666666666666
            0000666666666666666666666666666666666666000066FFF666666666FFF666
            FFF666666666FFF600006844FFF666666844F66888FFF666666888F600006844
            44FFF6666844F6688888FFF6666888F6000068444444FFF66844F668888888FF
            F66888F600006844444444FFF844F66888888888FFF888F60000684444444444
            F844F6688888888888F888F600006844444444446844F66888888888886888F6
            00006844444444866844F66888888888866888F600006844444486666844F668
            88888886666888F600006844448666666844F66888888666666888F600006844
            866666666844F66888866666666888F600006886666666666888666886666666
            6668886600006666666666666666666666666666666666660000666666666666
            6666666666666666666666660000666666666666666666666666666666666666
            0000}
          NumGlyphs = 2
          OnClick = btnLastPageClick
          ExplicitLeft = 239
          ExplicitHeight = 27
        end
        object lbPageInfoFormat: TLabel
          Left = 60
          Top = 0
          Width = 144
          Height = 30
          Align = alClient
          Alignment = taCenter
          Caption = 'lbPageInfoFormat'
          Layout = tlCenter
          ExplicitLeft = 66
          ExplicitHeight = 27
        end
      end
    end
    object GroupBox3: TGroupBox
      Left = 281
      Top = 1
      Width = 180
      Height = 129
      Align = alLeft
      Caption = ' Formats '
      TabOrder = 3
      OnExit = GroupBox3Exit
      object Label1: TLabel
        Left = 16
        Top = 25
        Width = 91
        Height = 15
        Caption = 'Page Info Format'
      end
      object edtPageInfoFormat: TEdit
        Left = 16
        Top = 44
        Width = 149
        Height = 23
        TabOrder = 0
        Text = 'Page %d of %d'
      end
    end
    object GroupBox4: TGroupBox
      Left = 729
      Top = 1
      Width = 432
      Height = 129
      Align = alLeft
      Caption = ' Logs '
      Padding.Left = 5
      Padding.Right = 5
      Padding.Bottom = 5
      TabOrder = 4
      ExplicitLeft = 733
      ExplicitTop = -4
      object mmLog: TMemo
        Left = 7
        Top = 17
        Width = 418
        Height = 105
        Align = alClient
        BorderStyle = bsNone
        Lines.Strings = (
          '')
        ScrollBars = ssVertical
        TabOrder = 0
        ExplicitLeft = 2
        ExplicitWidth = 428
        ExplicitHeight = 110
      end
    end
  end
  object TMSFNCDataGrid1: TTMSFNCDataGrid
    Left = 0
    Top = 131
    Width = 1188
    Height = 497
    Cursor = crHandPoint
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
    OnPageChanged = TMSFNCDataGrid1PageChanged
    RowCount = 1
    ExplicitTop = 129
  end
  object TMSFNCDataGridDatabaseAdapter1: TTMSFNCDataGridDatabaseAdapter
    Left = 552
    Top = 360
    Width = 26
    Height = 26
    Visible = True
    Columns = <>
    DataSource = DataSource1
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 628
    Width = 1188
    Height = 19
    Panels = <
      item
        Width = 500
      end
      item
        Width = 50
      end>
    ExplicitTop = 604
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    FetchOptions.AssignedValues = [evMode, evCursorKind]
    FetchOptions.Mode = fmAll
    FetchOptions.CursorKind = ckForwardOnly
    LoginPrompt = False
    Left = 552
    Top = 190
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from departments')
    Left = 552
    Top = 246
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
    Left = 552
    Top = 302
  end
end
