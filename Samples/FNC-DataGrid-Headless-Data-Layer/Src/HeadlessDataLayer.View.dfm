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
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
  end
end
