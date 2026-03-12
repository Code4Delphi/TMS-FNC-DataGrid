unit Calculations.AggregateFunctions.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes, System.Rtti, VCL.TMSFNCDataGridCell, VCL.TMSFNCDataGridData, VCL.TMSFNCDataGridBase,
  VCL.TMSFNCDataGridCore, VCL.TMSFNCDataGridRenderer, VCL.TMSFNCCustomControl, VCL.TMSFNCDataGrid;

type
  TCalculationsAggregateFunctionsView = class(TForm)
    pnTop: TPanel;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    procedure TMSFNCDataGrid1CanEditCell(Sender: TObject; AColumn, ARow: Integer; var ACanEdit: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    procedure ColumnCalculation;
    procedure RowCalculation;

  public

  end;

var
  CalculationsAggregateFunctionsView: TCalculationsAggregateFunctionsView;

implementation

{$R *.dfm}

procedure TCalculationsAggregateFunctionsView.FormCreate(Sender: TObject);
begin
  TMSFNCDataGrid1.LoadFromCSVData('../Data/AggregateFunctions.csv');
  Self.ColumnCalculation;
  //Self.RowCalculation;
end;

procedure TCalculationsAggregateFunctionsView.TMSFNCDataGrid1CanEditCell(Sender: TObject; AColumn, ARow: Integer;
  var ACanEdit: Boolean);
begin
  ACanEdit := (AColumn >= TMSFNCDataGrid1.FixedColumnCount) and (AColumn <= TMSFNCDataGrid1.ColumnCount - 2)
    and (ARow >= TMSFNCDataGrid1.FixedRowCount) and (ARow <= TMSFNCDataGrid1.RowCount - 2);
end;

procedure TCalculationsAggregateFunctionsView.ColumnCalculation;
begin
  TMSFNCDataGrid1.ColumnCount := TMSFNCDataGrid1.ColumnCount + 1;
  TMSFNCDataGrid1.FixedRightColumnCount := 1;

  for var I := 1 to TMSFNCDataGrid1.RowCount do
    TMSFNCDataGrid1.RowCalculations[I, 'SUM'] := [CreateRowCalculation(gcmSum)];

  TMSFNCDataGrid1.Cells[Pred(TMSFNCDataGrid1.ColumnCount), 0] := 'Sum Row';
end;

procedure TCalculationsAggregateFunctionsView.RowCalculation;
begin
  TMSFNCDataGrid1.RowCount := TMSFNCDataGrid1.RowCount + 1;
  TMSFNCDataGrid1.FixedBottomRowCount := 1;

  for var I := 1 to TMSFNCDataGrid1.ColumnCount do
    TMSFNCDataGrid1.ColumnCalculations[I, 'SUM'] := [CreateNormalColumnCalculation(gcmSum)];

  TMSFNCDataGrid1.Cells[0, Pred(TMSFNCDataGrid1.RowCount)] := 'Sum Col';
end;

end.
