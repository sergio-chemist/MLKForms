unit CFLMLKSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, ActnList, Grids, DBGrids, ExtCtrls,
  StdCtrls, ComCtrls, ToolWin, DB,
  DBAccess, MsAccess, CFLMLKCustom, MemDS, System.Actions, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh, MLKSQLBuilder, UMlkFilterPanel;

type

  EOpenDlgFormException = class(Exception);
  EQueryFieldNotFound = class(Exception);
  EKeyFieldIsEmpty = class(Exception);

  TCFLMLKSelectDlg = class(TCFLMLKCustomForm)
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    ButtonSelect: TButton;
    ButtonCancel: TButton;
    ActionViewRefresh: TAction;
    ActionViewLayout: TAction;
    ActionGridFirst: TAction;
    ActionGridPrior: TAction;
    ActionGridNext: TAction;
    ActionGridLast: TAction;
    ActionFormSelect: TAction;
    ActionFormCancel: TAction;
    DS: TDataSource;
    ActionItemAdd: TAction;
    ActionItemProp: TAction;
    ActionItemDel: TAction;
    Query: TMSQuery;
    QueryProp: TMSQuery;
    Splitter: TSplitter;
    DSSelection: TDataSource;
    QuSelectList: TMSQuery;
    ActionViewSelectedSQL: TAction;
    ActionMark: TAction;
    ActionUnMark: TAction;
    ActionViewBuilderSQL: TAction;
    ActionCopyProfile: TAction;
    spCopyProfile: TMSStoredProc;
    ActionUnMarkAll: TAction;
    ActionMarkAll: TAction;
    PanelGrid: TPanel;
    PanelSelect: TPanel;
    ToolBar1: TToolBar;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolBar: TToolBar;
    ToolButtonRefresh: TToolButton;
    ToolButtonLayout: TToolButton;
    ToolButton6: TToolButton;
    btnViewSql: TToolButton;
    ActionViewDataSetSQL: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ActionRefreshSelected: TAction;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    pnlFilter: TMlkFilterPanel;
    DBGrid: TDBGridEh;
    DBGridSelection: TDBGridEh;
    SQLBuilder: TMLKSQLBuilder;
    procedure ActionViewRefreshExecute(Sender: TObject);
    procedure ActionGridFirstExecute(Sender: TObject);
    procedure ActionGridPriorExecute(Sender: TObject);
    procedure ActionGridNextExecute(Sender: TObject);
    procedure ActionGridLastExecute(Sender: TObject);
    procedure ActionFormSelectExecute(Sender: TObject);
    procedure ActionFormCancelExecute(Sender: TObject);
    procedure ActionViewLayoutExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QueryAfterRefresh(DataSet: TDataSet);
    procedure QueryAfterScroll(DataSet: TDataSet);
    procedure DBGridDblClick(Sender: TObject);
    procedure QueryAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionMarkExecute(Sender: TObject);
    procedure ActionUnMarkExecute(Sender: TObject);
    function DBGridIsLighted(Sender: TObject; DataSet: TDataSet): Boolean;
    procedure ActionCopyProfileExecute(Sender: TObject);
    function SQLBuilderGetWhere(Sender: TObject): string;
    procedure AddFilter(var Filters: String; NewFilter: String);
    procedure ActionUnMarkAllExecute(Sender: TObject);
    procedure ActionMarkAllExecute(Sender: TObject);
    procedure QuSelectListAfterOpen(DataSet: TDataSet);
    procedure ActionRefreshSelectedExecute(Sender: TObject);
    function DBGridSelectionGetKey(Sender: TObject;
      DataSet: TDataSet): string;
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    OldActiveForm: AnsiString;
    query_filter: string;
    LocateKeyValue: string;
    Fis_multiselect: Boolean;
    FormUpdateEvent: TNotifyEvent;
    procedure Setis_multiselect(const Value: Boolean);
    procedure SelectAndClose;
function ExecOpenHoldSelect(
  ls_entity_param: TStrings
  ; p_entity_code: string
  ; p_is_multiselect: Boolean = false
  ; p_owner_name: string = ''
  ; p_entity_name: string = ''
  ; p_query_filter: string = ''
  ; p_style: string = 'DEFAULT'
  ; UpdateEvent: TNotifyEvent = nil
  ; KeyValue: string = ''
  ; BuildQuery: Boolean = False): Boolean;
  protected
    SearchString:string;  
    ActiveSession: string;
    owner_name: string;
    entity_name: string;
    style: string;
    res_txt: string;
    Sql_Result: string;
    SqlQuery: string;
    is_hold_form: Boolean;
    entity_param: TStrings;
    procedure SetActionsEnabled; virtual;
    function OnAction(Sender: TObject;DataSet:TDataSet): Boolean; override;
    function GetLocateFieldName: String;
    function GetLikeStr: string; virtual;
  public
    property is_multiselect: Boolean read Fis_multiselect write Setis_multiselect;
    class function OpenSelect(var KeyValues: TStrings; FirstLocate: Boolean = true): Boolean; overload;
    class function OpenSelect(var Value1: AnsiString; FirstLocate: Boolean = true): Boolean; overload;
    class function OpenSelect(var Value1: integer; FirstLocate: Boolean = true): Boolean; overload;
    class function OpenHoldSelect(p_owner_name: string
      ; p_entity_name: string
      ; p_entity_code: string
      ; p_is_multiselect: Boolean = false
      ; p_query_filter: string = ''
      ; p_style: string = 'DEFAULT'
      ; UpdateEvent: TNotifyEvent = nil
      ; KeyValue: string = ''
      ; BuildQuery: Boolean = False): Boolean;
  end;

implementation

uses MlkData, UtilsCommon, UtilsDataConvert, BCCommon;


{$R *.dfm}

class function TCFLMLKSelectDlg.OpenSelect(var KeyValues: TStrings; FirstLocate: Boolean = true): Boolean;
var
  i: integer;
  Dlg: TCFLMLKSelectDlg;
begin
  Result := false;
  Dlg := Create(Application);
  DLG.is_hold_form := false;
//  Dlg.ComponentProps.DefaultUser := IntToStr(data.UserNo);
  try
    if (KeyValues.Count <> Dlg.SQLBuilder.KeyFields.Count) and (KeyValues.Count <> 0) then
      raise EOpenDlgFormException.CreateFmt
      ('The form cannot be opened. The table has %d key fields, but only %d fields are given', [Dlg.SQLBuilder.KeyFields.Count,
        KeyValues.Count]);
    if (KeyValues.Count <> 0) and (FirstLocate) then
    begin
      Dlg.SQLBuilder.NewLocateData := VarArrayCreate([0, KeyValues.Count - 1], varVariant);
      for i := 0 to KeyValues.Count - 1 do
        Dlg.SQLBuilder.NewLocateData[i] := KeyValues[i];
      Dlg.SQLBuilder.Refresh(true, true);
    end
    else
      Dlg.SQLBuilder.Refresh(false, false);
    //        Dlg.DBGrid.RestoreFormatFromStorage;
    Result := Dlg.ShowModal = mrOk;
    if Result then
    begin
      if (KeyValues.Count = 0) then
        for i := 0 to Dlg.SQLBuilder.KeyFields.Count - 1 do
          KeyValues.Add(Dlg.SQLBuilder.Query.FieldByName(Dlg.SQLBuilder.KeyFields[i]).AsString)
      else
        for i := 0 to Dlg.SQLBuilder.KeyFields.Count - 1 do
          KeyValues[i] := Dlg.SQLBuilder.Query.FieldByName(Dlg.SQLBuilder.KeyFields[i]).AsString;
    end;
  finally
    Dlg.Free;
  end;
end;

class function TCFLMLKSelectDlg.OpenSelect(var Value1: AnsiString; FirstLocate: Boolean = true): Boolean;
var
  aKeyValues: TStrings;
  l_res_sql: string;
begin
  Result := false;
  aKeyValues := TStringList.Create;
  try
    aKeyValues.Add(Value1);
    Result := OpenSelect(aKeyValues, FirstLocate);
    if Result then
      Value1 := aKeyValues[0];
  finally
    aKeyValues.Free;
  end;
end;

class function TCFLMLKSelectDlg.OpenSelect(var Value1: integer; FirstLocate: Boolean = true): Boolean;
var
  Str: AnsiString;
begin
  Str := IntToStr(Value1);
  Result := OpenSelect(Str, FirstLocate);
  if Result then
    Value1 := StrToInt(Str);
end;

function TCFLMLKSelectDlg.ExecOpenHoldSelect(
  ls_entity_param: TStrings
  ; p_entity_code: string
  ; p_is_multiselect: Boolean = false
  ; p_owner_name: string = ''
  ; p_entity_name: string = ''
  ; p_query_filter: string = ''
  ; p_style: string = 'DEFAULT'
  ; UpdateEvent: TNotifyEvent = nil
  ; KeyValue: string = ''
  ; BuildQuery: Boolean = False): Boolean;
var
  i: integer;
  l_sql, t_sql, table_name, key_field, txt_field: string;
begin
        entity_param := ls_entity_param;
        owner_name := p_owner_name;
        entity_name := p_entity_name;
        style := p_style;
        res_txt := '';
        is_hold_form := true;
        is_multiselect := p_is_multiselect;
        query_filter := p_query_filter;
        Caption := ls_entity_param.Values['description'];
        key_field:= entity_param.Values['key_field'];
        if (key_field = '') then
           raise EKeyFieldIsEmpty.Create('Key field is empty');
        SQLBuilder.Select.Add(Format(
        ',(select 1 from e_session_params sp where sp.owner_name=''%s''' +
        ' and sp.param_name=''%s'' and SPID=%d and sp.param_value=%s) as is_select',
        [owner_name, entity_name, MainDm.SPID, key_field]));
//        SQLBuilder.Select.Add(',(select 1 from e_session_params sp where sp.owner_name=''' + owner_name + ''' and sp.param_name=''' +
//        entity_name + '''' + ' and SPID=' + IntTOStr(MainDm.SPID) + ' and sp.param_value=' + entity_param.Values['key_field'] +
//      ') as is_select');
          if is_multiselect then
          begin
            l_sql := dmDataModule.Get_selected_sql(owner_name, entity_name, entity_param.Values['code']);
              if (l_sql<>'') then
              begin
                QuSelectList.SQL.Clear;
                QuSelectList.SQL.Add(l_sql);
                QuSelectList.Open;
              end;
          end;
          if (query_filter <> '') then
             SQLBuilder.Where.Add(query_filter);
          LocateKeyValue:= KeyValue;
          FormUpdateEvent:= UpdateEvent;
          Result := (ShowModal = mrOk);
          if Result then
            if not is_multiselect {and not(QuSelectList.Eof)} then
            begin
              dmDataModule.Del_session_params(owner_name, entity_name, '#NULL#');
              //key_field:= GetLocateFieldName();
              if (Query.FindField(key_field) = nil) then
                raise EQueryFieldNotFound.CreateFmt('Key field not found: %s', [key_field]);
              dmDataModule.Add_session_params(owner_name, entity_name, Query.FieldByName(key_field).AsString);
            end;
end;

class function TCFLMLKSelectDlg.OpenHoldSelect(p_owner_name: string
  ; p_entity_name: string
  ; p_entity_code: string
  ; p_is_multiselect: Boolean = false
  ; p_query_filter: string = ''
  ; p_style: string = 'DEFAULT'
  ; UpdateEvent: TNotifyEvent = nil
  ; KeyValue: string = ''
  ; BuildQuery: Boolean = False): Boolean;
var
  Dlg: TCFLMLKSelectDlg;
  i: integer;
  ls_entity_param: TStrings;
  PClass: TComponentClass;
  l_sql, t_sql, table_name, key_field, txt_field: string;
begin
  Result:= False; PClass:= nil; Dlg:= nil;

  ls_entity_param := dmDataModule.get_entity_param(p_entity_code);
  try
    l_sql:= ls_entity_param.Values['select_entity_class'];
    PClass := TComponentClass(GetClass(l_sql));
    if (PClass=nil) then
       MessageDlg(PChar(Format('Класс %s не зарегистрирован', [l_sql])),  mtError,
         [mbOK], 0) else
      begin
        Application.CreateForm(PClass, Dlg);
        try
          Result:= Dlg.ExecOpenHoldSelect(
          ls_entity_param,
          p_entity_code,
          p_is_multiselect,
          p_owner_name,
          p_entity_name,
          p_query_filter,
          p_style,
          UpdateEvent,
          KeyValue,
          BuildQuery
          );
        finally
            Dlg.Free;
        end;
      end;
  finally
    ls_entity_param.Free;
  end;
end;

procedure TCFLMLKSelectDlg.ActionViewRefreshExecute(Sender: TObject);
var
  is_locate: Boolean;
  l_old_id,l_key_field: string;
  old_id: Int64;
begin
  try
    Screen.Cursor := crHourGlass;
    l_key_field:= '';
    if (SQLBuilder.KeyFields.Count > 0) then
       l_key_field:= SQLBuilder.KeyFields[0];
    if l_key_field='' then l_key_field:='ID';
    is_locate := false;
    if not QuSelectList.IsEmpty then
    begin
      l_old_id := QuSelectList.FieldByName('key_field').AsString;
      is_locate := true;
    end;
    if DBGrid.DataSource.DataSet.Active then
    begin
      l_old_id := Query.FieldByName(l_key_field).AsString;
      is_locate := true;
    end;
    SQLBuilder.Refresh(true, true);
    if QuSelectList.Active then QuSelectList.Refresh;
    if is_locate then Query.Locate(l_key_field, StrToInt64Def(l_old_id, 0), []);
  finally
    if DBGrid.CanFocus then ActiveControl := DBGrid;
    Screen.Cursor := crDefault;
  end;
end;

procedure TCFLMLKSelectDlg.ActionGridFirstExecute(Sender: TObject);
begin
  SQLBuilder.Query.First;
end;

procedure TCFLMLKSelectDlg.ActionGridPriorExecute(Sender: TObject);
begin
  SQLBuilder.Query.Prior;
end;

procedure TCFLMLKSelectDlg.ActionGridNextExecute(Sender: TObject);
begin
  SQLBuilder.Query.Next;
end;

procedure TCFLMLKSelectDlg.ActionGridLastExecute(Sender: TObject);
begin
  SQLBuilder.Query.Last;
end;

procedure TCFLMLKSelectDlg.ActionFormSelectExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TCFLMLKSelectDlg.ActionFormCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TCFLMLKSelectDlg.ActionViewLayoutExecute(Sender: TObject);
begin
//  DBGrid.ChangeLayout;
end;

procedure TCFLMLKSelectDlg.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  (*
  ComponentProps.DefaultUser := IntToStr(data.UserNo);
  ToolBar.Left := PageControl.Left + PageControl.Width - ToolBar.Width;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TcitComponentProps) then
      if TcitComponentProps(Components[i]).Enabled then
      begin
        TcitComponentProps(Components[i]).DefaultUser := IntToStr(data.UserNo);
        TcitComponentProps(Components[i]).RestoreFromStorage;
      end;
      *)
end;

procedure TCFLMLKSelectDlg.QueryAfterOpen(DataSet: TDataSet);
var
  i: integer;
begin
  SetActionsEnabled;
end;

procedure TCFLMLKSelectDlg.QueryAfterRefresh(DataSet: TDataSet);
begin
  SetActionsEnabled;
end;

procedure TCFLMLKSelectDlg.QueryAfterScroll(DataSet: TDataSet);
begin
  SetActionsEnabled;
end;

procedure TCFLMLKSelectDlg.SetActionsEnabled;
var
  l_key_field_value: Int64;
  ne: Boolean;
begin
  ne := (not Query.IsEmpty);
  ActionItemProp.Enabled := ne;
  ActionItemDel.Enabled := ne;
  ActionFormSelect.Enabled := ne;
//  if ne and (not is_multiselect) then
//     begin
//
//        l_key_field_value := Query.FieldByName(entity_param.Values['key_field']).AsInteger;
//        QuSelectList.Locate('key_field', l_key_field_value, []);
//     end else
  if ne and is_multiselect and QuSelectList.Active and not (QuSelectList.IsEmpty) then
  begin
    l_key_field_value := StrToInt64Def(VarToStr(Query.FieldByName(entity_param.Values['key_field']).Value), 0);
    QuSelectList.Locate('key_field', l_key_field_value, []);
  end;
end;

procedure TCFLMLKSelectDlg.DBGridDblClick(Sender: TObject);
var Ctrl_Down: Boolean;
begin
  inherited;
  Ctrl_Down:= Ctrl_Is_Down();
  if Fis_multiselect and Ctrl_Down then
     SelectAndClose else
     if ActionFormSelect.Enabled then ActionFormSelectExecute(nil);
end;

function TCFLMLKSelectDlg.GetLikeStr: string;
begin
  Result:= '';
end;

function TCFLMLKSelectDlg.GetLocateFieldName(): String;
begin
  Result:= entity_param.Values['key_field'];
end;

procedure TCFLMLKSelectDlg.FormShow(Sender: TObject);
var OldAutoLocate: Boolean;
begin
  inherited;
  //ComponentProps.DefaultUser := IntToStr(data.UserNo);
  if (LocateKeyValue<>'') then
  begin
    OldAutoLocate:= SQLBuilder.AutoLocate;
    SQLBuilder.KeyFields.Text:= GetLocateFieldName();
    SQLBuilder.AutoLocate:= True;
    SQLBuilder.NewLocateData:= LocateKeyValue;
  end;
  ActionViewRefresh.Execute;
  if (LocateKeyValue<>'') then
    SQLBuilder.AutoLocate:= OldAutoLocate;
  //DBGrid.RestoreFormatFromStorage;
  if (Query.RecordCount > 0) then
    if is_hold_form then Query.Locate('is_select', 1, []);
  if Assigned(FormUpdateEvent) then
    begin
      Position:= poDesigned;
      FormUpdateEvent(Self);
    end;
end;

procedure TCFLMLKSelectDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  (*
  ComponentProps.DefaultUser := IntToStr(data.UserNo);
  DBGrid.SaveFormatToStorage;
  *)
end;

procedure TCFLMLKSelectDlg.ActionMarkExecute(Sender: TObject);
begin
  dmDataModule.Add_session_params(owner_name, entity_name, Query.FieldByName(entity_param.Values['key_field']).AsString);
  ActionViewRefresh.Execute;
end;

procedure TCFLMLKSelectDlg.ActionUnMarkExecute(Sender: TObject);
begin
  dmDataModule.del_session_params(owner_name, entity_name, QuSelectList.FieldByName('key_field').AsString);
  ActionViewRefresh.Execute;
  //DBGridSelection.SetFocus;
end;

function TCFLMLKSelectDlg.DBGridIsLighted(Sender: TObject;
  DataSet: TDataSet): Boolean;
begin
  if is_hold_form then
    result := (DataSet.FieldByName('is_select').AsInteger = 1)
  else
    result := false;
end;

procedure TCFLMLKSelectDlg.ActionCopyProfileExecute(Sender: TObject);
var
  ID: integer;
begin
(*
  if TMlekoSelectUserDlg.OpenSelect(ID, false) then
  begin
    if Application.MessageBox('При следующем входе в этот экран будут загружены настройки другого пользователя, вы уверены?', 'Настройки', MB_YESNO)
      = IDYES then
    begin
      spCopyProfile.Close;
      spCopyProfile.Params.ParamByName('p_owner_from').Value := IntToStr(ID);
      spCopyProfile.Params.ParamByName('p_owner_to').Value := IntToStr(MlkData.UserNo);
      spCopyProfile.Params.ParamByName('p_section').Value := Name;
      spCopyProfile.ExecProc;
      //ComponentProps.Enabled := false;
    end;
  end;
  *)
end;

procedure TCFLMLKSelectDlg.AddFilter(var Filters: String; NewFilter: String);
begin
  if Trim(NewFilter) <> '' then
  begin
    if Trim(Filters) <> '' then Filters := Filters + ' and ';
    Filters := Filters + NewFilter;
  end;
end;

function TCFLMLKSelectDlg.SQLBuilderGetWhere(Sender: TObject): string;
var
  s: TStrings;
  cnt, i: integer;
begin
  result := SQLBuilder.Where.Text;
  if query_filter <> '' then
    AddFilter(Result, query_filter);
end;

procedure TCFLMLKSelectDlg.ActionUnMarkAllExecute(Sender: TObject);
begin
  if not QuSelectList.Active then QuSelectList.Open;
  QuSelectList.First;
  while not QuSelectList.Eof do
  begin
    dmDataModule.del_session_params(owner_name, entity_name, QuSelectList.FieldByName('key_field').AsString);
    QuSelectList.Next;
  end;
  ActionViewRefresh.Execute;
//  DBGridSelection.SetFocus;
end;

procedure TCFLMLKSelectDlg.ActionMarkAllExecute(Sender: TObject);
begin
  inherited;
  Query.First;
  while not Query.Eof do
  begin
    dmDataModule.Add_session_params(owner_name, entity_name, Query.FieldByName(entity_param.Values['key_field']).AsString);
    Query.Next;
  end;
  ActionViewRefresh.Execute;
//  DBGridSelection.SetFocus;
end;

procedure TCFLMLKSelectDlg.QuSelectListAfterOpen(DataSet: TDataSet);
begin
  inherited;
  QuSelectList.FieldByName('SPID').Visible := false;
  QuSelectList.FieldByName('key_field').Visible := false;
  QuSelectList.FieldByName('txt_field').DisplayLabel := 'Выбор';
end;

procedure TCFLMLKSelectDlg.ActionRefreshSelectedExecute(Sender: TObject);
begin
  inherited;
//  DBGridSelection.Refresh;
end;

function TCFLMLKSelectDlg.DBGridSelectionGetKey(Sender: TObject;
  DataSet: TDataSet): string;
begin
  inherited;
  result := DataSet.FieldByName('key_field').AsString;
end;

procedure TCFLMLKSelectDlg.Setis_multiselect(const Value: Boolean);
begin
  Fis_multiselect := Value;
  PanelSelect.Visible := Value;
  Splitter.Visible := Value;
  ActionMark.Enabled := Value;
  ActionUnMark.Enabled := Value;
  ActionMarkAll.Enabled := Value;
  ActionUnMarkAll.Enabled := Value;
end;

function TCFLMLKSelectDlg.OnAction(Sender: TObject; DataSet: TDataSet): Boolean;
var
  i: integer;
  ls_entity_param: TStrings;
  l_entity_code, l_sql: string;
begin
  result := inherited OnAction(Sender, DataSet);
  if Action = acSELECT then
  begin
    l_entity_code := GetParamValue(Params, 'ENTITY_CODE', varString, '');
    entity_param := dmDataModule.get_entity_param(l_entity_code);
    owner_name := GetParamValue(Params, 'OWNER_NAME', varString, '');
    entity_name := GetParamValue(Params, 'ENTITY_NAME', varString, '');
    style := GetParamValue(Params, 'STYLE', varString, 'DEFAULT');
    is_multiselect := GetParamValue(Params, 'IS_MULTISELECT', varBoolean, False);
    query_filter := GetParamValue(Params, 'QUERY_FILTER', varString, '');
    ls_entity_param := dmDataModule.get_entity_param(l_entity_code);
    res_txt := '';
    is_hold_form := true;
    SQLBuilder.Select.Add(',(select 1 from e_session_params sp where sp.owner_name=''' + owner_name + ''' and sp.param_name=''' +
      entity_name + '''' + ' and SPID=' + IntTOStr(MainDm.SPID) + ' and sp.param_value=' + entity_param.Values['key_field'] +
      ') as is_select');
    l_sql := dmDataModule.Get_selected_sql(owner_name, entity_name, ls_entity_param.Values['code']);
    if is_multiselect then
    begin
      QuSelectList.SQL.Clear;
      QuSelectList.SQL.Add(l_sql);
      QuSelectList.Open;
    end;
    try
      Result := ShowModal = mrOk;
      if Result then
      begin
        if not is_multiselect then
        begin
          dmDataModule.Del_session_params(owner_name, entity_name, '#NULL#');
          dmDataModule.Add_session_params(owner_name, entity_name, Query.FieldByName(entity_param.Values['key_field']).AsString);
        end;
        UtilsDataConvert.DataSetToParams(Query, Params);
      end;
    finally
      ls_entity_param.Free;
    end;
  end;
end;

procedure TCFLMLKSelectDlg.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 case Key of
  VK_RETURN:begin
             SearchString:='';
             Key:=0;
            end;
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TCFLMLKSelectDlg.DBGridKeyPress(Sender: TObject; var Key: Char);
var
 Found:Boolean;
begin
// if Key in data.SearchSet then
//  begin
//   Found:=False;
//   SearchString:=SearchString+Key;
//   try
//   Found:=DBGrid.DataSource.DataSet.Locate(DBGrid.Columns[DBGrid.SelectedIndex].FieldName,AnsiUpperCase(SearchString),[loCaseInsensitive,loPartialKey]);
//   except
//   SearchString:='';
//   end;
//   if DBGrid.Columns[DBGrid.SelectedIndex].Field.DataType=ftString then
//    if not Found then SearchString:=Copy(SearchString,1,Length(SearchString)-1);
//   Key:=Chr(0);
//  end;
end;

procedure TCFLMLKSelectDlg.SelectAndClose();
begin
  if (QuSelectList.RecordCount=0) then
    ActionMarkExecute(Self);
  PostMessage(Self.Handle,wm_close,0,0);
  ModalResult:= mrOk;
end;

procedure TCFLMLKSelectDlg.FormKeyUp(Sender: TObject; var Key: Word; Shift:
    TShiftState);
const
  Plus = 107;
  Minus = 109;
  Enter = 13;
begin
  inherited;
  if Fis_multiselect and (Shift=[ssCtrl]) then
  case Key of
  Plus: ActionMarkExecute(Sender);
  Minus: ActionUnMarkExecute(Sender);
  Enter: SelectAndClose();
  end;
end;

end.

