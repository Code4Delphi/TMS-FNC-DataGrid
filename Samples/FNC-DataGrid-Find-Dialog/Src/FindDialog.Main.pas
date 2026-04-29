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
    procedure FormCreate(Sender: TObject);
    procedure btnShowFindDialogDataGridClick(Sender: TObject);
    procedure TMSFNCDataGrid1BeforeShowFindDialog(Sender: TObject; AFindDialog: TTMSFNCFindDialog;
      var ACanShow: Boolean);
    procedure TMSFNCDataGrid1AfterShowFindDialog(Sender: TObject; AFindDialog: TTMSFNCFindDialog);
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

procedure TFindDialogMain.TMSFNCDataGrid1BeforeShowFindDialog(Sender: TObject;
  AFindDialog: TTMSFNCFindDialog; var ACanShow: Boolean);
begin
  AFindDialog.FindText := edtFindText.Text;
  AFindDialog.AutoHistory := ckAutoHistory.Checked;

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
    AFindDialog.UILanguage.Caption := 'Localizar';
    AFindDialog.UILanguage.FindWhat := 'Localizar:';
    AFindDialog.UILanguage.Find := 'Buscar';
    AFindDialog.UILanguage.Next := 'Pr'#243'ximo';
    AFindDialog.UILanguage.Close := 'Fechar';
    AFindDialog.UILanguage.CaseSensitive := 'Diferenciar mai'#250'sculas/min'#250'sculas';
    AFindDialog.UILanguage.WholeWordOnly := 'Somente palavra inteira';
    AFindDialog.UILanguage.Expression := 'Express'#227'o';
    AFindDialog.UILanguage.CloseIfFound := 'Fechar ao encontrar';
    AFindDialog.UILanguage.Direction := 'Dire'#231#227'o';
    AFindDialog.UILanguage.Up := 'Acima';
    AFindDialog.UILanguage.Down := 'Abaixo';
    AFindDialog.UILanguage.More := 'Mais';
    AFindDialog.UILanguage.Less := 'Menos';
  end;
end;

procedure TFindDialogMain.TMSFNCDataGrid1AfterShowFindDialog(Sender: TObject; AFindDialog: TTMSFNCFindDialog);
begin
  StatusBar1.Panels[0].Text := 'AfterShowFindDialog. ' + AFindDialog.FindText;
end;

end.
