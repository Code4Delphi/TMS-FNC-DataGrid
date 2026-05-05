unit FindDialog.Main;

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
  TFindDialogMain = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    btnShowFindDialogDataGrid: TButton;
    rdGroupUILanguage: TRadioGroup;
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    GroupBox2: TGroupBox;
    ckAutoHistory: TCheckBox;
    ckCaseSensitive: TCheckBox;
    ckCaseSensitiveVisible: TCheckBox;
    edtFindText: TEdit;
    Label1: TLabel;
    GroupBox3: TGroupBox;
    mmLog: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnShowFindDialogDataGridClick(Sender: TObject);
    procedure TMSFNCDataGrid1BeforeShowFindDialog(Sender: TObject; AFindDialog: TTMSFNCFindDialog;
      var ACanShow: Boolean);
    procedure TMSFNCDataGrid1AfterShowFindDialog(Sender: TObject; AFindDialog: TTMSFNCFindDialog);
    procedure TMSFNCDataGrid1BeforeDialogFind(Sender: TObject; AFindText: string;
      var AParameters: TTMSFNCDataGridDataFindParameters; var ACanFind: Boolean);
    procedure TMSFNCDataGrid1AfterDialogFind(Sender: TObject; AFindText: string; AResultCell: TTMSFNCDataGridCellCoord;
      AFound: Boolean);
  private

  public

  end;

var
  FindDialogMain: TFindDialogMain;

implementation

{$R *.dfm}

procedure TFindDialogMain.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  TMSFNCDataGrid1.Clear;
  TMSFNCDataGrid1.LoadFromCSVData('..\Data\products.csv');
end;

procedure TFindDialogMain.btnShowFindDialogDataGridClick(Sender: TObject);
begin
  TMSFNCDataGrid1.ShowFindDialog;
end;

//Before the Find dialog is displayed; ACanShow can cancel
//Antes que o diálogo Encontrar seja exibido; pode cancelar ACanShow
procedure TFindDialogMain.TMSFNCDataGrid1BeforeShowFindDialog(Sender: TObject;
  AFindDialog: TTMSFNCFindDialog; var ACanShow: Boolean);
begin
  AFindDialog.AutoHistory := ckAutoHistory.Checked;
  AFindDialog.FindText := edtFindText.Text;

  //Options: fdoCaseSensitive, fdoExpression, fdoCloseIfFound,
  //fdoWholeWordOnly, fdoWrapAtEndOfFile, fdoContinueToNextFile, fdoMoreEnabled,
  //fdoSetMarkerEnabled, fdoNextEnabled, fdoFindEnabled, fdoCloseEnabled,
  //fdoMoreExpanded, fdoDown, fdoSelection
  AFindDialog.Options := AFindDialog.Options - [fdoCaseSensitive];
  if ckCaseSensitive.Checked then
    AFindDialog.Options := AFindDialog.Options + [fdoCaseSensitive];

  //VisibleOptions: fdovCaseSensitive, fdovExpression, fdovCloseIfFound,
  //fdovWholeWordOnly, fdovWrapAtEndOfFile, fdovContinueToNextFile, fdovMore, fdovSetMarker, fdovNext, fdovFind,
  //fdovClose, fdovFindCombo, fdovFindMemo, fdovDirection, fdovSelection
  AFindDialog.VisibleOptions := AFindDialog.VisibleOptions - [fdovCaseSensitive];
  if ckCaseSensitiveVisible.Checked then
    AFindDialog.VisibleOptions := AFindDialog.VisibleOptions + [fdovCaseSensitive];

  if rdGroupUILanguage.ItemIndex = 1 then
  begin
    AFindDialog.UILanguage.Caption := 'Pesquisar';
    AFindDialog.UILanguage.FindWhat := 'Localizar:';
    AFindDialog.UILanguage.Find := 'Buscar';
    AFindDialog.UILanguage.Next := 'Próximo';
    AFindDialog.UILanguage.Close := 'Fechar';
    AFindDialog.UILanguage.CaseSensitive := 'Diferenciar maiúsculas/minúsculas';
    AFindDialog.UILanguage.WholeWordOnly := 'Somente palavra inteira';
    AFindDialog.UILanguage.Expression := 'Expressão';
    AFindDialog.UILanguage.CloseIfFound := 'Fechar ao encontrar';
    AFindDialog.UILanguage.Direction := 'Direção';
    AFindDialog.UILanguage.Up := 'Acima';
    AFindDialog.UILanguage.Down := 'Abaixo';
    AFindDialog.UILanguage.More := 'Mais';
    AFindDialog.UILanguage.Less := 'Menos';
  end;

  mmLog.Lines.Add('BeforeShowFindDialog');
end;

//After the Find dialog has been shown
//Depois que o diálogo Encontrar for exibido
procedure TFindDialogMain.TMSFNCDataGrid1AfterShowFindDialog(Sender: TObject; AFindDialog: TTMSFNCFindDialog);
begin
  mmLog.Lines.Add('AfterShowFindDialog');
end;

//Before each find operation; ACanFind can cancel
//Antes de cada operação de encontro; pode cancelarACanFind
procedure TFindDialogMain.TMSFNCDataGrid1BeforeDialogFind(Sender: TObject; AFindText: string;
  var AParameters: TTMSFNCDataGridDataFindParameters; var ACanFind: Boolean);
begin
  mmLog.Lines.Add('BeforeDialogFind');

  //cancel search for very short strings
  if Length(AFindText) < 2 then
  begin
    ShowMessage('Please enter at least 2 characters.');
    ACanFind := False;
  end;
end;

//After each find operation; reports result cell and found flag
//Após cada operação de encontro; Reporta célula de resultado e flag de encontros
procedure TFindDialogMain.TMSFNCDataGrid1AfterDialogFind(Sender: TObject; AFindText: string;
  AResultCell: TTMSFNCDataGridCellCoord; AFound: Boolean);
begin
  if AFound then
    mmLog.Lines.Add(Format('AfterDialogFind - Found at col %d, row %d', [AResultCell.Column, AResultCell.Row]))
  else
    mmLog.Lines.Add('AfterDialogFind - Not found');
end;

end.
