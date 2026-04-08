program FNC_DataGrid_Cell_Coloring;

uses
  Vcl.Forms,
  CellColoring.Advanced in 'Src\CellColoring.Advanced.pas' {CellColoringAdvanced},
  CellColoring.Events in 'Src\CellColoring.Events.pas' {CellColoringEvents},
  CellColoring.Main in 'Src\CellColoring.Main.pas' {CellColoringMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TCellColoringMain, CellColoringMain);
  Application.CreateForm(TCellColoringAdvanced, CellColoringAdvanced);
  Application.CreateForm(TCellColoringEvents, CellColoringEvents);
  Application.Run;
end.
