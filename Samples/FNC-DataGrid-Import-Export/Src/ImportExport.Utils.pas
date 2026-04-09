unit ImportExport.Utils;

interface

uses
  System.SysUtils,
  System.StrUtils,
  Vcl.Dialogs;

type
  TUtils = class
  private
  public
    class function GetNameFileCSV: string;
    class function GetNameFile(const AExtensao: string): string;
    class function GetNameFileHTML: string;
    class function GetNameFileXLS: string;
    class function GetNameFilePDF: string;
    class function GetNameFileProprietary: string;
  end;

implementation

class function TUtils.GetNameFile(const AExtensao : string): string;
var
  LSaveDialog: TSaveDialog;
begin
  Result := '';
  LSaveDialog := TSaveDialog.Create(nil);
  try
    if AExtensao.IsEmpty then
      LSaveDialog.Filter := 'All Files (*.*)|*.*'
    else
    begin
      LSaveDialog.Filter := Format('Files %s (*.%s)|*.%s|All Files (*.*)|*.*', [UpperCase(AExtensao), AExtensao, AExtensao]);
      LSaveDialog.DefaultExt := AExtensao;
    end;

    LSaveDialog.Title := 'Save file ' + AExtensao;
    LSaveDialog.InitialDir :=  ExtractFileDir(ParamStr(0)).Replace('\Bin', '') + '\Data\';

    if not LSaveDialog.Execute then
      Abort;

    Result := LSaveDialog.FileName
  finally
    LSaveDialog.Free;
  end;
end;

class function TUtils.GetNameFileCSV: string;
begin
  Result := Self.GetNameFile('csv');
end;

class function TUtils.GetNameFileHTML: string;
begin
  Result := Self.GetNameFile('html');
end;

class function TUtils.GetNameFileXLS: string;
begin
  Result := Self.GetNameFile('xls');
end;

class function TUtils.GetNameFilePDF: string;
begin
  Result := Self.GetNameFile('pdf');
end;

class function TUtils.GetNameFileProprietary: string;
begin
  Result := Self.GetNameFile('');
end;

end.
