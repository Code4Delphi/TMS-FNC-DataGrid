unit Localization.Config;

interface

uses
  VCL.TMSFNCDataGrid;

type
  {$SCOPEDENUMS ON}
  TLocalizationLanguage = (English, Portuguese, Spanish);
  {$SCOPEDENUMS OFF}

  TLocalizationConfig = class
  private
    class procedure SetLocalizationToEnglish(const ADataGrid: TTMSFNCDataGrid);
    class procedure SetLocalizationToPortuguese(const ADataGrid: TTMSFNCDataGrid);
    class procedure SetLocalizationToSpanish(const ADataGrid: TTMSFNCDataGrid); static;
  public
    class procedure SetLocalizationLanguage(const ADataGrid: TTMSFNCDataGrid; const ALanguage: TLocalizationLanguage);
  end;

implementation

class procedure TLocalizationConfig.SetLocalizationLanguage(const ADataGrid: TTMSFNCDataGrid; const ALanguage: TLocalizationLanguage);
begin
  if not Assigned(ADataGrid) then
    Exit;

  case ALanguage of
    TLocalizationLanguage.English:
      Self.SetLocalizationToEnglish(ADataGrid);
    TLocalizationLanguage.Portuguese:
      Self.SetLocalizationToPortuguese(ADataGrid);
    TLocalizationLanguage.Spanish:
      Self.SetLocalizationToSpanish(ADataGrid);
  end;
end;

class procedure TLocalizationConfig.SetLocalizationToEnglish(const ADataGrid: TTMSFNCDataGrid);
begin
  ADataGrid.BeginUpdate;
  ADataGrid.Options.Localization.FilterAllText := '(All)';
  ADataGrid.Options.Localization.FilterEmptyText := '(Empty)';
  ADataGrid.Options.Localization.FilterNotEmptyText := '(Not Empty)';
  ADataGrid.Options.Localization.FilterClearButtonHint := 'Clear Filter';
  ADataGrid.Options.Localization.FilterEditPrompt := 'Filter';
  ADataGrid.Options.Localization.FilterTypeButtonHint := 'TFilter Type';
  ADataGrid.Options.Localization.FilterTypeContainsText := 'Contains';
  ADataGrid.Options.Localization.FilterTypeEndsWithText := 'Ends with';
  ADataGrid.Options.Localization.FilterTypeEqualText := 'Equals';
  ADataGrid.Options.Localization.FilterTypeNotEqualText := 'Does not equal';
  ADataGrid.Options.Localization.FilterTypeStartsWithText := 'Começa com';
  ADataGrid.Options.Localization.FilterTypeLargerThanText := 'Larger than';
  ADataGrid.Options.Localization.FilterTypeLargerOrEqualThanText := 'Larger than or equal to';
  ADataGrid.Options.Localization.FilterTypeSmallerThanText := 'Smaller than';
  ADataGrid.Options.Localization.FilterTypeSmallerOrEqualThanText := 'Smaller than or equal to';
  ADataGrid.Options.Localization.FilterSortButtonAscendingHint := 'Sort Ascending';
  ADataGrid.Options.Localization.FilterSortButtonAscendingText := 'Sort Descending';
  ADataGrid.Options.Localization.FilterSortButtonDescendingHint := 'Sort Descending';
  ADataGrid.Options.Localization.FilterSortButtonDescendingText := 'Ordenar decrescente';
  ADataGrid.Options.Localization.FilterTypeEmptyText := 'Empty';
  ADataGrid.Options.Localization.FilterTypeEndsWithText := 'Ends with';
  ADataGrid.Options.Localization.FilterTypeNotContainsText := 'Does not contain';
  ADataGrid.Options.Localization.FilterTypeNotEmptyText := 'Not Empty';
  ADataGrid.EndUpdate;
end;

class procedure TLocalizationConfig.SetLocalizationToPortuguese(const ADataGrid: TTMSFNCDataGrid);
begin
  ADataGrid.BeginUpdate;
  try
    ADataGrid.Options.Localization.FilterAllText := '(Todos)';
    ADataGrid.Options.Localization.FilterEmptyText := '(Vazio)';
    ADataGrid.Options.Localization.FilterNotEmptyText := '(Não vazio)';
    ADataGrid.Options.Localization.FilterClearButtonHint := 'Limpar filtro';
    ADataGrid.Options.Localization.FilterEditPrompt := 'Filtrar';
    ADataGrid.Options.Localization.FilterTypeButtonHint := 'Tipo de filtro';
    ADataGrid.Options.Localization.FilterTypeContainsText := 'Contém';
    ADataGrid.Options.Localization.FilterTypeNotContainsText := 'Não contém';
    ADataGrid.Options.Localization.FilterTypeEndsWithText := 'Termina com';
    ADataGrid.Options.Localization.FilterTypeStartsWithText := 'Começa com';
    ADataGrid.Options.Localization.FilterTypeEqualText := 'Igual a';
    ADataGrid.Options.Localization.FilterTypeNotEqualText := 'Diferente de';
    ADataGrid.Options.Localization.FilterTypeLargerThanText := 'Maior que';
    ADataGrid.Options.Localization.FilterTypeLargerOrEqualThanText := 'Maior ou igual a';
    ADataGrid.Options.Localization.FilterTypeSmallerThanText := 'Menor que';
    ADataGrid.Options.Localization.FilterTypeSmallerOrEqualThanText := 'Menor ou igual a';
    ADataGrid.Options.Localization.FilterTypeEmptyText := 'Vazio';
    ADataGrid.Options.Localization.FilterTypeNotEmptyText := 'Não vazio';
    ADataGrid.Options.Localization.FilterSortButtonAscendingHint := 'Ordenar crescente';
    ADataGrid.Options.Localization.FilterSortButtonAscendingText := 'Ordenar crescente';
    ADataGrid.Options.Localization.FilterSortButtonDescendingHint := 'Ordenar decrescente';
    ADataGrid.Options.Localization.FilterSortButtonDescendingText := 'Ordenar decrescente';
  finally
    ADataGrid.EndUpdate;
  end;
end;

class procedure TLocalizationConfig.SetLocalizationToSpanish(const ADataGrid: TTMSFNCDataGrid);
begin
  ADataGrid.BeginUpdate;
  try
    ADataGrid.Options.Localization.FilterAllText := '(Todos)';
    ADataGrid.Options.Localization.FilterEmptyText := '(Vacío)';
    ADataGrid.Options.Localization.FilterNotEmptyText := '(No vacío)';
    ADataGrid.Options.Localization.FilterClearButtonHint := 'Limpiar filtro';
    ADataGrid.Options.Localization.FilterEditPrompt := 'Filtrar';
    ADataGrid.Options.Localization.FilterTypeButtonHint := 'Tipo de filtro';
    ADataGrid.Options.Localization.FilterTypeContainsText := 'Contiene';
    ADataGrid.Options.Localization.FilterTypeNotContainsText := 'No contiene';
    ADataGrid.Options.Localization.FilterTypeEndsWithText := 'Termina con';
    ADataGrid.Options.Localization.FilterTypeStartsWithText := 'Comienza con';
    ADataGrid.Options.Localization.FilterTypeEqualText := 'Igual a';
    ADataGrid.Options.Localization.FilterTypeNotEqualText := 'Distinto de';
    ADataGrid.Options.Localization.FilterTypeLargerThanText := 'Mayor que';
    ADataGrid.Options.Localization.FilterTypeLargerOrEqualThanText := 'Mayor o igual a';
    ADataGrid.Options.Localization.FilterTypeSmallerThanText := 'Menor que';
    ADataGrid.Options.Localization.FilterTypeSmallerOrEqualThanText := 'Menor o igual a';
    ADataGrid.Options.Localization.FilterTypeEmptyText := 'Vacío';
    ADataGrid.Options.Localization.FilterTypeNotEmptyText := 'No vacío';
    ADataGrid.Options.Localization.FilterSortButtonAscendingHint := 'Orden ascendente';
    ADataGrid.Options.Localization.FilterSortButtonAscendingText := 'Orden ascendente';
    ADataGrid.Options.Localization.FilterSortButtonDescendingHint := 'Orden descendente';
    ADataGrid.Options.Localization.FilterSortButtonDescendingText := 'Orden descendente';
  finally
    ADataGrid.EndUpdate;
  end;
end;

end.
