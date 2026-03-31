program FNC_DataGrid_Grouping;

uses
  Vcl.Forms,
  Grouping.Advanced in 'Src\Grouping.Advanced.pas' {GroupingAdvanced},
  Grouping.Basic in 'Src\Grouping.Basic.pas' {GroupingBasic},
  Grouping.Main in 'Src\Grouping.Main.pas' {GroupingMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TGroupingMain, GroupingMain);
  Application.CreateForm(TGroupingAdvanced, GroupingAdvanced);
  Application.CreateForm(TGroupingBasic, GroupingBasic);
  Application.Run;
end.
