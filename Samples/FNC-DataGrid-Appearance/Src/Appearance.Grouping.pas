unit Appearance.Grouping;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
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
  VCL.TMSFNCCustomControl,
  VCL.TMSFNCDataGrid,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  VCL.TMSFNCCustomComponent,
  VCL.TMSFNCDataGridDatabaseAdapter,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.Comp.UI,
  Vcl.Buttons,
  Vcl.ComCtrls,
  VCL.TMSFNCBitmapContainer;

type
  TAppearanceGrouping = class(TForm)
    pnTop: TPanel;
    GroupBox2: TGroupBox;
    btnClose: TButton;
    btnOpenQuery: TButton;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    TMSFNCDataGridDatabaseAdapter1: TTMSFNCDataGridDatabaseAdapter;
    GroupBox3: TGroupBox;
    StatusBar1: TStatusBar;
    FDQuery1product_code: TIntegerField;
    FDQuery1name: TWideMemoField;
    FDQuery1group_code: TIntegerField;
    FDQuery1brand_name: TWideMemoField;
    FDQuery1inventory: TFloatField;
    FDQuery1cost_price: TFloatField;
    FDQuery1sale_price: TFloatField;
    FDQuery1condition: TWideMemoField;
    btnGroup: TButton;
    GroupBox1: TGroupBox;
    ckGroupingHideColumns: TCheckBox;
    btnUngroup: TButton;
    btnExpandAllNodes: TButton;
    btnCollapseAllNodes: TButton;
    TMSFNCBitmapContainer1: TTMSFNCBitmapContainer;
    GroupBox4: TGroupBox;
    btnSortingInventoryColumnAsc: TButton;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnOpenQueryClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure btnGroupClick(Sender: TObject);
    procedure btnUngroupClick(Sender: TObject);
    procedure btnExpandAllNodesClick(Sender: TObject);
    procedure btnCollapseAllNodesClick(Sender: TObject);
    procedure TMSFNCDataGrid1GetCustomGroup(Sender: TObject; ACell: TTMSFNCDataGridCellCoord;
      AData: TTMSFNCDataGridCellValue; ALevel: Integer; var AGroup: string);
    procedure btnSortingInventoryColumnAscClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure ConfigDataGrid;
    procedure ConfigAppearance;
    procedure DoUngroupClick(Sender: TObject);
    procedure DoCollapseAllNodesClick(Sender: TObject);
    procedure DoExpandAllNodesClick(Sender: TObject);
  public
  end;

var
  AppearanceGrouping: TAppearanceGrouping;

implementation

{$R *.dfm}

const
  COLOR_BACKGROUND = $0033322F;
  COLOR_HEADER = $004D4B45;
  COLOR_GROUP = $003B3A36;
  COLOR_SUMMARY = $0045413E;
  COLOR_GRID_LINE = $00635F5A;
  COLOR_HEADER_TEXT = $00D6B38D;
  COLOR_TEXT = $00F5F5F5;
  COLOR_MUTED_TEXT = $00C8D0D7;
  COLOR_SELECTION = $00704A2D;
  COLOR_SELECTION_BORDER = $00E89B32;

procedure TAppearanceGrouping.FormCreate(Sender: TObject);
begin
  Self.ConfigDataGrid;
  FDConnection1.Params.Database := '..\Data\Products.db';
end;

procedure TAppearanceGrouping.ConfigDataGrid;
begin
  TMSFNCDataGrid1.BeginUpdate;

  //SETTINGS FOR VISUAL GROUP
  TMSFNCDataGrid1.Options.Mouse.ColumnDragging := True;
  TMSFNCDataGrid1.Header.Visible := True;
  TMSFNCDataGrid1.Header.Bar.Visible := True;
  TMSFNCDataGrid1.Header.Bar.Size := 35;

  //Buttons displayed below group links
  var LGridButton := TMSFNCDataGrid1.Header.Bar.Buttons.Add;
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

  //DatabaseAdapter
  TMSFNCDataGridDatabaseAdapter1.ShowMemoFields := True;
  //Required for use in grouping
  TMSFNCDataGridDatabaseAdapter1.LoadMode := almAllRecords;

  Self.ConfigAppearance;

  TMSFNCDataGrid1.EndUpdate;
end;

procedure TAppearanceGrouping.ConfigAppearance;
begin
  TMSFNCDataGrid1.Color := COLOR_BACKGROUND;
  TMSFNCDataGrid1.Font.Name := 'Segoe UI';
  TMSFNCDataGrid1.Font.Size := 10;
  TMSFNCDataGrid1.Font.Color := COLOR_TEXT;

  TMSFNCDataGrid1.CellAppearance.NormalLayout.Fill.Kind := gfkSolid;
  TMSFNCDataGrid1.CellAppearance.NormalLayout.Fill.Color := COLOR_BACKGROUND;
  TMSFNCDataGrid1.CellAppearance.NormalLayout.Stroke.Color := COLOR_GRID_LINE;
  TMSFNCDataGrid1.CellAppearance.NormalLayout.Font.Name := 'Segoe UI';
  TMSFNCDataGrid1.CellAppearance.NormalLayout.Font.Size := 10;
  TMSFNCDataGrid1.CellAppearance.NormalLayout.Font.Color := COLOR_TEXT;

  TMSFNCDataGrid1.CellAppearance.FixedLayout.Fill.Kind := gfkSolid;
  TMSFNCDataGrid1.CellAppearance.FixedLayout.Fill.Color := COLOR_HEADER;
  TMSFNCDataGrid1.CellAppearance.FixedLayout.Stroke.Color := COLOR_GRID_LINE;
  TMSFNCDataGrid1.CellAppearance.FixedLayout.Font.Name := 'Segoe UI';
  TMSFNCDataGrid1.CellAppearance.FixedLayout.Font.Size := 10;
  TMSFNCDataGrid1.CellAppearance.FixedLayout.Font.Color := COLOR_HEADER_TEXT;
  TMSFNCDataGrid1.CellAppearance.FixedLayout.Font.Style := [TFontStyle.fsBold];

  TMSFNCDataGrid1.CellAppearance.GroupLayout.Fill.Kind := gfkSolid;
  TMSFNCDataGrid1.CellAppearance.GroupLayout.Fill.Color := COLOR_GROUP;
  TMSFNCDataGrid1.CellAppearance.GroupLayout.Stroke.Color := COLOR_GRID_LINE;
  TMSFNCDataGrid1.CellAppearance.GroupLayout.Font.Name := 'Segoe UI';
  TMSFNCDataGrid1.CellAppearance.GroupLayout.Font.Size := 10;
  TMSFNCDataGrid1.CellAppearance.GroupLayout.Font.Color := COLOR_TEXT;
  TMSFNCDataGrid1.CellAppearance.GroupLayout.Font.Style := [TFontStyle.fsBold];

  TMSFNCDataGrid1.CellAppearance.SummaryLayout.Fill.Kind := gfkSolid;
  TMSFNCDataGrid1.CellAppearance.SummaryLayout.Fill.Color := COLOR_SUMMARY;
  TMSFNCDataGrid1.CellAppearance.SummaryLayout.Stroke.Color := COLOR_GRID_LINE;
  TMSFNCDataGrid1.CellAppearance.SummaryLayout.Font.Name := 'Segoe UI';
  TMSFNCDataGrid1.CellAppearance.SummaryLayout.Font.Size := 10;
  TMSFNCDataGrid1.CellAppearance.SummaryLayout.Font.Color := COLOR_HEADER_TEXT;
  TMSFNCDataGrid1.CellAppearance.SummaryLayout.Font.Style := [TFontStyle.fsBold];

  TMSFNCDataGrid1.CellAppearance.SelectedLayout.Fill.Kind := gfkSolid;
  TMSFNCDataGrid1.CellAppearance.SelectedLayout.Fill.Color := COLOR_SELECTION;
  TMSFNCDataGrid1.CellAppearance.SelectedLayout.Stroke.Color := COLOR_SELECTION_BORDER;
  TMSFNCDataGrid1.CellAppearance.SelectedLayout.Font.Name := 'Segoe UI';
  TMSFNCDataGrid1.CellAppearance.SelectedLayout.Font.Size := 10;
  TMSFNCDataGrid1.CellAppearance.SelectedLayout.Font.Color := COLOR_HEADER_TEXT;

  TMSFNCDataGrid1.CellAppearance.FocusedLayout.Fill.Kind := gfkSolid;
  TMSFNCDataGrid1.CellAppearance.FocusedLayout.Fill.Color := COLOR_SELECTION;
  TMSFNCDataGrid1.CellAppearance.FocusedLayout.Stroke.Color := COLOR_SELECTION_BORDER;
  TMSFNCDataGrid1.CellAppearance.FocusedLayout.Font.Name := 'Segoe UI';
  TMSFNCDataGrid1.CellAppearance.FocusedLayout.Font.Size := 10;
  TMSFNCDataGrid1.CellAppearance.FocusedLayout.Font.Color := COLOR_HEADER_TEXT;

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

procedure TAppearanceGrouping.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  StatusBar1.Panels[0].Text := 'Total: ' + FDQuery1.RecordCount.ToString;
end;

procedure TAppearanceGrouping.btnOpenQueryClick(Sender: TObject);
begin
  FDQuery1.Open;
end;

procedure TAppearanceGrouping.btnCloseClick(Sender: TObject);
begin
  FDQuery1.Close;
end;

procedure TAppearanceGrouping.btnGroupClick(Sender: TObject);
begin
  TMSFNCDataGrid1.BeginUpdate;
  TMSFNCDataGrid1.Clear;
  TMSFNCDataGrid1.UnGroup;
  TMSFNCDataGrid1.RowCount := TMSFNCDataGrid1.RowCount + 1;
  TMSFNCDataGrid1.FixedBottomRowCount := 1;
  TMSFNCDataGrid1.Group(CreateGroupInfo([2, 3], [7]));
  TMSFNCDataGrid1.Options.Grouping.HideColumns := ckGroupingHideColumns.Checked;

  //COUNTS
  TMSFNCDataGrid1.ColumnCalculations[0, 'Group count'] := [CreateGroupColumnCalculation(gcmCount,
    procedure(AColumn: Integer; ALevel: Integer; var AOptions: TTMSFNCDataGridDataColumnCalculationOptions)
    begin
      case ALevel of
        0: AOptions.CalculationFormat := '<b>Group count: %g</b>';
        1: AOptions.CalculationFormat := 'Sub-Count: %g';
      end;
    end)];

  TMSFNCDataGrid1.ColumnCalculations[0, 'General count'] := [CreateNormalColumnCalculation(gcmCount,
    procedure(AColumn: Integer; ALevel: Integer; var AOptions: TTMSFNCDataGridDataColumnCalculationOptions)
    begin
      AOptions.CalculationFormat := '<b>General count: %g</b>';
    end)];

  //AVERAGE SELLING PRICES / MEDIA PRECOS DE VENDA
  TMSFNCDataGrid1.ColumnCalculations[6, 'Average sale price'] := [CreateGroupColumnCalculation(gcmAverage,
    procedure(AColumn: Integer; ALevel: Integer; var AOptions: TTMSFNCDataGridDataColumnCalculationOptions)
    begin
      case ALevel of
        0: AOptions.CalculationFormat := '<b>Group average: $%.2f</b>';
        1: AOptions.CalculationFormat := 'Sub-Average: $%.2f';
      end;
    end)];

  //TOTALIZERS
  TMSFNCDataGrid1.ColumnCalculations[6, 'Sum'] := [CreateNormalColumnCalculation(gcmSum,
    procedure(AColumn: Integer; ALevel: Integer; var AOptions: TTMSFNCDataGridDataColumnCalculationOptions)
    begin
      AOptions.CalculationFormat := '<b>Total Sum: $%.2f</b>';
    end),

  CreateNormalColumnCalculation(gcmMax,
    procedure(AColumn: Integer; ALevel: Integer; var AOptions: TTMSFNCDataGridDataColumnCalculationOptions)
    begin
      AOptions.CalculationFormat := '<br><b>Max price: $%.2f</b>';
    end)];

  TMSFNCDataGrid1.AutoSizeColumns;
  TMSFNCDataGrid1.RowHeights[TMSFNCDataGrid1.RowCount - TMSFNCDataGrid1.FixedBottomRowCount] := 50;
  TMSFNCDataGrid1.Options.Calculations.IncludeHiddenRows := True;

  TMSFNCDataGrid1.EndUpdate;
end;

procedure TAppearanceGrouping.DoCollapseAllNodesClick(Sender: TObject);
begin
  TMSFNCDataGrid1.CollapseAllNodes;
end;

procedure TAppearanceGrouping.DoExpandAllNodesClick(Sender: TObject);
begin
  TMSFNCDataGrid1.ExpandAllNodes;
end;

procedure TAppearanceGrouping.DoUngroupClick(Sender: TObject);
begin
  TMSFNCDataGrid1.UnGroup;
end;

procedure TAppearanceGrouping.btnCollapseAllNodesClick(Sender: TObject);
begin
  TMSFNCDataGrid1.CollapseAllNodes;
end;

procedure TAppearanceGrouping.btnExpandAllNodesClick(Sender: TObject);
begin
  TMSFNCDataGrid1.ExpandAllNodes;
end;

procedure TAppearanceGrouping.btnUngroupClick(Sender: TObject);
begin
  TMSFNCDataGrid1.UnGroup;
end;

procedure TAppearanceGrouping.TMSFNCDataGrid1GetCustomGroup(Sender: TObject; ACell: TTMSFNCDataGridCellCoord;
  AData: TTMSFNCDataGridCellValue; ALevel: Integer; var AGroup: string);
begin
  if ACell.Column = TMSFNCDataGrid1.ColumnIndexByHeader('Group code') then
    AGroup := '<img src="group.svg" height="95%"/> ' + AGroup
  else if ACell.Column = TMSFNCDataGrid1.ColumnIndexByHeader('Condition') then
  begin
    if AData.AsString = 'New' then
      AGroup := '<img src="new.svg" height="95%"/> ' + AGroup
    else
      AGroup := '<img src="used.svg" height="95%"/> ' + AGroup
  end;
end;

procedure TAppearanceGrouping.btnSortingInventoryColumnAscClick(Sender: TObject);
begin
  TMSFNCDataGrid1.GroupSort(4, gsdAscending);
end;

procedure TAppearanceGrouping.Button1Click(Sender: TObject);
begin
  TMSFNCDataGrid1.GroupSort([3, 7], [gsdAscending, gsdDescending]);
end;

end.
