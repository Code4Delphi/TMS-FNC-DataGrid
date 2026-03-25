unit DataGrid.Demo01.Main.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.TypInfo,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
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
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  VCL.TMSFNCCustomComponent,
  VCL.TMSFNCBitmapContainer;

type
  TDataGridCellControlsMainView = class(TForm)
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    gBoxConfig: TGroupBox;
    ckURLAutoDetect: TCheckBox;
    ckURLAutoOpen: TCheckBox;
    pnTop: TPanel;
    gBoxColumnCustomized: TGroupBox;
    btnColumnCustomizedButton: TButton;
    btnColumnCustomizedCheckBox: TButton;
    Label2: TLabel;
    cBoxTypeRange: TComboBox;
    btnColumnCustomizedProgressBar: TButton;
    TMSFNCBitmapContainer1: TTMSFNCBitmapContainer;
    btnColumnCustomizedRadioButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ckURLAutoDetectClick(Sender: TObject);
    procedure btnColumnCustomizedButtonClick(Sender: TObject);
    procedure btnColumnCustomizedCheckBoxClick(Sender: TObject);
    procedure cBoxTypeRangeChange(Sender: TObject);
    procedure btnColumnCustomizedProgressBarClick(Sender: TObject);
    procedure TMSFNCDataGrid1GetCellLayout(Sender: TObject; ACell: TTMSFNCDataGridCell);
    procedure TMSFNCDataGrid1GetCellData(Sender: TObject; ACell: TTMSFNCDataGridCellCoord; var AData: TTMSFNCDataGridCellValue);
    procedure btnColumnCustomizedRadioButtonClick(Sender: TObject);
  private
    procedure ConfigDataGrid;
    procedure AddHeaderRows;
    procedure ConfigColumns;
  public

  end;

var
  DataGridCellControlsMainView: TDataGridCellControlsMainView;

implementation

{$R *.dfm}

procedure TDataGridCellControlsMainView.FormCreate(Sender: TObject);
begin
  Self.ConfigDataGrid;
  Self.AddHeaderRows;
  TMSFNCDataGrid1.LoadFromCSVData('../Data/Departments.csv');
  Self.ConfigColumns;
end;

procedure TDataGridCellControlsMainView.ckURLAutoDetectClick(Sender: TObject);
begin
  Self.ConfigDataGrid;
end;

procedure TDataGridCellControlsMainView.ConfigDataGrid;
begin
  TMSFNCDataGrid1.Options.URL.AutoDetect := ckURLAutoDetect.Checked;
  TMSFNCDataGrid1.Options.URL.AutoOpen := ckURLAutoOpen.Checked;
end;

procedure TDataGridCellControlsMainView.AddHeaderRows;
begin
  TMSFNCDataGrid1.ColumnCount := 11;
  TMSFNCDataGrid1.Cells[0, 0] := 'Sequential';
  TMSFNCDataGrid1.Cells[1, 0] := 'ComboBox';
  TMSFNCDataGrid1.Cells[2, 0] := 'Edit';
  TMSFNCDataGrid1.Cells[3, 0] := 'TrackBar';
  TMSFNCDataGrid1.Cells[4, 0] := 'DatePicker';
  TMSFNCDataGrid1.Cells[5, 0] := 'ColorPicker';
  TMSFNCDataGrid1.Cells[6, 0] := 'SpinBox';
  TMSFNCDataGrid1.Cells[7, 0] := 'Status';
  TMSFNCDataGrid1.Cells[8, 0] := 'HTML Editor';
  TMSFNCDataGrid1.Cells[9, 0] := 'Customized';
  TMSFNCDataGrid1.Cells[10, 0] := 'Empty';
end;

procedure TDataGridCellControlsMainView.ConfigColumns;
begin
  //Sequential AutoNumber
  //TMSFNCDataGrid1.Cells[0, 0] := 'Sequential';
  TMSFNCDataGrid1.AutoNumberColumn(0, 1, 1);

  //ComboBox
  //TMSFNCDataGrid1.Cells[1, 0] := 'ComboBox';
  TMSFNCDataGrid1.Columns[1].AddSetting(gcsEditor);
  TMSFNCDataGrid1.Columns[1].AddSetting(gcsEditorItems);
  TMSFNCDataGrid1.Columns[1].Editor := getComboBox;
  TMSFNCDataGrid1.Columns[1].EditorItems.Add('Financial');
  TMSFNCDataGrid1.Columns[1].EditorItems.Add('Human resources');
  TMSFNCDataGrid1.Columns[1].EditorItems.Add('Logistics');
  TMSFNCDataGrid1.Columns[1].EditorItems.Add('Deliveries');

  //TrackBar
  TMSFNCDataGrid1.Columns[3].AddSetting(gcsEditor);
  TMSFNCDataGrid1.Columns[3].Editor := getTrackBar;

  //DatePicker
  TMSFNCDataGrid1.Columns[4].AddSetting(gcsEditor);
  TMSFNCDataGrid1.Columns[4].Editor := getDatePicker;
  TMSFNCDataGrid1.Columns[4].AddSetting(gcsFormatting);
  TMSFNCDataGrid1.Columns[4].Formatting.&Type := gdftDateTime;

  //ColorPicker
  TMSFNCDataGrid1.Columns[5].AddSetting(gcsEditor);
  TMSFNCDataGrid1.Columns[5].Editor := getColorPicker;
  TMSFNCDataGrid1.Columns[5].AddSetting(gcsEditorTarget);
  TMSFNCDataGrid1.Columns[5].EditorTarget := getFillColor;

  //SpinBox
  TMSFNCDataGrid1.Columns[6].AddSetting(gcsEditor);
  TMSFNCDataGrid1.Columns[6].Editor := getSpinBox;

  //HTML Editor
  TMSFNCDataGrid1.Columns[8].AddSetting(gcsEditor);
  TMSFNCDataGrid1.Columns[8].Editor := getHTMLEditor;


  for var I := 1 to Pred(TMSFNCDataGrid1.RowCount) do
  begin
    TMSFNCDataGrid1.Layouts[5, I].Fill.Kind := gfkSolid;
    TMSFNCDataGrid1.Layouts[5, I].Fill.Color := TColor(StrToInt(TMSFNCDataGrid1.Cells[5, I].ToString)); //MakeGraphicsColor(Random(255), Random(255), Random(255)); //$00A87200
  end;
end;

procedure TDataGridCellControlsMainView.TMSFNCDataGrid1GetCellData(Sender: TObject; ACell: TTMSFNCDataGridCellCoord;
  var AData: TTMSFNCDataGridCellValue);
begin
  //IF ROW OR COLUMN IS FIXED
  if ACell.Row >= TMSFNCDataGrid1.FixedRowCount then
  begin
    //IF Status COLUMN
    if ACell.Column = 7 then
      TMSFNCDataGrid1.AddBitmap(ACell.Column, ACell.Row, AData.AsString);
  end;
end;

procedure TDataGridCellControlsMainView.TMSFNCDataGrid1GetCellLayout(Sender: TObject; ACell: TTMSFNCDataGridCell);
begin
  //IF ROW OR COLUMN IS FIXED
  if (ACell.Row < TMSFNCDataGrid1.FixedRowCount) or (ACell.Column < TMSFNCDataGrid1.FixedColumnCount) then
  begin
    ACell.Layout.Font.Color := clHotLight;
    ACell.Layout.Font.Style := [TFontStyle.fsBold];
    Exit;
  end;

  //IF SpinBox COLUMN
  if ACell.Column = 6 then
  begin
    ACell.Layout.Font.Color := clGreen;
    if TMSFNCDataGrid1.Floats[ACell.Column, ACell.Row] < 200 then
      ACell.Layout.Font.Color := clRed
  end;

  //IF Status COLUMN
  if ACell.Column = 7 then
    ACell.Layout.Font.Color := ACell.Layout.Fill.Color;

  //IF Customized COLUMN
  if ACell.Column = 9 then
  begin
    if ACell.IsProgressBarCell then
      ACell.AsProgressBarCell.Value := TMSFNCDataGrid1.Ints[ACell.Column, ACell.Row];
  end;
end;

procedure TDataGridCellControlsMainView.cBoxTypeRangeChange(Sender: TObject);
begin
  TMSFNCDataGrid1.Columns[9].TypeRange := TTMSFNCDataGridCellItemTypeRange(cBoxTypeRange.ItemIndex);
end;

procedure TDataGridCellControlsMainView.btnColumnCustomizedButtonClick(Sender: TObject);
begin
  var LColumn := TMSFNCDataGrid1.Columns[9];
  LColumn.Settings := [gcsType];
  LColumn.&Type := gcitButton;

  LColumn.AddSetting(gcsControlText);
  LColumn.ControlText := 'Edit';

  for var I := 1 to Pred(TMSFNCDataGrid1.RowCount) do
    TMSFNCDataGrid1.Cells[9, I] := '';
end;

procedure TDataGridCellControlsMainView.btnColumnCustomizedCheckBoxClick(Sender: TObject);
begin
  var LColumn := TMSFNCDataGrid1.Columns[9];
  LColumn.AddSetting(gcsType);
  LColumn.&Type := gcitCheckBox;

  LColumn.AddSetting(gcsControlAlign);
  LColumn.ControlAlign := gcaLeft;

  LColumn.AddSetting(gcsControlPosition);
  LColumn.ControlPosition := gcpCenterLeft;

  for var I := 1 to Pred(TMSFNCDataGrid1.RowCount) do
    TMSFNCDataGrid1.Cells[9, I] := 'Active';
end;

procedure TDataGridCellControlsMainView.btnColumnCustomizedRadioButtonClick(Sender: TObject);
begin
  var LColumn := TMSFNCDataGrid1.Columns[9];
  LColumn.AddSetting(gcsType);
  LColumn.&Type := gcitRadioButton;

  for var I := 1 to Pred(TMSFNCDataGrid1.RowCount) do
    TMSFNCDataGrid1.Cells[9, I] := 'Select';
end;

procedure TDataGridCellControlsMainView.btnColumnCustomizedProgressBarClick(Sender: TObject);
begin
  var LColumn := TMSFNCDataGrid1.Columns[9];
  LColumn.Settings := [gcsType];
  LColumn.&Type := gcitDataProgressBar;

  for var I := 1 to Pred(TMSFNCDataGrid1.RowCount) do
    TMSFNCDataGrid1.Cells[9, I] := '';
end;

end.
