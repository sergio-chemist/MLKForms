unit UtilsDataConvert;

interface

uses
  Classes, DB, UtilsClasses;

const
  ABase = '95748';

type
  TRoundToRange = -37..37;


  //------------------------------------------------------------------------------
  // StrToOem - ��������� ������ � OEM ���������
  //------------------------------------------------------------------------------
function StrToOem(const AnsiStr: AnsiString): AnsiString;
//------------------------------------------------------------------------------
// StrToBPrn - ��������� ������ � OEM ��������� � �������� ������� ������� ��
//             ��������� (��� ���������� �� �������� �����-�����)
//------------------------------------------------------------------------------
function StrToBPrn(const AnsiStr: AnsiString): AnsiString;

function ConvertToVariant(const Value: TVarRec): Variant;
function RowToParams(DataSet: TDataSet): Tparams; overload;
procedure RowToParams(DataSet: TDataSet; Params: TParams); overload;
function RowToStrings(DataSet: TDataSet): TStrings;
function LargeIntegerToString(Value: TLargeIntegerField): string; // int64 -> String
function VariantAsInt64ToString(Value: Variant): string; // Variant -> String � ������������� ��������� � int64
function LargeIntegerToVarParam(Value: TLargeIntegerField): Variant; // int64 -> Variant as varDouble
function VariantToLargeInteger(Value: Variant): TLargeIntegerField;
function VariantToVariant64(Value: Variant): Variant; // Variant -> Variant ����� int64
function StrAsInt64ToVariant(Value: string): Variant; // String (��� int64) -> variant
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
    raise Exception.Create('������ �������� ���������� ����� ' + Trim(AnsiString(PChar(TempFileName))));
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
  if c <> 0 then raise Exception.Create('������ ������������� ����� ' + FileName + '. ���������� � �������������.');
end;

// 24.11.2003 Bolkonskiy A.V. ������� �������� start ����� ������

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
//��������� � ������ ���������� ���������� ����������� �����������, ���� ��������� ������� �� ����� �������.

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
      raise Exception.Create('���������������� ���������� ���');
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
  t := '����� ';
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
    1: Result := Result + '��� ';
    2: Result := Result + '������ ';
    3: Result := Result + '������ ';
    4: Result := Result + '��������� ';
    5: Result := Result + '������� ';
    6: Result := Result + '�������� ';
    7: Result := Result + '������� ';
    8: Result := Result + '��������� ';
    9: Result := Result + '��������� ';
  end;
  case dig[5] of
    1:
      begin
        case dig[4] of
          0: Result := Result + '������ ';
          1: Result := Result + '���������� ';
          2: Result := Result + '���������� ';
          3: Result := Result + '���������� ';
          4: Result := Result + '������������ ';
          5: Result := Result + '���������� ';
          6: Result := Result + '����������� ';
          7: Result := Result + '���������� ';
          8: Result := Result + '������������ ';
          9: Result := Result + '������������ ';
        end;
      end;
    2: Result := Result + '�������� ';
    3: Result := Result + '�������� ';
    4: Result := Result + '����� ';
    5: Result := Result + '��������� ';
    6: Result := Result + '���������� ';
    7: Result := Result + '��������� ';
    8: Result := Result + '����������� ';
    9: Result := Result + '��������� ';
  end;
  if dig[5] <> 1 then
    case dig[4] of
      1:
        begin
          Result := Result + '���� ';
          t := '������ ';
        end;
      2:
        begin
          Result := Result + '��� ';
          t := '������ ';
        end;
      3:
        begin
          Result := Result + '��� ';
          t := '������ ';
        end;
      4:
        begin
          Result := Result + '������ ';
          t := '������ ';
        end;
      5: Result := Result + '���� ';
      6: Result := Result + '����� ';
      7: Result := Result + '���� ';
      8: Result := Result + '������ ';
      9: Result := Result + '������ ';
    end;
  if dig[6] + dig[5] + dig[4] > 0 then Result := Result + t;
  //********************
  case dig[3] of
    1: Result := Result + '��� ';
    2: Result := Result + '������ ';
    3: Result := Result + '������ ';
    4: Result := Result + '��������� ';
    5: Result := Result + '������� ';
    6: Result := Result + '�������� ';
    7: Result := Result + '������� ';
    8: Result := Result + '��������� ';
    9: Result := Result + '��������� ';
  end;
  case dig[2] of
    1:
      begin
        case dig[1] of
          0: Result := Result + '������ ';
          1: Result := Result + '���������� ';
          2: Result := Result + '���������� ';
          3: Result := Result + '���������� ';
          4: Result := Result + '������������ ';
          5: Result := Result + '���������� ';
          6: Result := Result + '����������� ';
          7: Result := Result + '���������� ';
          8: Result := Result + '������������ ';
          9: Result := Result + '������������ ';
        end;
      end;
    2: Result := Result + '�������� ';
    3: Result := Result + '�������� ';
    4: Result := Result + '����� ';
    5: Result := Result + '��������� ';
    6: Result := Result + '���������� ';
    7: Result := Result + '��������� ';
    8: Result := Result + '����������� ';
    9: Result := Result + '��������� ';
  end;
  if dig[2] <> 1 then
    case dig[1] of
      1: Result := Result + '���� ';
      2: Result := Result + '��� ';
      3: Result := Result + '��� ';
      4: Result := Result + '������ ';
      5: Result := Result + '���� ';
      6: Result := Result + '����� ';
      7: Result := Result + '���� ';
      8: Result := Result + '������ ';
      9: Result := Result + '������ ';
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
  if Value = 0 then Result := '����';
  t := '����� ';
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
    1: Result := Result + '��� ';
    2: Result := Result + '���� ';
    3: Result := Result + '������ ';
    4: Result := Result + '��������� ';
    5: Result := Result + '�`����� ';
    6: Result := Result + '�������� ';
    7: Result := Result + '����� ';
    8: Result := Result + '������ ';
    9: Result := Result + '���`����� ';
  end;
  case dig[5] of
    1:
      begin
        case dig[4] of
          0: Result := Result + '������ ';
          1: Result := Result + '���������� ';
          2: Result := Result + '���������� ';
          3: Result := Result + '���������� ';
          4: Result := Result + '������������ ';
          5: Result := Result + '�`��������� ';
          6: Result := Result + '����������� ';
          7: Result := Result + '��������� ';
          8: Result := Result + '���������� ';
          9: Result := Result + '���`��������� ';
        end;
      end;
    2: Result := Result + '�������� ';
    3: Result := Result + '�������� ';
    4: Result := Result + '����� ';
    5: Result := Result + '�`������� ';
    6: Result := Result + '���������� ';
    7: Result := Result + '������� ';
    8: Result := Result + '�������� ';
    9: Result := Result + '���`������ ';
  end;
  if dig[5] <> 1 then
    case dig[4] of
      1:
        begin
          Result := Result + '���� ';
          t := '������ ';
        end;
      2:
        begin
          Result := Result + '�� ';
          t := '������ ';
        end;
      3:
        begin
          Result := Result + '��� ';
          t := '������ ';
        end;
      4:
        begin
          Result := Result + '������ ';
          t := '������ ';
        end;
      5: Result := Result + '�`��� ';
      6: Result := Result + '����� ';
      7: Result := Result + '�� ';
      8: Result := Result + '��� ';
      9: Result := Result + '���`��� ';
    end;
  if dig[6] + dig[5] + dig[4] > 0 then Result := Result + t;
  //********************
  case dig[3] of
    1: Result := Result + '��� ';
    2: Result := Result + '���� ';
    3: Result := Result + '������ ';
    4: Result := Result + '��������� ';
    5: Result := Result + '��`����� ';
    6: Result := Result + '�������� ';
    7: Result := Result + '����� ';
    8: Result := Result + '������ ';
    9: Result := Result + '���`������ ';
  end;
  case dig[2] of
    1:
      begin
        case dig[1] of
          0: Result := Result + '������ ';
          1: Result := Result + '���������� ';
          2: Result := Result + '���������� ';
          3: Result := Result + '���������� ';
          4: Result := Result + '������������ ';
          5: Result := Result + '�`��������� ';
          6: Result := Result + '����������� ';
          7: Result := Result + '��������� ';
          8: Result := Result + '���������� ';
          9: Result := Result + '���`��������� ';
        end;
      end;
    2: Result := Result + '�������� ';
    3: Result := Result + '�������� ';
    4: Result := Result + '����� ';
    5: Result := Result + '�`������� ';
    6: Result := Result + '��������� ';
    7: Result := Result + '������� ';
    8: Result := Result + '�������� ';
    9: Result := Result + '���`������ ';
  end;
  if dig[2] <> 1 then
    case dig[1] of
      1: Result := Result + '���� ';
      2: Result := Result + '�� ';
      3: Result := Result + '��� ';
      4: Result := Result + '������ ';
      5: Result := Result + '�`��� ';
      6: Result := Result + '����� ';
      7: Result := Result + '�� ';
      8: Result := Result + '��� ';
      9: Result := Result + '���`��� ';
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
  if Value = 0 then Result := '����';
  t := '����� ';
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
    1: Result := Result + '��� ';
    2: Result := Result + '���� ';
    3: Result := Result + '������ ';
    4: Result := Result + '��������� ';
    5: Result := Result + '�`����� ';
    6: Result := Result + '�������� ';
    7: Result := Result + '����� ';
    8: Result := Result + '������ ';
    9: Result := Result + '���`����� ';
  end;
  case dig[5] of
    1:
      begin
        case dig[4] of
          0: Result := Result + '������ ';
          1: Result := Result + '���������� ';
          2: Result := Result + '���������� ';
          3: Result := Result + '���������� ';
          4: Result := Result + '������������ ';
          5: Result := Result + '�`��������� ';
          6: Result := Result + '����������� ';
          7: Result := Result + '��������� ';
          8: Result := Result + '���������� ';
          9: Result := Result + '���`��������� ';
        end;
      end;
    2: Result := Result + '�������� ';
    3: Result := Result + '�������� ';
    4: Result := Result + '����� ';
    5: Result := Result + '�`������� ';
    6: Result := Result + '���������� ';
    7: Result := Result + '������� ';
    8: Result := Result + '�������� ';
    9: Result := Result + '���`������ ';
  end;
  if dig[5] <> 1 then
    case dig[4] of
      1:
        begin
          Result := Result + '���� ';
          t := '������ ';
        end;
      2:
        begin
          Result := Result + '�� ';
          t := '������ ';
        end;
      3:
        begin
          Result := Result + '��� ';
          t := '������ ';
        end;
      4:
        begin
          Result := Result + '������ ';
          t := '������ ';
        end;
      5: Result := Result + '�`��� ';
      6: Result := Result + '����� ';
      7: Result := Result + '�� ';
      8: Result := Result + '��� ';
      9: Result := Result + '���`��� ';
    end;
  if dig[6] + dig[5] + dig[4] > 0 then Result := Result + t;
  //********************
  case dig[3] of
    1: Result := Result + '��� ';
    2: Result := Result + '���� ';
    3: Result := Result + '������ ';
    4: Result := Result + '��������� ';
    5: Result := Result + '��`����� ';
    6: Result := Result + '�������� ';
    7: Result := Result + '����� ';
    8: Result := Result + '������ ';
    9: Result := Result + '���`������ ';
  end;
  case dig[2] of
    1:
      begin
        case dig[1] of
          0: Result := Result + '������ ';
          1: Result := Result + '���������� ';
          2: Result := Result + '���������� ';
          3: Result := Result + '���������� ';
          4: Result := Result + '������������ ';
          5: Result := Result + '�`��������� ';
          6: Result := Result + '����������� ';
          7: Result := Result + '��������� ';
          8: Result := Result + '���������� ';
          9: Result := Result + '���`��������� ';
        end;
      end;
    2: Result := Result + '�������� ';
    3: Result := Result + '�������� ';
    4: Result := Result + '����� ';
    5: Result := Result + '�`������� ';
    6: Result := Result + '��������� ';
    7: Result := Result + '������� ';
    8: Result := Result + '�������� ';
    9: Result := Result + '���`������ ';
  end;
  if dig[2] <> 1 then
    case dig[1] of
      1: Result := Result + '���� ';
      2: Result := Result + '��� ';
      3: Result := Result + '��� ';
      4: Result := Result + '������ ';
      5: Result := Result + '�`��� ';
      6: Result := Result + '����� ';
      7: Result := Result + '�� ';
      8: Result := Result + '��� ';
      9: Result := Result + '���`��� ';
    end;
  Result := AnsiUpperCase(Copy(Result, 1, 1)) + Copy(Result, 2, 255);
end;

function MonthToString(Value: integer; RodPad: boolean): string;
begin
  Result := '';
  if RodPad then
    case Value of
      1: Result := '������';
      2: Result := '�������';
      3: Result := '�����';
      4: Result := '������';
      5: Result := '���';
      6: Result := '����';
      7: Result := '����';
      8: Result := '�������';
      9: Result := '��������';
      10: Result := '�������';
      11: Result := '������';
      12: Result := '�������';
    end
  else
    case Value of
      1: Result := '������';
      2: Result := '�������';
      3: Result := '����';
      4: Result := '������';
      5: Result := '���';
      6: Result := '����';
      7: Result := '����';
      8: Result := '������';
      9: Result := '��������';
      10: Result := '�������';
      11: Result := '������';
      12: Result := '�������';
    end;
end;

function MonthToStringUkr(Value: integer; RodPad: boolean): string;
begin
  Result := '';
  if RodPad then
    case Value of
      1: Result := '����';
      2: Result := '������';
      3: Result := '�������';
      4: Result := '�����';
      5: Result := '������';
      6: Result := '������';
      7: Result := '�����';
      8: Result := '������';
      9: Result := '�������';
      10: Result := '������';
      11: Result := '���������';
      12: Result := '������';
    end
  else
    case Value of
      1: Result := '�����';
      2: Result := '�����';
      3: Result := '��������';
      4: Result := '������';
      5: Result := '�������';
      6: Result := '�������';
      7: Result := '������';
      8: Result := '�������';
      9: Result := '��������';
      10: Result := '�������';
      11: Result := '��������';
      12: Result := '�������';
    end;
end;



end.
