program FNC_DataGrid_Global_Font;

uses
  Vcl.Forms,
  GlobalFont.View in 'Src\GlobalFont.View.pas' {GlobalFontView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TMS FNC DataGrid - Global Font';
  Application.CreateForm(TGlobalFontView, GlobalFontView);
  Application.Run;
end.
