program FNC_DataGrid_Conditional_Formatting;

uses
  Vcl.Forms,
  ConditionalFormatting.View in 'Src\ConditionalFormatting.View.pas' {ConditionalFormattingView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TConditionalFormattingView, ConditionalFormattingView);
  Application.Run;
end.
