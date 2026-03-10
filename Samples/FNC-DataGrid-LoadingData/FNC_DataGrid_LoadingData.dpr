program FNC_DataGrid_LoadingData;

uses
  Vcl.Forms,
  DataGrid.LoadingData.Main.View in 'Src\DataGrid.LoadingData.Main.View.pas' {DataGridLoadingDataMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataGridLoadingDataMainView, DataGridLoadingDataMainView);
  Application.Run;
end.
