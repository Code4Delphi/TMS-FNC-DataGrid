program FNC_DataGrid_WEB;



{$R *.dres}

uses
  Vcl.Forms,
  WEBLib.Forms,
  WebCore.Main.View in 'Src\WebCore.Main.View.pas' {MainView: TWebForm} {*.html};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainView, MainView);
  Application.Run;
end.
