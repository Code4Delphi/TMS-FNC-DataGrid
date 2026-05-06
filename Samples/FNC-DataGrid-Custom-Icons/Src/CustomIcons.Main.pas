unit CustomIcons.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.UITypes,
  System.Rtti,
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
  VCL.TMSFNCCustomComponent,
  VCL.TMSFNCBitmapContainer,
  VCL.TMSFNCCustomControl,
  VCL.TMSFNCDataGrid;

type
  TCustomIconsMain = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    TMSFNCBitmapContainer1: TTMSFNCBitmapContainer;
    procedure FormCreate(Sender: TObject);
  private
    procedure ConfigIcons;
  public

  end;

var
  CustomIconsMain: TCustomIconsMain;

implementation

{$R *.dfm}

procedure TCustomIconsMain.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  TMSFNCDataGrid1.Clear;
  TMSFNCDataGrid1.LoadFromCSVData('..\Data\products.csv');

  Self.ConfigIcons;
end;

procedure TCustomIconsMain.ConfigIcons;
begin
  TMSFNCDataGrid1.Icons.SortAscendingIcon  := TMSFNCBitmapContainer1.FindBitmap('SortAscendingIcon');
  TMSFNCDataGrid1.Icons.SortDescendingIcon := TMSFNCBitmapContainer1.FindBitmap('SortDescendingIcon');
  TMSFNCDataGrid1.Icons.FilterIcon         := TMSFNCBitmapContainer1.FindBitmap('FilterIcon');
  TMSFNCDataGrid1.Icons.FilterActiveIcon   := TMSFNCBitmapContainer1.FindBitmap('FilterActiveIcon');
  TMSFNCDataGrid1.Icons.FilterClearIcon    := TMSFNCBitmapContainer1.FindBitmap('FilterClearIcon');
  TMSFNCDataGrid1.Icons.FilterTypeIcon     := TMSFNCBitmapContainer1.FindBitmap('FilterTypeIcon');
  TMSFNCDataGrid1.Icons.ExpandIcon         := TMSFNCBitmapContainer1.FindBitmap('ExpandIcon');
  TMSFNCDataGrid1.Icons.CollapseIcon       := TMSFNCBitmapContainer1.FindBitmap('CollapseIcon');
  TMSFNCDataGrid1.Icons.CloseIcon          := TMSFNCBitmapContainer1.FindBitmap('CloseIcon');
  TMSFNCDataGrid1.Icons.FirstPageIcon      := TMSFNCBitmapContainer1.FindBitmap('FirstPageIcon');
  TMSFNCDataGrid1.Icons.PreviousPageIcon   := TMSFNCBitmapContainer1.FindBitmap('PreviousPageIcon');
  TMSFNCDataGrid1.Icons.NextPageIcon       := TMSFNCBitmapContainer1.FindBitmap('NextPageIcon');
  TMSFNCDataGrid1.Icons.LastPageIcon       := TMSFNCBitmapContainer1.FindBitmap('LastPageIcon');
end;

end.
