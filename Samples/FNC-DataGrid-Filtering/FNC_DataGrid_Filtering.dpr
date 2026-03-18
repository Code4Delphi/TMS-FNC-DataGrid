program FNC_DataGrid_Filtering;

uses
  Vcl.Forms,
  Filtering.Main.View in 'Src\Filtering.Main.View.pas' {FilteringMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFilteringMainView, FilteringMainView);
  Application.Run;
end.
