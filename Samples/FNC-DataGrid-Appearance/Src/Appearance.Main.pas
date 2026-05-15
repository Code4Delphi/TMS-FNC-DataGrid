unit Appearance.Main;

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
  Vcl.ExtCtrls,
  Appearance.Light,
  Appearance.Dark,
  Appearance.Grouping;

type
  TAppearanceMain = class(TForm)
    Panel1: TPanel;
    btnLightMode: TButton;
    btnDarkMode: TButton;
    btnDarkModeGroup: TButton;
    procedure btnLightModeClick(Sender: TObject);
    procedure btnDarkModeClick(Sender: TObject);
    procedure btnDarkModeGroupClick(Sender: TObject);
  private

  public

  end;

var
  AppearanceMain: TAppearanceMain;

implementation

{$R *.dfm}

procedure TAppearanceMain.btnLightModeClick(Sender: TObject);
begin
  AppearanceLight.ShowModal;
end;

procedure TAppearanceMain.btnDarkModeClick(Sender: TObject);
begin
  AppearanceDark.ShowModal;
end;

procedure TAppearanceMain.btnDarkModeGroupClick(Sender: TObject);
begin
  AppearanceGrouping.ShowModal;
end;

end.
