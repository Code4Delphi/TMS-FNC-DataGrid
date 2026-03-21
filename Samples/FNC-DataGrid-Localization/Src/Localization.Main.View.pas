unit Localization.Main.View;

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
  Vcl.StdCtrls,
  Localization.Config,
  Localization.Departments.View;

type
  TLocalizationMainView = class(TForm)
    GroupBox1: TGroupBox;
    btnSetLocalizationToPortuguese: TButton;
    btnSetLocalizationToEnglish: TButton;
    btnSetLocalizationToSpanish: TButton;
    procedure btnSetLocalizationToPortugueseClick(Sender: TObject);
    procedure btnSetLocalizationToEnglishClick(Sender: TObject);
    procedure btnSetLocalizationToSpanishClick(Sender: TObject);
  private

  public

  end;

var
  LocalizationMainView: TLocalizationMainView;

implementation

{$R *.dfm}

procedure TLocalizationMainView.btnSetLocalizationToEnglishClick(Sender: TObject);
begin
  LocalizationDepartmentsView := TLocalizationDepartmentsView.Create(nil);
  try
    LocalizationDepartmentsView.Language := TLocalizationLanguage.English;
    LocalizationDepartmentsView.ShowModal;
  finally
    FreeAndNil(LocalizationDepartmentsView)
  end;
end;

procedure TLocalizationMainView.btnSetLocalizationToPortugueseClick(Sender: TObject);
begin
  LocalizationDepartmentsView := TLocalizationDepartmentsView.Create(nil);
  try
    LocalizationDepartmentsView.Language := TLocalizationLanguage.Portuguese;
    LocalizationDepartmentsView.ShowModal;
  finally
    FreeAndNil(LocalizationDepartmentsView)
  end;
end;

procedure TLocalizationMainView.btnSetLocalizationToSpanishClick(Sender: TObject);
begin
  LocalizationDepartmentsView := TLocalizationDepartmentsView.Create(nil);
  try
    LocalizationDepartmentsView.Language := TLocalizationLanguage.Spanish;
    LocalizationDepartmentsView.ShowModal;
  finally
    FreeAndNil(LocalizationDepartmentsView)
  end;
end;

end.
