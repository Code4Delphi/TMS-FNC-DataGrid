program FNC_DataGrid_Demo01;

uses
  Vcl.Forms,
  DataGrid.Demo01.Main.View in 'Src\DataGrid.Demo01.Main.View.pas' {DataGridDemo01MainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataGridDemo01MainView, DataGridDemo01MainView);
  Application.Run;
end.
