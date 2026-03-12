unit Calculations.AggregateFunctions.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes, System.Rtti, VCL.TMSFNCDataGridCell, VCL.TMSFNCDataGridData, VCL.TMSFNCDataGridBase,
  VCL.TMSFNCDataGridCore, VCL.TMSFNCDataGridRenderer, VCL.TMSFNCCustomControl, VCL.TMSFNCDataGrid, Vcl.StdCtrls;

type
  TCalculationsAggregateFunctionsView = class(TForm)
    pnTop: TPanel;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    procedure TMSFNCDataGrid1CanEditCell(Sender: TObject; AColumn, ARow: Integer; var ACanEdit: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure TMSFNCDataGrid1AfterCloseInplaceEditor(Sender: TObject; ACell: TTMSFNCDataGridCellCoord; ACancel: Boolean;
      AValue: TTMSFNCDataGridCellValue);
    procedure TMSFNCDataGrid1GetCellLayout(Sender: TObject; ACell: TTMSFNCDataGridCell);
    procedure TMSFNCDataGrid1GetCellFormatting(Sender: TObject; ACell: TTMSFNCDataGridCellCoord;
      AData: TTMSFNCDataGridCellValue; var AFormatting: TTMSFNCDataGridDataFormatting;
      var AConvertSettings: TFormatSettings; var ACanFormat: Boolean);
  private
    procedure AddColumnSUM;
    procedure AddColumnAVG;
    procedure RowCalculation;
    procedure AddColumnMAX;
  public

  end;

var
  CalculationsAggregateFunctionsView: TCalculationsAggregateFunctionsView;

implementation

{$R *.dfm}

procedure TCalculationsAggregateFunctionsView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  TMSFNCDataGrid1.LoadFromCSVData('../Data/AggregateFunctions.csv');
  Self.AddColumnSUM;
  Self.AddColumnAVG;
  Self.AddColumnMAX;
  Self.RowCalculation;
end;

procedure TCalculationsAggregateFunctionsView.TMSFNCDataGrid1AfterCloseInplaceEditor(Sender: TObject;
  ACell: TTMSFNCDataGridCellCoord; ACancel: Boolean; AValue: TTMSFNCDataGridCellValue);
begin
  if ACancel then
    Exit;

  //VALUE OF A CELL IS CHANGED, THE TOTALS ARE RECALCULATED / VALOR DE UMA CELULA E ALTERADO, OS TOTAIS SAO RECALCULADOS
  TMSFNCDataGrid1.UpdateCalculations;
end;

procedure TCalculationsAggregateFunctionsView.TMSFNCDataGrid1CanEditCell(Sender: TObject; AColumn, ARow: Integer;
  var ACanEdit: Boolean);
begin
  ACanEdit := (AColumn >= TMSFNCDataGrid1.FixedColumnCount) and (AColumn <= TMSFNCDataGrid1.ColumnCount - 2)
    and (ARow >= TMSFNCDataGrid1.FixedRowCount) and (ARow <= TMSFNCDataGrid1.RowCount - 2);
end;

procedure TCalculationsAggregateFunctionsView.AddColumnSUM;
begin
  TMSFNCDataGrid1.ColumnCount := Succ(TMSFNCDataGrid1.ColumnCount);
  TMSFNCDataGrid1.FixedRightColumnCount := Succ(TMSFNCDataGrid1.FixedRightColumnCount);

  for var I := 1 to TMSFNCDataGrid1.RowCount do
    TMSFNCDataGrid1.RowCalculations[I, 'SUM'] := [CreateRowCalculation(gcmSum, nil, nil, -1, -1, Pred(TMSFNCDataGrid1.ColumnCount))];

  TMSFNCDataGrid1.Cells[Pred(TMSFNCDataGrid1.ColumnCount), 0] := 'Sum Row';
end;

procedure TCalculationsAggregateFunctionsView.AddColumnAVG;
begin
  TMSFNCDataGrid1.ColumnCount := Succ(TMSFNCDataGrid1.ColumnCount);
  TMSFNCDataGrid1.FixedRightColumnCount := Succ(TMSFNCDataGrid1.FixedRightColumnCount);

  for var I := 1 to TMSFNCDataGrid1.RowCount do
    TMSFNCDataGrid1.RowCalculations[I, 'AVG'] := [CreateRowCalculation(gcmAverage, nil, nil, -1, -1, Pred(TMSFNCDataGrid1.ColumnCount))];

  TMSFNCDataGrid1.Cells[Pred(TMSFNCDataGrid1.ColumnCount), 0] := 'AVG Row';
end;

procedure TCalculationsAggregateFunctionsView.AddColumnMAX;
begin
  TMSFNCDataGrid1.ColumnCount := Succ(TMSFNCDataGrid1.ColumnCount);
  TMSFNCDataGrid1.FixedRightColumnCount := Succ(TMSFNCDataGrid1.FixedRightColumnCount);

  for var I := 1 to TMSFNCDataGrid1.RowCount do
    TMSFNCDataGrid1.RowCalculations[I, 'MAX'] := [CreateRowCalculation(gcmMax, nil, nil, -1, -1, Pred(TMSFNCDataGrid1.ColumnCount))];

  TMSFNCDataGrid1.Cells[Pred(TMSFNCDataGrid1.ColumnCount), 0] := 'MAX Row';
end;

procedure TCalculationsAggregateFunctionsView.TMSFNCDataGrid1GetCellFormatting(Sender: TObject;
  ACell: TTMSFNCDataGridCellCoord; AData: TTMSFNCDataGridCellValue; var AFormatting: TTMSFNCDataGridDataFormatting;
  var AConvertSettings: TFormatSettings; var ACanFormat: Boolean);
begin
  //IGNORE FIXED CELLS
  if ACell.Row < TMSFNCDataGrid1.FixedRowCount then
    Exit;

  //ENABLE FORMATTING FOR THE REMAINING COLUMNS.
  ACanFormat := True;
  AFormatting.&Type := gdftFloat;
  AFormatting.Format := '#,##0.00';
end;

procedure TCalculationsAggregateFunctionsView.TMSFNCDataGrid1GetCellLayout(Sender: TObject; ACell: TTMSFNCDataGridCell);
begin

  if ACell.Row >= TMSFNCDataGrid1.FixedRowCount then
  begin
    //COLUMN 1 ALIGNED TO THE LEFT AND THE REST TO THE RIGHT
    ACell.Layout.TextAlign := gtaTrailing;
    if ACell.Column = 0 then
      ACell.Layout.TextAlign := gtaLeading;
  end;
end;

procedure TCalculationsAggregateFunctionsView.RowCalculation;
begin
  Exit;

  TMSFNCDataGrid1.RowCount := TMSFNCDataGrid1.RowCount + 1;
  TMSFNCDataGrid1.FixedBottomRowCount := 1;

  for var I := 1 to TMSFNCDataGrid1.ColumnCount do
    TMSFNCDataGrid1.ColumnCalculations[I, 'SUM'] := [CreateNormalColumnCalculation(gcmSum)];

  TMSFNCDataGrid1.Cells[0, Pred(TMSFNCDataGrid1.RowCount)] := 'Sum Col';
end;

end.
