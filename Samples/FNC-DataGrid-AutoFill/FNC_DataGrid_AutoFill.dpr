program FNC_DataGrid_AutoFill;

uses
  VCL.Forms,
  AutoFill.Main in 'Src\AutoFill.Main.pas' {AutoFillMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TMS FNC DataGrid - AutoFill';
  Application.CreateForm(TAutoFillMain, AutoFillMain);
  Application.Run;
end.
