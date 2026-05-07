unit AutoComplete.Main;

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
  AutoComplete.LookupList,
  AutoComplete.Normal;

type
  TAutoCompleteMain = class(TForm)
    pnlContent: TPanel;
    btnNormal: TButton;
    btnLookupList: TButton;
    procedure btnNormalClick(Sender: TObject);
    procedure btnLookupListClick(Sender: TObject);
  private

  public

  end;

var
  AutoCompleteMain: TAutoCompleteMain;

implementation

{$R *.dfm}

procedure TAutoCompleteMain.btnLookupListClick(Sender: TObject);
begin
  AutoCompleteLookupList.ShowModal;
end;

procedure TAutoCompleteMain.btnNormalClick(Sender: TObject);
begin
  AutoCompleteNormal.ShowModal
end;

end.
