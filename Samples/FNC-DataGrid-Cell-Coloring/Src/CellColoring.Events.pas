unit CellColoring.Events;

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
  VCL.TMSFNCDataGrid;

type
  TCellColoringEvents = class(TForm)
    StatusBar1: TStatusBar;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    procedure FormCreate(Sender: TObject);
    procedure TMSFNCDataGrid1GetCellLayout(Sender: TObject; ACell: TTMSFNCDataGridCell);
  private

  public

  end;

var
  CellColoringEvents: TCellColoringEvents;

implementation

{$R *.dfm}

procedure TCellColoringEvents.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  TMSFNCDataGrid1.Clear;
  TMSFNCDataGrid1.LoadFromCSVData('../Data/products.csv');
end;

procedure TCellColoringEvents.TMSFNCDataGrid1GetCellLayout(Sender: TObject; ACell: TTMSFNCDataGridCell);
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
    ACell.Layout.Font.Style := [TFontStyle.fsBold];
    ACell.Layout.Font.Color := clGreen;

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

end.
