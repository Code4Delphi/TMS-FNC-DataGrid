program FNC_DataGrid_AutoComplete;

uses
  Vcl.Forms,
  AutoComplete.Main in 'Src\AutoComplete.Main.pas' {AutoCompleteMain},
  AutoComplete.Normal in 'Src\AutoComplete.Normal.pas' {AutoCompleteNormal},
  AutoComplete.LookupList in 'Src\AutoComplete.LookupList.pas' {AutoCompleteLookupList},
  AutoComplete.LookupList.Automatic in 'Src\AutoComplete.LookupList.Automatic.pas' {AutoCompleteLookupListAutomatic};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TMS FNC DataGrid - AutoComplete';
  Application.CreateForm(TAutoCompleteMain, AutoCompleteMain);
  Application.CreateForm(TAutoCompleteNormal, AutoCompleteNormal);
  Application.CreateForm(TAutoCompleteLookupList, AutoCompleteLookupList);
  Application.CreateForm(TAutoCompleteLookupListAutomatic, AutoCompleteLookupListAutomatic);
  Application.Run;
end.
