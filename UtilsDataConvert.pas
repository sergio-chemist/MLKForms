unit UtilsDataConvert;

interface

uses
  Classes, DB, UtilsClasses;

const
  ABase = '95748';

type
  TRoundToRange = -37..37;


  //------------------------------------------------------------------------------
  // StrToOem -  онвертит строку в OEM кодировку
  //------------------------------------------------------------------------------
function StrToOem(const AnsiStr: AnsiString): AnsiString;
//------------------------------------------------------------------------------
// StrToBPrn -  онвертит строку в OEM кодировку и замен€ет двойные кавычки на
//             одинарные (дл€ распечатки на принтере штрих-кодов)
//------------------------------------------------------------------------------
function StrToBPrn(const AnsiStr: AnsiString): AnsiString;

function ConvertToVariant(const Value: TVarRec): Variant;
function RowToParams(DataSet: TDataSet): Tparams; overload;
procedure RowToParams(DataSet: TDataSet; Params: TParams); overload;
function RowToStrings(DataSet: TDataSet): TStrings;
function LargeIntegerToString(Value: TLargeIntegerField): string; // int64 -> String
function VariantAsInt64ToString(Value: Variant): string; // Variant -> String с промежуточным переводом в int64
function LargeIntegerToVarParam(Value: TLargeIntegerField): Variant; // int64 -> Variant as varDouble
function VariantToLargeInteger(Value: Variant): TLargeIntegerField;
function VariantToVariant64(Value: Variant): Variant; // Variant -> Variant через int64
function StrAsInt64ToVariant(Value: string): Variant; // String (как int64) -> variant
function IntToString(Value: LongInt): string;
function IntToStringUkr(Value: LongInt): string;
function IntToStringUkrKg(Value: LongInt): string;
function MonthToString(Value: integer; RodPad: boolean): string;
function MonthToStringUkr(Value: integer; RodPad: boolean): string;
procedure ParamsToDataSet(Params: Tparams; var DataSet: TDataSet);
procedure DataSetToParams(DataSet: TDataSet; var Params: Tparams);

implementation

uses
  Windows, SysUtils, Math, Variants;

function StrToOem(const AnsiStr: AnsiString): AnsiString;
begin
//  SetLength(Result, Length(AnsiStr));
//  if Length(Result) > 0 then
//    CharToOem(PChar(AnsiStr), PChar(Result));
end;

function StrToBPrn(const AnsiStr: AnsiString): AnsiString;
begin
  Result := StrToOem(AnsiStr);
  while Pos('"', Result) > 0 do
    Result[Pos('"', Result)] := '''';
end;

function CreateAppTempFile(Prefix: AnsiString): AnsiString;
var
  TempPath: AnsiString;
  TempFileName: AnsiString;
  BufferSize: DWORD;
begin
  SetLength(TempFileName, MAX_PATH);
  //    ZeroMemory(@TempFileName, SizeOf(TempFileName));
  SetLength(TempPath, MAX_PATH);
  //    ZeroMemory(@TempPath, SizeOf(TempPath));

  //  GetTempPath(BufferSize, PChar(TempPath));
  TempPath := GetCurrentDir + '\'; // AANDY

  if GetTempFileName(PChar(TempPath), PChar(Prefix), 0, PChar(TempFileName)) <> 0 then
    Result := Trim(AnsiString(PChar(TempFileName)))
  else
    raise Exception.Create('ќшибка создани€ временного файла ' + Trim(AnsiString(PChar(TempFileName))));
end;

procedure AddToArchive(const WorkDir, ArchiveName, FileName: string);
var
  si: TStartupInfo;
  pi: TProcessInformation;
  c: cardinal;
begin
  FillChar(si, sizeof(si), 0);
  si.cb := sizeof(si);
  si.dwFlags := STARTF_USESHOWWINDOW;
  si.wShowWindow := SW_HIDE;
  c := 1;
  if CreateProcess(nil, PChar(WorkDir + 'arj32.exe a -hf2 ' + ArchiveName + ' ' + FileName),
    nil, nil, false, 0, nil, PChar(WorkDir), si, pi) then
  begin
    WaitForSingleObject(pi.hProcess, Infinite);
    GetExitCodeProcess(pi.hProcess, c);
    CloseHandle(pi.hThread);
    CloseHandle(pi.hProcess);
  end;
  if c <> 0 then raise Exception.Create('ќшибка архивировани€ файла ' + FileName + '. ќбратитесь к программистам.');
end;

// 24.11.2003 Bolkonskiy A.V. ‘ункци€ Ўевелева start Ќова€ верси€

function MyRoundTo(const AValue: extended; const ADigit: TRoundToRange = -2): extended;
var
  LFactor: extended;
  FStr: string;
  F: extended;
begin
  LFactor := IntPower(10, ADigit);
  //FStr := FormatFloat('#########################0.########',abs(AValue) / LFactor + 0.5);
  FStr := FloatToStr(abs(AValue) / LFactor + 0.5);
  F := StrToFloat(FStr);
  Result := Trunc(F) * LFactor;
  if AValue < 0 then Result := -Result;
end;

function MyTruncTo(const AValue: extended; const ADigit: TRoundToRange = -2): extended;
var
  LFactor: extended;
begin
  LFactor := IntPower(10, ADigit);
  //Result := Trunc(StrToFloat(FormatFloat('#########################0.########',abs(AValue) / LFactor)) ) * LFactor;
  Result := Trunc(StrToFloat(FloatToStr(abs(AValue) / LFactor))) * LFactor;
  if AValue < 0 then Result := -Result;
end;
// 24.11.2003 Bolkonskiy A.V. end

{function Int17ToStr(const Source: Integer): string;
var
  J, I, Mn, K: integer;
  Res: String;
begin
  Res:= '';
  I:= Source;
  J := I;
  Mn:= 0;
  repeat
    J:= J div 4;
    inc(Mn);
  until J<=2;

  while true do
  begin
    K := Trunc(Power(4, mn));
    J:= I div K;
    Res:= Res+copy(ABase,J+1,1);
    if Mn<= 0 then
      Break
    else
      I:= I - (J*K);
    Dec(mn);
  end;
  for i:=1 to 4 do
  begin
   J := random(4);
   K := random(Length(Res));
   insert(inttostr(J), Res, K);
  end;
  Result := Res;
end;

function StrToInt17(const Source: string): Integer;
var
  J, I, K: integer;
  S: String;
begin
  S:= '';
  for I:=1 to Length(Source) do
    if pos(Source[I], ABase) > 0 then
      S:=S+Source[I];

  J := 0;
  Result:= 0;
  for i:=Length(S) downto 1 do
  begin
    K := pos(S[i],ABase) - 1;
    Result := Result + Trunc(Power(4, J))*K;
    inc(J);
  end;
end;
}
{function InList(aValue: integer; const aSet: array of integer): boolean;
var i: integer;
begin
  result:=false;
  for i:= low(aSet)  to high(aSet) do
    if aValue = aSet[i] then begin
       result:=true;
       exit;
    end;
end;}
//»зменени€ в данных процедурах необходимо производить параллельно, пока процедура двойник не будет удалена.

function InList(aValue: int64; const aSet: array of int64): boolean;
var
  i: integer;
begin
  result := false;
  for i := low(aSet) to high(aSet) do
    if aValue = aSet[i] then
    begin
      result := true;
      exit;
    end;
end;

function ConvertToVariant(const Value: TVarRec): Variant;
begin
  with Value do
    case VType of
      vtInteger: Result := VInteger;
      vtInt64: Result := VariantToVariant64(VInt64^);
      vtBoolean: Result := VBoolean;
      vtChar: Result := VChar;
      vtExtended: Result := VExtended^;
      {$IFNDEF VER150}
      vtUnicodeString: Result := WideString(VPWideChar);
      {$ELSE}
      vtString: Result := VString^;
      {$ENDIF}
      vtPChar: Result := VPChar^;
      vtAnsiString: Result := string(VAnsiString);
      vtCurrency: Result := VCurrency^;
      vtVariant: if not VarIsClear(VVariant^) then
          Result := VVariant^;
    else
      raise Exception.Create('Ќеподдерживаемый вариантный тип');
    end;
end;

function RowToStrings(DataSet: TDataSet): TStrings;
var
  i: Integer;
begin
  result := TStringList.Create;
  for i := 0 to DataSet.Fields.Count - 1 do
  begin
    Result.Add(DataSet.Fields[i].FieldName + '=' + DataSet.Fields[i].AsString);
  end;
end;

function RowToParams(DataSet: TDataSet): Tparams;
begin
  Result := TParams.Create;
  RowToParams(DataSet, Result);
end;

procedure RowToParams(DataSet: TDataSet; Params: TParams);
var
  i, k: Integer;
  FieldName: string;
  Param: TParam;
begin
  for k := 0 to DataSet.FieldCount - 1 do
  begin
    FieldName := UpperCase(DataSet.Fields[k].FieldName);
    Param := Params.FindParam(FieldName);
    if Param <> nil then
      Param.Value := DataSet.Fields[k].Value
    else
    begin
      with Params.CreateParam(DataSet.Fields[k].DataType, FieldName, ptInput) do
        value := DataSet.Fields[k].Value;
    end;
  end;
end;

function LargeIntegerToString(Value: TLargeIntegerField): string;
begin
  Result := IntToStr(Value);
end;

function VariantAsInt64ToString(Value: Variant): string;
var
  vInt: int64;
begin
  vInt := VariantToLargeInteger(Value);
  Result := IntToStr(vInt);
end;

function LargeIntegerToVarParam(Value: TLargeIntegerField): Variant;
begin
  Result := Value;
  Result := VarAsType(Result, varDouble);
end;

function VariantToLargeInteger(Value: Variant): TLargeIntegerField;
begin
  if VarIsEmpty(Value) or VarIsClear(Value) or VarIsNull(Value) then
    Result := 0
  else
    Result := Value;
end;

function VariantToVariant64(Value: Variant): Variant;
var
  vInt64: TLargeIntegerField;
begin
  vInt64 := VariantToLargeInteger(Value);
  Result := LargeIntegerToVarParam(vInt64);
end;

function StrAsInt64ToVariant(Value: string): Variant;
var
  vInt64: TLargeIntegerField;
begin
  vInt64 := StrToInt64Def(Value, 0);
  Result := LargeIntegerToVarParam(vInt64);
end;

function IntToString(Value: LongInt): string;
var
  dig: array[1..6] of integer;
  i: integer;
  t: string;
begin
  Result := '';
  t := 'тыс€ч ';
  if Value > 999999 then
  begin
    Result := '******';
    exit;
  end;
  for i := 1 to 6 do
  begin
    dig[i] := Value mod 10;
    Value := Value div 10;
  end;
  case dig[6] of
    1: Result := Result + 'сто ';
    2: Result := Result + 'двести ';
    3: Result := Result + 'триста ';
    4: Result := Result + 'четыреста ';
    5: Result := Result + 'п€тьсот ';
    6: Result := Result + 'шестьсот ';
    7: Result := Result + 'семьсот ';
    8: Result := Result + 'восемьсот ';
    9: Result := Result + 'дев€тьсот ';
  end;
  case dig[5] of
    1:
      begin
        case dig[4] of
          0: Result := Result + 'дес€ть ';
          1: Result := Result + 'одинадцать ';
          2: Result := Result + 'двенадцать ';
          3: Result := Result + 'тринадцать ';
          4: Result := Result + 'четырнадцать ';
          5: Result := Result + 'п€тнадцать ';
          6: Result := Result + 'шестнадцать ';
          7: Result := Result + 'семнадцать ';
          8: Result := Result + 'восемнадцать ';
          9: Result := Result + 'дев€тнадцать ';
        end;
      end;
    2: Result := Result + 'двадцать ';
    3: Result := Result + 'тридцать ';
    4: Result := Result + 'сорок ';
    5: Result := Result + 'п€тьдес€т ';
    6: Result := Result + 'шестьдес€т ';
    7: Result := Result + 'семьдес€т ';
    8: Result := Result + 'восемьдес€т ';
    9: Result := Result + 'дев€носто ';
  end;
  if dig[5] <> 1 then
    case dig[4] of
      1:
        begin
          Result := Result + 'одна ';
          t := 'тыс€ча ';
        end;
      2:
        begin
          Result := Result + 'две ';
          t := 'тыс€чи ';
        end;
      3:
        begin
          Result := Result + 'три ';
          t := 'тыс€чи ';
        end;
      4:
        begin
          Result := Result + 'четыре ';
          t := 'тыс€чи ';
        end;
      5: Result := Result + 'п€ть ';
      6: Result := Result + 'шесть ';
      7: Result := Result + 'семь ';
      8: Result := Result + 'восемь ';
      9: Result := Result + 'дев€ть ';
    end;
  if dig[6] + dig[5] + dig[4] > 0 then Result := Result + t;
  //********************
  case dig[3] of
    1: Result := Result + 'сто ';
    2: Result := Result + 'двести ';
    3: Result := Result + 'триста ';
    4: Result := Result + 'четыреста ';
    5: Result := Result + 'п€тьсот ';
    6: Result := Result + 'шестьсот ';
    7: Result := Result + 'семьсот ';
    8: Result := Result + 'восемьсот ';
    9: Result := Result + 'дев€тьсот ';
  end;
  case dig[2] of
    1:
      begin
        case dig[1] of
          0: Result := Result + 'дес€ть ';
          1: Result := Result + 'одинадцать ';
          2: Result := Result + 'двенадцать ';
          3: Result := Result + 'тринадцать ';
          4: Result := Result + 'четырнадцать ';
          5: Result := Result + 'п€тнадцать ';
          6: Result := Result + 'шестнадцать ';
          7: Result := Result + 'семнадцать ';
          8: Result := Result + 'восемнадцать ';
          9: Result := Result + 'дев€тнадцать ';
        end;
      end;
    2: Result := Result + 'двадцать ';
    3: Result := Result + 'тридцать ';
    4: Result := Result + 'сорок ';
    5: Result := Result + 'п€тьдес€т ';
    6: Result := Result + 'шестьдес€т ';
    7: Result := Result + 'семьдес€т ';
    8: Result := Result + 'восемьдес€т ';
    9: Result := Result + 'дев€носто ';
  end;
  if dig[2] <> 1 then
    case dig[1] of
      1: Result := Result + 'одна ';
      2: Result := Result + 'две ';
      3: Result := Result + 'три ';
      4: Result := Result + 'четыре ';
      5: Result := Result + 'п€ть ';
      6: Result := Result + 'шесть ';
      7: Result := Result + 'семь ';
      8: Result := Result + 'восемь ';
      9: Result := Result + 'дев€ть ';
    end;
  Result := AnsiUpperCase(Copy(Result, 1, 1)) + Copy(Result, 2, 255);
end;

function IntToStringUkr(Value: LongInt): string;
var
  dig: array[1..6] of integer;
  i: integer;
  t: string;
begin
  Result := '';
  if Value = 0 then Result := 'ноль';
  t := 'тис€ч ';
  if Value > 999999 then
  begin
    Result := '******';
    exit;
  end;
  for i := 1 to 6 do
  begin
    dig[i] := Value mod 10;
    Value := Value div 10;
  end;
  case dig[6] of
    1: Result := Result + 'сто ';
    2: Result := Result + 'дв≥ст≥ ';
    3: Result := Result + 'триста ';
    4: Result := Result + 'чотириста ';
    5: Result := Result + 'п`€тсот ';
    6: Result := Result + 'ш≥стьсот ';
    7: Result := Result + 'с≥мсот ';
    8: Result := Result + 'в≥с≥мсот ';
    9: Result := Result + 'дев`€тсот ';
  end;
  case dig[5] of
    1:
      begin
        case dig[4] of
          0: Result := Result + 'дес€ть ';
          1: Result := Result + 'одинадц€ть ';
          2: Result := Result + 'дванадц€ть ';
          3: Result := Result + 'тринадц€ть ';
          4: Result := Result + 'чотирнадц€ть ';
          5: Result := Result + 'п`€тнадц€ть ';
          6: Result := Result + 'ш≥стнадц€ть ';
          7: Result := Result + 'с≥мнадц€ть ';
          8: Result := Result + 'в≥с≥мнадц€ть ';
          9: Result := Result + 'дев`€тнадц€ть ';
        end;
      end;
    2: Result := Result + 'двадц€ть ';
    3: Result := Result + 'тридц€ть ';
    4: Result := Result + 'сорок ';
    5: Result := Result + 'п`€тдес€т ';
    6: Result := Result + 'ш≥стьдес€т ';
    7: Result := Result + 'с≥мдес€т ';
    8: Result := Result + 'в≥с≥мдес€т ';
    9: Result := Result + 'дев`€носто ';
  end;
  if dig[5] <> 1 then
    case dig[4] of
      1:
        begin
          Result := Result + 'одна ';
          t := 'тис€ча ';
        end;
      2:
        begin
          Result := Result + 'дв≥ ';
          t := 'тис€ч≥ ';
        end;
      3:
        begin
          Result := Result + 'три ';
          t := 'тис€ч≥ ';
        end;
      4:
        begin
          Result := Result + 'чотири ';
          t := 'тис€ч≥ ';
        end;
      5: Result := Result + 'п`€ть ';
      6: Result := Result + 'ш≥сть ';
      7: Result := Result + 'с≥м ';
      8: Result := Result + 'в≥с≥м ';
      9: Result := Result + 'дев`€ть ';
    end;
  if dig[6] + dig[5] + dig[4] > 0 then Result := Result + t;
  //********************
  case dig[3] of
    1: Result := Result + 'сто ';
    2: Result := Result + 'дв≥ст≥ ';
    3: Result := Result + 'триста ';
    4: Result := Result + 'чотириста ';
    5: Result := Result + 'п€`тьсот ';
    6: Result := Result + 'ш≥стьсот ';
    7: Result := Result + 'с≥мсот ';
    8: Result := Result + 'в≥с≥мсот ';
    9: Result := Result + 'дев`€тьсот ';
  end;
  case dig[2] of
    1:
      begin
        case dig[1] of
          0: Result := Result + 'дес€ть ';
          1: Result := Result + 'одинадц€ть ';
          2: Result := Result + 'дванадц€ть ';
          3: Result := Result + 'тринадц€ть ';
          4: Result := Result + 'чотирнадц€ть ';
          5: Result := Result + 'п`€тнадц€ть ';
          6: Result := Result + 'ш≥стнадц€ть ';
          7: Result := Result + 'с≥мнадц€ть ';
          8: Result := Result + 'в≥с≥мнадц€ть ';
          9: Result := Result + 'дев`€тнадц€ть ';
        end;
      end;
    2: Result := Result + 'двадц€ть ';
    3: Result := Result + 'тридц€ть ';
    4: Result := Result + 'сорок ';
    5: Result := Result + 'п`€тдес€т ';
    6: Result := Result + 'ш≥стдес€т ';
    7: Result := Result + 'с≥мдес€т ';
    8: Result := Result + 'в≥с≥мдес€т ';
    9: Result := Result + 'дев`€носто ';
  end;
  if dig[2] <> 1 then
    case dig[1] of
      1: Result := Result + 'одна ';
      2: Result := Result + 'дв≥ ';
      3: Result := Result + 'три ';
      4: Result := Result + 'чотири ';
      5: Result := Result + 'п`€ть ';
      6: Result := Result + 'ш≥сть ';
      7: Result := Result + 'с≥м ';
      8: Result := Result + 'в≥с≥м ';
      9: Result := Result + 'дев`€ть ';
    end;
  Result := AnsiUpperCase(Copy(Result, 1, 1)) + Copy(Result, 2, 255);
end;

procedure ParamsToDataSet(Params: Tparams; var DataSet: TDataSet);
var
  i, k: Integer;
  ParamName, FieldName: string;
  Field: TField;
begin
  for i := 0 to Params.Count - 1 do
  begin
    ParamName := UpperCase(Params[i].Name);
    Field := DataSet.FindField(ParamName);
    FieldName := UpperCase(DataSet.Fields[k].FieldName);
    if Field <> nil then Field.Value := Params[i].Value;
  end;
end;

procedure DataSetToParams(DataSet: TDataSet; var Params: TParams);
var
  i, k: Integer;
  FieldName: string;
  Param: TParam;
begin
  for k := 0 to DataSet.FieldCount - 1 do
  begin
    FieldName := UpperCase(DataSet.Fields[k].FieldName);
    Param := Params.FindParam(FieldName);
    if Param <> nil then
      Param.Value := DataSet.Fields[k].Value
    else
    begin
      with Params.CreateParam(DataSet.Fields[k].DataType, FieldName, ptInput) do
        value := DataSet.Fields[k].Value;
    end;
  end;
end;

function IntToStringUkrKg(Value: LongInt): string;
var
  dig: array[1..6] of integer;
  i: integer;
  t: string;
begin
  Result := '';
  if Value = 0 then Result := 'ноль';
  t := 'тис€ч ';
  if Value > 999999 then
  begin
    Result := '******';
    exit;
  end;
  for i := 1 to 6 do
  begin
    dig[i] := Value mod 10;
    Value := Value div 10;
  end;
  case dig[6] of
    1: Result := Result + 'сто ';
    2: Result := Result + 'дв≥ст≥ ';
    3: Result := Result + 'триста ';
    4: Result := Result + 'чотириста ';
    5: Result := Result + 'п`€тсот ';
    6: Result := Result + 'ш≥стьсот ';
    7: Result := Result + 'с≥мсот ';
    8: Result := Result + 'в≥с≥мсот ';
    9: Result := Result + 'дев`€тсот ';
  end;
  case dig[5] of
    1:
      begin
        case dig[4] of
          0: Result := Result + 'дес€ть ';
          1: Result := Result + 'одинадц€ть ';
          2: Result := Result + 'дванадц€ть ';
          3: Result := Result + 'тринадц€ть ';
          4: Result := Result + 'чотирнадц€ть ';
          5: Result := Result + 'п`€тнадц€ть ';
          6: Result := Result + 'ш≥стнадц€ть ';
          7: Result := Result + 'с≥мнадц€ть ';
          8: Result := Result + 'в≥с≥мнадц€ть ';
          9: Result := Result + 'дев`€тнадц€ть ';
        end;
      end;
    2: Result := Result + 'двадц€ть ';
    3: Result := Result + 'тридц€ть ';
    4: Result := Result + 'сорок ';
    5: Result := Result + 'п`€тдес€т ';
    6: Result := Result + 'ш≥стьдес€т ';
    7: Result := Result + 'с≥мдес€т ';
    8: Result := Result + 'в≥с≥мдес€т ';
    9: Result := Result + 'дев`€носто ';
  end;
  if dig[5] <> 1 then
    case dig[4] of
      1:
        begin
          Result := Result + 'одна ';
          t := 'тис€ча ';
        end;
      2:
        begin
          Result := Result + 'дв≥ ';
          t := 'тис€ч≥ ';
        end;
      3:
        begin
          Result := Result + 'три ';
          t := 'тис€ч≥ ';
        end;
      4:
        begin
          Result := Result + 'чотири ';
          t := 'тис€ч≥ ';
        end;
      5: Result := Result + 'п`€ть ';
      6: Result := Result + 'ш≥сть ';
      7: Result := Result + 'с≥м ';
      8: Result := Result + 'в≥с≥м ';
      9: Result := Result + 'дев`€ть ';
    end;
  if dig[6] + dig[5] + dig[4] > 0 then Result := Result + t;
  //********************
  case dig[3] of
    1: Result := Result + 'сто ';
    2: Result := Result + 'дв≥ст≥ ';
    3: Result := Result + 'триста ';
    4: Result := Result + 'чотириста ';
    5: Result := Result + 'п€`тьсот ';
    6: Result := Result + 'ш≥стьсот ';
    7: Result := Result + 'с≥мсот ';
    8: Result := Result + 'в≥с≥мсот ';
    9: Result := Result + 'дев`€тьсот ';
  end;
  case dig[2] of
    1:
      begin
        case dig[1] of
          0: Result := Result + 'дес€ть ';
          1: Result := Result + 'одинадц€ть ';
          2: Result := Result + 'дванадц€ть ';
          3: Result := Result + 'тринадц€ть ';
          4: Result := Result + 'чотирнадц€ть ';
          5: Result := Result + 'п`€тнадц€ть ';
          6: Result := Result + 'ш≥стнадц€ть ';
          7: Result := Result + 'с≥мнадц€ть ';
          8: Result := Result + 'в≥с≥мнадц€ть ';
          9: Result := Result + 'дев`€тнадц€ть ';
        end;
      end;
    2: Result := Result + 'двадц€ть ';
    3: Result := Result + 'тридц€ть ';
    4: Result := Result + 'сорок ';
    5: Result := Result + 'п`€тдес€т ';
    6: Result := Result + 'ш≥стдес€т ';
    7: Result := Result + 'с≥мдес€т ';
    8: Result := Result + 'в≥с≥мдес€т ';
    9: Result := Result + 'дев`€носто ';
  end;
  if dig[2] <> 1 then
    case dig[1] of
      1: Result := Result + 'один ';
      2: Result := Result + 'два ';
      3: Result := Result + 'три ';
      4: Result := Result + 'чотири ';
      5: Result := Result + 'п`€ть ';
      6: Result := Result + 'ш≥сть ';
      7: Result := Result + 'с≥м ';
      8: Result := Result + 'в≥с≥м ';
      9: Result := Result + 'дев`€ть ';
    end;
  Result := AnsiUpperCase(Copy(Result, 1, 1)) + Copy(Result, 2, 255);
end;

function MonthToString(Value: integer; RodPad: boolean): string;
begin
  Result := '';
  if RodPad then
    case Value of
      1: Result := '€нвар€';
      2: Result := 'феврал€';
      3: Result := 'марта';
      4: Result := 'апрел€';
      5: Result := 'ма€';
      6: Result := 'июн€';
      7: Result := 'июл€';
      8: Result := 'августа';
      9: Result := 'сент€бр€';
      10: Result := 'окт€бр€';
      11: Result := 'но€бр€';
      12: Result := 'декабр€';
    end
  else
    case Value of
      1: Result := '€нварь';
      2: Result := 'февраль';
      3: Result := 'март';
      4: Result := 'апрель';
      5: Result := 'май';
      6: Result := 'июнь';
      7: Result := 'июль';
      8: Result := 'август';
      9: Result := 'сент€брь';
      10: Result := 'окт€брь';
      11: Result := 'но€брь';
      12: Result := 'декабрь';
    end;
end;

function MonthToStringUkr(Value: integer; RodPad: boolean): string;
begin
  Result := '';
  if RodPad then
    case Value of
      1: Result := 'с≥чн€';
      2: Result := 'лютого';
      3: Result := 'березн€';
      4: Result := 'кв≥тн€';
      5: Result := 'травн€';
      6: Result := 'червн€';
      7: Result := 'липн€';
      8: Result := 'серпн€';
      9: Result := 'вересн€';
      10: Result := 'жовтн€';
      11: Result := 'листопада';
      12: Result := 'грудн€';
    end
  else
    case Value of
      1: Result := 'с≥чень';
      2: Result := 'лютий';
      3: Result := 'березень';
      4: Result := 'кв≥тень';
      5: Result := 'травень';
      6: Result := 'червень';
      7: Result := 'липень';
      8: Result := 'серпень';
      9: Result := 'вересень';
      10: Result := 'жовтень';
      11: Result := 'листопад';
      12: Result := 'грудень';
    end;
end;



end.

