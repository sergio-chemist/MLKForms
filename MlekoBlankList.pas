unit MlekoBlankList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKList, DBAccess, MsAccess, Menus, DB,
  citComponentProps, COMPSQLBuilder, ActnList, Grids, DBGrids,
  citDbGrid, ExtCtrls, comp_TargetFilter_Panel, ComCtrls, ToolWin,
  comp_TargetFilter_CustomFilter, comp_TargetFilter_DateFilter,
  StdCtrls, comp_Target_DBCtrls, VirtualTable,
  comp_TargetFilter_LookupFilter, DBCtrls, PropFilerEh, 
  citCtrls, citmask, citDBComboEdit, comp_TargetFilter_DictionaryFilter,
  MemDS, DASQLMonitor, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxGraphics,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TMlekoBlankListForm = class(TCFLMLKListForm)
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    spBlankCorrelation: TMSStoredProc;
    ActionGoBlank: TAction;
    ActionRestore: TAction;
    ActionDelFromBlank: TAction;
    spRestoreInputOrder: TMSStoredProc;
    SpDelOrderFromSetka: TMSStoredProc;
    spDelInputOrder: TMSStoredProc;
    ActionGoExcel: TAction;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ActionSpecPrint: TAction;
    quBlankSpec: TMSQuery;
    quDepts: TMSQuery;
    DSDepts: TDataSource;
    ToolButton9: TToolButton;
    ActionOpenCrossGrid: TAction;
    ActionAllCorrelation: TAction;
    ToolButton10: TToolButton;
    ActionDelAllFromNaklR: TAction;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    QuSumma: TMSQuery;
    ToolButton13: TToolButton;
    ActionOrderBlock: TAction;
    ActionOrderUnBlock: TAction;
    ToolButton14: TToolButton;
    spSetOrderReserve: TMSStoredProc;
    ToolButton15: TToolButton;
    DSVtTemp: TDataSource;
    FilterFirm: TTargetFilter_DictionaryFilter;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ActionCheckNakl: TAction;
    ActionItemCopy: TAction;
    ToolButton18: TToolButton;
    spCopyBlank: TMSStoredProc;
    Panel2: TPanel;
    Label1: TLabel;
    QueryExistBlank: TMSQuery;
    PanelMsg: TPanel;
    CBReason4: TCheckBox;
    CBReason5: TCheckBox;
    ActionAutoLoadAll: TAction;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    PB: TProgressBar;
    VTTemp: TVirtualTable;
    QuReason: TMSQuery;
    DsReason: TDataSource;
    QuCheckNakl: TMSQuery;
    QueryId: TIntegerField;
    QueryDocument_Id: TIntegerField;
    QueryNum: TStringField;
    QueryDatenakl: TDateTimeField;
    QuerySubnum: TIntegerField;
    QueryPostno: TSmallintField;
    QueryPostname: TStringField;
    QueryPostdaydelay: TSmallintField;
    QuerySotrudno: TSmallintField;
    QuerySotrudname: TStringField;
    QueryBuh: TSmallintField;
    QueryBuhname: TStringField;
    QueryVidnaklno: TSmallintField;
    QueryVidnaklname: TStringField;
    QueryUserno: TSmallintField;
    QueryUsername: TStringField;
    QueryAddressno: TSmallintField;
    QueryAddress: TStringField;
    QueryOtdelno: TSmallintField;
    QueryOtdelname: TStringField;
    QueryColnprice: TSmallintField;
    QueryColnpricename: TStringField;
    QueryKoldayplan: TSmallintField;
    QueryStatus: TSmallintField;
    QueryStatusname: TStringField;
    QuerySumma: TFloatField;
    QuerySumkol: TFloatField;
    QueryWeight: TFloatField;
    QueryDatecorrelation: TDateTimeField;
    QueryCreatedate: TDateTimeField;
    QueryIs_Read_Only: TIntegerField;
    QueryReserve: TSmallintField;
    QueryReasonid: TSmallintField;
    QueryReasonname: TStringField;
    QueryRashoddatenakl: TDateTimeField;
    QueryRashodnom: TIntegerField;
    QueryNaklno: TIntegerField;
    QueryRashodnum: TStringField;
    QuerySummain: TFloatField;
    QueryExpeditionno: TIntegerField;
    QueryParentid: TIntegerField;
    QueryVidtovgroupid: TLargeintField;
    QueryVidtovgroupname: TStringField;
    QueryDescription: TStringField;
    QueryDay_Of_Week: TIntegerField;
    QueryIncar: TBooleanField;
    QueryContract_Id: TIntegerField;
    QueryContract_Description: TStringField;
    QueryRegionno: TWordField;
    QueryRegionname: TStringField;
    QueryOurfirmno: TIntegerField;
    Queryrowid: TLargeintField;
    QueryTypeReturn: TStringField;
    QueryTimeCreate: TFloatField;
    QueryIdVeb: TStringField;
    ToolButtonTmpCross: TToolButton;
    QueryDescriptionOrderVeb: TStringField;
    QueryCurrencyHead: TStringField;
    QueryIsVeb: TBooleanField;
    procedure ActionItemAddExecute(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ActionItemPropExecute(Sender: TObject);
    procedure ActionGoBlankExecute(Sender: TObject);
    procedure ActionRestoreExecute(Sender: TObject);
    procedure ActionDelFromBlankExecute(Sender: TObject);
    procedure ActionItemDelExecute(Sender: TObject);
    procedure ActionGoExcelExecute(Sender: TObject);
    procedure ActionSpecPrintExecute(Sender: TObject);
    procedure DBLookupComboBoxDeptsClick(Sender: TObject);
    procedure ActionOpenCrossGridExecute(Sender: TObject);
    procedure ActionAllCorrelatiOnExecute(Sender: TObject);
    procedure ActionDelAllFromNaklRExecute(Sender: TObject);
    procedure ActionOrderBlockExecute(Sender: TObject);
    procedure ActionOrderUnBlockExecute(Sender: TObject);
    procedure DBGridDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure SQLBuilderGetParams(Sender: TObject; var Params: TParams);
    function ftTovarIsSelect(Sender: TObject): Boolean;
    function FilterFirma_OnSelectValue(
      Sender: TTargetFilter_DictionaryFilter; BtnBoundsRect: TRect;
      ConditionType: TDictionaryConditionType;
      ConditionGroup: TDictionaryConditionGroup; var Rec_PK,
      Rec_Title: Variant): Boolean;
    procedure ActionItemCopyExecute(Sender: TObject);
    procedure ActionAutoLoadAllExecute(Sender: TObject);
    procedure ActionCheckNaklExecute(Sender: TObject);
    function DBGridGetKey(Sender: TObject; DataSet: TDataSet): string;
    procedure ActionViewRefreshExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ActionOpenSpecExecute(Sender: TObject);
    procedure DBGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ToolButtonTmpCrossClick(Sender: TObject);
    procedure DBGridTitlePressed(Sender: TDBGrid; Field: TField);
{
    procedure DBGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
}

  protected
    procedure SetActionsEnabled; override;
  private
    Workdate: TDate;
    l_is_autoload: boolean;
    Is_ControlPostBanPay: Boolean;
    DescriptionBan: String;
    DescriptionBanPay: String;
    function CopyBlank(p_document_id: integer): Integer;
    procedure OpenSpec (p_id: Integer);
  public
    class procedure ShowListForm(aDeptID: integer; aDate: TDate; is_AutoLoad: boolean = false);
  end;

var
  ln_otdelNo, ln_day_of_week: integer;
  ld_date: TDate;
  MlekoBlankListForm: TMlekoBlankListForm;

implementation

uses data, MlekoBlankParam, MlekoBlankSpec,
  MlekoCrossBlankOrder, main, GetDate0, MlekoSelectTovar, MlekoSelectFIrm,
  CFLMLKCustomRep, UtilsCommon,MlekoBlnkPrivyazka, MlekoBlkParamPrivyazka,Meko_Blanc_Price,
  MlekoCrossBlankOrderTmp;

{$R *.dfm}

class procedure TMlekoBlankListForm.ShowListForm(aDeptID: integer; aDate: TDate; is_AutoLoad: boolean = false);
var
  lv_day_of_week: string;
begin
  ln_otdelNo := aDeptID;
  ld_date := aDate;
  dmDataModule.quWork.SQL.Clear;
  dmDataModule.quWork.SQL.Add('select DATEPART(dw, :p_date) as day_of_week,UserName, EditPost,(Select OtdelName from VidOtdel where OtdelNo=' +
    IntToStr(GlobalOtdelNo) + ') as OtdelName  from Users where UserNo=:UserNo');
  dmDataModule.quWork.ParamByName('p_date').AsDate := ld_date;
  dmDataModule.quWork.ParamByName('UserNo').AsInteger := Data.UserNo;
  dmDataModule.quWork.Open;
  ln_day_of_week := dmDataModule.quWork.fieldByName('day_of_week').AsInteger;
  case ln_day_of_week of
    1: lv_day_of_week := 'Понедельник';
    2: lv_day_of_week := 'Вторник';
    3: lv_day_of_week := 'Среда';
    4: lv_day_of_week := 'Четверг';
    5: lv_day_of_week := 'Пятница';
    6: lv_day_of_week := 'Суббота';
    7: lv_day_of_week := 'Воскресенье';
  end;
  with Create(Application) do
  begin
    EdDateBeg.Date := adate;
    EdDateEnd.Date := adate;
    if data.CodeAccess > 3 then gBPeriod.Enabled := false;
    PB.Visible := False;
    PanelMsg.Caption := 'День отгрузки: ' + lv_day_of_week;
    quDepts.Open;
    QuReason.Open;
    l_is_autoload := is_AutoLoad;
    VTTemp.Open;
    VTTemp.Insert;
    Workdate := aDate;
    if not Query.Active then ActionViewRefresh.Execute;
    //    Show;
  end;

end;

procedure TMlekoBlankListForm.ActionItemAddExecute(Sender: TObject);
var
  DocumentId: Int64;
  Res:Boolean;
begin
  inherited;
  DocumentId := -1;
  Res:=TMlekoBlankParamForm.AddBlankParam(DocumentId, VTTemp.FieldBYName('OtdelNo').AsInteger, ld_date, l_is_autoload);
  if Res then
  begin
    Query.Close;
    Query.Open;
    Query.Locate('id', DocumentId, []);
    OpenSpec(DocumentId);
  end;
end;

procedure TMlekoBlankListForm.DBGridDblClick(Sender: TObject);
var
  i,e:Integer;
   a:string;
begin
  inherited;
  if Query.FieldByName('Vidtovgroupname').AsString = '' then
  ShowMessage('Сформируйте заказ!') else
  begin
    Meko_Blanc_Price.BLANC_PRICE.NaborLabel.Caption:=Query.FieldValues['Vidtovgroupname'];
    Meko_Blanc_Price.BLANC_PRICE.FirmaLabel.Caption:=Query.FieldValues['Postname'];
    Meko_Blanc_Price.BLANC_PRICE.EnterPriceLabel.Caption:=Query.FieldValues['Colnpricename'];
    Meko_Blanc_Price.BLANC_PRICE.AcceptQuery.Close;
    Meko_Blanc_Price.BLANC_PRICE.AcceptQuery.SQL.Clear;
    Meko_Blanc_Price.BLANC_PRICE.AcceptQuery.SQL.Add('Select Accept from Post where Name='+''''+Meko_Blanc_Price.BLANC_PRICE.FirmaLabel.Caption+'''');
    Meko_Blanc_Price.BLANC_PRICE.AcceptQuery.Open;

    if Meko_Blanc_Price.BLANC_PRICE.AcceptQuery.FieldValues['Accept'] = null then Meko_Blanc_Price.BLANC_PRICE.Y_N_Label.Caption:=''
                                                                             else Meko_Blanc_Price.BLANC_PRICE.Y_N_Label.Caption:=Meko_Blanc_Price.BLANC_PRICE.AcceptQuery.FieldValues['Accept'];

    if  Meko_Blanc_Price.BLANC_PRICE.Y_N_Label.Caption = 'Y' then
     begin
       Meko_Blanc_Price.BLANC_PRICE.Firma  (Meko_Blanc_Price.BLANC_PRICE.FirmaLabel.Caption);
       Meko_Blanc_Price.BLANC_PRICE.Nabor (Meko_Blanc_Price.BLANC_PRICE.NaborLabel.Caption,QueryPostno.AsInteger);
       Meko_Blanc_Price.BLANC_PRICE.Vidname_Price_ITOG(Meko_Blanc_Price.BLANC_PRICE.FirmaLabel.Caption, Meko_Blanc_Price.BLANC_PRICE.EnterPriceLabel.Caption);
     end;

    begin
      MlekoBlnkPrivyazka.Privyazka.Memo1.Lines.Clear;
      MlekoBlnkPrivyazka.Privyazka.Label1.Caption:=Query.FieldValues['Vidtovgroupname'];
      a:=MlekoBlnkPrivyazka.Privyazka.Label1.Caption;
      MlekoBlnkPrivyazka.Privyazka.MSQuery1.Active:=True;
      MlekoBlnkPrivyazka.Privyazka.MSQuery1.Refresh;
      MlekoBlnkPrivyazka.Privyazka.MSQuery1.Filter:='nabor=' + QuotedStr(a);
      MlekoBlnkPrivyazka.Privyazka.MSQuery1.Filtered:=True;
      MlekoBlnkPrivyazka.Privyazka.MSQuery1.First;
      for i:=0 to MlekoBlnkPrivyazka.Privyazka.MSQuery1.RecordCount -1   do
       begin
         MlekoBlnkPrivyazka.Privyazka.Memo1.Lines.Add(MlekoBlnkPrivyazka.Privyazka.MSQuery1.FieldByName('vidname').AsString);
         MlekoBlnkPrivyazka.Privyazka.MSQuery1.Next;
       end;
    end;

    begin
      MlekoBlkParamPrivyazka.NaborAddTovar.Memo1.Lines.Clear;
      MlekoBlkParamPrivyazka.NaborAddTovar.Label1.Caption:=Query.FieldValues['Vidtovgroupname'];
      a:=MlekoBlkParamPrivyazka.NaborAddTovar.Label1.Caption;
      MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.Active:=True;
      MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.Refresh;
      MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.Filter:='nabor=' + QuotedStr(a);
      MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.Filtered:=True;
      MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.First;
      for i:=0 to MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.RecordCount -1   do
       begin
         MlekoBlkParamPrivyazka.NaborAddTovar.Memo1.Lines.Add(MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.FieldByName('vidname').AsString);
         MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.Next;
       end;


    end;
    Meko_Blanc_Price.BLANC_PRICE.Price_Change(Meko_Blanc_Price.BLANC_PRICE.FirmaLabel.Caption);

  end;

  OpenSpec(Query.FieldByName('document_id').Value);
end;

procedure TMlekoBlankListForm.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i,e:Integer;
  a:string;
begin
//  inherited;

  if (Key = VK_DOWN) or (Key =  VK_UP) then SearchString := '';
  if (Key = VK_RETURN) then
  begin
    if Query.FieldByName('Vidtovgroupname').AsString = '' then
    ShowMessage('Сформируйте заказ!') else
    begin
      Meko_Blanc_Price.BLANC_PRICE.NaborLabel.Caption:=Query.FieldValues['Vidtovgroupname'];
      Meko_Blanc_Price.BLANC_PRICE.FirmaLabel.Caption:=Query.FieldValues['Postname'];
      Meko_Blanc_Price.BLANC_PRICE.EnterPriceLabel.Caption:=Query.FieldValues['Colnpricename'];
      Meko_Blanc_Price.BLANC_PRICE.AcceptQuery.Close;
      Meko_Blanc_Price.BLANC_PRICE.AcceptQuery.SQL.Clear;
      Meko_Blanc_Price.BLANC_PRICE.AcceptQuery.SQL.Add('Select Accept from Post where Name='+''''+Meko_Blanc_Price.BLANC_PRICE.FirmaLabel.Caption+'''');
      Meko_Blanc_Price.BLANC_PRICE.AcceptQuery.Open;

      if Meko_Blanc_Price.BLANC_PRICE.AcceptQuery.FieldValues['Accept'] = null then Meko_Blanc_Price.BLANC_PRICE.Y_N_Label.Caption:=''
                                                                               else Meko_Blanc_Price.BLANC_PRICE.Y_N_Label.Caption:=Meko_Blanc_Price.BLANC_PRICE.AcceptQuery.FieldValues['Accept'];

      if  Meko_Blanc_Price.BLANC_PRICE.Y_N_Label.Caption = 'Y' then
       begin
         Meko_Blanc_Price.BLANC_PRICE.Firma  (Meko_Blanc_Price.BLANC_PRICE.FirmaLabel.Caption);
         Meko_Blanc_Price.BLANC_PRICE.Nabor (Meko_Blanc_Price.BLANC_PRICE.NaborLabel.Caption,QueryPostno.AsInteger);
         Meko_Blanc_Price.BLANC_PRICE.Vidname_Price_ITOG(Meko_Blanc_Price.BLANC_PRICE.FirmaLabel.Caption, Meko_Blanc_Price.BLANC_PRICE.EnterPriceLabel.Caption);
       end;

      begin
        MlekoBlnkPrivyazka.Privyazka.Memo1.Lines.Clear;
        MlekoBlnkPrivyazka.Privyazka.Label1.Caption:=Query.FieldValues['Vidtovgroupname'];
        a:=MlekoBlnkPrivyazka.Privyazka.Label1.Caption;
        MlekoBlnkPrivyazka.Privyazka.MSQuery1.Active:=True;
        MlekoBlnkPrivyazka.Privyazka.MSQuery1.Refresh;
        MlekoBlnkPrivyazka.Privyazka.MSQuery1.Filter:='nabor=' + QuotedStr(a);
        MlekoBlnkPrivyazka.Privyazka.MSQuery1.Filtered:=True;
        MlekoBlnkPrivyazka.Privyazka.MSQuery1.First;
        for i:=0 to MlekoBlnkPrivyazka.Privyazka.MSQuery1.RecordCount -1   do
         begin
           MlekoBlnkPrivyazka.Privyazka.Memo1.Lines.Add(MlekoBlnkPrivyazka.Privyazka.MSQuery1.FieldByName('vidname').AsString);
           MlekoBlnkPrivyazka.Privyazka.MSQuery1.Next;
         end;
      end;

      begin
        MlekoBlkParamPrivyazka.NaborAddTovar.Memo1.Lines.Clear;
        MlekoBlkParamPrivyazka.NaborAddTovar.Label1.Caption:=Query.FieldValues['Vidtovgroupname'];
        a:=MlekoBlkParamPrivyazka.NaborAddTovar.Label1.Caption;
        MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.Active:=True;
        MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.Refresh;
        MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.Filter:='nabor=' + QuotedStr(a);
        MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.Filtered:=True;
        MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.First;
        for i:=0 to MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.RecordCount -1   do
         begin
           MlekoBlkParamPrivyazka.NaborAddTovar.Memo1.Lines.Add(MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.FieldByName('vidname').AsString);
           MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.Next;
         end;


      end;
      Meko_Blanc_Price.BLANC_PRICE.Price_Change(Meko_Blanc_Price.BLANC_PRICE.FirmaLabel.Caption);

    end;

    OpenSpec(Query.FieldByName('document_id').Value);
  end;
end;

procedure TMlekoBlankListForm.ActionItemPropExecute(Sender: TObject);
var
  documentId: Int64;
begin
  inherited;
  documentId := SQLBuilder.Query.FieldByName('document_ID').Value;
  if TMlekoBlankParamForm.EditBlankParam(DocumentId, l_is_autoload) then
  begin
    DBGrid.Refresh;
  end;
end;

procedure TMlekoBlankListForm.ActionGoBlankExecute(Sender: TObject);
var
  documentId: Int64;
  Period: TPeriodDate;
  Dlg: TMlekoBlankParamForm;
begin
  inherited;

  Dlg := TMlekoBlankParamForm.Create(Application);
  Dlg.quPostBan.Close;
  Dlg.quPostBan.Params.ParamByName('p_PostNo').Value := QueryPostno.Value;
  Dlg.quPostBan.Open;

  Dlg.quPostBanPay.Close;
  Dlg.quPostBanPay.Params.ParamByName('PostNo').Value := QueryPostno.Value;
  Dlg.quPostBanPay.Params.ParamByName('set_article_group_id').Value := QueryVidtovgroupid.Value;
  Dlg.quPostBanPay.Params.ParamByName('Buh').Value := QueryBuh.Value;
  Dlg.quPostBanPay.Open;

  dlg.quControlPayBan.Close;
  dlg.quControlPayBan.Params.ParamByName('PostNo').Value := QueryPostno.Value;
  Dlg.quControlPayBan.Params.ParamByName('set_article_group_id').Value := QueryVidtovgroupid.Value;
  Dlg.quControlPayBan.Params.ParamByName('Buh').Value := QueryBuh.Value;
  Dlg.quControlPayBan.Params.ParamByName('DateNakl').Value := QueryDatenakl.Value;
  Dlg.quControlPayBan.Open;

  Dlg.quSummaDolga.Close;
  dlg.quSummaDolga.Params.ParamByName('PostNo').Value := QueryPostno.Value;
  Dlg.quSummaDolga.Params.ParamByName('set_article_group_id').Value := QueryVidtovgroupid.Value;
  dlg.quSummaDolga.Params.ParamByName('Buh').Value := QueryBuh.Value;
  Dlg.quSummaDolga.Open;


  if dlg.quControlPayBan.RecordCount > 0 then Is_ControlPostBanPay := false else Is_ControlPostBanPay := true;

  if (Dlg.quPostBanPostBan.Value = 1) and (QueryReasonid.Value = 7) then
  begin
    DescriptionBan := 'Для этой фирмы запрещено делать возврат товара' +#13#10+ Dlg.quPostBanDescription.Value;
    raise Exception.Create(DescriptionBan);//ShowMessage(DescriptionBan);
  end;

  if ((Dlg.quSummaDolgaSUMMA_ECO.Value > Dlg.quPostBanPayPayBan.Value) and (Dlg.quPostBanPayPayBan.Value <>0)
                                                                       and (Is_ControlPostBanPay = True)) then
  begin
    DescriptionBanPay := 'Превышен лимит ' +#13#10+ 'Сумма долга ' + FloatToStr(Dlg.quSummaDolgaSUMMA_ECO.Value) +#13#10+ 'Допустимый лимит '+ FloatToStr(Dlg.quPostBanPayPayBan.Value);
    raise Exception.Create('Превышен лимит ' +#13#10+ 'Сумма долга ' + FloatToStr(Dlg.quSummaDolgaSUMMA_ECO.Value) +#13#10+ 'Допустимый лимит '+ FloatToStr(Dlg.quPostBanPayPayBan.Value));
//    raise Exception.Create(DescriptionBan);
  end;
  Dlg.quSummaDolga.Close;
  dlg.quControlPayBan.Close;
  Dlg.quPostBanPay.Close;
  Dlg.quPostBan.Close;
  Dlg.Free;

  if Application.MessageBox('Будут сформирована накладная из заказа, вы уверены?', 'Заказ', MB_YESNO) = IDYES then
  begin
    Period := ZapDate(1, ld_date, 'Введите дату формирования накладных');
    if Period[1] = 0 then exit;
    Screen.Cursor := crHourGlass;
    documentId := Query.FieldByName('document_ID').Value;
    spBlankCorrelation.Close;
    spBlankCorrelation.Prepare;
    spBlankCorrelation.Params.ParamByName('p_document_id').Value := documentId;
    spBlankCorrelation.Params.ParamByName('p_dateNakl').Value := Period[1];
    spBlankCorrelation.ExecProc;
{
    if ((Query.FieldByName('ReasonId').Value = 11) or (Query.FieldByName('ReasonId').Value = 7)) then
     begin

     end;
}
    Query.Refresh;
    Screen.Cursor := crDefault;
  end;
end;

procedure TMlekoBlankListForm.ActionRestoreExecute(Sender: TObject);
var
  documentId: Int64;
  Dlg: TMlekoBlankParamForm;
  quSumDocum : TMSQuery;
  quDocum : TMSQuery;
  SumDoc : Double;
begin
  inherited;

  quDocum := TMSQuery.Create(nil);
  quDocum.Connection:= dmDataModule.DB;
  quDocum.SQL.Clear;
  quDocum.SQL.Text:='select PostNo, Buh, VidtovGroupId, DateNakl from e_blank_head where id = :Document_id';
  quDocum.ParamByName('Document_id').Value := QueryDocument_Id.Value;
  quDocum.Open;

  Dlg := TMlekoBlankParamForm.Create(Application);

  Dlg.quSummaDolga.Close;
  Dlg.quSummaDolga.Params.ParamByName('PostNo').Value := quDocum.FieldByName('PostNo').Value;
  Dlg.quSummaDolga.Params.ParamByName('set_article_group_id').Value := quDocum.FieldByName('VidtovGroupId').Value;
  dlg.quSummaDolga.Params.ParamByName('Buh').Value := quDocum.FieldByName('Buh').Value;
  Dlg.quSummaDolga.Open;

  Dlg.quPostBanPay.Close;
  Dlg.quPostBanPay.Params.ParamByName('PostNo').Value := quDocum.FieldByName('PostNo').Value;
  Dlg.quPostBanPay.Params.ParamByName('set_article_group_id').Value := quDocum.FieldByName('VidtovGroupId').Value;
  Dlg.quPostBanPay.Params.ParamByName('Buh').Value := quDocum.FieldByName('Buh').Value;
  Dlg.quPostBanPay.Open;

  Dlg.quControlPayBan.Close;
  Dlg.quControlPayBan.Params.ParamByName('PostNo').Value := quDocum.FieldByName('PostNo').Value;
  Dlg.quControlPayBan.Params.ParamByName('set_article_group_id').Value := quDocum.FieldByName('VidtovGroupId').Value;
  Dlg.quControlPayBan.Params.ParamByName('Buh').Value := quDocum.FieldByName('Buh').Value;
  Dlg.quControlPayBan.Params.ParamByName('DateNakl').Value := quDocum.FieldByName('DateNakl').Value;
  Dlg.quControlPayBan.Open;

  quSumDocum := TMSQuery.Create(nil);
  quSumDocum.Connection:= dmDataModule.DB;
  quSumDocum.SQL.Clear;
  quSumDocum.SQL.Text:='select isnull(SUM(isnull(KolOrd,0) * isnull(Boss_price,0)),0) as summ from e_blanks where Document_id = :Document_id';
  quSumDocum.ParamByName('Document_id').Value := QueryDocument_Id.Value;
  quSumDocum.Open;



  SumDoc := quSumDocum.FieldByName('summ').Value;


  if dlg.quControlPayBan.RecordCount > 0 then Is_ControlPostBanPay := false else Is_ControlPostBanPay := true;

  if (((Dlg.quSummaDolgaSUMMA_ECO.Value + SumDoc) > Dlg.quPostBanPayPayBan.Value) and (Dlg.quPostBanPayPayBan.Value <>0)
                                                                                  and (Is_ControlPostBanPay = True))
   then begin

           DescriptionBanPay := 'Превышен лимит! ' +#13#10+ 'Сумма дебиторской задолженности с учетом текущего заказа ' + FloatToStr(Dlg.quSummaDolgaSUMMA_ECO.Value + quSumDocum.FieldByName('summ').Value)
                                                  +#13#10+ 'Допустимый лимит '+ FloatToStr(Dlg.quPostBanPayPayBan.Value)
                                                  +#13#10+ 'Восстановление невозможно!';
           ShowMessage(DescriptionBanPay);

        end
   else begin
           Screen.Cursor := crHourGlass;
           documentId := SQLBuilder.Query.FieldByName('document_ID').Value;
           spRestoreInputOrder.Close;
           spRestoreInputOrder.Prepare;
           spRestoreInputOrder.Params.ParamByName('document_id').Value := documentId;
           spRestoreInputOrder.ExecProc;
           Query.Refresh;
           Screen.Cursor := crDefault;
        end;

  quDocum.Close;
  quSumDocum.Close;

  Dlg.quSummaDolga.Close;
  dlg.quControlPayBan.Close;
  Dlg.quPostBanPay.Close;

  Dlg.Free;
end;

procedure TMlekoBlankListForm.ActionDelFromBlankExecute(Sender: TObject);
var
  documentId: Int64;
begin
  inherited;
  documentId := Query.FieldByName('document_ID').Value;
  SpDelOrderFromSetka.Close;
  SpDelOrderFromSetka.Prepare;
  SpDelOrderFromSetka.Params.ParamByName('document_id').Value := documentId;
  SpDelOrderFromSetka.ExecProc;
  SpDelOrderFromSetka.Close;
  Query.Refresh;
end;

procedure TMlekoBlankListForm.ActionItemDelExecute(Sender: TObject);
var
  documentId: Int64;
begin
  inherited;
  spDelInputOrder.Close;
  spDelInputOrder.Params.ParamByName('document_id').Value := Query.FieldByName('ID').Value;
  spDelInputOrder.ExecProc;
  spDelInputOrder.Close;
  Query.Refresh;
end;

procedure TMlekoBlankListForm.SetActionsEnabled;
var
  ne, c, aEditEnabled: boolean;
  status: Integer;
begin
  inherited;
  ne := not (Query.IsEmpty or ((Query.FieldByName('DateNakl').AsDateTime <= Date()) and (data.CodeAccess > 4)));
  status := Query.FieldByName('Status').AsInteger;
  ActionRestore.Enabled := ne and (status = -1); //and (data.CodeAccess<4);
  ActionDelFromBlank.Enabled := ne and (status = 1); //and (data.CodeAccess<4);
  ActionGoBlank.Enabled := ne and (status = 0) and (data.CodeAccess < 9);
  ActionItemProp.Enabled := ne and (status = 0) and ((not ((not l_is_autoload) and (Query.FieldByName('ReasonId').AsInteger in [4, 5]))) or
    (Data.CodeAccess < 3));
  //  ActionItemProp.Enabled:=False;
  ActionItemDel.Enabled := ne and (status = 0) and not ((not l_is_autoload) and (Query.FieldByName('ReasonId').AsInteger in [4]));
  ActionOrderUnBlock.Enabled := ne and (Query.FieldByName('reserve').AsInteger = 1) and (data.CodeAccess < 8);
  ActionOrderBlock.Enabled := ne and (not (Query.FieldByName('reserve').AsInteger = 1)) and (status = 0);
  
end;

procedure TMlekoBlankListForm.ActionGoExcelExecute(Sender: TObject);
begin
  inherited;
  DbGrid.CopyGridToExcel;
end;

procedure TMlekoBlankListForm.ActionSpecPrintExecute(Sender: TObject);
{var l_report_id,l_print_template_id :Integer;
l_list_value_param,l_list_name_param: Tstrings;
l_report:TCFLFrxReport;
ExcelFlt:TfrxXLSExport;}
begin
  {  inherited;
    try
     l_report:=TCFLFrxReport.GetReport(Self,56,35);
     l_report.AddRepParam('document_id',Query.FIeldByName('ID').AsInteger);
     l_report.PrepareReport;
     l_report.ShowPreparedReport;
    finally
     l_report.Free;
    end;}
end;

procedure TMlekoBlankListForm.DBLookupComboBoxDeptsClick(Sender: TObject);
var
  otdelNo: integer;
begin
  inherited;
end;

procedure TMlekoBlankListForm.ActionOpenCrossGridExecute(Sender: TObject);
begin
  inherited;
  //     if (FilterType.a_KeyValue = null) then ln_otdelNo:=-1 else ln_otdelNo:=FilterType.a_KeyValue;
  Edit_CrossBlankOrder := True;
  TMlekoCrossBlankOrderForm.ShowFormBrand(ld_date);
end;

procedure TMlekoBlankListForm.ActionAllCorrelatiOnExecute(Sender: TObject);
var
  Period: TPeriodDate;
  i, cnt_zero, cnt_minus: Integer;
  ListNakl: TStrings;
  l_sql: string;
  Params: TParams;
  ListTovarErr : string;
  formattedDateTime : string;
begin
  inherited;
  ListNakl := TStringList.Create;
  ListNakl.AddStrings(DBGrid.MarkItems);
  if DBGrid.MarkItems.Count = 0 then
  begin
    MessageDlg('Не отмечена ни одна накладная нажмите * чтобы пометить все или F4 чтоб пометить ' + #13 + #10 + 'несколько накладных!', mtWarning,
      [mbOK], 0);
    if Assigned(ListNakl) then ListNakl.Free;
    Exit;
  end;
  if Application.MessageBox('Начнется процесс формирования накладных, вы уверены?', 'Заказ', MB_YESNO) = IDNo then
  begin
    if Assigned(ListNakl) then ListNakl.Free;
    exit;
  end;

  dmDataModule.QFO.SQL.Clear;

  l_sql := 'select o.TovarNo ' +
           '     , r.NameTovar ' +
           '     , r.VidName ' +
           '     , o.kol as KolOstatok ' +
           '     , r.Kol as KolRashod ' +
           '     , o.Kol - r.Kol as KolAll  ' +
           ' from Ostatok o inner join ' +
           '      (select  s.TovarNo ' +
           '             , t.NameTovar ' +
           '             , vt.VidName ' +
           '             , sum(s.KolOrd) as Kol ' +
           '        from e_blanks s inner join ' +
           '             e_blank_head h on h.id = s.Document_id inner join ' +
           '             d_doc_type dt on h.VidNaklNo = dt.VidNaklNo inner join ' +
           '             Tovar t on t.TovarNo = s.TovarNo inner join ' +
           '             VidTov vt on vt.VidNo = t.VidNo ' +
           '         where s.DateNakl = :p_Date ' +
           '           and h.status <> -1 ' +           
           '           and s.vidNaklNo = 1 ' +
           '           and dt.entity_code = ''NAKLR'' '+
           '       group by s.TovarNo, t.NameTovar, vt.VidName) r on r.TovarNo = o.TovarNo ' +
           '  where (o.Kol - r.Kol < 0)';

  dmDataModule.QFO.SQL.Add(l_sql);
  dmDataModule.QFO.ParamByName('p_Date').AsDateTime := ld_date;
  dmDataModule.QFO.Open;

  if dmDataModule.QFO.RecordCount > 0 then begin
                                             dmDataModule.QFO.First;
                                             ListTovarErr := '';
                                             while not dmDataModule.QFO.Eof do
                                              begin
                                                 ListTovarErr := ListTovarErr +#13#10+ dmDataModule.QFO.FieldbyName('TovarNo').AsString+' '+dmDataModule.QFO.FieldbyName('NameTovar').AsString+' Бренд: '+dmDataModule.QFO.FieldbyName('VidName').AsString+'  Кол-во: '+dmDataModule.QFO.FieldbyName('KolAll').AsString;
                                                 dmDataModule.QFO.Next;
                                              end;
                                              DateTimeToString(formattedDateTime,'dd/mm/yyyy',ld_date);
                                              raise Exception.Create('В заказах присутствуют товары с недостаточным количеством на остатках:' +#13#10+
                                                                     ListTovarErr +#13#10+#13#10+
                                                                     'Рабочая дата: ' + formattedDateTime);
                                           end;


  dmDataModule.QFO.Close;

  dmDataModule.QFO.SQL.Clear;

  l_sql := ' SELECT Sum(CASE  ' +
    '            WHEN Isnull(priceout,0) = 0 THEN 1 ' +
    '            ELSE 0 ' +
    '          END) AS cnt_zero ' +
    '      ,Sum(CASE  ' +
    '            WHEN Isnull(priceout,0) < Isnull(avgpricein,0) THEN 1 ' +
    '             ELSE 0 ' +
    '           END) AS cnt_minus ' +
    ' FROM   v_blanks_rashod ' +
    ' WHERE  datenakl = :p1_date ' +
    ' AND ((Isnull(priceout,0) < Isnull(avgpricein,0)) or Isnull(priceout,0)=0) ';
  dmDataModule.QFO.SQL.Add(l_sql);

  dmDataModule.QFO.ParamByName('p1_date').AsDateTime := ld_date;

//  ShowMessage (DateToStr(ld_date));
  //dmDataModule.QFO.Debug := True;
  dmDataModule.QFO.Open;

  cnt_zero := dmDataModule.qfo.FieldByName('cnt_zero').AsInteger;
  cnt_minus := dmDataModule.qfo.FieldByName('cnt_minus').AsInteger;

  if cnt_zero > 0 then
  begin
    ListTovarErr := '';
    l_sql := 'select  Document_id as Document_id'+
             '      , TovarNo '+
             '      , NameTovar '+
             ' from v_blanks_rashod '+
             '  where datenakl = :p1_date '+
             '    and Isnull(priceout,0) = 0 ';

    dmDataModule.QFO.SQL.Clear;         
    dmDataModule.QFO.SQL.Add(l_sql);
    dmDataModule.QFO.ParamByName('p1_date').AsDateTime := ld_date;
    dmDataModule.QFO.Open;
    while not dmDataModule.QFO.Eof do
     begin
       ListTovarErr := ListTovarErr +#13#10+'Id заказа: '+ dmDataModule.QFO.FieldbyName('Document_id').AsString
                                           +'Код товара: '+ dmDataModule.QFO.FieldbyName('TovarNo').AsString
                                           +' '+ dmDataModule.QFO.FieldbyName('NameTovar').AsString;
       dmDataModule.QFO.Next;
     end;
    ListTovarErr := 'Присутствуют позиции с нулевыми ценами: ' +  ListTovarErr;
    Application.MessageBox(PChar(ListTovarErr), 'Внимание', MB_OK);
//    ShowMessage (ListTovarErr);
    if Assigned(ListNakl) then ListNakl.Free;
    Exit;
  end;
  if cnt_minus > 0 then
  begin
    ActionCheckNakl.Execute;
    if Application.MessageBox('Найдены цены ниже входных, продолжть ?',
      'Ошибочные цены', MB_YESNO + MB_ICONWARNING) = IDNO then
    begin
      ListTovarErr := '';
      l_sql := 'select  Document_id '+
               '      , TovarNo '+
               ' 	    , NameTovar '+
               ' from v_blanks_rashod '+
               '  where datenakl = :p1_date '+
               '    and (Isnull(priceout,0) < Isnull(avgpricein,0)) ';

      dmDataModule.QFO.SQL.Add(l_sql);
      dmDataModule.QFO.ParamByName('p1_date').AsDateTime := ld_date;
      dmDataModule.QFO.Open;
      while not dmDataModule.QFO.Eof do
       begin
         ListTovarErr := ListTovarErr +#13#10+'Id заказа: '+ dmDataModule.QFO.FieldbyName('Document_id').AsString
                                             +'Код товара: '+ dmDataModule.QFO.FieldbyName('TovarNo').AsString
                                             +' '+ dmDataModule.QFO.FieldbyName('NameTovar').AsString;
         dmDataModule.QFO.Next;
       end;
      ShowMessage(ListTovarErr);
      if Assigned(ListNakl) then ListNakl.Free;
      Exit;
    end;
  end;
  Period := ZapDate(1, ld_date, 'Введите дату формирования накладных');
  if Period[1] = 0 then
  begin
    if Assigned(ListNakl) then ListNakl.Free;
    exit;
  end;

  try
    dmDataModule.ExecSQL('update cp_rest set Is_ActivCreateNakl = 1');
    PB.Visible := true;
    PB.Max := ListNakl.Count;
    for i := 0 to ListNakl.Count - 1 do
    begin
      PB.Position := i;
      PB.Refresh;
      spBlankCorrelation.Close;
      spBlankCorrelation.Params.ParamByName('p_document_id').Value := StrToInt64(ListNakl[i]);
      spBlankCorrelation.Params.ParamByName('p_dateNakl').Value := Period[1];
      spBlankCorrelation.ExecProc;
    end;
    dmDataModule.ExecSQL('update cp_rest set Is_ActivCreateNakl = 0');
    QuCheckNakl.Close;
    QuCheckNakl.ParamByName('p_date_nakl').AsDate := ld_date;
    QuCheckNakl.Open;
    if not QuCheckNakl.Eof then
    begin
      Application.MessageBox('Ошибка формирования, не все накладные сформированы, сообщите программисту!!!', 'Внимание!!!', MB_OK);
      Params := TParams.Create;
      try
        UtilsCommon.SetParamValue(Params, 'p_date_nakl', ld_date);
        TCFLMLKCustomRepDlg.ShowRep(84, Params);
      finally
        Params.Free;
      end;
    end;
  finally
    PB.Visible := false;
    if Assigned(ListNakl) then ListNakl.Free;
    ActionViewRefreshExecute(Self);
    Screen.Cursor := crDefault;
  end;
end;

procedure TMlekoBlankListForm.ActionDelAllFromNaklRExecute(
  Sender: TObject);
var
  i: Integer;
begin
  inherited;
  if DBGrid.MarkItems.Count = 0 then
  begin
    MessageDlg('Не отмечена ни одна накладная нажмите * чтобы пометить все или F4 чтоб пометить ' + #13 + #10 + 'не сколько накладных!', mtWarning,
      [mbOK], 0);
    Exit;
  end;
  if Application.MessageBox('Помеченные сформированные накладные из заказов за текущий день будут удалены, вы уверены?', 'Заказ', MB_YESNO) = IDYES
    then
  begin
    PB.Visible := true;
    PB.Max := DBGrid.MarkItems.Count;
    try
      for i := 0 to DBGrid.MarkItems.Count - 1 do
      begin
        PB.Position := i;
        PB.Refresh;
        SpDelOrderFromSetka.Close;
        SpDelOrderFromSetka.Params.ParamByName('document_id').Value := StrToInt64(DBGrid.MarkItems[i]);
        SpDelOrderFromSetka.ExecProc;
      end;
    finally
      PB.Visible := False;
      ActionViewRefreshExecute(Self);
    end;
  end;
end;

procedure TMlekoBlankListForm.ActionOrderBlockExecute(Sender: TObject);
begin
  inherited;
  spSetOrderReserve.Close;
  spSetOrderReserve.Params.ParamByName('p_document_id').Value := Query.FieldByName('document_ID').Value;
  spSetOrderReserve.Params.ParamByName('p_reserve').AsInteger := 1;
  spSetOrderReserve.ExecProc;
  spSetOrderReserve.Close;
  Query.Refresh;
end;

procedure TMlekoBlankListForm.ActionOrderUnBlockExecute(Sender: TObject);
begin
  inherited;
  spSetOrderReserve.Close;
  spSetOrderReserve.Params.ParamByName('p_document_id').Value := Query.FieldByName('document_ID').Value;
  spSetOrderReserve.Params.ParamByName('p_reserve').AsInteger := 0;
  spSetOrderReserve.ExecProc;
  spSetOrderReserve.Close;
  Query.Refresh;
end;

procedure TMlekoBlankListForm.DBGridDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  {  if (GenInputOrder.FieldByName('is_set_price').AsString='$')
      and (Field.FieldName='boss_price')
        then DbGrid.Canvas.Brush.Color:=clGreen;}
  try
    if (DS.DataSet.FieldByName('Status').AsInteger = 1) then
    begin
      DbGrid.Canvas.Brush.Color := $00C4FF88;
      DBGrid.Canvas.Font.Color := ClBlack;
    end;
    if (DS.DataSet.FieldByName('reserve').AsInteger = 1) then
    begin
      DbGrid.Canvas.Brush.Color := clYellow;
      DBGrid.Canvas.Font.Color := ClBlack;
    end;

    if DS.DataSet.FieldByName('ReasonId').AsInteger = 4 then
    begin
      DBGrid.Canvas.Font.Style := DBGrid.Canvas.Font.Style + [fsBold];
      DBGrid.Canvas.Font.Color := $00C79247;
    end;
    if (DS.DataSet.FieldByName('Status').AsInteger = -1) then
    begin
      DbGrid.Canvas.Brush.Color := clInactiveCaptionText;
      DBGrid.Canvas.Font.Color := ClBlack;
    end;
  except
  end;
end;

procedure TMlekoBlankListForm.SQLBuilderGetParams(Sender: TObject;
  var Params: TParams);
var
  otdel, tovar, is_show_all_tov, p_reason4, p_reason5, is_show_all_Reason: integer;
begin
  inherited;
  if VTTemp.State in [dsInsert, DsEdit] then VTTemp.Post;

  if VTTemp.FieldBYName('OtdelNo').IsNull then
    otdel := ln_otdelNo
  else
    otdel := VTTemp.FieldBYName('OtdelNo').AsInteger;

  if ftTovar.Text = '' then
    is_show_all_tov := 1
  else
  begin
    is_show_all_tov := 0;
    tovar := StrToInt(ftTovar.KeyFieldValue);
  end;

  if VTTemp.FieldByName('reason_id').IsNull then
    is_show_all_Reason := 1
  else
    is_show_all_Reason := 0;

  UtilsCommon.SetParamValue(Params, 'p_date_beg', EdDateBeg.Date);
  UtilsCommon.SetParamValue(Params, 'p_date_end', EdDateEnd.Date);
  UtilsCommon.SetParamValue(Params, 'P_OTDELNO', otdel);
  UtilsCommon.SetParamValue(Params, 'P_SHOW_ALL', otdel);
  UtilsCommon.SetParamValue(Params, 'p_tovarno', tovar);
  UtilsCommon.SetParamValue(Params, 'is_show_all_tov', is_show_all_tov);
  UtilsCommon.SetParamValue(Params, 'OurFirmNo', dmDataModule.FirmNo);
  UtilsCommon.SetParamValue(Params, 'reason_id', VTTemp.FieldByName('reason_id').AsInteger);
  UtilsCommon.SetParamValue(Params, 'is_show_all_Reason', is_show_all_Reason);

end;

function TMlekoBlankListForm.ftTovarIsSelect(Sender: TObject): Boolean;
var
  ID: Integer;
begin
  inherited;
  result := TMlekoSelectTovarDlg.SelectTovar(ID);
  if Result then
  begin
    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('select NameTovar from Tovar where TovarNo=' + IntToStr(ID));
    dmDataModule.quWork.Open;
    (Sender as TcitCustomEdit).Text := dmDataModule.quWork.FieldByName('NameTovar').AsString;
    (Sender as TcitDBComboEdit).KeyFieldValue := IntToStr(ID);
  end;
end;

function TMlekoBlankListForm.FilterFirma_OnSelectValue(
  Sender: TTargetFilter_DictionaryFilter; BtnBoundsRect: TRect;
  ConditionType: TDictionaryConditionType;
  ConditionGroup: TDictionaryConditionGroup; var Rec_PK,
  Rec_Title: Variant): Boolean;
var
  ID: integer;
begin
  inherited;
  if VarIsNull(Rec_PK) then
    ID := 0
  else
    ID := Rec_PK;
  Result := TMlekoSelectFirmDlg.SelectFirm(ID);
  if Result then
  begin
    Rec_PK := ID;
    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('select NameLong from Post where PostNo=' + IntToStr(ID));
    dmDataModule.quWork.Open;
    Rec_Title := dmDataModule.quWork.FieldByName('NameLong').AsString;
  end;
end;

procedure TMlekoBlankListForm.ActionItemCopyExecute(Sender: TObject);
var
  l_id: integer;
  ls_RashodNum, lv_msg: string;
begin
  inherited;
  Query.Refresh;
  QueryExistBlank.Close;
  QueryExistBlank.Params.ParamByName('p_DateNakl').Value := ld_date;
  QueryExistBlank.Params.ParamByName('p_PostNo').Value := Query.FieldByName('PostNo').AsInteger;
  QueryExistBlank.Params.ParamByName('p_AddressNo').Value := Query.FieldByName('AddressNo').AsInteger;
  QueryExistBlank.Params.ParamByName('p_VidTovGroupId').Value := Query.FieldByName('VidTovGroupId').AsInteger;
  QueryExistBlank.Params.ParamByName('p_OtdelNo').Value := Query.FieldByName('OtdelNo').AsInteger;
  QueryExistBlank.Params.ParamByName('p_SotrudNo').Value := Query.FieldByName('SotrudNo').AsInteger;
  QueryExistBlank.Params.ParamByName('p_ColNPrice').Value := Query.FieldByName('ColNPrice').AsInteger;
  QueryExistBlank.Open;

  if not QueryExistBlank.FieldByName('ID').IsNull then
  begin
    ls_RashodNum := QueryExistBlank.FieldByName('RashodNum').AsString;
    lv_msg := 'Внимание!!! Заказ уже существует(' + ls_RashodNum + '). Отменить заказ? ' + '(' + QueryExistBlank.FieldByName('ID').AsString + ')';
    if Application.MessageBox(PChar(lv_msg), 'Заказ', MB_YESNO) = IDYES then Exit;
  end;

  spCopyBlank.Close;
  spCopyBlank.Params.ParamByName('p_document_id').Value := Query.FieldByName('document_ID').Value;
  spCopyBlank.Params.ParamByName('p_date_to').Value := ld_date;
  spCopyBlank.Params.ParamByName('p_UserNo').Value := data.UserNo;
  spCopyBlank.ExecProc;
  l_id := spCopyBlank.Params.ParamByName('p_document_id').Value;
  
  OpenSpec(l_id);
end;

procedure TMlekoBlankListForm.ActionAutoLoadAllExecute(Sender: TObject);
begin
  inherited;
  CBReason4.Checked := true;
  CBReason5.Checked := false;
  ActionViewRefreshExecute(Self);
  Screen.Cursor := crHourGlass;
  Query.First;
  while not Query.Eof do
  begin
    spCopyBlank.Close;
    spCopyBlank.Prepare;
    spCopyBlank.Params.ParamByName('p_document_id').Value := Query.FieldByName('document_ID').Value;
    spCopyBlank.Params.ParamByName('p_date_to').Value := ld_date;
    spCopyBlank.Params.ParamByName('p_UserNo').Value := data.UserNo;
    spCopyBlank.ExecProc;
    Query.Next;
  end;

  CBReason4.Checked := false;
  CBReason5.Checked := false;
  ActionViewRefreshExecute(Self);
end;

function TMlekoBlankListForm.CopyBlank(p_document_id: integer): Integer;
begin
  ///
end;

procedure TMlekoBlankListForm.ActionCheckNaklExecute(Sender: TObject);
var
  Params: TParams;
begin
  inherited;
  Params := TParams.Create;
  try
    TCFLMLKCustomRepDlg.ShowRep(28, Params);
  finally
    Params.Free;
  end;
end;

function TMlekoBlankListForm.DBGridGetKey(Sender: TObject;
  DataSet: TDataSet): string;
begin
  inherited;
  result := DataSet.FieldByName('id').AsString;
end;

procedure TMlekoBlankListForm.ActionViewRefreshExecute(Sender: TObject);
begin
  inherited;
  quSumma.Close;
  quSumma.Params.ParamByName('p_dateBeg').Value := EdDateBeg.Date;
  quSumma.Params.ParamByName('p_dateEnd').Value := EdDateEnd.Date;
  quSumma.Open;
  StatusBar.Panels[0].Text := 'Сумма: ' + Floattostr(quSumma.FieldByName('summa').asFloat);
  quSumma.Close;
end;

procedure TMlekoBlankListForm.FormActivate(Sender: TObject);
begin
  inherited;
  if Query.Active then Query.Refresh;
end;

procedure TMlekoBlankListForm.OpenSpec(p_id: Integer);
var
  is_read_only, is_only_ord: boolean;
begin
  inherited;
  dmDataModule.OpenSQL('select is_read_only,ReasonId,DateNakl,OtdelNo from v_blankList where id=:p1_id', [p_id]);
  if dmDataModule.QFO.FieldByName('is_read_only').AsInteger = 1 then
    is_read_only := true
  else
    is_read_only := false;
  is_only_ord := false;
  if (dmDataModule.QFO.FieldByName('ReasonId').AsInteger in [4, 5]) then
  begin
    if (dmDataModule.QFO.FieldByName('DateNakl').AsDateTime <> ld_date) then is_read_only := true;
    is_only_ord := true;
  end;
  if l_is_autoload then is_only_ord := false;
  TMlekoBlankSpecForm.ShowForm(p_id, dmDataModule.QFO.FieldByName('OtdelNo').AsInteger, is_read_only, is_only_ord);
end;

procedure TMlekoBlankListForm.ActionOpenSpecExecute(Sender: TObject);
begin
  inherited;
  OpenSpec(Query.FieldByName('document_id').Value);
end;

procedure TMlekoBlankListForm.DBGridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  var
i,e:Integer;
a:string;
begin
  inherited;
  if Query.FieldByName('Vidtovgroupname').AsString = '' then
  ShowMessage('Сформируйте заказ!') else
  begin
    Meko_Blanc_Price.BLANC_PRICE.NaborLabel.Caption:=Query.FieldValues['Vidtovgroupname'];
    Meko_Blanc_Price.BLANC_PRICE.FirmaLabel.Caption:=Query.FieldValues['Postname'];
    Meko_Blanc_Price.BLANC_PRICE.EnterPriceLabel.Caption:=Query.FieldValues['Colnpricename'];
    Meko_Blanc_Price.BLANC_PRICE.AcceptQuery.Close;
    Meko_Blanc_Price.BLANC_PRICE.AcceptQuery.SQL.Clear;
    Meko_Blanc_Price.BLANC_PRICE.AcceptQuery.SQL.Add('Select Accept from Post where Name='+''''+Meko_Blanc_Price.BLANC_PRICE.FirmaLabel.Caption+'''');
    Meko_Blanc_Price.BLANC_PRICE.AcceptQuery.Open;

    if Meko_Blanc_Price.BLANC_PRICE.AcceptQuery.FieldValues['Accept'] = null then Meko_Blanc_Price.BLANC_PRICE.Y_N_Label.Caption:=''
                                                                             else Meko_Blanc_Price.BLANC_PRICE.Y_N_Label.Caption:=Meko_Blanc_Price.BLANC_PRICE.AcceptQuery.FieldValues['Accept'];
{
    if  Meko_Blanc_Price.BLANC_PRICE.Y_N_Label.Caption = 'Y' then
     begin
       Meko_Blanc_Price.BLANC_PRICE.Firma  (Meko_Blanc_Price.BLANC_PRICE.FirmaLabel.Caption);
       Meko_Blanc_Price.BLANC_PRICE.Nabor (Meko_Blanc_Price.BLANC_PRICE.NaborLabel.Caption,QueryPostno.AsInteger);
       Meko_Blanc_Price.BLANC_PRICE.Vidname_Price_ITOG(Meko_Blanc_Price.BLANC_PRICE.FirmaLabel.Caption, Meko_Blanc_Price.BLANC_PRICE.EnterPriceLabel.Caption);
     end;

    begin
      MlekoBlnkPrivyazka.Privyazka.Memo1.Lines.Clear;
      MlekoBlnkPrivyazka.Privyazka.Label1.Caption:=Query.FieldValues['Vidtovgroupname'];
      a:=MlekoBlnkPrivyazka.Privyazka.Label1.Caption;
      MlekoBlnkPrivyazka.Privyazka.MSQuery1.Active:=True;
      MlekoBlnkPrivyazka.Privyazka.MSQuery1.Refresh;
      MlekoBlnkPrivyazka.Privyazka.MSQuery1.Filter:='nabor=' + QuotedStr(a);
      MlekoBlnkPrivyazka.Privyazka.MSQuery1.Filtered:=True;
      MlekoBlnkPrivyazka.Privyazka.MSQuery1.First;
      for i:=0 to MlekoBlnkPrivyazka.Privyazka.MSQuery1.RecordCount -1   do
       begin
         MlekoBlnkPrivyazka.Privyazka.Memo1.Lines.Add(MlekoBlnkPrivyazka.Privyazka.MSQuery1.FieldByName('vidname').AsString);
         MlekoBlnkPrivyazka.Privyazka.MSQuery1.Next;
       end;
    end;

    begin
      MlekoBlkParamPrivyazka.NaborAddTovar.Memo1.Lines.Clear;
      MlekoBlkParamPrivyazka.NaborAddTovar.Label1.Caption:=Query.FieldValues['Vidtovgroupname'];
      a:=MlekoBlkParamPrivyazka.NaborAddTovar.Label1.Caption;
      MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.Active:=True;
      MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.Refresh;
      MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.Filter:='nabor=' + QuotedStr(a);
      MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.Filtered:=True;
      MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.First;
      for i:=0 to MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.RecordCount -1   do
       begin
         MlekoBlkParamPrivyazka.NaborAddTovar.Memo1.Lines.Add(MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.FieldByName('vidname').AsString);
         MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.Next;
       end;


    end;
    Meko_Blanc_Price.BLANC_PRICE.Price_Change(Meko_Blanc_Price.BLANC_PRICE.FirmaLabel.Caption);
 }
  end;
 
end;

procedure TMlekoBlankListForm.DBGridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
i,e:Integer;
a:string;
begin
  inherited;
  if Query.FieldByName('Vidtovgroupname').AsString = '' then
  ShowMessage('Сформируйте заказ!') else
  begin
    Meko_Blanc_Price.BLANC_PRICE.NaborLabel.Caption:=Query.FieldValues['Vidtovgroupname'];
    Meko_Blanc_Price.BLANC_PRICE.FirmaLabel.Caption:=Query.FieldValues['Postname'];
    Meko_Blanc_Price.BLANC_PRICE.EnterPriceLabel.Caption:=Query.FieldValues['Colnpricename'];
    Meko_Blanc_Price.BLANC_PRICE.AcceptQuery.Close;
    Meko_Blanc_Price.BLANC_PRICE.AcceptQuery.SQL.Clear;
    Meko_Blanc_Price.BLANC_PRICE.AcceptQuery.SQL.Add('Select Accept from Post where Name='+''''+Meko_Blanc_Price.BLANC_PRICE.FirmaLabel.Caption+'''');
    Meko_Blanc_Price.BLANC_PRICE.AcceptQuery.Open;

    if Meko_Blanc_Price.BLANC_PRICE.AcceptQuery.FieldValues['Accept'] = null then Meko_Blanc_Price.BLANC_PRICE.Y_N_Label.Caption:=''
                                                                             else Meko_Blanc_Price.BLANC_PRICE.Y_N_Label.Caption:=Meko_Blanc_Price.BLANC_PRICE.AcceptQuery.FieldValues['Accept'];
{
    if  Meko_Blanc_Price.BLANC_PRICE.Y_N_Label.Caption = 'Y' then
     begin
       Meko_Blanc_Price.BLANC_PRICE.Firma  (Meko_Blanc_Price.BLANC_PRICE.FirmaLabel.Caption);
       Meko_Blanc_Price.BLANC_PRICE.Nabor (Meko_Blanc_Price.BLANC_PRICE.NaborLabel.Caption,QueryPostno.AsInteger);
       Meko_Blanc_Price.BLANC_PRICE.Vidname_Price_ITOG(Meko_Blanc_Price.BLANC_PRICE.FirmaLabel.Caption, Meko_Blanc_Price.BLANC_PRICE.EnterPriceLabel.Caption);
     end;
    begin
      MlekoBlnkPrivyazka.Privyazka.Memo1.Lines.Clear;
      MlekoBlnkPrivyazka.Privyazka.Label1.Caption:=Query.FieldValues['Vidtovgroupname'];
      a:=MlekoBlnkPrivyazka.Privyazka.Label1.Caption;
      MlekoBlnkPrivyazka.Privyazka.MSQuery1.Active:=True;
      MlekoBlnkPrivyazka.Privyazka.MSQuery1.Refresh;
      MlekoBlnkPrivyazka.Privyazka.MSQuery1.Filter:='nabor=' + QuotedStr(a);
      MlekoBlnkPrivyazka.Privyazka.MSQuery1.Filtered:=True;
      MlekoBlnkPrivyazka.Privyazka.MSQuery1.First;
      for i:=0 to MlekoBlnkPrivyazka.Privyazka.MSQuery1.RecordCount -1   do
       begin
         MlekoBlnkPrivyazka.Privyazka.Memo1.Lines.Add(MlekoBlnkPrivyazka.Privyazka.MSQuery1.FieldByName('vidname').AsString);
         MlekoBlnkPrivyazka.Privyazka.MSQuery1.Next;
       end;
    end;

    begin
      MlekoBlkParamPrivyazka.NaborAddTovar.Memo1.Lines.Clear;
      MlekoBlkParamPrivyazka.NaborAddTovar.Label1.Caption:=Query.FieldValues['Vidtovgroupname'];
      a:=MlekoBlkParamPrivyazka.NaborAddTovar.Label1.Caption;
      MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.Active:=True;
      MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.Refresh;
      MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.Filter:='nabor=' + QuotedStr(a);
      MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.Filtered:=True;
      MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.First;
      for i:=0 to MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.RecordCount -1   do
       begin
         MlekoBlkParamPrivyazka.NaborAddTovar.Memo1.Lines.Add(MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.FieldByName('vidname').AsString);
         MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.Next;
       end;


    end;
    Meko_Blanc_Price.BLANC_PRICE.Price_Change(Meko_Blanc_Price.BLANC_PRICE.FirmaLabel.Caption);
    end;
}
   end;
end;

procedure TMlekoBlankListForm.ToolButtonTmpCrossClick(Sender: TObject);
begin
  inherited;
  Edit_CrossBlankOrder := True;
  TMlekoCrossBlankOrderTmpForm.ShowFormBrand(ld_date);
end;

procedure TMlekoBlankListForm.DBGridTitlePressed(Sender: TDBGrid;
  Field: TField);
begin
  inherited;
  if field.Name = 'QueryPostname' then SQLBuilder.OrderBy.Text := ' a.Postname, a.Addess';
end;

end.
