unit MlekoBlankSpec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKList, Menus, citComponentProps, DB,   DBAccess, MsAccess,
  COMPSQLBuilder, ActnList, citDbGrid, ExtCtrls,
  comp_TargetFilter_Panel, ComCtrls, ToolWin, StdCtrls, Mask,
  DBCtrls,
  citCtrls, citDBComboEdit, citmask, MemDS, Grids, DBGrids, rxToolEdit,
  DBGridEh, DBCtrlsEh, DBLookupEh;

type
  TMlekoBlankSpecForm = class(TCFLMLKListForm)
    quBlankParam: TMSQuery;
    DSBlankParam: TDataSource;
    GenInputOrder: TMSStoredProc;
    quBlankSumma: TMSQuery;
    spEditBlankPosition: TMSStoredProc;
    ActionIsRest: TAction;
    ActionEnableChangePrice: TAction;
    spCheckPrice: TMSStoredProc;
    spAddTovarOtdel: TMSStoredProc;
    spDelTovarOtdel: TMSStoredProc;
    ActionAudit: TAction;
    ActionIsOrd: TAction;
    ToolButton1: TToolButton;
    ActionListTovarAdd: TAction;
    ToolButton2: TToolButton;
    quTemp: TMSQuery;
    ActionViewRest: TAction;
    PanelPaymentLink: TPanel;
    DBGridPaymentLink: TDBGrid;
    Splitter: TSplitter;
    qryLink: TMSQuery;
    dsLink: TDataSource;
    ActionListLink: TActionList;
    ActionLinkAdd: TAction;
    ActionLinkProp: TAction;
    ActionLinkDel: TAction;
    ActionLinkRefresh: TAction;
    ActionLinkLayout: TAction;
    ActionLinkMenuItemVisible: TAction;
    ActionRestoreLink: TAction;
    ActionUnlink: TAction;
    GoExelLink: TAction;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    Panel1: TPanel;
    CBPriceEnable: TCheckBox;
    Panel2: TPanel;
    DBText1: TDBText;
    Label1: TLabel;
    DBText2: TDBText;
    Label7: TLabel;
    DBText3: TDBText;
    Label4: TLabel;
    DBText4: TDBText;
    Label3: TLabel;
    DBText5: TDBText;
    Label2: TLabel;
    ceSummaDolg: TComboEdit;
    Label5: TLabel;
    DBText6: TDBText;
    Label6: TLabel;
    Panel3: TPanel;
    CBOnlyRest: TCheckBox;
    Panel5: TPanel;
    CBOnlyOrd: TCheckBox;
    quDepts: TMSQuery;
    quDeptsOtdelNo: TSmallintField;
    quDeptsOtdelName: TStringField;
    ActionRefreshSumma: TAction;
    Panel6: TPanel;
    Panel4: TPanel;
    ftOtdel: TcitDBComboEdit;
    Label8: TLabel;
    DBText7: TDBText;
    Label9: TLabel;
    DBText8: TDBText;
    Label10: TLabel;
    DBText9: TDBText;
    quBlankRec: TMSQuery;
    PanelSearch: TPanel;
    EdSearch: TEdit;
    ToolButton7: TToolButton;
    ActionShowPackWeight: TAction;
    ToolButton9: TToolButton;
    ActionChangePrice: TAction;
    ActionCheckBlank: TAction;
    Panel150: TPanel;
    Panel7: TPanel;
    DBMemo1: TDBMemo;
    Label11: TLabel;
    ActionCopyToExcel: TAction;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ActionAllZero: TAction;
    ToolButton12: TToolButton;
    GenInputOrderdocument_id: TIntegerField;
    GenInputOrderNameTovar: TStringField;
    GenInputOrderKolFirstNakl: TFloatField;
    GenInputOrderKolSecondNakl: TFloatField;
    GenInputOrderKolThirdNakl: TFloatField;
    GenInputOrderPriceFirstNakl: TFloatField;
    GenInputOrderPriceSecondNakl: TFloatField;
    GenInputOrderPriceThirdNakl: TFloatField;
    GenInputOrderKolRash: TFloatField;
    GenInputOrderKolOst: TFloatField;
    GenInputOrderKolOrd: TFloatField;
    GenInputOrderboss_price: TFloatField;
    GenInputOrderKolPerPak: TSmallintField;
    GenInputOrderSrokReal: TSmallintField;
    GenInputOrdervidname: TStringField;
    GenInputOrderis_set_price: TStringField;
    GenInputOrderCreateUserName: TStringField;
    GenInputOrderLastEditUserName: TStringField;
    GenInputOrderkolBegin: TFloatField;
    GenInputOrderAvgPriceIn: TFloatField;
    GenInputOrderKolExt: TFloatField;
    GenInputOrderweight_packed: TBooleanField;
    GenInputOrderCreateUser: TIntegerField;
    cbVidTov: TCheckBox;
    GenInputOrderColN_Price: TFloatField;
    GenInputOrderResidue: TFloatField;
    GenInputOrderNeed: TFloatField;
    Label12: TLabel;
    DBText10: TDBText;
    SearchTovarNo: TCheckBox;
    EdSearchTovarNo: TEdit;
    GenInputOrderCurrency: TStringField;
    GenInputOrderRate: TFloatField;
    DBText11: TDBText;
    Label13: TLabel;
    GenInputOrderCrossPrice: TFloatField;
    GenInputOrderCurrencyHead: TStringField;
    GenInputOrderPaymentPrice: TFloatField;
    GenInputOrderTovarNo: TLargeintField;
    GenInputOrderID: TLargeintField;
    quVidTov: TMSQuery;
    quVidTovVidNo: TSmallintField;
    quVidTovVidName: TStringField;
    dsVidTov: TMSDataSource;
    dblcVidTov: TDBLookupComboboxEh;
    procedure ceSummaDolgButtonClick(Sender: TObject);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GenInputOrderAfterPost(DataSet: TDataSet);
    procedure GenInputOrderBeforeOpen(DataSet: TDataSet);
    procedure ActionIsRestExecute(Sender: TObject);
    procedure ActionEnableChangePriceExecute(Sender: TObject);
    procedure ActionItemAddExecute(Sender: TObject);
    procedure DBGridColEnter(Sender: TObject);
    procedure DBGridDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure ActionItemDelExecute(Sender: TObject);
    procedure GenInputOrderAfterOpen(DataSet: TDataSet);
    procedure GenInputOrderAfterScroll(DataSet: TDataSet);
    procedure GenInputOrderAfterRefresh(DataSet: TDataSet);
    procedure ActionAuditExecute(Sender: TObject);
    procedure ActionIsOrdExecute(Sender: TObject);
    procedure ActionViewRestExecute(Sender: TObject);
    procedure ActionLinkLayoutExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActionFindExecute(Sender: TObject);
    procedure ftOtdelSelectOk(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdSearchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdSearchChange(Sender: TObject);
    procedure EdSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ActionShowPackWeightExecute(Sender: TObject);
    procedure ActionChangePriceExecute(Sender: TObject);
    procedure qryLinkAfterOpen(DataSet: TDataSet);
    procedure qryLinkBeforeClose(DataSet: TDataSet);
    procedure ActionCheckBlankExecute(Sender: TObject);
    procedure quBlankParamAfterOpen(DataSet: TDataSet);
    procedure quBlankParamAfterRefresh(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure ActionCopyToExcelExecute(Sender: TObject);
    procedure ActionAllZeroExecute(Sender: TObject);
    procedure ActionViewRefreshExecute(Sender: TObject);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbVidTovClick(Sender: TObject);
    procedure SearchTovarNoClick(Sender: TObject);
    procedure EdSearchTovarNoKeyPress(Sender: TObject; var Key: Char);
    procedure EdSearchTovarNoChange(Sender: TObject);
    procedure EdSearchTovarNoEnter(Sender: TObject);
    procedure EdSearchTovarNoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblcVidTovChange(Sender: TObject);
  protected
    procedure SetActionsEnabled; override;
  private
    Is_ControlPostBanPay: Boolean;
    l_PostNo,l_document_id,l_AddressNo,l_tovarNo:Integer;
    KolDayChanged:boolean;
    is_only_rest: Integer;
    is_enable_change_price: Integer;
    procedure OrderRefresh;
    procedure SetLinkPanelVisible(aIsVisible: boolean);
    function GetPosWeigth(p_TovarNo:Double;var p_weight:real):boolean;
  public
    { Public declarations }
    class procedure ShowForm(document_id: integer; p_dept_id: integer; is_ReadOnly:boolean; p_is_only_ord:boolean=false);
  end;

var
  l_is_read_only:boolean;
  is_only_ord: Integer;  
  ln_document_id,ln_dept_id:integer;
  ln_tovarNo: Double;
  ln_boss_price,ln_kolOrd:real;
  SearchString:string;
  MlekoBlankSpecForm: TMlekoBlankSpecForm;
implementation

uses InfoDolgNam0, data, MlekoSelectTovar, main,
  MlekoAuditBlankPos, MlekoPropFindTov, MlekoBlankParam, MlekoBlankList,
  MlekoSelectWeight,MlekoBlnkPrivyazka, MlekoBlkParamPrivyazka,Meko_Blanc_Price;

class procedure TMlekoBlankSpecForm.ShowForm(document_id: integer; p_dept_id: integer; is_ReadOnly:boolean; p_is_only_ord:boolean=false);
var i:integer;
begin
 ln_dept_id:=p_dept_id;
 ln_document_id:=document_id;
 if p_is_only_ord then is_only_ord:=1 else is_only_ord:=0;

 with Create(Application) do begin
  l_is_read_only:=is_ReadOnly;
  if is_ReadOnly Then begin
    DBGrid.Color:=ClSilver;
    DBGrid.ReadOnly:=true;
  end;

  CBPriceEnable.Enabled := (Data.CodeAccess < 7);

//  if (Data.CodeAccess < 7) then showmessage('True') else showmessage('False');

  ftOtdel.LocateKey:=true;
  ftOtdel.KeyFieldValue:=IntToStr(p_dept_id);
  ftOtdel.GetLocateKey;
  quBlankParam.Close;
  quBlankParam.Params.ParamByName('document_id').Value:=Document_ID;
  quBlankParam.Open;

  if quBlankParam.FieldByName('reasonid').AsInteger=4 then
  begin
    Panel150.Visible:=true;
    Panel150.Caption:='РЕЖИМ АВТОЗАГРУЗКИ';
    Panel150.Color:=ClGreen;
  end;

  l_PostNo:=quBlankParam.FieldByName('PostNo').AsInteger;
  l_AddressNo:=quBlankParam.FieldByName('AddressNo').AsInteger;
  l_document_id:=Document_id;

  quVidTov.Close;
  quVidTov.ParamByName('document_id').AsInteger := l_document_id;
  quVidTov.Open;

  dmDataModule.OpenSQL('select SUM(SummaDolg) from NaklR where (SummaDolg<>0) and (NaklR.PostNo=:P1_id)',[l_PostNo]);
  ceSummaDolg.Text:=format('%.2n',[dmDataModule.QFO.Fields[0].AsFloat]);
  ActionViewRefresh.Execute;
  OrderRefresh;
  for i:=0 to DBGrid.Columns.Count - 1 do
     if ((DBGrid.Columns[i].FieldName = 'KolOrd') or ((DBGrid.Columns[i].FieldName = 'boss_price') and (CBPriceEnable.Checked))) then DBGrid.SelectedIndex:=i;
 end;
end;

{$R *.dfm}

procedure TMlekoBlankSpecForm.OrderRefresh;
var i:integer;
begin

 for i := 0 to DbGrid.Columns.Count-1 do
 begin
  if  (DBGrid.Columns[i].FieldName='KolFirstNakl') then   DBGrid.Columns[i].Title.Caption:=FormatDateTime('dd.mm.yy',GenInputOrder.Params.ParamByName('DateNaklFirst').Value);
  if  (DBGrid.Columns[i].FieldName='KolSecondNakl') then   DBGrid.Columns[i].Title.Caption:=FormatDateTime('dd.mm.yy',GenInputOrder.Params.ParamByName('DateNaklSecond').Value);
  if  (DBGrid.Columns[i].FieldName='KolThirdNakl') then   DBGrid.Columns[i].Title.Caption:=FormatDateTime('dd.mm.yy',GenInputOrder.Params.ParamByName('DateNaklThird').Value);
  if (DBGrid.Columns[i].FieldName='KolOst') then DBGrid.Columns[i].Color:=$00F9DFF7;
  if (DBGrid.Columns[i].FieldName='NameTovar') then DBGrid.Columns[i].Color:=$00A7DDF8;
  if (DBGrid.Columns[i].FieldName='KolPerPak') then DBGrid.Columns[i].Color:=$00C4C8B9;
 end;
end;

procedure TMlekoBlankSpecForm.ceSummaDolgButtonClick(Sender: TObject);
begin
  inherited;
  InfoDolgNam(l_PostNo);
end;

procedure TMlekoBlankSpecForm.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var i:integer;
  ln_weight:real;
begin
//  inherited;
 case Key of
  VK_RETURN:begin
              if GenInputOrder.FieldByName('weight_packed').AsBoolean then
               begin
                 if GetPosWeigth(GenInputOrder.FieldByName('TovarNo').AsVariant,ln_weight) then
                  begin
                    GenInputOrder.FieldByName('KolOrd').ReadOnly:=false;
                    if GenInputOrder.State<>dsEdit then GenInputOrder.Edit;
                    GenInputOrder.FieldByName('KolOrd').AsFloat:=ln_weight;
                  end
               end;
              if GenInputOrder.State=dsEdit then GenInputOrder.Post;
              if SearchTovarNo.Checked then EdSearchTovarNo.SetFocus else GenInputOrder.Next;
            end;
 end;
end;

procedure TMlekoBlankSpecForm.GenInputOrderAfterPost(DataSet: TDataSet);
var l_boss_price:real;
begin
  inherited;

  ln_tovarNo := GenInputOrder.FieldByName('TovarNo').AsFloat;

  if DBGrid.Columns[DBGrid.SelectedIndex].FieldName = 'boss_price' then begin
    l_boss_price:=GenInputOrder.FieldByName('Boss_Price').AsFloat
//    l_boss_price:=GenInputOrder.FieldByName('PaymentPrice').AsFloat
  end else l_boss_price:= -1;

  spCheckPrice.Close;
  spCheckPrice.Prepare;
  spCheckPrice.Params.ParamByName('tovarNo').Value:=GenInputOrder.FieldByName('tovarNo').AsFloat;
  spCheckPrice.Params.ParamByName('ColnPrice').Value:=quBlankParam.FieldByName('ColnPrice').AsInteger;
  spCheckPrice.Params.ParamByName('KolOrd').Value:=GenInputOrder.FieldByName('KolOrd').AsFloat;
  spCheckPrice.Params.ParamByName('Boss_Price').Value:= GenInputOrder.FieldByName('PaymentPrice').AsFloat; //l_boss_price; //
//  spCheckPrice.Params.ParamByName('Boss_Price').Value:=GenInputOrder.FieldByName('Boss_Price').AsFloat;
  spCheckPrice.Params.ParamByName('UserNo').Value:=data.UserNo;
  spCheckPrice.Open;

  if (not (spCheckPrice.FieldByName('msg').AsString ='-1')) or
  ((DBGrid.Columns[DBGrid.SelectedIndex].FieldName = 'boss_price') and (GenInputOrder.FieldByName('KolOrd').AsFloat=0))
  then begin
    if not (spCheckPrice.FieldByName('msg').AsString ='-1') then Application.MessageBox(PChar(spCheckPrice.FieldByName('msg').AsString),'Ошибка цены',MB_OK);
    if GenInputOrder.FieldByName('KolOrd').AsFloat=0 then Application.MessageBox(PChar('Нулевое количество'),'Ошибка цены',MB_OK);
    ActionViewRefresh.Execute;
    exit;
  end;

  spEditBlankPosition.Close;
//  spEditBlankPosition.Prepare;
  spEditBlankPosition.Params.ParamByName('document_id').Value:=l_document_Id;
  spEditBlankPosition.Params.ParamByName('tovarNo').Value:=GenInputOrder.FieldByName('tovarNo').AsFloat;
  spEditBlankPosition.Params.ParamByName('UserNo').Value:=data.UserNo;
  spEditBlankPosition.Params.ParamByName('KolBeg').Value:=GenInputOrder.FieldByName('KolOrd').AsFloat;
  spEditBlankPosition.Params.ParamByName('KolOrd').Value:=GenInputOrder.FieldByName('KolOrd').AsFloat;
  spEditBlankPosition.Params.ParamByName('Boss_Price').Value:=l_boss_price;
  spEditBlankPosition.Params.ParamByName('Residue').Value:= GenInputOrder.FieldByName('Residue').AsFloat;
  spEditBlankPosition.Params.ParamByName('Need').Value:=  GenInputOrder.FieldByName('Need').AsFloat;
  spEditBlankPosition.Params.ParamByName('CrossPrice').Value:=  GenInputOrder.FieldByName('CrossPrice').AsFloat;
  spEditBlankPosition.Params.ParamByName('PaymentPrice').Value:=  GenInputOrder.FieldByName('PaymentPrice').AsFloat;
  spEditBlankPosition.Params.ParamByName('BossPriceFirst').Value:=  GenInputOrder.FieldByName('Boss_Price').AsFloat;
  spEditBlankPosition.Params.ParamByName('Currency').Value:=  GenInputOrder.FieldByName('Currency').AsString;
  spEditBlankPosition.Params.ParamByName('Rate').Value:=  GenInputOrder.FieldByName('Rate').AsFloat;
  spEditBlankPosition.ExecProc;
  quBlankParam.Refresh;

  if GenInputOrder.State<>dsEdit then begin
   GenInputOrder.AfterPost:=nil;
   quBlankRec.Close;
   quBlankRec.Params.ParamByName('document_id').Value:=ln_document_id;
   quBlankRec.Params.ParamByName('TovarNo').Value:=ln_tovarNo;
   quBlankRec.Open;
   GenInputOrder.Edit;
   GenInputOrder.FieldByName('KolRash').AsFloat:=quBlankRec.FieldByName('KolRash').AsFloat;
   IF not quBlankRec.FieldByName('Boss_price').IsNull then GenInputOrder.FieldByName('is_set_price').AsString:='$';
   GenInputOrder.Post;
   GenInputOrder.AfterPost:=GenInputOrderAfterPost;   
  end;
end;


procedure TMlekoBlankSpecForm.GenInputOrderBeforeOpen(DataSet: TDataSet);   //!!!!!! Привязка!!!!

begin

  GenInputOrder.Params.ParamByName('document_id').Value:=l_document_id;
  GenInputOrder.Params.ParamByName('p_otdelNo').Value:=ln_dept_id;
  GenInputOrder.Params.ParamByName('is_only_rest').Value:=is_only_rest;
  GenInputOrder.Params.ParamByName('is_only_ord').Value:=is_only_ord;
  GenInputOrder.Params.ParamByName('DateNaklFirst').Value:=Date();
  GenInputOrder.Params.ParamByName('DateNaklSecond').Value:=Date();
  GenInputOrder.Params.ParamByName('DateNaklThird').Value:=Date();
  inherited;
end;

procedure TMlekoBlankSpecForm.ActionIsRestExecute(Sender: TObject);
begin
  inherited;
  CBOnlyRest.Checked := not (is_only_rest=1);
  If CBOnlyRest.Checked then is_only_rest:=1 else is_only_rest:=0;
  ActionViewRefresh.Execute;
end;

procedure TMlekoBlankSpecForm.ActionEnableChangePriceExecute(
  Sender: TObject);
begin
  inherited;
  CBPriceEnable.Checked:= not (is_enable_change_price=1);
  If CBPriceEnable.Checked then is_enable_change_price:=1 else is_enable_change_price:=0;

end;

procedure TMlekoBlankSpecForm.ActionItemAddExecute(Sender: TObject);
Var  ID: integer;
l_res_sql:String;
l_text_field:TStrings;
l_key_field:TStrings;
begin
  inherited;
    quTemp.Close;
    quTemp.SQL.Clear;
    l_text_field:=TStringList.Create;
    l_key_field:=TStringList.Create;

    l_key_field.Add('TOVARNO');
    l_text_field.Add('NAMETOVAR');

    IF TMlekoSelectTovarDlg.OpenHoldSelect('ADD_BLANK_TOVAR','LIST_TOVAR','TOVAR',true) Then
      if Application.MessageBox('Добавить в список?','Товар',MB_YESNO)=IDYES then begin
        quTemp.SQL.Text:=dmDataModule.get_selected_sql('ADD_BLANK_TOVAR','LIST_TOVAR','TOVAR');
        quTemp.Open;
        quTemp.First;
        while not quTemp.Eof do
        begin
          spAddTovarOtdel.Close;
          spAddTovarOtdel.Params.ParamByName('p_OtdelNo').Value:=ln_dept_id;
          spAddTovarOtdel.Params.ParamByName('p_tovarNo').Value:=quTemp.fieldByName('key_field').AsInteger;
          spAddTovarOtdel.ExecProc;
          quTemp.Next
        end;
        ActionViewRefresh.Execute;
        GenInputOrder.Locate('TovarNo',quTemp.fieldByName('key_field').AsInteger,[]);
      end;
end;

procedure TMlekoBlankSpecForm.DBGridColEnter(Sender: TObject);
var i : integer;
begin
  inherited;
  if not ((DBGrid.Columns[DBGrid.SelectedIndex].FieldName = 'KolOrd') or ((DBGrid.Columns[DBGrid.SelectedIndex].FieldName = 'boss_price') and (CBPriceEnable.Checked))) then
  begin
  for i:=0 to DBGrid.Columns.Count - 1 do
     if ((DBGrid.Columns[i].FieldName = 'KolOrd') or ((DBGrid.Columns[i].FieldName = 'boss_price') and (CBPriceEnable.Checked))) then DBGrid.SelectedIndex:=i;
  end;
end;

procedure TMlekoBlankSpecForm.DBGridDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;

 if (Field.FieldName='KolOrd') and GenInputOrder.FieldByName('weight_packed').AsBoolean
   then DbGrid.Canvas.Brush.Color:=clYellow;

 if Field.FieldName='KolRash' then begin
  if (GenInputOrder.FieldByName('KolRash').AsFloat>GenInputOrder.FieldByName('KolOst').AsFloat)
   then DbGrid.Canvas.Brush.Color:=clRed;
 end;

 if Field.FieldName='boss_price' then begin
   if (GenInputOrder.FieldByName('is_set_price').AsString='$') then DbGrid.Canvas.Brush.Color:=clMoneyGreen;
   if (GenInputOrder.FieldByName('boss_price').AsFloat<=GenInputOrder.FieldByName('AvgPriceIn').AsFloat)
       then begin
        DBGrid.Canvas.Font.Color:=clRed;
        DBGrid.Canvas.Font.Style:=DBGrid.Canvas.Font.Style+[fsbold];
       end;
 end;

 if (Field.FieldName='KolExt') then
  if ds.dataSet.FieldByName('weight_packed').AsBoolean then
   if (ds.dataSet.FieldByName('kolOrd').AsFloat<>ds.dataSet.FieldByName('KolExt').AsFloat)
   then DbGrid.Canvas.Brush.Color:=clRed;

end;

procedure TMlekoBlankSpecForm.ActionItemDelExecute(Sender: TObject);
var i:integer;
begin
  inherited;
 if Application.MessageBox(Pchar(GenInputOrder.FieldByName('NameTovar').asString),'Удалить из спискa?',MB_YESNO)=IDYES then begin
  if DBGrid.SelectedRows.Count>0 then
      for i:=0 to DBGrid.SelectedRows.Count-1 do begin
        GenInputOrder.GotoBookmark(pointer(DBGrid.SelectedRows.Items[i]));
        spDelTovarOtdel.Close;
        spDelTovarOtdel.Params.ParamByName('p_OtdelNo').Value:=ln_dept_id;
        spDelTovarOtdel.Params.ParamByName('p_tovarNo').Value:=GenInputOrder.FieldByName('tovarNo').AsInteger;
        spDelTovarOtdel.ExecProc;
      end
   else begin
        spDelTovarOtdel.Close;
        spDelTovarOtdel.Params.ParamByName('p_OtdelNo').Value:=ln_dept_id;
        spDelTovarOtdel.Params.ParamByName('p_tovarNo').Value:=GenInputOrder.FieldByName('tovarNo').AsInteger;
        spDelTovarOtdel.ExecProc;
   end;
  ActionViewRefresh.Execute;
 end;
end;

procedure TMlekoBlankSpecForm.SetActionsEnabled;
var
  ne, c, aEditEnabled: boolean;
  status: Integer;
begin
  inherited;
  ActionItemDel.Enabled:=(GenInputOrder.FieldByName('KolOrd').AsFloat=0);
  ActionShowPackWeight.Enabled:=GenInputOrder.FieldByName('weight_packed').AsBoolean;
  GenInputOrder.FieldByName('KolOrd').ReadOnly:=ds.dataSet.FieldByName('weight_packed').AsBoolean;
end;

procedure TMlekoBlankSpecForm.GenInputOrderAfterOpen(DataSet: TDataSet);
var
a,b:string;
begin
  inherited;
  DBGrid.RestoreFormatFromStorage;
  SetActionsEnabled;
{
  a:=MlekoBlnkPrivyazka.Privyazka.Label1.Caption; // журнал заказов
  b:=MlekoBlnkPrivyazka.Privyazka.Label2.Caption;  // бланк формирования заказов
  if Meko_Blanc_Price.BLANC_PRICE.Y_N_Label.Caption = 'Y' then
   begin
     GenInputOrder.Filter:=GenInputOrder.Filter + Meko_Blanc_Price.BLANC_PRICE.ITOG_VIDNAME_Memo.Lines.Text; // Фильтр №2, если стоит 'Y' у партнера,- работа с ценами(фильтр по ценам+набор)
     GenInputOrder.Filtered:=True;
   end
   else
    begin
    if a <> '' then
     begin
       GenInputOrder.Filter:=GenInputOrder.Filter + MlekoBlnkPrivyazka.Privyazka.Memo1.Lines.Text;  // Фильтр №1,- по набору (при входе из журнала заказов)
       GenInputOrder.Filtered:=True;
     end;
   if b <> '' then
    begin
      GenInputOrder.Filter:=GenInputOrder.Filter + MlekoBlnkPrivyazka.Privyazka.Memo1.Lines.Text;  // Фильтр №1, - по набору (из бланка формирования заказа)
      GenInputOrder.Filtered:=True;
    end;
  end;
}  
  if Meko_Blanc_Price.BLANC_PRICE.PriceChangeLabel.Caption = 'N' then
  CBPriceEnable.Enabled:=False;
end;

procedure TMlekoBlankSpecForm.GenInputOrderAfterScroll(DataSet: TDataSet);
begin
  inherited;
  SetActionsEnabled;
  if ActionViewRest.Checked then begin
    qryLink.Params.ParamByName('p_TovarNo').Value:=GenInputOrder.FieldByName('TovarNo').AsInteger;
    qryLink.Refresh;
  end;
end;

procedure TMlekoBlankSpecForm.GenInputOrderAfterRefresh(DataSet: TDataSet);
begin
  inherited;
  SetActionsEnabled;
end;

procedure TMlekoBlankSpecForm.ActionAuditExecute(Sender: TObject);
begin
  inherited;
   TMlekoAuditBlankPosForm.ShowForm(l_document_id, DS.DataSet.FieldByName('tovarNo').AsInteger);
end;

procedure TMlekoBlankSpecForm.ActionIsOrdExecute(Sender: TObject);
begin
  inherited;
//  CBOnlyOrd.Checked := not (is_only_ord=1);
  If CBOnlyOrd.Checked then is_only_Ord:=1 else is_only_ord:=0;
  ActionViewRefresh.Execute;
end;

procedure TMlekoBlankSpecForm.SetLinkPanelVisible(aIsVisible: boolean);
var
  i: integer;
begin
  if aIsVisible then
  begin
    DBGridPaymentLink.Refresh;
  end;

  PanelPaymentLink.Visible := aIsVisible;
  Splitter.Visible := aIsVisible;

//  SetActionsEnabled;

//  for i := 0 to ActionListLink.ActionCount - 1 do
//    (ActionListLink.Actions[i] as TAction).Enabled := aIsVisible;
end;

procedure TMlekoBlankSpecForm.ActionViewRestExecute(Sender: TObject);
begin
  inherited;
  qryLink.Params.ParamByName('p_TovarNo').Value:=GenInputOrder.FieldByName('TovarNo').AsInteger;
  ActionViewRest.Checked := not ActionViewRest.Checked;
  SetLinkPanelVisible(ActionViewRest.Checked);
end;

procedure TMlekoBlankSpecForm.ActionLinkLayoutExecute(Sender: TObject);
begin
  inherited;
  DBGridPaymentLink.ChangeLayout;
end;

procedure TMlekoBlankSpecForm.FormShow(Sender: TObject);
begin
//  inherited;
  SetLinkPanelVisible(false);
end;

procedure TMlekoBlankSpecForm.ActionFindExecute(Sender: TObject);
var tov,vid: String;
begin
  inherited;
  IF TMlekoPropFindTovDlg.GetFindTov(tov,vid) then begin
     if vid<>'' then DBGrid.DataSource.DataSet.Locate('VidName',vid,[loCaseInsensitive, loPartialKey]);
     if tov<>'' then DBGrid.DataSource.DataSet.Locate('NameTovar',tov,[loCaseInsensitive, loPartialKey]);
  end;
end;

procedure TMlekoBlankSpecForm.ftOtdelSelectOk(Sender: TObject);
begin
  inherited;
  IF ftOtdel.Text='' then ln_dept_id:=-1 else ln_dept_id:=StrToInt(ftOtdel.KeyFieldValue);
end;

procedure TMlekoBlankSpecForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = 16) and (not SearchTovarNo.Checked) then
   begin
     EdSearchTovarNo.Visible := false;
     PanelSearch.Visible:=True ;
     DBGrid.Options:=DBGrid.Options-[DBGrids.dgEditing] ;
     fmMain.mmMenu.Items.Enabled:=false;
     EdSearch.SetFocus;
   end;
end;

procedure TMlekoBlankSpecForm.EdSearchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = 16) and (not SearchTovarNo.Checked) then
   begin
     PanelSearch.Visible:=False ;
     DBGrid.Options:=DBGrid.Options+[DBGrids.dgEditing];
     fmMain.mmMenu.Items.Enabled:=True;
     DBGrid.SetFocus;
   end;
end;

procedure TMlekoBlankSpecForm.EdSearchChange(Sender: TObject);
begin
  inherited;
  GenInputOrder.Locate('NameTovar',EdSearch.Text,[loPartialKey,loCaseInsensitive]);
end;

procedure TMlekoBlankSpecForm.EdSearchKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key in [38,40]) and (not SearchTovarNo.Checked) then
   begin
     PanelSearch.Visible:=False ;
     DBGrid.Options:=DBGrid.Options+[DBGrids.dgEditing];
     fmMain.mmMenu.Items.Enabled:=True;
     DBGrid.SetFocus;
   end;
end;

procedure TMlekoBlankSpecForm.ActionShowPackWeightExecute(Sender: TObject);
begin
  inherited;
//
end;

function TMlekoBlankSpecForm.GetPosWeigth(p_TovarNo:Double;var p_weight:real):boolean;
begin
  inherited;
    result:= TMlekoSelectWeightDlg.SelectWeight(ln_document_id,GenInputOrder.FieldByName('TovarNo').AsInteger,p_weight);
end;

procedure TMlekoBlankSpecForm.ActionChangePriceExecute(Sender: TObject);
var i:integer;
 l_boss_price:real;
begin
  inherited;
 if Application.MessageBox(Pchar(GenInputOrder.FieldByName('NameTovar').asString),'Удалить из спискa?',MB_YESNO)=IDYES then begin
  if DBGrid.SelectedRows.Count>0 then
      for i:=0 to DBGrid.SelectedRows.Count-1 do begin
        GenInputOrder.GotoBookmark(pointer(DBGrid.SelectedRows.Items[i]));

        if not GenInputOrder.FieldByName('PriceThirdNakl').IsNull then l_boss_price:=GenInputOrder.FieldByName('PriceThirdNakl').AsFloat
          else if not GenInputOrder.FieldByName('PriceSecondNakl').IsNull then  l_boss_price:=GenInputOrder.FieldByName('PriceSecondNakl').AsFloat
            else if not GenInputOrder.FieldByName('PriceFirstNakl').IsNull then l_boss_price:=GenInputOrder.FieldByName('PriceFirstNakl').AsFloat
//              else l_boss_price:=GenInputOrder.FieldByName('boss_price').AsFloat;
                else l_boss_price:=GenInputOrder.FieldByName('PaymentPrice').AsFloat;

        spEditBlankPosition.Close;
        spEditBlankPosition.Params.ParamByName('document_id').Value:=l_document_Id;
        spEditBlankPosition.Params.ParamByName('tovarNo').Value:=GenInputOrder.FieldByName('tovarNo').AsInteger;
        spEditBlankPosition.Params.ParamByName('UserNo').Value:=data.UserNo;
        spEditBlankPosition.Params.ParamByName('KolBeg').Value:=GenInputOrder.FieldByName('KolOrd').AsFloat;
        spEditBlankPosition.Params.ParamByName('KolOrd').Value:=GenInputOrder.FieldByName('KolOrd').AsFloat;
        spEditBlankPosition.Params.ParamByName('Boss_Price').Value:=l_boss_price;
        spEditBlankPosition.ExecProc;
      end else begin

        if not GenInputOrder.FieldByName('PriceThirdNakl').IsNull then l_boss_price:=GenInputOrder.FieldByName('PriceThirdNakl').AsFloat
          else if not GenInputOrder.FieldByName('PriceSecondNakl').IsNull then  l_boss_price:=GenInputOrder.FieldByName('PriceSecondNakl').AsFloat
            else if not GenInputOrder.FieldByName('PriceFirstNakl').IsNull then l_boss_price:=GenInputOrder.FieldByName('PriceFirstNakl').AsFloat
//             else l_boss_price:=GenInputOrder.FieldByName('boss_price').AsFloat;
              else l_boss_price:=GenInputOrder.FieldByName('PaymentPrice').AsFloat;

        spEditBlankPosition.Close;
        spEditBlankPosition.Params.ParamByName('document_id').Value:=l_document_Id;
        spEditBlankPosition.Params.ParamByName('tovarNo').Value:=GenInputOrder.FieldByName('tovarNo').AsInteger;
        spEditBlankPosition.Params.ParamByName('UserNo').Value:=data.UserNo;
        spEditBlankPosition.Params.ParamByName('KolBeg').Value:=GenInputOrder.FieldByName('KolOrd').AsFloat;
        spEditBlankPosition.Params.ParamByName('KolOrd').Value:=GenInputOrder.FieldByName('KolOrd').AsFloat;
        spEditBlankPosition.Params.ParamByName('Boss_Price').Value:=l_boss_price;
        spEditBlankPosition.ExecProc;
   end;
  ActionViewRefresh.Execute;
 end;
end;

procedure TMlekoBlankSpecForm.qryLinkAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DBGridPaymentLink.RestoreFormatFromStorage;
end;

procedure TMlekoBlankSpecForm.qryLinkBeforeClose(DataSet: TDataSet);
begin
  inherited;
  DBGridPaymentLink.SaveFormatToStorage;
end;

procedure TMlekoBlankSpecForm.ActionCheckBlankExecute(Sender: TObject);
begin
  inherited;
  Panel150.Visible:=quBlankParam.FieldByName('SummaTT').AsFloat<150;
end;

procedure TMlekoBlankSpecForm.quBlankParamAfterOpen(DataSet: TDataSet);
begin
  inherited;
  ActionCheckBlank.Execute;
end;

procedure TMlekoBlankSpecForm.quBlankParamAfterRefresh(DataSet: TDataSet);
begin
  inherited;
  ActionCheckBlank.Execute;
end;

procedure TMlekoBlankSpecForm.FormCreate(Sender: TObject);
begin
  inherited;
  if is_only_ord=1 then begin
    ActionIsOrd.Enabled:=false;
    CBOnlyOrd.Checked:=true;
    CBOnlyOrd.Enabled:=CodeAccess<3;
    ActionIsOrd.Enabled:=CodeAccess<3;
  end;
  
end;

procedure TMlekoBlankSpecForm.ActionCopyToExcelExecute(Sender: TObject);
begin
  inherited;
  DBGrid.CopyGridToExcel;
end;

procedure TMlekoBlankSpecForm.ActionAllZeroExecute(Sender: TObject);
begin
  inherited;
  GenInputOrder.First;
  while not GenInputOrder.Eof do
  begin
   spEditBlankPosition.Close;
   spEditBlankPosition.Params.ParamByName('document_id').Value:=l_document_Id;
   spEditBlankPosition.Params.ParamByName('tovarNo').Value:=GenInputOrder.FieldByName('tovarNo').AsInteger;
   spEditBlankPosition.Params.ParamByName('UserNo').Value:=data.UserNo;
   spEditBlankPosition.Params.ParamByName('KolBeg').Value:=0;
   spEditBlankPosition.Params.ParamByName('KolOrd').Value:=0;
   spEditBlankPosition.Params.ParamByName('Boss_Price').Value:=-1;
   spEditBlankPosition.ExecProc;
   GenInputOrder.Next;
  end;
  ActionViewRefresh.Execute;
end;

procedure TMlekoBlankSpecForm.ActionViewRefreshExecute(Sender: TObject);
begin
  inherited;
  SetLinkPanelVisible(false);
  quBlankParam.Refresh;
end;

procedure TMlekoBlankSpecForm.DBGridKeyPress(Sender: TObject;
  var Key: Char);
begin
//  inherited;

end;

procedure TMlekoBlankSpecForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Dlg: TMlekoBlankParamForm;
  Dlg1 : TMlekoBlankListForm;
  quSumDocum : TMSQuery;
  quDocum : TMSQuery;
  DescriptionBanPay: String;
  SumDoc : Double;

begin
  inherited;
  Dlg := TMlekoBlankParamForm.Create(Application);

  MlekoBlnkPrivyazka.Privyazka.Label1.Caption:='';
  MlekoBlnkPrivyazka.Privyazka.Label2.Caption:='';
  MlekoBlkParamPrivyazka.NaborAddTovar.Label1.Caption:='';
  GenInputOrder.Filtered:=False;

  quDocum := TMSQuery.Create(nil);
  quDocum.Connection:= dmDataModule.DB;
  quDocum.SQL.Clear;
  quDocum.SQL.Text:='select PostNo, Buh, VidtovGroupId, DateNakl from e_blank_head where id = :Document_id';
  quDocum.ParamByName('Document_id').Value := l_document_Id;
  quDocum.Open;

  Dlg.quPostBanPay.Close;
  Dlg.quPostBanPay.Params.ParamByName('PostNo').Value := quDocum.FieldByName('PostNo').Value;
  Dlg.quPostBanPay.Params.ParamByName('set_article_group_id').Value := quDocum.FieldByName('VidtovGroupId').Value;
  Dlg.quPostBanPay.Params.ParamByName('Buh').Value := quDocum.FieldByName('Buh').Value;
  Dlg.quPostBanPay.Open;

  Dlg.quSummaDolga.Close;
  Dlg.quSummaDolga.Params.ParamByName('PostNo').Value := quDocum.FieldByName('PostNo').Value;
  Dlg.quSummaDolga.Params.ParamByName('set_article_group_id').Value := quDocum.FieldByName('VidtovGroupId').Value;
  dlg.quSummaDolga.Params.ParamByName('Buh').Value := quDocum.FieldByName('Buh').Value;
  Dlg.quSummaDolga.Open;

  Dlg.quControlPayBan.Close;
  Dlg.quControlPayBan.Params.ParamByName('PostNo').Value := quDocum.FieldByName('PostNo').Value;
  Dlg.quControlPayBan.Params.ParamByName('set_article_group_id').Value := quDocum.FieldByName('VidtovGroupId').Value;;
  Dlg.quControlPayBan.Params.ParamByName('Buh').Value := quDocum.FieldByName('Buh').Value;
  Dlg.quControlPayBan.Params.ParamByName('DateNakl').Value := quDocum.FieldByName('DateNakl').Value;
  Dlg.quControlPayBan.Open;

  quSumDocum := TMSQuery.Create(nil);
  quSumDocum.Connection:= dmDataModule.DB;
  quSumDocum.SQL.Clear;
//  quSumDocum.SQL.Text:='select isnull(SUM(isnull(KolOrd,0) * isnull(Boss_price,0)),0) as summ from e_blanks where Document_id = :Document_id';
  quSumDocum.SQL.Text:='select isnull(SUM(isnull(KolOrd,0) * isnull(PaymentPrice,0)),0) as summ from e_blanks where Document_id = :Document_id';
  quSumDocum.ParamByName('Document_id').Value := l_document_Id;
  quSumDocum.Open;



  SumDoc := quSumDocum.FieldByName('summ').Value;

  if dlg.quControlPayBan.RecordCount > 0 then Is_ControlPostBanPay := false else Is_ControlPostBanPay := true;

  if (((Dlg.quSummaDolgaSUMMA_ECO.Value + SumDoc) > Dlg.quPostBanPayPayBan.Value) and (Dlg.quPostBanPayPayBan.Value <>0)
                                                                                  and (Is_ControlPostBanPay = True)) then
  begin
    DescriptionBanPay := 'Превышен лимит! ' +#13#10+ 'Сумма дебиторской задолженности с учетом текущего заказа ' + FloatToStr(Dlg.quSummaDolgaSUMMA_ECO.Value + quSumDocum.FieldByName('summ').Value)
                                            +#13#10+ 'Допустимый лимит '+ FloatToStr(Dlg.quPostBanPayPayBan.Value)
                                            +#13#10+ 'Заказ будет помечен как удаленный!';
    ShowMessage(DescriptionBanPay);
    Dlg1 := TMlekoBlankListForm.Create(Application);
    Dlg1.spDelInputOrder.Close;
    Dlg1.spDelInputOrder.Params.ParamByName('document_id').Value := l_document_Id;
    Dlg1.spDelInputOrder.ExecProc;
    Dlg1.Free;
  end;

  Dlg.Free;



end;

procedure TMlekoBlankSpecForm.cbVidTovClick(Sender: TObject);
begin
  inherited;
  if cbVidTov.Checked then GenInputOrder.Filtered := True
                      else GenInputOrder.Filtered := False;
end;

procedure TMlekoBlankSpecForm.SearchTovarNoClick(Sender: TObject);
begin
  inherited;
  if SearchTovarNo.Checked then begin
                                  PanelSearch.Visible := True;
                                  PanelSearch.Caption := 'Поиск товара по коду';
                                  EdSearchTovarNo.Visible := True;
                                  EdSearch.Visible := False;
                                  EdSearchTovarNo.SetFocus;
                                end
                           else begin
                                  PanelSearch.Visible := False;
                                  PanelSearch.Caption := 'Поиск товара';
                                  EdSearchTovarNo.Visible := False;
                                  EdSearch.Visible := True;
                                  DBGrid.SetFocus;
                                end;
end;

procedure TMlekoBlankSpecForm.EdSearchTovarNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (key in['0'..'9', #8]) then
   begin
     key:=#0;
   end;
end;

procedure TMlekoBlankSpecForm.EdSearchTovarNoChange(Sender: TObject);
begin
  inherited;
  GenInputOrder.Locate('TovarNo',EdSearchTovarNo.Text,[loPartialKey,loCaseInsensitive]);
end;

procedure TMlekoBlankSpecForm.EdSearchTovarNoEnter(Sender: TObject);
begin
  inherited;
//  DBGrid.SetFocus;
end;

procedure TMlekoBlankSpecForm.EdSearchTovarNoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN:  begin
                  DBGrid.SetFocus;
                end;
  end;
end;

procedure TMlekoBlankSpecForm.dblcVidTovChange(Sender: TObject);
begin
  inherited;
  if dblcVidTov.Text <> '' then GenInputOrder.Filter := 'vidname = ' + '''' + dblcVidTov.Text + '''' else GenInputOrder.Filter := '';
  GenInputOrder.Filtered := cbVidTov.Checked;
end;

end.

