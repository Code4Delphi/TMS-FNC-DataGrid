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
  CellColoring.Filters;

type
  TCellColoringMain = class(TForm)
    Panel1: TPanel;
    btnEvents: TButton;
    btnFIlters: TButton;
    procedure btnEventsClick(Sender: TObject);
    procedure btnFIltersClick(Sender: TObject);
  private

  public

  end;

var
  CellColoringMain: TCellColoringMain;

implementation

{$R *.dfm}

procedure TCellColoringMain.btnEventsClick(Sender: TObject);
begin
  CellColoringEvents.ShowModal;
end;

procedure TCellColoringMain.btnFIltersClick(Sender: TObject);
begin
  CellColoringFilters.ShowModal;
end;

end.
