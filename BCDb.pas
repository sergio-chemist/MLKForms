unit BCDb;

interface

uses
  SysUtils, Classes, Data.DB, Controls, Forms;

type
  TBCDbDm = class(TDataModule)
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    FConnect: boolean;
    FUserConnect: boolean;
    FSysConnect: boolean;
    FQFO: TDataSet;
  protected
    procedure SetUserConnect(const Value: boolean); virtual;
    procedure SetConnect(const Value: boolean); virtual;
    procedure SetSysConnect(const Value: boolean); virtual;
    function DecodeConnStr(const aConnStr: AnsiString; var aUser, aPwd, aHost: AnsiString): boolean;
    function OnConnect(var ConnectionInfo: string): Boolean; virtual;
    function OnUserConnect(var ConnectionInfo: string): Boolean; virtual;
    procedure OnUserDisConnect(var ConnectionInfo: string); virtual;
    function OnSysConnect(var ConnectionInfo: string): Boolean; virtual;
    procedure OnSysDisConnect(var ConnectionInfo: string); virtual;
    function GetQFO: TDataSet;virtual;
  public
    ConnectionName: string;
    ConnectionInfo: string;
    DbDefaultParamIniFileName: string;
    DbParamIniFileName: string;
//    InstanceName: string;
    SPID: Integer;
    OnlyOnline: Boolean;
    ConnectionParams: TParams;
    property SysConnect: boolean read FSysConnect write SetSysConnect;
    property UserConnect: boolean read FUserConnect write SetUserConnect;
    property Connect: boolean read FConnect write SetConnect;
    procedure OpenSQL(aSQL: AnsiString); overload; virtual;
    procedure OpenSQL(aSQL: AnsiString; const Args: array of const); overload; virtual;
    procedure ExecSQL(aSQL: AnsiString); overload; virtual;
    procedure ExecSQL(aSQL: AnsiString; const Args: array of const); overload; virtual;
    function GetUserConnectParam(var ConnectionInfo: string): Boolean; virtual;
    property QFO:TDataSet read GetQFO write FQFO;    
  end;

implementation

uses
  BCLogon, Dialogs, Variants, UtilsCommon
  ,BCException
  , IdGlobal;

{$R *.dfm}

{TBCDbDm}

function TBCDbDm.DecodeConnStr(const aConnStr: AnsiString; var aUser, aPwd, aHost: AnsiString): boolean;
var
  sPos, aPos: integer;
begin
  sPos := Pos('/', aConnStr);
  aPos := Pos('@', aConnStr);
  if (sPos = 0) or (aPos = 0) then
  begin
    result := false;
    Exit;
  end;
  aUser := Copy(aConnStr, 1, sPos - 1);
  aPwd := Copy(aConnStr, sPos + 1, aPos - sPos - 1);
  aHost := Copy(aConnStr, aPos + 1, Length(aConnStr) - aPos);
  if (aUser <> '') and (aPwd <> '') and (aHost <> '') then
    Result := true
  else
    Result := false;
end;

procedure TBCDbDm.SetConnect(const Value: boolean);
var
  NumAttempts: integer;
  CancelRegistration, IsConnect: Boolean;
begin
  if Value = FConnect then Exit;
  if Value = false then
  begin
    UserConnect := False;
    SysConnect := False;
    Exit;
  end;
  CancelRegistration := false;
  IsConnect := False;
  NumAttempts := 0;
  while (not CancelRegistration) and not IsConnect do
  begin
    CancelRegistration := not TBCLogonDlg.Logon(ConnectionParams);
    if not CancelRegistration then
    begin
      IsConnect := (OnConnect(ConnectionInfo));
    end;
    if NumAttempts >= 3 then
    begin
      CancelRegistration := true;
      IsConnect := False;
    end;
    NumAttempts := NumAttempts + 1;
  end;
  FConnect := IsConnect;
  if {OnlyOnline and }not FConnect then
  begin
    OnSysDisConnect(ConnectionInfo);
    OnUserDisConnect(ConnectionInfo);
  end;
end;

procedure TBCDbDm.SetSysConnect(const Value: boolean);
begin
  if Value then
    FSysConnect := OnSysConnect(ConnectionInfo)
  else
  begin
    OnSysDisConnect(ConnectionInfo);
    FSysConnect := false;
  end;
end;

procedure TBCDbDm.SetUserConnect(const Value: boolean);
begin
  if Value then
    FUserConnect := OnUserConnect(ConnectionInfo)
  else
  begin
    OnUserDisConnect(ConnectionInfo);
    FUserConnect := false;
  end;
end;

procedure TBCDbDm.DataModuleDestroy(Sender: TObject);
begin
  if Assigned(ConnectionParams) then  ConnectionParams.Free;
end;

procedure TBCDbDm.ExecSQL(aSQL: AnsiString; const Args: array of const);
begin
  //Abstract method
end;

procedure TBCDbDm.ExecSQL(aSQL: AnsiString);
begin
  //Abstract method
end;

procedure TBCDbDm.OpenSQL(aSQL: AnsiString; const Args: array of const);
begin
  //Abstract method
end;

procedure TBCDbDm.OpenSQL(aSQL: AnsiString);
begin
  //Abstract method
end;

function TBCDbDm.OnUserConnect(var ConnectionInfo: string): Boolean;
begin
  result:=False;
end;

function TBCDbDm.OnSysConnect(var ConnectionInfo: string): Boolean;
begin
  result:=False;
end;

procedure TBCDbDm.OnSysDisConnect(var ConnectionInfo: string);
begin
  //Abstract method
end;

procedure TBCDbDm.OnUserDisConnect(var ConnectionInfo: string);
begin
  //Abstract method
end;

procedure TBCDbDm.DataModuleCreate(Sender: TObject);
begin
  ConnectionParams := TParams.Create;
  ConnectionName := Name;
  UtilsCommon.SetParamValue(ConnectionParams, 'ConnectionName', ConnectionName);
  DbDefaultParamIniFileName := ExtractFilePath(ParamStr(0)) + 'DBParamDefault.ini';
  DbParamIniFileName := ExtractFilePath(ParamStr(0)) + 'DBParam.ini';
  UtilsCommon.SetParamValue(ConnectionParams, 'DbDefaultParamIniFileName', DbDefaultParamIniFileName);
  UtilsCommon.SetParamValue(ConnectionParams, 'DbParamIniFileName', DbParamIniFileName);
end;

function TBCDbDm.GetUserConnectParam(var ConnectionInfo: string): Boolean;
begin
  result := False;
end;

function TBCDbDm.OnConnect(var ConnectionInfo: string): Boolean;
begin
  Result := False;
  try
    Result := OnSysConnect(ConnectionInfo);
    if Result then
    begin
      Result:= GetUserConnectParam(ConnectionInfo);
      if Result then
      begin
        SysConnect := False;
        Result := OnUserConnect(ConnectionInfo);
      end;
    end;
    if not Result then  raise Exception.Create('Ошибка подключения к серверу'+eol+ConnectionInfo);
  except on E: Exception do
    begin
      Result := False;
      TBCExceptionDlg.ShowException(E);
    end;
  end;
end;

function TBCDbDm.GetQFO: TDataSet;
begin
  result:=nil;
end;

end.

