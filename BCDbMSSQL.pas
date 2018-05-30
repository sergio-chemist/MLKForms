unit BCDbMSSQL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BCDb, DB, DBAccess, MsAccess, MemDS;

type
  TBCDbMSSQLDm = class(TBCDbDm)
    DB: TMSConnection;
    QFO: TMSQuery;
  protected
    function GetQFO: TDataSet; override;
    function OnSysConnect(var ConnectionInfo: string): Boolean; override;
    procedure OnSysDisConnect(var ConnectionInfo: string); override;
    function OnUserConnect(var ConnectionInfo: string): Boolean; override;
    procedure OnUserDisConnect(var ConnectionInfo: string); override;
  public
    procedure OpenSQL(aSQL: AnsiString); overload; override;
    procedure OpenSQL(aSQL: AnsiString; const Args: array of const); overload; override;
    procedure ExecSQL(aSQL: AnsiString); overload; override;
    procedure ExecSQL(aSQL: AnsiString; const Args: array of const); overload; override;
  end;

implementation

uses UtilsDataConvert, UtilsCommon;

{$R *.dfm}

procedure TBCDbMSSQLDm.ExecSQL(aSQL: AnsiString; const Args: array of const);
var
  i: integer;
  lParamName: string;
  lParamNum: integer;
begin
  QFO.SQL.Text := aSQL;
  if QFO.Params.Count > 0 then
  begin
    if High(Args) + 1 > QFO.Params.Count then
      raise Exception.Create('Ошибка функции OpenSQL: Количество значений параметров больше количества параметров' + #13#10 + aSQL);
    for i := 0 to QFO.Params.Count - 1 do
    begin
      lParamName := QFO.Params[i].Name;
      if UpperCase(lParamName[1] {copy(lParamName, 1, 1)}) <> 'P' then
        raise Exception.Create('Ошибка функции OpenSQL: Неверный формат имени параметра. ' + lParamName + #13#10 + aSQL);
      if Pos('_', lParamName) > 0 then
        lParamNum := StrToIntDef(copy(lParamName, 2, Pos('_', copy(lParamName, 2, Length(lParamName))) - 1), -1)
      else
        lParamNum := StrToIntDef(copy(lParamName, 2, Length(lParamName) - 1), -1);
      if lParamNum = -1 then
        raise Exception.Create('Ошибка функции OpenSQL: Неверный формат имени параметра. ' + lParamName + #13#10 + aSQL)
      else if lParamNum > High(Args) + 1 then
        QFO.Params[i].Value := null
      else
        QFO.Params[i].Value := ConvertToVariant(Args[lParamNum - 1]);
    end;
    QFO.Execute;
  end
  else
    ExecSQL(Format(aSQL, Args));
end;

procedure TBCDbMSSQLDm.ExecSQL(aSQL: AnsiString);
begin
  QFO.SQL.Text := aSQL;
  QFO.Execute;
end;

procedure TBCDbMSSQLDm.OpenSQL(aSQL: AnsiString; const Args: array of const);
var
  i: integer;
  lParamName: string;
  lParamNum: integer;
begin
  if QFO.SQL.Text <> (aSQL + #13#10) then
  begin
    QFO.Params.Clear;
    QFO.SQL.Text := aSQL;
  end
  else
    QFO.Close;
  if QFO.Params.Count > 0 then
  begin
    if High(Args) + 1 > QFO.Params.Count then
      raise Exception.Create('Ошибка функции OpenSQL: Количество значений параметров больше количества параметров' + #13#10 + aSQL);
    for i := 0 to QFO.Params.Count - 1 do
    begin
      lParamName := QFO.Params[i].Name;
      if UpperCase(lParamName[1] {copy(lParamName, 1, 1)}) <> 'P' then
        raise Exception.Create('Ошибка функции OpenSQL: Неверный формат имени параметра. ' + lParamName + #13#10 + aSQL);
      if Pos('_', lParamName) > 0 then
        lParamNum := StrToIntDef(copy(lParamName, 2, Pos('_', copy(lParamName, 2, Length(lParamName))) - 1), -1)
      else
        lParamNum := StrToIntDef(copy(lParamName, 2, Length(lParamName) - 1), -1);
      if lParamNum = -1 then
        raise Exception.Create('Ошибка функции OpenSQL: Неверный формат имени параметра. ' + lParamName + #13#10 + aSQL)
      else if lParamNum > High(Args) + 1 then
        QFO.Params[i].Value := null
      else
        QFO.Params[i].Value := ConvertToVariant(Args[lParamNum - 1]);
    end;
    QFO.Open;
  end
  else
    OpenSQL(Format(aSQL, Args));
end;

procedure TBCDbMSSQLDm.OpenSQL(aSQL: AnsiString);
begin
  QFO.SQL.Text := aSQL;
  QFO.Open;
end;

function TBCDbMSSQLDm.OnUserConnect(var ConnectionInfo: string): Boolean;
begin
  result := inherited OnUserConnect(ConnectionInfo);
  try
    if DB.Connected then exit;
    DB.Server := ConnectionParams.ParamValues['UserHost'];
    DB.Username := ConnectionParams.ParamValues['UserLogin'];
    DB.Password := ConnectionParams.ParamValues['UserPwd'];
    DB.Options.ApplicationName := Application.Name;
    DB.Database := ConnectionParams.ParamValues['UserSchema'];
    DB.Open;
    Result := DB.Connected;
    ConnectionInfo := ConnectionInfo + ConnectionName + ' User(' + Db.Server + '@' + Db.Database + '.' + Db.Username + ') Connected' + Chr(10) +
      Chr(13);
  except on E: Exception do
    begin
      ConnectionInfo := ConnectionInfo + ConnectionName + E.Message + Chr(10) + Chr(13);
      Result := False;
    end;
  end;

end;

function TBCDbMSSQLDm.OnSysConnect(var ConnectionInfo: string): Boolean;
begin
  result := inherited OnSysConnect(ConnectionInfo);
  try
    DB.Close; // We must apply new Connection Params, so DB must be disconnected
    if not DB.Connected then
    begin
      DB.Server := GetParamValue(ConnectionParams, 'SysHost', varString, '');
      DB.Username := GetParamValue(ConnectionParams, 'SysLogin', varString, '');
      DB.Password := GetParamValue(ConnectionParams, 'SysPwd', varString, '');
      DB.Options.ApplicationName := Application.Name;
      DB.Database := GetParamValue(ConnectionParams, 'SysSchema', varString, '');
      ConnectionInfo := ConnectionInfo + ConnectionName + ' Sys(' + DB.Server + '@' + DB.Database + '.' + DB.Username + ')' ;
      DB.Open;
      ConnectionInfo:=ConnectionInfo+': CONNECTED';
    end;
    Result := DB.Connected;
    //if Result then QFO.Connection:= DB; This is done in design time
  except on E: Exception do
    begin
      ConnectionInfo := ConnectionInfo+': CONNECTION ERROR (' + E.Message +')';
      Result := False;
    end;
  end;
end;

procedure TBCDbMSSQLDm.OnSysDisConnect(var ConnectionInfo: string);
begin
  inherited;
  try
    DB.Disconnect;
  except on E: Exception do
    begin
      ConnectionInfo := E.Message;
    end;
  end;
end;

procedure TBCDbMSSQLDm.OnUserDisConnect(var ConnectionInfo: string);
begin
  inherited;
  try
    Db.Disconnect;
  except on E: Exception do
    begin
      ConnectionInfo := E.Message;
    end;
  end;
end;

function TBCDbMSSQLDm.GetQFO: TDataSet;
begin
  Result := QFO;
end;

end.

