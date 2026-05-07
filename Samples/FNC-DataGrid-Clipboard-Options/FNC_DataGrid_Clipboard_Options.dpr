program FNC_DataGrid_Clipboard_Options;

uses
  Vcl.Forms,
  ClipboardOptions.Main in 'Src\ClipboardOptions.Main.pas' {ClipboardOptionsMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TMS FNC DataGrid - Clipboard Options';
  Application.CreateForm(TClipboardOptionsMain, ClipboardOptionsMain);
  Application.Run;
end.
