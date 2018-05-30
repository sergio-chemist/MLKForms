unit BCCommon;

interface
uses
  Classes, DB, Windows, Graphics, SysUtils, UtilsCommon, Forms, Dialogs, Controls,
  BCDbDs, BCRes, BCDb;

type
  TSearchParamRec = record
    sSearchText: string;
    sSearchFieldName: string;
    bForward: boolean;
    bCaseSensitive: boolean;
  end;

  TcxStyleRepositoryType = (shtNone, shtPredefined, shtUserDefined);
  TSelectStyle = (ssList, ssSelect);
  TBCFormAction = (acAdd, acAudit, acCopy, acDelete, acEdit, AcView, AcSelect, AcShow,
    AcUnknown, AcMainFormStart);
  TBCMarkAction = (maInvert, maMark, maUnMark, maMarkAll, maUnMarkAll);

  TDataSetSelectEvent = procedure(DataSet: TDataSet; KeyValues: Variant) of object;

function ActionToNameRus(pAction: TBCFormAction): string;
function CreateDbDs(aDataModuleClassName: string): TBCDbDsDm;
procedure OnSetModule(
          var Sender: TObject; var aResourceModule: TBCResDm;
          var aCustomDm: TBCDbDsDm; var aMainDm: TBCDbDm;
          ResourceModuleClassName: string;
          DataModuleClassName: string);
function GetObjectDataModule(Sender: TObject): TBCDbDsDm;

var
  ListDbDs: TStrings;

implementation
uses DBGrids, BCContainer, DBCtrls, UBCForm;

function ActionToNameRus(pAction: TBCFormAction): string;
begin
  case pAction of
    acAdd: result := 'Создать';
    acAudit: result := 'Аудит';
    acCopy: result := 'Копировать';
    acDelete: result := 'Удалить';
    acEdit: result := 'Редактировать';
    AcView: result := 'Просмотр';
    AcSelect: result := 'Выбор';
    AcShow: result := 'Журнал';
  else ;
    result := 'Форма';
  end;
end;

function CreateDbDs(aDataModuleClassName: string): TBCDbDsDm;
var
  ModuleIndex: Integer;
  C: TComponent;
begin
  if not Assigned(ListDbDs) then ListDbDs := TStringList.Create;
  C := UtilsCommon.CreateComponentByClassName(aDataModuleClassName, false);
  ModuleIndex := ListDbDs.IndexOfObject(C);
  if ModuleIndex = -1 then
  begin
    result := TBCDbDsDm(C);
    if Result <> nil then ListDbDs.AddObject(C.Name, Result);
  end else result := TBCDbDsDm(ListDbDs.Objects[ModuleIndex]);
end;

procedure OnSetModule(
          var Sender: TObject; var aResourceModule: TBCResDm;
          var aCustomDm: TBCDbDsDm; var aMainDm: TBCDbDm;
          ResourceModuleClassName: string;
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

function GetObjectDataModule(Sender: TObject): TBCDbDsDm;
var
  OwnerObj: TComponent;
begin
  result := nil;
  OwnerObj := UtilsCommon.GetFrameOrFormOwnerByObject(Sender);
  if OwnerObj is TForm then result := TBCForm(OwnerObj).CustomDm;
  if OwnerObj is TFrame then result := TBCContainerFrame(OwnerObj).CustomDm;
end;

initialization

finalization
  if Assigned(ListDbDs) then FreeAndNil(ListDbDs);

end.
