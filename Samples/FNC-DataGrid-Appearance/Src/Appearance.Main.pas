unit Appearance.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.UITypes,
  System.Rtti,
  System.Types,
  System.Math,
  Data.DB,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.Menus,
  VCL.TMSFNCTypes,
  VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes,
  VCL.TMSFNCDataGridCell,
  VCL.TMSFNCDataGridData,
  VCL.TMSFNCDataGridBase,
  VCL.TMSFNCDataGridCore,
  VCL.TMSFNCDataGridRenderer,
  VCL.TMSFNCCustomComponent,
  VCL.TMSFNCBitmapContainer,
  VCL.TMSFNCCustomControl,
  VCL.TMSFNCDataGrid;

type
  TAppearanceMain = class(TForm)
    TMSFNCDataGrid1: TTMSFNCDataGrid;
    procedure FormCreate(Sender: TObject);
    procedure TMSFNCDataGrid1AfterDrawCell(Sender: TObject; AGraphics: TTMSFNCGraphics; ACell: TTMSFNCDataGridCell);
    procedure TMSFNCDataGrid1BeforeDrawCell(Sender: TObject; AGraphics: TTMSFNCGraphics; ACell: TTMSFNCDataGridCell;
      var ACanDraw: Boolean);
    procedure TMSFNCDataGrid1GetCellLayout(Sender: TObject; ACell: TTMSFNCDataGridCell);
  private
    procedure ConfigDataGrid;
    procedure ConfigAppearance;
    function AvatarColor(ARow: Integer): TColor;
    procedure DrawPill(AGraphics: TTMSFNCGraphics; const ARect: TRectF; AColor: TColor);
    function FormatTarget(AValue: Double): string;
    function ProgressRect(const ACellRect: TRectF; APercent: Integer): TRectF;
    function StatusColor(const AStatus: string): TColor;
    function StatusTextColor(const AStatus: string): TColor;
  public

  end;

var
  AppearanceMain: TAppearanceMain;

implementation

{$R *.dfm}

const
  COL_CUSTOMER_ID = 0;
  COL_NAME = 1;
  COL_JOINED = 2;
  COL_STATUS = 3;
  COL_PROGRESS = 4;
  COL_TARGET = 5;
  COLOR_BACKGROUND = $0033322F;
  COLOR_HEADER = $004D4B45;
  COLOR_GRID_LINE = $00635F5A;
  COLOR_HEADER_TEXT = $00D6B38D;
  COLOR_TEXT = $00F5F5F5;
  COLOR_MUTED_TEXT = $00C8D0D7;
  COLOR_SELECTION = $00704A2D;
  COLOR_SELECTION_BORDER = $00E89B32;
  COLOR_PROGRESS_FILL = $00F1B77F;
  COLOR_PROGRESS_EMPTY = $00E8D7BE;
  COLOR_TARGET_POSITIVE = $005DD15D;
  COLOR_TARGET_NEGATIVE = $003D3DFF;

procedure TAppearanceMain.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  Self.ConfigDataGrid;
  TMSFNCDataGrid1.LoadFromCSVData('..\Data\customers.csv');
  Self.ConfigAppearance;
end;

procedure TAppearanceMain.ConfigDataGrid;
begin
  TMSFNCDataGrid1.BeginUpdate;
  try
    TMSFNCDataGrid1.Clear;
    TMSFNCDataGrid1.FixedRowCount := 1;
    TMSFNCDataGrid1.FixedColumnCount := 0;
    TMSFNCDataGrid1.Options.IO.Delimiter := ';';
    TMSFNCDataGrid1.Options.IO.StartColumn := 0;
    TMSFNCDataGrid1.Options.IO.StartRow := 0;
    TMSFNCDataGrid1.Options.Editing.Enabled := False;
    TMSFNCDataGrid1.Options.Filtering.Enabled := False;
    TMSFNCDataGrid1.Options.Sorting.Enabled := False;
    TMSFNCDataGrid1.Options.Column.Stretching.Enabled := True;
    TMSFNCDataGrid1.Options.Selection.Mode := gsmSingleRow;
    TMSFNCDataGrid1.DefaultRowHeight := 76;
    TMSFNCDataGrid1.DefaultColumnWidth := 190;
  finally
    TMSFNCDataGrid1.EndUpdate;
  end;
end;

procedure TAppearanceMain.ConfigAppearance;
begin
  Self.Color := COLOR_BACKGROUND;

  TMSFNCDataGrid1.Color := COLOR_BACKGROUND;
  TMSFNCDataGrid1.Font.Name := 'Segoe UI';
  TMSFNCDataGrid1.Font.Size := 18;
  TMSFNCDataGrid1.Font.Color := COLOR_TEXT;

  TMSFNCDataGrid1.CellAppearance.NormalLayout.Fill.Kind := gfkSolid;
  TMSFNCDataGrid1.CellAppearance.NormalLayout.Fill.Color := COLOR_BACKGROUND;
  TMSFNCDataGrid1.CellAppearance.NormalLayout.Stroke.Color := COLOR_GRID_LINE;
  TMSFNCDataGrid1.CellAppearance.NormalLayout.Font.Color := COLOR_TEXT;
  TMSFNCDataGrid1.CellAppearance.NormalLayout.Font.Name := 'Segoe UI';
  TMSFNCDataGrid1.CellAppearance.NormalLayout.Font.Size := 18;

  TMSFNCDataGrid1.CellAppearance.FixedLayout.Fill.Kind := gfkSolid;
  TMSFNCDataGrid1.CellAppearance.FixedLayout.Fill.Color := COLOR_HEADER;
  TMSFNCDataGrid1.CellAppearance.FixedLayout.Stroke.Color := COLOR_GRID_LINE;
  TMSFNCDataGrid1.CellAppearance.FixedLayout.Font.Color := COLOR_HEADER_TEXT;
  TMSFNCDataGrid1.CellAppearance.FixedLayout.Font.Name := 'Segoe UI';
  TMSFNCDataGrid1.CellAppearance.FixedLayout.Font.Size := 18;
  TMSFNCDataGrid1.CellAppearance.FixedLayout.Font.Style := [TFontStyle.fsBold];

  TMSFNCDataGrid1.CellAppearance.SelectedLayout.Fill.Kind := gfkSolid;
  TMSFNCDataGrid1.CellAppearance.SelectedLayout.Fill.Color := COLOR_SELECTION;
  TMSFNCDataGrid1.CellAppearance.SelectedLayout.Stroke.Color := COLOR_SELECTION_BORDER;
  TMSFNCDataGrid1.CellAppearance.SelectedLayout.Font.Color := COLOR_HEADER_TEXT;

  TMSFNCDataGrid1.CellAppearance.FocusedLayout.Fill.Kind := gfkSolid;
  TMSFNCDataGrid1.CellAppearance.FocusedLayout.Fill.Color := COLOR_SELECTION;
  TMSFNCDataGrid1.CellAppearance.FocusedLayout.Stroke.Color := COLOR_SELECTION_BORDER;
  TMSFNCDataGrid1.CellAppearance.FocusedLayout.Font.Color := COLOR_HEADER_TEXT;
end;

function TAppearanceMain.FormatTarget(AValue: Double): string;
begin
  Result := FormatFloat('#,##0.00', Abs(AValue));
  Result := StringReplace(Result, ',', '#', [rfReplaceAll]);
  Result := StringReplace(Result, '.', ',', [rfReplaceAll]);
  Result := StringReplace(Result, '#', '.', [rfReplaceAll]);

  if AValue < 0 then
    Result := '$ -' + Result
  else
    Result := '$ ' + Result;
end;

function TAppearanceMain.ProgressRect(const ACellRect: TRectF; APercent: Integer): TRectF;
begin
  Result := RectF(ACellRect.Left + 18, ACellRect.Top + 24, ACellRect.Right - 18, ACellRect.Bottom - 24);
  Result.Right := Result.Left + ((Result.Right - Result.Left) * EnsureRange(APercent, 0, 100) / 100);
end;

function TAppearanceMain.StatusColor(const AStatus: string): TColor;
begin
  if SameText(AStatus, 'Office') then
    Result := $0094E991
  else if SameText(AStatus, 'Flight') then
    Result := $002DC9F6
  else if SameText(AStatus, 'On Leave') then
    Result := $005A5AF5
  else
    Result := $00DD7B56;
end;

function TAppearanceMain.StatusTextColor(const AStatus: string): TColor;
begin
  if SameText(AStatus, 'On Leave') then
    Result := $00233142
  else
    Result := $003B332F;
end;

procedure TAppearanceMain.TMSFNCDataGrid1AfterDrawCell(Sender: TObject; AGraphics: TTMSFNCGraphics;
  ACell: TTMSFNCDataGridCell);
begin
 if ACell.Row < TMSFNCDataGrid1.FixedRowCount then
    Exit;

  if ACell.Column = COL_NAME then
  begin
    var LAvatarRect := RectF(ACell.Rect.Left + 18, ACell.Rect.Top + 21, ACell.Rect.Left + 52, ACell.Rect.Top + 55);
    AGraphics.Fill.Kind := gfkSolid;
    AGraphics.Fill.Color := Self.AvatarColor(ACell.Row);
    AGraphics.Stroke.Color := Self.AvatarColor(ACell.Row);
    AGraphics.DrawEllipse(LAvatarRect);

    AGraphics.Font.Name := 'Segoe UI';
    AGraphics.Font.Size := 10;
    AGraphics.Font.Style := [TFontStyle.fsBold];
    AGraphics.Font.Color := COLOR_BACKGROUND;
    AGraphics.DrawText(LAvatarRect, Copy(TMSFNCDataGrid1.Cells[ACell.Column, ACell.Row].AsString, 1, 1), False, gtaCenter, gtaCenter);

    var LNameRect := RectF(ACell.Rect.Left + 66, ACell.Rect.Top, ACell.Rect.Right - 10, ACell.Rect.Bottom);
    AGraphics.Font.Size := 18;
    AGraphics.Font.Style := [];
    if ACell.Row = TMSFNCDataGrid1.FocusedCell.Row then
      AGraphics.Font.Color := $00FFB14C
    else
      AGraphics.Font.Color := COLOR_TEXT;
    AGraphics.DrawText(LNameRect, TMSFNCDataGrid1.Cells[ACell.Column, ACell.Row].AsString, False, gtaLeading, gtaCenter);
  end;

  if ACell.Column = COL_STATUS then
  begin
    var LStatus := TMSFNCDataGrid1.Cells[ACell.Column, ACell.Row].AsString;
    var LPillRect := RectF(ACell.Rect.Left + 20, ACell.Rect.Top + 22, ACell.Rect.Right - 20, ACell.Rect.Bottom - 22);
    Self.DrawPill(AGraphics, LPillRect, Self.StatusColor(LStatus));

    AGraphics.Font.Name := 'Segoe UI';
    AGraphics.Font.Size := 18;
    AGraphics.Font.Style := [];
    AGraphics.Font.Color := Self.StatusTextColor(LStatus);
    AGraphics.DrawText(LPillRect, LStatus, False, gtaCenter, gtaCenter);
  end;

  if ACell.Column = COL_PROGRESS then
  begin
    var LPercent := TMSFNCDataGrid1.Ints[ACell.Column, ACell.Row];
    var LBackgroundRect := RectF(ACell.Rect.Left + 18, ACell.Rect.Top + 24, ACell.Rect.Right - 18, ACell.Rect.Bottom - 24);
    Self.DrawPill(AGraphics, LBackgroundRect, COLOR_PROGRESS_EMPTY);
    Self.DrawPill(AGraphics, Self.ProgressRect(ACell.Rect, LPercent), COLOR_PROGRESS_FILL);
  end;

  if ACell.Column = COL_TARGET then
  begin
    var LValue := TMSFNCDataGrid1.Floats[ACell.Column, ACell.Row];
    var LTargetRect := RectF(ACell.Rect.Left + 8, ACell.Rect.Top, ACell.Rect.Right - 8, ACell.Rect.Bottom);
    AGraphics.Font.Name := 'Segoe UI';
    AGraphics.Font.Size := 18;
    AGraphics.Font.Style := [];
    if LValue < 0 then
      AGraphics.Font.Color := COLOR_TARGET_NEGATIVE
    else
      AGraphics.Font.Color := COLOR_TARGET_POSITIVE;
    AGraphics.DrawText(LTargetRect, Self.FormatTarget(LValue), False, gtaTrailing, gtaCenter);
  end;
end;

procedure TAppearanceMain.TMSFNCDataGrid1BeforeDrawCell(Sender: TObject; AGraphics: TTMSFNCGraphics;
  ACell: TTMSFNCDataGridCell; var ACanDraw: Boolean);
begin
  if ACell.Row < TMSFNCDataGrid1.FixedRowCount then
    Exit;

  if ACell.Column in [COL_NAME, COL_STATUS, COL_PROGRESS, COL_TARGET] then
    ACell.DrawElements := [gcdFill, gcdStroke];
end;

procedure TAppearanceMain.TMSFNCDataGrid1GetCellLayout(Sender: TObject; ACell: TTMSFNCDataGridCell);
begin
  ACell.Layout.Fill.Kind := gfkSolid;
  ACell.Layout.Stroke.Color := COLOR_GRID_LINE;
  ACell.Layout.Font.Name := 'Segoe UI';
  ACell.Layout.Font.Size := 18;
  ACell.Layout.Font.Color := COLOR_TEXT;
  ACell.Layout.TextAlign := gtaLeading;
  ACell.Layout.VerticalTextAlign := gtaCenter;

  if ACell.Row < TMSFNCDataGrid1.FixedRowCount then
  begin
    ACell.Layout.Fill.Color := COLOR_HEADER;
    ACell.Layout.Font.Color := COLOR_HEADER_TEXT;
    ACell.Layout.Font.Style := [TFontStyle.fsBold];
    Exit;
  end;

  if ACell.Row = TMSFNCDataGrid1.FocusedCell.Row then
  begin
    ACell.Layout.Fill.Color := COLOR_SELECTION;
    ACell.Layout.Stroke.Color := COLOR_SELECTION_BORDER;
    ACell.Layout.Font.Color := $00FFB14C;
  end
  else
    ACell.Layout.Fill.Color := COLOR_BACKGROUND;

  if ACell.Column in [COL_NAME, COL_STATUS, COL_PROGRESS, COL_TARGET] then
    ACell.Layout.Font.Color := ACell.Layout.Fill.Color;

  if ACell.Column = COL_TARGET then
    ACell.Layout.TextAlign := gtaTrailing;
end;

function TAppearanceMain.AvatarColor(ARow: Integer): TColor;
const
  AVATAR_COLORS: array[0..5] of TColor = ($00D8C77A, $008DD4F5, $00B991F0,  $0098DDAA, $00E6A587, $00D68DB5);
begin
  Result := AVATAR_COLORS[ARow mod Length(AVATAR_COLORS)];
end;

procedure TAppearanceMain.DrawPill(AGraphics: TTMSFNCGraphics; const ARect: TRectF; AColor: TColor);
begin
  var LRadius := (ARect.Bottom - ARect.Top) / 2;
  var LBodyRect := RectF(ARect.Left + LRadius, ARect.Top, ARect.Right - LRadius, ARect.Bottom);
  var LLeftRect := RectF(ARect.Left, ARect.Top, ARect.Left + (LRadius * 2), ARect.Bottom);
  var LRightRect := RectF(ARect.Right - (LRadius * 2), ARect.Top, ARect.Right, ARect.Bottom);

  AGraphics.Fill.Kind := gfkSolid;
  AGraphics.Fill.Color := AColor;
  AGraphics.Stroke.Color := AColor;
  AGraphics.DrawRectangle(LBodyRect);
  AGraphics.DrawEllipse(LLeftRect);
  AGraphics.DrawEllipse(LRightRect);
end;

end.
