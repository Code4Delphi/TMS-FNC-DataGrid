program FNC_DataGrid_Cell_Formatting;

uses
  Vcl.Forms,
  Cell.Formatting in 'Src\Cell.Formatting.pas' {CellFormatting};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TMS FNC DataGrid - Cell Formatting';
  Application.CreateForm(TCellFormatting, CellFormatting);
  Application.Run;
end.
