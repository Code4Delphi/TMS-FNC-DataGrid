object CalculationsMainView: TCalculationsMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC DataGrid - Calculations'
  ClientHeight = 326
  ClientWidth = 521
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 521
    Height = 326
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 8
    object btnCalculationsSumMonths: TButton
      Left = 86
      Top = 129
      Width = 329
      Height = 25
      Caption = 'Sum Months Calculations'
      TabOrder = 0
      OnClick = btnCalculationsSumMonthsClick
    end
    object btnCalculationsAggregateFunctionsView: TButton
      Left = 86
      Top = 160
      Width = 329
      Height = 25
      Caption = 'Aggregate Functions'
      TabOrder = 1
      OnClick = btnCalculationsAggregateFunctionsViewClick
    end
  end
end
