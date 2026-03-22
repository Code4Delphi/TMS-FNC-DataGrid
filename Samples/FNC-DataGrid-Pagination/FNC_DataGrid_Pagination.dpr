program FNC_DataGrid_Pagination;

uses
  Vcl.Forms,
  Pagination.Programmatic.View in 'Src\Pagination.Programmatic.View.pas' {PaginationProgrammaticView},
  Pagination.Main.View in 'Src\Pagination.Main.View.pas' {PaginationMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPaginationProgrammaticView, PaginationProgrammaticView);
  Application.CreateForm(TPaginationMainView, PaginationMainView);
  Application.Run;
end.
