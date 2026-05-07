unit DropFiles.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.UITypes,
  System.Rtti,
  Data.DB,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.Menus,
  VCL.TMSFNCTypes,
  VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes,
  VCL.TMSFNCDataGridCell,
  VCL.TMSFNCDataGridData,
  VCL.TMSFNCDataGridBase,
  VCL.TMSFNCDataGridCore,
  VCL.TMSFNCDataGridRenderer,
  VCL.TMSFNCCustomControl,
  VCL.TMSFNCDataGrid;

type
  TDropFilesMain = class(TForm)
    StatusBar1: TStatusBar;
    pnTop: TPanel;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    btnClearGrid: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure TMSFNCDataGrid1DropFiles(Sender: TObject; ADropFiles: TTMSFNCCustomControlDropFiles);
    procedure btnClearGridClick(Sender: TObject);
    procedure TMSFNCDataGrid1DragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
  private
    procedure ClearGrid;

  public

  end;

var
  DropFilesMain: TDropFilesMain;

implementation

{$R *.dfm}

procedure TDropFilesMain.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  Self.ClearGrid;

  TMSFNCDataGrid1.AcceptDropFiles := True;
end;

procedure TDropFilesMain.btnClearGridClick(Sender: TObject);
begin
  Self.ClearGrid;
end;

procedure TDropFilesMain.ClearGrid;
begin
  TMSFNCDataGrid1.Clear;
  TMSFNCDataGrid1.RowCount := 1;
  TMSFNCDataGrid1.ColumnCount := 1;
end;

procedure TDropFilesMain.TMSFNCDataGrid1DragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState;
  var Accept: Boolean);
var
  LControlDropFiles: TTMSFNCCustomControlDropFiles;
  LAccept: Boolean;
begin
  if IsSourceDropFiles(Source) then
  begin
    LControlDropFiles := AsSourceDropFiles(Source);
    LAccept := False;

    for var i := 0 to Pred(LControlDropFiles.Files.Count) do
    begin
      if ExtractFileExt(LControlDropFiles.Files[i]) = '.csv' then
      begin
        LAccept := True;
        Break;
      end
      else
      begin
        ShowMessage('Files with the '+ ExtractFileExt(LControlDropFiles.Files[i]) + ' extension are not accepted.');
      end;
    end;

    Accept := LAccept;
  end;
end;

procedure TDropFilesMain.TMSFNCDataGrid1DropFiles(Sender: TObject; ADropFiles: TTMSFNCCustomControlDropFiles);
begin
  //Self.ClearGrid;

  for var I := 0 to Pred(ADropFiles.Files.Count) do
  begin
    var LFileName := ADropFiles.Files[I];
    if ExtractFileExt(LFileName) <> '.csv' then
      Continue;

    if TMSFNCDataGrid1.RowCount <= 1 then
      TMSFNCDataGrid1.Options.IO.StartRow := 0
    else
      TMSFNCDataGrid1.Options.IO.StartRow := TMSFNCDataGrid1.RowCount;

    TMSFNCDataGrid1.LoadFromCSVData(LFileName);
  end;

  TMSFNCDataGrid1.Options.IO.StartRow := 0;
end;

end.
