program FNC_DataGrid_Memo_Boolean_Image;

uses
  Vcl.Forms,
  MemoBooleanImage.View in 'Src\MemoBooleanImage.View.pas' {MemoBooleanImageView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TMS FNC DataGrid - Memo Fields, Boolean Fields & Image Blobs';
  Application.CreateForm(TMemoBooleanImageView, MemoBooleanImageView);
  Application.Run;
end.
