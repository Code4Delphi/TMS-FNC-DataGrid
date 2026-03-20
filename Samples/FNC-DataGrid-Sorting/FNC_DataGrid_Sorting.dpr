program FNC_DataGrid_Sorting;

uses
  Vcl.Forms,
  Sorting.Main.View in 'Src\Sorting.Main.View.pas' {SortingMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TSortingMainView, SortingMainView);
  Application.Run;
end.
