unit CellColoring.Filters;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Rtti,
  Data.DB,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
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
  VCL.TMSFNCDataGrid;

type
  TCellColoringFilters = class(TForm)
    pnTop: TPanel;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cBoxColumns: TComboBox;
    cBoxFilterType: TComboBox;
    edtTextCustomFilter: TEdit;
    btnFilter: TButton;
    btnClearFilter: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure btnClearFilterClick(Sender: TObject);
  private
    procedure ConfigDataGrid;
  public

  end;

var
  CellColoringFilters: TCellColoringFilters;

implementation

{$R *.dfm}

procedure TCellColoringFilters.FormCreate(Sender: TObject);
begin
  Self.ConfigDataGrid;
  TMSFNCDataGrid1.LoadFromCSVData('../Data/products.csv');
end;

procedure TCellColoringFilters.ConfigDataGrid;
begin
  TMSFNCDataGrid1.BeginUpdate;

  //CONFIGURATION TO CHANGE THE APPEARANCE OF THE LINES THAT MATCH THE FILTER CONDITIONS
  TMSFNCDataGrid1.Options.Filtering.Actions := [gdfaApplyAppearance];

  //ROWS THAT MATCH THE FILTER CONDITION
  TMSFNCDataGrid1.CellAppearance.FilterMatchLayout.Fill.Color := gcMoneyGreen;

  //ROWS THAT DO NOT MATCH THE FILTER CONDITIONS
  TMSFNCDataGrid1.CellAppearance.FilterInverseMatchLayout.Fill.Color := $00DFDFFF;

  TMSFNCDataGrid1.EndUpdate;
end;

procedure TCellColoringFilters.btnFilterClick(Sender: TObject);
var
  LFilter: TTMSFNCDataGridDataFilterData;
begin
  TMSFNCDataGrid1.ClearFilter;
  LFilter := TMSFNCDataGrid1.Filter.Add;
  LFilter.&Type := TTMSFNCDataGridDataFilterType(cBoxFilterType.ItemIndex);
  LFilter.Column := cBoxColumns.ItemIndex;
  LFilter.Condition := edtTextCustomFilter.Text;
  TMSFNCDataGrid1.ApplyFilter;
end;

procedure TCellColoringFilters.btnClearFilterClick(Sender: TObject);
begin
  TMSFNCDataGrid1.ClearFilter;
end;

end.
