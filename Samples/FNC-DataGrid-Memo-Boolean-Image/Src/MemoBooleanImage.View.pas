unit MemoBooleanImage.View;

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
  TMemoBooleanImageView = class(TForm)
    pnTop: TPanel;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    TMSFNCDataGridDatabaseAdapter1: TTMSFNCDataGridDatabaseAdapter;
    GroupBox2: TGroupBox;
    btnClose: TButton;
    btnOpenQuery: TButton;
    GroupBox4: TGroupBox;
    ckShowMemoFields: TCheckBox;
    ckShowBooleanFields: TCheckBox;
    FDQuery1Id: TFDAutoIncField;
    FDQuery1Name: TWideMemoField;
    FDQuery1Description: TWideMemoField;
    FDQuery1Active: TBooleanField;
    FDQuery1Image: TBlobField;
    FDQuery1Limited: TIntegerField;
    ckCheckBoxField: TCheckBox;
    ckShowPictureFields: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnOpenQueryClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure ckShowMemoFieldsClick(Sender: TObject);
    procedure ckCheckBoxFieldClick(Sender: TObject);
    procedure ckShowPictureFieldsClick(Sender: TObject);
  private
    procedure Configs;
  public

  end;

var
  MemoBooleanImageView: TMemoBooleanImageView;

implementation

{$R *.dfm}

procedure TMemoBooleanImageView.FormCreate(Sender: TObject);
begin
  FDConnection1.Params.Database := '..\Data\MemoBooleanImage.db';
  FDQuery1.Open;
  Self.Configs;
end;

procedure TMemoBooleanImageView.ckShowMemoFieldsClick(Sender: TObject);
begin
  Self.Configs;
end;

procedure TMemoBooleanImageView.ckCheckBoxFieldClick(Sender: TObject);
begin
  Self.Configs;
  FDQuery1.Refresh;
end;

procedure TMemoBooleanImageView.ckShowPictureFieldsClick(Sender: TObject);
begin
  Self.Configs;
  FDQuery1.Refresh;
end;

procedure TMemoBooleanImageView.Configs;
begin
  //Memo Fields
  TMSFNCDataGridDatabaseAdapter1.ShowMemoFields := ckShowMemoFields.Checked;

  //Boolean Fields
  TMSFNCDataGridDatabaseAdapter1.ShowBooleanFields := ckShowBooleanFields.Checked;
  //Exibir CheckBox em campos diferentes de booleanos / Display CheckBox in fields other than booleans.
  var LLimitedIndex := TMSFNCDataGrid1.ColumnIndexByHeader('Limited');
  var LLimitedCoumn := TMSFNCDataGrid1.Columns[LLimitedIndex];
  LLimitedCoumn.Binding.BooleanFalseValue := '1';
  LLimitedCoumn.Binding.BooleanTrueValue := '2';
  TMSFNCDataGridDatabaseAdapter1.Columns[LLimitedIndex].CheckBoxField := ckCheckBoxField.Checked;

  // Image Blobs
  TMSFNCDataGridDatabaseAdapter1.ShowPictureFields := ckShowPictureFields.Checked;
  TMSFNCDataGridDatabaseAdapter1.Columns[TMSFNCDataGrid1.ColumnIndexByHeader('Image')].PictureField := ckShowPictureFields.Checked;
end;

procedure TMemoBooleanImageView.btnOpenQueryClick(Sender: TObject);
begin
  FDQuery1.Open;
  Self.Configs;
end;

procedure TMemoBooleanImageView.btnCloseClick(Sender: TObject);
begin
  FDQuery1.Close;
end;

end.
