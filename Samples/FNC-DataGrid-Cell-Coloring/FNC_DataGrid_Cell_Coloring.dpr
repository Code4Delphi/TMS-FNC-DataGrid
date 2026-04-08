program FNC_DataGrid_Cell_Coloring;

uses
  Vcl.Forms,
  CellColoring.Filters in 'Src\CellColoring.Filters.pas' {CellColoringFilters},
  CellColoring.Events in 'Src\CellColoring.Events.pas' {CellColoringEvents},
  CellColoring.Main in 'Src\CellColoring.Main.pas' {CellColoringMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TCellColoringMain, CellColoringMain);
  Application.CreateForm(TCellColoringFilters, CellColoringFilters);
  Application.CreateForm(TCellColoringEvents, CellColoringEvents);
  Application.Run;
end.
