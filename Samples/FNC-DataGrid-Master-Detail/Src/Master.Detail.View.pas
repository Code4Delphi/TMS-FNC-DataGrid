unit Master.Detail.View;

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
  System.Rtti,
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
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.Comp.UI,
  Vcl.Buttons,
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
  VCL.TMSFNCDataGridDatabaseAdapter;

type
  TMasterDetailView = class(TForm)
    pnTop: TPanel;
    GroupBox2: TGroupBox;
    btnClose: TButton;
    btnOpenQuery: TButton;
    FDConnection1: TFDConnection;
    FDOrders: TFDQuery;
    DataSource1: TDataSource;
    TMSFNCDataGridDatabaseAdapter1: TTMSFNCDataGridDatabaseAdapter;
    StatusBar1: TStatusBar;
    FDOrdersId: TIntegerField;
    FDOrdersregistration_date: TWideMemoField;
    FDOrderscustomer_code: TIntegerField;
    FDOrderscustomer_name: TWideMemoField;
    FDOrdersinvoice_number: TIntegerField;
    FDOrdersclosed: TWideMemoField;
    FDItems: TFDQuery;
    DataSource2: TDataSource;
    TMSFNCDataGridDatabaseAdapter2: TTMSFNCDataGridDatabaseAdapter;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    TMSFNCDataGrid2: TTMSFNCDataGrid;
    FDItemsId: TIntegerField;
    FDItemsorder_id: TIntegerField;
    FDItemsproduct_code: TIntegerField;
    FDItemsproduct_name: TWideMemoField;
    FDItemsquantity: TFloatField;
    FDItemsprice: TFloatField;
    FDItemstotal: TFloatField;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    pnItems: TPanel;
    Panel1: TPanel;
    btnBanding: TButton;
    btnStretching: TButton;
    btnShowItem: TButton;
    lbCount: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnOpenQueryClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnBandingClick(Sender: TObject);
    procedure btnStretchingClick(Sender: TObject);
    procedure btnShowItemClick(Sender: TObject);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
  private
  public
  end;

var
  MasterDetailView: TMasterDetailView;

implementation

{$R *.dfm}

procedure TMasterDetailView.FormCreate(Sender: TObject);
begin
  FDConnection1.Params.Database := '..\Data\orders_demo.db';
end;

procedure TMasterDetailView.btnOpenQueryClick(Sender: TObject);
begin
  FDOrders.Open;
  FDItems.Open;
end;

procedure TMasterDetailView.btnCloseClick(Sender: TObject);
begin
  FDOrders.Close;
end;

procedure TMasterDetailView.DataSource2DataChange(Sender: TObject; Field: TField);
begin
  lbCount.Caption := 'Count: ' + FDItems.RecordCount.ToString;
end;

procedure TMasterDetailView.btnBandingClick(Sender: TObject);
begin
  TMSFNCDataGrid2.Options.Banding.Enabled := not TMSFNCDataGrid2.Options.Banding.Enabled;
end;

procedure TMasterDetailView.btnStretchingClick(Sender: TObject);
begin
  TMSFNCDataGrid2.Options.Column.Stretching.Enabled := not TMSFNCDataGrid2.Options.Column.Stretching.Enabled;
  TMSFNCDataGrid2.AutoSizeColumns;
end;

procedure TMasterDetailView.btnShowItemClick(Sender: TObject);
begin
  ShowMessage(FDItemsId.AsString + ' - ' + FDItemsproduct_name.AsString);
end;

end.
