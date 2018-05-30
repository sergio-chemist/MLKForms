unit BCDbDsMSSQL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BCDbDs, DB, MemDS, MsAccess, DBAccess;

type
  TBCDbDsMSSQLDm = class(TBCDbDsDm)
    QuSaveProfile: TMSQuery;
    QuLoadProfile: TMSQuery;
    DBDev: TMSConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
  protected
    procedure SetConnection(DataSet: TDataSet); override;
{    procedure QuCustomPermDataSetBeforeUpdateExecute(
      Sender: TCustomMSDataSet; StatementTypes: TStatementTypes;
      Params: TMSParams);
    procedure QuCustomDataSetAfterUpdateExecute(Sender: TCustomMSDataSet; StatementTypes: TStatementTypes; Params: TMSParams);}
    function GetPropValUpdateSql: string;
    function GetPropValInsertSql: string;
    function GetPropValDeleteSql: string;
  public
    procedure SaveProfileData(Section: string; Data: string); override;
    function LoadProfileData(Section: string): string; override;
    function GetNamedSQLDataSet(
  aSQL: AnsiString = ''
  ; DataSetName: string = ''
  ; aSQLInsert: AnsiString = ''
  ; aSQLUpdate: AnsiString = ''
  ; aSQLDelete: AnsiString = ''
  ; aSQLRefresh: AnsiString = ''
  ; aSQLLock: AnsiString = ''
  ; Owner: TComponent = nil): TDataSet; override;
    procedure QuCustomDataSetBeforeUpdateExecute(Sender: TDataSet;
      StatementTypes: TStatementTypes; Params: TDAParams);
    function GetDataSetSQL(DataSet: TDataSet): string; override;
    function GetDataSetParams(DataSet: TDataSet): TParams;  override;
    procedure ExecuteDataSet(DataSet: TDataSet); override;
    function CloneDataSet(DataSetFrom: TDataSet;DataSetName:String=''): TDataSet; override;        
  end;

implementation

uses BCDbMSSQL;

{$R *.dfm}

{ TBCDbDsMSSQLDm }

function TBCDbDsMSSQLDm.LoadProfileData(Section: string): string;
begin
  result := inherited LoadProfileData(Section);
  {  QuLoadProfile.Close;
    QuLoadProfile.ParamByName('Section').AsString := Section;
    QuLoadProfile.Open;
    if QuLoadProfile.Eof then Result := '' else Result := QuLoadProfile.FieldByName('Data').AsString;
    }
end;

procedure TBCDbDsMSSQLDm.SaveProfileData(Section, Data: string);
begin
  inherited;
  {  QuSaveProfile.ParamByName('Section').AsString := Section;
    QuSaveProfile.ParamByName('Data').AsString := Data;
    QuSaveProfile.Execute;}
end;

function TBCDbDsMSSQLDm.GetNamedSQLDataSet(
  aSQL: AnsiString = ''
  ; DataSetName: string = ''
  ; aSQLInsert: AnsiString = ''
  ; aSQLUpdate: AnsiString = ''
  ; aSQLDelete: AnsiString = ''
  ; aSQLRefresh: AnsiString = ''
  ; aSQLLock: AnsiString = ''
  ; Owner: TComponent = nil): TDataSet;
begin
  result := inherited GetNamedSQLDataSet(aSQL, DataSetName);
  if result = nil then
  begin
    result := TMSQuery.Create(Owner);
    result.Name := ListDataSet[ListDataSet.Count - 1];
    SetConnection(Result);
  end
  else
    result := TMSQuery(result);
  TMSQuery(result).SQL.Text := aSQL;
  TMSQuery(result).SQLInsert.Text := aSQLInsert;
  if aSQLUpdate = '' then TMSQuery(result).SQLUpdate.Text := 'begin null; end;' else
    TMSQuery(result).SQLUpdate.Text := aSQLUpdate;
  TMSQuery(result).SQLDelete.Text := aSQLDelete;
  TMSQuery(result).SQLRefresh.Text := aSQLRefresh;
  TMSQuery(result).Options.StrictUpdate := False;
  TMSQuery(result).Options.ReturnParams := true;
  TCustomDADataSet(result).BeforeUpdateExecute := QuCustomDataSetBeforeUpdateExecute;
end;

procedure TBCDbDsMSSQLDm.SetConnection(DataSet: TDataSet);
begin
  inherited;
  TCustomDADataSet(DataSet).Connection := TBCDbMSSQLDm(MainDm).DB;
end;

function TBCDbDsMSSQLDm.GetPropValDeleteSql: string;
begin
  result :=
    '  begin ' +
    '  pa_prop.del_e_dict_value(p_id => :id); ' +
    ' end; ';

end;

function TBCDbDsMSSQLDm.GetPropValInsertSql: string;
begin
  result :=
    'begin ' +
    '  :id := pa_prop.add_e_dict_value(p_order_num => :order_num,  ' +
    '                                      p_data_type_id => :data_type_id,  ' +
    '                                      p_s_value => :s_value,  ' +
    '                                      p_n_value => :n_value,  ' +
    '                                      p_d_value => :d_value,  ' +
    '                                      p_c_value => :c_value,  ' +
    '                                      p_b_value => :b_value); ' +
    'end; ';
end;

function TBCDbDsMSSQLDm.GetPropValUpdateSql: string;
begin
  result :=
    '  begin ' +
    '    pa_prop.edit_e_dict_value(p_id => :id,  ' +
    '                              p_order_num => :order_num,  ' +
    '                              p_data_type_id => :data_type_id,  ' +
    '                              p_s_value => :s_value,  ' +
    '                              p_n_value => :n_value,  ' +
    '                              p_d_value => :d_value,  ' +
    '                              p_c_value => :c_value,  ' +
    '                              p_b_value => :b_value);  ' +
    '   end; ';
end;

procedure TBCDbDsMSSQLDm.QuCustomDataSetBeforeUpdateExecute(Sender: TDataSet;
  StatementTypes: TStatementTypes; Params: TDAParams);
var i: Integer;
begin
  if TDataSet(Sender).State in [dsinsert, dsEdit] then
    for i := 0 to Params.Count - 1 do
    begin
      if Params[i].DataType in [ftOraClob] then
      begin
        Params[i].DataType := ftMemo;
      end;
      if Params[i].DataType in [ftOraBlob] then
      begin
        Params[i].Clear;
      end;
    end;
end;


procedure TBCDbDsMSSQLDm.DataModuleCreate(Sender: TObject);
var i: Integer;
begin
  inherited;
{  for i := 0 to ComponentCount - 1 do
    if Components[i] is TMSQuery then
    begin
      TMSQuery(Components[i]).AfterUpdateExecute := QuCustomDataSetAfterUpdateExecute;
      TMSQuery(Components[i]).BeforeUpdateExecute := QuCustomPermDataSetBeforeUpdateExecute;
    end;}
end;
{
procedure TBCDbDsMSSQLDm.QuCustomDataSetAfterUpdateExecute(
  Sender: TCustomMSDataSet; StatementTypes: TStatementTypes;
  Params: TMSParams);
var
  i, k: Integer;
  Field: TField;
begin
  if TDataSet(Sender).State = dsinsert then
    for i := 0 to Params.Count - 1 do
    begin
      if Params[i].ParamType = ptOutput then
      begin
        Field := TDataSet(Sender).FindField(Params[i].Name);
        if Field <> nil then Field.Value := Params[i].Value;
      end;
    end;
end;

procedure TBCDbDsMSSQLDm.QuCustomPermDataSetBeforeUpdateExecute(
  Sender: TCustomMSDataSet; StatementTypes: TStatementTypes;
  Params: TMSParams);
var i: Integer;
    ParamName,IndexName: string;
begin
  if stInsert in StatementTypes then
  begin
    IndexName:=UpperCase(TMSQuery(Sender).IndexFieldNames);  
    for i := 0 to Params.Count - 1 do
    begin
      ParamName:=UpperCase(Params[i].Name);
      if Pos(ParamName, IndexName) > 0
        then Params[i].ParamType := ptOutput;
    end;
  end;
end;
}

function TBCDbDsMSSQLDm.GetDataSetSQL(DataSet: TDataSet): string;
begin
  Result := TCustomDADataSet(DataSet).SQL.Text;
end;

function TBCDbDsMSSQLDm.GetDataSetParams(DataSet: TDataSet): TParams;
begin
  result:=TParams(TCustomDADataSet(DataSet).Params);
end;

procedure TBCDbDsMSSQLDm.ExecuteDataSet(DataSet: TDataSet);
begin
  inherited;
  TCustomDADataSet(DataSet).Execute;
end;

function TBCDbDsMSSQLDm.CloneDataSet(DataSetFrom: TDataSet;DataSetName:String=''): TDataSet;
var lDataSetName:string;
    i:Integer;
begin
  if DataSetName='' then lDataSetName:= DataSetFrom.Name +'Copy_'+ IntToStr(ListDataSet.Count) else lDataSetName:=DataSetName;

  result := GetNamedSQLDataSet(TMSQuery(DataSetFrom).SQL.Text
    , lDataSetName
    , TMSQuery(DataSetFrom).SQLInsert.Text
    , TMSQuery(DataSetFrom).SQLUpdate.Text, TMSQuery(DataSetFrom).SQLDelete.Text,
    TMSQuery(DataSetFrom).SQLRefresh.Text, '');
    TMSQuery(Result).Assign(DataSetFrom);
end;

end.

