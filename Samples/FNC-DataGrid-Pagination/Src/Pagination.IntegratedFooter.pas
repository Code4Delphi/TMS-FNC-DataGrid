unit Pagination.IntegratedFooter;

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
  FireDAC.Comp.UI, Vcl.ComCtrls;

type
  TPaginationIntegratedFooter = class(TForm)
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
    GroupBox4: TGroupBox;
    mmLog: TMemo;
    StatusBar1: TStatusBar;
    btnInteractiongFooterControls: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnOpenQueryClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure ckPagingClick(Sender: TObject);
    procedure TMSFNCDataGrid1PageChanged(Sender: TObject; AOldPageIndex, ANewPageIndex: Integer);
    procedure btnInteractiongFooterControlsClick(Sender: TObject);
    procedure edtPageInfoFormatExit(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    procedure ConfigDataGrid;

  public

  end;

var
  PaginationIntegratedFooter: TPaginationIntegratedFooter;

implementation

{$R *.dfm}

procedure TPaginationIntegratedFooter.FormCreate(Sender: TObject);
begin
  Self.ConfigDataGrid;
  FDConnection1.Params.Database := '..\Data\Departments.db';
end;

procedure TPaginationIntegratedFooter.ckPagingClick(Sender: TObject);
begin
  Self.ConfigDataGrid;
end;

procedure TPaginationIntegratedFooter.edtPageInfoFormatExit(Sender: TObject);
begin
  Self.ConfigDataGrid;
end;

procedure TPaginationIntegratedFooter.ConfigDataGrid;
begin
  TMSFNCDataGrid1.BeginUpdate;

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

procedure TPaginationIntegratedFooter.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  StatusBar1.Panels[0].Text := 'Total: ' + FDQuery1.RecordCount.ToString;
end;

procedure TPaginationIntegratedFooter.btnOpenQueryClick(Sender: TObject);
begin
  FDQuery1.Open;
end;

procedure TPaginationIntegratedFooter.btnCloseClick(Sender: TObject);
begin
  FDQuery1.Close;
end;

// Triggered when the page changes
procedure TPaginationIntegratedFooter.TMSFNCDataGrid1PageChanged(Sender: TObject; AOldPageIndex, ANewPageIndex: Integer);
begin
  mmLog.Lines.Add('Changed from page ' + IntToStr(AOldPageIndex + 1) + ' to page ' + IntToStr(ANewPageIndex + 1));
end;

// Triggered when the page selector dropdown changes
procedure TPaginationIntegratedFooter.btnInteractiongFooterControlsClick(Sender: TObject);
begin
  // Access the page selector dropdown
  TMSFNCDataGrid1.FooterPageSelector.DropDown;

  // Access the page info text display
  mmLog.Lines.Add(TMSFNCDataGrid1.FooterPageInfo.Text);
  TMSFNCDataGrid1.FooterPageInfo.Text := 'Test';

  // Access navigation buttons
  TMSFNCDataGrid1.Footer.Paging.NavigationButtonWidth := 120;
  TMSFNCDataGrid1.FooterFirstPageButton.Text := '<< First';
  TMSFNCDataGrid1.FooterFirstPageButton.BitmapVisible := False;
  TMSFNCDataGrid1.FooterPreviousPageButton.Text := 'Previous';
  TMSFNCDataGrid1.FooterNextPageButton.Text := 'Next';
  TMSFNCDataGrid1.FooterLastPageButton.Text := 'Last';
end;

end.
