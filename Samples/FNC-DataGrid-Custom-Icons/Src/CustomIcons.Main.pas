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
  VCL.TMSFNCCustomControl,
  VCL.TMSFNCDataGrid;

type
  TCustomIconsMain = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    GroupBox1: TGroupBox;
    ckIncremental: TCheckBox;
    ckCaseSensitive: TCheckBox;
    ckEnabled: TCheckBox;
    Label1: TLabel;
    edtResetInterval: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure ckIncrementalClick(Sender: TObject);
    procedure edtResetIntervalChange(Sender: TObject);
    procedure TMSFNCDataGrid1AfterLookup(Sender: TObject; ALookupString: string);
    procedure TMSFNCDataGrid1BeforeLookup(Sender: TObject; var ALookupString: string; var ACanLookup: Boolean);
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
  TMSFNCDataGrid1.Icons.SortAscendingIcon  := MyAscIcon;
  TMSFNCDataGrid1.Icons.SortDescendingIcon := MyDescIcon;
  TMSFNCDataGrid1.Icons.FilterIcon         := MyFilterIcon;
  TMSFNCDataGrid1.Icons.FilterActiveIcon   := MyFilterActiveIcon;  // shown when a filter is active
  TMSFNCDataGrid1.Icons.FilterClearIcon    := MyClearIcon;
  TMSFNCDataGrid1.Icons.FilterTypeIcon     := MyFilterTypeIcon;
  TMSFNCDataGrid1.Icons.ExpandIcon         := MyExpandIcon;
  TMSFNCDataGrid1.Icons.CollapseIcon       := MyCollapseIcon;
  TMSFNCDataGrid1.Icons.CloseIcon          := MyCloseIcon;         // header group close button
  TMSFNCDataGrid1.Icons.FirstPageIcon      := MyFirstPageIcon;
  TMSFNCDataGrid1.Icons.PreviousPageIcon   := MyPrevPageIcon;
  TMSFNCDataGrid1.Icons.NextPageIcon       := MyNextPageIcon;
TMSFNCDataGrid1.Icons.LastPageIcon       := MyLastPageIcon;
end;

procedure TCustomIconsMain.ckIncrementalClick(Sender: TObject);
begin
  Self.ConfigLookup;
end;

procedure TCustomIconsMain.edtResetIntervalChange(Sender: TObject);
begin
  Self.ConfigLookup;
end;

procedure TCustomIconsMain.TMSFNCDataGrid1BeforeLookup(Sender: TObject; var ALookupString: string;
  var ACanLookup: Boolean);
begin
  if ALookupString = 'delete' then
  begin
    ACanLookup := False;
    ShowMessage('The word "delete" could not be searched.');
  end;
end;

procedure TCustomIconsMain.TMSFNCDataGrid1AfterLookup(Sender: TObject; ALookupString: string);
begin
  StatusBar1.Panels[0].Text := 'Lookup: ' + ALookupString;
end;

end.
