unit Pagination.Programmatic;

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
  Vcl.Buttons, Vcl.ComCtrls;

type
  TPaginationProgrammatic = class(TForm)
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
    Panel1: TPanel;
    btnFirstPage: TSpeedButton;
    btnPreviousPage: TSpeedButton;
    btnNextPage: TSpeedButton;
    btnLastPage: TSpeedButton;
    lbPageInfoFormat: TLabel;
    GroupBox4: TGroupBox;
    mmLog: TMemo;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure btnOpenQueryClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure ckPagingClick(Sender: TObject);
    procedure btnFirstPageClick(Sender: TObject);
    procedure btnLastPageClick(Sender: TObject);
    procedure btnNextPageClick(Sender: TObject);
    procedure btnPreviousPageClick(Sender: TObject);
    procedure TMSFNCDataGrid1PageChanged(Sender: TObject; AOldPageIndex, ANewPageIndex: Integer);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    procedure ConfigDataGrid;
    procedure ConfigPagination;

  public

  end;

var
  PaginationProgrammatic: TPaginationProgrammatic;

implementation

{$R *.dfm}

procedure TPaginationProgrammatic.FormCreate(Sender: TObject);
begin
  Self.ConfigDataGrid;
  FDConnection1.Params.Database := '..\Data\Departments.db';
  Self.ConfigPagination;
end;

procedure TPaginationProgrammatic.ckPagingClick(Sender: TObject);
begin
  Self.ConfigDataGrid;
end;

procedure TPaginationProgrammatic.ConfigDataGrid;
begin
  TMSFNCDataGrid1.BeginUpdate;
  TMSFNCDataGrid1.Paging := ckPaging.Checked;
  TMSFNCDataGrid1.EndUpdate;
end;

procedure TPaginationProgrammatic.ConfigPagination;
var
  LCurrentPage: Integer;
  LTotalPages: Integer;
begin
  btnFirstPage.Enabled := False;
  btnPreviousPage.Enabled := False;
  btnNextPage.Enabled := False;
  btnLastPage.Enabled := False;

  if TMSFNCDataGrid1.RowCount <= TMSFNCDataGrid1.FixedRowCount then
  begin
    lbPageInfoFormat.Caption := 'No data to display';
    Exit;
  end;

  LCurrentPage := TMSFNCDataGrid1.PageIndex;
  LTotalPages := TMSFNCDataGrid1.PageCount;

  lbPageInfoFormat.Caption := Format(edtPageInfoFormat.Text, [LCurrentPage + 1, LTotalPages]);

  //On first page
  if LCurrentPage > 0 then
  begin
    btnFirstPage.Enabled := True;
    btnPreviousPage.Enabled := True;
  end;

  //On last page
  if LCurrentPage <> Pred(LTotalPages) then
  begin
    btnNextPage.Enabled := True;
    btnLastPage.Enabled := True;
  end;
end;

procedure TPaginationProgrammatic.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  StatusBar1.Panels[0].Text := 'Total: ' + FDQuery1.RecordCount.ToString;
  Self.ConfigPagination;
end;

procedure TPaginationProgrammatic.btnOpenQueryClick(Sender: TObject);
begin
  FDQuery1.Open;
end;

procedure TPaginationProgrammatic.btnCloseClick(Sender: TObject);
begin
  FDQuery1.Close;
  Self.ConfigPagination;
end;

procedure TPaginationProgrammatic.btnFirstPageClick(Sender: TObject);
begin
  TMSFNCDataGrid1.FirstPage;
end;

procedure TPaginationProgrammatic.btnPreviousPageClick(Sender: TObject);
begin
  TMSFNCDataGrid1.PreviousPage;
end;

procedure TPaginationProgrammatic.btnNextPageClick(Sender: TObject);
begin
  TMSFNCDataGrid1.NextPage;
end;

procedure TPaginationProgrammatic.btnLastPageClick(Sender: TObject);
begin
  TMSFNCDataGrid1.LastPage;
end;

// Triggered when the page changes
procedure TPaginationProgrammatic.TMSFNCDataGrid1PageChanged(Sender: TObject; AOldPageIndex,
  ANewPageIndex: Integer);
begin
  mmLog.Lines.Add('Changed from page ' + IntToStr(AOldPageIndex + 1) + ' to page ' + IntToStr(ANewPageIndex + 1));
end;


end.
