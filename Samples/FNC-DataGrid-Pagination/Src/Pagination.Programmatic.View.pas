unit Pagination.Programmatic.View;

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
  Vcl.Buttons;

type
  TPaginationProgrammaticView = class(TForm)
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
    GroupBox1: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    edtPageInfoFormat: TEdit;
    Label2: TLabel;
    edtPageSelectorFormat: TEdit;
    Panel1: TPanel;
    btnFirstPage: TSpeedButton;
    btnPreviousPage: TSpeedButton;
    btnNextPage: TSpeedButton;
    btnLastPage: TSpeedButton;
    lbPageInfoFormat: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnOpenQueryClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure ckPagingClick(Sender: TObject);
    procedure GroupBox3Exit(Sender: TObject);
    procedure btnFirstPageClick(Sender: TObject);
    procedure btnLastPageClick(Sender: TObject);
    procedure btnNextPageClick(Sender: TObject);
    procedure btnPreviousPageClick(Sender: TObject);
  private
    procedure ConfigDataGrid;
    procedure ConfigPagination;

  public

  end;

var
  PaginationProgrammaticView: TPaginationProgrammaticView;

implementation

{$R *.dfm}

procedure TPaginationProgrammaticView.FormCreate(Sender: TObject);
begin
  Self.ConfigDataGrid;
  FDConnection1.Params.Database := '..\Data\Departments.db';
  lbPageInfoFormat.Caption := '';
end;

procedure TPaginationProgrammaticView.GroupBox3Exit(Sender: TObject);
begin
  Self.ConfigDataGrid;
end;

procedure TPaginationProgrammaticView.ConfigDataGrid;
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

  TMSFNCDataGrid1.EndUpdate;
end;

procedure TPaginationProgrammaticView.btnOpenQueryClick(Sender: TObject);
begin
  FDQuery1.Open;
  Self.ConfigPagination;
end;

procedure TPaginationProgrammaticView.ckPagingClick(Sender: TObject);
begin
  Self.ConfigDataGrid;
end;

procedure TPaginationProgrammaticView.btnCloseClick(Sender: TObject);
begin
  FDQuery1.Close;
end;

procedure TPaginationProgrammaticView.btnFirstPageClick(Sender: TObject);
begin
  TMSFNCDataGrid1.FirstPage;
  Self.ConfigPagination;
end;

procedure TPaginationProgrammaticView.btnPreviousPageClick(Sender: TObject);
begin
  TMSFNCDataGrid1.PreviousPage;
  Self.ConfigPagination;
end;

procedure TPaginationProgrammaticView.btnNextPageClick(Sender: TObject);
begin
  TMSFNCDataGrid1.NextPage;
  Self.ConfigPagination;
end;

procedure TPaginationProgrammaticView.btnLastPageClick(Sender: TObject);
begin
  TMSFNCDataGrid1.LastPage;
  Self.ConfigPagination;
end;

procedure TPaginationProgrammaticView.ConfigPagination;
var
  LCurrentPage: Integer;
  LTotalPages: Integer;
begin
  btnFirstPage.Enabled := True;
  btnPreviousPage.Enabled := True;
  btnNextPage.Enabled := True;
  btnLastPage.Enabled := True;

  LCurrentPage := TMSFNCDataGrid1.PageIndex;
  LTotalPages := TMSFNCDataGrid1.PageCount;

  lbPageInfoFormat.Caption := Format(edtPageInfoFormat.Text, [LCurrentPage + 1, LTotalPages]);
  
  //On first page
  if LCurrentPage = 0 then
  begin
    btnFirstPage.Enabled := False;
    btnPreviousPage.Enabled := False;
  end;

  //On last page
  if LCurrentPage = Pred(LTotalPages) then
  begin
    btnNextPage.Enabled := False;
    btnLastPage.Enabled := False;
  end;
end;

end.
