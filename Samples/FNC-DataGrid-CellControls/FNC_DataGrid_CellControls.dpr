program FNC_DataGrid_CellControls;

uses
  Vcl.Forms,
  DataGrid.Demo01.Main.View in 'Src\DataGrid.Demo01.Main.View.pas' {DataGridCellControlsMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataGridCellControlsMainView, DataGridCellControlsMainView);
  Application.Run;
end.
