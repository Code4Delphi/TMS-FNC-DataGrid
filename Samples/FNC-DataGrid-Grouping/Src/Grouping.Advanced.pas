unit Grouping.Advanced;

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
  TGroupingAdvanced = class(TForm)
    pnTop: TPanel;
    GroupBox2: TGroupBox;
    btnClose: TButton;
    btnOpenQuery: TButton;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    TMSFNCDataGridDatabaseAdapter1: TTMSFNCDataGridDatabaseAdapter;
    GroupBox3: TGroupBox;
    StatusBar1: TStatusBar;
    FDQuery1product_code: TIntegerField;
    FDQuery1name: TWideMemoField;
    FDQuery1group_code: TIntegerField;
    FDQuery1brand_name: TWideMemoField;
    FDQuery1inventory: TFloatField;
    FDQuery1cost_price: TFloatField;
    FDQuery1sale_price: TFloatField;
    FDQuery1condition: TWideMemoField;
    btnGroupBasic: TButton;
    GroupBox1: TGroupBox;
    ckGroupingHideColumns: TCheckBox;
    btnUngroup: TButton;
    btnExpandAllNodes: TButton;
    btnCollapseAllNodes: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnOpenQueryClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure btnGroupBasicClick(Sender: TObject);
    procedure btnUngroupClick(Sender: TObject);
    procedure btnExpandAllNodesClick(Sender: TObject);
    procedure btnCollapseAllNodesClick(Sender: TObject);
  private
    procedure ConfigDataGrid;
  public

  end;

var
  GroupingAdvanced: TGroupingAdvanced;

implementation

{$R *.dfm}

procedure TGroupingAdvanced.FormCreate(Sender: TObject);
begin
  Self.ConfigDataGrid;
  FDConnection1.Params.Database := '..\Data\Products.db';
end;

procedure TGroupingAdvanced.ConfigDataGrid;
begin
  TMSFNCDataGrid1.BeginUpdate;
  TMSFNCDataGrid1.RowCount := TMSFNCDataGrid1.RowCount + 2;
  TMSFNCDataGrid1.FixedBottomRowCount := 2;
  TMSFNCDataGrid1.Options.Filtering.Enabled := True;
  TMSFNCDataGrid1.Options.Filtering.MultiColumn := True;
  TMSFNCDataGrid1.Options.Sorting.Enabled := True;

  TMSFNCDataGridDatabaseAdapter1.ShowMemoFields := True;
  TMSFNCDataGridDatabaseAdapter1.LoadMode := almAllRecords;

  TMSFNCDataGrid1.EndUpdate;
end;

procedure TGroupingAdvanced.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  StatusBar1.Panels[0].Text := 'Total: ' + FDQuery1.RecordCount.ToString;
end;

procedure TGroupingAdvanced.btnOpenQueryClick(Sender: TObject);
begin
  FDQuery1.Open;
end;

procedure TGroupingAdvanced.btnCloseClick(Sender: TObject);
begin
  FDQuery1.Close;
end;

procedure TGroupingAdvanced.btnUngroupClick(Sender: TObject);
begin
  TMSFNCDataGrid1.UnGroup;
end;

procedure TGroupingAdvanced.btnCollapseAllNodesClick(Sender: TObject);
begin
  TMSFNCDataGrid1.CollapseAllNodes;
end;

procedure TGroupingAdvanced.btnExpandAllNodesClick(Sender: TObject);
begin
  TMSFNCDataGrid1.ExpandAllNodes;
end;

procedure TGroupingAdvanced.btnGroupBasicClick(Sender: TObject);
begin
  TMSFNCDataGrid1.BeginUpdate;
  TMSFNCDataGrid1.UnGroup;
  TMSFNCDataGrid1.RowCount := TMSFNCDataGrid1.RowCount + 1;
  TMSFNCDataGrid1.FixedBottomRowCount := 1;
  TMSFNCDataGrid1.Group(CreateGroupInfo([2, 3], [7]));
  TMSFNCDataGrid1.Options.Grouping.HideColumns := ckGroupingHideColumns.Checked;

  //COUNTS
  TMSFNCDataGrid1.ColumnCalculations[0, 'Group count'] := [CreateGroupColumnCalculation(gcmCount,
    procedure(AColumn: Integer; ALevel: Integer; var AOptions: TTMSFNCDataGridDataColumnCalculationOptions)
    begin
      case ALevel of
        0: AOptions.CalculationFormat := '<b>Group count: %g</b>';
        1: AOptions.CalculationFormat := 'Sub-Count: %g';
      end;
    end)];

  TMSFNCDataGrid1.ColumnCalculations[0, 'General count'] := [CreateNormalColumnCalculation(gcmCount,
    procedure(AColumn: Integer; ALevel: Integer; var AOptions: TTMSFNCDataGridDataColumnCalculationOptions)
    begin
      AOptions.CalculationFormat := '<b>General count: %g</b>';
    end)];

  //AVERAGE SELLING PRICES / MEDIA PRECOS DE VENDA
  TMSFNCDataGrid1.ColumnCalculations[6, 'Average sale price'] := [CreateGroupColumnCalculation(gcmAverage,
    procedure(AColumn: Integer; ALevel: Integer; var AOptions: TTMSFNCDataGridDataColumnCalculationOptions)
    begin
      case ALevel of
        0: AOptions.CalculationFormat := '<b>Group average: $%.2f</b>';
        1: AOptions.CalculationFormat := 'Sub-Average: $%.2f';
      end;
    end)];

  //TOTALIZERS
  TMSFNCDataGrid1.ColumnCalculations[6, 'Sum'] := [CreateNormalColumnCalculation(gcmSum,
    procedure(AColumn: Integer; ALevel: Integer; var AOptions: TTMSFNCDataGridDataColumnCalculationOptions)
    begin
      AOptions.CalculationFormat := '<b>Total Sum: $%.2f</b>';
    end),

  CreateNormalColumnCalculation(gcmMax,
    procedure(AColumn: Integer; ALevel: Integer; var AOptions: TTMSFNCDataGridDataColumnCalculationOptions)
    begin
      AOptions.CalculationFormat := '<br><b>Max price: $%.2f</b>';
    end)];

  TMSFNCDataGrid1.AutoSizeColumns;
  TMSFNCDataGrid1.RowHeights[TMSFNCDataGrid1.RowCount - TMSFNCDataGrid1.FixedBottomRowCount] := 50;
  TMSFNCDataGrid1.Options.Calculations.IncludeHiddenRows := True;
  TMSFNCDataGrid1.EndUpdate;
end;

end.
