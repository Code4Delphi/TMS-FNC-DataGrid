program FNC_DataGrid_CellControls;

uses
  Vcl.Forms,
  DataGrid.CellControls.Main.View in 'Src\DataGrid.CellControls.Main.View.pas' {DataGridCellControlsMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataGridCellControlsMainView, DataGridCellControlsMainView);
  Application.Run;
end.
