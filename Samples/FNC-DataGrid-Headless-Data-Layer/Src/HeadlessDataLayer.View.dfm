object HeadlessDataLayerView: THeadlessDataLayerView
  Left = 0
  Top = 0
  Cursor = crHandPoint
  Caption = 
    'TMS FNC DataGrid - Headless-Data-Layer / Camada de Dados sem Int' +
    'erface Visual'
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
  OnDestroy = FormDestroy
  TextHeight = 15
  object lBoxLog: TListBox
    Left = 0
    Top = 193
    Width = 1292
    Height = 459
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Consolas'
    Font.Style = []
    ItemHeight = 14
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 194
  end
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
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 1292
    Height = 193
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object gBoxLoad: TGroupBox
      Left = 0
      Top = 0
      Width = 193
      Height = 193
      Align = alLeft
      Caption = ' Load '
      TabOrder = 0
      object btnLoadCSV: TButton
        AlignWithMargins = True
        Left = 5
        Top = 56
        Width = 183
        Height = 30
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Carregar CSV'
        TabOrder = 0
        OnClick = btnLoadCSVClick
        ExplicitWidth = 127
      end
      object btnManualData: TButton
        AlignWithMargins = True
        Left = 5
        Top = 20
        Width = 183
        Height = 30
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Manual data'
        TabOrder = 1
        OnClick = btnManualDataClick
        ExplicitWidth = 127
      end
    end
    object GroupBox3: TGroupBox
      Left = 193
      Top = 0
      Width = 256
      Height = 193
      Align = alLeft
      Caption = ' Add filters '
      TabOrder = 1
      ExplicitLeft = 137
      DesignSize = (
        256
        193)
      object Label1: TLabel
        Left = 5
        Top = 59
        Width = 187
        Height = 15
        Caption = 'Filter by Name and Condition fields'
      end
      object btnFilter: TButton
        Left = 141
        Top = 106
        Width = 110
        Height = 30
        Cursor = crHandPoint
        Anchors = [akTop, akRight]
        Caption = 'Filter'
        TabOrder = 0
        OnClick = btnFilterClick
        ExplicitLeft = 101
      end
      object edtFilter: TEdit
        Left = 5
        Top = 77
        Width = 246
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ExplicitWidth = 206
      end
      object btnFilterCondition: TButton
        AlignWithMargins = True
        Left = 5
        Top = 20
        Width = 246
        Height = 30
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Filter '#39'Used'#39' from '#39'Condition'#39' field'
        TabOrder = 2
        OnClick = btnFilterConditionClick
        ExplicitWidth = 206
      end
      object btnRemoveFilter: TButton
        AlignWithMargins = True
        Left = 5
        Top = 158
        Width = 246
        Height = 30
        Cursor = crHandPoint
        Align = alBottom
        Caption = 'RemoveFilter'
        TabOrder = 3
        OnClick = btnRemoveFilterClick
        ExplicitWidth = 206
      end
    end
    object GroupBox1: TGroupBox
      Left = 449
      Top = 0
      Width = 320
      Height = 193
      Align = alLeft
      Caption = ' Order '
      TabOrder = 2
      ExplicitLeft = 393
      object btnOrderByInventoryAsc: TButton
        AlignWithMargins = True
        Left = 5
        Top = 20
        Width = 310
        Height = 30
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Order by Inventory (asc)'
        TabOrder = 0
        OnClick = btnOrderByInventoryAscClick
        ExplicitWidth = 265
      end
      object btnOrderByInventoryAndCondition: TButton
        AlignWithMargins = True
        Left = 5
        Top = 92
        Width = 310
        Height = 30
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Order by Inventory (asc) and Condition (desc)'
        TabOrder = 1
        OnClick = btnOrderByInventoryAndConditionClick
        ExplicitWidth = 265
      end
      object btnOrderByInventoryDesc: TButton
        AlignWithMargins = True
        Left = 5
        Top = 56
        Width = 310
        Height = 30
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Order by Inventory (desc)'
        TabOrder = 2
        OnClick = btnOrderByInventoryDescClick
        ExplicitWidth = 265
      end
    end
    object GroupBox2: TGroupBox
      Left = 769
      Top = 0
      Width = 152
      Height = 193
      Align = alLeft
      Caption = ' Export '
      TabOrder = 3
      ExplicitLeft = 713
      object btnExport: TButton
        AlignWithMargins = True
        Left = 5
        Top = 20
        Width = 142
        Height = 30
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Export CSV'
        TabOrder = 0
        OnClick = btnExportClick
        ExplicitWidth = 107
      end
    end
    object GroupBox4: TGroupBox
      Left = 921
      Top = 0
      Width = 185
      Height = 193
      Align = alLeft
      Caption = ' Group '
      TabOrder = 4
      ExplicitLeft = 866
      ExplicitTop = -6
      object btnGroup: TButton
        AlignWithMargins = True
        Left = 5
        Top = 20
        Width = 175
        Height = 30
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Agrupar / Calculate'
        TabOrder = 0
        OnClick = btnGroupClick
      end
      object btnUnGroup: TButton
        AlignWithMargins = True
        Left = 5
        Top = 56
        Width = 175
        Height = 30
        Cursor = crHandPoint
        Align = alTop
        Caption = 'UnGroup'
        TabOrder = 1
        OnClick = btnUnGroupClick
      end
    end
  end
end
