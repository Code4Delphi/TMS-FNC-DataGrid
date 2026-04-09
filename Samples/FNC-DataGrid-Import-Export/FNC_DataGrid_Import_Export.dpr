program FNC_DataGrid_Import_Export;

uses
  Vcl.Forms,
  ImportExport.Main in 'Src\ImportExport.Main.pas' {ImportExportMain},
  ImportExport.Utils in 'Src\ImportExport.Utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TMS FNC DataGrid - Import and Export';
  Application.CreateForm(TImportExportMain, ImportExportMain);
  Application.Run;
end.
