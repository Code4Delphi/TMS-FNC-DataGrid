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
    GroupBox1: TGroupBox;
    ckVisibleFooter: TCheckBox;
    ckShowPageSelector: TCheckBox;
    ckShowPageInfo: TCheckBox;
    btnShowNavigationButtons: TCheckBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    edtPageInfoFormat: TEdit;
    Label2: TLabel;
    edtPageSelectorFormat: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnOpenQueryClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure ckPagingClick(Sender: TObject);
    procedure GroupBox3Exit(Sender: TObject);
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

procedure TPaginationMainView.GroupBox3Exit(Sender: TObject);
begin
  Self.ConfigDataGrid;
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

  // Make the footer and paging visible
  TMSFNCDataGrid1.Footer.Visible := ckVisibleFooter.Checked;
  TMSFNCDataGrid1.Footer.Paging.Visible := ckVisibleFooter.Checked;

  // Configure paging control size and spacing
  TMSFNCDataGrid1.Footer.Paging.Size := 30; // Height of the paging area

  // Control which elements are shown
  TMSFNCDataGrid1.Footer.Paging.ShowPageSelector := ckShowPageSelector.Checked; // Dropdown to select page
  TMSFNCDataGrid1.Footer.Paging.ShowPageInfo := ckShowPageInfo.Checked; // Text showing current page info
  TMSFNCDataGrid1.Footer.Paging.ShowNavigationButtons := btnShowNavigationButtons.Checked; // First/Previous/Next/Last buttons

  // Customize widths of paging controls
  TMSFNCDataGrid1.Footer.Paging.PageSelectorWidth := 100; // Width of page dropdown
  TMSFNCDataGrid1.Footer.Paging.NavigationButtonWidth := 25; // Width of navigation buttons
  TMSFNCDataGrid1.Footer.Paging.PageInfoWidth := 150; // Width of page info text

  // Formats
  TMSFNCDataGrid1.Footer.Paging.PageInfoFormat := edtPageInfoFormat.Text;
  TMSFNCDataGrid1.Footer.Paging.PageSelectorFormat := edtPageSelectorFormat.Text;

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
