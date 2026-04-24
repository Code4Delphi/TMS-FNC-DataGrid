program FNC_DataGrid_Context_Menu;

uses
  Vcl.Forms,
  ContextMenu.Main in 'Src\ContextMenu.Main.pas' {ContextMenuMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TMS FNC DataGrid - Context Menu';
  Application.CreateForm(TContextMenuMain, ContextMenuMain);
  Application.Run;
end.
