unit CFLMLKMDIChild;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm, CFLMLKCustom,
  Dialogs, ActnList, Menus, ToolWin, ComCtrls, System.Actions;

type
  TCFLMLKMDIChildForm = class(TCFLMLKCustomForm)
    StatusBar: TStatusBar;
    ToolBar: TToolBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    FDisableActions: boolean;
  protected
    ActiveSession: string;
    FActionExecRightList: TStringList;
  public
    class procedure ShowForm(const MultiCopy: boolean); overload; virtual;
    class procedure ShowForm(const MultiCopy: boolean; var NewForm: TCFLMLKMDIChildForm; var IsNew: boolean); overload; virtual;
    property DisableActions: boolean read FDisableActions write FDisableActions default false;
  end;

var
  CFLMLKMDIChildForm: TCFLMLKMDIChildForm;

implementation

uses MlkData; //, MlkComponentProps;

{$R *.dfm}

class procedure TCFLMLKMDIChildForm.ShowForm(const MultiCopy: boolean);
var
  i: integer;
  IsFormExist: boolean;
  ExistsForm: TMlekoForm;
begin
  IsFormExist := false;
  for i := 0 to Application.ComponentCount - 1 do
    if Application.Components[i].ClassNameIs(ClassName) then
    begin
      IsFormExist := true;
      ExistsForm := (Application.Components[i] as TMlekoForm);
    end;

  if MultiCopy or not IsFormExist then
    Create(Application)
  else
    ExistsForm.Show;
end;

class procedure TCFLMLKMDIChildForm.ShowForm(const MultiCopy: boolean; var NewForm: TCFLMLKMDIChildForm; var IsNew: boolean);
var
  i: integer;
  IsFormExist: boolean;
  ExistsForm: TMlekoForm;
begin
  IsFormExist := false;
  for i := 0 to Application.ComponentCount - 1 do
    if Application.Components[i].ClassNameIs(ClassName) then
    begin
      IsFormExist := true;
      ExistsForm := (Application.Components[i] as TMlekoForm);
      NewForm := (Application.Components[i] as TCFLMLKMDIChildForm)
    end;
  IsNew := not IsFormExist;
  if MultiCopy or not IsFormExist then
    NewForm := Create(Application)
  else
    ExistsForm.Show;
end;

procedure TCFLMLKMDIChildForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: integer;
begin
  inherited;
  if Screen.ActiveForm <> self then
    Action := caNone
  else
    Action := caFree;
end;

procedure TCFLMLKMDIChildForm.FormCreate(Sender: TObject);
var
  i: integer;
begin
  inherited;
//  for i := 0 to ComponentCount - 1 do
//    if (Components[i] is TcitComponentProps) then
//      if TcitComponentProps(Components[i]).Enabled then
//      begin
//        TcitComponentProps(Components[i]).DefaultUser := IntToStr(data.UserNo);
//        TcitComponentProps(Components[i]).RestoreFromStorage;
//      end;
end;

end.

