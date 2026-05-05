program FNC_DataGrid_Keyboard_Lookup;

uses
  Vcl.Forms,
  KeyboardLookup.Main in 'Src\KeyboardLookup.Main.pas' {KeyboardLookupMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TMS FNC DataGrid - Keyboard Lookup';
  Application.CreateForm(TKeyboardLookupMain, KeyboardLookupMain);
  Application.Run;
end.
