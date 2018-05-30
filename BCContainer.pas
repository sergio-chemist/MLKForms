unit BCContainer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DB,
  BCDb, BCRes, BCDbDs, Vcl.ValEdit, Vcl.Grids;

type
  TBCContainerFrame = class(TFrame)
    DS: TDataSource;
    FrameProp: TValueListEditor;
  private
    FGridDataSet: TDataSet;
    procedure SetGridDataSet(const Value: TDataSet);
    { Private declarations }
  public
    { Public declarations }
    MarkedItems: TStrings;
    MARKED_BRUSH_COLOR: Integer;
    MARKED_FONT: TFont;
    CustomDM: TBCDbDsDm;
    MainDm: TBCDbDm;
    ResourceModule: TBCResDm;
    KeyFieldsComaStr: string;
    KeyFields: TStrings;
    CustomDMName: string;
    Params: TParams;
  procedure Open;
  procedure SetDataSource;
  procedure SetResources;

  published
    property GridDataSet: TDataSet read FGridDataSet write SetGridDataSet;
  end;

implementation
uses BCException;

{$R *.dfm}

{ TBCContainerFrame }

procedure TBCContainerFrame.Open;
begin

end;

procedure TBCContainerFrame.SetDataSource;
var
  c: TComponent;
  GRIDDataSetName: string;
begin
  GridDataSet := nil;
  Params := CustomDM.Params;
  if Assigned(DS.DataSet) then
  begin
    GridDataSet := DS.DataSet;
  end else
  begin
    GRIDDataSetName := trim(FrameProp.Values['GRIDDataSetName']);
    if GRIDDataSetName = '' then
    begin
      TBCExceptionDlg.ShowException(Exception.Create('Не установлено свойство GRIDDataSet '
        + ' или не установлен DS.DataSet класса ' + ClassName));
    end else
    begin
      c := CustomDM.FindComponent(GRIDDataSetName);
      if (c <> nil) and (c is TDataSet) then
        GridDataSet := TDataSet(c)
      else
        TBCExceptionDlg.ShowException(Exception.Create(GRIDDataSetName + ' Не найден в модуле ' +
          CustomDm.ClassName));
    end;
  end;
end;

procedure TBCContainerFrame.SetResources;
begin
  if Assigned(ResourceModule) then
  begin
//    BarManager.ImageOptions.Images := ResourceModule.CustomListToolBar16;
//    BarManager.ImageOptions.LargeImages := ResourceModule.CustomListToolBar24;
//    CustomActionList.Images := ResourceModule.CustomListToolBar16;
//    UserActionList.Images := ResourceModule.UserListToolBar16;
//    SysActionList.Images := ResourceModule.CustomListToolBar16;
    if Assigned(ResourceModule) then
    begin
      with ResourceModule do
      begin
//        CreateStyleSheetsList(shtUserDefined);
//        CreateStyleSheetsList(shtPredefined);
      end;
      //SelectFistChild(shtUserDefined);
    end;
  end
end;

procedure TBCContainerFrame.SetGridDataSet(const Value: TDataSet);
begin
  FGridDataSet := Value;
end;

end.
