program FNC_DataGrid_Calculations_FMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  Calculations.Custom.View in 'Src\Calculations.Custom.View.pas' {CalculationsCustomView};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TCalculationsCustomView, CalculationsCustomView);
  Application.Run;
end.
