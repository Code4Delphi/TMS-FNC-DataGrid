program FNC_DataGrid_Find_Dialog;

uses
  Vcl.Forms,
  FindDialog.Main in 'Src\FindDialog.Main.pas' {FindDialogMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TMS FNC DataGrid - Find Dialog';
  Application.CreateForm(TFindDialogMain, FindDialogMain);
  Application.Run;
end.
