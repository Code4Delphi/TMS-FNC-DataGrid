unit CellColoring.Main;

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
  CellColoring.Events,
  CellColoring.Advanced;

type
  TCellColoringMain = class(TForm)
    Panel1: TPanel;
    btnGroupingBasic: TButton;
    btnGroupingAdvanced: TButton;
    procedure btnGroupingBasicClick(Sender: TObject);
    procedure btnGroupingAdvancedClick(Sender: TObject);
  private

  public

  end;

var
  CellColoringMain: TCellColoringMain;

implementation

{$R *.dfm}

procedure TCellColoringMain.btnGroupingBasicClick(Sender: TObject);
begin
  CellColoringEvents.ShowModal;
end;

procedure TCellColoringMain.btnGroupingAdvancedClick(Sender: TObject);
begin
  CellColoringAdvanced.ShowModal;
end;

end.
