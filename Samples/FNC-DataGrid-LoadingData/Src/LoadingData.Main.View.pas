unit LoadingData.Main.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  LoadingData.Manual.View,
  LoadingData.CSV.View,
  LoadingData.Excel.View;

type
  TLoadingDataMainView = class(TForm)
    Panel1: TPanel;
    btnManualData: TButton;
    btnExcelData: TButton;
    btnCSVData: TButton;
    procedure btnManualDataClick(Sender: TObject);
    procedure btnExcelDataClick(Sender: TObject);
    procedure btnCSVDataClick(Sender: TObject);
  private

  public

  end;

var
  LoadingDataMainView: TLoadingDataMainView;

implementation

{$R *.dfm}

procedure TLoadingDataMainView.btnManualDataClick(Sender: TObject);
begin
  LoadingDataManualView.ShowModal;
end;

procedure TLoadingDataMainView.btnCSVDataClick(Sender: TObject);
begin
  LoadingDataCSVView.ShowModal;
end;

procedure TLoadingDataMainView.btnExcelDataClick(Sender: TObject);
begin
  LoadingDataExcelView.ShowModal;
end;

end.
