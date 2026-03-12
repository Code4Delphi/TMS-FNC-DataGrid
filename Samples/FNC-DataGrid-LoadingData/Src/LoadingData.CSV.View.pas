unit LoadingData.CSV.View;

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
  LoadingData.Utils;

type
  TLoadingDataCSVView = class(TForm)
    pnTop: TPanel;
    btnClear: TButton;
    btnImportDepartments: TButton;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    btnExportCSV: TButton;
    btnImportFile: TButton;
    procedure btnClearClick(Sender: TObject);
    procedure btnImportDepartmentsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExportCSVClick(Sender: TObject);
    procedure btnImportFileClick(Sender: TObject);
  private
    procedure ConfigGrid;

  public

  end;

var
  LoadingDataCSVView: TLoadingDataCSVView;

implementation

{$R *.dfm}

procedure TLoadingDataCSVView.FormCreate(Sender: TObject);
begin
  Self.ConfigGrid;
  btnClear.Click;
end;

procedure TLoadingDataCSVView.ConfigGrid;
begin
  //Permite redimensionar a largura das colunas usando o mouse / Allows you to resize the column widths using the mouse
  TMSFNCDataGrid1.Options.Mouse.ColumnSizing := True;
  //Permite redimensionar as colunas mesmo quando o cursor esta sobre o cabeçalho (celulas fixas) / It allows you to resize columns even when the mouse is over the header (fixed cells)
  TMSFNCDataGrid1.Options.Mouse.FixedColumnSizing := True;
  //Define o modo de redimensionamento: gszmOneSided altera apenas a coluna atual / Defines the resizing mode: gszmOneSided only changes the current column
  TMSFNCDataGrid1.Options.Mouse.ColumnSizingMode := gszmOneSided;
  //Permite arrastar os cabeçalhos das colunas para reorganizar a ordem / Allows you to drag the column headers to rearrange their order
  TMSFNCDataGrid1.Options.Mouse.ColumnDragging := True;
  //Colunas da grade se ajustem automaticamente para preencher toda a largura disponível do componente / Grid columns to automatically adjust to fill the entire available width of the component
  TMSFNCDataGrid1.Options.Column.Stretching.Enabled := False;

  //Define a coluna inicial (indice 0) do grid a partir da qual os dados serao importados ou exportados / Defines the starting column (index 0) of the grid from which data will be imported or exported.
  TMSFNCDataGrid1.Options.IO.StartColumn := 0;
  TMSFNCDataGrid1.Options.IO.StartRow := 0;

  //Defines the default width and height of columns and rows
  TMSFNCDataGrid1.DefaultColumnWidth := 200;
  TMSFNCDataGrid1.DefaultRowHeight := 24;

  //banding (zebra effect) on the grid, that is, it applies alternating colors to the
  TMSFNCDataGrid1.Options.Banding.Enabled := True;
  TMSFNCDataGrid1.CellAppearance.BandLayout.Fill.Color := Lighter(TMSFNCDataGrid1.CellAppearance.SelectedLayout.Fill.Color, 50);
  TMSFNCDataGrid1.CellAppearance.SelectedLayout.Fill.Color := Darker(TMSFNCDataGrid1.CellAppearance.SelectedLayout.Fill.Color, 20);
end;

procedure TLoadingDataCSVView.btnClearClick(Sender: TObject);
begin
  TMSFNCDataGrid1.BeginUpdate;
  try
    TMSFNCDataGrid1.Clear;
    TMSFNCDataGrid1.RowCount := 1;
  finally
    TMSFNCDataGrid1.EndUpdate;
  end;
end;

procedure TLoadingDataCSVView.btnImportDepartmentsClick(Sender: TObject);
begin
  TMSFNCDataGrid1.LoadFromCSVData('../Data/Departments.csv');
end;

procedure TLoadingDataCSVView.btnImportFileClick(Sender: TObject);
var
  LFileName: string;
begin
  LFileName := TUtils.GetNameFileCSV;
  if not LFileName.IsEmpty then
    TMSFNCDataGrid1.LoadFromCSVData(LFileName);
end;

procedure TLoadingDataCSVView.btnExportCSVClick(Sender: TObject);
var
  LFileName: string;
begin
  LFileName := TUtils.GetNameFileCSV;
  if not LFileName.IsEmpty then
    TMSFNCDataGrid1.SaveToCSVData(LFileName);
end;

end.
