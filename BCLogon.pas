unit BCLogon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ActnList, DB, IniFiles, Vcl.Imaging.jpeg;

type
  TBCLogonDlg = class(TForm)
    EditName: TEdit;
    LabelPwd: TLabel;
    EditPwd: TEdit;
    LabelHost: TLabel;
    ComboBoxHost: TComboBox;
    Bevel: TBevel;
    ButtonOK: TButton;
    ButtonCancel: TButton;
    ImgLogin: TImage;
    procedure ActionShowHideHostExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
  private
    FShowLogin: Boolean;
    procedure SetShowLogin(const Value: Boolean);
  private
    FShowHost: Boolean;
    Ini: TIniFile;
    ConnectionParams: TParams;
    procedure SetShowHost(aShowHost: Boolean);
    function FillInstanceList: Integer;
    procedure LoadLoginParam;
    procedure SaveLoginParam;
    function IsLogin(const ConnectParams: TParams): Boolean;
    property ShowHost: Boolean read FShowHost write SetShowHost;
    property ShowLogin:Boolean read FShowLogin write SetShowLogin;
  public
    ConnectionName: string;
    ConnectDialog: Boolean;
    SysConnect: Boolean;
    IsDefault: Boolean;
    SaveLogin: Boolean;
    SaveHost: Boolean;
    OnlyOnline:Boolean;
    SysLogin: string;
    SysHost: string;
    SysPwd: string;
    SysSchema: string;
    UserLogin: string;
    UserHost: string;
    UserPwd: string;
    UserSchema: string;
    InstanceName: string;
    DefaultInstanceName: string;
    InstanceTitle: string;
    InstanceList: TStrings;
    DbParamIniFileName,DbDefaultParamIniFileName:String;
    class function Logon(const ConnectionParams: TParams): Boolean;
  end;

implementation

uses UtilsCommon;

{$R *.dfm}

class function TBCLogonDlg.Logon(const ConnectionParams: TParams): Boolean;
var
  Dlg: TBCLogonDlg;
begin
  Dlg := Create(Application);
  try
    Result:= Dlg.IsLogin(ConnectionParams);
  finally
    FreeAndNil(Dlg);
  end;
end;

function TBCLogonDlg.IsLogin(const ConnectParams: TParams): Boolean;
begin
  ConnectionParams := ConnectParams;
  ShowHost := True;
  DbDefaultParamIniFileName:= UtilsCommon.GetParamValue(ConnectionParams,'DbDefaultParamIniFileName',varString,'');
  DbParamIniFileName:= UtilsCommon.GetParamValue(ConnectionParams,'DbParamIniFileName',varString,'');
  if (DbDefaultParamIniFileName<>'') then DbDefaultParamIniFileName:= ExpandFileName(DbDefaultParamIniFileName);
  if (DbParamIniFileName<>'') then DbParamIniFileName:= ExpandFileName(DbParamIniFileName);
  Ini := TIniFile.Create(DbParamIniFileName);
  InstanceList := TStringList.Create;
  ConnectionName := ConnectionParams.ParamByName('ConnectionName').AsString;
  ConnectDialog := Ini.ReadBool(ConnectionName + '.' + 'Prop', 'ConnectDialog', true);
  SaveLogin := Ini.ReadBool(ConnectionName + '.' + 'Prop', 'SaveLogin', true);
  SaveHost := Ini.ReadBool(ConnectionName + '.' + 'Prop', 'SaveHost', true);
  ShowLogin := Ini.ReadBool(ConnectionName + '.' + 'Prop', 'ShowLogin', true);
  OnlyOnline := Ini.ReadBool(ConnectionName + '.' + 'Prop', 'OnlyOnline', True);
  LoadLoginParam;
  FillInstanceList;
  if InstanceName = '' then
    InstanceName := DefaultInstanceName
  else
    ComboBoxHost.ItemIndex := InstanceList.IndexOfName(InstanceName);
  if InstanceName = '' then InstanceName := 'INIT_NULL_PARAM';
  IniSectionToParams(DbParamIniFileName, ConnectionName + '.' + InstanceName, ConnectionParams);
  if ConnectDialog then
  begin
    if UserLogin <> '' then
      EditName.Text := UserLogin
    else
      EditName.Text := GetParamValue(ConnectionParams, 'UserLogin', varString,'');
    EditPwd.Text := '';
    Visible:= False;
    Result := (ShowModal = mrOk);
    if Result then
    begin
      InstanceName:= InstanceList.Names[ComboBoxHost.ItemIndex];
      IniSectionToParams(DbParamIniFileName, ConnectionName + '.' + InstanceName, ConnectionParams);
      SetParamValue(ConnectionParams, 'UserLogin', EditName.Text);
      SetParamValue(ConnectionParams, 'UserPwd', EditPwd.Text);
      SaveLoginParam;
    end;
  end
  else
  begin
    Result := True;
    SaveLoginParam;
  end;
end;

procedure TBCLogonDlg.SetShowHost(aShowHost: Boolean);
begin
  FShowHost := aShowHost;
  if FShowHost then
  begin
    //Height := 600;
    LabelHost.Visible := true;
    ComboBoxHost.Visible := true;
  end
  else
  begin
    //Height := 500;
    LabelHost.Visible := false;
    ComboBoxHost.Visible := false;
  end;
end;

procedure TBCLogonDlg.ActionShowHideHostExecute(Sender: TObject);
begin
  ShowHost := not ShowHost;
end;

procedure TBCLogonDlg.FormShow(Sender: TObject);
begin
  if (EditName.Text = '') and EditName.Visible then
    ActiveControl := EditName
  else
    ActiveControl := EditPwd;
end;


function TBCLogonDlg.FillInstanceList: Integer;
var
  lInstanceList: TStrings;
  lInstanceTitle: string;
  i, k: Integer;
  lIsDefault, InstanceEnable: Boolean;
begin
  lInstanceList := TStringList.Create;
  DefaultInstanceName := '';
  result := -1;
  try
    Ini.ReadSectionValues(ConnectionName, lInstanceList);
    for i := 0 to lInstanceList.Count - 1 do
    begin
      InstanceEnable := (lInstanceList.Values[lInstanceList.Names[i]] = '-1');
      if InstanceEnable then
      begin
        lInstanceTitle := Ini.ReadString(ConnectionName + '.' + lInstanceList.Names[i], 'Title', '');
        lIsDefault := Ini.ReadBool(ConnectionName + '.' + lInstanceList.Names[i], 'Default', false);
        k := ComboBoxHost.Items.Add(lInstanceTitle);
        InstanceList.Add(lInstanceList.Names[i] + '=' + lInstanceTitle);
        if lIsDefault then
        begin
          DefaultInstanceName := lInstanceList.Names[i];
          Result := k;
          ComboBoxHost.ItemIndex := Result;
        end;
      end;
    end;
  finally
    lInstanceList.Free;
  end;
end;

procedure TBCLogonDlg.SaveLoginParam;
var
  IniDef: TiniFile;
begin
  IniDef := TIniFile.Create(DbDefaultParamIniFileName);
  try
    if SaveLogin then IniDef.WriteString(ConnectionName, 'UserLogin', GetParamValue(ConnectionParams, 'UserLogin', varString,''));
    if SaveHost then IniDef.WriteString(ConnectionName, 'InstanceName', InstanceName);
  finally
    IniDef.Free;
  end;
end;

procedure TBCLogonDlg.LoadLoginParam;
var
  IniDef: TiniFile;
begin
  IniDef := TIniFile.Create(DbDefaultParamIniFileName);
  try
    InstanceName := IniDef.ReadString(ConnectionName, 'InstanceName', DefaultInstanceName);
    UserLogin := IniDef.ReadString(ConnectionName, 'UserLogin', '');
  finally
    IniDef.Free;
  end;
end;

procedure TBCLogonDlg.SetShowLogin(const Value: Boolean);
begin
  FShowLogin := Value;
//  EditName.Visible:= FShowLogin;
//  EditName.Enabled:=Value;
end;

procedure TBCLogonDlg.ButtonOKClick(Sender: TObject);
begin
  inherited;
//  ShowMessage('Fuck');
end;


end.

