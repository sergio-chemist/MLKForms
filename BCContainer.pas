unit BCContainer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BCFrame, DB, VirtualTable, Menus,
  //COMPSQLBuilder,
  cxControls, cxSplitter, Grids,
  DBGrids, ExtCtrls,
  ActnList, BCDbDs, MemDS, ValEdit, cxStyles,
  cxInplaceContainer, cxVGrid, cxDBVGrid, cxPropertiesStore, cxGraphics,
  cxTL, cxDBTL,
  dxBar,
  cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxGridCustomPopupMenu,
  cxGridPopupMenu, cxFilterControl, cxDBFilterControl, cxPC, cxEdit,
  cxDataStorage, cxDBData, BCCommon, BCDb, BCRes, cxClasses,
  cxLookAndFeelPainters, StdCtrls, cxButtons, DBGridEh, dxBarBuiltInMenu, cxLookAndFeels,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, System.Actions, EhLibVCL, GridsEh,
  DBAxisGridsEh, MLKIntf;
type
  TcxCustomRowAccess = class(TcxCustomRow);

type
  TBCContainerFrame = class(TBCFrame, IBCFrame, IBCContainerFrame)
    CustomActionList: TActionList;
    SysActionList: TActionList;
    ActionShowSysInfo: TAction;
    ActionObjectInspector: TAction;
    ActionExecSql: TAction;
    ActionDebugAll: TAction;
    ActionShowSysBar: TAction;
    UserActionList: TActionList;
    PageSettings: TCxPageControl;
    TabProp1: TCxTabSheet;
    TabProp2: TCxTabSheet;
    FrameProp: TValueListEditor;
    vgStyleSheets: TcxVerticalGrid;
    vgStyleSheetsNone: TcxCategoryRow;
    vgStyleSheetsUserDefinedStyleSheets: TcxCategoryRow;
    vgStyleSheetsPredefinedStyleSheets: TcxCategoryRow;
    actLoadStyle: TAction;
    actSaveStyle: TAction;
    actEditStyle: TAction;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    SplitterSettings: TcxSplitter;
    ActionShowSettings: TAction;
    BarManager: TdxBarManager;
    ToolBarSystem: TdxBar;
    BarGroupSystemDebug: TdxBarGroup;
    BBtnShowSysInfo: TdxBarButton;
    BBtnObjectInspector: TdxBarButton;
    BBtnExecSQL: TdxBarButton;
    BBtnDebugAll: TdxBarButton;
    BarGroupSystemInfo: TdxBarGroup;
    ToolBarAction: TdxBar;
    ToolBarPanels: TdxBar;
    ToolBarCustomer: TdxBar;
    BBtnShowSettings: TdxBarButton;
    BarDockControlCommon: TdxBarDockControl;
    BarDockControlSystem: TdxBarDockControl;
    BarDockControlDetailsStyle: TdxBarDockControl;
    ToolBarDetailsStyle: TdxBar;
    BBtnSaveStyle: TdxBarButton;
    BBtnEditStyle: TdxBarButton;
    BBtnLoadStyle: TdxBarButton;
    PropStore: TcxPropertiesStore;
    DS: TDataSource;
    ActionItemAdd: TAction;
    ActionItemProp: TAction;
    ActionItemDel: TAction;
    ActionViewRefresh: TAction;
    ActionViewLayout: TAction;
    PageControlTop: TCxPageControl;
    tsMainFilter: TCxTabSheet;
    PanelGrid: TPanel;
    ActionViewFilter: TAction;
    ActionViewFilterOff: TAction;
    PopupMenuGrid: TPopupMenu;
    pmiInsert: TMenuItem;
    pmiProp: TMenuItem;
    pmiDelete: TMenuItem;
    mniDiv1: TMenuItem;
    pmiRefresh: TMenuItem;
    pmiLayout: TMenuItem;
    mniDiv2: TMenuItem;
    pmiClearFilter: TMenuItem;
    ActionRowSelect: TAction;
    pmiRowSelect: TMenuItem;
    ActionDebug: TAction;
    ActionFind: TAction;
    ActionFindNext: TAction;
    ActionFindReverse: TAction;
    ActionShowContextValues: TAction;
    ActionItemsClear: TAction;
    ActionItemCopy: TAction;
    ActionMark: TAction;
    ActionMarkAll: TAction;
    ActionViewSqlBuilder: TAction;
    mniActionShowSysBar: TMenuItem;
    ActionItemAudit: TAction;
    ActionItemView: TAction;
    ActionExportToExcel: TAction;
    DSSelection: TDataSource;
    PageExt: TCxPageControl;
    TabSelection: TCxTabSheet;
    SplitterExt: TcxSplitter;
    DBGridSelection: TDBGridEh;
    ActionShowDetails: TAction;
    ActionMarkInverse: TAction;
    ActionUnMarkAll: TAction;
    ActionExpandAll: TAction;
    ActionCollapceAll: TAction;
    ActionItemPrint: TAction;
    ActionItemState: TAction;
    VTSelection: TVirtualTable;
    ActionShowMarked: TAction;
    PageDetails: TCxPageControl;
    TabDetails1: TCxTabSheet;
    SplitterDetails: TcxSplitter;
    GridDetails: TcxDBVerticalGrid;
    BBtnDebug: TdxBarButton;
    BBtnViewSQL: TdxBarButton;
    BBtnItemAdd: TdxBarButton;
    BBtnItemProp: TdxBarButton;
    BBtnItemView: TdxBarButton;
    BBtnItemDel: TdxBarButton;
    BBtnItemsClear: TdxBarButton;
    BBtnItemAudit: TdxBarButton;
    BBtnItemCopy: TdxBarButton;
    PopMenuGRID: TcxGridPopupMenu;
    BBtnShowMarked: TdxBarButton;
    BBtnShowDetails: TdxBarButton;
    BBtnViewLayout: TdxBarButton;
    BBtnMark: TdxBarButton;
    BBtnMarkAll: TdxBarButton;
    BBtnMarkInverse: TdxBarButton;
    BBtnUnMarkAll: TdxBarButton;
    ToolBarGRIDView: TdxBar;
    BBtnExpandAll: TdxBarButton;
    BBtnCollapseAll: TdxBarButton;
    BBtnViewRefresh: TdxBarButton;
    BarSubItemMark: TdxBarSubItem;
    BarSubItemGridRowView: TdxBarSubItem;
    ToolBarExport: TdxBar;
    BBtnExport: TdxBarButton;
    BarSubItemExport: TdxBarSubItem;
    tsDynamicFilter: TcxTabSheet;
    SplFilter: TcxSplitter;
    ActionShowFilter: TAction;
    bbtnShowFilter: TdxBarButton;
    ActionFltLoad: TAction;
    ActionFltSave: TAction;
    ActionFltApply: TAction;
    ActionFltCancel: TAction;
    ToolBarFilter: TdxBar;
    BBtnFltLoad: TdxBarButton;
    BBtnFltSave: TdxBarButton;
    BBtnFltApply: TdxBarButton;
    BBtnFltCancel: TdxBarButton;
    BarDockControlFlt: TdxBarDockControl;
    DbFltControlMain: TcxFilterControl;
    ActionScriptExecute: TAction;
    BBtnScriptExecute: TdxBarButton;
    procedure ActionViewRefreshExecute(Sender: TObject);
    procedure ActionViewLayoutExecute(Sender: TObject);
    procedure ActionViewFilterOffExecute(Sender: TObject);
    procedure ActionRowSelectExecute(Sender: TObject);
    procedure ActionDebugExecute(Sender: TObject);
    procedure ActionItemsClearExecute(Sender: TObject);
    procedure ActionViewSqlBuilderExecute(Sender: TObject);
    procedure ActionItemDelExecute(Sender: TObject);
    procedure ActionItemPropExecute(Sender: TObject);
    procedure ActionItemAddExecute(Sender: TObject);
    procedure ActionItemCopyExecute(Sender: TObject);
    procedure ActionItemAuditExecute(Sender: TObject);
    procedure ActionItemViewExecute(Sender: TObject);
    procedure ActionMarkExecute(Sender: TObject);
    procedure ActionMarkAllExecute(Sender: TObject);
    procedure ActionShowDetailsExecute(Sender: TObject);
    procedure ActionMarkInverseExecute(Sender: TObject);
    procedure ActionUnMarkAllExecute(Sender: TObject);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ActionShowMarkedExecute(Sender: TObject);
    procedure SplitterExtAfterClose(Sender: TObject);
    procedure SplitterExtAfterOpen(Sender: TObject);
    procedure SplitterDetailsAfterClose(Sender: TObject);
    procedure SplitterDetailsAfterOpen(Sender: TObject);
    procedure SplitterDetailsMoved(Sender: TObject);
    procedure SplitterExtMoved(Sender: TObject);
    procedure vgStyleSheetsItemChanged(Sender: TObject;
      AOldRow: TcxCustomRow; AOldCellIndex: Integer);
    procedure ActionShowSysInfoExecute(Sender: TObject);
    procedure ActionObjectInspectorExecute(Sender: TObject);
    procedure ActionDebugAllExecute(Sender: TObject);
    procedure ActionShowSysBarExecute(Sender: TObject);
    procedure actEditStyleExecute(Sender: TObject);
    procedure actLoadStyleExecute(Sender: TObject);
    procedure actSaveStyleExecute(Sender: TObject);
    procedure ActionShowSettingsExecute(Sender: TObject);
    procedure SplitterSettingsAfterClose(Sender: TObject);
    procedure SplitterSettingsAfterOpen(Sender: TObject);
    procedure SplitterSettingsMoved(Sender: TObject);
    procedure DSDataChange(Sender: TObject; Field: TField);
    procedure ActionShowFilterExecute(Sender: TObject);
    procedure SplFilterAfterClose(Sender: TObject);
    procedure SplFilterAfterOpen(Sender: TObject);
    procedure DbFltControlMainApplyFilter(Sender: TObject);
    procedure ActionFltLoadExecute(Sender: TObject);
    procedure ActionFltSaveExecute(Sender: TObject);
    procedure ActionFltApplyExecute(Sender: TObject);
    procedure ActionFltCancelExecute(Sender: TObject);
    procedure ActionScriptExecuteExecute(Sender: TObject);
  private
    FShowMarked: Boolean;
    FShowDetails: Boolean;
    FSelectStyle: TSelectStyle;
    FWithoutPropForm: Boolean;
    FCurVerticalGridStyle: TcxVerticalGridStyleSheet;
    FShowSettings: Boolean;
    FShowFilter: Boolean;
    FOnSelectOk: TDataSetNotifyEvent;
    FisCloneGridDataSet: boolean;
    FCanOpen: Boolean;
    procedure SetShowMarked(const Value: Boolean);
    procedure SetShowDetails(const Value: Boolean);
    procedure SetWithoutPropForm(const Value: Boolean);
    procedure SetCurVerticalGridStyle(
      const Value: TcxVerticalGridStyleSheet);
    procedure SetShowSettings(const Value: Boolean);
    procedure SetActive(const Value: boolean);
    procedure SetisReadOnly(const Value: boolean);
    procedure SetShowFilter(const Value: Boolean);
    procedure SetIsDatasetEmpty(const Value: boolean);
    procedure SetSelectStyleVal(const Value: TSelectStyle);
    procedure SetGridDataSetVal(const Value: TDataSet);
    procedure SetCanOpen(const Value: Boolean);
    procedure SetGridDataSet(Value: Pointer);
  protected
    FGridDataSet: TDataSet;
    FActive: boolean;
    FActionExecRightList: TStringList;
    FisReadOnly: boolean;
    FMultiSelect: Boolean;
    ResourceModuleClassName: string;
    DataModuleClassName: string;
    PropClassName: string;
    GridDataSetAfterRefresh: TDataSetNotifyEvent;
    GridDataSetAfterOpen: TDataSetNotifyEvent;
    GridDataSetAfterScroll: TDataSetNotifyEvent;
    FldProfile: TStrings;
    SearchParamRec: TSearchParamRec;
    FIsDatasetEmpty: boolean;
    ParentForm: TComponent;
    CustomDM: TBCDbDsDm;
    ResourceModule: TBCResDm;

    procedure KeyFieldToComStr(const Value: TStrings);
    property IsDatasetEmpty: boolean read FIsDatasetEmpty write SetIsDatasetEmpty;
    procedure AddIntoSelected(DataSetFrom: TDataSet;
      DataSetTo: TDataSet; KeyValues: string);
    procedure EditSelected(DataSetFrom: TDataSet;
      DataSetTo: TDataSet; KeyValues: string);
    procedure AssignData(DataFrom, DataTo: TDataSet);
    function KeyValuesToVariant(DataSet: TDataSet): Variant;
    function IsRowMarked(KeyValues: string): Boolean;
    procedure SyncDetailsColumn; virtual;
    procedure ApplyTreeViewFromGrid(DbTree: TcxDBTreeList; DBGrid: TDbGrid);
    function DbGridColumnByFieldName(DBGridColumns: TDbGridColumns; FieldName: string): TColumn;
    procedure OnSetModule; virtual;
    procedure SavePropsToStorage; virtual;
    procedure LoadPropsFromStorage; virtual;
    procedure LoadUserDefinedStyleSheets(AFileName: TFileName);
    procedure SaveUserDefinedStyleSheets(AFileName: TFileName);
    procedure SelectFistChild(AStyleRepositoryType: TcxStyleRepositoryType);
    procedure UpdateGridStyleSheets; virtual;
    procedure ClearUserDefinedStyleSheets;
    procedure CreateStyleSheetsList(AStyleRepositoryType: TcxStyleRepositoryType);
//    procedure DoDataScrollBefore(DataSet: TDataSet); virtual;
    procedure SetActionsEnabled; virtual;
    procedure OpenScripts; virtual;
    property CurVerticalGridStyle: TcxVerticalGridStyleSheet read FCurVerticalGridStyle write
      SetCurVerticalGridStyle;
  public
    MarkedItems: TStrings;
    MARKED_BRUSH_COLOR: Integer;
    MARKED_FONT: TFont;
    MainDm: TBCDbDm;
    KeyFieldsComaStr: string;
    KeyFields: TStrings;
    CustomDMName: string;
    Params: TParams;

    function GetResourceModule(): Pointer;
    function GetCustomDm(): Pointer;
    procedure SetResourceModule(AResourceModule: Pointer);
    procedure SetCustomDm(ACustomDm: Pointer);
    procedure SetDataSource();
    procedure SetResources();
    procedure AssignSelectedDataSet(DataSetFrom: TDataSet; DataSetTo: TVirtualTable); virtual;
    procedure MergeIntoSelected(DataSetFrom: TDataSet; DataSetTo: TDataSet; KeyValues: string);
    procedure DeleteFromSelected(DataSetFrom: TDataSet; KeyValues: string);
    function OnClear: boolean; virtual;
    function OnMark(MarkAction: string; KeyValues: string): boolean; virtual;
    function TestBeforeMark(var DataSet: TDataSet): Boolean; virtual;
    property ShowMarked: Boolean read FShowMarked write SetShowMarked;
    property ShowDetails: Boolean read FShowDetails write SetShowDetails;
    property SelectStyle: TSelectStyle read FSelectStyle write SetSelectStyleVal;
    property WithoutPropForm: Boolean read FWithoutPropForm write SetWithoutPropForm;
    procedure AfterConstruction; override;
    procedure Close; virtual;
    procedure Open; virtual;
    procedure BeforeDestruction; override;
    procedure DoDataScrollAfter; virtual;

    procedure SetisCloneGridDataSet(Value: boolean);
    procedure SetMultiSelect(Value: Boolean); virtual;
    function GetMultiSelect(): Boolean;
    function GetIsCloneGridDataSet: Boolean;
    function GetGridDataSet(): Pointer;
    function GetSelectStyle: Byte;
    procedure SetSelectStyle(Value: Byte);
    function GetDatasetParams: Pointer;
    procedure SetDatasetParams(Value: Pointer);
    function GetSelectOkEvent: TDatasetNotifyEvent;
    procedure SetSelectOkEvent(Value: TDatasetNotifyEvent);

    property ShowSettings: Boolean read FShowSettings write SetShowSettings;
    property ShowFilter: Boolean read FShowFilter write SetShowFilter;
    property Active: boolean read FActive write SetActive;
    property isReadOnly: boolean read FisReadOnly write SetisReadOnly;
    property isCloneGridDataSet: boolean read FisCloneGridDataSet write SetisCloneGridDataSet;
    property MultiSelect: Boolean read FMultiSelect write SetMultiSelect;
    property OnSelectOk: TDataSetNotifyEvent read FOnSelectOk write SetSelectOkEvent;
    property CanOpen:Boolean read FCanOpen write SetCanOpen;
  published
    property GridDataSet: TDataSet read FGridDataSet write SetGridDataSetVal;
  end;

implementation

uses Clipbrd, DBAccess, BCException, cxStyleSheetEditor, BCSelect,
  UtilsDataConvert, UtilsCommon, ContrUtils, FSUtils, IOUtils;

{$R *.dfm}

function TBCContainerFrame.IsRowMarked(KeyValues: string): Boolean;
begin
  result := (MarkedItems.IndexOf(KeyValues) > -1);
end;

procedure TBCContainerFrame.KeyFieldToComStr(const Value: TStrings);
var
  i: Integer;
  coma: string;
begin
  KeyFieldsComaStr := '';
  for i := 0 to Value.Count - 1 do
  begin
    if i = 0 then
      coma := ''
    else
      coma := ';';
    KeyFieldsComaStr := KeyFieldsComaStr + Coma + Value[i];
  end;
end;

procedure TBCContainerFrame.ActionShowMarkedExecute(Sender: TObject);
begin
  inherited;
  ShowMarked := not ShowMarked;
  if ShowMarked then
    SplitterExt.OpenSplitter
  else
    SplitterExt.CloseSplitter;
end;

procedure TBCContainerFrame.SplitterExtAfterClose(Sender: TObject);
begin
  inherited;
  ShowMarked := False;
end;

procedure TBCContainerFrame.SetShowMarked(const Value: Boolean);
begin
  FShowMarked := Value;
  SplitterExt.Visible := Value;
  if not Value then PageExt.Height := 0;
  if Value and (PageExt.Height < 70) then PageExt.Height := 70;
  ActionShowMarked.Checked := Value;
end;

procedure TBCContainerFrame.SetSelectStyle(Value: Byte);
begin
  FSelectStyle:= TSelectStyle(Value);
end;

procedure TBCContainerFrame.SetShowDetails(const Value: Boolean);
begin
  FShowDetails := Value;
  ActionShowDetails.Checked := Value;
  SplitterDetails.Visible := Value;
  if not Value then PageDetails.Width := 0;
  if Value and (PageDetails.Width < 70) then PageDetails.Width := 70;
  if Value then SyncDetailsColumn;
end;

procedure TBCContainerFrame.SplitterExtAfterOpen(Sender: TObject);
begin
  inherited;
  ShowMarked := true;
end;

procedure TBCContainerFrame.SplitterDetailsAfterClose(Sender: TObject);
var
  str: string;
begin
  inherited;
  str := 'Visible: ' + BoolToStr(PageDetails.Visible) + ' width: ' + IntToStr(PageDetails.Width);
  ShowDetails := False;
end;

procedure TBCContainerFrame.SplitterDetailsAfterOpen(Sender: TObject);
begin
  inherited;
  ShowDetails := True;
end;

procedure TBCContainerFrame.SyncDetailsColumn;
begin
  GridDetails.ClearRows;
end;

procedure TBCContainerFrame.SplitterDetailsMoved(Sender: TObject);
begin
  inherited;
  ShowDetails := (PageDetails.Width > 10);
  if ShowDetails then SyncDetailsColumn;
end;

procedure TBCContainerFrame.SplitterExtMoved(Sender: TObject);
begin
  inherited;
  ShowMarked := (PageExt.Height > 10);
end;

procedure TBCContainerFrame.OnSetModule;
begin
  PropClassName := FrameProp.Values['PropClassName'];
  WithoutPropForm := PropClassName = '';
  BCCommon.OnSetModule(TObject(Self), ResourceModule, CustomDM, MainDm, ResourceModuleClassName,
    DataModuleClassName);
  if Assigned(CustomDM) then CustomDMName := CustomDM.Name else CustomDMName := '';
end;

procedure TBCContainerFrame.SavePropsToStorage;
begin
  if Assigned(CustomDm) then
  begin
   { if Assigned(CustomDM) and (CustomDM.Name = CustomDMName) then
      CustomDM.SaveProfileData(Name, FldProfile.Text);}
    PropStore.StoreTo(true);
  end;
end;

procedure TBCContainerFrame.ApplyTreeViewFromGrid(DbTree: TcxDBTreeList;
  DBGrid: TDbGrid);
var
  ColumnNo: Integer;
  F: TColumn;
  Band: TcxTreeListBand;
  TreeColumn: TcxTreeListColumn;
  AColumn: TcxDBTreeListColumn;
begin
  DBTree.Bands.Clear;
  Band := DBTree.Bands.Add;
  for ColumnNo := 0 to DBGrid.Columns.Count - 1 do
  begin
    F := DBGrid.Columns[ColumnNo];
    if f.Visible then
    begin
      TreeColumn := DBTree.CreateColumn(Band);
      AColumn := TcxDbTreeListColumn(TreeColumn);
      AColumn.DataBinding.FieldName := f.FieldName;
      AColumn.Caption.Text := f.Title.Caption;
      AColumn.Width := f.Width;
    end;
  end;
end;

function TBCContainerFrame.DbGridColumnByFieldName(
  DBGridColumns: TDbGridColumns; FieldName: string): TColumn;
var
  i: integer;
begin
  result := nil;
  for i := 0 to DBGridColumns.Count - 1 do
  begin
    if UpperCase(DBGridColumns[i].FieldName) = UpperCase(FieldName) then
    begin
      result := DBGridColumns[i];
      exit;
    end;
  end;
end;

procedure TBCContainerFrame.SetMultiSelect(Value: Boolean);
begin
  inherited;
  FMultiSelect := Value;
  ActionMark.Enabled := Value;
  ActionMarkInverse.Enabled := Value;
  ActionMarkAll.Enabled := Value;
end;

procedure TBCContainerFrame.SetSelectStyleVal(const Value: TSelectStyle);
begin
  FSelectStyle := Value;
  if Value = ssSelect then
  begin
{    ActionItemAdd.Enabled := False;
    ActionItemAdd.Visible := False;
    ActionItemProp.Enabled := False;
    ActionItemProp.Visible := False;
    ActionItemDel.Enabled := False;
    ActionItemDel.Visible := False;
    ActionItemsClear.Enabled := False;
    ActionItemsClear.Visible := False;
    ActionItemCopy.Enabled := False;
    ActionItemCopy.Visible := False;
    ActionItemAudit.Enabled := False;
    ActionItemAudit.Visible := False;
    ActionShowDetails.Enabled := False;
    ActionShowDetails.Visible := False;
    ActionItemPrint.Enabled := False;
    ActionItemPrint.Visible := False;
    ActionItemState.Enabled := False;
    ActionItemState.Visible := False;}
  end;
{  if Value = ssList then
  begin
    ActionItemAdd.Enabled := true;
    ActionItemAdd.Visible := True;
    ActionItemProp.Enabled := True;
    ActionItemProp.Visible := True;
    ActionItemDel.Enabled := True;
    ActionItemDel.Visible := True;
    ActionItemsClear.Enabled := True;
    ActionItemsClear.Visible := True;
    ActionItemCopy.Enabled := True;
    ActionItemCopy.Visible := True;
    ActionItemAudit.Enabled := True;
    ActionItemAudit.Visible := True;
    ActionShowDetails.Enabled := True;
    ActionShowDetails.Visible := True;
    ActionItemPrint.Enabled := True;
    ActionItemPrint.Visible := True;
    ActionItemState.Enabled := True;
    ActionItemState.Visible := True;
  end;       }
end;

procedure TBCContainerFrame.SetWithoutPropForm(const Value: Boolean);
begin
  FWithoutPropForm := Value;
end;

procedure TBCContainerFrame.DoDataScrollAfter;
begin
  IsDatasetEmpty := (GridDataSet.Bof and GridDataSet.Eof);
  if Assigned(Ds.DataSet) then
    if Ds.DataSet.Active then SetActionsEnabled;
end;

{procedure TBCContainerFrame.DoDataScrollBefore(DataSet: TDataSet);
begin
//Virtuak;
end;}

procedure TBCContainerFrame.ActionShowSysInfoExecute(Sender: TObject);
var
  aHostName: AnsiString;
  aIPAddress: AnsiString;
  aFormName: string;
  aSysText: string;
  i: Integer;
begin
  GetIPInfo(aHostName, aIPAddress);
  aFormName := Self.ClassName;
  aSysText := 'Имя копьютера: "' + aHostName + '"'#13#10 +
    'IP адрес: "' + aIPAddress + '"'#13#10 +
    'Имя класса текущей формы: ' + aFormName + #13#10;
  aSysText := aSysText + ' Список модулей данных: '#13#10;
  for i := 0 to Application.ComponentCount - 1 do
    if Application.Components[i] is TDataModule then
    begin
      aSysText := aSysText + #13#10 + Application.Components[i].Name + ':' +
        Application.Components[i].ClassName;
    end;
  MessageDlg(aSysText, mtInformation, [mbOk], 0);
end;

procedure TBCContainerFrame.ActionObjectInspectorExecute(Sender: TObject);
begin
  //ShowRTTI(Self);
  raise Exception.Create('RTTI information is not available');
end;

procedure TBCContainerFrame.ActionDebugAllExecute(Sender: TObject);
var
  i: integer;
begin
  inherited;
  ActionDebugAll.Checked := not ActionDebugAll.Checked;
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i].InheritsFrom(TCustomDADataSet) then
      (Components[i] as TCustomDADataSet).Debug := ActionDebugAll.Checked;
  end;
end;

procedure TBCContainerFrame.ActionShowSysBarExecute(Sender: TObject);
begin
  ToolBarSystem.Visible := not ToolBarSystem.Visible;
end;

procedure TBCContainerFrame.SetResources;
var IBCResource: IBCResourceModule;
begin
  if Assigned(ResourceModule) then
  begin
    if Supports(ResourceModule, IBCResourceModule, IBCResource) then
    begin
      BarManager.ImageOptions.Images := IBCResource.GetCustomListToolBar16;
      BarManager.ImageOptions.LargeImages := IBCResource.GetCustomListToolBar24;
      CustomActionList.Images := IBCResource.GetCustomListToolBar16;
      UserActionList.Images := IBCResource.GetUserListToolBar16;
      SysActionList.Images := IBCResource.GetCustomListToolBar16;
      IBCResource:= nil;
    end;
    {
    BarManager.ImageOptions.Images := ResourceModule.CustomListToolBar16;
    BarManager.ImageOptions.LargeImages := ResourceModule.CustomListToolBar24;
    CustomActionList.Images := ResourceModule.CustomListToolBar16;
    UserActionList.Images := ResourceModule.UserListToolBar16;
    SysActionList.Images := ResourceModule.CustomListToolBar16;
     }
    if Assigned(ResourceModule) then
    begin
      with ResourceModule do
      begin
        CreateStyleSheetsList(shtUserDefined);
        CreateStyleSheetsList(shtPredefined);
      end;
      SelectFistChild(shtUserDefined);
    end;
  end
end;

procedure TBCContainerFrame.Close;
begin
  if Assigned(CustomDm) then
  begin
    SavePropsToStorage;
  end;
  FActive := false;
end;

procedure TBCContainerFrame.SetDatasetParams(Value: Pointer);
begin
  Params:= Value;
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

procedure TBCContainerFrame.SetGridDataSet(Value: Pointer);
begin
  SetGridDataSetVal(Value);
end;

procedure TBCContainerFrame.LoadPropsFromStorage;
var
  TempDir: array[0..255] of char;
  FileName, STempDir: string;
  StoreItems: TcxPropertiesStoreComponent;
begin
  StoreItems := TcxPropertiesStoreComponent(PropStore.Components.Add);
  StoreItems.Component := PageDetails;
  StoreItems.Properties.Add('width');

  StoreItems := TcxPropertiesStoreComponent(PropStore.Components.Add);
  StoreItems.Component := PageExt;
  StoreItems.Properties.Add('height');

  StoreItems := TcxPropertiesStoreComponent(PropStore.Components.Add);
  StoreItems.Component := PageSettings;
  StoreItems.Properties.Add('width');

  StoreItems := TcxPropertiesStoreComponent(PropStore.Components.Add);
  StoreItems.Component := PageControlTop;
  StoreItems.Properties.Add('height');

  StoreItems := TcxPropertiesStoreComponent(PropStore.Components.Add);
  StoreItems.Component := GridDetails;
  StoreItems.Properties.Add('OptionsView.RowHeaderWidth');

  FileName := ClassName + '.ini';
  STempDir:= IOUtils.TPath.GetTempPath;
  if STempDir = '' then exit;
  PropStore.StorageName := STempDir + FileName;
  PropStore.RestoreFrom;
end;

procedure TBCContainerFrame.actEditStyleExecute(Sender: TObject);
begin
  ShowcxStyleSheetEditor(CurVerticalGridStyle, nil);
end;

procedure TBCContainerFrame.actLoadStyleExecute(Sender: TObject);
begin
  with OpenDialog do
    if Execute then
    begin
      LoadUserDefinedStyleSheets(FileName);
      SelectFistChild(shtUserDefined);
    end;
end;

procedure TBCContainerFrame.actSaveStyleExecute(Sender: TObject);
begin
  with SaveDialog do
    if Execute then
      SaveUserDefinedStyleSheets(FileName);
end;

procedure TBCContainerFrame.vgStyleSheetsItemChanged(Sender: TObject;
  AOldRow: TcxCustomRow; AOldCellIndex: Integer);
begin
  if (vgStyleSheets.FocusedRow <> nil) and (vgStyleSheets.FocusedRow.Tag <> -1) then
  begin
    CurVerticalGridStyle := TcxVerticalGridStyleSheet(vgStyleSheets.FocusedRow.Tag);
  end;
end;

procedure TBCContainerFrame.LoadUserDefinedStyleSheets(AFileName: TFileName);
var IBCResource: IBCResourceModule;
begin
  CurVerticalGridStyle := nil;
  UpdateGridStyleSheets;
  ClearUserDefinedStyleSheets;

  if Supports(ResourceModule, IBCResourceModule, IBCResource) then
  begin
    LoadStyleSheetsFromIniFile(AFileName, IBCResource.GetStrepUserDefined,
      TcxVerticalGridStyleSheet);
    IBCResource:= nil;
  end;

  CreateStyleSheetsList(shtUserDefined);
end;

procedure TBCContainerFrame.SaveUserDefinedStyleSheets(AFileName: TFileName);
var IBCResource: IBCResourceModule;
var
  AList: TList;
  procedure PopulateStyleSheetsList(const AList: TList);
  var
    I: Integer;
  begin
    if AList <> nil then
    begin
      AList.Clear;
      if Supports(ResourceModule, IBCResourceModule, IBCResource) then
      begin
        if IBCResource.GetStrepUserDefined <> nil then
           with TcxStyleRepository(IBCResource.GetStrepUserDefined) do
           begin
             for I := 0 to StyleSheetCount - 1 do
               AList.Add(StyleSheets[I]);
           end;
         IBCResource:= nil;
      end;
    end;
  end;

begin
  AList := TList.Create;
  try
    PopulateStyleSheetsList(AList);
    SaveStyleSheetsToIniFile(AFileName, AList);
  finally
    AList.Free;
  end;
end;

procedure TBCContainerFrame.SelectFistChild(
  AStyleRepositoryType: TcxStyleRepositoryType);
begin
  case AStyleRepositoryType of
    shtNone: vgStyleSheets.FocusedRow := vgStyleSheetsNone;
    shtPredefined: vgStyleSheets.FocusedRow := vgStyleSheetsPredefinedStyleSheets.Rows[0];
    shtUserDefined: vgStyleSheets.FocusedRow := vgStyleSheetsUserDefinedStyleSheets.Rows[0];
  end;
end;

procedure TBCContainerFrame.UpdateGridStyleSheets;
begin
  GridDetails.Styles.StyleSheet := CurVerticalGridStyle;
  GridDetails.Update;
end;

procedure TBCContainerFrame.ClearUserDefinedStyleSheets;
var IBCResource: IBCResourceModule;
begin
  if Supports(ResourceModule, IBCResourceModule, IBCResource) then
  begin
    with TcxStyleRepository(IBCResource.GetStrepUserDefined) do
    begin
      Clear;
      ClearStyleSheets;
    end;
    IBCResource:= nil;
  end;
end;

procedure TBCContainerFrame.CreateStyleSheetsList(
  AStyleRepositoryType: TcxStyleRepositoryType);
var
  I: Integer;
  AStyleRepository: TcxStyleRepository;
  Category, Row: TcxCategoryRow;
  IBCResource: IBCResourceModule;
begin
  if AStyleRepositoryType = shtNone then
    Exit;
  if Supports(ResourceModule, IBCResourceModule, IBCResource) then
  begin
    with IBCResource do
      if AStyleRepositoryType = shtUserDefined then
      begin
        AStyleRepository := IBCResource.GetStrepUserDefined;
        Category := vgStyleSheetsUserDefinedStyleSheets;
      end
      else
      begin
        AStyleRepository := IBCResource.GetStrepPredefined;
        Category := vgStyleSheetsPredefinedStyleSheets;
      end;
    with AStyleRepository do
    begin
      TcxCustomRowAccess(Category).RemoveAll;
      for I := 0 to StyleSheetCount - 1 do
      begin
        Row := TcxCategoryRow(vgStyleSheets.AddChild(Category, TcxCategoryRow));
        Row.Properties.Caption := StyleSheets[I].Caption;
        Row.Options.TabStop := False;
        Row.Styles.Header := IBCResource.GetStylesContent;
        Row.Tag := Integer(StyleSheets[I]);
      end;
    end;
  end;
end;

procedure TBCContainerFrame.SetCurVerticalGridStyle(
  const Value: TcxVerticalGridStyleSheet);
begin
  FCurVerticalGridStyle := Value;
  UpdateGridStyleSheets;
end;

procedure TBCContainerFrame.DSDataChange(Sender: TObject; Field: TField);
begin
  if Assigned(GridDataSet) then
    if GridDataSet.Active then DoDataScrollAfter;
end;

procedure TBCContainerFrame.OpenScripts;
begin
//Virtual
end;

procedure TBCContainerFrame.ActionViewRefreshExecute(Sender: TObject);
var
  GridDataSetParams: TParams;
begin
  if SelectStyle in [ssSelect] then
  begin
    GridDataSetParams := CustomDM.GetDataSetParams(GridDataset);
    UtilsCommon.AssignParam(Params, GridDataSetParams);
  end;
  ContrUtils.OnViewRefresh(FGridDataSet);
end;

procedure TBCContainerFrame.ActionViewLayoutExecute(Sender: TObject);
begin
  inherited;
//  DBGrid.ChangeLayout; Временно
end;

procedure TBCContainerFrame.ActionViewFilterOffExecute(Sender: TObject);
begin
  inherited;
  //Выключение фильтров
end;

procedure TBCContainerFrame.SetShowSettings(const Value: Boolean);
begin
  FShowSettings := Value;
  SplitterSettings.Visible := Value;
  if not Value then PageSettings.Width := 0;
  if Value and (PageSettings.Width < 70) then PageSettings.Width := 70;
  ActionShowSettings.Checked := Value;
end;

procedure TBCContainerFrame.ActionShowSettingsExecute(Sender: TObject);
begin
  ShowSettings := not ShowSettings;
  if ShowSettings then
    SplitterSettings.OpenSplitter
  else
    SplitterSettings.CloseSplitter;
end;

procedure TBCContainerFrame.SplitterSettingsAfterClose(Sender: TObject);
begin
  ShowSettings := False;
end;

procedure TBCContainerFrame.SplitterSettingsAfterOpen(Sender: TObject);
begin
  ShowSettings := True;
end;

procedure TBCContainerFrame.SplitterSettingsMoved(Sender: TObject);
begin
  ShowSettings := (PageSettings.Width > 10);
end;

procedure TBCContainerFrame.SetActive(const Value: boolean);
begin
  if Value = FActive then exit;
  FActive := Value;
  if Value then
    Open
  else
    Close;
end;

procedure TBCContainerFrame.BeforeDestruction;
begin
  inherited;
  KeyFields.Free;
  Close;
end;

procedure TBCContainerFrame.AfterConstruction;
begin
  inherited;
  ShowDetails := false;
  ShowMarked := false;
  ShowSettings := false;
  ShowFilter := false;
  FCanOpen:=True;
  FisCloneGridDataSet := False;
  MarkedItems := TStringList.Create;
  MARKED_FONT := TFont.Create;
  FldProfile := TStringList.Create;

  ResourceModuleClassName := FrameProp.Values['ResourceModuleClassName'];
  DataModuleClassName := FrameProp.Values['CustomDMClassName'];

  KeyFields := TStringList.Create;
  KeyFields.Delimiter := ',';
  KeyFields.DelimitedText := FrameProp.Values['KEYFIELDS'];
  KeyFields.Delimiter := ';';
  KeyFields.QuoteChar := ' ';
  KeyFieldsComaStr := KeyFields.DelimitedText;

  GridDataSet := nil;
  OnSetModule;

  if FrameProp.Values['MultiSelect'] <> '' then
    MultiSelect := StrToBool(FrameProp.Values['MultiSelect']) else MultiSelect := true;

  if FrameProp.Values['ReadOnly'] <> '' then
    MultiSelect := StrToBool(FrameProp.Values['ReadOnly']) else IsReadOnly := False;

  ParentForm := ContrUtils.GetFrameOrFormOwnerByObject(Self);
  if (SelectStyle in [SSSelect]) then
  begin
    OnSelectOk := TBCSelectDlg(ParentForm).OnSelectOk;
  end;
end;

procedure TBCContainerFrame.SetisReadOnly(const Value: boolean);
begin
  FisReadOnly := value;
end;

procedure TBCContainerFrame.ActionRowSelectExecute(Sender: TObject);
begin
  inherited;
  ActionRowSelect.Checked := not ActionRowSelect.Checked;
end;

procedure TBCContainerFrame.SetActionsEnabled;
var
  en: boolean;
begin
  inherited;
  en := (not GridDataSet.IsEmpty and GridDataSet.Active and Active);
  ActionItemAdd.Enabled := not isReadOnly;
  ActionItemDel.Enabled := en and not isReadOnly;
  ActionItemProp.Enabled := en and not isReadOnly;
  ActionItemsClear.Enabled := en and not isReadOnly;
  ActionItemCopy.Enabled := en and not isReadOnly;
  ActionItemView.Enabled := en and not isReadOnly;
  ActionItemAudit.Enabled := en and not isReadOnly;
  ActionItemPrint.Enabled := en and not isReadOnly;
  ActionItemPrint.Visible := en and not isReadOnly;
  ActionItemState.Enabled := en and not isReadOnly;
  ActionItemState.Visible := en and not isReadOnly;

  ActionMark.Enabled := en and MultiSelect;
  ActionUnMarkAll.Enabled := en;
  ActionMarkInverse.Enabled := en and MultiSelect;
  ActionMarkAll.Enabled := en and MultiSelect;
  TabSelection.Caption := GridDataSet.Name;
end;

procedure TBCContainerFrame.ActionDebugExecute(Sender: TObject);
begin
  inherited;
  ActionDebug.Checked := not ActionDebug.Checked;
  if GridDataSet is TCustomDADataSet then
    TCustomDADataSet(GridDataSet).Debug := ActionDebug.Checked;
end;

procedure TBCContainerFrame.ActionViewSqlBuilderExecute(Sender: TObject);
var
  Res: string;
begin
  inherited;
  res := CustomDM.GetDataSetSQL(GridDataSet);
  Clipboard.AsText := Res;
  ShowMessage(res);
end;

procedure TBCContainerFrame.Open;
begin
  if not CanOpen then Exit;
  FActive := Assigned(CustomDM) and Assigned(ResourceModule) and Assigned(MainDm);
  if Active then OpenScripts;
  MARKED_BRUSH_COLOR := clAqua;
//  MARKED_FONT.Assign(PanelGrid.Font);
  if Assigned(GridDataSet) then
  begin
    if FrameProp.Values['isCloneGridDataSet'] <> '' then
      isCloneGridDataSet := StrToBool(FrameProp.Values['isCloneGridDataSet']);
    ActionViewRefresh.Execute;
    AssignSelectedDataSet(GridDataSet, VTSelection);
    LoadPropsFromStorage;
    ShowDetails := (PageDetails.Width > 10);
    ShowMarked := (PageExt.Height > 10);
    ShowSettings := (PageSettings.Width > 10);
    ShowFilter := (PageControlTop.Height > 10);
  end;
end;

procedure TBCContainerFrame.ActionItemPropExecute(Sender: TObject);
begin
  inherited;
  UtilsCommon.SetParamValue(Params, 'ACTION_RESULT', ContrUtils.OnContainerItemAction(Self,
    GridDataSet, Params, PropClassName, acEDIT, WithoutPropForm));
end;

procedure TBCContainerFrame.ActionItemAddExecute(Sender: TObject);
begin
  inherited;
  UtilsCommon.SetParamValue(Params, 'ACTION_RESULT', ContrUtils.OnContainerItemAction(Self,
    GridDataSet, Params, PropClassName, acADD, WithoutPropForm));
end;

procedure TBCContainerFrame.ActionItemDelExecute(Sender: TObject);
begin
  inherited;
  UtilsCommon.SetParamValue(Params, 'ACTION_CONFIRM', true);
  UtilsCommon.SetParamValue(Params, 'ACTION_CONFIRM_TEXT', BCDbDs.MSG_CONFIRM_DEL);
  UtilsCommon.SetParamValue(Params, 'ACTION_RESULT', ContrUtils.OnContainerItemAction(Self,
    GridDataSet, Params, PropClassName, acDELETE, WithoutPropForm));
end;

procedure TBCContainerFrame.ActionItemsClearExecute(Sender: TObject);
begin
  inherited;
  UtilsCommon.SetParamValue(Params, 'ACTION_CONFIRM', true);
  UtilsCommon.SetParamValue(Params, 'ACTION_CONFIRM_TEXT', MSG_CONFIRM_CLEAR);
  UtilsCommon.SetParamValue(Params, 'ACTION_RESULT', OnClear);
end;

function TBCContainerFrame.OnClear: Boolean;
begin
  result := true;
  if ActionItemDel.Enabled then
  begin
    if BCCommon.CheckConfirm(Params) then
    begin
      GridDataSet.First;
      UtilsCommon.SetParamValue(Params, 'ACTION_CONFIRM', false);
      while not GridDataSet.Eof do
      begin
        result := ContrUtils.OnContainerItemAction(Self, GridDataSet, Params, PropClassName,
          acDELETE, WithoutPropForm);
      end;
    end;
  end;
end;

procedure TBCContainerFrame.ActionItemCopyExecute(Sender: TObject);
begin
  inherited;
  UtilsCommon.SetParamValue(Params, 'ACTION_RESULT', ContrUtils.OnContainerItemAction(Self,
    GridDataSet, Params, PropClassName, acCOPY, WithoutPropForm));
end;

procedure TBCContainerFrame.ActionItemAuditExecute(Sender: TObject);
begin
  inherited;
  UtilsCommon.SetParamValue(Params, 'ACTION_RESULT', ContrUtils.OnContainerItemAction(Self,
    GridDataSet, Params, PropClassName, acAUDIT, WithoutPropForm));
end;

procedure TBCContainerFrame.ActionItemViewExecute(Sender: TObject);
begin
  inherited;
  UtilsCommon.SetParamValue(Params, 'ACTION_RESULT', ContrUtils.OnContainerItemAction(Self,
    GridDataSet, Params, PropClassName, acVIEW, WithoutPropForm));
end;

function TBCContainerFrame.OnMark(MarkAction: string; KeyValues: string): boolean;
begin
  Result := True;
  if not TestBeforeMark(TDataSet(FGridDataSet)) then Exit;
  if MarkAction = 'INVERT' then
  begin
    if IsRowMarked(KeyValues) then
      DeleteFromSelected(VTSelection, KeyValues)
    else
      AddIntoSelected(GridDataSet, VTSelection, KeyValues);
  end;
  if (MarkAction = 'MARK') then
  begin
    AddIntoSelected(GridDataSet, VTSelection, KeyValues);
  end;
  if (MarkAction = 'UNMARK') then
  begin
    DeleteFromSelected(VTSelection, KeyValues);
  end;
end;

procedure TBCContainerFrame.ActionMarkExecute(Sender: TObject);
begin
  DataSetControlsOff(FGridDataSet, GridDataSetAfterRefresh, GridDataSetAfterOpen,
    GridDataSetAfterScroll);
  try
    OnMark('INVERT', UtilsCommon.GetListFieldsStrVal(GridDataSet, KeyFields, ';'));
    GridDataSet.Next;
  finally
    DataSetControlsOn(FGridDataSet, GridDataSetAfterRefresh, GridDataSetAfterOpen,
      GridDataSetAfterScroll);
  end;
end;

function TBCContainerFrame.KeyValuesToVariant(DataSet: TDataSet): Variant;
var
  i: Integer;
begin
  result := VarArrayCreate([0, KeyFields.Count - 1], varVariant);
  for i := 0 to KeyFields.Count - 1 do
    result[i] := DataSet.FieldByName(KeyFields[i]).Value;
end;

procedure TBCContainerFrame.ActionMarkAllExecute(Sender: TObject);
var
  KeyValuesOld: Variant;
  KeyValStr: string;
begin
  inherited;
  KeyValuesOld := KeyValuesToVariant(GridDataSet);
  DataSetControlsOff(FGridDataSet, GridDataSetAfterRefresh, GridDataSetAfterOpen,
    GridDataSetAfterScroll);
  GridDataSet.First;
  try
    while not GridDataSet.Eof do
    begin
      KeyValStr := UtilsCommon.GetListFieldsStrVal(GridDataSet, KeyFields, ';');
      if not IsRowMarked(KeyValStr) then OnMark('MARK', KeyValStr);
      GridDataSet.Next;
    end;
  finally
    GridDataSet.Locate(KeyFieldsComaStr, KeyValuesOld, []);
    DataSetControlsOn(FGridDataSet, GridDataSetAfterRefresh, GridDataSetAfterOpen,
      GridDataSetAfterScroll);
  end;
end;

procedure TBCContainerFrame.AssignSelectedDataSet(DataSetFrom: TDataSet;
  DataSetTo: TVirtualTable);
var
  i: Integer;
  FieldFrom, FieldTo: TField;
  FieldType: TFieldType;
begin
  if DataSetTo.Active = False then DataSetTo.Open;
  DataSetTo.DeleteFields;
  for i := 0 to DataSetFrom.FieldCount - 1 do
  begin
    FieldFrom := DataSetFrom.Fields[i];
    case FieldFrom.DataType of
      ftOraClob, ftOraBlob: FieldType := ftMemo;
      ftLargeint: FieldType := ftString;
    else
      FieldType := FieldFrom.DataType;
    end;

    DataSetTo.AddField(FieldFrom.FieldName, FieldType, FieldFrom.Size, FieldFrom.Required);
    FieldTo := DataSetTo.Fields[i];
    FieldTo.DisplayLabel := FieldFrom.DisplayLabel;
    FieldTo.DisplayWidth := FieldFrom.DisplayWidth;
  end;
end;

procedure TBCContainerFrame.AssignData(DataFrom: TDataSet; DataTo: TDataSet);
var
  i: Integer;
  f: TField;
begin
  for i := 0 to DataFrom.FieldCount - 1 do
  begin
    f := DataTo.FindField(DataFrom.Fields[i].FieldName);
    if f <> nil then f.value := DataFrom.Fields[i].Value;
  end;
end;

procedure TBCContainerFrame.MergeIntoSelected(DataSetFrom: TDataSet;
  DataSetTo: TDataSet; KeyValues: string);
var
  KeyValVar: Variant;
begin
  KeyValVar := KeyValuesToVariant(DataSetFrom);
  if DataSetTo.Locate(KeyFieldsComaStr, KeyValVar, []) then
    EditSelected(DataSetFrom, DataSetTo, KeyValues)
  else
    AddIntoSelected(DataSetFrom, DataSetTo, KeyValues);
end;

procedure TBCContainerFrame.AddIntoSelected(DataSetFrom: TDataSet;
  DataSetTo: TDataSet; KeyValues: string);
begin
  DataSetTo.Insert;
  MarkedItems.Add(KeyValues);
  AssignData(DataSetFrom, DataSetTo);
  DataSetTo.Post;
end;

procedure TBCContainerFrame.EditSelected(DataSetFrom: TDataSet;
  DataSetTo: TDataSet; KeyValues: string);
var
  KeyValVar: Variant;
begin
  KeyValVar := KeyValuesToVariant(DataSetFrom);
  if DataSetTo.Locate(KeyFieldsComaStr, KeyValVar, []) then
  begin
    DataSetTo.Edit;
  end;
  AssignData(DataSetFrom, DataSetTo);
  DataSetTo.Post;
end;

function TBCContainerFrame.GetCustomDm: Pointer;
begin
  Result:= CustomDm;
end;

function TBCContainerFrame.GetDatasetParams: Pointer;
begin
  Result:= Params;
end;

function TBCContainerFrame.GetGridDataSet: Pointer;
begin
  Result:= FGridDataSet;
end;

function TBCContainerFrame.GetIsCloneGridDataSet: Boolean;
begin
  Result:= FIsCloneGridDataSet;
end;

function TBCContainerFrame.GetMultiSelect: Boolean;
begin
  Result:= FMultiSelect;
end;

function TBCContainerFrame.GetResourceModule: Pointer;
begin
  Result:= ResourceModule;
end;

function TBCContainerFrame.GetSelectOkEvent: TDatasetNotifyEvent;
begin
  Result:= Self.OnSelectOk;
end;

function TBCContainerFrame.GetSelectStyle: Byte;
begin
  Result:= Ord(FSelectStyle);
end;

procedure TBCContainerFrame.SetResourceModule(AResourceModule: Pointer);
begin
  ResourceModule:= AResourceModule;
end;

procedure TBCContainerFrame.SetCustomDm(ACustomDm: Pointer);
begin
  CustomDm:= ACustomDm;
end;

procedure TBCContainerFrame.DeleteFromSelected(DataSetFrom: TDataSet; KeyValues: string);
var
  i: Integer;
begin
  while DataSetFrom.Locate(KeyFieldsComaStr, KeyValues, []) do
  begin
    i := MarkedItems.IndexOf(KeyValues);
    if i > -1 then
    begin
      MarkedItems.Delete(i);
      DataSetFrom.Delete;
    end;
  end;
end;

procedure TBCContainerFrame.ActionShowDetailsExecute(Sender: TObject);
begin
  inherited;
  ShowDetails := not ShowDetails;
  if ShowDetails then
    SplitterDetails.OpenSplitter
  else
    SplitterDetails.CloseSplitter;
end;

procedure TBCContainerFrame.ActionMarkInverseExecute(Sender: TObject);
var
  KeyValuesOld: Variant;
begin
  inherited;
  KeyValuesOld := KeyValuesToVariant(GridDataSet);
  DataSetControlsOff(FGridDataSet, GridDataSetAfterRefresh, GridDataSetAfterOpen,
    GridDataSetAfterScroll);
  GridDataSet.First;
  try
    while not GridDataSet.Eof do
    begin
      OnMark('INVERT', UtilsCommon.GetListFieldsStrVal(GridDataSet, KeyFields, ';'));
      GridDataSet.Next;
    end;
  finally
    GridDataSet.Locate(KeyFieldsComaStr, KeyValuesOld, []);
    DataSetControlsOn(FGridDataSet, GridDataSetAfterRefresh, GridDataSetAfterOpen,
      GridDataSetAfterScroll);
  end;
end;

procedure TBCContainerFrame.ActionUnMarkAllExecute(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crHourGlass;
  try
    VTSelection.Clear;
    MarkedItems.Clear;
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TBCContainerFrame.TestBeforeMark(var DataSet: TDataSet): Boolean;
begin
  result := True;
end;

procedure TBCContainerFrame.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  KeyValues: string;
begin
  inherited;
  KeyValues := UtilsCommon.GetListFieldsStrVal(GridDataSet, KeyFields, ';');
  if IsRowMarked(KeyValues) then
  begin
    (Sender as TDBGridEh).Canvas.Brush.Color := MARKED_BRUSH_COLOR;
    (Sender as TDBGridEh).Canvas.Font.Assign(MARKED_FONT);
  end;
  (Sender as TDBGridEh).DefaultDrawDataCell(Rect, Column.Field, State);
end;

procedure TBCContainerFrame.SetShowFilter(const Value: Boolean);
begin
  FShowFilter := Value;
  SplFilter.Visible := Value;
//  if not Value then PageControlTop.Height := 0;
//  if Value and (PageControlTop.Height < 70) then PageControlTop.Height := 70;
  if Value then SplFilter.OpenSplitter else SplFilter.CloseSplitter;
  ActionShowFilter.Checked := Value;
end;

procedure TBCContainerFrame.ActionShowFilterExecute(Sender: TObject);
begin
  inherited;
  ShowFilter := not ShowFilter;
  if ShowFilter then
    SplFilter.OpenSplitter
  else
    SplFilter.CloseSplitter;
end;

procedure TBCContainerFrame.SplFilterAfterClose(Sender: TObject);
begin
  inherited;
  FShowFilter := False;
  ActionShowFilter.Checked := FShowFilter;
end;

procedure TBCContainerFrame.SplFilterAfterOpen(Sender: TObject);
begin
  inherited;
  FShowFilter := True;
  ActionShowFilter.Checked := FShowFilter;
end;

procedure TBCContainerFrame.DbFltControlMainApplyFilter(Sender: TObject);
var
  AView: TcxGridDBTableView;
begin
  AView := TcxFilterControl(Sender).LinkComponent as TcxGridDBTableView;
  AView.DataController.Filter.Active := True;
end;

procedure TBCContainerFrame.ActionFltLoadExecute(Sender: TObject);
begin
  inherited;
  OpenDialog.Filter := 'Grid Filters(*.flt)|*.flt|All files|*.*';
  if OpenDialog.Execute then
    DbFltControlMain.LoadFromFile(OpenDialog.FileName);
end;

procedure TBCContainerFrame.ActionFltSaveExecute(Sender: TObject);
begin
  inherited;
  SaveDialog.Filter := 'Grid Filters(*.flt)|*.flt';
  if SaveDialog.Execute then
    DbFltControlMain.SaveToFile(SaveDialog.FileName);
end;

procedure TBCContainerFrame.ActionFltApplyExecute(Sender: TObject);
begin
  inherited;
  DbFltControlMain.ApplyFilter;
end;

procedure TBCContainerFrame.ActionFltCancelExecute(Sender: TObject);
begin
  inherited;
  DbFltControlMain.Clear;
end;

procedure TBCContainerFrame.ActionScriptExecuteExecute(Sender: TObject);
begin
  inherited;
//  BCCommon.ExecScript(TComponent(Self),'begin   ShowMessage(Application.Name); end.','PascalScript');
  ShowMessage(FSUtils.ExecEvalution(TComponent(Self), '1>2'));
end;

procedure TBCContainerFrame.SetIsDatasetEmpty(const Value: boolean);
begin
  FIsDatasetEmpty := Value;
end;

procedure TBCContainerFrame.SetGridDataSetVal(const Value: TDataSet);
begin
  FGridDataSet := Value;
  if Assigned(FGridDataSet) then
  begin
    DataSetControlsOff(FGridDataSet, GridDataSetAfterRefresh, GridDataSetAfterOpen,
      GridDataSetAfterScroll);
    DS.DataSet := FGridDataSet;
    DataSetControlsOn(FGridDataSet, GridDataSetAfterRefresh, GridDataSetAfterOpen,
      GridDataSetAfterScroll);
  end;
end;

procedure TBCContainerFrame.SetisCloneGridDataSet(Value: boolean);
begin
  FisCloneGridDataSet := Value;
  if Value then
  begin
    GridDataSet := CustomDM.CloneDataSet(GridDataSet, 'QU_' + Name);
  end;
end;

procedure TBCContainerFrame.SetCanOpen(const Value: Boolean);
begin
  FCanOpen := Value;
end;

procedure TBCContainerFrame.SetSelectOkEvent(Value: TDatasetNotifyEvent);
begin
  FOnSelectOk := Value;
end;

end.

