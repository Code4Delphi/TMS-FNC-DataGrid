program FNC_DataGrid_Calculations;

uses
  Vcl.Forms,
  Calculations.Main.View in 'Src\Calculations.Main.View.pas' {CalculationsMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TCalculationsMainView, CalculationsMainView);
  Application.Run;
end.
