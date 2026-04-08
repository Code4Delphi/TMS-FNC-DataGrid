unit ImportExport.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.UITypes,
  System.Rtti,
  Data.DB,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  ImportExport.Utils,
  VCL.TMSFNCTypes,
  VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes,
  VCL.TMSFNCDataGridCell,
  VCL.TMSFNCDataGridData,
  VCL.TMSFNCDataGridBase,
  VCL.TMSFNCDataGridCore,
  VCL.TMSFNCDataGridRenderer,
  VCL.TMSFNCCustomControl,
  VCL.TMSFNCDataGrid, VCL.TMSFNCCustomComponent, VCL.TMSFNCDataGridExcelIO;

type
  TImportExportMain = class(TForm)
    StatusBar1: TStatusBar;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    btnImportCSV: TButton;
    btnExportCSV: TButton;
    btnClearGrid: TButton;
    GroupBox2: TGroupBox;
    btnImportarExcel: TButton;
    btnExportExcel: TButton;
    TMSFNCDataGridExcelIO1: TTMSFNCDataGridExcelIO;
    procedure FormCreate(Sender: TObject);
    procedure TMSFNCDataGrid1GetCellLayout(Sender: TObject; ACell: TTMSFNCDataGridCell);
    procedure btnImportCSVClick(Sender: TObject);
    procedure btnExportCSVClick(Sender: TObject);
    procedure btnClearGridClick(Sender: TObject);
    procedure btnImportarExcelClick(Sender: TObject);
    procedure btnExportExcelClick(Sender: TObject);
  private
    procedure ConfigDataGridExcel;

  public

  end;

var
  ImportExportMain: TImportExportMain;

implementation

{$R *.dfm}

procedure TImportExportMain.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  TMSFNCDataGrid1.Clear;
  TMSFNCDataGrid1.LoadFromCSVData('..\Data\products.csv');
end;

procedure TImportExportMain.TMSFNCDataGrid1GetCellLayout(Sender: TObject; ACell: TTMSFNCDataGridCell);
begin
  //IF ROW OR COLUMN IS FIXED
  if (ACell.Row < TMSFNCDataGrid1.FixedRowCount) or (ACell.Column < TMSFNCDataGrid1.FixedColumnCount) then
  begin
    ACell.Layout.Font.Color := clHotLight;
    ACell.Layout.Font.Style := [TFontStyle.fsBold];
    Exit;
  end;

  //IF THE ROW IS SELECTED/FOCUSED
  if ACell.Row = TMSFNCDataGrid1.FocusedCell.Row then
  begin
    ACell.Layout.Fill.Color := $00FFD9B3;
    ACell.Layout.Font.Style := [fsBold];
  end
  //IF THE CELL IS NOT SELECTED/FOCUSED
  else
  begin
    //ZEBRAR
    if Odd(ACell.Row) then
      ACell.Layout.Fill.Color := $00F5F5F5
    else
      ACell.Layout.Fill.Color := $00E4E4E4;
  end;

  //IF THE ROW AND COLUMN IS SELECTED/FOCUSED
  if (ACell.Row = TMSFNCDataGrid1.FocusedCell.Row) and  (ACell.Column = TMSFNCDataGrid1.FocusedCell.Column) then
    ACell.Layout.Font.Style := ACell.Layout.Font.Style + [fsUnderline];

  //IF Inventory COLUMN
  if ACell.Column = 4 then
  begin
    ACell.Layout.Font.Color := clGreen;
    ACell.Layout.Font.Style := [TFontStyle.fsBold];

    var LInventory := TMSFNCDataGrid1.Floats[ACell.Column, ACell.Row];
    if LInventory < 200 then
      ACell.Layout.Font.Color := clRed
  end;

  //IF Condition COLUMN
  if ACell.Column = 7 then
  begin
    ACell.Layout.TextAlign := gtaCenter;
    ACell.Layout.Font.Style := [TFontStyle.fsBold];

    //if TMSFNCDataGrid1.Cells[ACell.Column, ACell.Row].AsString = 'New' then
    if ACell.Data.Value.AsString = 'New' then
      ACell.Layout.Fill.Color := gcLightgreen
    else
      ACell.Layout.Fill.Color := gcLightblue;
  end;

  //ALIGNMENT
  if ACell.Column in [4, 5, 6] then
    ACell.Layout.TextAlign := gtaTrailing;
end;

procedure TImportExportMain.btnClearGridClick(Sender: TObject);
begin
  TMSFNCDataGrid1.Clear;
  TMSFNCDataGrid1.RowCount := 1;
end;

procedure TImportExportMain.btnImportCSVClick(Sender: TObject);
begin
  var LFileName := TUtils.GetNameFileCSV;
  if not LFileName.IsEmpty then
    TMSFNCDataGrid1.LoadFromCSVData(LFileName);
end;

procedure TImportExportMain.btnExportCSVClick(Sender: TObject);
begin
  var LFileName := TUtils.GetNameFileCSV;
  if not LFileName.IsEmpty then
    TMSFNCDataGrid1.SaveToCSVData(LFileName);
end;

procedure TImportExportMain.ConfigDataGridExcel;
begin
  //Linha e coluna inicial que seram pegos ao importar e exportar de um XLS / Initial row and column that will be retrieved when importing from an XLS
  TMSFNCDataGridExcelIO1.XlsStartRow := 0;
  TMSFNCDataGridExcelIO1.XlsStartCol := 0;

  //Linha e coluna inicial no DataGrid de onde os dados serao adicionados / Starting row and column in the DataGrid from where the data will be added
  TMSFNCDataGridExcelIO1.DataGridStartRow := 0;
  TMSFNCDataGridExcelIO1.DataGridStartCol := 0;
end;

procedure TImportExportMain.btnImportarExcelClick(Sender: TObject);
begin
  Self.ConfigDataGridExcel;

  var LFileName := TUtils.GetNameFileXLS;
  if not LFileName.IsEmpty then
    TMSFNCDataGridExcelIO1.XLSImport(LFileName);
end;

procedure TImportExportMain.btnExportExcelClick(Sender: TObject);
begin
  Self.ConfigDataGridExcel;

  var LFileName := TUtils.GetNameFileXLS;
  if not LFileName.IsEmpty then
    TMSFNCDataGridExcelIO1.XLSExport(LFileName);

  //TTMSFNCUtils.OpenFile(LFileName);
end;

end.
