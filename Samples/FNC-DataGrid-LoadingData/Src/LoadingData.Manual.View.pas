unit LoadingData.Manual.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes, System.Rtti, VCL.TMSFNCDataGridCell, VCL.TMSFNCDataGridData, VCL.TMSFNCDataGridBase,
  VCL.TMSFNCDataGridCore, VCL.TMSFNCDataGridRenderer, VCL.TMSFNCCustomControl, VCL.TMSFNCDataGrid, Vcl.StdCtrls;

type
  TLoadingDataManualView = class(TForm)
    pnTop: TPanel;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    btnClear: TButton;
    btnLoad: TButton;
    procedure btnLoadClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure LoadManualData;
    procedure ConfigGrid;

  public

  end;

var
  LoadingDataManualView: TLoadingDataManualView;

implementation

{$R *.dfm}

procedure TLoadingDataManualView.FormCreate(Sender: TObject);
begin
  Self.ConfigGrid;
  Self.LoadManualData;
end;

procedure TLoadingDataManualView.ConfigGrid;
begin
  //Allows you to resize the column widths using the mouse
  TMSFNCDataGrid1.Options.Mouse.ColumnSizing := True;
  //It allows you to resize columns even when the mouse is over the header (fixed cells)
  TMSFNCDataGrid1.Options.Mouse.FixedColumnSizing := True;
  //Defines the resizing mode: gszmOneSided only changes the current column
  TMSFNCDataGrid1.Options.Mouse.ColumnSizingMode := gszmOneSided;
  //Allows you to drag the column headers to rearrange their order
  TMSFNCDataGrid1.Options.Mouse.ColumnDragging := True;
  //It causes the grid columns to automatically adjust to fill the entire available width of the component.
  TMSFNCDataGrid1.Options.Column.Stretching.Enabled := True;

  //Banding (zebra effect) on the grid, that is, it applies alternating colors to the
  TMSFNCDataGrid1.Options.Banding.Enabled := True;
  TMSFNCDataGrid1.CellAppearance.BandLayout.Fill.Color := Lighter(TMSFNCDataGrid1.CellAppearance.SelectedLayout.Fill.Color, 50);
  TMSFNCDataGrid1.CellAppearance.SelectedLayout.Fill.Color := Darker(TMSFNCDataGrid1.CellAppearance.SelectedLayout.Fill.Color, 20);
end;

procedure TLoadingDataManualView.btnLoadClick(Sender: TObject);
begin
  Self.LoadManualData;
end;

procedure TLoadingDataManualView.LoadManualData;
begin
  TMSFNCDataGrid1.BeginUpdate;
  try
    TMSFNCDataGrid1.ColumnCount := 8;
    TMSFNCDataGrid1.RowCount := 3;

    // Headers
    TMSFNCDataGrid1.Columns[0].Header := 'Sequential';
    TMSFNCDataGrid1.Columns[1].Header := 'Department';
    TMSFNCDataGrid1.Columns[2].Header := 'Description';
    TMSFNCDataGrid1.Columns[3].Header := 'Number';
    TMSFNCDataGrid1.Columns[4].Header := 'RegistrationDate';
    TMSFNCDataGrid1.Columns[5].Header := 'Limit';
    TMSFNCDataGrid1.Columns[6].Header := 'Status';
    TMSFNCDataGrid1.Columns[7].Header := 'HTMLEditor';

    // Sequential Auto Number
    TMSFNCDataGrid1.AutoNumberColumn(0, 1, 1);

    // Record 1
    TMSFNCDataGrid1.Cells[1, 1] := 'Deliveries';
    TMSFNCDataGrid1.Cells[2, 1] := 'Description 17';
    TMSFNCDataGrid1.Cells[3, 1] := 5;
    TMSFNCDataGrid1.Cells[4, 1] := StrToDate('15/11/2026');
    TMSFNCDataGrid1.Cells[5, 1] := 6163.91;
    TMSFNCDataGrid1.Cells[6, 1] := False;
    TMSFNCDataGrid1.Cells[7, 1] := '<b>This</b> is <i><a href="https://www.code4delphi.com.br">HTML link</a></i>';

    // Record 2
    TMSFNCDataGrid1.Cells[1, 2] := 'Human resources';
    TMSFNCDataGrid1.Cells[2, 2] := 'Description 92';
    TMSFNCDataGrid1.Cells[3, 2] := 7;
    TMSFNCDataGrid1.Cells[4, 2] := StrToDate('21/10/2025');
    TMSFNCDataGrid1.Cells[5, 2] := 249.25;
    TMSFNCDataGrid1.Cells[6, 2] := False;
    TMSFNCDataGrid1.Cells[7, 2] := '<b>This</b> is <i><a href="https://www.tmssoftware.com/site/tmsfncuipack-grid.asp">HTML link</a></i>';
  finally
    TMSFNCDataGrid1.EndUpdate;
  end;
end;

procedure TLoadingDataManualView.btnClearClick(Sender: TObject);
begin
  TMSFNCDataGrid1.BeginUpdate;
  try
    TMSFNCDataGrid1.Clear;
    TMSFNCDataGrid1.RowCount := 1;
  finally
    TMSFNCDataGrid1.EndUpdate;
  end;
end;

end.
