unit GlobalFont.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.UITypes,
  System.Rtti,
  System.Math,
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
  VCL.TMSFNCDataGrid, Vcl.Samples.Spin;

type
  TGlobalFontView = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    GroupBox1: TGroupBox;
    ckBold: TCheckBox;
    Label1: TLabel;
    cBoxFontName: TComboBox;
    Label2: TLabel;
    edtScale: TEdit;
    UpDown1: TUpDown;
    Label3: TLabel;
    edtSize: TEdit;
    UpDown2: TUpDown;
    procedure FormCreate(Sender: TObject);
    procedure ckBoldClick(Sender: TObject);
    procedure cBoxFontNameChange(Sender: TObject);
    procedure edtScaleChange(Sender: TObject);
  private
    procedure ConfigDataGrid;
  public

  end;

var
  GlobalFontView: TGlobalFontView;

implementation

{$R *.dfm}

procedure TGlobalFontView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  TMSFNCDataGrid1.Clear;
  TMSFNCDataGrid1.LoadFromCSVData('..\Data\products.csv');

  Self.ConfigDataGrid;
end;

procedure TGlobalFontView.ckBoldClick(Sender: TObject);
begin
  Self.ConfigDataGrid;
end;

procedure TGlobalFontView.cBoxFontNameChange(Sender: TObject);
begin
  Self.ConfigDataGrid;
end;

procedure TGlobalFontView.ConfigDataGrid;
begin
  TMSFNCDataGrid1.GlobalFont.Name := cBoxFontName.Text;
  TMSFNCDataGrid1.GlobalFont.Size := StrToIntDef(edtSize.Text, 0);

  if ckBold.Checked then
    TMSFNCDataGrid1.GlobalFont.Style := TMSFNCDataGrid1.GlobalFont.Style + [fsBold]
  else
    TMSFNCDataGrid1.GlobalFont.Style := TMSFNCDataGrid1.GlobalFont.Style - [fsBold];
end;

procedure TGlobalFontView.edtScaleChange(Sender: TObject);
begin
  var LScale := Max(StrToIntDef(edtScale.Text, 1), 1);
  TMSFNCDataGrid1.GlobalFont.Scale := LScale;
  TMSFNCDataGrid1.AutoSizeGrid;
end;

end.
