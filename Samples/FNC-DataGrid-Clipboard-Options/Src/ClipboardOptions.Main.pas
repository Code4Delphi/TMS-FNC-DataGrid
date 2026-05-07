unit ClipboardOptions.Main;

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
  TClipboardOptionsMain = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    GroupBox1: TGroupBox;
    ckAllowRowGrow: TCheckBox;
    ckAllowColumnGrow: TCheckBox;
    ckEnabled: TCheckBox;
    Label1: TLabel;
    cBoxPasteAction: TComboBox;
    ckIgnoreReadOnly: TCheckBox;
    GroupBox2: TGroupBox;
    mmLog: TMemo;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ckEnabledClick(Sender: TObject);
    procedure cBoxPasteActionChange(Sender: TObject);
    procedure TMSFNCDataGrid1AfterCopyToClipboard(Sender: TObject);
    procedure TMSFNCDataGrid1AfterCutToClipboard(Sender: TObject);
    procedure TMSFNCDataGrid1AfterPasteFromClipboard(Sender: TObject);
    procedure TMSFNCDataGrid1BeforeCopyToClipboard(Sender: TObject; var ACanExecute: Boolean);
    procedure TMSFNCDataGrid1BeforeCutToClipboard(Sender: TObject; var ACanExecute: Boolean);
    procedure TMSFNCDataGrid1BeforePasteFromClipboard(Sender: TObject; var ACanExecute: Boolean);
  private
    procedure ConfigDataGrid;
  public

  end;

var
  ClipboardOptionsMain: TClipboardOptionsMain;

implementation

{$R *.dfm}

procedure TClipboardOptionsMain.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  TMSFNCDataGrid1.Clear;
  TMSFNCDataGrid1.LoadFromCSVData('..\Data\products.csv');

  Self.ConfigDataGrid;
end;

procedure TClipboardOptionsMain.ckEnabledClick(Sender: TObject);
begin
  Self.ConfigDataGrid;
end;

procedure TClipboardOptionsMain.cBoxPasteActionChange(Sender: TObject);
begin
  Self.ConfigDataGrid;
end;

procedure TClipboardOptionsMain.ConfigDataGrid;
begin
  TMSFNCDataGrid1.Options.Clipboard.Enabled := ckEnabled.Checked;

  // gpaReplace — Sobrescreve valores de células existentes a partir da célula focada
  // gpaInsert — Insere novas linhas para os dados colados, deslocando as linhas existentes para baixo
  TMSFNCDataGrid1.Options.Clipboard.PasteAction := gpaReplace;
  if cBoxPasteAction.ItemIndex = 1 then
    TMSFNCDataGrid1.Options.Clipboard.PasteAction := gpaInsert;

  // Add linhas se os dados colados excederem a altura da grade / add rows if pasted data exceeds grid height
  TMSFNCDataGrid1.Options.Clipboard.AllowRowGrow := ckAllowRowGrow.Checked;
  // Add colunas se os dados colados excederem a largura da grade / add columns if pasted data exceeds grid width
  TMSFNCDataGrid1.Options.Clipboard.AllowColumnGrow := ckAllowColumnGrow.Checked;
  // Colar em células somente leitura / Paste into read-only cells
  TMSFNCDataGrid1.Options.Clipboard.IgnoreReadOnly := ckIgnoreReadOnly.Checked;
end;

procedure TClipboardOptionsMain.TMSFNCDataGrid1BeforeCopyToClipboard(Sender: TObject; var ACanExecute: Boolean);
begin
  mmLog.Lines.Add('1 - BeforeCopyToClipboard');
end;

procedure TClipboardOptionsMain.TMSFNCDataGrid1AfterCopyToClipboard(Sender: TObject);
begin
  mmLog.Lines.Add('2 - AfterCopyToClipboard');
end;

procedure TClipboardOptionsMain.TMSFNCDataGrid1BeforeCutToClipboard(Sender: TObject; var ACanExecute: Boolean);
begin
  mmLog.Lines.Add('3 - BeforeCutToClipboard');
end;

procedure TClipboardOptionsMain.TMSFNCDataGrid1AfterCutToClipboard(Sender: TObject);
begin
  mmLog.Lines.Add('4 - AfterCutToClipboard');
end;

procedure TClipboardOptionsMain.TMSFNCDataGrid1BeforePasteFromClipboard(Sender: TObject; var ACanExecute: Boolean);
begin
  mmLog.Lines.Add('5 - BeforePasteFromClipboard');
end;

procedure TClipboardOptionsMain.TMSFNCDataGrid1AfterPasteFromClipboard(Sender: TObject);
begin
  mmLog.Lines.Add('6 - AfterPasteFromClipboard');
end;

end.
