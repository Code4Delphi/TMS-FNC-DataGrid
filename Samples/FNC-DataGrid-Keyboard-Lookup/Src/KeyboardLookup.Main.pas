unit KeyboardLookup.Main;

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
  TKeyboardLookupMain = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Button3: TButton;
    Button4: TButton;
    GroupBox3: TGroupBox;
    ckEnableShortcuts: TCheckBox;
    Label2: TLabel;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  KeyboardLookupMain: TKeyboardLookupMain;

implementation

{$R *.dfm}

procedure TKeyboardLookupMain.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  TMSFNCDataGrid1.Clear;
  TMSFNCDataGrid1.LoadFromCSVData('..\Data\products.csv');

  //Lookup only activates when Options.Editing.Enabled is False
  TMSFNCDataGrid1.Options.Editing.Enabled := False;

  TMSFNCDataGrid1.Options.Lookup.Enabled := True;        // ENABLE KEYBOARD LOOKUP
  TMSFNCDataGrid1.Options.Lookup.Incremental := True;    // BUILD LOOKUP STRING CHARACTER BY CHARACTER
  TMSFNCDataGrid1.Options.Lookup.CaseSensitive := False; // CASE-INSENSITIVE MATCH (DEFAULT)
  TMSFNCDataGrid1.Options.Lookup.ResetInterval := 4000;  // MS BEFORE ACCUMULATED STRING RESETS
end;

procedure TKeyboardLookupMain.Button1Click(Sender: TObject);
var
  Cell: TTMSFNCDataGridCellCoord;
begin
  // find the first cell in any column that starts with "Smith"
  Cell := TMSFNCDataGrid1.Lookup('Smith', True, True);   // AAllRows=True, AAutoGoto=True
end;

//  // restrict lookup to a specific column
//  Cell := Grid.LookupInColumn(1, 'Smith');
//
//  // start search from a specific row
//  Cell := Grid.LookupInColumnFromRow(1, 5, 'Smith');
//end;

end.
