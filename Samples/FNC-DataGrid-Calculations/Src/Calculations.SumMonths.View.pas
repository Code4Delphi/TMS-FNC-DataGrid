unit Calculations.SumMonths.View;

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
  Vcl.StdCtrls,
  VCL.TMSFNCCustomComponent;

type
  TCalculationsSumMonthsView = class(TForm)
    pnTop: TPanel;
    ckCalcAutoSizeColumns: TCheckBox;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    procedure FormCreate(Sender: TObject);
    procedure TMSFNCDataGrid1GetCellLayout(Sender: TObject; ACell: TTMSFNCDataGridCell);
    procedure TMSFNCDataGrid1AfterCloseInplaceEditor(Sender: TObject; ACell: TTMSFNCDataGridCellCoord; ACancel: Boolean;
      AValue: TTMSFNCDataGridCellValue);
  private
    procedure LoadDataCSV;
    procedure ConfigDataGrid;
    procedure ColumnCalculation;
    procedure RowCalculation;
    procedure CalcAutoSizeColumns;
  public

  end;

var
  CalculationsSumMonthsView: TCalculationsSumMonthsView;

implementation

{$R *.dfm}

procedure TCalculationsSumMonthsView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := ',';
  Self.ConfigDataGrid;
  Self.LoadDataCSV;
  Self.ColumnCalculation;
  Self.RowCalculation;
  Self.CalcAutoSizeColumns;
end;

procedure TCalculationsSumMonthsView.ConfigDataGrid;
begin
  TMSFNCDataGrid1.Options.IO.StartColumn := 0;
  TMSFNCDataGrid1.Options.IO.StartRow := 0;

  TMSFNCDataGrid1.DefaultRowHeight := 40;
  TMSFNCDataGrid1.GlobalFont.Scale := 1.3;

  TMSFNCDataGrid1.Options.Keyboard.TabKeyDirectEdit := True;
  TMSFNCDataGrid1.Options.Keyboard.ArrowKeyDirectEdit := True;
  TMSFNCDataGrid1.Options.Keyboard.EnterKeyDirectEdit := True;

  TMSFNCDataGrid1.Options.Column.Stretching.Mode := gstmProportional;
  TMSFNCDataGrid1.Options.Column.Stretching.Enabled := True;

  TMSFNCDataGrid1.Options.Banding.Enabled := True;
  TMSFNCDataGrid1.CellAppearance.BandLayout.Fill.Color := Lighter(TMSFNCDataGrid1.CellAppearance.SelectedLayout.Fill.Color, 50);
  TMSFNCDataGrid1.CellAppearance.SelectedLayout.Fill.Color := Darker(TMSFNCDataGrid1.CellAppearance.SelectedLayout.Fill.Color, 20);

  TMSFNCDataGrid1.Options.Filtering.Enabled := True;
  TMSFNCDataGrid1.Options.Sorting.Enabled := True;
  TMSFNCDataGrid1.Options.Editing.Enabled := True;
  TMSFNCDataGrid1.Options.Banding.Enabled := True;
  TMSFNCDataGrid1.Options.Selection.Mode := TTMSFNCDataGridSelectionMode.gsmSingleCell;
  TMSFNCDataGrid1.Options.URL.AutoDetect := True;
  TMSFNCDataGrid1.Options.URL.AutoOpen := True;
  TMSFNCDataGrid1.Options.Mouse.ColumnDragging := True;
end;

procedure TCalculationsSumMonthsView.LoadDataCSV;
begin
  TMSFNCDataGrid1.LoadFromCSVData('../Data/Productos.csv');
end;

procedure TCalculationsSumMonthsView.ColumnCalculation;
begin
  TMSFNCDataGrid1.ColumnCount := TMSFNCDataGrid1.ColumnCount + 1;
  TMSFNCDataGrid1.FixedRightColumnCount := 1;

  for var I := 1 to TMSFNCDataGrid1.RowCount do
    TMSFNCDataGrid1.RowCalculations[I, 'SUM'] := [CreateRowCalculation(gcmSum)];

  TMSFNCDataGrid1.Cells[Pred(TMSFNCDataGrid1.ColumnCount), 0] := 'Sum Row';
end;

procedure TCalculationsSumMonthsView.RowCalculation;
begin
  TMSFNCDataGrid1.RowCount := TMSFNCDataGrid1.RowCount + 1;
  TMSFNCDataGrid1.FixedBottomRowCount := 1;

  for var I := 1 to TMSFNCDataGrid1.ColumnCount do
    TMSFNCDataGrid1.ColumnCalculations[I, 'SUM'] := [CreateNormalColumnCalculation(gcmSum)];

  TMSFNCDataGrid1.Cells[0, Pred(TMSFNCDataGrid1.RowCount)] := 'Sum Col';
end;

procedure TCalculationsSumMonthsView.TMSFNCDataGrid1AfterCloseInplaceEditor(Sender: TObject; ACell: TTMSFNCDataGridCellCoord;
  ACancel: Boolean; AValue: TTMSFNCDataGridCellValue);
begin
  if ACancel then
    Exit;

  //VALUE OF A CELL IS CHANGED, THE TOTALS ARE RECALCULATED / VALOR DE UMA CELULA E ALTERADO, OS TOTAIS SAO RECALCULADOS
  TMSFNCDataGrid1.UpdateCalculations;

  if ckCalcAutoSizeColumns.Checked then
    Self.CalcAutoSizeColumns;

  //It automatically adjusts only the edited column
  //TMSFNCDataGrid1.AutoSizeColumn(ACell.Column, gamAllCells, 8);
end;

procedure TCalculationsSumMonthsView.CalcAutoSizeColumns;
begin
  //Automatic column resizing
  TMSFNCDataGrid1.AutoSizeRows(gamAllCells, 10);
  TMSFNCDataGrid1.AutoSizeColumns(gamAllCells, 10);
end;

procedure TCalculationsSumMonthsView.TMSFNCDataGrid1GetCellLayout(Sender: TObject; ACell: TTMSFNCDataGridCell);
begin
  //LAST LINE
  if ACell.Row = Pred(TMSFNCDataGrid1.RowCount) then
  begin
    ACell.Layout.Font.Style := [fsBold];
    ACell.Layout.Fill.Color := clCream;
  end;

  //LAST COLUMN
  if ACell.Column = Pred(TMSFNCDataGrid1.ColumnCount) then
  begin
    ACell.Layout.Font.Style := [fsBold];
    ACell.Layout.Fill.Color := clCream;
  end;

  //ROW OR COLUMN IS FIXED
  if ACell.Row >= TMSFNCDataGrid1.FixedRowCount then
  begin
    //COLUMN 1 ALIGNED TO THE LEFT AND THE REST TO THE RIGHT
    ACell.Layout.TextAlign := gtaTrailing;
    if ACell.Column = 0 then
      ACell.Layout.TextAlign := gtaLeading;
  end;
end;

end.
