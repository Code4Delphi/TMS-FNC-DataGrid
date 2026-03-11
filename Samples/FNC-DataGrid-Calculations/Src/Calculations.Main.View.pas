unit Calculations.Main.View;

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
  Vcl.Dialogs, Vcl.ExtCtrls, VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, System.Rtti,
  VCL.TMSFNCDataGridCell, VCL.TMSFNCDataGridData, VCL.TMSFNCDataGridBase, VCL.TMSFNCDataGridCore,
  VCL.TMSFNCDataGridRenderer, VCL.TMSFNCCustomControl, VCL.TMSFNCDataGrid, Vcl.StdCtrls;

type
  TCalculationsMainView = class(TForm)
    pnTop: TPanel;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    btnCSV: TButton;
    btnOpenXLS: TButton;
    procedure FormCreate(Sender: TObject);
    procedure TMSFNCDataGrid1GetCellLayout(Sender: TObject; ACell: TTMSFNCDataGridCell);
    procedure TMSFNCDataGrid1AfterCloseInplaceEditor(Sender: TObject; ACell: TTMSFNCDataGridCellCoord; ACancel: Boolean;
      AValue: TTMSFNCDataGridCellValue);
    procedure btnCSVClick(Sender: TObject);
    procedure btnOpenXLSClick(Sender: TObject);
  private
    procedure LoadDataCSV;
    procedure ConfigDataGrid;
    procedure ColumnCalculation;
    procedure RowCalculation;
  public

  end;

var
  CalculationsMainView: TCalculationsMainView;

implementation

{$R *.dfm}

procedure TCalculationsMainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := ',';
  Self.ConfigDataGrid;
  Self.LoadDataCSV;
  Self.ColumnCalculation;
  Self.RowCalculation;
end;

procedure TCalculationsMainView.ConfigDataGrid;
begin
  TMSFNCDataGrid1.Options.IO.StartColumn := 0;
  TMSFNCDataGrid1.Options.IO.StartRow := 0;

  TMSFNCDataGrid1.DefaultRowHeight := 40;
  TMSFNCDataGrid1.GlobalFont.Scale := 1.3;

  TMSFNCDataGrid1.Options.Keyboard.TabKeyDirectEdit := True;
  TMSFNCDataGrid1.Options.Keyboard.ArrowKeyDirectEdit := True;
  TMSFNCDataGrid1.Options.Keyboard.EnterKeyDirectEdit := True;

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
end;

procedure TCalculationsMainView.LoadDataCSV;
begin
  TMSFNCDataGrid1.LoadFromCSVData('../Data/Productos.csv');
end;

procedure TCalculationsMainView.TMSFNCDataGrid1AfterCloseInplaceEditor(Sender: TObject; ACell: TTMSFNCDataGridCellCoord;
  ACancel: Boolean; AValue: TTMSFNCDataGridCellValue);
begin
  //WHEN THE VALUE OF A CELL IS CHANGED, THE TOTALS ARE RECALCULATED
  TMSFNCDataGrid1.UpdateCalculations;
end;

procedure TCalculationsMainView.TMSFNCDataGrid1GetCellLayout(Sender: TObject; ACell: TTMSFNCDataGridCell);
begin
  //LAST LINE
  if ACell.Row = Pred(TMSFNCDataGrid1.RowCount) then
  begin
    ACell.Layout.Font.Style := [fsBold];
    ACell.Layout.Fill.Color := gcLightgray;
  end;

  //LAST COLUMN
  if ACell.Column = Pred(TMSFNCDataGrid1.ColumnCount) then
  begin
    ACell.Layout.Font.Style := [fsBold];
    ACell.Layout.Fill.Color := gcLightgray;
  end;

  //ROW OR COLUMN IS FIXED
  if ACell.Row >= TMSFNCDataGrid1.FixedRowCount then
  begin
    //COLUMN 1 ALIGNED TO THE LEFT AND THE REST TO THE RIGHT
    ACell.Layout.TextAlign := gtaTrailing;
    if ACell.Column = 0 then
      ACell.Layout.TextAlign := gtaLeading
  end;
end;

procedure TCalculationsMainView.btnCSVClick(Sender: TObject);
begin
  TMSFNCDataGrid1.SaveToCSVData('Temp.xls');
  TTMSFNCUtils.OpenFile('Temp.xls');
end;

procedure TCalculationsMainView.btnOpenXLSClick(Sender: TObject);
begin
  //
end;

procedure TCalculationsMainView.ColumnCalculation;
begin
  TMSFNCDataGrid1.RowCount := TMSFNCDataGrid1.RowCount + 1;
  TMSFNCDataGrid1.FixedBottomRowCount := 1;

  for var I := 1 to TMSFNCDataGrid1.ColumnCount do
    TMSFNCDataGrid1.ColumnCalculations[I, 'SUM'] := [CreateNormalColumnCalculation(gcmSum)];

  TMSFNCDataGrid1.Cells[0, Pred(TMSFNCDataGrid1.RowCount)] := 'SUM';
  TMSFNCDataGrid1.UpdateCalculations;
end;

procedure TCalculationsMainView.RowCalculation;
begin
  TMSFNCDataGrid1.ColumnCount := TMSFNCDataGrid1.ColumnCount + 1;
  TMSFNCDataGrid1.FixedRightColumnCount := 1;

  for var I := 1 to TMSFNCDataGrid1.RowCount do
    TMSFNCDataGrid1.RowCalculations[I, 'SUM'] := [CreateRowCalculation(gcmSum)];

  TMSFNCDataGrid1.Cells[Pred(TMSFNCDataGrid1.ColumnCount), 0] := 'SUM';
  TMSFNCDataGrid1.UpdateCalculations;
end;

end.
