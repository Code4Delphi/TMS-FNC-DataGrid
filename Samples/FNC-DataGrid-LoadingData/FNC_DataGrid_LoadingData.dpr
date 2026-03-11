program FNC_DataGrid_LoadingData;

uses
  Vcl.Forms,
  LoadingData.Main.View in 'Src\LoadingData.Main.View.pas' {LoadingDataMainView},
  LoadingData.Manual.View in 'Src\LoadingData.Manual.View.pas' {LoadingDataManualView},
  LoadingData.CSV.View in 'Src\LoadingData.CSV.View.pas' {LoadingDataCSVView},
  LoadingData.Utils in 'Src\LoadingData.Utils.pas',
  LoadingData.Excel.View in 'Src\LoadingData.Excel.View.pas' {LoadingDataExcelView},
  LoadingData.Database.View in 'Src\LoadingData.Database.View.pas' {LoadingDataDatabaseView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TLoadingDataMainView, LoadingDataMainView);
  Application.CreateForm(TLoadingDataManualView, LoadingDataManualView);
  Application.CreateForm(TLoadingDataCSVView, LoadingDataCSVView);
  Application.CreateForm(TLoadingDataExcelView, LoadingDataExcelView);
  Application.CreateForm(TLoadingDataDatabaseView, LoadingDataDatabaseView);
  Application.Run;
end.
