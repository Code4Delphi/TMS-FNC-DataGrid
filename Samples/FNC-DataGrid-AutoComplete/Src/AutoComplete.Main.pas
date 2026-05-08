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
  AutoComplete.Normal,
  AutoComplete.LookupList,
  AutoComplete.LookupList.Automatic;

type
  TAutoCompleteMain = class(TForm)
    pnlContent: TPanel;
    btnNormal: TButton;
    btnLookupList: TButton;
    btnLookupListAutomatic: TButton;
    procedure btnNormalClick(Sender: TObject);
    procedure btnLookupListClick(Sender: TObject);
    procedure btnLookupListAutomaticClick(Sender: TObject);
  private

  public

  end;

var
  AutoCompleteMain: TAutoCompleteMain;

implementation

{$R *.dfm}

procedure TAutoCompleteMain.btnNormalClick(Sender: TObject);
begin
  AutoCompleteNormal.ShowModal
end;

procedure TAutoCompleteMain.btnLookupListClick(Sender: TObject);
begin
  AutoCompleteLookupList.ShowModal;
end;

procedure TAutoCompleteMain.btnLookupListAutomaticClick(Sender: TObject);
begin
  AutoCompleteLookupListAutomatic.ShowModal;
end;

end.
