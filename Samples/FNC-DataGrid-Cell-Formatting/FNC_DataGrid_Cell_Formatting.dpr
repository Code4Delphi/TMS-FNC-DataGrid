program FNC_DataGrid_Cell_Formatting;

uses
  Vcl.Forms,
  Cell.Formatting.View in 'Src\Cell.Formatting.View.pas' {CellFormattingView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TMS FNC DataGrid - Cell Formatting';
  Application.CreateForm(TCellFormattingView, CellFormattingView);
  Application.Run;
end.
