unit HeadlessDataLayer.View;

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
  //VCL.TMSFNCDataGrid,
  VCL.TMSFNCDataGridData;

type
  THeadlessDataLayerView = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FData: TTMSFNCDataGridData;
  public

  end;

var
  HeadlessDataLayerView: THeadlessDataLayerView;

implementation

{$R *.dfm}

procedure THeadlessDataLayerView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';

  FData := TTMSFNCDataGridData.Create;

  //TMSFNCDataGrid1.Clear;
  //TMSFNCDataGrid1.LoadFromCSVData('..\Data\products.csv');
end;

procedure THeadlessDataLayerView.FormDestroy(Sender: TObject);
begin
  FData.Free;
end;

end.
