program FNC_DataGrid_Grouping_Visual;

uses
  Vcl.Forms,
  Grouping.Visual.View in 'Src\Grouping.Visual.View.pas' {GroupingVisualView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TGroupingVisualView, GroupingVisualView);
  Application.Run;
end.
