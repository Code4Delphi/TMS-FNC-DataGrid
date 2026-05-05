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
    procedure ConfigLookup;

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

  Self.ConfigLookup;
end;

procedure TKeyboardLookupMain.ConfigLookup;
begin
  //Lookup only activates when Options.Editing.Enabled is False
  TMSFNCDataGrid1.Options.Editing.Enabled := False;

  TMSFNCDataGrid1.Options.Lookup.Enabled := ckEnabled.Checked; // ENABLE KEYBOARD LOOKUP
  TMSFNCDataGrid1.Options.Lookup.Incremental := ckIncremental.Checked; // BUILD LOOKUP STRING CHARACTER BY CHARACTER
  TMSFNCDataGrid1.Options.Lookup.CaseSensitive := ckCaseSensitive.Checked; // CASE-INSENSITIVE MATCH (DEFAULT)
  TMSFNCDataGrid1.Options.Lookup.ResetInterval := StrToIntDef(edtResetInterval.Text, 4000); // MS BEFORE ACCUMULATED STRING RESETS
end;

procedure TKeyboardLookupMain.ckIncrementalClick(Sender: TObject);
begin
  Self.ConfigLookup;
end;

procedure TKeyboardLookupMain.edtResetIntervalChange(Sender: TObject);
begin
  Self.ConfigLookup;
end;

procedure TKeyboardLookupMain.TMSFNCDataGrid1BeforeLookup(Sender: TObject; var ALookupString: string;
  var ACanLookup: Boolean);
begin
  if ALookupString = 'delete' then
  begin
    ACanLookup := False;
    ShowMessage('The word "delete" could not be searched.');
  end;
end;

procedure TKeyboardLookupMain.TMSFNCDataGrid1AfterLookup(Sender: TObject; ALookupString: string);
begin
  StatusBar1.Panels[0].Text := 'Lookup: ' + ALookupString;
end;

end.
