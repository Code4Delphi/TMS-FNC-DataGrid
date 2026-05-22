program FNC_DataGrid_HTML_Templates;

uses
  Vcl.Forms,
  HTMLTemplates.View in 'Src\HTMLTemplates.View.pas' {HTMLTemplatesView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TMS FNC DataGrid - HTML Templates';
  Application.CreateForm(THTMLTemplatesView, HTMLTemplatesView);
  Application.Run;
end.
