program FNC_DataGrid_Calculations;

uses
  Vcl.Forms,
  Calculations.SumMonths.View in 'Src\Calculations.SumMonths.View.pas' {CalculationsSumMonthsView},
  Calculations.Main.View in 'Src\Calculations.Main.View.pas' {CalculationsMainView},
  Calculations.AggregateFunctions.View in 'Src\Calculations.AggregateFunctions.View.pas' {CalculationsAggregateFunctionsView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TCalculationsMainView, CalculationsMainView);
  Application.CreateForm(TCalculationsSumMonthsView, CalculationsSumMonthsView);
  Application.CreateForm(TCalculationsAggregateFunctionsView, CalculationsAggregateFunctionsView);
  Application.Run;
end.
