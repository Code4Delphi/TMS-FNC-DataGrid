unit Grouping.Basic;

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
  Data.DB,
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
  VCL.TMSFNCDataGrid;

type
  TGroupingBasic = class(TForm)
    pnTop: TPanel;
    gBoxConfigs: TGroupBox;
    StatusBar1: TStatusBar;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    btnGroupBasic: TButton;
    btnUngroup: TButton;
    btnExpandAllNodes: TButton;
    btnCollapseAllNodes: TButton;
    btnGroupWithSumAndAverage: TButton;
    btnGroupMultipleColumns: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnGroupBasicClick(Sender: TObject);
    procedure btnUngroupClick(Sender: TObject);
    procedure btnExpandAllNodesClick(Sender: TObject);
    procedure btnCollapseAllNodesClick(Sender: TObject);
    procedure btnGroupWithSumAndAverageClick(Sender: TObject);
    procedure btnGroupMultipleColumnsClick(Sender: TObject);
  private

  public

  end;

var
  GroupingBasic: TGroupingBasic;

implementation

{$R *.dfm}

procedure TGroupingBasic.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';

  TMSFNCDataGrid1.Clear;
  TMSFNCDataGrid1.LoadFromCSVData('../Data/products.csv');
end;

procedure TGroupingBasic.btnUngroupClick(Sender: TObject);
begin
  TMSFNCDataGrid1.UnGroup;
end;

procedure TGroupingBasic.btnExpandAllNodesClick(Sender: TObject);
begin
  TMSFNCDataGrid1.ExpandAllNodes;
end;

procedure TGroupingBasic.btnCollapseAllNodesClick(Sender: TObject);
begin
  TMSFNCDataGrid1.CollapseAllNodes;
end;

procedure TGroupingBasic.btnGroupBasicClick(Sender: TObject);
begin
  TMSFNCDataGrid1.Group(2);
end;

procedure TGroupingBasic.btnGroupWithSumAndAverageClick(Sender: TObject);
begin
  TMSFNCDataGrid1.Group(TMSFNCDataGrid1.ColumnIndexByHeader('Group code'));
  TMSFNCDataGrid1.GroupSum(TMSFNCDataGrid1.ColumnIndexByHeader('Inventory'));
  TMSFNCDataGrid1.GroupAverage(TMSFNCDataGrid1.ColumnIndexByHeader('Sale price'));
end;

procedure TGroupingBasic.btnGroupMultipleColumnsClick(Sender: TObject);
begin
  TMSFNCDataGrid1.Group([2, 3]);
end;

end.
