object PaginationMain: TPaginationMain
  Left = 0
  Top = 0
  Caption = 'TMS FNC DataGrid - Pagination'
  ClientHeight = 156
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
    Height = 156
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 10
    Padding.Top = 30
    Padding.Right = 10
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitWidth = 476
    ExplicitHeight = 232
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
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 470
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
      ExplicitLeft = 3
      ExplicitTop = 48
      ExplicitWidth = 470
    end
  end
end
