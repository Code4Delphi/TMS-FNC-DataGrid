program FNC_DataGrid_Cell_Comments;

uses
  Vcl.Forms,
  CellComments.Main in 'Src\CellComments.Main.pas' {CellCommentsMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TMS FNC DataGrid - Import and Export';
  Application.CreateForm(TCellCommentsMain, CellCommentsMain);
  Application.Run;
end.
