program FNC_DataGrid_Cell_Merging_Splitting;

uses
  Vcl.Forms,
  CellMergingSplitting.Main in 'Src\CellMergingSplitting.Main.pas' {CellMergingSplittingMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TMS FNC DataGrid - Cell Merging Splitting';
  Application.CreateForm(TCellMergingSplittingMain, CellMergingSplittingMain);
  Application.Run;
end.
