unit AutoComplete.LookupList;

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
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
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
  VCL.TMSFNCDataGrid, System.Rtti;

type
  TAutoCompleteLookupList = class(TForm)
    StatusBar1: TStatusBar;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    pnlOptions: TPanel;
    chkCaseSensitive: TCheckBox;
    procedure chkCaseSensitiveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure ConfigureAutoComplete;
    procedure UpdateCaseSensitive;
  public

  end;

implementation

{$R *.dfm}

procedure TAutoCompleteLookupList.FormCreate(Sender: TObject);
begin
  TMSFNCDataGrid1.Clear;
  TMSFNCDataGrid1.LoadFromCSVData('..\Data\products.csv');
  Self.ConfigureAutoComplete;
end;

procedure TAutoCompleteLookupList.ConfigureAutoComplete;
begin
  TMSFNCDataGrid1.Options.Editing.AutoComplete.&Type := gactLookupList;
  TMSFNCDataGrid1.Options.Editing.DirectDropDown := True;
  Self.UpdateCaseSensitive;

  TMSFNCDataGrid1.Options.Editing.AutoComplete.Items.Clear;
  TMSFNCDataGrid1.Options.Editing.AutoComplete.Items.Add('Cables USB 1m');
  TMSFNCDataGrid1.Options.Editing.AutoComplete.Items.Add('Cables USB 2m');
  TMSFNCDataGrid1.Options.Editing.AutoComplete.Items.Add('Cables USB Type C');
  TMSFNCDataGrid1.Options.Editing.AutoComplete.Items.Add('Cables USB Type C 2m');
  TMSFNCDataGrid1.Options.Editing.AutoComplete.Items.Add('Cables USB');
  TMSFNCDataGrid1.Options.Editing.AutoComplete.Items.Add('Cables VGA 1.5m');
  TMSFNCDataGrid1.Options.Editing.AutoComplete.Items.Add('Cables VGA 3m');
  TMSFNCDataGrid1.Options.Editing.AutoComplete.Items.Add('Cables Video');
  TMSFNCDataGrid1.Options.Editing.AutoComplete.Items.Add('Tech Distrib');
  TMSFNCDataGrid1.Options.Editing.AutoComplete.Items.Add('Global Parts');
  TMSFNCDataGrid1.Options.Editing.AutoComplete.Items.Add('Available');
  TMSFNCDataGrid1.Options.Editing.AutoComplete.Items.Add('Backorder');
  TMSFNCDataGrid1.Options.Editing.AutoComplete.Items.Add('Discontinued');
end;

procedure TAutoCompleteLookupList.chkCaseSensitiveClick(Sender: TObject);
begin
  Self.UpdateCaseSensitive;
end;

procedure TAutoCompleteLookupList.UpdateCaseSensitive;
begin
  TMSFNCDataGrid1.Options.Editing.AutoComplete.CaseSensitive := chkCaseSensitive.Checked;
end;

end.
