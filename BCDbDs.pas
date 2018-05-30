unit BCDbDs;

interface

uses
  SysUtils, Classes, DB, BCDb, Forms;

const
  MSG_CONFIRM_DEL = 'Вы уверены что хотите удалить запись?';
  MSG_CONFIRM_CLEAR = 'Вы уверены что хотите удалить все записи';

type
  TBCDbDsDm = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    Factive: Boolean;
    Flang_id: Int64;
    procedure SetActive(const Value: Boolean);
    procedure SetLang_id(const Value: Int64);
  protected
    MainDmClassName: string;
    procedure SetConnections;
    procedure SetConnection(DataSet: TDataSet); virtual;
    procedure OnSetMainDataModule; virtual;
    procedure CustomDataSetBeforeOpen(DataSet: TDataSet); virtual;
    procedure CustomDataSetDataScroll(DataSet: TDataSet); virtual;
    procedure CustomDataSetBeforePost(DataSet: TDataSet); virtual;
  public
    MainDm: TBCDbDm;
    Params: TParams;
    ListDataSet: TStringList;
    ListLinkedForm: TStringList;
    UserID: Int64;
    SPID: Int64;
    function GetNamedSQLDataSet(
      aSQL: AnsiString = ''
      ; DataSetName: string = ''
      ; aSQLInsert: AnsiString = ''
      ; aSQLUpdate: AnsiString = ''
      ; aSQLDelete: AnsiString = ''
      ; aSQLRefresh: AnsiString = ''
      ; aSQLLock: AnsiString = ''
      ; Owner: TComponent = nil): TDataSet; virtual;
    function GetListExtendedProp(entity_type_code: string): TDataSet; virtual;
    function GetListExtendedPropVal(prop_name: string; is_default: Boolean): TDataSet; virtual;
    function GetListExtendedDictPropVal(prop_name: string): TDataSet; virtual;
    function GetListScriptDataSet(entity_type_code: string): TDataSet; virtual;
    function GetCurrentUserId: Int64; virtual;

    function GetDataSetSQL(DataSet: TDataSet): string; virtual;
    function GetDataSetParams(DataSet: TDataSet): TParams; virtual;
    procedure ExecuteDataSet(DataSet: TDataSet); virtual;

    procedure GetExtendedPropUpdateScript(Is_Dictionary: Boolean; Is_Default: Boolean; var
      SQLInsert: string; var SQLUpdate: string; var SQLDelete: string); virtual;

    procedure SetScriptTypeDataSet(var DataSet: TDataSet); virtual;
    procedure SetScriptDataSet(var DataSet: TDataSet; App_object_Name: string); overload; virtual;

    procedure OpenNamedSQLDataSet(DataSetName: string; const Args: array of const; is_exec: Boolean
      = false; is_open: Boolean = true); overload; virtual;
    procedure OpenNamedSQLDataSet(var DataSet: TDataSet; const Args: array of const; is_exec:
      Boolean = false; is_open: Boolean = true); overload; virtual;

    procedure OpenSQL(aSQL: AnsiString; DataSetName: string = 'QFO'); overload; virtual;
    procedure OpenSQL(aSQL: AnsiString; const Args: array of const; DataSetName: string = 'QFO');
      overload; virtual;
    procedure ExecSQL(aSQL: AnsiString; DataSetName: string = 'QFO'); overload; virtual;
    procedure ExecSQL(aSQL: AnsiString; const Args: array of const; DataSetName: string = 'QFO');
      overload; virtual;

    procedure DoBeforeChange(Sender: TObject; Field: TField); virtual;
    procedure DoAfterChange(Sender: TObject; Field: TField); virtual;
    procedure Open; virtual;
    procedure Close; virtual;
    procedure DisableControls; virtual;
    procedure SaveProfileData(Section: string; Data: string); virtual;
    function LoadProfileData(Section: string): string; virtual;

    property active: Boolean read Factive write SetActive;
    function CloneDataSet(DataSetFrom: TDataSet; DataSetName: string = ''): TDataSet; virtual;
    function CheckBeforePost(DataSet: TDataSet; isRaiseError: Boolean = true): string;
    property lang_id:Int64 read Flang_id write SetLang_id;
  end;

implementation

uses Windows, Controls, Dialogs, UtilsCommon, UtilsDataConvert;

{$R *.dfm}

{ TBCDbDsDm }

procedure TBCDbDsDm.SetConnections;
var
  i: Integer;
begin
  inherited;
  for i := 0 to ComponentCount - 1 do
    if Assigned(Components[i]) and (Components[i] is TDataSet)
      then SetConnection(TDataSet(Components[i]));
end;

procedure TBCDbDsDm.OnSetMainDataModule;
begin
  if MainDmClassName <> '' then
  begin
    MainDm := nil;
    MainDm := TBCDbDm(UtilsCommon.CreateComponentByClassName(MainDmClassName, false));
    if MainDm <> nil then
    begin
      SetConnections;
      SPID := MainDm.SPID;
      UserID := GetCurrentUserId;
    end;
  end;
end;

procedure TBCDbDsDm.DataModuleCreate(Sender: TObject);
begin
  ListDataSet := TStringList.Create;
  ListLinkedForm := TStringList.Create;
  OnSetMainDataModule;
  Params := TParams.Create;
end;

procedure TBCDbDsDm.DoAfterChange(Sender: TObject; Field: TField);
begin
  //
end;

procedure TBCDbDsDm.DoBeforeChange(Sender: TObject; Field: TField);
begin
  UtilsCommon.SetParamValue(Params, 'OWNER_NAME', Name);
  UtilsCommon.SetParamValue(Params, 'ENTITY_NAME', TComponent(Sender).Name);
end;

function TBCDbDsDm.GetDataSetSQL(DataSet: TDataSet): string;
begin
//virtual
end;

function TBCDbDsDm.LoadProfileData(Section: string): string;
begin
  //virtual
end;

procedure TBCDbDsDm.SaveProfileData(Section, Data: string);
begin
  //virtual
end;

procedure TBCDbDsDm.SetActive(const Value: Boolean);
begin
  if Factive = Value then Exit;
  Factive := Value;
  if Factive then
    Open
  else
    Close;
end;

procedure TBCDbDsDm.Open;
begin
//  virtual
end;

procedure TBCDbDsDm.Close;
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TDataSet then TDataSet(Components[i]).CLose;
  end;
end;

function TBCDbDsDm.GetNamedSQLDataSet(
  aSQL: AnsiString = ''
  ; DataSetName: string = ''
  ; aSQLInsert: AnsiString = ''
  ; aSQLUpdate: AnsiString = ''
  ; aSQLDelete: AnsiString = ''
  ; aSQLRefresh: AnsiString = ''
  ; aSQLLock: AnsiString = ''
  ; Owner: TComponent = nil): TDataSet;
var
  lDataSetName: string;
  c: TComponent;
  lOwner: TComponent;
  i: Integer;
begin
  result := nil;
  if Owner = nil then lOwner := Self else lOwner := Owner;
  if DataSetName <> '' then
  begin
    c := lOwner.FindComponent(DataSetName);
    if c = nil then result := nil else
    begin
      if c is TDataSet then result := TDataSet(c);
    end;
  end;
  if DataSetName = '' then lDataSetName := 'QuNamedDataSet' + IntToStr(ListDataSet.Count) else
    lDataSetName := DataSetName;
  i := ListDataSet.IndexOf(lDataSetName);
  if i = -1 then ListDataSet.Add(lDataSetName) else
  begin
    ListDataSet.Delete(i);
    ListDataSet.Add(lDataSetName);
  end;
end;

procedure TBCDbDsDm.DataModuleDestroy(Sender: TObject);
begin
  Close;
  if Assigned(ListDataSet) then ListDataSet.Free;
  if Assigned(ListLinkedForm) then ListLinkedForm.Free;
end;

procedure TBCDbDsDm.DisableControls;
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TDataSet then TDataSet(Components[i]).DisableControls;
  end;
end;

function TBCDbDsDm.GetListExtendedDictPropVal(prop_name: string): TDataSet;
var
  SQL, DataSetName, update_sql, insert_sql, delete_sql: string;
begin
  result := nil;
  SQL :=
    ' select dp.id as prop_id ' +
    '       ,dp.name as prop_name ' +
    '       ,dp.description as prop_description ' +
    '       ,dpt.name as prop_type_name ' +
    '       ,dpt.REPOSITORY_ITEM_NAME as REPOSITORY_ITEM_NAME ' +
    '       ,dt.code as data_type_code ' +
    '       ,dep.entity_id ' +
    '       ,etm.entity_type_id ' +
    '       ,lval.value_id ' +
    '       ,lval.id ' +
    '       ,lval.APPLY_CONDITION as APPLY_CONDITION ' +
    '       ,ptm.MULTIVALUED ' +
    '       ,ptm.CONTROL_LEFT ' +
    '       ,ptm.CONTROL_TOP ' +
    '       ,ptm.CONTROL_HEIGHT ' +
    '       ,ptm.CONTROL_WIDTH ' +
    '       ,ptm.CONTROL_CAPTION ' +
    '       ,val.s_value ' +
    '       ,val.data_type_id ' +
    '       ,val.n_value ' +
    '       ,val.d_value ' +
    '       ,val.c_value ' +
    '       ,val.b_value ' +
    '       ,lval.order_num ' +
    '   from l_entity_template etm ' +
    '  inner join l_prop_template ptm on ptm.prop_template_id = etm.prop_template_id ' +
    '   left outer join d_prop dp on dp.id = ptm.prop_id ' +
    '   left outer join d_prop_type dpt on dp.type_id = dpt.id ' +
    '   left outer join d_data_type dt on dt.id = dpt.data_type_id ' +
    '   left outer join l_entity_prop dep on dep.entity_type_id = etm.entity_type_id ' +
    '                                         and dep.entity_id = :p1_entity_id ' +
    '                                         and dep.prop_id = ptm.prop_id ' +
    '   left outer join d_list_value lval on lval.entity_prop_id = dep.id ' +
    '   left outer join d_value val on val.id = lval.value_id ' +
    '  where ptm.prop_template_id = :p2_prop_template_id and ptm.prop_id= :p3_prop_id ' +
    '  order by lval.order_num ';
  DataSetName := 'QU_LIST_EXT_PROP_VAL_' + UPPERCASE(prop_name);
  GetExtendedPropUpdateScript(True, False, insert_sql, update_sql, delete_sql);
  Result := GetNamedSQLDataSet(SQL, DataSetName, insert_sql, update_sql, delete_sql);
end;

function TBCDbDsDm.GetListExtendedPropVal(prop_name: string; is_default: Boolean): TDataSet;
var
  SQL, DataSetName, update_sql, insert_sql, delete_sql: string;
begin
  result := nil;
  SQL :=
    ' select dp.id as prop_id ' +
    '       ,dp.name as prop_name ' +
    '       ,dp.description as prop_description ' +
    '       ,dpt.name as prop_type_name ' +
    '       ,dpt.REPOSITORY_ITEM_NAME as REPOSITORY_ITEM_NAME ' +
    '       ,dt.code as data_type_code ' +
    '       ,dep.entity_id ' +
    '       ,etm.entity_type_id ' +
    '       ,lval.value_id ' +
    '       ,lval.id ' +
    '       ,:p1_cur_session_id as session_id' +
    '       ,:p2_is_default as is_default' +
    '       ,lval.APPLY_CONDITION as APPLY_CONDITION ' +
    '       ,ptm.MULTIVALUED ' +
    '       ,ptm.CONTROL_LEFT ' +
    '       ,ptm.CONTROL_TOP ' +
    '       ,ptm.CONTROL_HEIGHT ' +
    '       ,ptm.CONTROL_WIDTH ' +
    '       ,ptm.CONTROL_CAPTION ' +
    '       ,val.s_value ' +
    '       ,val.data_type_id ' +
    '       ,val.n_value ' +
    '       ,val.d_value ' +
    '       ,val.c_value ' +
    '       ,val.b_value ' +
    '       ,lval.order_num ' +
    '   from l_entity_template etm ' +
    '  inner join l_prop_template ptm on ptm.prop_template_id = etm.prop_template_id ' +
    '   left outer join d_prop dp on dp.id = ptm.prop_id ' +
    '   left outer join d_prop_type dpt on dp.type_id = dpt.id ' +
    '   left outer join d_data_type dt on dt.id = dpt.data_type_id ' +
    '   left outer join l_entity_prop dep on dep.entity_type_id = etm.entity_type_id ' +
    '                                         and dep.entity_id = :p3_entity_id ' +
    '                                         and dep.prop_id = ptm.prop_id ' +
    '   left outer join l_value_select_context vsc on vsc.entity_prop_id = dep.prop_id ' +
    '                                             and (vsc.is_default = ''Y'' or ' +
    '                                                 (vsc.is_default = ''N'' and vsc.session_id = :p4_sel_session_id)) ' +
    '   left outer join e_list_val lval on lval.select_context_id = vsc.id ' +
    '   left outer join e_value val on val.id = lval.value_id ' +
    '  where ptm.prop_template_id = :p5_prop_template_id and ptm.prop_id= :p6_prop_id ' +
    '  order by lval.order_num ';
  DataSetName := 'QU_LIST_EXT_PROP_VAL_' + UPPERCASE(prop_name);
  GetExtendedPropUpdateScript(False, is_default, insert_sql, update_sql, delete_sql);
  Result := GetNamedSQLDataSet(SQL, DataSetName, insert_sql, update_sql, delete_sql);
end;

function TBCDbDsDm.GetListExtendedProp(entity_type_code: string): TDataSet;
var
  SQL, DataSetName: string;
begin
  result := nil;
  SQL :=
    ' select dp.id as prop_id ' +
    '       ,dp.name as prop_name ' +
    '       ,dp.description as prop_description ' +
    '       ,dpt.name as prop_type_name ' +
    '       ,dpt.REPOSITORY_ITEM_NAME as REPOSITORY_ITEM_NAME ' +
    '       ,dt.code as data_type_code ' +
    '   from l_entity_template etm ' +
    '  inner join l_prop_template ptm on ptm.prop_template_id = etm.prop_template_id ' +
    '   left outer join d_prop dp on dp.id = ptm.prop_id ' +
    '   left outer join d_prop_type dpt on dp.type_id = dpt.id ' +
    '   left outer join d_data_type dt on dt.id = dpt.data_type_id ' +
    '  where ptm.prop_template_id = :p1_prop_template_id ' +
    '  order by ptm.order_num ';
  DataSetName := 'QU_LIST_EXT_PROP_' + UPPERCASE(entity_type_code);
  Result := GetNamedSQLDataSet(SQL, DataSetName);
end;

procedure TBCDbDsDm.SetConnection(DataSet: TDataSet);
begin
//virtual;
end;

procedure TBCDbDsDm.OpenNamedSQLDataSet(var DataSet: TDataSet;
  const Args: array of const; is_exec: Boolean = false; is_open: Boolean = true);
var
  i: integer;
  lParamName, aSQL: string;
  lParamNum: integer;
  Params: TParams;
begin
  inherited;
  if DataSet <> nil then
  begin
    Params := GetDataSetParams(DataSet);
    aSQL := GetDataSetSQL(DataSet);
    DataSet.Close;
    if Params.Count > 0 then
    begin
      if High(Args) + 1 > Params.Count then
        raise
          Exception.Create('Ошибка функции OpenSQL: Количество значений параметров больше количества параметров' + #13#10 + aSQL);
      for i := 0 to Params.Count - 1 do
      begin
        lParamName := Params[i].Name;
        if UpperCase(lParamName[1] {copy(lParamName, 1, 1)}) <> 'P' then
          raise Exception.Create('Ошибка функции OpenSQL: Неверный формат имени параметра. ' +
            lParamName + #13#10 + aSQL);
        if Pos('_', lParamName) > 0 then
          lParamNum := StrToIntDef(copy(lParamName, 2, Pos('_', copy(lParamName, 2,
            Length(lParamName))) - 1), -1)
        else
          lParamNum := StrToIntDef(copy(lParamName, 2, Length(lParamName) - 1), -1);
        if lParamNum = -1 then
          raise Exception.Create('Ошибка функции OpenSQL: Неверный формат имени параметра. ' +
            lParamName + #13#10 + aSQL)
        else if lParamNum > High(Args) + 1 then
          Params[i].Clear
        else
          Params[i].Value :=
            UtilsDataConvert.ConvertToVariant(Args[lParamNum - 1]);
      end;
    end;
    if is_exec then ExecuteDataSet(DataSet) else DataSet.Open;
  end;
end;

procedure TBCDbDsDm.OpenNamedSQLDataSet(DataSetName: string;
  const Args: array of const; is_exec: Boolean = false; is_open: Boolean = true);
var
  c: TComponent;
begin
  inherited;
  c := FindComponent(DataSetName);
  if (c <> nil) and (c is TDataSet) then OpenNamedSQLDataSet(TDataSet(c), Args, is_exec, is_open);
end;

function TBCDbDsDm.GetListScriptDataSet(
  entity_type_code: string): TDataSet;
begin
  result := nil;
end;

procedure TBCDbDsDm.OpenSQL(aSQL: AnsiString; DataSetName: string = 'QFO');
var
  LDataSet: TDataSet;
begin
  LDataSet := GetNamedSQLDataSet(aSQL, DataSetName);
  OpenNamedSQLDataSet(LDataSet, []);
end;

procedure TBCDbDsDm.OpenSQL(aSQL: AnsiString;
  const Args: array of const; DataSetName: string = 'QFO');
var
  LDataSet: TDataSet;
begin
  LDataSet := GetNamedSQLDataSet(aSQL, DataSetName);
  OpenNamedSQLDataSet(LDataSet, Args);
end;

procedure TBCDbDsDm.ExecSQL(aSQL: AnsiString; DataSetName: string = 'QFO');
begin
  OpenNamedSQLDataSet(DataSetName, [], True);
end;

procedure TBCDbDsDm.ExecSQL(aSQL: AnsiString;
  const Args: array of const; DataSetName: string = 'QFO');
begin
  OpenNamedSQLDataSet(DataSetName, Args, True);
end;

procedure TBCDbDsDm.GetExtendedPropUpdateScript(Is_Dictionary: Boolean; Is_Default: Boolean; var
  SQLInsert: string; var SQLUpdate: string; var SQLDelete: string);
begin
//virtual;
end;

procedure TBCDbDsDm.SetScriptDataSet(var DataSet: TDataSet; App_Object_Name: string);
//var Script, ScriptName, SQLInsert, SQLUpdate, SQLDelete: string;
begin
//virtual;
end;

procedure TBCDbDsDm.SetScriptTypeDataSet(var DataSet: TDataSet);
begin
  DataSet := GetNamedSQLDataSet('select ID, NAME, LANGUAGE, DESCRIPTION from sa.d_action_type t',
    'QU_APP_SCRIPT_TYPE');
  OpenNamedSQLDataSet(DataSet, []);
end;

function TBCDbDsDm.GetCurrentUserId: Int64;
begin
//Virtual;
end;

function TBCDbDsDm.CloneDataSet(DataSetFrom: TDataSet; DataSetName: string = ''): TDataSet;
begin
//virtual;
end;

function TBCDbDsDm.GetDataSetParams(DataSet: TDataSet): TParams;
begin
//Virtual
end;

procedure TBCDbDsDm.ExecuteDataSet(DataSet: TDataSet);
begin
//Virtual
end;

procedure TBCDbDsDm.CustomDataSetBeforeOpen(DataSet: TDataSet);
begin
  inherited;
//Virtual
end;

procedure TBCDbDsDm.CustomDataSetDataScroll(DataSet: TDataSet);
begin
//Virtual
end;

function TBCDbDsDm.CheckBeforePost(DataSet: TDataSet;
  isRaiseError: Boolean = true): string;
var
  i: integer;
begin
  Result := '';
end;

procedure TBCDbDsDm.CustomDataSetBeforePost(DataSet: TDataSet);
begin
//Virtual
end;


procedure TBCDbDsDm.SetLang_id(const Value: Int64);
var
  Params: TParams;
  i: Integer;
  Param: TParam;
begin
  Flang_id := Value;
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TDataSet then
    begin
      Params := GetDataSetParams(TDataSet(Components[i]));
      Param := Params.FindParam('lang_id');
      if Param <> nil
        then Param.Value := LargeIntegerToVarParam(Lang_id);
    end;
  end;
end;

end.

