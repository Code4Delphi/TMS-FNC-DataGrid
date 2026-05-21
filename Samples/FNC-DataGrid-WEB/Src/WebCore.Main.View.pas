unit WebCore.Main.View;

interface

uses
  System.SysUtils,
  System.Classes,
  System.UITypes,
  JS,
  Web,
  WEBLib.Graphics,
  WEBLib.Controls,
  WEBLib.Forms,
  WEBLib.Dialogs,
  VCL.TMSFNCTypes,
  VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes,
  System.Rtti,
  VCL.TMSFNCDataGridCell,
  VCL.TMSFNCDataGridData,
  VCL.TMSFNCDataGridBase,
  VCL.TMSFNCDataGridCore,
  VCL.TMSFNCDataGridRenderer,
  Vcl.Controls,
  {$IFNDEF WEBLIB}
  Vcl.Graphics,
  {$ENDIF}
  VCL.TMSFNCCustomControl,
  VCL.TMSFNCDataGrid,
  WEBLib.ExtCtrls;

type
  TMainView = class(TWebForm)
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    procedure WebFormCreate(Sender: TObject);
    procedure TMSFNCDataGrid1GetCellLayout(Sender: TObject; ACell: TTMSFNCDataGridCell);
  private
    procedure AddProduct(ARow: Integer; AProductCode: Integer; AGroupCode: Integer; ABrandCode: Integer; AInventory: Double; ACostPrice: Double; ASalePrice: Double; const ACondition: string);
    procedure ConfigAppearance;
    procedure ConfigDataGrid;
    procedure LoadProducts;
    procedure DoCollapseAllNodesClick(Sender: TObject);
    procedure DoExpandAllNodesClick(Sender: TObject);
    procedure DoUngroupClick(Sender: TObject);
  public

  end;

var
  MainView: TMainView;

implementation

{$R *.dfm}

//const
//  COL_PRODUCT_CODE = 0;
//  COL_NAME = 1;
//  COL_GROUP_CODE = 2;
//  COL_BRAND_NAME = 3;
//  COL_INVENTORY = 4;
//  COL_COST_PRICE = 5;
//  COL_SALE_PRICE = 6;
//  COL_CONDITION = 7;
//  PRODUCT_COLUMN_COUNT = 8;
//  PRODUCT_COUNT = 100;
//  COLOR_BACKGROUND = $0033322F;
//  COLOR_ALTERNATE_BACKGROUND = $004D4B46;
//  COLOR_HEADER = $004D4B45;
//  COLOR_GRID_LINE = $00635F5A;
//  COLOR_HEADER_TEXT = $00D6B38D;
//  COLOR_TEXT = $00F5F5F5;
//  COLOR_SELECTION = $00704A2D;
//  COLOR_SELECTION_BORDER = $00E89B32;

const
  COLOR_BACKGROUND = $0033322F;
  COLOR_BAND = $004D4B46;
  COLOR_HEADER = $004D4B45;
  COLOR_GROUP = $003B3A36;
  COLOR_SUMMARY = $0045413E;
  COLOR_GRID_LINE = $00635F5A;
  COLOR_HEADER_TEXT = $00D6B38D;
  COLOR_TEXT = $00F5F5F5;
  COLOR_MUTED_TEXT = $00C8D0D7;
  COLOR_SELECTION = $00704A2D;
  COLOR_SELECTION_BORDER = $00E89B32;

procedure TMainView.WebFormCreate(Sender: TObject);
begin
  Randomize;
  FormatSettings.DecimalSeparator := '.';
  Self.ConfigDataGrid;
  Self.LoadProducts;
  Self.ConfigAppearance;
end;

procedure TMainView.ConfigDataGrid;
var
  LGridButton: TTMSFNCDataGridButton;
begin
 TMSFNCDataGrid1.BeginUpdate;
  try
    //CONFIGURA O AGRUPAMENTO VISUAL DA GRID / CONFIGURES THE GRID VISUAL GROUPING
    TMSFNCDataGrid1.Options.Mouse.ColumnDragging := True;
    TMSFNCDataGrid1.Header.Visible := True;
    TMSFNCDataGrid1.Header.Bar.Visible := True;
    TMSFNCDataGrid1.Header.Bar.Size := 35;

    //ADICIONA BOTÕES ABAIXO DOS LINKS DE AGRUPAMENTO / ADDS BUTTONS BELOW THE GROUP LINKS
    LGridButton := TMSFNCDataGrid1.Header.Bar.Buttons.Add;
    LGridButton.OnClick := Self.DoCollapseAllNodesClick;
    LGridButton.Width := 100;
    LGridButton.Text := 'Collapse';

    LGridButton := TMSFNCDataGrid1.Header.Bar.Buttons.Add;
    LGridButton.OnClick := Self.DoExpandAllNodesClick;
    LGridButton.Width := 100;
    LGridButton.Text := 'Expand';

    LGridButton := TMSFNCDataGrid1.Header.Bar.Buttons.Add;
    LGridButton.OnClick := Self.DoUngroupClick;
    LGridButton.Width := 100;
    LGridButton.Text := 'Ungroup';

    //CONFIGURA O ADAPTADOR DO BANCO DE DADOS / CONFIGURES THE DATABASE ADAPTER
    //TMSFNCDataGridDatabaseAdapter1.ShowMemoFields := True;
    //TMSFNCDataGridDatabaseAdapter1.LoadMode := almAllRecords;

    //APLICA A APARÊNCIA DARK DA GRID / APPLIES THE GRID DARK APPEARANCE
    Self.ConfigAppearance;
  finally
    TMSFNCDataGrid1.EndUpdate;
  end;
end;

procedure TMainView.ConfigAppearance;
begin
  //ALTERA A APARÊNCIA GERAL DA GRID / ALTERS THE GENERAL GRID APPEARANCE
  TMSFNCDataGrid1.Color := COLOR_BACKGROUND;
  TMSFNCDataGrid1.Font.Name := 'Segoe UI';
  TMSFNCDataGrid1.Font.Size := 10;
  TMSFNCDataGrid1.Font.Color := COLOR_TEXT;
  TMSFNCDataGrid1.Options.Banding.Enabled := True;

  //ALTERA A APARÊNCIA DAS LINHAS NORMAIS / ALTERS THE APPEARANCE OF NORMAL ROWS
  TMSFNCDataGrid1.CellAppearance.NormalLayout.Fill.Kind := gfkSolid;
  TMSFNCDataGrid1.CellAppearance.NormalLayout.Fill.Color := COLOR_BACKGROUND;
  TMSFNCDataGrid1.CellAppearance.NormalLayout.Stroke.Color := COLOR_GRID_LINE;
  TMSFNCDataGrid1.CellAppearance.NormalLayout.Font.Name := 'Segoe UI';
  TMSFNCDataGrid1.CellAppearance.NormalLayout.Font.Size := 10;
  TMSFNCDataGrid1.CellAppearance.NormalLayout.Font.Color := COLOR_TEXT;

  //ALTERA A APARÊNCIA DAS LINHAS ALTERNADAS / ALTERS THE APPEARANCE OF BANDED ROWS
  TMSFNCDataGrid1.CellAppearance.BandLayout.Fill.Kind := gfkSolid;
  TMSFNCDataGrid1.CellAppearance.BandLayout.Fill.Color := COLOR_BAND;
  TMSFNCDataGrid1.CellAppearance.BandLayout.Stroke.Color := COLOR_GRID_LINE;
  TMSFNCDataGrid1.CellAppearance.BandLayout.Font.Name := 'Segoe UI';
  TMSFNCDataGrid1.CellAppearance.BandLayout.Font.Size := 10;
  TMSFNCDataGrid1.CellAppearance.BandLayout.Font.Color := COLOR_TEXT;

  //ALTERA A APARÊNCIA DAS LINHAS FIXAS / ALTERS THE APPEARANCE OF FIXED ROWS
  TMSFNCDataGrid1.CellAppearance.FixedLayout.Fill.Kind := gfkSolid;
  TMSFNCDataGrid1.CellAppearance.FixedLayout.Fill.Color := COLOR_HEADER;
  TMSFNCDataGrid1.CellAppearance.FixedLayout.Stroke.Color := COLOR_GRID_LINE;
  TMSFNCDataGrid1.CellAppearance.FixedLayout.Font.Name := 'Segoe UI';
  TMSFNCDataGrid1.CellAppearance.FixedLayout.Font.Size := 10;
  TMSFNCDataGrid1.CellAppearance.FixedLayout.Font.Color := COLOR_HEADER_TEXT;
  TMSFNCDataGrid1.CellAppearance.FixedLayout.Font.Style := [TFontStyle.fsBold];

  //ALTERA A APARÊNCIA DAS LINHAS DE GRUPO / ALTERS THE APPEARANCE OF GROUP ROWS
  TMSFNCDataGrid1.CellAppearance.GroupLayout.Fill.Kind := gfkSolid;
  TMSFNCDataGrid1.CellAppearance.GroupLayout.Fill.Color := COLOR_GROUP;
  TMSFNCDataGrid1.CellAppearance.GroupLayout.Stroke.Color := COLOR_GRID_LINE;
  TMSFNCDataGrid1.CellAppearance.GroupLayout.Font.Name := 'Segoe UI';
  TMSFNCDataGrid1.CellAppearance.GroupLayout.Font.Size := 10;
  TMSFNCDataGrid1.CellAppearance.GroupLayout.Font.Color := COLOR_TEXT;
  TMSFNCDataGrid1.CellAppearance.GroupLayout.Font.Style := [TFontStyle.fsBold];

  //ALTERA A APARÊNCIA DAS LINHAS DE RESUMO / ALTERS THE APPEARANCE OF SUMMARY ROWS
  TMSFNCDataGrid1.CellAppearance.SummaryLayout.Fill.Kind := gfkSolid;
  TMSFNCDataGrid1.CellAppearance.SummaryLayout.Fill.Color := COLOR_SUMMARY;
  TMSFNCDataGrid1.CellAppearance.SummaryLayout.Stroke.Color := COLOR_GRID_LINE;
  TMSFNCDataGrid1.CellAppearance.SummaryLayout.Font.Name := 'Segoe UI';
  TMSFNCDataGrid1.CellAppearance.SummaryLayout.Font.Size := 10;
  TMSFNCDataGrid1.CellAppearance.SummaryLayout.Font.Color := COLOR_HEADER_TEXT;
  TMSFNCDataGrid1.CellAppearance.SummaryLayout.Font.Style := [TFontStyle.fsBold];

  //ALTERA A APARÊNCIA DAS LINHAS SELECIONADAS / ALTERS THE APPEARANCE OF SELECTED ROWS
  TMSFNCDataGrid1.CellAppearance.SelectedLayout.Fill.Kind := gfkSolid;
  TMSFNCDataGrid1.CellAppearance.SelectedLayout.Fill.Color := COLOR_SELECTION;
  TMSFNCDataGrid1.CellAppearance.SelectedLayout.Stroke.Color := COLOR_SELECTION_BORDER;
  TMSFNCDataGrid1.CellAppearance.SelectedLayout.Font.Name := 'Segoe UI';
  TMSFNCDataGrid1.CellAppearance.SelectedLayout.Font.Size := 10;
  TMSFNCDataGrid1.CellAppearance.SelectedLayout.Font.Color := COLOR_HEADER_TEXT;

  //ALTERA A APARÊNCIA DA LINHA COM FOCO / ALTERS THE APPEARANCE OF THE FOCUSED ROW
  TMSFNCDataGrid1.CellAppearance.FocusedLayout.Fill.Kind := gfkSolid;
  TMSFNCDataGrid1.CellAppearance.FocusedLayout.Fill.Color := COLOR_SELECTION;
  TMSFNCDataGrid1.CellAppearance.FocusedLayout.Stroke.Color := COLOR_SELECTION_BORDER;
  TMSFNCDataGrid1.CellAppearance.FocusedLayout.Font.Name := 'Segoe UI';
  TMSFNCDataGrid1.CellAppearance.FocusedLayout.Font.Size := 10;
  TMSFNCDataGrid1.CellAppearance.FocusedLayout.Font.Color := COLOR_HEADER_TEXT;

  //ALTERA A APARÊNCIA DA ÁREA DE AGRUPAMENTO VISUAL / ALTERS THE APPEARANCE OF THE VISUAL GROUPING AREA
  TMSFNCDataGrid1.Header.VisualGrouping.LevelActiveIndicationFill.Kind := gfkSolid;
  TMSFNCDataGrid1.Header.VisualGrouping.LevelActiveIndicationFill.Color := COLOR_SELECTION;
  TMSFNCDataGrid1.Header.VisualGrouping.LevelActiveIndicationStroke.Color := COLOR_SELECTION_BORDER;
  TMSFNCDataGrid1.Header.VisualGrouping.LevelIndicationFill.Kind := gfkSolid;
  TMSFNCDataGrid1.Header.VisualGrouping.LevelIndicationFill.Color := COLOR_HEADER;
  TMSFNCDataGrid1.Header.VisualGrouping.LevelIndicationStroke.Color := COLOR_GRID_LINE;
  TMSFNCDataGrid1.Header.VisualGrouping.ConnectionLines := True;
  TMSFNCDataGrid1.Header.VisualGrouping.ConnectionStroke.Color := COLOR_GRID_LINE;
  TMSFNCDataGrid1.Header.VisualGrouping.Layout.TextAlign := gtaCenter;
  TMSFNCDataGrid1.Header.VisualGrouping.Layout.Fill.Kind := gfkSolid;
  TMSFNCDataGrid1.Header.VisualGrouping.Layout.Fill.Color := COLOR_HEADER;
  TMSFNCDataGrid1.Header.VisualGrouping.Layout.Stroke.Color := COLOR_GRID_LINE;
  TMSFNCDataGrid1.Header.VisualGrouping.Layout.Font.Name := 'Segoe UI';
  TMSFNCDataGrid1.Header.VisualGrouping.Layout.Font.Size := 10;
  TMSFNCDataGrid1.Header.VisualGrouping.Layout.Font.Color := COLOR_HEADER_TEXT;
  TMSFNCDataGrid1.Header.VisualGrouping.Layout.Font.Style := [TFontStyle.fsBold];
end;

procedure TMainView.LoadProducts;
var
  LBrandCode: Integer;
  LCondition: string;
  LCostPrice: Double;
  LGroupCode: Integer;
  LInventory: Double;
  LProductCode: Integer;
  LRow: Integer;
  LSalePrice: Double;
begin
  TMSFNCDataGrid1.BeginUpdate;
  try
    TMSFNCDataGrid1.Cells[COL_PRODUCT_CODE, 0] := 'Product code';
    TMSFNCDataGrid1.Cells[COL_NAME, 0] := 'Name';
    TMSFNCDataGrid1.Cells[COL_GROUP_CODE, 0] := 'Group code';
    TMSFNCDataGrid1.Cells[COL_BRAND_NAME, 0] := 'Brand name';
    TMSFNCDataGrid1.Cells[COL_INVENTORY, 0] := 'Inventory';
    TMSFNCDataGrid1.Cells[COL_COST_PRICE, 0] := 'Cost price';
    TMSFNCDataGrid1.Cells[COL_SALE_PRICE, 0] := 'Sale price';
    TMSFNCDataGrid1.Cells[COL_CONDITION, 0] := 'Condition';

    for LProductCode := 1 to PRODUCT_COUNT do
    begin
      LRow := LProductCode;
      LGroupCode := Succ(LProductCode mod 5);
      LBrandCode := Succ(LProductCode mod 5);
      LInventory := Random(20001) / 100;
      LCostPrice := 20 + (LProductCode * 7.59);
      LSalePrice := 150 + (LProductCode * 11.78);

      LCondition := 'Used';
      if LProductCode mod 4 = 0 then
        LCondition := 'New';

      Self.AddProduct(LRow, LProductCode, LGroupCode, LBrandCode, LInventory, LCostPrice, LSalePrice, LCondition);
    end;
  finally
    TMSFNCDataGrid1.EndUpdate;
  end;
end;

procedure TMainView.AddProduct(ARow: Integer; AProductCode: Integer; AGroupCode: Integer; ABrandCode: Integer; AInventory: Double; ACostPrice: Double; ASalePrice: Double; const ACondition: string);
begin
  TMSFNCDataGrid1.Cells[COL_PRODUCT_CODE, ARow] := AProductCode;
  TMSFNCDataGrid1.Cells[COL_NAME, ARow] := 'Product test ' + AProductCode.ToString;
  TMSFNCDataGrid1.Cells[COL_GROUP_CODE, ARow] := AGroupCode;
  TMSFNCDataGrid1.Cells[COL_BRAND_NAME, ARow] := 'Brand test ' + ABrandCode.ToString;
  TMSFNCDataGrid1.Cells[COL_INVENTORY, ARow] := FormatFloat('0.00', AInventory);
  TMSFNCDataGrid1.Cells[COL_COST_PRICE, ARow] := FormatFloat('0.00', ACostPrice);
  TMSFNCDataGrid1.Cells[COL_SALE_PRICE, ARow] := FormatFloat('0.00', ASalePrice);
  TMSFNCDataGrid1.Cells[COL_CONDITION, ARow] := ACondition;
end;

procedure TMainView.TMSFNCDataGrid1GetCellLayout(Sender: TObject; ACell: TTMSFNCDataGridCell);
begin
  if (ACell.Row < TMSFNCDataGrid1.FixedRowCount) or (ACell.Column < TMSFNCDataGrid1.FixedColumnCount) then
    Exit;

  if ACell.Column in [COL_INVENTORY, COL_COST_PRICE, COL_SALE_PRICE] then
    ACell.Layout.TextAlign := gtaTrailing;

  if ACell.Column = COL_INVENTORY then
    ACell.Layout.Font.Color := clGreen;
end;

procedure TMainView.DoCollapseAllNodesClick(Sender: TObject);
begin
  TMSFNCDataGrid1.CollapseAllNodes;
end;

procedure TMainView.DoExpandAllNodesClick(Sender: TObject);
begin
  TMSFNCDataGrid1.ExpandAllNodes;
end;

procedure TMainView.DoUngroupClick(Sender: TObject);
begin
  TMSFNCDataGrid1.UnGroup;
end;


end.
