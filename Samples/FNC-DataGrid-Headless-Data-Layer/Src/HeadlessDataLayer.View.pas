unit HeadlessDataLayer.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.UITypes,
  System.Rtti,
  System.Math,
  Data.DB,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  VCL.TMSFNCDataGridCore,
  VCL.TMSFNCDataGridData;

type
  TProductColumn = record
  public const
    Code = 0;
    Name = 1;
    GroupCode = 2;
    BrandName = 3;
    Inventory = 4;
    CostPrice = 5;
    SalePrice = 6;
    Condition = 7;
  end;

  THeadlessDataLayerView = class(TForm)
    StatusBar1: TStatusBar;
    pnTop: TPanel;
    gBoxLoad: TGroupBox;
    btnLoadCSV: TButton;
    btnManualData: TButton;
    gBoxProcess: TGroupBox;
    btnSort: TButton;
    btnGroup: TButton;
    btnTypedValues: TButton;
    btnExport: TButton;
    btnCompleteFlow: TButton;
    lBoxLog: TListBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    btnFilter: TButton;
    edtFilter: TEdit;
    btnFilterCondition: TButton;
    GroupBox1: TGroupBox;
    btnOrderByInventory: TButton;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnLoadCSVClick(Sender: TObject);
    procedure btnManualDataClick(Sender: TObject);
    procedure btnFilterConditionClick(Sender: TObject);
    procedure btnSortClick(Sender: TObject);
    procedure btnGroupClick(Sender: TObject);
    procedure btnTypedValuesClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnCompleteFlowClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure btnOrderByInventoryClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FData: TTMSFNCDataGridData;
    procedure ClearLog;
    procedure AddLog(const AText: string);
    procedure LoadCSVProducts;
    procedure LoadManualProducts;
    procedure LogDisplayedItems;
    procedure LogGroupedResult;
    procedure UpdateStatusBar;
    function CountDisplayedRows: Integer;
    function GetDataFileName: string;
    function GetExportFileName: string;
  public

  end;

var
  HeadlessDataLayerView: THeadlessDataLayerView;

implementation

{$R *.dfm}

procedure THeadlessDataLayerView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';

  FData := TTMSFNCDataGridData.Create;
  Self.LoadCSVProducts;

  Self.ClearLog;
  Self.UpdateStatusBar;
end;

procedure THeadlessDataLayerView.FormDestroy(Sender: TObject);
begin
  FData.Free;
end;

procedure THeadlessDataLayerView.AddLog(const AText: string);
begin
  lBoxLog.Items.Add(AText);
end;

procedure THeadlessDataLayerView.ClearLog;
begin
  lBoxLog.Clear;
  StatusBar1.Panels[0].Text := '';
end;

function THeadlessDataLayerView.CountDisplayedRows: Integer;
begin
  Result := 0;

  for var LItem := FData.FixedRowCount to Pred(FData.RowCount) do
    if FData.IsRowDisplayed(LItem) then
      Inc(Result);
end;

procedure THeadlessDataLayerView.btnLoadCSVClick(Sender: TObject);
begin
  Self.LoadCSVProducts;
  Self.LogDisplayedItems;
  Self.UpdateStatusBar;
end;

procedure THeadlessDataLayerView.LoadCSVProducts;
begin
  FData.ClearData;
  FData.FixedRowCount := 1;
  FData.LoadFromCSVData(Self.GetDataFileName);
  FData.ClearFilter;
end;

procedure THeadlessDataLayerView.btnCompleteFlowClick(Sender: TObject);
begin
  Self.LoadCSVProducts;

  FData.Filter.Clear;
  FData.Filter.Add(TProductColumn.Condition, gftEqual, 'New');
  FData.ApplyFilter;
  FData.Sort(TProductColumn.SalePrice, gsdDescending);
  FData.SaveToCSVData(Self.GetExportFileName);

  Self.LogDisplayedItems;
  Self.AddLog('');
  Self.AddLog('CSV exportado em: ' + Self.GetExportFileName);
  Self.UpdateStatusBar;
end;

procedure THeadlessDataLayerView.btnExportClick(Sender: TObject);
begin
  Self.LoadCSVProducts;

  FData.Filter.Clear;
  FData.Filter.Add(TProductColumn.BrandName, gftEqual, 'Brand test 1');
  FData.ApplyFilter;
  FData.Sort(TProductColumn.Inventory, gsdDescending);
  FData.SaveToCSVData(Self.GetExportFileName);

  Self.AddLog(Format('%d linhas filtradas por Brand test 1 foram exportadas.', [Self.CountDisplayedRows]));
  Self.AddLog(Self.GetExportFileName);
  Self.UpdateStatusBar;
end;

procedure THeadlessDataLayerView.btnFilterConditionClick(Sender: TObject);
var
  i: Integer;
begin
  Self.ClearLog;

  FData.Filter.Clear;
  FData.Filter.Add(TProductColumn.Condition, gftEqual, 'Used');
  FData.ApplyFilter;

  for i := FData.FixedRowCount to Pred(FData.RowCount) do
    if FData.IsRowDisplayed(i) then
      Self.AddLog(FData.Strings[TProductColumn.Name, i] + ' - ' + FData.Strings[TProductColumn.Condition, i]);
end;

procedure THeadlessDataLayerView.btnFilterClick(Sender: TObject);
begin
  FData.Filter.Clear;
  FData.Filter
    .Add(TProductColumn.Name, gftContains, edtFilter.Text)
    .&or(TProductColumn.Condition, gftContains, edtFilter.Text);
  FData.ApplyFilter;

  Self.LogDisplayedItems;
  Self.UpdateStatusBar;
end;

procedure THeadlessDataLayerView.btnGroupClick(Sender: TObject);
begin
  Self.LoadCSVProducts;

  FData.Group(TProductColumn.Condition);
  FData.GroupCount(TProductColumn.Condition);
  FData.GroupSum(TProductColumn.SalePrice);

  Self.LogGroupedResult;
  FData.UnGroup;
  Self.UpdateStatusBar;
end;

procedure THeadlessDataLayerView.btnManualDataClick(Sender: TObject);
begin
  Self.LoadManualProducts;
  Self.AddLog('Dados inseridos diretamente em FData.Cells.');
  Self.LogDisplayedItems;
  Self.UpdateStatusBar;
end;

procedure THeadlessDataLayerView.btnSortClick(Sender: TObject);
begin
  Self.LoadCSVProducts;

  FData.Filter.Clear;
  FData.Filter.Add(TProductColumn.Condition, gftEqual, 'New');
  FData.ApplyFilter;
  FData.Sort(TProductColumn.SalePrice, gsdDescending);

  Self.AddLog('Filtro Condition = New e ordenacao por Sale price desc.');
  Self.LogDisplayedItems;
  Self.UpdateStatusBar;
end;

procedure THeadlessDataLayerView.btnTypedValuesClick(Sender: TObject);
begin
  Self.LoadCSVProducts;

  for var LItem := FData.FixedRowCount to Pred(FData.RowCount) do
    if FData.IsRowDisplayed(LItem) then
    begin
      var LName := FData.Strings[TProductColumn.Name, LItem];
      var LInventory := FData.Floats[TProductColumn.Inventory, LItem];
      var LSalePrice := FData.Floats[TProductColumn.SalePrice, LItem];
      Self.AddLog(Format('%s | estoque %.2f | venda %.2f', [LName, LInventory, LSalePrice]));

      //if mmLog.Lines.Count >= 12 then
      //  Break;
    end;

  Self.UpdateStatusBar;
end;

function THeadlessDataLayerView.GetDataFileName: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + '..\Data\products.csv';
end;

function THeadlessDataLayerView.GetExportFileName: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'headless-products-export.csv';
end;

procedure THeadlessDataLayerView.LoadManualProducts;
begin
  FData.ClearData;
  FData.ColumnCount := 8;
  FData.FixedRowCount := 1;
  FData.RowCount := 5;

  FData.Cells[TProductColumn.Code, 0] := 'Product code';
  FData.Cells[TProductColumn.Name, 0] := 'Name';
  FData.Cells[TProductColumn.GroupCode, 0] := 'Group code';
  FData.Cells[TProductColumn.BrandName, 0] := 'Brand name';
  FData.Cells[TProductColumn.Inventory, 0] := 'Inventory';
  FData.Cells[TProductColumn.CostPrice, 0] := 'Cost price';
  FData.Cells[TProductColumn.SalePrice, 0] := 'Sale price';
  FData.Cells[TProductColumn.Condition, 0] := 'Condition';

  FData.Ints[TProductColumn.Code, 1] := 1001;
  FData.Strings[TProductColumn.Name, 1] := 'Headless sample A';
  FData.Ints[TProductColumn.GroupCode, 1] := 1;
  FData.Strings[TProductColumn.BrandName, 1] := 'Brand sample';
  FData.Floats[TProductColumn.Inventory, 1] := 45.5;
  FData.Floats[TProductColumn.CostPrice, 1] := 19.9;
  FData.Floats[TProductColumn.SalePrice, 1] := 39.9;
  FData.Strings[TProductColumn.Condition, 1] := 'New';

  FData.Ints[TProductColumn.Code, 2] := 1002;
  FData.Strings[TProductColumn.Name, 2] := 'Headless sample B';
  FData.Ints[TProductColumn.GroupCode, 2] := 2;
  FData.Strings[TProductColumn.BrandName, 2] := 'Brand sample';
  FData.Floats[TProductColumn.Inventory, 2] := 18.0;
  FData.Floats[TProductColumn.CostPrice, 2] := 12.5;
  FData.Floats[TProductColumn.SalePrice, 2] := 29.9;
  FData.Strings[TProductColumn.Condition, 2] := 'Used';

  FData.Ints[TProductColumn.Code, 3] := 1003;
  FData.Strings[TProductColumn.Name, 3] := 'Headless sample C';
  FData.Ints[TProductColumn.GroupCode, 3] := 1;
  FData.Strings[TProductColumn.BrandName, 3] := 'Another brand';
  FData.Floats[TProductColumn.Inventory, 3] := 82.0;
  FData.Floats[TProductColumn.CostPrice, 3] := 51.25;
  FData.Floats[TProductColumn.SalePrice, 3] := 99.9;
  FData.Strings[TProductColumn.Condition, 3] := 'New';

  FData.Ints[TProductColumn.Code, 4] := 1004;
  FData.Strings[TProductColumn.Name, 4] := 'Headless sample D';
  FData.Ints[TProductColumn.GroupCode, 4] := 3;
  FData.Strings[TProductColumn.BrandName, 4] := 'Another brand';
  FData.Floats[TProductColumn.Inventory, 4] := 10.0;
  FData.Floats[TProductColumn.CostPrice, 4] := 7.15;
  FData.Floats[TProductColumn.SalePrice, 4] := 14.9;
  FData.Strings[TProductColumn.Condition, 4] := 'Used';
end;

procedure THeadlessDataLayerView.LogGroupedResult;
begin
  for var LItem := FData.FixedRowCount to Pred(FData.RowCount) do
  begin
    if FData.IsRowNode(LItem) then
      Self.AddLog(FData.Strings[FData.FixedColumnCount, LItem])
    else if FData.IsRowSummary(LItem) then
      Self.AddLog(Format('  count=%.0f | sale sum=%.2f',
        [
          FData.Floats[TProductColumn.Condition, LItem],
          FData.Floats[TProductColumn.SalePrice, LItem]
        ]));
  end;
end;

procedure THeadlessDataLayerView.UpdateStatusBar;
begin
  StatusBar1.Panels[0].Text := Format('Rows: %d | Displayed: %d', [Pred(FData.RowCount), Self.CountDisplayedRows]);
end;

procedure THeadlessDataLayerView.LogDisplayedItems;
begin
  lBoxLog.Clear;
  Self.AddLog(Format('%-8s %-40s %12s %12s   %-15s', [ 'Code', 'Name', 'Inventory', 'Sale price', 'Condition']));
  Self.AddLog(StringOfChar('-', 95));

  for var LRow := FData.FixedRowCount to Pred(FData.RowCount) do
    if FData.IsRowDisplayed(LRow) then
    begin
      Self.AddLog(Format('%-8s %-40s %12.2f %12.2f   %-15s', [
        FData.Strings[TProductColumn.Code, LRow],
        FData.Strings[TProductColumn.Name, LRow],
        FData.Floats[TProductColumn.Inventory, LRow],
        FData.Floats[TProductColumn.SalePrice, LRow],
        FData.Strings[TProductColumn.Condition, LRow]
      ]));
    end;
end;

procedure THeadlessDataLayerView.btnOrderByInventoryClick(Sender: TObject);
begin
  FData.Sort(TProductColumn.Inventory, gsdAscending);
  Self.LogDisplayedItems;
end;

procedure THeadlessDataLayerView.Button1Click(Sender: TObject);
begin
  FData.Sort([TProductColumn.Inventory, TProductColumn.Condition], [gsdAscending, gsdDescending]);
  Self.LogDisplayedItems;
end;

end.
