unit Calculations.AggregateFunctions.View;

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
  Vcl.StdCtrls;

type
  TCalculationsAggregateFunctionsView = class(TForm)
    pnTop: TPanel;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure TMSFNCDataGrid1AfterCloseInplaceEditor(Sender: TObject; ACell: TTMSFNCDataGridCellCoord; ACancel: Boolean;
      AValue: TTMSFNCDataGridCellValue);
    procedure TMSFNCDataGrid1GetCellLayout(Sender: TObject; ACell: TTMSFNCDataGridCell);
    procedure TMSFNCDataGrid1GetCellFormatting(Sender: TObject; ACell: TTMSFNCDataGridCellCoord;
      AData: TTMSFNCDataGridCellValue; var AFormatting: TTMSFNCDataGridDataFormatting;
      var AConvertSettings: TFormatSettings; var ACanFormat: Boolean);
  private
    procedure AddColumnCalculation(const AHeader: string; AMethod: TTMSFNCDataGridDataCalculationMethod);
    procedure AddRowCalculation(const AHeader: string; AMethod: TTMSFNCDataGridDataCalculationMethod);
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

  Self.AddColumnCalculation('SUM', gcmSum);
  Self.AddColumnCalculation('AVG', gcmAverage);
  Self.AddColumnCalculation('MAX', gcmMax);
  Self.AddColumnCalculation('MIN', gcmMin);
  Self.AddColumnCalculation('Count', gcmCount);
  Self.AddColumnCalculation('Distinct', gcmDistinct);
  Self.AddColumnCalculation('StdDeviation', gcmStandardDeviation);

  Self.AddRowCalculation('SUM', gcmSum);
  TMSFNCDataGrid1.UpdateCalculations;
end;

procedure TCalculationsAggregateFunctionsView.AddColumnCalculation(const AHeader: string; AMethod: TTMSFNCDataGridDataCalculationMethod);
begin
  TMSFNCDataGrid1.ColumnCount := Succ(TMSFNCDataGrid1.ColumnCount);
  TMSFNCDataGrid1.FixedRightColumnCount := Succ(TMSFNCDataGrid1.FixedRightColumnCount);

  for var I := 1 to TMSFNCDataGrid1.RowCount do
    TMSFNCDataGrid1.RowCalculations[I, AHeader] := [CreateRowCalculation(AMethod, nil, nil, -1, -1, Pred(TMSFNCDataGrid1.ColumnCount))];

  TMSFNCDataGrid1.Cells[Pred(TMSFNCDataGrid1.ColumnCount), 0] := AHeader;
end;

procedure TCalculationsAggregateFunctionsView.AddRowCalculation(const AHeader: string; AMethod: TTMSFNCDataGridDataCalculationMethod);
begin
  TMSFNCDataGrid1.RowCount := TMSFNCDataGrid1.RowCount + 2;
  TMSFNCDataGrid1.FixedBottomRowCount := 2;

  var LRowTitles := Pred(TMSFNCDataGrid1.RowCount);

  TMSFNCDataGrid1.Cells[0, LRowTitles] := 'SUM';
  TMSFNCDataGrid1.Cells[1, LRowTitles] := 'AVG';
  TMSFNCDataGrid1.Cells[2, LRowTitles] := 'MAX';

  TMSFNCDataGrid1.ColumnCalculations[0, 'SUM'] := [CreateNormalColumnCalculation(gcmSum)];
  TMSFNCDataGrid1.ColumnCalculations[1, 'AVG'] := [CreateNormalColumnCalculation(gcmAverage)];
  TMSFNCDataGrid1.ColumnCalculations[2, 'MAX'] := [CreateNormalColumnCalculation(gcmMax)];
end;

procedure TCalculationsAggregateFunctionsView.TMSFNCDataGrid1AfterCloseInplaceEditor(Sender: TObject;
  ACell: TTMSFNCDataGridCellCoord; ACancel: Boolean; AValue: TTMSFNCDataGridCellValue);
begin
  if ACancel then
    Exit;

  //WHEN VALUE OF A CELL IS CHANGED, THE TOTALS ARE RECALCULATED / QUANDO VALOR DE UMA CELULA E ALTERADO, OS TOTAIS SAO RECALCULADOS
  TMSFNCDataGrid1.UpdateCalculations;
end;

procedure TCalculationsAggregateFunctionsView.TMSFNCDataGrid1GetCellFormatting(Sender: TObject;
  ACell: TTMSFNCDataGridCellCoord; AData: TTMSFNCDataGridCellValue; var AFormatting: TTMSFNCDataGridDataFormatting;
  var AConvertSettings: TFormatSettings; var ACanFormat: Boolean);
begin
  //IGNORE CELLS WITH TITLES IN THE HEADER AND FOOTER
  if (ACell.Row < TMSFNCDataGrid1.FixedRowCount) or (ACell.Row = Pred(TMSFNCDataGrid1.RowCount)) then
    Exit;

  //ENABLE FORMATTING FOR THE REMAINING COLUMNS
  ACanFormat := True;
  AFormatting.&Type := gdftFloat;
  AFormatting.Format := '#,##0.00';
end;

procedure TCalculationsAggregateFunctionsView.TMSFNCDataGrid1GetCellLayout(Sender: TObject; ACell: TTMSFNCDataGridCell);
begin
  ACell.Layout.TextAlign := gtaTrailing;

  //CELLS WITH TITLES IN THE HEADER AND FOOTER
  if (ACell.Row < TMSFNCDataGrid1.FixedRowCount) or (ACell.Row = Pred(TMSFNCDataGrid1.RowCount)) then
  begin
    ACell.Layout.TextAlign := gtaCenter;
    ACell.Layout.Font.Style := [fsBold]
  end;
end;

end.
