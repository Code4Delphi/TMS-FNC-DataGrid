unit Cell.Formatting.View;

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
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  VCL.TMSFNCCustomComponent,
  VCL.TMSFNCDataGridDatabaseAdapter,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.Comp.UI,
  Vcl.Buttons,
  Vcl.ComCtrls, VCL.TMSFNCBitmapContainer;

type
  TCellFormattingView = class(TForm)
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    procedure FormCreate(Sender: TObject);
    procedure TMSFNCDataGrid1GetCellFormatting(Sender: TObject; ACell: TTMSFNCDataGridCellCoord;
      AData: TTMSFNCDataGridCellValue; var AFormatting: TTMSFNCDataGridDataFormatting;
      var AConvertSettings: TFormatSettings; var ACanFormat: Boolean);
  private

  public
  end;

var
  CellFormattingView: TCellFormattingView;

implementation

{$R *.dfm}

procedure TCellFormattingView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';

  TMSFNCDataGrid1.Clear;
  TMSFNCDataGrid1.LoadFromCSVData('../Data/products.csv');
end;

procedure TCellFormattingView.TMSFNCDataGrid1GetCellFormatting(Sender: TObject; ACell: TTMSFNCDataGridCellCoord;
  AData: TTMSFNCDataGridCellValue; var AFormatting: TTMSFNCDataGridDataFormatting;
  var AConvertSettings: TFormatSettings; var ACanFormat: Boolean);
begin
  //IF ROW OR COLUMN IS FIXED
  if (ACell.Row < TMSFNCDataGrid1.FixedRowCount) or (ACell.Column < TMSFNCDataGrid1.FixedColumnCount) then
    Exit;

  ACanFormat := True;

  //FORMAT INTEGER
  if ACell.Column = 0 then
  begin
    AFormatting.Format := '000000';
    AFormatting.&Type := gdftNumber;
  end;

  //FORMAT DATE
  if ACell.Column = 2 then
  begin
    AFormatting.Format := 'dd/mm/yyyy';
    AFormatting.&Type := gdftDate;
    AConvertSettings.ShortDateFormat := 'dd/mm/yyyy';
    AConvertSettings.DateSeparator := '/';
  end;

  //FORMAT TIME
  if ACell.Column = 3 then
  begin
    AFormatting.Format := 'hh:nn:ss';
    AFormatting.&Type := gdftTime;
    AConvertSettings.TimeSeparator := ':';
  end;

  //FORMAT FLOAT
  if ACell.Column = 4 then
  begin
    AFormatting.Format := '#,##0.00';
    AFormatting.&Type := gdftFloat;
    AConvertSettings.CurrencyString := '$';
    AConvertSettings.DecimalSeparator := '.';
    AConvertSettings.ThousandSeparator := ',';
  end;

  //FORMAT FLOAT
  if ACell.Column = 5 then
  begin
    //AFormatting.Format := '%.2f';
    AFormatting.Format := '%' + FormatSettings.DecimalSeparator + '2f';
    AFormatting.&Type := gdftNumber;
  end;

  //FORMAT AS BOOLEAN WITH CUSTOM TRUE/FALSE TEXT
  if ACell.Column = 6 then
  begin
    AFormatting.&Type := gdftBoolean;
    AFormatting.BooleanTrueText := 'Open';
    AFormatting.BooleanFalseText := 'Closed';
  end;

  //FORMAT PERCENTAGE
  if ACell.Column = 7 then
  begin
    AFormatting.Format := '0.00 %';
    AFormatting.&Type := gdftFloat;
    AConvertSettings.DecimalSeparator := '.';
  end;
end;

end.
