unit CRUD.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Rtti,
  System.Character,
  Vcl.StdCtrls,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  VCL.ExtCtrls,
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
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
  VCL.TMSFNCDataGrid,
  VCL.TMSFNCCustomComponent,
  VCL.TMSFNCDataGridDatabaseAdapter;

type
  TCRUDView = class(TForm)
    pnTop: TPanel;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    GroupBox2: TGroupBox;
    btnClose: TButton;
    btnOpenQuery: TButton;
    GroupBox4: TGroupBox;
    ckEditing: TCheckBox;
    FDQuery1Id: TFDAutoIncField;
    FDQuery1Name: TWideMemoField;
    FDQuery1Description: TWideMemoField;
    FDQuery1Active: TBooleanField;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    ckColumnSizing: TCheckBox;
    ckFixedColumnSizing: TCheckBox;
    ckColumnDragging: TCheckBox;
    ckStretching: TCheckBox;
    FDQuery1Limit: TIntegerField;
    FDQuery1Value: TFloatField;
    TMSFNCDataGridDatabaseAdapter1: TTMSFNCDataGridDatabaseAdapter;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cBoxInsertKeyHandling: TComboBox;
    Label2: TLabel;
    cBoxDeleteKeyHandling: TComboBox;
    GroupBox3: TGroupBox;
    btnInsertRowBefore: TButton;
    btnInsertRowTheEnd: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnOpenQueryClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure ckEditingClick(Sender: TObject);
    procedure ckCheckBoxFieldClick(Sender: TObject);
    procedure ckShowPictureFieldsClick(Sender: TObject);
    procedure TMSFNCDataGrid1CanDeleteRow(Sender: TObject; ARow: Integer; var ACanDelete: Boolean);
    procedure TMSFNCDataGrid1GetCellFormatting(Sender: TObject; ACell: TTMSFNCDataGridCellCoord;
      AData: TTMSFNCDataGridCellValue; var AFormatting: TTMSFNCDataGridDataFormatting;
      var AConvertSettings: TFormatSettings; var ACanFormat: Boolean);
    procedure btnInsertRowBeforeClick(Sender: TObject);
    procedure btnInsertRowTheEndClick(Sender: TObject);
  private
    procedure Configs;
  public

  end;

var
  CRUDView: TCRUDView;

implementation

{$R *.dfm}

procedure TCRUDView.FormCreate(Sender: TObject);
begin
  FDConnection1.Params.Database := '..\Data\CRUD.db';
  FDQuery1.Open;
  Self.Configs;
end;

procedure TCRUDView.ckEditingClick(Sender: TObject);
begin
  Self.Configs;
end;

procedure TCRUDView.Configs;
begin
  TMSFNCDataGrid1.Options.Editing.Enabled := ckEditing.Checked;

  TMSFNCDataGrid1.Options.Mouse.ColumnSizing := ckColumnSizing.Checked;
  TMSFNCDataGrid1.Options.Mouse.FixedColumnSizing := ckFixedColumnSizing.Checked;
  TMSFNCDataGrid1.Options.Mouse.ColumnDragging := ckColumnDragging.Checked;

  TMSFNCDataGrid1.Options.Column.Stretching.Enabled := ckStretching.Checked;

  TMSFNCDataGrid1.Options.Keyboard.InsertKeyHandling := TTMSFNCDataGridInsertKeyHandling(cBoxInsertKeyHandling.ItemIndex);
  TMSFNCDataGrid1.Options.Keyboard.DeleteKeyHandling := TTMSFNCDataGridDeleteKeyHandling(cBoxDeleteKeyHandling.ItemIndex);
end;

procedure TCRUDView.TMSFNCDataGrid1CanDeleteRow(Sender: TObject; ARow: Integer; var ACanDelete: Boolean);
begin
  ACanDelete := messageDlg('Are you sure you want to delete this row?', mtConfirmation, [mbYes, mbNo], 0) = mrYes;
end;

procedure TCRUDView.TMSFNCDataGrid1GetCellFormatting(Sender: TObject; ACell: TTMSFNCDataGridCellCoord;
  AData: TTMSFNCDataGridCellValue; var AFormatting: TTMSFNCDataGridDataFormatting;
  var AConvertSettings: TFormatSettings; var ACanFormat: Boolean);
begin
  if (ACell.Row < TMSFNCDataGrid1.FixedRowCount) or (ACell.Row = Pred(TMSFNCDataGrid1.RowCount)) then
    Exit;

  if AData.Kind = TTypeKind.tkFloat then
  begin
    AFormatting.&Type := gdftFloat;
    AFormatting.Format := '#,##0.00';
    ACanFormat := True;
  end;
end;

procedure TCRUDView.ckCheckBoxFieldClick(Sender: TObject);
begin
  Self.Configs;
  FDQuery1.Refresh;
end;

procedure TCRUDView.ckShowPictureFieldsClick(Sender: TObject);
begin
  Self.Configs;
  FDQuery1.Refresh;
end;

procedure TCRUDView.btnOpenQueryClick(Sender: TObject);
begin
  FDQuery1.Open;
  Self.Configs;
end;

procedure TCRUDView.btnCloseClick(Sender: TObject);
begin
  FDQuery1.Close;
end;

procedure TCRUDView.btnInsertRowBeforeClick(Sender: TObject);
begin
  TMSFNCDataGridDatabaseAdapter1.DataSetInsert;
end;

procedure TCRUDView.btnInsertRowTheEndClick(Sender: TObject);
begin
  FDQuery1.Append;
  TMSFNCDataGrid1.SetFocus;
end;

end.
