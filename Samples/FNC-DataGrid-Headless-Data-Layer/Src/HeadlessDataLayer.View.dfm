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
      Width = 153
      Height = 193
      Align = alLeft
      Caption = ' Carregamento '
      TabOrder = 0
      object btnLoadCSV: TButton
        Left = 12
        Top = 21
        Width = 128
        Height = 25
        Caption = 'Carregar CSV'
        TabOrder = 0
        OnClick = btnLoadCSVClick
      end
      object btnManualData: TButton
        Left = 12
        Top = 52
        Width = 128
        Height = 25
        Caption = 'Dados manuais'
        TabOrder = 1
        OnClick = btnManualDataClick
      end
    end
    object gBoxProcess: TGroupBox
      Left = 792
      Top = 0
      Width = 513
      Height = 169
      Caption = ' Processamento headless '
      TabOrder = 1
      object btnSort: TButton
        Left = 176
        Top = 32
        Width = 145
        Height = 33
        Caption = 'Ordenar'
        TabOrder = 0
        OnClick = btnSortClick
      end
      object btnGroup: TButton
        Left = 336
        Top = 32
        Width = 145
        Height = 33
        Caption = 'Agrupar / sumarizar'
        TabOrder = 1
        OnClick = btnGroupClick
      end
      object btnTypedValues: TButton
        Left = 16
        Top = 88
        Width = 145
        Height = 33
        Caption = 'Valores tipados'
        TabOrder = 2
        OnClick = btnTypedValuesClick
      end
      object btnExport: TButton
        Left = 176
        Top = 88
        Width = 145
        Height = 33
        Caption = 'Exportar CSV'
        TabOrder = 3
        OnClick = btnExportClick
      end
      object btnCompleteFlow: TButton
        Left = 336
        Top = 88
        Width = 145
        Height = 33
        Caption = 'Fluxo completo'
        TabOrder = 4
        OnClick = btnCompleteFlowClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 153
      Top = 0
      Width = 230
      Height = 193
      Align = alLeft
      Caption = ' Add filters '
      TabOrder = 2
      object Label1: TLabel
        Left = 12
        Top = 97
        Width = 187
        Height = 15
        Caption = 'Filter by Name and Condition fields'
      end
      object btnFilter: TButton
        Left = 109
        Top = 144
        Width = 111
        Height = 25
        Caption = 'btnFilter'
        TabOrder = 0
        OnClick = btnFilterClick
      end
      object edtFilter: TEdit
        Left = 12
        Top = 115
        Width = 208
        Height = 23
        TabOrder = 1
      end
      object btnFilterCondition: TButton
        Left = 6
        Top = 36
        Width = 214
        Height = 25
        Caption = 'Filter '#39'Used'#39' from '#39'Condition'#39' field'
        TabOrder = 2
        OnClick = btnFilterConditionClick
      end
    end
    object GroupBox1: TGroupBox
      Left = 383
      Top = 0
      Width = 282
      Height = 193
      Align = alLeft
      Caption = ' Order '
      TabOrder = 3
      object btnOrderByInventory: TButton
        Left = 6
        Top = 36
        Width = 265
        Height = 25
        Caption = 'Order by Inventory (asc)'
        TabOrder = 0
        OnClick = btnOrderByInventoryClick
      end
      object Button1: TButton
        Left = 6
        Top = 66
        Width = 265
        Height = 25
        Caption = 'Order by Inventory (asc) and Condition (desc)'
        TabOrder = 1
        OnClick = Button1Click
      end
    end
  end
end
