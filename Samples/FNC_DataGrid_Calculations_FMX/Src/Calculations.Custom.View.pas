unit Calculations.Custom.View;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  Math,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.TMSFNCTypes,
  FMX.TMSFNCUtils,
  FMX.TMSFNCGraphics,
  FMX.TMSFNCGraphicsTypes,
  System.Rtti,
  FMX.TMSFNCDataGridCell,
  FMX.TMSFNCDataGridData,
  FMX.TMSFNCDataGridBase,
  FMX.TMSFNCDataGridCore,
  FMX.TMSFNCDataGridRenderer,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.TMSFNCCustomControl,
  FMX.TMSFNCDataGrid,
  FMX.TMSFNCCustomComponent,
  FMX.TMSFNCBitmapContainer,
  FMX.DateTimeCtrls,
  FMX.TMSFNCCustomPicker,
  FMX.TMSFNCDatePicker;

type
  TCalculationsCustomView = class(TForm)
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    Panel1: TPanel;
    btnColumnSum: TButton;
    btnColumnAVG: TButton;
    btnColumnMax: TButton;
    btnRowCalculations: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnColumnSumClick(Sender: TObject);
    procedure btnColumnAVGClick(Sender: TObject);
    procedure TMSFNCDataGrid1GetCellLayout(Sender: TObject; ACell: TTMSFNCDataGridCell);
    procedure TMSFNCDataGrid1CanEditCell(Sender: TObject; AColumn, ARow: Integer; var ACanEdit: Boolean);
    procedure TMSFNCDataGrid1AfterCloseInplaceEditor(Sender: TObject; ACell: TTMSFNCDataGridCellCoord; ACancel: Boolean;
      AValue: TTMSFNCDataGridCellValue);
    procedure btnColumnMaxClick(Sender: TObject);
    procedure btnRowCalculationsClick(Sender: TObject);
  private
  public
    procedure CalcAutoSize;
  end;

var
  CalculationsCustomView: TCalculationsCustomView;

implementation

{$R *.fmx}


procedure TCalculationsCustomView.FormCreate(Sender: TObject);
begin
  TMSFNCDataGrid1.BeginUpdate;

  TMSFNCDataGrid1.Clear;
  TMSFNCDataGrid1.ColumnCount := 5;
  TMSFNCDataGrid1.FixedColumnCount := 1;
  TMSFNCDataGrid1.RowCount := 8;

  TMSFNCDataGrid1.GlobalFont.Scale := 1.3;
  TMSFNCDataGrid1.Cells[1, 0] := 'Number';
  TMSFNCDataGrid1.Cells[2, 0] := 'Power';
  TMSFNCDataGrid1.Cells[3, 0] := 'Random';
  TMSFNCDataGrid1.Cells[TMSFNCDataGrid1.ColumnCount - 1, 0] := 'Row<BR>Calculations';
  TMSFNCDataGrid1.Cells[0, TMSFNCDataGrid1.RowCount - 1] := 'Column<BR>Calculations';

  for var I := TMSFNCDataGrid1.FixedRowCount to TMSFNCDataGrid1.RowCount - 2 do
  begin
    TMSFNCDataGrid1.Ints[1, I] := I;
    TMSFNCDataGrid1.Floats[2, I] := Power(2, i);
    TMSFNCDataGrid1.Ints[3, I] := Random(100);
  end;

  Self.CalcAutoSize;
  TMSFNCDataGrid1.EndUpdate;
end;

procedure TCalculationsCustomView.CalcAutoSize;
begin
  TMSFNCDataGrid1.AutoSizeRows(gamAllCells, 10);
  TMSFNCDataGrid1.AutoSizeColumns(gamAllCells, 10);
end;

procedure TCalculationsCustomView.TMSFNCDataGrid1AfterCloseInplaceEditor(Sender: TObject;
  ACell: TTMSFNCDataGridCellCoord; ACancel: Boolean; AValue: TTMSFNCDataGridCellValue);
begin
  TMSFNCDataGrid1.UpdateCalculations;
end;

procedure TCalculationsCustomView.TMSFNCDataGrid1CanEditCell(Sender: TObject; AColumn, ARow: Integer; var ACanEdit: Boolean);
begin
  ACanEdit := (AColumn >= TMSFNCDataGrid1.FixedColumnCount) and (AColumn <= TMSFNCDataGrid1.ColumnCount - 2)
    and (ARow >= TMSFNCDataGrid1.FixedRowCount) and (ARow <= TMSFNCDataGrid1.RowCount - 2);
end;

procedure TCalculationsCustomView.TMSFNCDataGrid1GetCellLayout(Sender: TObject; ACell: TTMSFNCDataGridCell);
begin
  ACell.Layout.TextAlign := gtaCenter;
  if (ACell.Row = TMSFNCDataGrid1.RowCount - 1) and (ACell.Column >= TMSFNCDataGrid1.FixedColumnCount)
    and (ACell.Column <= TMSFNCDataGrid1.ColumnCount - 2) then
  begin
    ACell.Layout.Fill.Color := gcSteelblue;
    ACell.Layout.Font.Color := gcWhite;
  end
  else if (ACell.Column = TMSFNCDataGrid1.ColumnCount - 1) and (ACell.Row >= TMSFNCDataGrid1.FixedRowCount)
    and (ACell.Row <= TMSFNCDataGrid1.RowCount - 2) then
  begin
    ACell.Layout.Fill.Color := gcSeagreen;
    ACell.Layout.Font.Color := gcWhite;
  end;
end;

procedure TCalculationsCustomView.btnColumnSumClick(Sender: TObject);
begin
  TMSFNCDataGrid1.ColumnCalculations[1, 'SUM'] :=
    [CreateNormalColumnCalculation(gcmSum,
    procedure(AColumn: Integer; ALevel: Integer; var AOptions: TTMSFNCDataGridDataColumnCalculationOptions) {OPTIONAL: calculation options}
    begin
      AOptions.CalculationFormat := 'SUM: %g';
    end,
    nil, TMSFNCDataGrid1.FixedRowCount, TMSFNCDataGrid1.RowCount - 2, TMSFNCDataGrid1.RowCount - 1)];

  Self.CalcAutoSize;
end;

procedure TCalculationsCustomView.btnColumnAVGClick(Sender: TObject);
begin
  TMSFNCDataGrid1.ColumnCalculations[2, 'AVG'] := [CreateNormalColumnCalculation(gcmAverage ,
    procedure(AColumn: Integer; ALevel: Integer; var AOptions: TTMSFNCDataGridDataColumnCalculationOptions) {OPTIONAL: calculation options}
    begin
      AOptions.CalculationFormat := 'AVERAGE: %g';
    end,
    nil, TMSFNCDataGrid1.FixedRowCount, TMSFNCDataGrid1.RowCount - 2, TMSFNCDataGrid1.RowCount - 1)];

  Self.CalcAutoSize;
end;

procedure TCalculationsCustomView.btnColumnMaxClick(Sender: TObject);
begin
  TMSFNCDataGrid1.ColumnCalculations[3, 'MAX'] := [CreateNormalColumnCalculation(gcmMax ,
  procedure(AColumn: Integer; ALevel: Integer; var AOptions: TTMSFNCDataGridDataColumnCalculationOptions) {OPTIONAL: calculation options}
  begin
    AOptions.CalculationFormat := 'MAX: %g';
  end,
  nil, TMSFNCDataGrid1.FixedRowCount, TMSFNCDataGrid1.RowCount - 2, TMSFNCDataGrid1.RowCount - 1)];

  Self.CalcAutoSize;
end;

procedure TCalculationsCustomView.btnRowCalculationsClick(Sender: TObject);
var
  LOptionsCallback: TTMSFNCDataGridDataGetRowCalculationOptionsCallback;
  LColStart: Integer;
  LColEnd: Integer;
  LColOut: Integer;
begin
  LOptionsCallback :=
    procedure(ARow: Integer; var AOptions: TTMSFNCDataGridDataRowCalculationOptions)
    begin
      case ARow of
        1: AOptions.CalculationFormat := 'SUM: %g';
        2: AOptions.CalculationFormat := 'COUNT: %g';
        3: AOptions.CalculationFormat := 'AVERAGE: %.2f';
        4: AOptions.CalculationFormat := 'MIN: %g';
        5: AOptions.CalculationFormat := 'MAX: %g';
        6: AOptions.CalculationFormat := 'CUSTOM (SUM / MAX): %.2f';
      end;
    end;

  LColStart := TMSFNCDataGrid1.FixedColumnCount;
  LColEnd := TMSFNCDataGrid1.ColumnCount - 2;
  LColOut := TMSFNCDataGrid1.ColumnCount - 1;

  TMSFNCDataGrid1.RowCalculations[1, 'SUM'] := [CreateRowCalculation(gcmSum , LOptionsCallback, nil, LColStart, LColEnd, LColOut)];
  TMSFNCDataGrid1.RowCalculations[2, 'COUNT'] := [CreateRowCalculation(gcmCount , LOptionsCallback, nil, LColStart, LColEnd, LColOut)];
  TMSFNCDataGrid1.RowCalculations[3, 'AVERAGE'] := [CreateRowCalculation(gcmAverage , LOptionsCallback, nil, LColStart, LColEnd, LColOut)];
  TMSFNCDataGrid1.RowCalculations[4, 'MIN'] := [CreateRowCalculation(gcmMin , LOptionsCallback, nil, LColStart, LColEnd, LColOut)];
  TMSFNCDataGrid1.RowCalculations[5, 'MAX'] := [CreateRowCalculation(gcmMax , LOptionsCallback, nil, LColStart, LColEnd, LColOut)];

  TMSFNCDataGrid1.RowCalculations[6, 'CUSTOM'] := [CreateRowCalculation(gcmCustom , LOptionsCallback,
    function(ARow, AFromColumn, AToColumn: Integer): Double
    begin
      Result := TMSFNCDataGrid1.RowSum(ARow, AFromColumn, AToColumn) / TMSFNCDataGrid1.RowMax(ARow, AFromColumn, AToColumn);
    end, LColStart, LColEnd, LColOut)];

  Self.CalcAutoSize;
end;

end.
