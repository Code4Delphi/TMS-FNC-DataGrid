unit Filtering.Main.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Rtti,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
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
  VCL.TMSFNCDataGrid,  
  VCL.TMSFNCCustomComponent,
  VCL.TMSFNCDataGridDatabaseAdapter,    
  TMS.TMSFNCFilterBuilder;

type
  TFilteringMainView = class(TForm)
    pnTop1: TPanel;
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
    StatusBar1: TStatusBar;
    gBoxConfigs: TGroupBox;
    ckFilter: TCheckBox;
    ckAdvancedFilter: TCheckBox;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    btnClearFilter: TButton;
    GroupBox1: TGroupBox;
    ckStretching: TCheckBox;
    ckShowControlButton: TCheckBox;
    ckShowControlEditor: TCheckBox;
    GroupBox2: TGroupBox;
    btnClose: TButton;
    btnOpenQuery: TButton;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    btnFilter: TButton;
    edtFilter: TEdit;
    GroupBox4: TGroupBox;
    cBoxColumns: TComboBox;
    Label2: TLabel;
    cBoxFilterType: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    edtTextCustomFilter: TEdit;
    btnCustomFilter: TButton;
    pnTop2: TPanel;
    GroupBox5: TGroupBox;
    Label5: TLabel;
    edtTextFilter: TEdit;
    btnTextFilter: TButton;
    GroupBox6: TGroupBox;
    btnShowFilterDialog: TButton;
    GroupBox7: TGroupBox;
    btnAddExpression: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnOpenQueryClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure btnFilterClick(Sender: TObject);
    procedure ckFilterClick(Sender: TObject);
    procedure btnClearFilterClick(Sender: TObject);
    procedure btnCustomFilterClick(Sender: TObject);
    procedure btnTextFilterClick(Sender: TObject);
    procedure btnShowFilterDialogClick(Sender: TObject);
    procedure btnAddExpressionClick(Sender: TObject);
  private
    procedure Search;
    procedure ConfigDataGrid;
    procedure FillcBoxColumns;
  public

  end;

var
  FilteringMainView: TFilteringMainView;

implementation

{$R *.dfm}

procedure TFilteringMainView.FormCreate(Sender: TObject);
begin
  FDConnection1.Params.Database := '..\Data\Departments.db';

  Self.ConfigDataGrid;
end;

procedure TFilteringMainView.ckFilterClick(Sender: TObject);
begin
  Self.ConfigDataGrid;
end;

procedure TFilteringMainView.ConfigDataGrid;
begin
  TMSFNCDataGrid1.BeginUpdate;
  TMSFNCDataGrid1.Clear;
  TMSFNCDataGrid1.Options.Column.Stretching.Enabled := ckStretching.Checked;
  TMSFNCDataGrid1.GlobalFont.Scale := 1.2;

  TMSFNCDataGrid1.Options.Filtering.Enabled := ckFilter.Checked;
  TMSFNCDataGrid1.Options.Filtering.Advanced := ckAdvancedFilter.Checked;

  TMSFNCDataGrid1.Options.Filtering.Controls := [];
  if ckShowControlButton.Checked then
    TMSFNCDataGrid1.Options.Filtering.Controls := [gfcButton];
  if ckShowControlEditor.Checked then
    TMSFNCDataGrid1.Options.Filtering.Controls := TMSFNCDataGrid1.Options.Filtering.Controls + [gfcEditor];

  TMSFNCDataGrid1.Options.Mouse.ColumnSizing := True;
  TMSFNCDataGrid1.Options.Mouse.FixedColumnSizing := True;
  TMSFNCDataGrid1.Options.Mouse.ColumnSizingMode := gszmOneSided;
  TMSFNCDataGrid1.Options.Mouse.ColumnDragging := True;

  TMSFNCDataGrid1.EndUpdate;
end;

procedure TFilteringMainView.btnOpenQueryClick(Sender: TObject);
begin
  Self.Search;

  Self.FillcBoxColumns;
end;

procedure TFilteringMainView.FillcBoxColumns;
var
  i: Integer;
  LColumn: TTMSFNCDataGridColumn;
begin
  cBoxColumns.Items.Clear;
  for i := 0 to Pred(TMSFNCDataGrid1.Columns.Count) do
  begin
    LColumn := TMSFNCDataGrid1.Columns[i];
    cBoxColumns.Items.Add(LColumn.Header);
  end;
end;

procedure TFilteringMainView.btnCloseClick(Sender: TObject);
begin
  FDQuery1.Close;
end;

procedure TFilteringMainView.DataSource1DataChange(Sender: TObject; Field: TField);
var
  LTotal: Integer;
  LVisible: Integer;
begin
  StatusBar1.Panels[0].Text := 'Total query: ' + FormatFloat('#,##0', FDQuery1.RecordCount);

  LTotal := TMSFNCDataGrid1.RowCount - TMSFNCDataGrid1.FixedRowCount;
  LVisible := TMSFNCDataGrid1.VisibleRowCount - TMSFNCDataGrid1.FixedRowCount;
  StatusBar1.Panels[1].Text := Format('Total Grid: %d of %s rows shown', [LVisible, FormatFloat('#,##0', LTotal)]);
end;

procedure TFilteringMainView.btnFilterClick(Sender: TObject);
begin
  TMSFNCDataGrid1.ClearFilter;
  TMSFNCDataGrid1.Filter
    .Add(TMSFNCDataGrid1.ColumnIndexByHeader('Department'), gftContains, edtFilter.Text)
    .&or(TMSFNCDataGrid1.ColumnIndexByHeader('Description'), gftContains, edtFilter.Text);
  TMSFNCDataGrid1.ApplyFilter;
end;

procedure TFilteringMainView.btnClearFilterClick(Sender: TObject);
begin
  TMSFNCDataGrid1.ClearFilter;
end;

procedure TFilteringMainView.Search;
begin
  FDQuery1.Open;
  TMSFNCDataGrid1.Columns[4].AddSetting(gcsFormatting);
  TMSFNCDataGrid1.Columns[4].Formatting.&Type := gdftDate;
end;

procedure TFilteringMainView.btnCustomFilterClick(Sender: TObject);
var
  LFilter: TTMSFNCDataGridDataFilterData;
begin
  TMSFNCDataGrid1.ClearFilter;

  LFilter := TMSFNCDataGrid1.Filter.Add;
  LFilter.&Type := TTMSFNCDataGridDataFilterType(cBoxFilterType.ItemIndex);
  LFilter.Column := cBoxColumns.ItemIndex;
  LFilter.Condition := edtTextCustomFilter.Text;
  TMSFNCDataGrid1.ApplyFilter;
end;

procedure TFilteringMainView.btnTextFilterClick(Sender: TObject);
begin
  if not ckAdvancedFilter.Checked then
    raise Exception.Create('Only if advanced filter is checked');
  
  TMSFNCDataGrid1.ClearFilter;
  TMSFNCDataGrid1.FilterBuilder.FilterText := edtTextFilter.Text;
  TMSFNCDataGrid1.ApplyFilter;
end;

procedure TFilteringMainView.btnShowFilterDialogClick(Sender: TObject);
begin
  if not ckAdvancedFilter.Checked then
    raise Exception.Create('Only if advanced filter is checked');
  
  TMSFNCDataGrid1.ShowFilterDialog;
end;

procedure TFilteringMainView.btnAddExpressionClick(Sender: TObject);
var
  LFilter: TTMSFNCFilterBuilder; 
begin
  if not ckAdvancedFilter.Checked then
    raise Exception.Create('Only if advanced filter is checked');
  
  TMSFNCDataGrid1.ClearFilter;
  LFilter := TMSFNCDataGrid1.FilterBuilder;
  LFilter.Filter.AddExpression('Department', feoContains, 'Financial');
  LFilter.Filter.AddExpression('Description', feoEqual, 'Description 2');
  TMSFNCDataGrid1.ApplyFilter;
end;


end.
