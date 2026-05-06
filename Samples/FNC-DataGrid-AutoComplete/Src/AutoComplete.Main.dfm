object AutoCompleteMain: TAutoCompleteMain
  Left = 0
  Top = 0
  Caption = 'TMS FNC DataGrid - AutoComplete'
  ClientHeight = 220
  ClientWidth = 420
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pnlContent: TPanel
    Left = 0
    Top = 0
    Width = 420
    Height = 220
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 24
    Padding.Top = 20
    Padding.Right = 24
    Padding.Bottom = 24
    TabOrder = 0
    object lblTitle: TLabel
      Left = 24
      Top = 20
      Width = 214
      Height = 25
      Caption = 'DataGrid AutoComplete'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDescription: TLabel
      Left = 24
      Top = 56
      Width = 317
      Height = 30
      Caption = 
        'Escolha um exemplo para ver cada modo de AutoComplete em um grid' +
        ' separado.'
      WordWrap = True
    end
    object btnNormal: TButton
      Left = 24
      Top = 112
      Width = 170
      Height = 42
      Caption = 'gactNormal'
      TabOrder = 0
      OnClick = btnNormalClick
    end
    object btnLookupList: TButton
      Left = 210
      Top = 112
      Width = 170
      Height = 42
      Caption = 'gactLookupList'
      TabOrder = 1
      OnClick = btnLookupListClick
    end
  end
end
