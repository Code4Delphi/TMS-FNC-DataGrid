program FNC_DataGrid_Localization;

uses
  Vcl.Forms,
  Localization.Departments.View in 'Src\Localization.Departments.View.pas' {LocalizationDepartmentsView},
  Localization.Main.View in 'Src\Localization.Main.View.pas' {LocalizationMainView},
  Localization.Config in 'Src\Localization.Config.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TLocalizationMainView, LocalizationMainView);
  Application.Run;
end.
