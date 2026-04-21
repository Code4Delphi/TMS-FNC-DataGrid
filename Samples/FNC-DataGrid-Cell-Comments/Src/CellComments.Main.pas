unit CellComments.Main;

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
  TCellCommentsMain = class(TForm)
    StatusBar1: TStatusBar;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    Panel1: TPanel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnClearGridClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure TMSFNCDataGrid1GetCellProperties(Sender: TObject; ACell: TTMSFNCDataGridCell);
  private

  public

  end;

var
  CellCommentsMain: TCellCommentsMain;

implementation

{$R *.dfm}

procedure TCellCommentsMain.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  TMSFNCDataGrid1.Clear;
  TMSFNCDataGrid1.LoadFromCSVData('..\Data\products.csv');
end;

procedure TCellCommentsMain.btnClearGridClick(Sender: TObject);
begin
  TMSFNCDataGrid1.Clear;
  TMSFNCDataGrid1.RowCount := 1;
end;

procedure TCellCommentsMain.Button1Click(Sender: TObject);
begin
  TMSFNCDataGrid1.Comments[2, 3] := 'Coment C4D';
end;

procedure TCellCommentsMain.TMSFNCDataGrid1GetCellProperties(Sender: TObject; ACell: TTMSFNCDataGridCell);
begin
  ACell.CommentIndicatorClick :=
    procedure(Sender: TObject)
    begin
      ShowMessage('Comment: ' + Grid.Comments[ACell.Column, ACell.Row]);
    end;
end;

end.
