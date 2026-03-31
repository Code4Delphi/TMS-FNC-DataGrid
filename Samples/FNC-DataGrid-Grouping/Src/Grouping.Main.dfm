object GroupingMain: TGroupingMain
  Left = 0
  Top = 0
  Caption = 'TMS FNC DataGrid - Grouping'
  ClientHeight = 144
  ClientWidth = 467
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 467
    Height = 144
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 10
    Padding.Top = 30
    Padding.Right = 10
    TabOrder = 0
    ExplicitHeight = 148
    object btnGroupingBasic: TButton
      AlignWithMargins = True
      Left = 10
      Top = 30
      Width = 447
      Height = 39
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Align = alTop
      Caption = 'Grouping Basic'
      TabOrder = 0
      OnClick = btnGroupingBasicClick
    end
    object btnGroupingAdvanced: TButton
      AlignWithMargins = True
      Left = 10
      Top = 72
      Width = 447
      Height = 39
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Align = alTop
      Caption = 'Grouping Advanced'
      TabOrder = 1
      OnClick = btnGroupingAdvancedClick
    end
  end
end
