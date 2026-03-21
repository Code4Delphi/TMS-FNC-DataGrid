program FNC_DataGrid_Pagination;

uses
  Vcl.Forms,
  Pagination.Main.View in 'Src\Pagination.Main.View.pas' {PaginationMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPaginationMainView, PaginationMainView);
  Application.Run;
end.
