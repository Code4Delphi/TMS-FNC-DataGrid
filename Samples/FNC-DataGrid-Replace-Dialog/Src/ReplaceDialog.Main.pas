unit ReplaceDialog.Main;

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
  VCL.TMSFNCCustomComponent,
  VCL.TMSFNCCustomDialog,
  VCL.TMSFNCReplaceDialog;

type
  TReplaceDialogMain = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    btnShowReplaceDialogDataGrid: TButton;
    rdGroupUILanguage: TRadioGroup;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    GroupBox2: TGroupBox;
    ckAutoHistory: TCheckBox;
    ckCaseSensitive: TCheckBox;
    ckCaseSensitiveVisible: TCheckBox;
    edtFindText: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtReplaceText: TEdit;
    GroupBox3: TGroupBox;
    mmLog: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnShowReplaceDialogDataGridClick(Sender: TObject);
    procedure TMSFNCDataGrid1BeforeShowReplaceDialog(Sender: TObject; AReplaceDialog: TTMSFNCReplaceDialog;
      var ACanShow: Boolean);
    procedure TMSFNCDataGrid1AfterShowReplaceDialog(Sender: TObject; AReplaceDialog: TTMSFNCReplaceDialog);
    procedure TMSFNCDataGrid1BeforeDialogReplace(Sender: TObject; AFindText, AReplaceText: string;
      var AParameters: TTMSFNCDataGridDataFindParameters; var ACanReplace: Boolean);
    procedure TMSFNCDataGrid1AfterDialogReplace(Sender: TObject; AFindText, AReplaceText: string;
      AReplaceCount: Integer);
  private

  public

  end;

var
  ReplaceDialogMain: TReplaceDialogMain;

implementation

{$R *.dfm}

procedure TReplaceDialogMain.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  TMSFNCDataGrid1.Clear;
  TMSFNCDataGrid1.LoadFromCSVData('..\Data\products.csv');
end;

procedure TReplaceDialogMain.btnShowReplaceDialogDataGridClick(Sender: TObject);
begin
  TMSFNCDataGrid1.ShowReplaceDialog;
end;

//Before the Replace dialog is displayed; ACanShow can cancel
//Antes do diálogo Substituir ser exibido; pode cancelar ACanShow
procedure TReplaceDialogMain.TMSFNCDataGrid1BeforeShowReplaceDialog(Sender: TObject;
  AReplaceDialog: TTMSFNCReplaceDialog; var ACanShow: Boolean);
begin
  AReplaceDialog.AutoHistory := ckAutoHistory.Checked;
  AReplaceDialog.FindText := edtFindText.Text;
  AReplaceDialog.ReplaceText := edtReplaceText.Text;

  //Options: rdoCurrentFile, rdoSelection, rdoAllOpenFiles, rdoCaseSensitive, rdoExpression,
  //rdoWholeWordOnly, rdoWrapAtEndOfFile, rdoMoreEnabled,
  //rdoFindEnabled, rdoFindNextEnabled, rdoReplaceAllEnabled, rdoReplaceEnabled,
  //rdoCloseEnabled, rdoMoreExpanded, rdoDown
  AReplaceDialog.Options := AReplaceDialog.Options - [rdoCaseSensitive];
  if ckCaseSensitive.Checked then
    AReplaceDialog.Options := AReplaceDialog.Options + [rdoCaseSensitive];

  //VisibleOptions: rdovCaseSensitive, rdovExpression,
  //rdovWholeWordOnly, rdovWrapAtEndOfFile, rdovMore, rdovReplace, rdovReplaceAll, rdovFind, rdovFindNext, rdovClose,
  //rdovFindCombo, rdovFindMemo, rdovReplaceCombo, rdovReplaceMemo, rdovReplaceAllRange, rdovCurrentFile, rdovSelection,
  //rdovAllOpenFiles, rdovDirection
  AReplaceDialog.VisibleOptions := AReplaceDialog.VisibleOptions - [rdovCaseSensitive];
  if ckCaseSensitiveVisible.Checked then
    AReplaceDialog.VisibleOptions := AReplaceDialog.VisibleOptions + [rdovCaseSensitive];

  if rdGroupUILanguage.ItemIndex = 1 then
  begin
    AReplaceDialog.UILanguage.AllOpenFiles := 'Todos os arquivos abertos';
    AReplaceDialog.UILanguage.CaseSensitive := 'Diferenciar maiús / minús';
    AReplaceDialog.UILanguage.Close := 'Fechar';
    AReplaceDialog.UILanguage.Direction := 'Direção';
    AReplaceDialog.UILanguage.Down := 'Baixo';
    AReplaceDialog.UILanguage.Expression := 'Expressão';
    AReplaceDialog.UILanguage.Replace := 'Substituir';
    AReplaceDialog.UILanguage.Caption := 'Substituir';
    AReplaceDialog.UILanguage.ReplaceWith := 'Substituir por:';
    AReplaceDialog.UILanguage.Less := 'Menos';
    AReplaceDialog.UILanguage.More := 'Mais';
    AReplaceDialog.UILanguage.Selection := 'Seleção';
    AReplaceDialog.UILanguage.Up := 'Cima';
    AReplaceDialog.UILanguage.WholeWordOnly := 'Só palavras inteiras';
    AReplaceDialog.UILanguage.WrapAtEndOfFile := 'Continuar do início ao final do arquivo';
    AReplaceDialog.UILanguage.Find := 'Localizar';
    AReplaceDialog.UILanguage.FindNext := 'Localizar próx';
    AReplaceDialog.UILanguage.FindWhat := 'Localizar:';
    AReplaceDialog.UILanguage.ReplaceAll := 'Substituir tudo';
    AReplaceDialog.UILanguage.ReplaceAllRange := 'Substituir tudo no intervalo';
    AReplaceDialog.UILanguage.CurrentFile := 'Arquivo atual';
  end;

  mmLog.Lines.Add('BeforeShowReplaceDialog');
end;

//After the Replace dialog has been shown
//Depois que o diálogo Substituir for exibido
procedure TReplaceDialogMain.TMSFNCDataGrid1AfterShowReplaceDialog(Sender: TObject;
  AReplaceDialog: TTMSFNCReplaceDialog);
begin
  mmLog.Lines.Add('AfterShowReplaceDialog');
end;

//Before each replace operation; ACanReplace can cancel
//Antes de cada operação de substituição; pode cancelarACanReplace
procedure TReplaceDialogMain.TMSFNCDataGrid1BeforeDialogReplace(Sender: TObject; AFindText, AReplaceText: string;
  var AParameters: TTMSFNCDataGridDataFindParameters; var ACanReplace: Boolean);
begin
  mmLog.Lines.Add('BeforeDialogReplace');

  //cancel search for very short strings
  if Length(AFindText) < 2 then
  begin
    ShowMessage('Please enter at least 2 characters.');
    ACanReplace := False;
  end;
end;

//After replace completes; reports total replacement count
//Após a conclusão da substituição; relata o número total de substituições
procedure TReplaceDialogMain.TMSFNCDataGrid1AfterDialogReplace(Sender: TObject; AFindText, AReplaceText: string;
  AReplaceCount: Integer);
begin
  if AReplaceCount > 0 then
    mmLog.Lines.Add(Format('AfterDialogReplace - From %s to %s [Count: %d]', [AFindText, AReplaceText, AReplaceCount]))
  else
    mmLog.Lines.Add('AfterDialogReplace - Not found');
end;

end.
