program FNC_DataGrid_Master_Detail;

uses
  Vcl.Forms,
  Master.Detail.View in 'Src\Master.Detail.View.pas' {MasterDetailView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TMS FNC DataGrid - Master Detail';
  Application.CreateForm(TMasterDetailView, MasterDetailView);
  Application.Run;
end.
