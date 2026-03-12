unit LoadingData.Excel.View;

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
  LoadingData.Utils,
  VCL.TMSFNCCustomComponent,
  VCL.TMSFNCDataGridExcelIO;

type
  TLoadingDataExcelView = class(TForm)
    pnTop: TPanel;
    btnClear: TButton;
    btnImportDepartments: TButton;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    btnExportXLS: TButton;
    btnImportFile: TButton;
    TMSFNCDataGridExcelIO1: TTMSFNCDataGridExcelIO;
    procedure btnClearClick(Sender: TObject);
    procedure btnImportDepartmentsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExportXLSClick(Sender: TObject);
    procedure btnImportFileClick(Sender: TObject);
  private
    procedure ConfigGrid;
    procedure ConfigDataGridExcelImport;
    procedure ConfigDataGridExcelExport;
  public

  end;

var
  LoadingDataExcelView: TLoadingDataExcelView;

implementation

{$R *.dfm}

procedure TLoadingDataExcelView.FormCreate(Sender: TObject);
begin
  Self.ConfigGrid;
  btnClear.Click;
end;

procedure TLoadingDataExcelView.ConfigGrid;
begin
  //Allows you to resize the column widths using the mouse
  TMSFNCDataGrid1.Options.Mouse.ColumnSizing := True;
  //It allows you to resize columns even when the mouse is over the header (fixed cells)
  TMSFNCDataGrid1.Options.Mouse.FixedColumnSizing := True;
  //Defines the resizing mode: gszmOneSided only changes the current column
  TMSFNCDataGrid1.Options.Mouse.ColumnSizingMode := gszmOneSided;
  //Allows you to drag the column headers to rearrange their order
  TMSFNCDataGrid1.Options.Mouse.ColumnDragging := True;
  //It causes the grid columns to automatically adjust to fill the entire available width of the component
  TMSFNCDataGrid1.Options.Column.Stretching.Enabled := False;

  //Defines the starting column / row (index 0) from which data will be imported or exported
  TMSFNCDataGrid1.Options.IO.StartColumn := 0;
  TMSFNCDataGrid1.Options.IO.StartRow := 0;

  //Banding (zebra effect) on the grid, that is, it applies alternating colors to the
  TMSFNCDataGrid1.Options.Banding.Enabled := True;
  TMSFNCDataGrid1.CellAppearance.BandLayout.Fill.Color := Lighter(TMSFNCDataGrid1.CellAppearance.SelectedLayout.Fill.Color, 50);
  TMSFNCDataGrid1.CellAppearance.SelectedLayout.Fill.Color := Darker(TMSFNCDataGrid1.CellAppearance.SelectedLayout.Fill.Color, 20);
end;

procedure TLoadingDataExcelView.ConfigDataGridExcelImport;
begin
  //Linha e coluna inicial que seram pegos ao importar de um arquivo XLS / Initial row and column that will be retrieved when importing from an XLS file.
  TMSFNCDataGridExcelIO1.XlsStartRow := 0;
  TMSFNCDataGridExcelIO1.XlsStartCol := 0;

  //Linha e coluna inicial no DataGrid de onde os dados serão adicionados / Starting row and column in the DataGrid from where the data will be added.
  TMSFNCDataGridExcelIO1.DataGridStartRow := 0;
  TMSFNCDataGridExcelIO1.DataGridStartCol := 0;
end;

procedure TLoadingDataExcelView.ConfigDataGridExcelExport;
begin
  //Linha e coluna inicial que seram pegos ao importar de um arquivo XLS / Initial row and column that will be retrieved when importing from an XLS file.
  TMSFNCDataGridExcelIO1.XlsStartRow := 0;
  TMSFNCDataGridExcelIO1.XlsStartCol := 0;

  //Linha e coluna inicial no DataGrid de onde os dados serão adicionados / Starting row and column in the DataGrid from where the data will be added.
  TMSFNCDataGridExcelIO1.DataGridStartRow := 1;
  TMSFNCDataGridExcelIO1.DataGridStartCol := 1;
end;

procedure TLoadingDataExcelView.btnClearClick(Sender: TObject);
begin
  TMSFNCDataGrid1.BeginUpdate;
  try
    TMSFNCDataGrid1.Clear;
    TMSFNCDataGrid1.RowCount := 1;
  finally
    TMSFNCDataGrid1.EndUpdate;
  end;
end;

procedure TLoadingDataExcelView.btnImportDepartmentsClick(Sender: TObject);
begin
  Self.ConfigDataGridExcelImport;
  TMSFNCDataGridExcelIO1.XLSImport('../Data/Departments.xls');
end;

procedure TLoadingDataExcelView.btnImportFileClick(Sender: TObject);
var
  LFileName: string;
begin
  Self.ConfigDataGridExcelImport;

  LFileName := TUtils.GetNameFileXLS;
  if not LFileName.IsEmpty then
    TMSFNCDataGridExcelIO1.XLSImport(LFileName);
end;

procedure TLoadingDataExcelView.btnExportXLSClick(Sender: TObject);
begin
  Self.ConfigDataGridExcelExport;

  TMSFNCDataGridExcelIO1.XLSExport('Temp.xls');
  TTMSFNCUtils.OpenFile('Temp.xls');
end;

end.
