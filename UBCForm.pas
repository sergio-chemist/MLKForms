unit UBCForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, DB, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  System.Actions, Vcl.ActnList,
  BCCommon, BCContainer, BCRes, BCDbDs, BCDb;

type
  TBCForm = class(TForm)
    ActionList: TActionList;
    ActionShowSysInfo: TAction;
    ActionObjectInspector: TAction;
    ActionDebug: TAction;
    procedure ActionShowSysInfoExecute(Sender: TObject);
    procedure ActionDebugExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FOwnerObject: TComponent;
    procedure SetOwnerObject(const Value: TComponent);
    { Private declarations }
  protected
    FRequired: Boolean;
    FIsReadOnly: Boolean;
    FAction: TBCFormAction;
    FCaptionProp: string;
    ResourceModuleClassName: string;
    DataModuleClassName: string;
    procedure SetIsReadOnly(Value: boolean);
    procedure SetAction(const Value: TBCFormAction);
    procedure SetRequired(Value: boolean);
    procedure SetCaptionProp(const Value: string);
    procedure OnSetModule; virtual;
    procedure BeforeFrameOpen(Sender: TBCContainerFrame); virtual;
    { Protected declarations }
  public
    ResourceModule: TBCResDm;
    CustomDM: TBCDbDsDm;
    MainDm: TBCDbDm;
    Params: TParams;
    Checked: Boolean;
    NoDestroy: Boolean;
    NoShowModal: Boolean;
    ActionNameRus: string;
    function OnAction(Sender: TObject; DataSet: TDataSet): boolean; virtual;
    function ShowModal: Integer; override;
    procedure SetDataSource; virtual;
    procedure SetResources; virtual;

    property IsReadOnly: Boolean read FIsReadOnly write SetIsReadOnly;
    property Action: TBCFormAction read FAction write SetAction;
    property Required: Boolean read FRequired write SetRequired;
    property CaptionProp: string read FCaptionProp write SetCaptionProp;
    property OwnerObject: TComponent read FOwnerObject write SetOwnerObject;
    { Public declarations }
  end;

var
  BCForm: TBCForm;

implementation
uses UtilsCommon;

{$R *.dfm}

procedure OnSetModule(
          var Sender: TObject; var aResourceModule: TBCResDm; var aCustomDm: TBCDbDsDm;
          var aMainDm: TBCDbDm; ResourceModuleClassName: string;
          DataModuleClassName: string);
var
  c: TComponent;
begin
  c := nil;
  if not Assigned(aResourceModule) then
  begin
    if (ResourceModuleClassName <> '') then
      aResourceModule := TBCResDm(UtilsCommon.CreateComponentByClassName(ResourceModuleClassName,
        false));
    if not Assigned(aResourceModule) then
    begin
      c := UtilsCommon.GetFrameOrFormOwnerByObject(TObject(Sender));
      if (c <> nil) then
      begin
        if (c is TBCForm) then
          if Assigned(TBCForm(c).ResourceModule) then aResourceModule := TBCForm(c).ResourceModule;
        if (c is TBCContainerFrame) then
          if Assigned(TBCContainerFrame(c).ResourceModule) then
            aResourceModule := TBCContainerFrame(c).ResourceModule;
      end;
    end;
  end;

  if not (Assigned(aCustomDM)) then
  begin
    if (DataModuleClassName <> '') then
      aCustomDM := CreateDbDs(DataModuleClassName);
    if not Assigned(aCustomDM) then
    begin
      c := UtilsCommon.GetFrameOrFormOwnerByObject(TObject(Sender));
      if (c <> nil) then
      begin
        if (c is TBCForm) then
          if Assigned(TBCForm(c).CustomDm) then
          begin
            aCustomDm := TBCForm(c).CustomDm;
          end;
        if (c is TBCContainerFrame) then
          if Assigned(TBCContainerFrame(c).CustomDm) then
          begin
            aCustomDm := TBCContainerFrame(c).CustomDm;
          end;
      end;
    end;
  end;
  if Assigned(aCustomDm) then
  begin
    aMainDm := aCustomDm.MainDm;
    aCustomDM.ListLinkedForm.AddObject(TComponent(Sender).Name, Sender);
    if (Sender is TBCForm) then TBCForm(Sender).SetDataSource;
    if (Sender is TBCContainerFrame) then TBCContainerFrame(Sender).SetDataSource;
  end;
  if Assigned(aResourceModule) then
  begin
    if (Sender is TBCForm) then TBCForm(Sender).SetResources;
    if (Sender is TBCContainerFrame) then TBCContainerFrame(Sender).SetResources;
  end;
end;

procedure TBCForm.ActionDebugExecute(Sender: TObject);
begin
  ActionDebug.Checked := not ActionDebug.Checked;
end;

procedure TBCForm.ActionShowSysInfoExecute(Sender: TObject);
var
  aHostName: string;
  aIPAddress: string;
  aFormName: string;
  aSysText: string;
  i: Integer;
begin
  GetIPInfo(aHostName, aIPAddress);
  aFormName := Self.ClassName;
  aSysText := 'Имя копьютера: "' + aHostName + '"'#13#10 +
    'IP адрес: "' + aIPAddress + '"'#13#10 +
    'Имя класса текущей формы: ' + aFormName;

  for i := 0 to Application.ComponentCount - 1 do
    if Application.Components[i] is TDataModule then
    begin
      aSysText := aSysText + '"'#13#10 + Application.Components[i].Name + ':' +
        Application.Components[i].ClassName;
    end;

  MessageDlg(aSysText, mtInformation, [mbOk], 0);
end;

procedure TBCForm.BeforeFrameOpen(Sender: TBCContainerFrame);
begin

end;

procedure TBCForm.FormCreate(Sender: TObject);
begin
  Params := TParams.Create;
end;

procedure TBCForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Params);
end;

function TBCForm.OnAction(Sender: TObject; DataSet: TDataSet): boolean;
var
  i: Integer;
begin
  OwnerObject := TComponent(Sender);
  OnSetModule;
  Result := False;
  if Action = acSHOW then
  begin
    NoDestroy := True;
    Result := True;
    Show;
  end;
  if Action = AcMainFormStart then
  begin
    NoDestroy := True;
    Result := True;
  end;
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TBCContainerFrame) then
    begin
      BeforeFrameOpen(TBCContainerFrame(Components[i]));
      TBCContainerFrame(Components[i]).Open;
    end;
  end;
end;

procedure TBCForm.OnSetModule;
begin
  BCCommon.OnSetModule(TObject(Self), ResourceModule, CustomDM, MainDm, ResourceModuleClassName,
    DataModuleClassName);
end;

procedure TBCForm.SetAction(const Value: TBCFormAction);
begin
  FAction := Value;
  ActionNameRus := BCCommon.ActionToNameRus(Value);
end;

procedure TBCForm.SetCaptionProp(const Value: string);
begin
  if Caption = '' then
    FCaptionProp := Value
  else
    FCaptionProp := Caption;
  Caption := ActionNameRus + ' : ' + FCaptionProp;
end;

procedure TBCForm.SetDataSource;
begin
  if Assigned(CustomDM) and not Assigned(MainDm) then MainDm := CustomDM.MainDm;
end;

procedure TBCForm.SetIsReadOnly(Value: boolean);
var
  i: integer;
  C: TComponent;
begin
  FIsReadOnly := Value;
  for i := 0 to ComponentCount - 1 do
  begin
    c := Components[i];
    UtilsCommon.SetControlProp(c, 'ReadOnly', Value);
  end;
end;

procedure TBCForm.SetOwnerObject(const Value: TComponent);
begin
  FOwnerObject := Value;
end;

procedure TBCForm.SetRequired(Value: boolean);
var
  i: integer;
  C: TComponent;
begin
  FRequired := Value;
  if Value and not (Action = acCOPY) then
    for i := 0 to ComponentCount - 1 do
    begin
      c := Components[i];
      UtilsCommon.SetControlProp(c, 'Required', Value);
    end;
end;

procedure TBCForm.SetResources;
begin

end;

function TBCForm.ShowModal: Integer;
var
  ActWind: THandle;
begin
  ActWind := 0;
  if Assigned(Screen.ActiveForm) then
  try
    ActWind := Screen.ActiveForm.Handle;
    SendMessage(ActWind, CM_DEACTIVATE, 0, 0);
  except
    Result := 0;
  end;
  Result := inherited ShowModal;
  if ActWind <> 0 then
    SendMessage(ActWind, CM_ACTIVATE, 0, 0);
end;

initialization
  RegisterClass(TBCForm);

finalization
  UnRegisterClass(TBCForm);

end.
