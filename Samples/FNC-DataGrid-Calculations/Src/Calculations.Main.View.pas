unit Calculations.Main.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Calculations.SumMonths.View,
  Calculations.AggregateFunctions.View;

type
  TCalculationsMainView = class(TForm)
    Panel1: TPanel;
    btnCalculationsSumMonths: TButton;
    btnCalculationsAggregateFunctionsView: TButton;
    procedure btnCalculationsSumMonthsClick(Sender: TObject);
    procedure btnCalculationsAggregateFunctionsViewClick(Sender: TObject);
  private

  public

  end;

var
  CalculationsMainView: TCalculationsMainView;

implementation

{$R *.dfm}

procedure TCalculationsMainView.btnCalculationsSumMonthsClick(Sender: TObject);
begin
  CalculationsSumMonthsView.ShowModal;
end;

procedure TCalculationsMainView.btnCalculationsAggregateFunctionsViewClick(Sender: TObject);
begin
  CalculationsAggregateFunctionsView.ShowModal;
end;

end.
