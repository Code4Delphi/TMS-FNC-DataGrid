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
  Vcl.ExtCtrls;

type
  TAutoCompleteMain = class(TForm)
    pnlContent: TPanel;
    lblTitle: TLabel;
    lblDescription: TLabel;
    btnNormal: TButton;
    btnLookupList: TButton;
    procedure btnNormalClick(Sender: TObject);
    procedure btnLookupListClick(Sender: TObject);
  private
    procedure OpenNormalSample;
    procedure OpenLookupListSample;
  public

  end;

var
  AutoCompleteMain: TAutoCompleteMain;

implementation

uses
  AutoComplete.LookupList,
  AutoComplete.Normal;

{$R *.dfm}

procedure TAutoCompleteMain.btnLookupListClick(Sender: TObject);
begin
  OpenLookupListSample;
end;

procedure TAutoCompleteMain.btnNormalClick(Sender: TObject);
begin
  OpenNormalSample;
end;

procedure TAutoCompleteMain.OpenLookupListSample;
var
  LForm: TAutoCompleteLookupList;
begin
  LForm := TAutoCompleteLookupList.Create(Self);
  try
    LForm.ShowModal;
  finally
    LForm.Free;
  end;
end;

procedure TAutoCompleteMain.OpenNormalSample;
var
  LForm: TAutoCompleteNormal;
begin
  LForm := TAutoCompleteNormal.Create(Self);
  try
    LForm.ShowModal;
  finally
    LForm.Free;
  end;
end;

end.
