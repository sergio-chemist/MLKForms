unit CFLMLKList;

interface

uses
  Windows, Messages, SysUtils, Variants, CFLMLKMDIChild, MsAccess, Menus,
  DB, MemDS, DBAccess, Grids, DBGrids,
  Controls, ExtCtrls, ComCtrls,
  Classes, ActnList, ToolWin, Forms, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  MLKSQLBuilder, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, UMlkFilterPanel, System.Actions;

type
  TSearchParamRec = record
    sSearchText: string;
    sSearchFieldName: string;
    bForward: boolean;
    bCaseSensitive: boolean;
  end;

  TCFLMLKListForm = class(TCFLMLKMDIChildForm)
    ActionItemAdd: TAction;
    ActionItemProp: TAction;
    ActionItemDel: TAction;
    ActionViewRefresh: TAction;
    ActionViewLayout: TAction;
    ToolBtnAdd: TToolButton;
    ToolBtnProp: TToolButton;
    ToolBtnDel: TToolButton;
    ToolButton4: TToolButton;
    ToolBtnRefresh: TToolButton;
    PageControlTop: TPageControl;
    TabSheet1: TTabSheet;
    PanelGrid: TPanel;
    FilterPanel: TMlkFilterPanel;
    SQLBuilder: TMlkSQLBuilder;
    Query: TMSQuery;
    DS: TDataSource;
    ActionViewFilter: TAction;
    ActionViewFilterOff: TAction;
    DBGrid: TDBGridEh;
    QueryStorage: TMSQuery;
    PopupMenuGrid: TPopupMenu;
    pmiInsert: TMenuItem;
    pmiProp: TMenuItem;
    pmiDelete: TMenuItem;
    pmiDiv1: TMenuItem;
    pmiRefresh: TMenuItem;
    pmiLayout: TMenuItem;
    pmiDiv2: TMenuItem;
    pmiClearFilter: TMenuItem;
    ActionRowSelect: TAction;
    pmiRowSelect: TMenuItem;
    ActionDebugAll: TAction;
    ActionFind: TAction;
    ActionFindNext: TAction;
    ActionFindReverse: TAction;
    ActionShowContextValues: TAction;
    ActionDebugBuilder: TAction;
    TBCopyProfile: TToolButton;
    ActionCopyProfile: TAction;
    spCopyProfile: TMSStoredProc;
    ActionRestoreFormat: TAction;
    BtnLayot: TToolButton;
    procedure ActionViewRefreshExecute(Sender: TObject);
    function SQLBuilderGetOrderBy(Sender: TObject): string;
    procedure ActionViewFilterOffExecute(Sender: TObject);
    procedure ActionViewFilterExecute(Sender: TObject);
    procedure DBGridTitlePressed(Sender: TDBGridEh; Field: TField);
    procedure ActionRowSelectExecute(Sender: TObject);
    procedure QueryAfterOpen(DataSet: TDataSet);
    procedure QueryAfterRefresh(DataSet: TDataSet);
    procedure QueryAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure ActionDebugExecute(Sender: TObject);
    procedure ActionCopyProfileExecute(Sender: TObject);
    procedure ActionViewLayoutExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
  private
    FIsDatasetEmpty: boolean;
  protected
    SearchString:string;  
    CanAfterScroll: Boolean;
    SearchParamRec: TSearchParamRec;
    property IsDatasetEmpty: boolean read FIsDatasetEmpty;
    procedure SetActionsEnabled; virtual;
  public
    procedure AddFilter(var Filters: AnsiString; NewFilter: AnsiString);
  end;

var
  CFLMLKListForm: TCFLMLKListForm;

implementation

uses MlkData, DmCommon; //, MlekoSelectUser;
//  , comp_TargetFilter_StringFilter, comp_TargetFilter_BooleanFilter
//  , comp_TargetFilter_NumberFilter, comp_TargetFilter_LookupFilter
//  , comp_TargetFilter_DictionaryFilter
//  , comp_TargetFilter_CustomFilter, comp_TargetFilter_DateFilter;

{$R *.dfm}

procedure TCFLMLKListForm.ActionViewRefreshExecute(Sender: TObject);
var
  l_old_id: string;
  is_locate: boolean;
  DataSet: TDataSet;
begin
  inherited;
  try
    DataSet := DBGrid.DataSource.DataSet;
    Screen.Cursor := crHourGlass;
    is_locate := false;
    if DataSet.Active and (not DataSet.Eof) and (not DataSet.IsEmpty) then
    begin
      l_old_id := DataSet.FieldByName('ID').AsString;
      is_locate := true;
    end;
    DataSet.DisableControls;
    CanAfterScroll := False;
    //DBGrid.Reopen;
    if is_locate and (not DataSet.IsEmpty) then DataSet.Locate('ID', l_old_id, []);
  finally
    DataSet.EnableControls;
    CanAfterScroll := True;
    Screen.Cursor := crDefault;
  end;
end;

function TCFLMLKListForm.SQLBuilderGetOrderBy(Sender: TObject): string;
begin
  inherited;
  //Result := DBGrid.OrderBy;
end;                                                                                                

procedure TCFLMLKListForm.ActionViewFilterOffExecute(Sender: TObject);
var
  i: integer;
begin
  inherited;
  //Выключение фильтров
//  for i := 0 to ComponentCount - 1 do
//    if Components[i].InheritsFrom(TtargetFilter_CustomFilter) then
//    begin
//      //По дате
//      if Components[i].ClassNameIs('TTargetFilter_DateFilter') then
//        (Components[i] as TTargetFilter_DateFilter).a_ConditionType := dctNone;
//      //По строке
//      if Components[i].ClassNameIs('TTargetFilter_StringFilter') then
//        (Components[i] as TTargetFilter_StringFilter).a_LikeStr := '';
//      //Логические фильтры
//      if Components[i].ClassNameIs('TTargetFilter_BooleanFilter') then
//        (Components[i] as TTargetFilter_BooleanFilter).a_ConditionType := bctNone;
//      //По числовым полям
//      if Components[i].ClassNameIs('TTargetFilter_NumberFilter') then
//        (Components[i] as TTargetFilter_NumberFilter).a_ConditionType := nctNone;
//      //Lookup фильтры
//      if Components[i].ClassNameIs('TTargetFilter_LookupFilter') then
//        (Components[i] as TTargetFilter_LookupFilter).a_KeyValue := null;
//      //Dictionary фильтры
//      if Components[i].ClassNameIs('TTargetFilter_DictionaryFilter') then
//      begin
//        (Components[i] as TTargetFilter_DictionaryFilter).a_Value := Unassigned;
//        (Components[i] as TTargetFilter_DictionaryFilter).a_Text := '';
//      end;
//    end;
  DBGrid.Refresh;
end;

procedure TCFLMLKListForm.ActionViewFilterExecute(Sender: TObject);
var
  i, j: integer;
  LastOrder: integer;
//  FirstFilter: TtargetFilter_CustomFilter;
begin
  inherited;
//  LastOrder := 10000;
//  if DBGrid.Focused then
//  begin
//    for i := 0 to ComponentCount - 1 do
//    begin
//      if Components[i].ClassNameIs('TMlkFilterPanel') and ((Components[i] as TMlkFilterPanel).Parent = PageControlTop.ActivePage) then
//        for j := 0 to ComponentCount - 1 do
//        begin
//          if Components[j].InheritsFrom(TtargetFilter_CustomFilter)
//            and ((Components[j] as TtargetFilter_CustomFilter).Parent = Components[i])
//            and ((Components[j] as TtargetFilter_CustomFilter).TabOrder < LastOrder) then
//          begin
//            FirstFilter := (Components[j] as TtargetFilter_CustomFilter);
//            LastOrder := (Components[j] as TtargetFilter_CustomFilter).TabOrder;
//          end;
//        end;
//    end;
//    if (LastOrder < 10000) and FirstFilter.CanFocus then FirstFilter.SetFocus;
//  end
//  else if DBGrid.CanFocus then
//    DBGrid.SetFocus;
end;

procedure TCFLMLKListForm.DBGridTitlePressed(Sender: TDBGridEh; Field: TField);
begin
  inherited;
  DBGrid.Refresh;
end;

procedure TCFLMLKListForm.ActionRowSelectExecute(Sender: TObject);
begin
  inherited;
  ActionRowSelect.Checked := not ActionRowSelect.Checked;
  if ActionRowSelect.Checked then
    DBGrid.Options := DBGrid.Options + [dgRowSelect]
  else
    DBGrid.Options := DBGrid.Options - [dgRowSelect];
end;

procedure TCFLMLKListForm.SetActionsEnabled;
var
  en: boolean;
begin
  en := not Query.IsEmpty;
  ActionItemProp.Enabled := en;
  ActionItemDel.Enabled := en;
end;

procedure TCFLMLKListForm.QueryAfterOpen(DataSet: TDataSet);
begin
  inherited;
  FIsDatasetEmpty := (Query.Bof and Query.Eof);
  if CanAfterScroll then SetActionsEnabled;
//  ComponentProps.DefaultUser := IntToStr(data.UserNo);
//  DBGrid.RestoreFormatFromStorage;
end;

procedure TCFLMLKListForm.QueryAfterRefresh(DataSet: TDataSet);
begin
  inherited;
  FIsDatasetEmpty := (Query.Bof and Query.Eof);
  if CanAfterScroll then SetActionsEnabled;
end;

procedure TCFLMLKListForm.QueryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if CanAfterScroll then SetActionsEnabled;
end;

procedure TCFLMLKListForm.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  CanAfterScroll := False;
  inherited;
  with SearchParamRec do
  begin
    sSearchFieldName := '';
    sSearchText := '';
    bForward := true;
    bCaseSensitive := false;
  end;
end;

procedure TCFLMLKListForm.ActionDebugExecute(Sender: TObject);
begin
  inherited;
  Query.Debug := not Query.Debug;
end;

procedure TCFLMLKListForm.ActionCopyProfileExecute(Sender: TObject);
var
  ID: integer;
begin
//  if TMlekoSelectUserDlg.OpenSelect(ID, false) then
//  begin
//    if Application.MessageBox('При следующем входе в этот экран будут загружены настройки другого пользователя, вы уверены?', 'Настройки', MB_YESNO)
//      = IDYES then
//    begin
//      spCopyProfile.Close;
//      spCopyProfile.Params.ParamByName('p_owner_from').Value := IntToStr(ID);
//      spCopyProfile.Params.ParamByName('p_owner_to').Value := IntToStr(data.UserNo);
//      spCopyProfile.Params.ParamByName('p_section').Value := Name;
//      spCopyProfile.ExecProc;
//      ComponentProps.Enabled := false;
//    end;
//  end;
end;

procedure TCFLMLKListForm.AddFilter(var Filters: AnsiString; NewFilter: AnsiString);
begin
  if Trim(NewFilter) <> '' then
  begin
    if Trim(Filters) <> '' then Filters := Filters + ' and ';
    Filters := Filters + NewFilter;
  end;
end;

procedure TCFLMLKListForm.ActionViewLayoutExecute(Sender: TObject);
begin
  inherited;
//  DBGrid.ChangeLayout;
//  ComponentProps.DefaultUser := IntToStr(data.UserNo);
//  DBGrid.SaveFormatToStorage;
end;

procedure TCFLMLKListForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i: integer;
begin
  inherited;
//  for i := 0 to ComponentCount - 1 do
//    if Components[i].ClassNameIs('TDBGridEh') then
//    begin
//      if Assigned((Components[i] as TDBGridEh).PropStorage) then
//      begin
//        (Components[i] as TDBGridEh).PropStorage.DefaultUser := IntToStr(data.UserNo);
//        (Components[i] as TDBGridEh).SaveFormatToStorage;
//      end;
//    end;
end;

procedure TCFLMLKListForm.FormShow(Sender: TObject);
begin
  inherited;
  if not Query.Active then ActionViewRefresh.Execute;
end;

procedure TCFLMLKListForm.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 case Key of
  VK_RETURN:begin
             SearchString:='';
             Key:=0;
            end;
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TCFLMLKListForm.DBGridKeyPress(Sender: TObject; var Key: Char);
var
 Found:boolean;
begin
 if Key in MlkData.SearchSet then
  begin
   Found:=False;
   SearchString:=SearchString+Key;
   try
   Found:=DBGrid.DataSource.DataSet.Locate(DBGrid.Columns[DBGrid.SelectedIndex].FieldName,AnsiUpperCase(SearchString),[loCaseInsensitive,loPartialKey]);
   except
   SearchString:='';
   end;
   if DBGrid.Columns[DBGrid.SelectedIndex].Field.DataType=ftString then
    if not Found then SearchString:=Copy(SearchString,1,Length(SearchString)-1);
   Key:=Chr(0);
  end;
end;

end.

