program FNC_DataGrid_Appearance;

uses
  Vcl.Forms,
  Appearance.Light in 'Src\Appearance.Light.pas' {AppearanceLight},
  Appearance.Dark in 'Src\Appearance.Dark.pas' {AppearanceDark},
  Appearance.Main in 'Src\Appearance.Main.pas' {AppearanceMain},
  Appearance.Grouping in 'Src\Appearance.Grouping.pas' {AppearanceGrouping};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TMS FNC DataGrid - Appearance';
  Application.CreateForm(TAppearanceMain, AppearanceMain);
  Application.CreateForm(TAppearanceLight, AppearanceLight);
  Application.CreateForm(TAppearanceDark, AppearanceDark);
  Application.CreateForm(TAppearanceGrouping, AppearanceGrouping);
  Application.Run;
end.
