unit Pagination.Main.View;

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
  FireDAC.Comp.Client, FireDAC.Comp.UI;

type
  TPaginationMainView = class(TForm)
    pnTop: TPanel;
    gBoxConfigs: TGroupBox;
    ckPaging: TCheckBox;
    GroupBox2: TGroupBox;
    btnClose: TButton;
    btnOpenQuery: TButton;
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
    procedure FormCreate(Sender: TObject);
    procedure btnOpenQueryClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure ckPagingClick(Sender: TObject);
  private
    procedure ConfigDataGrid;

  public

  end;

var
  PaginationMainView: TPaginationMainView;

implementation

{$R *.dfm}

procedure TPaginationMainView.FormCreate(Sender: TObject);
begin
  Self.ConfigDataGrid;
  FDConnection1.Params.Database := '..\Data\Departments.db';
end;

procedure TPaginationMainView.ConfigDataGrid;
begin
  TMSFNCDataGrid1.BeginUpdate;
  TMSFNCDataGrid1.Clear;
  TMSFNCDataGrid1.Options.Filtering.Enabled := True;
  TMSFNCDataGrid1.Options.Sorting.Enabled := True;
  TMSFNCDataGrid1.Options.Selection.Mode := gsmSingleRow;
  TMSFNCDataGrid1.Options.Column.Stretching.Enabled := True;
  TMSFNCDataGrid1.Options.Banding.Enabled := True;

  //Pagination
  TMSFNCDataGrid1.Paging := ckPaging.Checked;
  TMSFNCDataGrid1.Footer.Visible := TMSFNCDataGrid1.Paging;
  TMSFNCDataGrid1.Footer.Paging.Visible := TMSFNCDataGrid1.Paging;

  TMSFNCDataGrid1.EndUpdate;
end;

procedure TPaginationMainView.btnOpenQueryClick(Sender: TObject);
begin
  FDQuery1.Open;
end;

procedure TPaginationMainView.ckPagingClick(Sender: TObject);
begin
  Self.ConfigDataGrid;
end;

procedure TPaginationMainView.btnCloseClick(Sender: TObject);
begin
  FDQuery1.Close;
end;

end.
