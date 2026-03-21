unit Sorting.Main.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Rtti,
  System.Character,
  Vcl.StdCtrls,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  VCL.ExtCtrls,
  Data.DB,
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
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
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
  VCL.TMSFNCDataGrid,
  VCL.TMSFNCCustomComponent,
  VCL.TMSFNCDataGridDatabaseAdapter;

type
  TSortingMainView = class(TForm)
    pnTop: TPanel;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDQuery1Id: TIntegerField;
    FDQuery1Department: TWideStringField;
    FDQuery1Description: TWideStringField;
    FDQuery1Number: TIntegerField;
    FDQuery1RegistrationDate: TWideStringField;
    FDQuery1LimitValue: TFloatField;
    FDQuery1Status: TIntegerField;
    DataSource1: TDataSource;
    TMSFNCDataGridDatabaseAdapter1: TTMSFNCDataGridDatabaseAdapter;
    gBoxConfigs: TGroupBox;
    ckSorting: TCheckBox;
    GroupBox2: TGroupBox;
    btnClose: TButton;
    btnOpenQuery: TButton;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    cBoxColumn: TComboBox;
    cBoxDirection: TComboBox;
    btnSort: TButton;
    GroupBox1: TGroupBox;
    btnSortByDepartment: TButton;
    btnSortingMultiple: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ckSortingClick(Sender: TObject);
    procedure btnOpenQueryClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSortClick(Sender: TObject);
    procedure btnSortByDepartmentClick(Sender: TObject);
    procedure btnSortingMultipleClick(Sender: TObject);
    function TMSFNCDataGrid1CustomCompare(Sender: TObject; AColumn, ARow1, ARow2: Integer; AData1,
      AData2: TTMSFNCDataGridCellValue; ALevel: Integer): Integer;
  private
    procedure ConfigDataGrid;
    procedure FillcBoxColumn;
  public

  end;

var
  SortingMainView: TSortingMainView;

implementation

{$R *.dfm}

procedure TSortingMainView.FormCreate(Sender: TObject);
begin
  FDConnection1.Params.Database := '..\Data\Departments.db';
  Self.ConfigDataGrid;
end;

procedure TSortingMainView.btnOpenQueryClick(Sender: TObject);
begin
  FDQuery1.Open;
  Self.FillcBoxColumn;
end;

procedure TSortingMainView.btnCloseClick(Sender: TObject);
begin
  FDQuery1.Close;
end;

procedure TSortingMainView.FillcBoxColumn;
begin
  cBoxColumn.Items.Clear;
  for var i := 0 to Pred(TMSFNCDataGrid1.Columns.Count) do
    cBoxColumn.Items.Add(TMSFNCDataGrid1.Columns[i].Header);
end;

procedure TSortingMainView.ckSortingClick(Sender: TObject);
begin
  Self.ConfigDataGrid;
end;

procedure TSortingMainView.ConfigDataGrid;
begin
  TMSFNCDataGrid1.BeginUpdate;
  TMSFNCDataGrid1.Clear;
  TMSFNCDataGrid1.Options.Sorting.Enabled := ckSorting.Checked;
  TMSFNCDataGrid1.Options.Selection.Mode := gsmSingleRow;
  TMSFNCDataGrid1.EndUpdate;
end;

procedure TSortingMainView.btnSortClick(Sender: TObject);
begin
  TMSFNCDataGrid1.Sort(cBoxColumn.ItemIndex, TTMSFNCDataGridSortDirection(cBoxDirection.ItemIndex));
end;

procedure TSortingMainView.btnSortByDepartmentClick(Sender: TObject);
begin
  TMSFNCDataGrid1.Sort(TMSFNCDataGrid1.ColumnIndexByHeader('Department'), gsdAscending);
end;

procedure TSortingMainView.btnSortingMultipleClick(Sender: TObject);
var
  LColumns: TArray<Integer>;
  LDirections: TArray<TTMSFNCDataGridSortDirection>;
begin
  //Array with columns to sort
  LColumns := TArray<Integer>.Create(2, 3);
  //Define corresponding sort Directions
  LDirections := TArray<TTMSFNCDataGridSortDirection>.Create(gsdAscending, gsdDescending);

  TMSFNCDataGrid1.Sort(LColumns, LDirections);
end;

function TSortingMainView.TMSFNCDataGrid1CustomCompare(Sender: TObject; AColumn, ARow1, ARow2: Integer;
  AData1, AData2: TTMSFNCDataGridCellValue; ALevel: Integer): Integer;
begin
//  // Custom comparison logic for sorting
//  if TMSFNCDataGrid1.Floats[AColumn, ARow1] > TMSFNCDataGrid1.Floats[AColumn, ARow2] then
//    Result := 1
//  else if TMSFNCDataGrid1.Floats[AColumn, ARow1] < TMSFNCDataGrid1.Floats[AColumn, ARow2] then
//    Result := -1
//  else
//    Result := 0;
end;

end.
