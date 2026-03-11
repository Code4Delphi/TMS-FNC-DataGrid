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
  VCL.TMSFNCBitmapContainer,
  VCL.TMSFNCDataGridExcelIO,
  VCL.TMSFNCCustomComponent,
  VCL.TMSFNCDataGridDatabaseAdapter,
  VCL.TMSFNCCustomControl,
  VCL.TMSFNCDataGrid,
  Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TLoadingDataDatabaseView = class(TForm)
    pnTop: TPanel;
    btnClose: TButton;
    btnOpenQuery: TButton;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    TMSFNCDataGridDatabaseAdapter1: TTMSFNCDataGridDatabaseAdapter;
    TMSFNCDataGridExcelIO1: TTMSFNCDataGridExcelIO;
    TMSFNCBitmapContainer1: TTMSFNCBitmapContainer;
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
    procedure FormCreate(Sender: TObject);
    procedure btnOpenQueryClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private

  public

  end;

var
  LoadingDataDatabaseView: TLoadingDataDatabaseView;

implementation

{$R *.dfm}

procedure TLoadingDataDatabaseView.FormCreate(Sender: TObject);
begin
  TMSFNCDataGrid1.BeginUpdate;
  TMSFNCDataGrid1.Clear;
  TMSFNCDataGrid1.Options.Banding.Enabled := True;
  TMSFNCDataGrid1.CellAppearance.BandLayout.Fill.Color := Lighter(TMSFNCDataGrid1.CellAppearance.SelectedLayout.Fill.Color, 50);
  TMSFNCDataGrid1.CellAppearance.SelectedLayout.Fill.Color := Darker(TMSFNCDataGrid1.CellAppearance.SelectedLayout.Fill.Color, 20);
  TMSFNCDataGrid1.EndUpdate;
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
