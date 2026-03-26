unit DataGrid.CellControls.Main.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.TypInfo,
  System.Math,
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
  VCL.TMSFNCBitmapContainer, Vcl.ComCtrls;

type
  TDataGridCellControlsMainView = class(TForm)
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    gBoxConfig: TGroupBox;
    ckURLAutoDetect: TCheckBox;
    ckURLAutoOpen: TCheckBox;
    pnTop: TPanel;
    gBoxColumnCustomized: TGroupBox;
    btnCustomized1Button: TButton;
    btnCustomized1CheckBox: TButton;
    Label2: TLabel;
    cBoxTypeRange: TComboBox;
    btnCustomized1ProgressBar: TButton;
    TMSFNCBitmapContainer1: TTMSFNCBitmapContainer;
    btnCustomized1RadioButton: TButton;
    GroupBox1: TGroupBox;
    mmLog: TMemo;
    GroupBox2: TGroupBox;
    btnCustomized2Button: TButton;
    btnCustomized2CheckBox: TButton;
    btnCustomized2ProgressBar: TButton;
    btnCustomized2RadioButton: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    btnCustomized2Custom: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    edtValueColumnEdit: TEdit;
    Memo1: TMemo;
    btnGetEdtValueColumn: TButton;
    btnCustomized2Subgrid: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ckURLAutoDetectClick(Sender: TObject);
    procedure btnCustomized1ButtonClick(Sender: TObject);
    procedure btnCustomized1CheckBoxClick(Sender: TObject);
    procedure cBoxTypeRangeChange(Sender: TObject);
    procedure btnCustomized1ProgressBarClick(Sender: TObject);
    procedure TMSFNCDataGrid1GetCellLayout(Sender: TObject; ACell: TTMSFNCDataGridCell);
    procedure TMSFNCDataGrid1GetCellData(Sender: TObject; ACell: TTMSFNCDataGridCellCoord; var AData: TTMSFNCDataGridCellValue);
    procedure btnCustomized1RadioButtonClick(Sender: TObject);
    procedure TMSFNCDataGrid1CellButtonClick(Sender: TObject; AColumn, ARow: Integer);
    procedure TMSFNCDataGrid1CellCheckBoxChange(Sender: TObject; AColumn, ARow: Integer);
    procedure TMSFNCDataGrid1CellRadioButtonChange(Sender: TObject; AColumn, ARow: Integer);
    procedure btnCustomized2ButtonClick(Sender: TObject);
    procedure btnCustomized2CheckBoxClick(Sender: TObject);
    procedure btnCustomized2ProgressBarClick(Sender: TObject);
    procedure btnCustomized2RadioButtonClick(Sender: TObject);
    procedure btnCustomized2CustomClick(Sender: TObject);
    procedure btnGetEdtValueColumnClick(Sender: TObject);
    procedure btnCustomized2SubgridClick(Sender: TObject);
  private
    FCustomizedColumn1: TTMSFNCDataGridColumn;
    FCustomizedColumn2: TTMSFNCDataGridColumn;
    procedure ConfigDataGrid;
    procedure ConfigColumns;
    procedure LoadStatusBitmaps;
    procedure AddExtraColumns;
  public

  end;

var
  DataGridCellControlsMainView: TDataGridCellControlsMainView;

implementation

{$R *.dfm}

procedure TDataGridCellControlsMainView.FormCreate(Sender: TObject);
begin
  TMSFNCDataGrid1.Clear;
  TMSFNCDataGrid1.LoadFromCSVData('../Data/Departments.csv');
  Self.AddExtraColumns;
  Self.ConfigColumns;
  Self.LoadStatusBitmaps;
  Self.ConfigDataGrid;
end;

procedure TDataGridCellControlsMainView.ckURLAutoDetectClick(Sender: TObject);
begin
  Self.ConfigDataGrid;
end;

procedure TDataGridCellControlsMainView.ConfigDataGrid;
begin
  TMSFNCDataGrid1.BeginUpdate;
  TMSFNCDataGrid1.DefaultColumnWidth := 100;

  TMSFNCDataGrid1.Options.URL.AutoDetect := ckURLAutoDetect.Checked;
  TMSFNCDataGrid1.Options.URL.AutoOpen := ckURLAutoOpen.Checked;

  TMSFNCDataGrid1.Options.Mouse.ColumnSizing := True;
  TMSFNCDataGrid1.Options.Mouse.FixedColumnSizing := True;
  TMSFNCDataGrid1.Options.Mouse.ColumnSizingMode := gszmOneSided;
  TMSFNCDataGrid1.Options.Mouse.ColumnDragging := True;

  TMSFNCDataGrid1.Options.Column.Stretching.Enabled := True;
  TMSFNCDataGrid1.Options.Column.Stretching.Mode := gstmIndex;
  TMSFNCDataGrid1.EndUpdate;
end;

procedure TDataGridCellControlsMainView.AddExtraColumns;
begin
  TMSFNCDataGrid1.ColumnCount := TMSFNCDataGrid1.ColumnCount + 1;
  FCustomizedColumn1 := TMSFNCDataGrid1.Columns[Pred(TMSFNCDataGrid1.ColumnCount)];
  FCustomizedColumn1.Header := 'Customized 1';

  TMSFNCDataGrid1.ColumnCount := TMSFNCDataGrid1.ColumnCount + 1;
  FCustomizedColumn2 := TMSFNCDataGrid1.Columns[Pred(TMSFNCDataGrid1.ColumnCount)];
  FCustomizedColumn2.Header := 'Customized 2';
  //TMSFNCDataGrid1.Cells[8, 0] := 'Customized';
end;

procedure TDataGridCellControlsMainView.ConfigColumns;
var
  LColumn: TTMSFNCDataGridColumn;
begin
  //ComboBox
  //TMSFNCDataGrid1.Cells[1, 0] := 'ComboBox';
  LColumn := TMSFNCDataGrid1.Columns[TMSFNCDataGrid1.ColumnIndexByHeader('ComboBox')];
  LColumn.AddSetting(gcsEditor);
  LColumn.AddSetting(gcsEditor);
  LColumn.AddSetting(gcsEditorItems);
  LColumn.Editor := getComboBox;
  LColumn.EditorItems.Add('Financial');
  LColumn.EditorItems.Add('Human resources');
  LColumn.EditorItems.Add('Logistics');
  LColumn.EditorItems.Add('Deliveries');

  //TrackBar
  LColumn := TMSFNCDataGrid1.Columns[TMSFNCDataGrid1.ColumnIndexByHeader('TrackBar')];
  LColumn.AddSetting(gcsEditor);
  LColumn.Editor := getTrackBar;

  //DatePicker
  LColumn := TMSFNCDataGrid1.Columns[TMSFNCDataGrid1.ColumnIndexByHeader('DatePicker')];
  LColumn.AddSetting(gcsEditor);
  LColumn.Editor := getDatePicker;
  LColumn.AddSetting(gcsFormatting);
  LColumn.Formatting.&Type := gdftDateTime;

  //ColorPicker
  LColumn := TMSFNCDataGrid1.Columns[TMSFNCDataGrid1.ColumnIndexByHeader('ColorPicker')];
  LColumn.AddSetting(gcsEditor);
  LColumn.Editor := getColorPicker;
  LColumn.AddSetting(gcsEditorTarget);
  LColumn.EditorTarget := getFillColor;

  //SpinBox
  LColumn := TMSFNCDataGrid1.Columns[TMSFNCDataGrid1.ColumnIndexByHeader('SpinBox')];
  LColumn.AddSetting(gcsEditor);
  LColumn.Editor := getSpinBox;

  //HTML Editor
  LColumn := TMSFNCDataGrid1.Columns[TMSFNCDataGrid1.ColumnIndexByHeader('HTML Editor')];
  LColumn.AddSetting(gcsEditor);
  LColumn.Editor := getHTMLEditor;

  for var I := 1 to Pred(TMSFNCDataGrid1.RowCount) do
  begin
    var LIndex := TMSFNCDataGrid1.ColumnIndexByHeader('ColorPicker');
    TMSFNCDataGrid1.Layouts[LIndex, I].Fill.Kind := gfkSolid;
    TMSFNCDataGrid1.Layouts[LIndex, I].Fill.Color := TColor(StrToInt(TMSFNCDataGrid1.Cells[LIndex, I].ToString)); //MakeGraphicsColor(Random(255), Random(255), Random(255)); //$00A87200
  end;
end;

procedure TDataGridCellControlsMainView.TMSFNCDataGrid1CellButtonClick(Sender: TObject; AColumn, ARow: Integer);
begin
  mmLog.Lines.Add(Format('CellButtonClick. Column %d Row %d', [AColumn, ARow]));
end;

procedure TDataGridCellControlsMainView.TMSFNCDataGrid1CellCheckBoxChange(Sender: TObject; AColumn, ARow: Integer);
begin
  mmLog.Lines.Add(Format('CellCheckBoxChange. Column %d Row %d', [AColumn, ARow]));
end;

procedure TDataGridCellControlsMainView.TMSFNCDataGrid1CellRadioButtonChange(Sender: TObject; AColumn, ARow: Integer);
begin
  mmLog.Lines.Add(Format('CellRadioButtonChange. Column %d Row %d', [AColumn, ARow]));
end;

procedure TDataGridCellControlsMainView.TMSFNCDataGrid1GetCellData(Sender: TObject; ACell: TTMSFNCDataGridCellCoord;
  var AData: TTMSFNCDataGridCellValue);
begin
//
//  //IF ROW OR COLUMN IS FIXED
//  if ACell.Row >= TMSFNCDataGrid1.FixedRowCount then
//  begin
//    //IF Status COLUMN
//    if ACell.Column = TMSFNCDataGrid1.ColumnIndexByHeader('Status') then
//    begin
//      //var LValue: string;
//      //LValue := TMSFNCDataGrid1.Cells[ACell.Column, ACell.Row].AsString;
//
//      TMSFNCDataGrid1.AddBitmap(ACell.Column, ACell.Row, 'True'); //AData.AsString
//
//      //TMSFNCDataGrid1.AddBitmap(ACell.Column, ACell.Row, TMSFNCBitmapContainer1.Bitmaps[R]);
//    end;
//  end;
end;

procedure TDataGridCellControlsMainView.TMSFNCDataGrid1GetCellLayout(Sender: TObject; ACell: TTMSFNCDataGridCell);
begin
//  //IF ROW OR COLUMN IS FIXED
//  if ACell.Row >= TMSFNCDataGrid1.FixedRowCount then
//  begin
//    //IF Status COLUMN
//    if ACell.Column = TMSFNCDataGrid1.ColumnIndexByHeader('Status') then
//    begin
//      var LValue: string;
//      LValue := TMSFNCDataGrid1.Cells[ACell.Column, ACell.Row].AsString;
//      //TMSFNCDataGrid1.AddBitmap(ACell.Column, ACell.Row, 'True'); //AData.AsString
//    end;
//  end;

{  //IF ROW OR COLUMN IS FIXED
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
  end;}
end;

procedure TDataGridCellControlsMainView.cBoxTypeRangeChange(Sender: TObject);
begin
  FCustomizedColumn1.TypeRange := TTMSFNCDataGridCellItemTypeRange(cBoxTypeRange.ItemIndex);
end;

procedure TDataGridCellControlsMainView.btnCustomized1ButtonClick(Sender: TObject);
begin
  FCustomizedColumn1.Settings := [gcsType];
  FCustomizedColumn1.&Type := gcitButton;

  FCustomizedColumn1.AddSetting(gcsControlText);
  FCustomizedColumn1.ControlText := 'Edit';

  for var I := 1 to Pred(TMSFNCDataGrid1.RowCount) do
    TMSFNCDataGrid1.Cells[FCustomizedColumn1.Index, I] := '';
end;

procedure TDataGridCellControlsMainView.btnCustomized1CheckBoxClick(Sender: TObject);
begin
  FCustomizedColumn1.AddSetting(gcsType);
  FCustomizedColumn1.&Type := gcitCheckBox;

  FCustomizedColumn1.AddSetting(gcsControlAlign);
  FCustomizedColumn1.ControlAlign := gcaLeft;

  FCustomizedColumn1.AddSetting(gcsControlPosition);
  FCustomizedColumn1.ControlPosition := gcpCenterLeft;

  for var I := 1 to Pred(TMSFNCDataGrid1.RowCount) do
    TMSFNCDataGrid1.Cells[FCustomizedColumn1.Index, I] := 'Active';
end;

procedure TDataGridCellControlsMainView.btnCustomized1RadioButtonClick(Sender: TObject);
begin
  FCustomizedColumn1.AddSetting(gcsType);
  FCustomizedColumn1.&Type := gcitRadioButton;

  for var I := 1 to Pred(TMSFNCDataGrid1.RowCount) do
    TMSFNCDataGrid1.Cells[FCustomizedColumn1.Index, I] := 'Select';
end;

procedure TDataGridCellControlsMainView.btnCustomized1ProgressBarClick(Sender: TObject);
begin
  FCustomizedColumn1.Settings := [gcsType];
  FCustomizedColumn1.&Type := gcitDataProgressBar;

  for var I := 1 to Pred(TMSFNCDataGrid1.RowCount) do
    TMSFNCDataGrid1.Cells[FCustomizedColumn1.Index, I] := Random(100);
end;

procedure TDataGridCellControlsMainView.btnCustomized2ButtonClick(Sender: TObject);
begin
  TMSFNCDataGrid1.AddButtonColumn(FCustomizedColumn2.Index, 'Click Me');
  for var I := 1 to pred(TMSFNCDataGrid1.RowCount) do
    TMSFNCDataGrid1.ControlPositions[FCustomizedColumn2.Index, I] := gcpCenterCenter;
end;

procedure TDataGridCellControlsMainView.btnCustomized2CheckBoxClick(Sender: TObject);
begin
  TMSFNCDataGrid1.AddDataCheckBoxColumn(FCustomizedColumn2.Index);
  for var I := 1 to Pred(TMSFNCDataGrid1.RowCount) do
    TMSFNCDataGrid1.Cells[FCustomizedColumn2.Index, I] := Boolean(RandomRange(-1, 1));
end;

procedure TDataGridCellControlsMainView.btnCustomized2ProgressBarClick(Sender: TObject);
begin
  TMSFNCDataGrid1.AddDataProgressBarColumn(FCustomizedColumn2.Index);
  for var I := 1 to Pred(TMSFNCDataGrid1.RowCount) do
    TMSFNCDataGrid1.Cells[FCustomizedColumn2.Index, I] := Random(100);
end;

procedure TDataGridCellControlsMainView.btnCustomized2RadioButtonClick(Sender: TObject);
begin
  TMSFNCDataGrid1.AddDataRadioButtonColumn(FCustomizedColumn2.Index);
  TMSFNCDataGrid1.Cells[FCustomizedColumn2.Index, 1] := True;
  for var I := 1 to Pred(TMSFNCDataGrid1.RowCount) do
    TMSFNCDataGrid1.Cells[FCustomizedColumn2.Index, I] := False;
end;

procedure TDataGridCellControlsMainView.LoadStatusBitmaps;
var
  LRow: Integer;
  LColStatus: Integer;
  LStatus: string;
begin
  LColStatus := TMSFNCDataGrid1.ColumnIndexByHeader('Status');

  for LRow := TMSFNCDataGrid1.FixedRowCount to Pred(TMSFNCDataGrid1.RowCount) do
  begin
    LStatus := TMSFNCDataGrid1.ValueToString(TMSFNCDataGrid1.Cells[LColStatus, LRow]);

    if LStatus = 'True' then
      TMSFNCDataGrid1.AddBitmap(LColStatus, LRow, 'True')
    else
      TMSFNCDataGrid1.AddBitmap(LColStatus, LRow, 'False');
  end;
end;

procedure TDataGridCellControlsMainView.btnGetEdtValueColumnClick(Sender: TObject);
var
  LRow: Integer;
  LColEdit: Integer;
begin
  LRow := TButton(Sender).Tag;
  LColEdit := TMSFNCDataGrid1.ColumnIndexByHeader('Edit');

  if LRow >= TMSFNCDataGrid1.FixedRowCount then
    ShowMessage(TMSFNCDataGrid1.ValueToString(TMSFNCDataGrid1.Cells[LColEdit, LRow]));
end;

procedure TDataGridCellControlsMainView.btnCustomized2CustomClick(Sender: TObject);
const
  ROW = 2;
begin
  PageControl1.Visible := True;
  btnGetEdtValueColumn.Tag := ROW;
  TMSFNCDataGrid1.Controls[FCustomizedColumn2.Index, ROW] := PageControl1;
  TMSFNCDataGrid1.AutoSizeRow(ROW);
  TMSFNCDataGrid1.AutoSizeColumn(FCustomizedColumn2.Index);
  TMSFNCDataGrid1.ControlAligns[FCustomizedColumn2.Index, ROW] := gcaBottom;
end;

procedure TDataGridCellControlsMainView.btnCustomized2SubgridClick(Sender: TObject);
begin
  TMSFNCDataGrid1.AddGrid(MakeCell(FCustomizedColumn2.Index, 4)).LoadSampleData;
  TMSFNCDataGrid1.RowHeights[4] := 300;
end;

end.
