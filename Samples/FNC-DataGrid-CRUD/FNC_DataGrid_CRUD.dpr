program FNC_DataGrid_CRUD;

uses
  Vcl.Forms,
  CRUD.View in 'Src\CRUD.View.pas' {CRUDView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TMS FNC DataGrid - Memo Fields, Boolean Fields & Image Blobs';
  Application.CreateForm(TCRUDView, CRUDView);
  Application.Run;
end.
