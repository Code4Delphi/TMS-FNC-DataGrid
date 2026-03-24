unit Pagination.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Pagination.IntegratedFooter, Pagination.Programmatic;

type
  TPaginationMain = class(TForm)
    Panel1: TPanel;
    btnPaginationIntegratedFooter: TButton;
    btnPaginationProgrammatic: TButton;
    procedure btnPaginationIntegratedFooterClick(Sender: TObject);
    procedure btnPaginationProgrammaticClick(Sender: TObject);
  private

  public

  end;

var
  PaginationMain: TPaginationMain;

implementation

{$R *.dfm}

procedure TPaginationMain.btnPaginationIntegratedFooterClick(Sender: TObject);
begin
  PaginationIntegratedFooter.ShowModal;
end;

procedure TPaginationMain.btnPaginationProgrammaticClick(Sender: TObject);
begin
  PaginationProgrammatic.ShowModal;
end;

end.
