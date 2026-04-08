object CellColoringMain: TCellColoringMain
  Left = 0
  Top = 0
  Caption = 'TMS FNC DataGrid - Dynamic Cell Coloring'
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
    object btnEvents: TButton
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
      Caption = 'Cell Coloring With Events'
      TabOrder = 0
      OnClick = btnEventsClick
    end
    object btnFIlters: TButton
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
      Caption = 'Cell Coloring With Filters'
      TabOrder = 1
      OnClick = btnFIltersClick
    end
  end
end
