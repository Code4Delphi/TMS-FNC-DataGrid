object PaginationMain: TPaginationMain
  Left = 0
  Top = 0
  Caption = 'TMS FNC DataGrid - Pagination'
  ClientHeight = 148
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
    Height = 148
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 10
    Padding.Top = 30
    Padding.Right = 10
    TabOrder = 0
    object btnPaginationIntegratedFooter: TButton
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
      Caption = 'Pagination integrated into the footer'
      TabOrder = 0
      OnClick = btnPaginationIntegratedFooterClick
    end
    object btnPaginationProgrammatic: TButton
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
      Caption = 'Programmatic pagination'
      TabOrder = 1
      OnClick = btnPaginationProgrammaticClick
    end
  end
end
