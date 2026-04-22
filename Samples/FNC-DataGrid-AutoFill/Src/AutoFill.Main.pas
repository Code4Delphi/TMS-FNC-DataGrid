unit AutoFill.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  VCL.Graphics,
  VCL.Controls,
  VCL.Forms,
  VCL.Dialogs,
  VCL.StdCtrls,
  VCL.ExtCtrls,
  VCL.TMSFNCCustomControl,
  VCL.TMSFNCCustomScrollControl,
  VCL.TMSFNCDataGridData,
  VCL.TMSFNCCustomGrid,
  VCL.TMSFNCDataGrid,
  VCL.TMSFNCDataGridCell,
  VCL.TMSFNCTypes,
  VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes,
  VCL.TMSFNCDataGridBase,
  VCL.TMSFNCDataGridCore,
  VCL.TMSFNCDataGridRenderer,
  System.Rtti;

type
  TAutoFillMain = class(TForm)
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    btnResetData: TButton;
    btnFillNumbers: TButton;
    btnFillDates: TButton;
    lbInstructions: TLabel;
    btnExportCSV: TButton;
    btnFilITimes: TButton;
    btnFillLetters: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnResetDataClick(Sender: TObject);
    procedure btnFillNumbersClick(Sender: TObject);
    procedure btnFillDatesClick(Sender: TObject);
    procedure TMSFNCDataGrid1AutoFillGetCustomList(Sender: TObject; BaseValue: string; var Values: TArray<string>;
      var Handled: Boolean);
    procedure TMSFNCDataGrid1AutoFillCalculateValue(Sender: TObject; SourceCells: TTMSFNCDataGridCellCoordRange;
      SourceValues: TTMSFNCDataGridDataValues; TargetCells: TTMSFNCDataGridCellCoordRange; FillIndex: Integer;
      Direction: TTMSFNCDataGridDataAutoFillDirection;  var NewValue: TTMSFNCDataGridCellValue; var Handled: Boolean);
    procedure btnExportCSVClick(Sender: TObject);
    procedure btnFilITimesClick(Sender: TObject);
    procedure btnFillLettersClick(Sender: TObject);
  private
    procedure ConfigDataGrid;
    procedure SetupCustomLists;
    procedure LoadData;
  public
  end;

var
  AutoFillMain: TAutoFillMain;

implementation

{$R *.dfm}

procedure TAutoFillMain.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  Self.ConfigDataGrid;
  Self.SetupCustomLists;
  Self.LoadData;
end;

procedure TAutoFillMain.ConfigDataGrid;
begin
  TMSFNCDataGrid1.Options.Selection.Mode := gsmCellRange;
  TMSFNCDataGrid1.Options.Selection.AutoFill := True;

  TMSFNCDataGrid1.Options.Column.Stretching.Enabled := True;

  //TMSFNCDataGrid1.OnAutoFillGetCustomList := TMSFNCDataGrid1AutoFillGetCustomList;
  //TMSFNCDataGrid1.OnAutoFillCalculateValue := TMSFNCDataGrid1AutoFillCalculateValue;
end;

procedure TAutoFillMain.btnResetDataClick(Sender: TObject);
begin
  Self.LoadData;
end;

procedure TAutoFillMain.LoadData;
begin
  TMSFNCDataGrid1.Clear;
  TMSFNCDataGrid1.LoadFromCSVData('..\Data\Data.csv');
  TMSFNCDataGrid1.ColumnCount := 9;
  TMSFNCDataGrid1.RowCount := 20;
  TMSFNCDataGrid1.FixedRowCount := 1;
  TMSFNCDataGrid1.FixedColumnCount := 0;
end;

procedure TAutoFillMain.SetupCustomLists;
begin
  TMSFNCDataGrid1.AutoFillCustomListSet('StatusList', ['TODO', 'In Progress', 'Review', 'Done']);
  TMSFNCDataGrid1.AutoFillCustomListSet('PriorityList', ['Low', 'Medium', 'High', 'Critical']);
  //TMSFNCDataGrid1.AutoFillCustomListSet('TestList', ['Ruim', 'Bom', 'Ótimo', 'Excelente']);
end;

procedure TAutoFillMain.btnFillNumbersClick(Sender: TObject);
begin
  // AutoFill from Source range to Target range
  // Source: cells (0,1) to (0,2) containing seed values
  // Target: cells (0,1) to (0,19) where values will be filled
  // MakeCell(Column, Row)
  TMSFNCDataGrid1.AutoFill(
    MakeCell(0, 1),   // Source start
    MakeCell(0, 2),   // Source end
    MakeCell(0, 1),   // Target start
    MakeCell(0, 19)); // Target end
end;

procedure TAutoFillMain.btnFillDatesClick(Sender: TObject);
begin
  TMSFNCDataGrid1.AutoFill(
    MakeCell(2, 1),   // Source start
    MakeCell(2, 2),   // Source end
    MakeCell(2, 1),   // Target start
    MakeCell(2, 19)); // Target end
end;

procedure TAutoFillMain.btnFilITimesClick(Sender: TObject);
begin
   TMSFNCDataGrid1.AutoFill(
    MakeCell(3, 1),   // Source start
    MakeCell(3, 2),   // Source end
    MakeCell(3, 1),   // Target start
    MakeCell(3, 19)); // Target end
end;

procedure TAutoFillMain.btnFillLettersClick(Sender: TObject);
begin
  TMSFNCDataGrid1.AutoFill(MakeCell(8, 1), MakeCell(8, 2), MakeCell(8, 1),  MakeCell(8, 19));
end;

procedure TAutoFillMain.TMSFNCDataGrid1AutoFillGetCustomList(Sender: TObject; BaseValue: string;
  var Values: TArray<string>; var Handled: Boolean);
begin
  //Enter one of these words in the grid and drag it / Escreva uma dessas palavras na grid e arraste
  if SameText(BaseValue, 'Sales') or SameText(BaseValue, 'Marketing') or
     SameText(BaseValue, 'Engineering') or SameText(BaseValue, 'Support') or
     SameText(BaseValue, 'HR') then
  begin
    Values := TArray<string>.Create('Sales', 'Marketing', 'Engineering', 'Support', 'HR');
    Handled := True;
  end;
end;

procedure TAutoFillMain.TMSFNCDataGrid1AutoFillCalculateValue(Sender: TObject; SourceCells: TTMSFNCDataGridCellCoordRange;
  SourceValues: TTMSFNCDataGridDataValues;  TargetCells: TTMSFNCDataGridCellCoordRange; FillIndex: Integer;
  Direction: TTMSFNCDataGridDataAutoFillDirection;  var NewValue: TTMSFNCDataGridCellValue; var Handled: Boolean);
var
  i: Integer;
  LAllSingleLetters: Boolean;
  LStep: Integer;
  LLastChar: Char;
  LNewChar: Integer;
  LValueStr: string;
begin
  //Custom Value Calculation / Cálculo de Valor Personalizado
  Handled := False;

  if Length(SourceValues) < 2 then
    Exit;

  LAllSingleLetters := True;
  for i := 0 to High(SourceValues) do
  begin
    LValueStr := TTMSFNCDataGridData.ValueToString(SourceValues[i]);
    if (LValueStr.Length <> 1) or not CharInSet(LValueStr[1], ['a'..'z']) then
    begin
      LAllSingleLetters := False;
      Break;
    end;
  end;

  if not LAllSingleLetters then
    Exit;

  LStep := Ord(TTMSFNCDataGridData.ValueToString(SourceValues[1])[1]) - Ord(TTMSFNCDataGridData.ValueToString(SourceValues[0])[1]);

  LLastChar := TTMSFNCDataGridData.ValueToString(SourceValues[High(SourceValues)])[1];
  LNewChar := Ord(LLastChar) + (FillIndex * LStep);

  if LNewChar > Ord('z') then
    LNewChar := Ord('a') + ((LNewChar - Ord('a')) mod 26)
  else if LNewChar < Ord('a') then
    LNewChar := Ord('z') - ((Ord('a') - LNewChar - 1) mod 26);

  NewValue := Char(LNewChar);
  Handled := True;
end;

procedure TAutoFillMain.btnExportCSVClick(Sender: TObject);
begin
  TMSFNCDataGrid1.Options.IO.Delimiter := ',';
  TMSFNCDataGrid1.SaveToCSVData('C:\Temp\DelphiAIDev\Dados.csv');
end;

end.
