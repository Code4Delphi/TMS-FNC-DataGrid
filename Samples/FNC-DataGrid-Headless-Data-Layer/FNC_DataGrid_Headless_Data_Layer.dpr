program FNC_DataGrid_Headless_Data_Layer;

uses
  Vcl.Forms,
  HeadlessDataLayer.View in 'Src\HeadlessDataLayer.View.pas' {HeadlessDataLayerView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TMS FNC DataGrid - Global Font';
  Application.CreateForm(THeadlessDataLayerView, HeadlessDataLayerView);
  Application.Run;
end.
