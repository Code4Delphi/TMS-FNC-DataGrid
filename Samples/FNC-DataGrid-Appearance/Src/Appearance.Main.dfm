object AppearanceMain: TAppearanceMain
  Left = 0
  Top = 0
  Caption = 'TMS FNC DataGrid - Appearance'
  ClientHeight = 193
  ClientWidth = 417
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
    Width = 417
    Height = 193
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = -8
    ExplicitWidth = 524
    ExplicitHeight = 189
    object btnLightMode: TButton
      Left = 72
      Top = 83
      Width = 129
      Height = 25
      Caption = ' Light Mode'
      TabOrder = 0
      OnClick = btnLightModeClick
    end
    object btnDarkMode: TButton
      Left = 207
      Top = 83
      Width = 129
      Height = 25
      Caption = 'Dark Mode'
      TabOrder = 1
      OnClick = btnDarkModeClick
    end
  end
end
