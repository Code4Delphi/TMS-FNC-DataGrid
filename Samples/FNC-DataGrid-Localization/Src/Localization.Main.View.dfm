object LocalizationMainView: TLocalizationMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC DataGrid - Localization (Language)'
  ClientHeight = 169
  ClientWidth = 397
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  TextHeight = 15
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 397
    Height = 169
    Align = alClient
    Caption = ' Localization '
    Padding.Left = 10
    Padding.Top = 7
    Padding.Right = 10
    TabOrder = 0
    ExplicitHeight = 212
    object btnSetLocalizationToPortuguese: TButton
      AlignWithMargins = True
      Left = 12
      Top = 67
      Width = 373
      Height = 40
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Align = alTop
      Caption = 'Set Localization To Portuguese'
      TabOrder = 0
      OnClick = btnSetLocalizationToPortugueseClick
    end
    object btnSetLocalizationToEnglish: TButton
      AlignWithMargins = True
      Left = 12
      Top = 24
      Width = 373
      Height = 40
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Align = alTop
      Caption = 'Set Localization To English'
      TabOrder = 1
      OnClick = btnSetLocalizationToEnglishClick
    end
    object btnSetLocalizationToSpanish: TButton
      AlignWithMargins = True
      Left = 12
      Top = 110
      Width = 373
      Height = 40
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Align = alTop
      Caption = 'Set Localization To Spanish'
      TabOrder = 2
      OnClick = btnSetLocalizationToSpanishClick
    end
  end
end
