program FNC_DataGrid_Replace_Dialog;

uses
  Vcl.Forms,
  ReplaceDialog.Main in 'Src\ReplaceDialog.Main.pas' {ReplaceDialogMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TMS FNC DataGrid - Find Dialog';
  Application.CreateForm(TReplaceDialogMain, ReplaceDialogMain);
  Application.Run;
end.
