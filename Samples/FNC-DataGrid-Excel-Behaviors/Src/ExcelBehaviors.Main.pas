unit ExcelBehaviors.Main;

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
  VCL.TMSFNCDataGrid,
  VCL.TMSFNCFindDialog;

type
  TExcelBehaviorsMain = class(TForm)
    StatusBar1: TStatusBar;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    btnRangeMouseMerge: TButton;
    btnRangeMouseSplit: TButton;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    ckEnableShortcuts: TCheckBox;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    ckAllowRowGrow: TCheckBox;
    ckAllowColumnGrow: TCheckBox;
    ckEnabled: TCheckBox;
    cBoxPasteAction: TComboBox;
    ckIgnoreReadOnly: TCheckBox;
    TabSheet3: TTabSheet;
    Panel4: TPanel;
    Label5: TLabel;
    btnClearGrid: TButton;
    ckDropFilesEnabled: TCheckBox;
    TabSheet4: TTabSheet;
    Panel5: TPanel;
    ckAutoCompleteCaseSensitive: TCheckBox;
    ckAutoCompleteEnabled: TCheckBox;
    TabSheet5: TTabSheet;
    Panel6: TPanel;
    TabSheet6: TTabSheet;
    Panel7: TPanel;
    TabSheet7: TTabSheet;
    Panel8: TPanel;
    btnShowFindDialogDataGrid: TButton;
    btnShowReplaceDialogDataGrid: TButton;
    lbInstructions: TLabel;
    ckAutoFillEnabled: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnRangeMouseMergeClick(Sender: TObject);
    procedure btnRangeMouseSplitClick(Sender: TObject);
    procedure ckEnableShortcutsClick(Sender: TObject);
    procedure btnClearGridClick(Sender: TObject);
    procedure TMSFNCDataGrid1DragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure TMSFNCDataGrid1DropFiles(Sender: TObject; ADropFiles: TTMSFNCCustomControlDropFiles);
    procedure TMSFNCDataGrid1BeforeOpenInplaceEditor(Sender: TObject; ACell: TTMSFNCDataGridCellCoord;
      var AValue: TTMSFNCDataGridCellValue; var ACanOpen: Boolean);
    procedure btnShowFindDialogDataGridClick(Sender: TObject);
    procedure btnShowReplaceDialogDataGridClick(Sender: TObject);
  private
    procedure ConfigDataGrid;
    procedure ConfigClipboardOptions;
    procedure ConfigAutoComplete;
    procedure ClearGrid;
    procedure PopulateAutoCompleteItemsForColumn(AColumn: Integer);
    procedure ConfigAutoFill;
  public

  end;

var
  ExcelBehaviorsMain: TExcelBehaviorsMain;

implementation

{$R *.dfm}

procedure TExcelBehaviorsMain.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  TMSFNCDataGrid1.Clear;
  TMSFNCDataGrid1.LoadFromCSVData('..\Data\products.csv');

  Self.ConfigDataGrid;
end;

procedure TExcelBehaviorsMain.ckEnableShortcutsClick(Sender: TObject);
begin
  Self.ConfigDataGrid;
end;

procedure TExcelBehaviorsMain.ConfigDataGrid;
begin
  TMSFNCDataGrid1.Options.Selection.Mode := gsmCellRange;

  //Habilitar atalhos Mesclar e Dividir / Enable Merge and Split shortcuts
  TMSFNCDataGrid1.Options.Keyboard.CellMergeShortCut := ckEnableShortcuts.Checked;

  //Aceitar soltar arquivos / Accept to drop files
  TMSFNCDataGrid1.AcceptDropFiles := ckDropFilesEnabled.Checked;

  Self.ConfigClipboardOptions;
  Self.ConfigAutoComplete;
  Self.ConfigAutoFill;
end;

procedure TExcelBehaviorsMain.ConfigClipboardOptions;
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
end;

procedure TExcelBehaviorsMain.ConfigAutoComplete;
begin
  if not ckAutoCompleteEnabled.Checked then
  begin
    TMSFNCDataGrid1.Options.Editing.AutoComplete.&Type := gactDisabled;
    Exit;
  end;

  TMSFNCDataGrid1.Options.Editing.AutoComplete.&Type := gactLookupList;
  TMSFNCDataGrid1.Options.Editing.DirectDropDown := False;
  TMSFNCDataGrid1.Options.Editing.AutoComplete.CaseSensitive := ckAutoCompleteCaseSensitive.Checked;
end;

procedure TExcelBehaviorsMain.ConfigAutoFill;
begin
  TMSFNCDataGrid1.Options.Selection.AutoFill := ckAutoFillEnabled.Checked;
  if not TMSFNCDataGrid1.Options.Selection.AutoFill then
    Exit;

  TMSFNCDataGrid1.AutoFillCustomListSet('DelphiList', ['Delphi Rio', 'Delphi Sydney', 'Delphi Alexandria']);
  TMSFNCDataGrid1.AutoFillCustomListSet('NameList', ['Cesar', 'Augusto', 'Santiago', 'Cardoso']);
end;

procedure TExcelBehaviorsMain.btnClearGridClick(Sender: TObject);
begin
  Self.ClearGrid;
end;

procedure TExcelBehaviorsMain.ClearGrid;
begin
  TMSFNCDataGrid1.Clear;
  TMSFNCDataGrid1.RowCount := 1;
  TMSFNCDataGrid1.ColumnCount := 1;
end;

procedure TExcelBehaviorsMain.btnRangeMouseMergeClick(Sender: TObject);
begin
  TMSFNCDataGrid1.MergeRange(TMSFNCDataGrid1.Selection);
end;

procedure TExcelBehaviorsMain.btnRangeMouseSplitClick(Sender: TObject);
begin
  TMSFNCDataGrid1.SplitCell(TMSFNCDataGrid1.Selection.StartCell);
end;

procedure TExcelBehaviorsMain.TMSFNCDataGrid1DragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState;
  var Accept: Boolean);
var
  LControlDropFiles: TTMSFNCCustomControlDropFiles;
  LAccept: Boolean;
begin
  if IsSourceDropFiles(Source) then
  begin
    LControlDropFiles := AsSourceDropFiles(Source);
    LAccept := False;

    for var i := 0 to Pred(LControlDropFiles.Files.Count) do
    begin
      if ExtractFileExt(LControlDropFiles.Files[i]) = '.csv' then
      begin
        LAccept := True;
        Break;
      end
      else
      begin
        ShowMessage('Files with the '+ ExtractFileExt(LControlDropFiles.Files[i]) + ' extension are not accepted.');
      end;
    end;

    Accept := LAccept;
  end;
end;

procedure TExcelBehaviorsMain.TMSFNCDataGrid1DropFiles(Sender: TObject; ADropFiles: TTMSFNCCustomControlDropFiles);
begin
  for var I := 0 to Pred(ADropFiles.Files.Count) do
  begin
    var LFileName := ADropFiles.Files[I];
    if ExtractFileExt(LFileName) <> '.csv' then
      Continue;

    if TMSFNCDataGrid1.RowCount <= 1 then
      TMSFNCDataGrid1.Options.IO.StartRow := 0
    else
      TMSFNCDataGrid1.Options.IO.StartRow := TMSFNCDataGrid1.RowCount;

    TMSFNCDataGrid1.LoadFromCSVData(LFileName);
  end;

  TMSFNCDataGrid1.Options.IO.StartRow := 0;
end;

procedure TExcelBehaviorsMain.TMSFNCDataGrid1BeforeOpenInplaceEditor(Sender: TObject; ACell: TTMSFNCDataGridCellCoord;
  var AValue: TTMSFNCDataGridCellValue; var ACanOpen: Boolean);
begin
  if ACanOpen and (ACell.Row >= TMSFNCDataGrid1.FixedRowCount) then
    Self.PopulateAutoCompleteItemsForColumn(ACell.Column);
end;

procedure TExcelBehaviorsMain.PopulateAutoCompleteItemsForColumn(AColumn: Integer);
var
  LItems: TStrings;
  LRow: Integer;
  LValue: string;
begin
  LItems := TMSFNCDataGrid1.Options.Editing.AutoComplete.Items;
  LItems.Clear;

  for LRow := TMSFNCDataGrid1.FixedRowCount to Pred(TMSFNCDataGrid1.RowCount) do
  begin
    LValue := TMSFNCDataGrid1.Cells[AColumn, LRow].AsString;
    if (LValue <> '') and (LItems.IndexOf(LValue) = -1) then
      LItems.Add(LValue);
  end;
end;

procedure TExcelBehaviorsMain.btnShowFindDialogDataGridClick(Sender: TObject);
begin
  TMSFNCDataGrid1.ShowFindDialog;
end;

procedure TExcelBehaviorsMain.btnShowReplaceDialogDataGridClick(Sender: TObject);
begin
  TMSFNCDataGrid1.ShowReplaceDialog;
end;

end.
