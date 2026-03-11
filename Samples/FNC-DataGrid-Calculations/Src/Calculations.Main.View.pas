unit Calculations.Main.View;

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
  Vcl.Dialogs, Vcl.ExtCtrls, VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, System.Rtti,
  VCL.TMSFNCDataGridCell, VCL.TMSFNCDataGridData, VCL.TMSFNCDataGridBase, VCL.TMSFNCDataGridCore,
  VCL.TMSFNCDataGridRenderer, VCL.TMSFNCCustomControl, VCL.TMSFNCDataGrid;

type
  TCalculationsMainView = class(TForm)
    pnTop: TPanel;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    procedure FormCreate(Sender: TObject);
  private
    procedure LoadDataCSV;
    procedure ConfigDataGrid;

  public

  end;

var
  CalculationsMainView: TCalculationsMainView;

implementation

{$R *.dfm}

procedure TCalculationsMainView.FormCreate(Sender: TObject);
begin
  Self.ConfigDataGrid;
  Self.LoadDataCSV;
end;

procedure TCalculationsMainView.ConfigDataGrid;
begin
  TMSFNCDataGrid1.Options.IO.StartColumn := 0;
  TMSFNCDataGrid1.Options.IO.StartRow := 0;

  TMSFNCDataGrid1.DefaultRowHeight := 40;
  TMSFNCDataGrid1.GlobalFont.Scale := 1.3;

  TMSFNCDataGrid1.Options.Keyboard.TabKeyDirectEdit := True;
  TMSFNCDataGrid1.Options.Keyboard.ArrowKeyDirectEdit := True;
  TMSFNCDataGrid1.Options.Keyboard.EnterKeyDirectEdit := True;

  TMSFNCDataGrid1.Options.Column.Stretching.Enabled := True;
  TMSFNCDataGrid1.Options.Banding.Enabled := True;
  TMSFNCDataGrid1.CellAppearance.BandLayout.Fill.Color := Lighter(TMSFNCDataGrid1.CellAppearance.SelectedLayout.Fill.Color, 50);
  TMSFNCDataGrid1.CellAppearance.SelectedLayout.Fill.Color := Darker(TMSFNCDataGrid1.CellAppearance.SelectedLayout.Fill.Color, 20);

  TMSFNCDataGrid1.Options.Filtering.Enabled := True;
  TMSFNCDataGrid1.Options.Sorting.Enabled := True;
  TMSFNCDataGrid1.Options.Editing.Enabled := True;
  TMSFNCDataGrid1.Options.Banding.Enabled := True;
  TMSFNCDataGrid1.Options.Selection.Mode := TTMSFNCDataGridSelectionMode.gsmSingleCell;
  TMSFNCDataGrid1.Options.URL.AutoDetect := True;
  TMSFNCDataGrid1.Options.URL.AutoOpen := True;
end;

procedure TCalculationsMainView.LoadDataCSV;
begin
  TMSFNCDataGrid1.LoadFromCSVData('../Data/Productos.csv');
end;

end.
