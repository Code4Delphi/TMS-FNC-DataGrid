unit ConditionalFormatting.View;

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
  VCL.TMSFNCCustomComponent,
  VCL.TMSFNCDataGridDatabaseAdapter,
  VCL.TMSFNCCustomControl,
  VCL.TMSFNCDataGrid,
  VCL.TMSFNCDataGridConditionalFormatting;

type
  TConditionalFormattingView = class(TForm)
    pnTop: TPanel;
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
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    FDQuery1percentage: TIntegerField;
    FDQuery1classification: TIntegerField;
    FDQuery1complete: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure btnOpenQueryClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    procedure ConfigDataGrid;
  public

  end;

var
  ConditionalFormattingView: TConditionalFormattingView;

implementation

{$R *.dfm}

procedure TConditionalFormattingView.FormCreate(Sender: TObject);
begin
  FDConnection1.Params.Database := '..\Data\Departments.db';
  Self.ConfigDataGrid;
end;

procedure TConditionalFormattingView.btnOpenQueryClick(Sender: TObject);
begin
  FDQuery1.Open;
end;

procedure TConditionalFormattingView.btnCloseClick(Sender: TObject);
begin
  FDQuery1.Close;
end;

procedure TConditionalFormattingView.ConfigDataGrid;
begin
  TMSFNCDataGrid1.BeginUpdate;
  TMSFNCDataGrid1.Clear;
  //TMSFNCDataGrid1.Options.Selection.Mode := gsmSingleRow;

  //Fonte vermelha onde valor da coluna 3 menor que 5
  with TMSFNCDataGrid1.ConditionalFormatting.AddCellValueRule(3, gfcLess, '5') do
    Appearance.Font.Color := gcRed;

  //Uma escala de cores transforma uma coluna numérica em um mapa de calor compacto
  TMSFNCDataGrid1.ConditionalFormatting.AddColorScale(5, gcRed, gcYellow, gcLimegreen);

  TMSFNCDataGrid1.EndUpdate;
end;

end.
