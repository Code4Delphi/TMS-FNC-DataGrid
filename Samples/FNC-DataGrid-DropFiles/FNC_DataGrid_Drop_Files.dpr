program FNC_DataGrid_Drop_Files;

uses
  Vcl.Forms,
  DropFiles.Main in 'Src\DropFiles.Main.pas' {DropFilesMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TMS FNC DataGrid - Drop Files';
  Application.CreateForm(TDropFilesMain, DropFilesMain);
  Application.Run;
end.
