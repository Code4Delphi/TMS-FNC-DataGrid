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
  Appearance.Light,
  Appearance.Dark, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TAppearanceMain = class(TForm)
    Panel1: TPanel;
    btnLightMode: TButton;
    btnDarkMode: TButton;
    procedure btnLightModeClick(Sender: TObject);
    procedure btnDarkModeClick(Sender: TObject);
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

end.
