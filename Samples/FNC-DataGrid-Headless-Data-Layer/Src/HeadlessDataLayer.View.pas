unit HeadlessDataLayer.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.StrUtils,
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
  TColNumber = record
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
    lBoxLog: TListBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    btnFilter: TButton;
    edtFilter: TEdit;
    btnFilterCondition: TButton;
    GroupBox1: TGroupBox;
    btnOrderByInventoryAsc: TButton;
    btnOrderByInventoryAndCondition: TButton;
    btnOrderByInventoryDesc: TButton;
    btnRemoveFilter: TButton;
    GroupBox2: TGroupBox;
    btnExport: TButton;
    GroupBox4: TGroupBox;
    btnGroup: TButton;
    btnUnGroup: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnLoadCSVClick(Sender: TObject);
    procedure btnManualDataClick(Sender: TObject);
    procedure btnFilterConditionClick(Sender: TObject);
    procedure btnGroupClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure btnOrderByInventoryAscClick(Sender: TObject);
    procedure btnOrderByInventoryAndConditionClick(Sender: TObject);
    procedure btnOrderByInventoryDescClick(Sender: TObject);
    procedure btnRemoveFilterClick(Sender: TObject);
    procedure btnUnGroupClick(Sender: TObject);
  private
    FData: TTMSFNCDataGridData;
    procedure ClearLog;
    procedure AddLog(const AText: string);
    procedure LoadCSVProducts;
    procedure LogDisplayedItems;
    procedure LogGroupedResult;
    procedure UpdateStatusBar;
    function CountDisplayedRows: Integer;
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

procedure THeadlessDataLayerView.LoadCSVProducts;
begin
  FData.ClearData;
  FData.FixedRowCount := 1;
  FData.LoadFromCSVData('..\Data\products.csv');
  FData.ClearFilter;
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

procedure THeadlessDataLayerView.btnManualDataClick(Sender: TObject);
var
  I: Integer;
begin
  FData.ClearData;
  FData.ColumnCount := 8;
  FData.FixedRowCount := 0;
  FData.RowCount := 20;

  for I := 0 to 20 do
  begin
    FData.Ints[TColNumber.Code, I] := I;
    FData.Strings[TColNumber.Name, I] := 'Headless sample ' + I.ToString;
    FData.Ints[TColNumber.GroupCode, I] := 1;
    FData.Strings[TColNumber.BrandName, I] := 'Brand sample ' + I.ToString;
    FData.Floats[TColNumber.Inventory, I] := I * 10.5;
    FData.Floats[TColNumber.CostPrice, I] := I * 3;
    FData.Floats[TColNumber.SalePrice, I] := I * 4.4;
    FData.Strings[TColNumber.Condition, I] := IfThen(Odd(I), 'New', 'Used');
  end;

  lBoxLog.Items.Clear;
  for I := FData.FixedRowCount to Pred(FData.RowCount) do
  begin
    lBoxLog.Items.Add(Format('%-8s %-40s %12.2f %12.2f   %-15s', [
      FData.Strings[TColNumber.Code, I],
      FData.Strings[TColNumber.Name, I],
      FData.Floats[TColNumber.Inventory, I],
      FData.Floats[TColNumber.SalePrice, I],
      FData.Strings[TColNumber.Condition, I]
    ]));
  end;

  StatusBar1.Panels[0].Text := 'Items: ' + FData.RowCount.ToString;
end;

procedure THeadlessDataLayerView.btnLoadCSVClick(Sender: TObject);
begin
  Self.LoadCSVProducts;
  Self.LogDisplayedItems;
  Self.UpdateStatusBar;
end;

procedure THeadlessDataLayerView.btnFilterConditionClick(Sender: TObject);
var
  i: Integer;
begin
  Self.ClearLog;

  FData.Filter.Clear;
  FData.Filter.Add(TColNumber.Condition, gftEqual, 'Used');
  FData.ApplyFilter;

  lBoxLog.Items.Clear;
  for i := FData.FixedRowCount to Pred(FData.RowCount) do
    if FData.IsRowDisplayed(i) then
      lBoxLog.Items.Add(FData.Strings[TColNumber.Name, i] + ' | ' + FData.Strings[TColNumber.Condition, i]);

  Self.UpdateStatusBar;
end;

procedure THeadlessDataLayerView.btnFilterClick(Sender: TObject);
begin
  FData.Filter.Clear;
  FData.Filter
    .Add(TColNumber.Name, gftContains, edtFilter.Text)
    .&or(TColNumber.Condition, gftContains, edtFilter.Text);
  FData.ApplyFilter;

  lBoxLog.Items.Clear;
  for var i := FData.FixedRowCount to Pred(FData.RowCount) do
    if FData.IsRowDisplayed(i) then
      lBoxLog.Items.Add(FData.Strings[TColNumber.Name, i] + ' | ' + FData.Strings[TColNumber.Condition, i]);

  Self.UpdateStatusBar;
end;

procedure THeadlessDataLayerView.btnRemoveFilterClick(Sender: TObject);
begin
  FData.RemoveFilter;

  lBoxLog.Items.Clear;
  for var i := FData.FixedRowCount to Pred(FData.RowCount) do
    if FData.IsRowDisplayed(i) then
      lBoxLog.Items.Add(FData.Strings[TColNumber.Name, i] + ' | ' + FData.Strings[TColNumber.Condition, i]);

  Self.UpdateStatusBar;
end;

procedure THeadlessDataLayerView.btnOrderByInventoryAscClick(Sender: TObject);
begin
  FData.Sort(TColNumber.Inventory, gsdAscending);
  Self.LogDisplayedItems;
end;

procedure THeadlessDataLayerView.btnOrderByInventoryDescClick(Sender: TObject);
begin
  FData.Sort(TColNumber.Inventory, gsdDescending);
  Self.LogDisplayedItems;
end;

procedure THeadlessDataLayerView.btnOrderByInventoryAndConditionClick(Sender: TObject);
begin
  FData.Sort([TColNumber.Inventory, TColNumber.Condition], [gsdAscending, gsdDescending]);
  Self.LogDisplayedItems;
end;

procedure THeadlessDataLayerView.btnExportClick(Sender: TObject);
begin
  var LFileName := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'headless-products-export.csv';
  FData.SaveToCSVData(LFileName);
  ShowMessage('Exported data' + sLineBreak + LFileName);
end;

procedure THeadlessDataLayerView.btnGroupClick(Sender: TObject);
begin
  Self.LoadCSVProducts;

  FData.Group(TColNumber.Condition);
  FData.GroupCount(TColNumber.Condition);
  FData.GroupSum(TColNumber.SalePrice);

  Self.LogGroupedResult;
  Self.UpdateStatusBar;
end;

procedure THeadlessDataLayerView.LogGroupedResult;
begin
  lBoxLog.Items.Clear;

  for var LItem := FData.FixedRowCount to Pred(FData.RowCount) do
  begin
    if FData.IsRowNode(LItem) then
      lBoxLog.Items.Add(FData.Strings[FData.FixedColumnCount, LItem])
    else if FData.IsRowSummary(LItem) then
    begin
      lBoxLog.Items.Add(Format('  Count: %.0f | Sale Price Sum: %.2f',
        [FData.Floats[TColNumber.Condition, LItem], FData.Floats[TColNumber.SalePrice, LItem]]));
    end;
  end;
end;

procedure THeadlessDataLayerView.btnUnGroupClick(Sender: TObject);
begin
  FData.UnGroup;

  Self.LogDisplayedItems;
  Self.UpdateStatusBar;
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
        FData.Strings[TColNumber.Code, LRow],
        FData.Strings[TColNumber.Name, LRow],
        FData.Floats[TColNumber.Inventory, LRow],
        FData.Floats[TColNumber.SalePrice, LRow],
        FData.Strings[TColNumber.Condition, LRow]
      ]));
    end;
end;

end.
