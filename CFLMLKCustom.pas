unit CFLMLKCustom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, StdCtrls, MsAccess,
  ActnList, MlekoForm, System.Actions;

type
  TCFLMLKCustomForm = class(TMlekoForm)
    procedure FormShow(Sender: TObject);
  public
    function CreateChildControl(aParent: TWinControl; Data_type_code: string; Params: TParams; Value: string = ''): TComponent;
    procedure CreateControlsToParent(prop_dlg_id: Integer; aParent: TWinControl; pParams: TParams);
    function ParamIsSelect(Sender: TObject): Boolean;
    procedure ReadResultParams(prop_dlg_id: Integer; var Params: TStrings);
    function GetResultParamFromControl(p_control_name: string): string;
    procedure RefreshDataSet(DataSet: TDataSet; KeyField: string);
    //    procedure WriteControlValueFromDataSet(DataSet:TMSQuery);

  end;

var
  CFLMLKCustomForm: TCFLMLKCustomForm;

implementation

uses CFLMLKSelect, MlkData, UtilsDataConvert, UtilsCommon, BCDbMSSQL;

{$R *.dfm}

function TCFLMLKCustomForm.ParamIsSelect(
  Sender: TObject): Boolean;
var
  l_res_sql, l_param_code, l_query_filter, l_param_name, l_owner
    , lv_key_field, lv_txt_field, lv_table_name, lv_select_entity_class, l_style: string;
  is_multiselect: boolean;
//  c: TcitDBComboEdit;
begin
  inherited;
//  c := (Sender as TcitDBComboEdit);
//  l_owner := c.Owner;
//  l_param_name := UpperCase(c.Name);
//  l_param_code := c.EntityCode;
//  l_style := 'unknown';
//  l_query_filter := dmDataModule.parse_flt_sql(c.SqlFilter, l_owner, l_param_name);
//  is_multiselect := c.multiselect;
//  result := TCFLMLKSelectDlg.OpenHoldSelect(l_Owner, l_param_name, l_param_code, is_multiselect, l_query_filter, l_style);
//  if result then dmDataModule.set_entity_value(c);
end;

procedure TCFLMLKCustomForm.FormShow(Sender: TObject);
var
  i: integer;
  l_entity_code: string;
//  c: TCitDbComboEdit;
begin
  inherited;
//  for i := 0 to ComponentCount - 1 do
//  begin
//    if (Components[i] is TCitDbComboEdit) then
//    begin
//      c := (Components[i] as TCitDbComboEdit);
//      if not varIsnull(c.EntityCode) then c.OnIsSelect := ParamIsSelect;
//    end;
//    if (Components[i] is TCustomDADataSet) then
//      if Assigned(MainDm) then
//       if not Assigned(TCustomDADataSet(Components[i]).Connection) then
//        TCustomDADataSet(Components[i]).Connection := TBCDbMSSQLDm(MainDm).DB;
//  end;
end;

procedure TCFLMLKCustomForm.CreateControlsToParent(prop_dlg_id: Integer; aParent: TWinControl; pParams: TParams);
var
  c: TComponent;
  i: Integer;
  cParams: TParams;
  Data_type_code: string;
  qfo: TDataSet;
  ListObjDel: TStrings;
begin
  ListObjDel := TStringList.Create;
  try
    for i := 0 to ComponentCount - 1 do
    begin
      if Components[i].Tag=1111 then
        if (TWinControl(Components[i]).Parent = aParent) then ListObjDel.AddObject(Components[i].Name, TObject(Components[i]));
    end;
    for i := 0 to ListObjDel.Count - 1 do
      ListObjDel.Objects[i].Free;
  finally
    ListObjDel.Free;
  end;

  qfo := CustomDM.GetNamedSQLDataSet(
    'SELECT   a.id, ' +
    '         a.prop_dlg_id, ' +
    '         a.name, ' +
    '         a.entity_type_id, ' +
    '         t.name as entity_code, ' +
    '         t.Data_type_code, ' +
    '         a.caption, ' +
    '         a.pos_left, ' +
    '         a.pos_top, ' +
    '         a.width, ' +
    '         a.height, ' +
    '         a.is_multiselect, ' +
    '         a.def_value, ' +
    '         a.num_order, ' +
    '         a.filter_sql, ' +
    '         a.style, ' +
    '         a.visible, ' +
    '         a.is_in, ' +
    '         a.is_out ' +
    'FROM     d_prop_dlg_attribute a inner join d_entity_type t on a.entity_type_id=t.id ' +
    'WHERE    prop_dlg_id = :p1_id ' +
    'ORDER BY num_order ','DS_LIST_CONTROL');
  CustomDM.OpenNamedSQLDataSet(qfo, [prop_dlg_id]);
  qfo.First;
  i := 0;
  while not qfo.Eof do
  begin
    Data_type_code := Qfo.FieldByName('Data_type_code').AsString;
    cParams := TParams.Create;
    try
      UtilsDataConvert.DataSetToParams(qfo, cParams);
      c := CreateChildControl(aparent, Data_type_code, cParams, UtilsCommon.GetParamValue(pParams, cParams.ParamValues['name'], varString, ''));
      c.Tag:=1111;
    finally
      cParams.Free;
    end;
    if i = 0 then ActiveControl := TWinControl(c);
    qfo.Next;
    inc(i);
  end;
end;

function TCFLMLKCustomForm.CreateChildControl(aParent: TWinControl; Data_type_code: string; Params: TParams; Value: string): TComponent;
var
//  cit: TCitDbComboEdit;
//  ch: TCheckBox;
//  cxDate: TCxDateEdit;
  c: TWinControl;
  lab: TLabel;
  l_attribute_id, l_left, l_top, l_Height, l_Width: Integer;
  l_name, l_caption, l_def_value, l_entityCode: string;
  i: Integer;
  lDate: TDate;
begin
  //    CreateControl(ClassName, Parent, Params);

//  l_name := Params.ParamValues['name'];
//  l_attribute_id := StrToInt(Params.ParamValues['id']);
//  l_left := StrToInt(Params.ParamValues['pos_left']);
//  l_top := StrToInt(Params.ParamValues['pos_top']);
//  l_Height := StrToInt(Params.ParamValues['height']);
//  l_Width := StrToInt(Params.ParamValues['Width']);
//  l_caption := trim(Params.ParamValues['caption']);
//  l_entityCode := trim(Params.ParamValues['entity_code']);
//  if (Data_type_code = 'INTEGER')
//    or (Data_type_code = 'FLOAT')
//    or (Data_type_code = 'TEXT')
//    or (Data_type_code = 'TIME') then
//  begin
//    cit := TCitDbComboEdit.Create(Self);
//    cit.Parent := aParent;
//    cit.EntityCode := l_entityCode;
//    cit.multiselect := StrToBool(params.ParamValues['is_multiselect']);
//    cit.LLblCaption := l_caption;
//    cit.LLblAlignment := laTop;
//    cit.AutoTabControl := true;
//    cit.OwnesLButton := true;
//    cit.OwnesLLabel := true;
//    cit.OnIsSelect := ParamIsSelect;
//    cit.Owner := dmDataModule.get_prop_dlg_attribute_owner(l_attribute_id);
//
//    if Data_type_code = 'FLOAT' then cit.EditStyle := EdCalc;
//    if Data_type_code = 'INTEGER' then cit.EditStyle := EdSelect;
//    if Data_type_code = 'TEXT' then cit.EditStyle := EdEdit;
//    if Data_type_code = 'TIME' then cit.EditStyle := EdTime;
//    c := TWinControl(cit);
//  end;
//  if Data_type_code = 'DATE' then
//  begin
//    cxDate:=TcxDateEdit.Create(Self);
//    cxDate.Parent:=aParent;
//    cxDate.Left:= l_left;
//    cxDate.Top:=l_top;
//    cxDate.Width:= l_Width;
//    cxDate.Date:=Date();
//    cxDate.Properties.MinDate:=Date()-3000;
//    cxDate.Properties.MaxDate:=Date()+3000;
//    cxDate.Properties.SaveTime:=false;
//    cxDate.Properties.ShowTime:=false;
//
//    lab:=TLabel.Create(Self);
//    lab.Parent:=aParent;
//    lab.Caption:= l_caption;
//    lab.Left:= l_left;
//    lab.Top:=l_top-cxDate.Height;
//    lab.Width:= l_Width;
//    c:=  TWinControl(cxDate);
//  end;
//  if (Data_type_code = 'BOOLEAN') then
//  begin
//    ch := TCheckBox.Create(Self);
//    ch.Caption := l_Caption;
//    c := TWinControl(ch);
//  end;
//  c.Visible := True;
//  c.Name := l_name;
//  c.Parent := aParent;
//  c.Left := l_left;
//  c.Top := l_top;
//  c.Height := l_Height;
//  c.Width := l_Width;
//  dmDataModule.SetDefaultValue(c, l_attribute_id, Value);
//  result := (c as TComponent);

end;

procedure TCFLMLKCustomForm.ReadResultParams(prop_dlg_id: Integer; var Params: TStrings);
var
  param_name: string;
begin
  dmDataModule.qfo.Close;
  dmDataModule.qfo.SQL.Clear;
  dmDataModule.qfo.SQL.Add('select * from d_prop_dlg_attribute where prop_dlg_id=' + IntToStr(prop_dlg_id) + ' order by num_order');
  dmDataModule.qfo.Open;
  dmDataModule.qfo.First;
  while not dmDataModule.qfo.Eof do
  begin
    param_name := dmDataModule.qfo.FieldByName('name').AsString;
    params.Values[param_name] := GetResultParamFromControl(param_name);
    dmDataModule.qfo.next;
  end;
end;

function TCFLMLKCustomForm.GetResultParamFromControl(p_control_name: string): string;
var
  cw: TComponent;
begin
  cw := (FindComponent(p_control_name) as TComponent);
  if cw <> nil then
  begin
//    if (cw is TcitDBComboEdit) then
//    begin
//      if ((cw as TcitDBComboEdit).Text = '') or ((cw as TcitDBComboEdit).KeyFieldValue = '-1') or ((cw as TcitDBComboEdit).KeyFieldValue = '') then
//        result := '-1'
//      else
//        result := (cw as TcitDBComboEdit).KeyFieldValue;
//    end;
//    if (cw is TcxDateEdit) then
//    begin
//       result := DateToStr((cw as TcxDateEdit).Date);
//    end;
//    if (cw is TCheckBox) then
//    begin
//      if (cw as TCheckBox).Checked then
//        result := '1'
//      else
//        result := '0';
//    end;
  end;
end;

procedure TCFLMLKCustomForm.RefreshDataSet(DataSet: TDataSet; KeyField: string);
var
  l_old_id: string;
  is_locate: boolean;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    is_locate := false;
    if DataSet.Active and (not DataSet.Eof) and (not DataSet.IsEmpty) then
    begin
      l_old_id := DataSet.FieldByName(KeyField).AsString;
      is_locate := true;
    end;
    DataSet.Close;
    DataSet.Open;
    if is_locate and (not DataSet.IsEmpty) then DataSet.Locate(KeyField, l_old_id, []);
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.

