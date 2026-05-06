program FNC_DataGrid_AutoComplete;

uses
  Vcl.Forms,
  AutoComplete.Main in 'Src\AutoComplete.Main.pas' {AutoCompleteMain},
  AutoComplete.Normal in 'Src\AutoComplete.Normal.pas' {AutoCompleteNormal},
  AutoComplete.LookupList in 'Src\AutoComplete.LookupList.pas' {AutoCompleteLookupList};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TMS FNC DataGrid - AutoComplete';
  Application.CreateForm(TAutoCompleteMain, AutoCompleteMain);
  Application.Run;
end.
