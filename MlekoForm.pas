unit MlekoForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, UBCForm, MlkData, MlekoDbDsMSSQL, MlekoRes, System.Actions;

type
  TMlekoForm = class(TBCForm)
    ActionBlockForm: TAction;
    procedure FormShow(Sender: TObject);
    procedure ActionBlockFormExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure OnSetModule; override;
  public
    MLKCustomDm: TMlekoDbDsMSSQLDm;
    MLKMainDm: TdmDataModule;
    MLKResDm: TMlekoResDm;
  end;

implementation
uses DmCommon;

{$R *.dfm}

procedure TMlekoForm.OnSetModule;
begin
  DataModuleClassName := 'TMlekoDbDsMSSQLDm';
  ResourceModuleClassName := 'TMlekoResDm';
  inherited;
end;

procedure TMlekoForm.FormShow(Sender: TObject);
begin
  inherited;
{  dmDataModule.OpenSQL('select 1 from AUDIT_RUN_FORM where UserNo= :p1_id and CLASS_NAME= :p2_id', [data.UserNo, ClassName]);
  if dmDataModule.QFO.Eof then
    dmDataModule.ExecSQL('insert into AUDIT_RUN_FORM(UserNo,Class_Name,Run_Count,Last_Run) Values(:p1_id,:p2_id,1,GetDate())', [data.UserNo,
      ClassName])
  else
    dmDataModule.ExecSQL('Update AUDIT_RUN_FORM set Run_Count=Run_Count+1,Last_Run=GetDate() where UserNo= :p1_id and CLASS_NAME= :p2_id',
      [data.UserNo, ClassName]);
 }
end;

procedure TMlekoForm.ActionBlockFormExecute(Sender: TObject);
begin
  inherited;
  //if TMlekoPropDbBlockAppDlg.Block then Exit;
end;

procedure TMlekoForm.FormCreate(Sender: TObject);
begin
  inherited;
  if Assigned(fmMain.MainDm) then
  begin
    if not Assigned(MainDM) then MainDM := fmMain.MainDm;
    MLKMainDm := TdmDataModule(MainDM);
  end;
  if Assigned(fmMain.CustomDM) then
  begin
    if not Assigned(CustomDM) then CustomDM := fmMain.CustomDM;
    MLKCustomDm := TMlekoDbDsMSSQLDm(CustomDM);
  end;
  if Assigned(fmMain.ResourceModule) then
  begin
    if not Assigned(ResourceModule) then ResourceModule := fmMain.ResourceModule;
    MLKResDm := TMlekoResDm(ResourceModule);
  end;
end;

end.

