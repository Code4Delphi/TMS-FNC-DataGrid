unit AutoComplete.LookupList.Automatic;

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
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
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
  VCL.TMSFNCDataGrid, System.Rtti;

type
  TAutoCompleteLookupListAutomatic = class(TForm)
    StatusBar1: TStatusBar;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    pnlOptions: TPanel;
    chkCaseSensitive: TCheckBox;
    procedure chkCaseSensitiveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TMSFNCDataGrid1BeforeOpenInplaceEditor(Sender: TObject; ACell: TTMSFNCDataGridCellCoord;
      var AValue: TTMSFNCDataGridCellValue; var ACanOpen: Boolean);
  private
    procedure ConfigureAutoComplete;
    procedure PopulateAutoCompleteItemsForColumn(AColumn: Integer);
    procedure UpdateCaseSensitive;
  public

  end;

var
  AutoCompleteLookupListAutomatic: TAutoCompleteLookupListAutomatic;

implementation

{$R *.dfm}

procedure TAutoCompleteLookupListAutomatic.FormCreate(Sender: TObject);
begin
  TMSFNCDataGrid1.Clear;
  TMSFNCDataGrid1.LoadFromCSVData('..\Data\products.csv');
  Self.ConfigureAutoComplete;
end;

procedure TAutoCompleteLookupListAutomatic.ConfigureAutoComplete;
begin
  TMSFNCDataGrid1.Options.Editing.AutoComplete.&Type := gactLookupList;
  TMSFNCDataGrid1.Options.Editing.DirectDropDown := False;
  Self.UpdateCaseSensitive;
end;

procedure TAutoCompleteLookupListAutomatic.chkCaseSensitiveClick(Sender: TObject);
begin
  Self.UpdateCaseSensitive;
end;

procedure TAutoCompleteLookupListAutomatic.UpdateCaseSensitive;
begin
  TMSFNCDataGrid1.Options.Editing.AutoComplete.CaseSensitive := chkCaseSensitive.Checked;
end;

procedure TAutoCompleteLookupListAutomatic.TMSFNCDataGrid1BeforeOpenInplaceEditor(Sender: TObject;
  ACell: TTMSFNCDataGridCellCoord; var AValue: TTMSFNCDataGridCellValue; var ACanOpen: Boolean);
begin
  if ACanOpen and (ACell.Row >= TMSFNCDataGrid1.FixedRowCount) then
    Self.PopulateAutoCompleteItemsForColumn(ACell.Column);
end;

procedure TAutoCompleteLookupListAutomatic.PopulateAutoCompleteItemsForColumn(AColumn: Integer);
var
  LItems: TStrings;
  LRow: Integer;
  LValue: string;
begin
  LItems := TMSFNCDataGrid1.Options.Editing.AutoComplete.Items;
  LItems.Clear;

  for LRow := TMSFNCDataGrid1.FixedRowCount to Pred(TMSFNCDataGrid1.RowCount) do
  begin
    LValue := TMSFNCDataGrid1.Cells[AColumn, LRow].AsString;
    if (LValue <> '') and (LItems.IndexOf(LValue) = -1) then
      LItems.Add(LValue);
  end;
end;

end.
