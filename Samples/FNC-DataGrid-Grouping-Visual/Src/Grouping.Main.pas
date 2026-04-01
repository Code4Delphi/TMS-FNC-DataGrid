unit Grouping.Main;

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
  Grouping.Basic,
  Grouping.Advanced;

type
  TGroupingMain = class(TForm)
    Panel1: TPanel;
    btnGroupingBasic: TButton;
    btnGroupingAdvanced: TButton;
    procedure btnGroupingBasicClick(Sender: TObject);
    procedure btnGroupingAdvancedClick(Sender: TObject);
  private

  public

  end;

var
  GroupingMain: TGroupingMain;

implementation

{$R *.dfm}

procedure TGroupingMain.btnGroupingBasicClick(Sender: TObject);
begin
  GroupingBasic.ShowModal;
end;

procedure TGroupingMain.btnGroupingAdvancedClick(Sender: TObject);
begin
  GroupingAdvanced.ShowModal;
end;

end.
