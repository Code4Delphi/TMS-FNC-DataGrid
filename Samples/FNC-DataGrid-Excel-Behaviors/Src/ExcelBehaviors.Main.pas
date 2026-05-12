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
  VCL.TMSFNCFindDialog,
  VCL.TMSFNCPDFIO,
  VCL.TMSFNCDataGridPDFIO,
  VCL.TMSFNCCustomComponent,
  VCL.TMSFNCDataGridExcelIO,
  ImportExport.Utils;

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
    PopupMenuCell: TPopupMenu;
    GetHeaderAndValueOuther1: TMenuItem;
    Item031: TMenuItem;
    Subitem011: TMenuItem;
    Subitem021: TMenuItem;
    ckPopupMenuForAll: TCheckBox;
    Merge1: TMenuItem;
    Split1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    AddComment1: TMenuItem;
    N3: TMenuItem;
    TabSheet8: TTabSheet;
    Panel1: TPanel;
    btnClearComments: TButton;
    Label6: TLabel;
    TMSFNCDataGridExcelIO1: TTMSFNCDataGridExcelIO;
    TMSFNCDataGridPDFIO1: TTMSFNCDataGridPDFIO;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    TabSheet12: TTabSheet;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel9: TPanel;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    btnImportCSV: TButton;
    btnExportCSV: TButton;
    edtDelimiterCSV: TEdit;
    ckQuoteEmptyCells: TCheckBox;
    GroupBox5: TGroupBox;
    btnImportarExcel: TButton;
    btnExportExcel: TButton;
    GroupBox6: TGroupBox;
    btnImportProprietary: TButton;
    btnExportProprietary: TButton;
    GroupBox7: TGroupBox;
    btnExportHTML: TButton;
    GroupBox8: TGroupBox;
    btnClear2: TButton;
    GroupBox9: TGroupBox;
    btnExportPDF: TButton;
    ckOpenAfterCreation: TCheckBox;
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
    procedure GetHeaderAndValueOuther1Click(Sender: TObject);
    procedure AddComment1Click(Sender: TObject);
    procedure btnClearCommentsClick(Sender: TObject);
    procedure btnImportCSVClick(Sender: TObject);
    procedure btnExportCSVClick(Sender: TObject);
    procedure btnImportarExcelClick(Sender: TObject);
    procedure btnExportExcelClick(Sender: TObject);
    procedure btnExportHTMLClick(Sender: TObject);
    procedure btnExportPDFClick(Sender: TObject);
    procedure btnImportProprietaryClick(Sender: TObject);
    procedure btnExportProprietaryClick(Sender: TObject);
  private
    procedure ConfigDataGrid;
    procedure ConfigClipboardOptions;
    procedure ConfigAutoComplete;
    procedure ClearGrid;
    procedure PopulateAutoCompleteItemsForColumn(AColumn: Integer);
    procedure ConfigAutoFill;
    procedure ConfigContextMenu;
    procedure ConfigDataGridExcel;
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
  Self.ConfigContextMenu;

  //Abrir arquivo após exportações / Open file after export operations
  TMSFNCDataGrid1.Options.IO.OpenAfterCreation := ckOpenAfterCreation.Checked;
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

procedure TExcelBehaviorsMain.ConfigContextMenu;
begin
  TMSFNCDataGrid1.CellPopupMenu := nil;

  if ckPopupMenuForAll.Checked then
    TMSFNCDataGrid1.CellPopupMenu := PopupMenuCell;
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

procedure TExcelBehaviorsMain.GetHeaderAndValueOuther1Click(Sender: TObject);
begin
  var LColumn := TMSFNCDataGrid1.FocusedCell.Column;
  var LRow := TMSFNCDataGrid1.FocusedCell.Row;
  var LHeader:= TMSFNCDataGrid1.Cells[LColumn, 0].AsString;
  var LValue := TMSFNCDataGrid1.Cells[LColumn, LRow].AsString;

  ShowMessage('PopupMenu - ' + LHeader + ': ' + LValue);
end;

procedure TExcelBehaviorsMain.AddComment1Click(Sender: TObject);
begin
  var LComment := InputBox('Comment', 'Insert comment:', '');
  if LComment.Trim.IsEmpty then
    Exit;

  var LColumn := TMSFNCDataGrid1.FocusedCell.Column;
  var LRow := TMSFNCDataGrid1.FocusedCell.Row;

  TMSFNCDataGrid1.Comments[LColumn, LRow] := LComment;
end;

procedure TExcelBehaviorsMain.btnClearCommentsClick(Sender: TObject);
begin
  TMSFNCDataGrid1.BeginUpdate;
  try
    for var LRow := 0 to Pred(TMSFNCDataGrid1.RowCount) do
      for var LCol := 0 to Pred(TMSFNCDataGrid1.ColumnCount) do
        TMSFNCDataGrid1.Comments[LCol, LRow] := '';
  finally
    TMSFNCDataGrid1.EndUpdate;
  end;
end;

procedure TExcelBehaviorsMain.btnImportCSVClick(Sender: TObject);
begin
  TMSFNCDataGrid1.Options.IO.StartColumn := 0;
  TMSFNCDataGrid1.Options.IO.StartRow := 0;

  TMSFNCDataGrid1.LoadFromCSVData(TUtils.GetNameFileCSV);
end;

procedure TExcelBehaviorsMain.btnExportCSVClick(Sender: TObject);
begin
  TMSFNCDataGrid1.Options.IO.Delimiter := edtDelimiterCSV.Text[1];
  //When set to true, an empty cell in the CSV file is saved as "". If false, no characters are written for empty cells
  TMSFNCDataGrid1.Options.IO.QuoteEmptyCells := ckQuoteEmptyCells.Checked;

  TMSFNCDataGrid1.SaveToCSVData(TUtils.GetNameFileCSV);
end;

procedure TExcelBehaviorsMain.btnImportarExcelClick(Sender: TObject);
begin
  Self.ConfigDataGridExcel;
  TMSFNCDataGridExcelIO1.XLSImport(TUtils.GetNameFileXLS);
end;

procedure TExcelBehaviorsMain.btnExportExcelClick(Sender: TObject);
begin
  Self.ConfigDataGridExcel;

  var LFileName := TUtils.GetNameFileXLS;
  if not LFileName.IsEmpty then
    TMSFNCDataGridExcelIO1.XLSExport(LFileName);
end;

procedure TExcelBehaviorsMain.ConfigDataGridExcel;
begin
  //Linha e coluna inicial que seram pegos ao importar e exportar de um XLS / Initial row and column that will be retrieved when importing from an XLS
  TMSFNCDataGridExcelIO1.XlsStartRow := 0;
  TMSFNCDataGridExcelIO1.XlsStartCol := 0;

  //Linha e coluna inicial no DataGrid de onde os dados serao adicionados / Starting row and column in the DataGrid from where the data will be added
  TMSFNCDataGridExcelIO1.DataGridStartRow := 0;
  TMSFNCDataGridExcelIO1.DataGridStartCol := 0;
end;

procedure TExcelBehaviorsMain.btnExportHTMLClick(Sender: TObject);
begin
  //Use TMSFNCDataGrid1.Options.IO.HTML for various export settings
  TMSFNCDataGrid1.Options.IO.HTML.TableBorderSize := 10;
  TMSFNCDataGrid1.Options.IO.HTML.HeaderText := '<h1> PDF export DataGrid Youtube </h1>';

  TMSFNCDataGrid1.SaveToHTMLData(TUtils.GetNameFileHTML);
end;


procedure TExcelBehaviorsMain.btnExportPDFClick(Sender: TObject);
begin
  //Use TMSFNCDataGridPDFIO1.Options and TMSFNCDataGridPDFIO1.Information for various export settings
  TMSFNCDataGridPDFIO1.Information.Title := 'PDF export DataGrid';
  TMSFNCDataGridPDFIO1.Options.Header := 'PDF export test Code4Delphi';

  TMSFNCDataGridPDFIO1.Save(TUtils.GetNameFilePDF);
end;

procedure TExcelBehaviorsMain.btnImportProprietaryClick(Sender: TObject);
begin
  TMSFNCDataGrid1.LoadFromFileData(TUtils.GetNameFileProprietary);
end;

procedure TExcelBehaviorsMain.btnExportProprietaryClick(Sender: TObject);
begin
  TMSFNCDataGrid1.SaveToFileData(TUtils.GetNameFileProprietary);
end;

end.
