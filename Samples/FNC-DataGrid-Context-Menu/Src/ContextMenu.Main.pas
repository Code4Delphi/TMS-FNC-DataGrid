unit ContextMenu.Main;

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
  TContextMenuMain = class(TForm)
    StatusBar1: TStatusBar;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    PopupMenuOthers: TPopupMenu;
    PupupMenuOthers1: TMenuItem;
    GetHeaderAndValueOuther1: TMenuItem;
    Item031: TMenuItem;
    Subitem011: TMenuItem;
    Subitem021: TMenuItem;
    PopupMenuSalePrice: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    Item041: TMenuItem;
    ckPopupMenuForAll: TCheckBox;
    ckUse2DifferentPopupMenus: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure GetHeaderAndValueOuther1Click(Sender: TObject);
    procedure TMSFNCDataGrid1CellBeforeShowPopupMenu(Sender: TObject; ACell: TTMSFNCDataGridCellCoord;
      APopupMenu: TTMSFNCDataGridPopupMenu; var ACanShow: Boolean);
    procedure ckPopupMenuForAllClick(Sender: TObject);
    procedure TMSFNCDataGrid1CellRightClick(Sender: TObject; AColumn, ARow: Integer);
  private

  public

  end;

var
  ContextMenuMain: TContextMenuMain;

implementation

{$R *.dfm}


procedure TContextMenuMain.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  TMSFNCDataGrid1.Clear;
  TMSFNCDataGrid1.LoadFromCSVData('..\Data\products.csv');
end;

procedure TContextMenuMain.ckPopupMenuForAllClick(Sender: TObject);
begin
  TMSFNCDataGrid1.CellPopupMenu := nil;

  if ckPopupMenuForAll.Checked then
    TMSFNCDataGrid1.CellPopupMenu := PopupMenuOthers;
end;

procedure TContextMenuMain.GetHeaderAndValueOuther1Click(Sender: TObject);
begin
  var LCol := TMSFNCDataGrid1.FocusedCell.Column;
  var LRow := TMSFNCDataGrid1.FocusedCell.Row;
  var LHeader:= TMSFNCDataGrid1.Cells[LCol, 0].AsString;
  var LValue := TMSFNCDataGrid1.Cells[LCol, LRow].AsString;

  ShowMessage('PopupMenuOthers - ' + LHeader + ': ' + LValue);
end;

procedure TContextMenuMain.TMSFNCDataGrid1CellBeforeShowPopupMenu(Sender: TObject; ACell: TTMSFNCDataGridCellCoord;
  APopupMenu: TTMSFNCDataGridPopupMenu; var ACanShow: Boolean);
begin
  if ckUse2DifferentPopupMenus.Checked then
  begin
    if ACell.Column = TMSFNCDataGrid1.ColumnIndexByHeader('Sale price') then
      TMSFNCDataGrid1.CellPopupMenu := PopupMenuSalePrice
    else
      TMSFNCDataGrid1.CellPopupMenu := PopupMenuOthers;

    //SUPPRESS ON FIXED ROWS
    if ACell.Row < TMSFNCDataGrid1.FixedRowCount then
      ACanShow := False;
  end;
end;

procedure TContextMenuMain.TMSFNCDataGrid1CellRightClick(Sender: TObject; AColumn, ARow: Integer);
begin
  if not ckPopupMenuForAll.Checked then
    ShowMessage(Format('Right-clicked col %d, row %d, valor %s', [AColumn, ARow, TMSFNCDataGrid1.Cells[AColumn, ARow].AsString]));
end;

end.
