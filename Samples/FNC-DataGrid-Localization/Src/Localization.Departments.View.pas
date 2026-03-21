unit Localization.Departments.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Rtti,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
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
  Localization.Config;

type
  TLocalizationDepartmentsView = class(TForm)
    pnTop: TPanel;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    procedure FormShow(Sender: TObject);
  private
    FLanguage: TLocalizationLanguage;
    procedure ConfigGrid;
  public
    property Language: TLocalizationLanguage read FLanguage write FLanguage;
  end;

var
  LocalizationDepartmentsView: TLocalizationDepartmentsView;

implementation

{$R *.dfm}

procedure TLocalizationDepartmentsView.FormShow(Sender: TObject);
begin
  Self.ConfigGrid;
  TLocalizationConfig.SetLocalizationLanguage(TMSFNCDataGrid1, FLanguage);
  TMSFNCDataGrid1.LoadFromCSVData('../Data/Departments.csv');
end;

procedure TLocalizationDepartmentsView.ConfigGrid;
begin
  TMSFNCDataGrid1.BeginUpdate;
  TMSFNCDataGrid1.Clear;
  TMSFNCDataGrid1.Options.Column.Stretching.Enabled := True;
  TMSFNCDataGrid1.Options.Banding.Enabled := True;
  TMSFNCDataGrid1.Options.Sorting.Enabled := True;
  TMSFNCDataGrid1.Options.Selection.Mode := gsmSingleRow;
  TMSFNCDataGrid1.Options.Filtering.Enabled := True;
  TMSFNCDataGrid1.EndUpdate;
end;

end.
