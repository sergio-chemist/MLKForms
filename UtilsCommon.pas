unit UtilsCommon;

interface
uses
  Windows, Variants, Classes, DB, ShellAPI, Graphics, SysUtils, UtilsClasses;

procedure SetParamValue(Params: TParams; ParamName: string; ParValue: Variant);
function GetParamValue( var Params: TParams; ParamName: string; VarType: TVarType;
                        NotFoundValue: Variant): Variant;
procedure IniSectionToParams(IniFile: string; IniSection: string; var Params: TParams);
procedure GetIPInfo(var aHostName: string; var aIPAddress: string);
procedure SetControlProp(var Component: TComponent; PropName: string; Value: Variant);
function CreateComponentByClassName(ClassName: string; MultiCopy: Boolean): TComponent;
function GetFrameOrFormOwnerByObject(Sender: TObject): TComponent;
function GetTextWidth(Str: string; Font: TFont): Integer;

implementation
uses //Classes, IniFiles;
  Math, Winsock, TypInfo, Controls, RTLConsts, SysConst, IniFiles,
  Dialogs, Forms, ImageHlp;

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

procedure SetParamValue(Params: TParams; ParamName: string; ParValue: Variant);
var
  Param: TParam;
  FieldType: TFieldType;
begin
  if not (Assigned(Params)) or (ParamName = '') then Exit;
  Param := Params.FindParam(ParamName);
  if Param = nil then
  begin
    with TVarData(ParValue) do
      case VType of
        varDate: FieldType := ftDateTime;
        varInteger: FieldType := ftInteger;
        varInt64: FieldType := ftLargeint;
        varBoolean: FieldType := ftBoolean;
        varDouble, varSingle: FieldType := ftFloat;
        varString: FieldType := ftString;
        varCurrency: FieldType := ftCurrency;
      else
        FieldType := ftVariant;
      end;
    Param := Params.CreateParam(FieldType, ParamName, ptInput);
  end;
  with Param do
    case DataType of
      ftInteger, ftSmallint: AsInteger := ParValue;
      ftLargeint: Value := VariantToVariant64(ParValue);
      ftBoolean: AsBoolean := ParValue;
      ftFloat, ftCurrency: Value := ParValue;
      ftString: AsString := VarToStr(ParValue);
    else
      Value := ParValue;
    end;
end;

function GetVariantValue(Value: Variant; VarType: TVarType): Variant;
begin
  case VarType of
    varInteger: Result := Integer(Value);
    varInt64: Result := VariantToLargeInteger(Value);
    varBoolean: Result := Value;
    varDouble, varSingle: Result := Value;
    varString: Result := Value;
    varCurrency: Result := Value.AsCurrency;
  else
    Result := Value;
  end;
end;

function GetParamValue(var Params: TParams; ParamName: string; VarType: TVarType; NotFoundValue:
  Variant): Variant;
var
  Param: TParam;
begin
  Param := Params.FindParam(ParamName);
  if Param <> nil then
    result := GetVariantValue(Param.Value, VarType)
  else
    Result := GetVariantValue(NotFoundValue, VarType);
end;

procedure IniSectionToParams(IniFile: string; IniSection: string; var Params: TParams);
var
  i: Integer;
  PropList: TStrings;
  Ini: TIniFile;
  lParams: TParam;
  lParamName: string;
begin
  PropList := TStringList.Create;
  Ini := TIniFile.Create(IniFile);
  try
    Ini.ReadSectionValues(IniSection, PropList);
    for i := 0 to PropList.Count - 1 do
    begin
      lParamName := PropList.Names[i];
      SetParamValue(Params, lParamName, PropList.Values[lParamName]);
    end;
  finally
    PropList.Free;
    Ini.Free;
  end;
end;

procedure GetIPInfo(var aHostName: string; var aIPAddress: string);
var
  wVerReq: WORD;
  wsaData: TWSAData;
  i: PAnsiChar;
  h: PHostEnt;
  c: array[0..128] of char;
begin
  wVerReq := MAKEWORD(1, 1);
  WSAStartup(wVerReq, wsaData);
  {Получаем хост (имя) компа}
  GetHostName(@c, 128);
  h := GetHostByName(@c);
  aHostName := h^.h_Name; //aHostName отображает хост(имя) компьютера
  {Достаем IP}
  i := iNet_ntoa(PInAddr(h^.h_addr_list^)^);
  aIPAddress := i; //Теперь aIPAddress отображает IP-адрес
  WSACleanup;
end;

procedure SetControlProp(var Component: TComponent; PropName: string; Value: Variant);
var
  PropInfo: PPropInfo;
begin
  PropInfo := GetPropInfo(Component, 'ReadOnly');
  if PropInfo <> nil then SetPropValue(Component, PropName, Value);
end;

function CreateComponentByClassName(ClassName: string; MultiCopy: Boolean): TComponent;
var
  IsFormExist: boolean;
  PClass: TComponentClass;
  i: Integer;
  MsgStr, CapStr: string;
begin
  IsFormExist := false; Result := nil;
  for i := 0 to Application.ComponentCount - 1 do
    if Application.Components[i].ClassNameIs(ClassName) then
    begin
      IsFormExist := true;
      Result := Application.Components[i];
      Break;
    end;
  if MultiCopy or not IsFormExist or (Result = nil) then
  begin
    PClass := TComponentClass(GetClass(ClassName));
    if PClass = nil then
    begin
      Result := nil;
      CapStr := 'Ошибка регистрации класса!';
      MsgStr := 'Класс ' + ClassName
        + ' не зарегистрирован. Необходимо в секции initialization '
        + ' указать RegisterClass(' + ClassName + ');';
      MessageBox(0, PChar(MsgStr), PChar(CapStr), MB_ICONERROR or MB_OK);
      Exit;
    end
    else
    if PClass.InheritsFrom(TForm) or PClass.InheritsFrom(TDataModule) then
      Application.CreateForm(PClass, Result);
  end;
  if Result = nil then
  begin
    CapStr := 'Ошибка создания класса!';
    MsgStr := 'Класс ' + ClassName + ' не создан';
    MessageBox(0, PChar(MsgStr), PChar(CapStr), MB_ICONERROR or MB_OK);
  end
end;

function GetFrameOrFormOwnerByObject(Sender: TObject): TComponent;
var
  ClassName: string;
begin
  Result := TComponent(Sender).Owner;
  while not ((Result is TFrame) or (Result is TForm) or (Result is TApplication)) do
  begin
    Result := TComponent(Result).Owner;
  end;
  ClassName := Result.ClassName;
  if not ((Result is TFrame) or (Result is TForm)) then
  begin
    Result := nil;
  end;
end;

function GetTextWidth(Str: string; Font: TFont): Integer;
var
  Canvas: TCanvas;
begin
  Canvas := TCanvas.Create;
  try
    Canvas.Handle := GetDC(0);
    Canvas.Font := Font;
    Result := Canvas.TextWidth(Str);
  finally
    Canvas.Free;
  end;
end;

end.
