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
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    FDQuery1percentage: TIntegerField;
    FDQuery1classification: TIntegerField;
    FDQuery1complete: TIntegerField;
    btnShowConditionalFormattingEditor: TButton;
    btnOpenQuery: TButton;
    btnClose: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnOpenQueryClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnShowConditionalFormattingEditorClick(Sender: TObject);
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
  //Self.ConfigDataGrid;
end;

procedure TConditionalFormattingView.btnOpenQueryClick(Sender: TObject);
begin
  FDQuery1.Open;
  Self.ConfigDataGrid;
end;

procedure TConditionalFormattingView.btnCloseClick(Sender: TObject);
begin
  FDQuery1.Close;
end;

procedure TConditionalFormattingView.btnShowConditionalFormattingEditorClick(Sender: TObject);
begin
  TMSFNCDataGrid1.ShowConditionalFormattingEditor;
end;

procedure TConditionalFormattingView.ConfigDataGrid;
const
  COL_ID = 0;
  COL_DEPARTMENT = 1;
  COL_DESCRIPTION = 2;
  COL_NUMBER = 3;
  COL_REGISTRATIONDATE = 4;
  COL_LIMIT = 5;
  COL_STATUS = 6;
  COL_PERCENTAGE = 7;
  COL_CLASSIFICATION = 8;
  COL_COMPLETE = 9;
begin
  TMSFNCDataGrid1.BeginUpdate;
  TMSFNCDataGrid1.Clear;
  TMSFNCDataGrid1.Options.Column.Stretching.Enabled := True;
  TMSFNCDataGrid1.ConditionalFormatting.Enabled := True;

  //Fonte vermelha onde valor da coluna 3 menor que 5
  with TMSFNCDataGrid1.ConditionalFormatting.AddCellValueRule(COL_NUMBER, gfcLess, '5') do
    Appearance.Font.Color := gcRed;

  //Uma escala de cores transforma uma coluna numérica em um mapa de calor compacto
  TMSFNCDataGrid1.ConditionalFormatting.AddColorScale(COL_LIMIT, gcRed, gcYellow, gcLimegreen);

  // Barras proporcionais
  TMSFNCDataGrid1.ConditionalFormatting.AddDataBar(COL_PERCENTAGE, gcDodgerblue);

  // Transforme a satisfação do cliente em um sinal de cinco estrelas
  TMSFNCDataGrid1.ConditionalFormatting.AddIconSet(COL_CLASSIFICATION, gisStars5);

  // Mostrar a direção do crescimento com semaforos
  //TMSFNCDataGrid1.ConditionalFormatting.AddIconSet(COL_COMPLETE, gisTrafficLights3);

  // Mostrar a direção do crescimento com setas
  TMSFNCDataGrid1.ConditionalFormatting.AddIconSet(COL_COMPLETE, gisArrows3);

  // Destaca toda a linha, dos 3 maiores valores da coluna percentagem
  with TMSFNCDataGrid1.ConditionalFormatting.AddTopBottomRule(COL_PERCENTAGE, rkTop, 3) do
  begin
    Priority := 10;
    ApplyToEntireRow := True;
    Appearance.Fill.Color := gcLightgoldenrodyellow;
    Appearance.Font.Style := [TFontStyle.fsBold];
  end;

  //Expressões Através Das Colunas
  with TMSFNCDataGrid1.ConditionalFormatting.AddExpressionRule('([Number] = 9) AND ([percentage] >= 64)') do
  begin
    ApplyToEntireRow := True;
    Appearance.Fill.Color := gcMistyrose;
    Appearance.Font.Color := gcRed;
  end;

  TMSFNCDataGrid1.EndUpdate;
end;

end.
