unit DBGridXLS;

interface
uses Windows, SysUtils, Classes, Graphics, Dialogs, Controls, DB,
     GridsEh, DBGridEh, DBGridEhImpExp;

type

  TCustomDataGridExportAsXLS = class(TDBGridEhExport)
  private
    FCol, FRow: Word;
    procedure WriteBlankCell;
    procedure WriteIntegerCell(const AValue: Integer);
    procedure WriteFloatCell(const AValue: Double);
    procedure WriteStringCell(const AValue: String);
    procedure IncColRow;
    procedure WriteCellText(Text: String; Field: TField);
  protected
    procedure WritePrefix; override;
    procedure WriteSuffix; override;
    procedure WriteTitle(ColumnsList: TColumnsEhList); override;
    procedure WriteDataCell(Column: TColumnEh; FColCellParamsEh: TColCellParamsEh); override;
    procedure WriteFooterCell(DataCol, Row: Integer; Column: TColumnEh; AFont: TFont;
      Background: TColor; Alignment: TAlignment; Text: String); override;
  public
    procedure ExportToStream(AStream: TStream; IsExportAll: Boolean); override;
  end;


implementation
uses Variants; //, MlekoUtils;

{ TCustomDataGridExportAsXLS }

procedure StreamWriteWordArray(Stream: TStream; wr: array of Word);
var
  i: Integer;
begin
  for i := 0 to Length(wr)-1 do
{$IFDEF CIL}
    Stream.Write(wr[i]);
{$ELSE}
    Stream.Write(wr[i], SizeOf(wr[i]));
{$ENDIF}
end;

procedure StreamWriteAnsiString(Stream: TStream; S: String);
{$IFDEF CIL}
var
  b: TBytes;
{$ENDIF}
begin
{$IFDEF CIL}
    b := BytesOf(AnsiString(S));
    Stream.Write(b, Length(b));
{$ELSE}
    Stream.Write(PChar(S)^, Length(S));
{$ENDIF}
end;

var
  CXlsBof: array[0..5] of Word = ($809, 8, 0, $10, 0, 0);
  CXlsEof: array[0..1] of Word = ($0A, 00);
  CXlsLabel: array[0..5] of Word = ($204, 0, 0, 0, 0, 0);
  CXlsNumber: array[0..4] of Word = ($203, 14, 0, 0, 0);
  CXlsRk: array[0..4] of Word = ($27E, 10, 0, 0, 0);
  CXlsBlank: array[0..4] of Word = ($201, 6, 0, 0, $17);


procedure TCustomDataGridExportAsXLS.WriteBlankCell;
begin
  CXlsBlank[2] := FRow;
  CXlsBlank[3] := FCol;
  StreamWriteWordArray(Stream, CXlsBlank);
//  Stream.WriteBuffer(CXlsBlank, SizeOf(CXlsBlank));
  IncColRow;
end;

procedure TCustomDataGridExportAsXLS.WriteFloatCell(const AValue: Double);
begin
  CXlsNumber[2] := FRow;
  CXlsNumber[3] := FCol;
  StreamWriteWordArray(Stream, CXlsNumber);
//  Stream.WriteBuffer(CXlsNumber, SizeOf(CXlsNumber));
  Stream.WriteBuffer(AValue, 8);
  IncColRow;
end;

procedure TCustomDataGridExportAsXLS.WriteIntegerCell(const AValue: Integer);
var
  V: Integer;
begin
  CXlsRk[2] := FRow;
  CXlsRk[3] := FCol;
  StreamWriteWordArray(Stream, CXlsRk);
//  Stream.WriteBuffer(CXlsRk, SizeOf(CXlsRk));
  V := (AValue shl 2) or 2;
  Stream.WriteBuffer(V, 4);
  IncColRow;
end;

procedure TCustomDataGridExportAsXLS.WriteStringCell(const AValue: string);
var
  L: Word;
begin
  L := Length(AValue);
  CXlsLabel[1] := 8 + L;
  CXlsLabel[2] := FRow;
  CXlsLabel[3] := FCol;
  CXlsLabel[5] := L;
  StreamWriteWordArray(Stream, CXlsLabel);
//  Stream.WriteBuffer(CXlsLabel, SizeOf(CXlsLabel));
  StreamWriteAnsiString(Stream, AValue);
//  Stream.WriteBuffer(Pointer(AValue)^, L);
  IncColRow;
end;

procedure TCustomDataGridExportAsXLS.WritePrefix;
begin
  StreamWriteWordArray(Stream, CXlsBof);
//  Stream.WriteBuffer(CXlsBof, SizeOf(CXlsBof));
end;

procedure TCustomDataGridExportAsXLS.WriteSuffix;
begin
  StreamWriteWordArray(Stream, CXlsEof);
//  Stream.WriteBuffer(CXlsEof, SizeOf(CXlsEof));
end;

procedure TCustomDataGridExportAsXLS.WriteTitle(ColumnsList: TColumnsEhList);
var i: Integer;
begin
  for i := 0 to ColumnsList.Count - 1 do
  begin
    WriteStringCell(ColumnsList[i].Title.Caption);
  end;
end;

procedure TCustomDataGridExportAsXLS.WriteCellText(Text: String; Field: TField);
var i, c: Integer; f: Double;
begin
  if not (Field.DataType in [ftString, ftWideString]) then
     //Text:= ReplaceChars(Text, #1, #32, '', [rfReplaceAll]);
     Text:= Field.AsString;
  Val(Text, i, c);
  if (c=0) then
     WriteIntegerCell(i) else
     begin
       f:= StrToFloatDef(Text, GetNan());
       if not IsNan(f) then
          WriteFloatCell(f) else
          WriteStringCell(Text);
     end;
end;

procedure TCustomDataGridExportAsXLS.WriteDataCell(Column: TColumnEh; FColCellParamsEh: TColCellParamsEh);
var s: String; i, c: Integer; f: Double; d: TDate;
begin
  if Column.Field = nil then
    WriteBlankCell
  else if Column.GetColumnType = ctKeyPickList then
    WriteStringCell(FColCellParamsEh.Text)
  else if Column.Field.IsNull then
    WriteBlankCell
  else
    WriteCellText(FColCellParamsEh.Text, Column.Field);
    //WriteCellText(Column.Field.AsString);
end;

procedure TCustomDataGridExportAsXLS.WriteFooterCell(DataCol, Row: Integer;
  Column: TColumnEh; AFont: TFont; Background: TColor;
  Alignment: TAlignment; Text: String);
begin
  if Column.UsedFooter(Row).ValueType in [fvtSum, fvtCount] then
    WriteFloatCell(FooterValues[Row * ExpCols.Count + DataCol])
  else
    WriteCellText(Text, Column.Field);
end;

procedure TCustomDataGridExportAsXLS.ExportToStream(AStream: TStream;
  IsExportAll: Boolean);
begin
  FCol := 0;
  FRow := 0;
  inherited ExportToStream(AStream, IsExportAll);
end;

procedure TCustomDataGridExportAsXLS.IncColRow;
begin
  if FCol = ExpCols.Count - 1 then
  begin
    Inc(FRow);
    FCol := 0;
  end else
    Inc(FCol);
end;

end.
