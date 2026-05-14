program FNC_DataGrid_Appearance;

uses
  Vcl.Forms,
  Appearance.Main in 'Src\Appearance.Main.pas' {AppearanceMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TMS FNC DataGrid - Appearance';
  Application.CreateForm(TAppearanceMain, AppearanceMain);
  Application.Run;
end.
