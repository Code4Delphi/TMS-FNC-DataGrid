unit HTMLTemplates.View;

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
  THTMLTemplatesView = class(TForm)
    pnTop: TPanel;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDQuery1Id: TIntegerField;
    FDQuery1Department: TWideStringField;
    FDQuery1Description: TWideStringField;
    FDQuery1Number: TIntegerField;
    FDQuery1RegistrationDate: TWideStringField;
    FDQuery1LimitValue: TFloatField;
    FDQuery1Status: TIntegerField;
    DataSource1: TDataSource;
    TMSFNCDataGridDatabaseAdapter1: TTMSFNCDataGridDatabaseAdapter;
    GroupBox2: TGroupBox;
    btnClose: TButton;
    btnOpenQuery: TButton;
    GroupBox1: TGroupBox;
    btnDescriptionRemove: TButton;
    btnDescriptionAdd: TButton;
    GroupBox3: TGroupBox;
    btnAddColumn: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnOpenQueryClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnDescriptionRemoveClick(Sender: TObject);
    procedure btnDescriptionAddClick(Sender: TObject);
    procedure btnAddColumnClick(Sender: TObject);
  private

  public

  end;

var
  HTMLTemplatesView: THTMLTemplatesView;

implementation

{$R *.dfm}

procedure THTMLTemplatesView.FormCreate(Sender: TObject);
begin
  FDConnection1.Params.Database := '..\Data\Departments.db';
  FDQuery1.Open;
end;

procedure THTMLTemplatesView.btnOpenQueryClick(Sender: TObject);
begin
  FDQuery1.Open;
  TMSFNCDataGrid1.AutoSizeColumns;
end;

procedure THTMLTemplatesView.btnCloseClick(Sender: TObject);
begin
  FDQuery1.Close;
end;

procedure THTMLTemplatesView.btnDescriptionAddClick(Sender: TObject);
begin
  var LCoumn := TMSFNCDataGridDatabaseAdapter1.Columns[2];
  LCoumn.Header := 'Description';
  LCoumn.HTMLTemplate := '<font color="gcBlue">The description is: </FONT> <B><#Description> </B> ';
  TMSFNCDataGrid1.AutoSizeColumns;
end;

procedure THTMLTemplatesView.btnDescriptionRemoveClick(Sender: TObject);
begin
  TMSFNCDataGridDatabaseAdapter1.Columns[2].HTMLTemplate := '';
end;

procedure THTMLTemplatesView.btnAddColumnClick(Sender: TObject);
begin
  if not FDQuery1.Active then
    FDQuery1.Open;

  if TMSFNCDataGrid1.ColumnIndexByHeader('Department / Limit') >= 0 then
    Exit;

  var LColumn := TMSFNCDataGridDatabaseAdapter1.Columns.Add;
  LColumn.Header := 'Department / Limit';
  LColumn.HTMLTemplate := '<B><#Department></B><BR><font color="gcGreen">Limit: <#LimitValue></font>';

  TMSFNCDataGrid1.AutoSizeGrid;
end;

end.
