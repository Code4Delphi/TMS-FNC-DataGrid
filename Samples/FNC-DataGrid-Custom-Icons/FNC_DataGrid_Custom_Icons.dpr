program FNC_DataGrid_Custom_Icons;

uses
  Vcl.Forms,
  CustomIcons.Main in 'Src\CustomIcons.Main.pas' {CustomIconsMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TMS FNC DataGrid - Custom Icons';
  Application.CreateForm(TCustomIconsMain, CustomIconsMain);
  Application.Run;
end.
