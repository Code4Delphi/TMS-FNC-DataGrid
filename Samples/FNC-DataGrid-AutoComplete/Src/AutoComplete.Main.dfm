object AutoCompleteMain: TAutoCompleteMain
  Left = 0
  Top = 0
  Caption = 'TMS FNC DataGrid - AutoComplete'
  ClientHeight = 190
  ClientWidth = 588
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
    Width = 588
    Height = 190
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 24
    Padding.Top = 20
    Padding.Right = 24
    Padding.Bottom = 24
    TabOrder = 0
    ExplicitHeight = 191
    object btnNormal: TButton
      Left = 386
      Top = 72
      Width = 170
      Height = 42
      Caption = 'gactNormal'
      TabOrder = 2
      OnClick = btnNormalClick
    end
    object btnLookupList: TButton
      Left = 210
      Top = 72
      Width = 170
      Height = 42
      Caption = 'gactLookupList'
      TabOrder = 1
      OnClick = btnLookupListClick
    end
    object btnLookupListAutomatic: TButton
      Left = 34
      Top = 72
      Width = 170
      Height = 42
      Caption = 'gactLookupList Automatic'
      TabOrder = 0
      OnClick = btnLookupListAutomaticClick
    end
  end
end
