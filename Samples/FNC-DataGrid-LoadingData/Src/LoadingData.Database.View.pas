unit LoadingData.Database.View;

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
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.UI.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Phys,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.VCLUI.Wait,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  VCL.TMSFNCCustomComponent,
  VCL.TMSFNCDataGridDatabaseAdapter,
  VCL.TMSFNCCustomControl,
  VCL.TMSFNCDataGrid;

type
  TLoadingDataDatabaseView = class(TForm)
    pnTop: TPanel;
    btnClose: TButton;
    btnOpenQuery: TButton;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    TMSFNCDataGridDatabaseAdapter1: TTMSFNCDataGridDatabaseAdapter;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    FDConnection1: TFDConnection;
    FDQuery1Id: TIntegerField;
    FDQuery1Department: TWideStringField;
    FDQuery1Description: TWideStringField;
    FDQuery1Number: TIntegerField;
    FDQuery1RegistrationDate: TWideStringField;
    FDQuery1LimitValue: TFloatField;
    FDQuery1Status: TIntegerField;
    StatusBar1: TStatusBar;
    btnFilter: TButton;
    Label1: TLabel;
    edtFilter: TEdit;
    procedure btnOpenQueryClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  LoadingDataDatabaseView: TLoadingDataDatabaseView;

implementation

{$R *.dfm}

procedure TLoadingDataDatabaseView.FormCreate(Sender: TObject);
begin
  FDConnection1.Params.Database := '..\Data\Departments.db';
end;

procedure TLoadingDataDatabaseView.btnCloseClick(Sender: TObject);
begin
  FDQuery1.Close;
end;

procedure TLoadingDataDatabaseView.btnOpenQueryClick(Sender: TObject);
begin
  FDQuery1.Open;
end;

procedure TLoadingDataDatabaseView.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  StatusBar1.Panels[0].Text := 'Total: ' + FormatFloat('#,##0', FDQuery1.RecordCount);
end;

procedure TLoadingDataDatabaseView.btnFilterClick(Sender: TObject);
begin
  TMSFNCDataGrid1.ClearFilter;
  TMSFNCDataGrid1.Filter
    .Add(TMSFNCDataGrid1.ColumnIndexByHeader('Department'), gftContains, edtFilter.Text)
    .&or(TMSFNCDataGrid1.ColumnIndexByHeader('Description'), gftContains, edtFilter.Text);
  TMSFNCDataGrid1.ApplyFilter;
end;

end.
