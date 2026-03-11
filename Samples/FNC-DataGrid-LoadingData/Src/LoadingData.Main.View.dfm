object LoadingDataMainView: TLoadingDataMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC DataGrid - Loading Data from Multiple Sources'
  ClientHeight = 253
  ClientWidth = 450
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
    Width = 450
    Height = 253
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitHeight = 198
    object btnManualData: TButton
      Left = 51
      Top = 49
      Width = 329
      Height = 25
      Caption = 'Loading manual data'
      TabOrder = 0
      OnClick = btnManualDataClick
    end
    object btnExcelData: TButton
      Left = 51
      Top = 111
      Width = 329
      Height = 25
      Caption = 'Loading Excel data (XLS)'
      TabOrder = 2
      OnClick = btnExcelDataClick
    end
    object btnCSVData: TButton
      Left = 51
      Top = 80
      Width = 329
      Height = 25
      Caption = 'Loading CSV data'
      TabOrder = 1
      OnClick = btnCSVDataClick
    end
  end
end
