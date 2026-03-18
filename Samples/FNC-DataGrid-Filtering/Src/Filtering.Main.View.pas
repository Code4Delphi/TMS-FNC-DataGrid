unit Filtering.Main.View;

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
  Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes, System.Rtti, VCL.TMSFNCDataGridCell, VCL.TMSFNCDataGridData, VCL.TMSFNCDataGridBase,
  VCL.TMSFNCDataGridCore, VCL.TMSFNCDataGridRenderer, VCL.TMSFNCCustomControl, VCL.TMSFNCDataGrid, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, VCL.TMSFNCCustomComponent, VCL.TMSFNCDataGridDatabaseAdapter, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls;

type
  TFilteringMainView = class(TForm)
    pnTop: TPanel;
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
    TMSFNCDataGrid2: TTMSFNCDataGrid;
    btnClearFilter: TButton;
    GroupBox1: TGroupBox;
    ckStretching: TCheckBox;
    CheckBox2: TCheckBox;
    ckShowControlButton: TCheckBox;
    ckShowControlEditor: TCheckBox;
    GroupBox2: TGroupBox;
    btnClose: TButton;
    btnOpenQuery: TButton;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    btnFilter: TButton;
    edtFilter: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnOpenQueryClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure btnFilterClick(Sender: TObject);
    procedure ckFilterClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnClearFilterClick(Sender: TObject);
  private
    procedure Search;
    procedure ConfigDataGrid;

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

procedure TFilteringMainView.FormShow(Sender: TObject);
begin
  //
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
end;

procedure TFilteringMainView.btnCloseClick(Sender: TObject);
begin
  FDQuery1.Close;
end;

procedure TFilteringMainView.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  StatusBar1.Panels[0].Text := 'Total: ' + FormatFloat('#,##0', FDQuery1.RecordCount);
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

end.
