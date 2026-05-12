program FNC_DataGrid_Excel_Behaviors;

uses
  Vcl.Forms,
  ExcelBehaviors.Main in 'Src\ExcelBehaviors.Main.pas' {ExcelBehaviorsMain},
  ImportExport.Utils in 'Src\ImportExport.Utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TMS FNC DataGrid - Cell Merging Splitting';
  Application.CreateForm(TExcelBehaviorsMain, ExcelBehaviorsMain);
  Application.Run;
end.
