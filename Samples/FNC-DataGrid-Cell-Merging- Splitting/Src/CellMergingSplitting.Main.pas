unit CellMergingSplitting.Main;

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
  TCellMergingSplittingMain = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    Button1: TButton;
    Button2: TButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Button3: TButton;
    Button4: TButton;
    GroupBox3: TGroupBox;
    ckEnableShortcuts: TCheckBox;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ckEnableShortcutsClick(Sender: TObject);
  private

  public

  end;

var
  CellMergingSplittingMain: TCellMergingSplittingMain;

implementation

{$R *.dfm}

procedure TCellMergingSplittingMain.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  TMSFNCDataGrid1.Clear;
  TMSFNCDataGrid1.LoadFromCSVData('..\Data\products.csv');

  TMSFNCDataGrid1.Options.Selection.Mode := gsmCellRange;
end;

procedure TCellMergingSplittingMain.Button1Click(Sender: TObject);
begin
  TMSFNCDataGrid1.MergeCells(2, 3, 3, 2);
end;

procedure TCellMergingSplittingMain.Button2Click(Sender: TObject);
begin
  TMSFNCDataGrid1.SplitCell(MakeCell(2, 3));
end;

procedure TCellMergingSplittingMain.Button3Click(Sender: TObject);
begin
  TMSFNCDataGrid1.MergeRange(TMSFNCDataGrid1.Selection);
end;

procedure TCellMergingSplittingMain.Button4Click(Sender: TObject);
begin
  TMSFNCDataGrid1.SplitCell(TMSFNCDataGrid1.Selection.StartCell);
end;

procedure TCellMergingSplittingMain.ckEnableShortcutsClick(Sender: TObject);
begin
  TMSFNCDataGrid1.Options.Keyboard.CellMergeShortCut := ckEnableShortcuts.Checked;
end;

end.
