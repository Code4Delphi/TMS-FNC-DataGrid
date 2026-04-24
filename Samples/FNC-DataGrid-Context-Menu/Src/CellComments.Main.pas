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
  TCellCommentsMain = class(TForm)
    StatusBar1: TStatusBar;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    btnAddCommetCustomized: TButton;
    mmCommentCustomized: TMemo;
    Panel2: TPanel;
    Label1: TLabel;
    edtColumn: TEdit;
    Label2: TLabel;
    edtRow: TEdit;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    btnAdd: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnClearGridClick(Sender: TObject);
    procedure btnAddCommetCustomizedClick(Sender: TObject);
    procedure TMSFNCDataGrid1GetCellProperties(Sender: TObject; ACell: TTMSFNCDataGridCell);
    procedure btnAddClick(Sender: TObject);
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

procedure TCellCommentsMain.btnAddClick(Sender: TObject);
begin
  TMSFNCDataGrid1.Comments[2, 3] := 'Coment C4D';
end;

procedure TCellCommentsMain.btnAddCommetCustomizedClick(Sender: TObject);
begin
  var LColumn := StrToIntDef(edtColumn.Text, 0);
  var LRow := StrToIntDef(edtRow.Text, 0);

  TMSFNCDataGrid1.Comments[LColumn, LRow] := mmCommentCustomized.Text;
end;

procedure TCellCommentsMain.TMSFNCDataGrid1GetCellProperties(Sender: TObject; ACell: TTMSFNCDataGridCell);
begin
  if ACell.Column = 6 then
  begin
    ACell.Comment := 'Column value: ' + TMSFNCDataGrid1.Cells[ACell.Column, ACell.Row].AsString;
    ACell.CommentIndicator := True;

    if Odd(ACell.Row) then
      ACell.CommentIndicatorColor := gcBlue
    else
      ACell.CommentIndicatorColor := gcOrange;
  end;
end;

end.
