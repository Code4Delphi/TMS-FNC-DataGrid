program FNC_DataGrid_Pagination;

uses
  Vcl.Forms,
  Pagination.Programmatic in 'Src\Pagination.Programmatic.pas' {PaginationProgrammatic},
  Pagination.IntegratedFooter in 'Src\Pagination.IntegratedFooter.pas' {PaginationIntegratedFooter},
  Pagination.Main in 'Src\Pagination.Main.pas' {PaginationMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPaginationMain, PaginationMain);
  Application.CreateForm(TPaginationProgrammatic, PaginationProgrammatic);
  Application.CreateForm(TPaginationIntegratedFooter, PaginationIntegratedFooter);
  Application.Run;
end.
