unit MlekoBlankParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKPropDb, DB, DBAccess, MsAccess, ActnList, ComCtrls, StdCtrls, citCtrls,
  citmask, citDBCalendar, DBCtrls,
  citDBComboEdit,SdacVcl,
  ExtCtrls, MemDS, ToolWin, Mask, DBCtrlsEh, DBGridEh, DBLookupEh;

type
  TMlekoBlankParamForm = class(TCFLMLKPropDbDlg)
    EdAddress: TLabel;
    EdOtdel: TLabel;
    quColNPrice: TMSQuery;
    spAddInputOrder: TMSStoredProc;
    sp_EditBlankParam: TMSStoredProc;
    ActionSelectPost: TAction;
    dsRecomBlankParam: TDataSource;
    spRecomBlankParam: TMSStoredProc;
    EdOutTrade: TcitEdit;
    edSotrud: TLabel;
    ActionSelectSotrud: TAction;
    CBReason: TcitDBComboEdit;
    quColNPriceColNPrice: TSmallintField;
    quColNPriceColName: TStringField;
    quContract: TMSQuery;
    quContractid: TAutoIncField;
    quContractdescription: TStringField;
    Panel1: TPanel;
    Label1: TLabel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    LInfo: TLabel;
    quOurFirm: TMSQuery;
    quOurFirmname: TStringField;
    quOurFirmPostNo: TSmallintField;
    TabSheet3: TTabSheet;
    CEColnPrice: TcitDBComboEdit;
    ftOurFirm: TcitDBComboEdit;
    CBContract: TcitDBComboEdit;
    EdDateNakl: TcitDBDateEdit;
    Label2: TLabel;
    SpCheckBlank: TMSStoredProc;
    lblAgent: TLabel;
    lblOtdel: TLabel;
    lblDelay: TLabel;
    lblBuh: TLabel;
    lblCapBuhName: TLabel;
    lblCapDelay: TLabel;
    EdPost: TcitDBComboEdit;
    Button1: TButton;
    dsPostBan: TDataSource;
    quPostBan: TMSQuery;
    quPostBanPostBan: TIntegerField;
    quPostBanDescription: TStringField;
    dsPostBanPay: TDataSource;
    quPostBanPay: TMSQuery;
    quPostBanPayid: TIntegerField;
    quPostBanPayPostNo_PayBan: TSmallintField;
    quPostBanPaySET_ARTICLE_GROUP_ID_PayBan: TLargeintField;
    quPostBanPayPayBan: TIntegerField;
    quSummaDolga: TMSQuery;
    dsSummaDolga: TDataSource;
    quSummaDolgaSUMMA_ECO: TFloatField;
    quSummaDolgaCONTRACTOR_ACC_ID: TSmallintField;
    quSummaDolgaSET_ARTICLE_GROUP_ID: TLargeintField;
    quSummaDolgaBuh: TSmallintField;
    quControlPayBan: TMSQuery;
    dsControlPayBan: TDataSource;
    quControlPayBanDateBeg: TDateTimeField;
    quControlPayBanDateEnd: TDateTimeField;
    quControlPayBanDescription: TStringField;
    quControlPayBanActive: TBooleanField;
    quControlPayBanPayBan: TIntegerField;
    Label3: TLabel;
    quTypeReturn: TMSQuery;
    dsTypeReturn: TMSDataSource;
    quTypeReturnTypeReturnNo: TIntegerField;
    quTypeReturnTypeReturnName: TStringField;
    quTypeReturnActive: TFloatField;
    DBLookupComboboxEhTypeReturn: TDBLookupComboboxEh;
    spModifyLinkBlankReturn: TMSStoredProc;
    quTypeReturnBlank: TMSQuery;
    quTypeReturnBlankTypeReturnNo: TIntegerField;
    Label4: TLabel;
    quPostBanPayPostName: TStringField;
    quPostBanPaySetArticleGroupName: TStringField;
    quPostBanPayBuhName: TStringField;
    EdDescription: TEdit;
    EdDescriptionOrderVeb: TEdit;
    Label5: TLabel;
    dsCurrency: TMSDataSource;
    quCurrency: TMSQuery;
    DBLookupComboboxEhCurrency: TDBLookupComboboxEh;
    quCurrencyID: TIntegerField;
    quCurrencyNAME: TStringField;
    quCurrencyL_CODE: TStringField;
    quCurrencySHORT_NAME: TStringField;
    quCurrencyIsDefault: TBooleanField;
    quCurrencyisTrash: TBooleanField;
    procedure ActionSelectPostExecute(Sender: TObject);
    procedure EdDateNaklKeyPress(Sender: TObject; var Key: Char);
    procedure edBuhEnter(Sender: TObject);
    procedure edBuhCloseUp(Sender: TObject);
    procedure EdOutTradeKeyPress(Sender: TObject; var Key: Char);
    procedure EdDelayKeyPress(Sender: TObject; var Key: Char);
    procedure ActionApplyExecute(Sender: TObject);
    procedure EdPostSelectOk(Sender: TObject);
    procedure EdOutTradeExit(Sender: TObject);
    procedure ActionOKExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdPostExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CEColnPriceChange(Sender: TObject);
    procedure CEColnPriceExit(Sender: TObject);
    procedure EdDateNaklEnter(Sender: TObject);
    procedure CBReasonExit(Sender: TObject);
    procedure DBLookupComboboxEhTypeReturnExit(Sender: TObject);
    procedure CBReasonChange(Sender: TObject);
    function CBReasonIsSelect(Sender: TObject): Boolean;
    procedure CBReasonSelectOk(Sender: TObject);
    procedure EdPostChange(Sender: TObject);

  private
    ln_dept_id: integer;
    documentID: Int64;
    OtdelNo: integer;
    AddressNo: integer;
    SotrudNo: integer;
    UserNo: integer;
    VidNaklNo: integer;
    ColNPrice: integer;
    DateNakl: Tdate;
    is_edit: boolean;
    is_add: boolean;
    is_enter_key: boolean;
    l_is_autoload: boolean;
    FDelay: Integer;
    FBuh: Integer;
    FSARTICLE_GROUP: Int64;
    FAddressPostID: Int64;
    FPostNo: Int64;
    Is_PostBan: Boolean;
    Is_PostBanPay: Boolean;
    Is_ControlPostBanPay: Boolean;
    DescriptionBan: String;
    DescriptionBanPay: String;
    function CheckBlank(pPostno, pReason_id: Integer; pDateNakl: TDate;
      pOtdelNo: Integer; SET_ARTICLE_GROUP_ID: Int64; var err_message: string): Integer;
    procedure SetBuh(const Value: Integer);
    procedure SetDelay(const Value: Integer);
    procedure SetSARTICLE_GROUP(const Value: Int64);
    procedure SetAddressPostID(const Value: Int64);
    procedure SetPostNo(const Value: Int64);
  protected
    DefaultButton: TButton;
    procedure NextControl;
  public
    class function AddBlankParam(var aDocumentID: Int64; p_dept_id: integer; p_date: TDate; is_autoload: boolean = false): boolean;
    class function EditBlankParam(DocumentID: Int64; is_autoload: boolean = false): boolean;
    property Delay: Integer read FDelay write SetDelay;
    property Buh: Integer read FBuh write SetBuh;
    property SARTICLE_GROUP: Int64 read FSARTICLE_GROUP write SetSARTICLE_GROUP;
    property AddressPostID: Int64 read FAddressPostID write SetAddressPostID;
    property PostNo: Int64 read FPostNo write SetPostNo;
  end;

var
  MlekoBlankParamForm: TMlekoBlankParamForm;

implementation

uses PostForRashod0, data,
  MlekoSelectSotrud,MlekoBlnkPrivyazka, MlekoBlkParamPrivyazka,Meko_Blanc_Price;

{$R *.dfm}

class function TMlekoBlankParamForm.addBlankParam(var aDocumentID: Int64; p_dept_id: integer; p_date: TDate; is_autoload: boolean = false):
  boolean;
var
  Dlg: TMlekoBlankParamForm;
begin

  Dlg := TMlekoBlankParamForm.Create(Application);
  dlg.quTypeReturn.Open;
  Dlg.quCurrency.Open;
  Dlg.ln_dept_id := p_dept_id;
  Dlg.is_edit := false;
  Dlg.is_add := true;
  dlg.l_is_autoload := is_autoload;
  Dlg.DateNakl := p_date;
  Dlg.DocumentID := aDocumentID;
  Dlg.VidNaklNo := 1;
  Dlg.UserNo := Data.UserNo;

  Dlg.EdOutTrade.Enabled := False;
  Dlg.EdDateNakl.Text := dateToStr(Dlg.DateNakl);
  Dlg.ftOurFirm.Enabled := (Data.CodeAccess < 2);
  Dlg.EdDateNakl.Enabled := (Data.CodeAccess < 5);

  dmDataModule.OpenSQL('select l_code, Name from D_CURRENCY where IsDefault = 1');

  Dlg.DBLookupComboboxEhCurrency.Text := dmDataModule.QFO.FieldByName('Name').AsString;
  Dlg.DBLookupComboboxEhCurrency.KeyValue := dmDataModule.QFO.FieldByName('l_code').AsString;
{
  if (dlg.CBReason.KeyFieldValue = '7') or (dlg.CBReason.KeyFieldValue = '11') then
   begin

     dlg.DBLookupComboboxEhTypeReturn.Enabled := true;
     dlg.quTypeReturn.Refresh;
   end;
}
  if Dlg.l_is_autoload and (not Data.CodeAccess = 0) then
  begin
    Dlg.EdDateNakl.Visible := false;
    Dlg.CBReason.Enabled := false;
  end;
  Dlg.ftOurFirm.KeyFieldValue := IntToStr(dmDataModule.FirmNo);
  Dlg.ftOurFirm.GetLocateKey;
  Dlg.SARTICLE_GROUP := 0;
  if is_autoload then
    Dlg.CBReason.KeyFieldValue := '4'
  else
    Dlg.CBReason.KeyFieldValue := '1';
//  Dlg.CBReason.GetLocateKey;
  try

    if (dlg.CBReason.KeyFieldValue = '10') or (dlg.CBReason.KeyFieldValue = '11')
    then begin
           Dlg.EdDescriptionOrderVeb.Visible := true;
           Dlg.Label4.Visible := true;
         end
    else begin
           Dlg.EdDescriptionOrderVeb.Visible := false;
           Dlg.Label4.Visible := false;
         end;
 
    Result := (Dlg.ShowModal = mrOk);
    if (Dlg.Is_PostBanPay = True) then ShowMessage (Dlg.DescriptionBanPay);
    if ((Dlg.Is_PostBan = True) and (Dlg.is_add = true)) then ShowMessage (Dlg.DescriptionBan);
    if ((Result) and (Dlg.Is_PostBan = False) and (Dlg.Is_PostBanPay = False)) then
      with dlg do
      begin
        spAddInputOrder.Close;
        spAddInputOrder.ParamByName('PostNo').Value := PostNo;
        spAddInputOrder.ParamByName('DateNakl').Value := EdDateNakl.CurrentDate;
        spAddInputOrder.ParamByName('SotrudNo').Value := SotrudNo;
        spAddInputOrder.ParamByName('VidNaklNo').Value := VidNaklNo;
        spAddInputOrder.ParamByName('UserNo').Value := UserNo;
        spAddInputOrder.ParamByName('AddressNo').Value := AddressNo;
        spAddInputOrder.ParamByName('OtdelNo').Value := OtdelNo;
//        showmessage(CEColnPrice.KeyFieldValue);
        spAddInputOrder.ParamByName('ColnPrice').Value := CEColnPrice.KeyFieldValue;
        spAddInputOrder.ParamByName('KolDayPlan').Value := Delay;
        spAddInputOrder.ParamByName('ReasonId').Value := CBReason.KeyFieldValue;
        spAddInputOrder.ParamByName('Contract_id').Value := CBContract.KeyFieldValue;
        spAddInputOrder.ParamByName('Buh').Value := Buh;
        spAddInputOrder.ParamByName('VidTovGroupId').Value := SARTICLE_GROUP;
        spAddInputOrder.ParamByName('Description').Value := EdDescription.Text +' Создано в торговой программе!';
        spAddInputOrder.ParamByName('Currency').Value := DBLookupComboboxEhCurrency.KeyValue;
        spAddInputOrder.ParamByName('IsVeb').Value := 0;

        if (dlg.CBReason.KeyFieldValue = '10') or (dlg.CBReason.KeyFieldValue = '11') then
         if EdDescriptionOrderVeb.Text = '' then spAddInputOrder.ParamByName('descriptionOrderVeb').Clear
                                            else spAddInputOrder.ParamByName('descriptionOrderVeb').Value := EdDescriptionOrderVeb.Text + ' Создано в торговой программе!';

        spAddInputOrder.ParamByName('OurFirmNo').AsInteger := StrToInt(ftOurFirm.KeyFieldValue);
        spAddInputOrder.ExecProc;
        documentID := spAddInputOrder.ParamByName('ln_document_id').Value;
        spAddInputOrder.ParamByName('Description').Clear;


        if (dlg.CBReason.KeyFieldValue = '7') or (dlg.CBReason.KeyFieldValue = '11') or (dlg.CBReason.KeyFieldValue = '13') then
          begin
            spModifyLinkBlankReturn.Close;
            spModifyLinkBlankReturn.ParamByName('Document_id').Value := documentID;
            spModifyLinkBlankReturn.ParamByName('TypeReturnNo').Value := DBLookupComboboxEhTypeReturn.KeyValue;
            spModifyLinkBlankReturn.Execute;
          end;
      end;
  finally
    dlg.quTypeReturn.Close;
    Dlg.quCurrency.Close;
    aDocumentID := Dlg.documentID;
    Dlg.spRecomBlankParam.Close;
    Dlg.quColNPrice.Close;
    Dlg.Free;
  end;
end;

class function TMlekoBlankParamForm.EditBlankParam(DocumentID: Int64; is_autoload: boolean = false): boolean;
var
  Dlg: TMlekoBlankParamForm;

begin
  Dlg := TMlekoBlankParamForm.Create(Application);
  Dlg.is_edit := true;
  Dlg.is_add := false;
  Dlg.l_is_autoload := is_autoload;
  Dlg.DocumentID := DocumentID;
  Dlg.VidNaklNo := 1;
  Dlg.UserNo := Data.UserNo;
  Dlg.DateNakl := Date();

  Dlg.quTypeReturn.Open;
  Dlg.quCurrency.Open;

  Dlg.quTypeReturnBlank.Close;
  Dlg.quTypeReturnBlank.ParamByName('Document_id').Value := DocumentID;
  Dlg.quTypeReturnBlank.Open;



  if Dlg.quTypeReturnBlank.RecordCount > 0 then Dlg.DBLookupComboboxEhTypeReturn.KeyValue := Dlg.quTypeReturnBlank.FieldByName('TypeReturnNo').Value
                                           else Dlg.DBLookupComboboxEhTypeReturn.KeyValue := 0;


  dmDataModule.OpenSQL('select CurrencyHead from e_blank_head where id = :p1_Id',[DocumentID]);

//  showmessage (dmDataModule.QFO.FieldByName('CurrencyHead').AsString);

  if dmDataModule.QFO.FieldByName('CurrencyHead').IsNull then begin
                                                                dmDataModule.OpenSQL('select l_code, Name from D_CURRENCY where IsDefault = 1');
                                                                Dlg.DBLookupComboboxEhCurrency.Text := dmDataModule.QFO.FieldByName('Name').AsString;
                                                                Dlg.DBLookupComboboxEhCurrency.KeyValue := dmDataModule.QFO.FieldByName('l_code').AsString;
                                                              end
                                                         else Dlg.DBLookupComboboxEhCurrency.KeyValue := dmDataModule.QFO.FieldByName('CurrencyHead').AsString;

  //showmessage(Dlg.DBLookupComboboxEhCurrency.KeyValue);


  Dlg.spRecomBlankParam.Close;
  Dlg.spRecomBlankParam.Prepare;
  Dlg.spRecomBlankParam.ParamByName('PostNo').Value := -1;
  Dlg.spRecomBlankParam.ParamByName('OtdelNo').Value := -1;
  Dlg.spRecomBlankParam.ParamByName('document_id').Value := DocumentID;
  Dlg.spRecomBlankParam.ParamByName('DateNakl').AsDateTime := DLG.DateNakl;
  Dlg.spRecomBlankParam.ParamByName('AddressNo').Value := -1;
  Dlg.spRecomBlankParam.Open;

  Dlg.quColNPrice.Close;
  Dlg.quColNPrice.ParamByName('POSTNO').Value := DLg.spRecomBlankParam.FieldByName('PostNo').AsInteger;
  Dlg.quColNPrice.Open;

  Dlg.EdDateNakl.Enabled := (Data.CodeAccess < 5);
  Dlg.ftOurFirm.Enabled := (Data.CodeAccess < 2);
  Dlg.PostNo := DLg.spRecomBlankParam.FieldByName('PostNo').AsInteger;
  Dlg.AddressNo := DLg.spRecomBlankParam.FieldByName('AddressNo').AsInteger;
  Dlg.OtdelNo := DLg.spRecomBlankParam.FieldByName('OtdelNo').AsInteger;
  Dlg.DateNakl := DLg.spRecomBlankParam.FieldByName('DateNakl').AsDateTime;
  Dlg.VidNaklNo := DLg.spRecomBlankParam.FieldByName('VidNaklNo').AsInteger;
  Dlg.SotrudNo := DLg.spRecomBlankParam.FieldByName('SotrudNo').AsInteger;
  Dlg.ColnPrice := DLg.spRecomBlankParam.FieldByName('ColnPrice').AsInteger;

  //
  //Dlg.Delay := DLg.spRecomBlankParam.FieldByName('KolDayPlan').AsInteger;   // не корректные данные при редактировании
  //

  // При редактировании данные по умолчанию для отсрочки берутся из бланка
  dmDataModule.quWork.Close;
  dmDataModule.quWork.SQL.Clear;
  dmDataModule.quWork.SQL.Add('select * from e_blank_head where ID = ' + IntToStr(DocumentID));
  dmDataModule.quWork.Open;
  Dlg.Delay := dmDataModule.quWork.FieldByName('KolDayPlan').AsInteger;
  dmDataModule.quWork.SQL.Clear;
  dmDataModule.quWork.Close;


  Dlg.Buh := DLg.spRecomBlankParam.FieldByName('Buh').AsInteger;

  Dlg.EdAddress.Caption := Dlg.spRecomBlankParam.FieldByName('Address').AsString;
  Dlg.EdOtdel.Caption := Dlg.spRecomBlankParam.FieldByName('OtdelName').AsString;
  Dlg.edPost.Text := Dlg.spRecomBlankParam.FieldByName('PostName').AsString;
  Dlg.edSotrud.Caption := Dlg.spRecomBlankParam.FieldByName('SotrudName').AsString;
  Dlg.CBReason.KeyFieldValue := Dlg.spRecomBlankParam.FieldByName('ReasonId').AsString;
  Dlg.CBReason.Text := Dlg.spRecomBlankParam.FieldByName('reasonname').AsString;

  Dlg.CBContract.KeyFieldValue := Dlg.spRecomBlankParam.FieldByName('Contract_id').AsString;
  Dlg.CBContract.GetLocateKey;
  Dlg.CEColnPrice.KeyFieldValue := Dlg.spRecomBlankParam.FIeldByName('ColNPrice').AsString;
  Dlg.CEColnPrice.GetLocateKey;
  Dlg.SARTICLE_GROUP := Dlg.spRecomBlankParam.FIeldByName('VidTovGroupId').Value;
  Dlg.ftOurFirm.KeyFieldValue := Dlg.spRecomBlankParam.FIeldByName('OurFirmNo').AsString;
  Dlg.ftOurFirm.GetLocateKey;
  DLg.EdDescription.Text := Dlg.spRecomBlankParam.FIeldByName('Description').AsString;

  if ((Dlg.spRecomBlankParam.FieldByName('ReasonId').AsInteger = 10) or (Dlg.spRecomBlankParam.FieldByName('ReasonId').AsInteger = 11))
   then begin

          Dlg.EdDescriptionOrderVeb.Visible := true;
          Dlg.Label4.Visible := true;

          dmDataModule.quWork.Close;
          dmDataModule.quWork.SQL.Clear;
          dmDataModule.quWork.SQL.Add('select * from DescriptionsOrdersVeb where IdBlank = ' + IntToStr(DocumentID));
          dmDataModule.quWork.Open;
          Dlg.EdDescriptionOrderVeb.Text := dmDataModule.quWork.FieldByName('DescriptionOrderVeb').AsString;
          dmDataModule.quWork.SQL.Clear;
          dmDataModule.quWork.Close;
        end
   else begin
          Dlg.EdDescriptionOrderVeb.Visible := false;
          Dlg.Label4.Visible := false;

        end;
  if Dlg.l_is_autoload and (not Data.CodeAccess = 0) then
  begin
    Dlg.EdDateNakl.Visible := false;
    Dlg.CBReason.Enabled := false;
  end;
  Dlg.CBContract.Enabled := Dlg.spRecomBlankParam.FieldByName('is_select_contract').AsInteger = 1;
  try
    Result := (Dlg.ShowModal = mrOk);
    if Dlg.Is_PostBanPay = True then  ShowMessage (Dlg.DescriptionBanPay);
    if ((Dlg.Is_PostBan = True) and (Dlg.is_edit = true)) then ShowMessage (Dlg.DescriptionBan);
    if ((Result) and (Dlg.Is_PostBan = False) and (Dlg.Is_PostBanPay = False)) then
      with dlg do
      begin
        Sp_EditBlankParam.Close;
        Sp_EditBlankParam.ParamByName('PostNo').Value := PostNo;
        Sp_EditBlankParam.ParamByName('DateNakl').Value := EdDateNakl.CurrentDate;
        Sp_EditBlankParam.ParamByName('SotrudNo').Value := SotrudNo;
        Sp_EditBlankParam.ParamByName('VidNaklNo').Value := VidNaklNo;
        Sp_EditBlankParam.ParamByName('UserNo').Value := UserNo;
        Sp_EditBlankParam.ParamByName('AddressNo').Value := AddressNo;
        Sp_EditBlankParam.ParamByName('OtdelNo').Value := OtdelNo;
        Sp_EditBlankParam.ParamByName('ColnPrice').Value := CEColnPrice.KeyFieldValue;
        Sp_EditBlankParam.ParamByName('KolDayPlan').Value := Delay;
        Sp_EditBlankParam.ParamByName('Buh').Value := Buh;
        Sp_EditBlankParam.ParamByName('ReasonId').Value := CBReason.KeyFieldValue;
        Sp_EditBlankParam.ParamByName('Contract_id').Value := CBContract.KeyFieldValue;
        Sp_EditBlankParam.ParamByName('VidTovGroupId').Value := SARTICLE_GROUP;
        Sp_EditBlankParam.ParamByName('Description').Value := EdDescription.Text + 'Редактировано в торговой программе!';
        Sp_EditBlankParam.ParamByName('Currency').Value := DBLookupComboboxEhCurrency.KeyValue;
        Sp_EditBlankParam.ParamByName('isVeb').Value := 0;

//        showmessage(Sp_EditBlankParam.ParamByName('Currency').AsString+'   '+DBLookupComboboxEhCurrency.KeyValue);

        if ((Dlg.spRecomBlankParam.FieldByName('ReasonId').AsInteger = 10) or (Dlg.spRecomBlankParam.FieldByName('ReasonId').AsInteger = 11)) then
         if EdDescriptionOrderVeb.Text = '' then Sp_EditBlankParam.ParamByName('descriptionOrderVeb').Clear
                                            else Sp_EditBlankParam.ParamByName('descriptionOrderVeb').Value := EdDescriptionOrderVeb.Text + 'Редактировано в торговой программе!';
                                            
//        showmessage(EdDescriptionOrderVeb.Text);


        Sp_EditBlankParam.ParamByName('ln_document_id').Value := documentID;
        Sp_EditBlankParam.ParamByName('OurFirmNo').AsInteger := StrToInt(ftOurFirm.KeyFieldValue);
        Sp_EditBlankParam.ExecProc;

        if (dlg.CBReason.KeyFieldValue = '7') or (dlg.CBReason.KeyFieldValue = '11') or (dlg.CBReason.KeyFieldValue = '13') then
          begin
            spModifyLinkBlankReturn.Close;
            spModifyLinkBlankReturn.ParamByName('Document_id').Value := documentID;
            spModifyLinkBlankReturn.ParamByName('TypeReturnNo').Value := DBLookupComboboxEhTypeReturn.KeyValue;
            spModifyLinkBlankReturn.Execute;
          end;
      end;
  finally
    Dlg.spRecomBlankParam.Close;
    Dlg.quColNPrice.Close;
    Dlg.quTypeReturn.Close;
    Dlg.quCurrency.Close;
    Dlg.quTypeReturnBlank.Close;
    Dlg.Free;
  end;
end;

procedure TMlekoBlankParamForm.NextControl;
var
  lControl: TWinControl;
begin
  lControl := FindNextControl(ActiveControl, True, True, False);
  if lControl.CanFocus then lControl.SetFocus;
end;

procedure TMlekoBlankParamForm.ActionSelectPostExecute(Sender: TObject);
var
  RetPostForRashod: TRetPostForRashod;
  ErrMsg: string;
begin
  inherited;
  RetPostForRashod := PostForRashod(DateNakl, PostNo);
  if RetPostForRashod.PostNo > 0 then
  begin
    //   if not (Query.State in [dsInsert, dsEdit]) then Query.Edit;
//    edPost.Text := RetPostForRashod.NameLong;
    edPost.Text := RetPostForRashod.NamePost;  // изменено с полного имени на наименование из-за ошибки при редактировании
    edAddress.Caption := RetPostForRashod.Address;
    edOtdel.Caption := RetPostForRashod.NameOtdel;

    SotrudNo := RetPostForRashod.SotrudNo;
    PostNo := RetPostForRashod.PostNo;
    AddressNo := RetPostForRashod.AddressNo;
    OtdelNo := RetPostForRashod.OtdelNo;
    SARTICLE_GROUP := RetPostForRashod.SET_ARTICLE_GROUP;
    Delay := RetPostForRashod.DayDelay;
    Buh := RetPostForRashod.Buh;
    AddressPostID := RetPostForRashod.AddressID;

    dmDataModule.quWork.Close;
    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('select SotrudName from Sotrud where SotrudNo=' + IntToStr(SotrudNo));
    dmDataModule.quWork.Open;
    edSotrud.Caption := dmDataModule.quWork.FieldByName('SotrudName').AsString;
    dmDataModule.quWork.Close;

    quColNPrice.Close;
    quColNPrice.ParamByName('POSTNO').Value := PostNo;
    quColNPrice.Open;

    spRecomBlankParam.Close;
    spRecomBlankParam.Prepare;
    spRecomBlankParam.ParamByName('PostNo').Value := PostNo;
    spRecomBlankParam.ParamByName('OtdelNo').Value := OtdelNo;
    spRecomBlankParam.ParamByName('document_id').Value := DocumentID;
    spRecomBlankParam.ParamByName('DateNakl').AsDate := DateNakl;
    spRecomBlankParam.ParamByName('AddressNo').Value := AddressNo;
    spRecomBlankParam.Open;

    CEColnPrice.KeyFieldValue := spRecomBlankParam.FIeldByName('ColNPrice').AsString;
    CEColnPrice.GetLocateKey;
    CBContract.KeyFieldValue := spRecomBlankParam.FieldByName('Contract_id').AsString;
    CBContract.GetLocateKey;
    CBContract.Enabled := spRecomBlankParam.FieldByName('is_select_contract').AsInteger = 1;
    NextControl;
  end;
end;

procedure TMlekoBlankParamForm.EdDateNaklKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
  begin
  if Button1.Enabled then   // Для отображения соответствующих цен из справочника
    Button1.Click
    else
    NextControl; 
       end;
  

end;

procedure TMlekoBlankParamForm.edBuhEnter(Sender: TObject);
begin
  inherited;
  (Sender as TDBLookupComboBox).DropDown;
end;

procedure TMlekoBlankParamForm.edBuhCloseUp(Sender: TObject);
begin
  inherited;
  NextControl;
end;

procedure TMlekoBlankParamForm.EdOutTradeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then ActionSelectPost.Execute;
end;

procedure TMlekoBlankParamForm.EdDelayKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then NextControl;
end;

function TMlekoBlankParamForm.CheckBlank(pPostno, pReason_id: Integer; pDateNakl: TDate; pOtdelNo: Integer; SET_ARTICLE_GROUP_ID: Int64; var err_message: string): Integer;
begin
  inherited;
  SpCheckBlank.Close;
  SpCheckBlank.ParamByName('p_Postno').Value := pPostno;
  SpCheckBlank.ParamByName('p_Reason_id').Value := pReason_id;
  SpCheckBlank.ParamByName('DateNakl').AsDate := pDateNakl;
  SpCheckBlank.ParamByName('OtdelNo').Value := pOtdelNo;
  SpCheckBlank.ParamByName('SET_ARTICLE_GROUP_ID').Value := SARTICLE_GROUP;
  SpCheckBlank.ExecProc;
  result := SpCheckBlank.ParamByName('err_level').AsInteger;
  err_message := SpCheckBlank.ParamByName('err_message').AsString;
  if Result in [10, 5] then
    LInfo.Caption := err_message
  else
    LInfo.Caption := '';
end;

procedure TMlekoBlankParamForm.ActionApplyExecute(Sender: TObject);
var
  ErrMsg,Msg: string;
  Dlg: TMlekoBlankParamForm;
begin

  is_postBanPay := false;

  Dlg := TMlekoBlankParamForm.Create(Application);
  Dlg.quPostBan.Close;
  Dlg.quPostBan.Params.ParamByName('p_PostNo').Value := PostNo;
  Dlg.quPostBan.Open;

  Dlg.quPostBanPay.Close;
  Dlg.quPostBanPay.Params.ParamByName('PostNo').Value := PostNo;
  Dlg.quPostBanPay.Params.ParamByName('set_article_group_id').Value := SARTICLE_GROUP;
  Dlg.quPostBanPay.Params.ParamByName('Buh').Value := Buh;
  Dlg.quPostBanPay.Open;

  dlg.quControlPayBan.Close;
  dlg.quControlPayBan.Params.ParamByName('PostNo').Value := PostNo;
  Dlg.quControlPayBan.Params.ParamByName('set_article_group_id').Value := SARTICLE_GROUP;
  Dlg.quControlPayBan.Params.ParamByName('Buh').Value := Buh;
  Dlg.quControlPayBan.Params.ParamByName('DateNakl').Value := DateNakl;
  Dlg.quControlPayBan.Open;

  Dlg.quSummaDolga.Close;
  dlg.quSummaDolga.Params.ParamByName('PostNo').Value := PostNo;
  Dlg.quSummaDolga.Params.ParamByName('set_article_group_id').Value := SARTICLE_GROUP;
  dlg.quSummaDolga.Params.ParamByName('Buh').Value := Buh;
  Dlg.quSummaDolga.Open;


  if dlg.quControlPayBan.RecordCount > 0 then Is_ControlPostBanPay := false else Is_ControlPostBanPay := true;

  if (Dlg.quPostBanPostBan.Value = 1) and ((StrToInt(CBReason.KeyFieldValue) = 7) or (StrToInt(CBReason.KeyFieldValue) = 11) or (StrToInt(CBReason.KeyFieldValue) = 13)) then
  begin
    DescriptionBan := 'Для этой фирмы запрещено делать возврат товара' +#13#10+ Dlg.quPostBanDescription.Value;
    if Is_PostBan = false then ShowMessage(DescriptionBan);
    Is_PostBan := true;
    Saved := false;
  end;

//  if ((Dlg.quSummaDolgaSUMMA_ECO.Value > Dlg.quPostBanPayPayBan.Value) and (Dlg.quPostBanPayPayBan.Value <>0)) then
  if ((Dlg.quSummaDolgaSUMMA_ECO.Value > Dlg.quPostBanPayPayBan.Value) and (Dlg.quPostBanPayPayBan.Value <>0)
                                                                       and (Is_ControlPostBanPay = True)) then
  begin
    DescriptionBanPay := 'Превышен лимит ' +#13#10+ 'Сумма долга ' + FloatToStr(Dlg.quSummaDolgaSUMMA_ECO.Value) +#13#10+ 'Допустимый лимит '+ FloatToStr(Dlg.quPostBanPayPayBan.Value);
    if is_postBanPay = false then ShowMessage(DescriptionBanPay);
    Is_PostBanPay := true;
    Saved := false;
  end;

  Dlg.quPostBan.Close;
  Dlg.quPostBanPay.Close;
  Dlg.quSummaDolga.Close;
  dlg.quControlPayBan.Close;

  if ((Is_PostBan = False) and (Is_PostBanPay = False))  then inherited;

  if saved then
  begin
    if CheckBlank(PostNo, StrToInt(CBReason.KeyFieldValue), DateNakl, OtdelNo, SARTICLE_GROUP, ErrMsg) >= 10 then
    begin
      //Не Успешно
      Exception.Create(ErrMsg);
      DataChanged := true;
      Saved := false;
    end
    else
    begin
      //Успешно
      Saved := true;
    end;
  end;
end;

procedure TMlekoBlankParamForm.SetBuh(const Value: Integer);
begin
  FBuh := Value;
  dmDataModule.OpenSQL('select buh_type_name from d_buh_type where buh = :p1_buh', [Value]);
  lblBuh.Caption := dmDataModule.QFO.FieldByName('buh_type_name').AsString;
end;

procedure TMlekoBlankParamForm.SetDelay(const Value: Integer);
begin
  FDelay := Value;
  lblDelay.Caption := IntToStr(Value);
end;

procedure TMlekoBlankParamForm.SetSARTICLE_GROUP(const Value: Int64);
begin
  FSARTICLE_GROUP := Value;
  dmDataModule.OpenSQL('select name from d_set_article_group where id = :p1_id', [Value]);
  EdOutTrade.Text := dmDataModule.QFO.FieldByName('name').AsString;
end;

procedure TMlekoBlankParamForm.SetAddressPostID(const Value: Int64);
begin
  FAddressPostID := Value;
  dmDataModule.OpenSQL('select Address from AddressPost where id = :p1_id', [Value]);
  EdAddress.Caption := dmDataModule.QFO.FieldByName('Address').AsString;
end;

procedure TMlekoBlankParamForm.EdPostSelectOk(Sender: TObject);
begin
  inherited;
  EdOutTrade.Enabled := EdPost.KeyFieldValue <> '';
  PostNo := StrToInt64(EdPost.KeyFieldValue);
end;

procedure TMlekoBlankParamForm.SetPostNo(const Value: Int64);
begin
  if FPostNo <> Value then
  begin
    AddressPostID := 0;
    SARTICLE_GROUP := 0;
    Delay:=0;
    Buh:=0;
    OtdelNo:=0;
    SotrudNo:=0;
    EdAddress.Caption:='';
    edSotrud.Caption:='';    
  end;
  FPostNo := Value;
end;


procedure TMlekoBlankParamForm.EdOutTradeExit(Sender: TObject);
var
  i,j,e,x,z:Integer;
  a,b:string;
begin
  inherited;
     if EdOutTrade.Text <> '' then
      begin
        MlekoBlnkPrivyazka.Privyazka.Memo1.Lines.Clear;
        MlekoBlnkPrivyazka.Privyazka.Label2.Caption:=EdOutTrade.Text;
        a := MlekoBlnkPrivyazka.Privyazka.Label2.Caption;
        MlekoBlnkPrivyazka.Privyazka.MSQuery1.Active:=True;
        MlekoBlnkPrivyazka.Privyazka.MSQuery1.Refresh;
        MlekoBlnkPrivyazka.Privyazka.MSQuery1.Filter:='nabor=' + QuotedStr(a);
        MlekoBlnkPrivyazka.Privyazka.MSQuery1.Filtered:=True;
        MlekoBlnkPrivyazka.Privyazka.MSQuery1.First;
        for x:=0 to MlekoBlnkPrivyazka.Privyazka.MSQuery1.RecordCount -1   do
         begin
           MlekoBlnkPrivyazka.Privyazka.Memo1.Lines.Add(MlekoBlnkPrivyazka.Privyazka.MSQuery1.FieldByName('vidname').AsString);
           MlekoBlnkPrivyazka.Privyazka.MSQuery1.Next;
         end;
      end;
      if EdOutTrade.Text <> '' then
       begin
         MlekoBlkParamPrivyazka.NaborAddTovar.Memo1.Lines.Clear;
         MlekoBlkParamPrivyazka.NaborAddTovar.Label1.Caption:=EdOutTrade.Text;
         a := MlekoBlkParamPrivyazka.NaborAddTovar.Label1.Caption;
         MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.Active:=True;
         MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.Refresh;
         MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.Filter:='nabor=' + QuotedStr(a);
         MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.Filtered:=True;
         MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.First;
         for z:=0 to MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.RecordCount -1 do
          begin
            MlekoBlkParamPrivyazka.NaborAddTovar.Memo1.Lines.Add(MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.FieldByName('vidname').AsString);
            MlekoBlkParamPrivyazka.NaborAddTovar.MSQuery1.Next;
          end;
       end;
      if Meko_Blanc_Price.BLANC_PRICE.Y_N_Label.Caption = 'Y' then begin
                                                                     Button1.Enabled:=True;
                                                                     Meko_Blanc_Price.BLANC_PRICE.NaborLabel.Caption:=EdOutTrade.Text;
                                                                     Meko_Blanc_Price.BLANC_PRICE.Nabor(EdOutTrade.Text,PostNo);                          // процедура из Meko_Blanc_Price (#2)
                                                                     quColNPrice.Filter:= quColNPrice.Filter + Meko_Blanc_Price.BLANC_PRICE.ITOG_PRICE_Memo.Lines.Text;
                                                                     quColNPrice.Filtered:=True;
                                                                     CEColnPrice.Text:='';
                                                                   end
                                                              else begin
                                                                     Meko_Blanc_Price.BLANC_PRICE.Nabor_Vid_Query.Active:=False;
                                                                     quColNPrice.Filtered:=False;
                                                                   end;
end;

procedure TMlekoBlankParamForm.ActionOKExecute(Sender: TObject);
var
  Dlg: TMlekoBlankParamForm;
begin

  Dlg := TMlekoBlankParamForm.Create(Application);
  Dlg.quPostBan.Close;
  Dlg.quPostBan.Params.ParamByName('p_PostNo').Value := PostNo;
  Dlg.quPostBan.Open;
  Is_PostBan := false;
  Is_PostBanPay := false;

  Dlg.quPostBanPay.Close;
  Dlg.quPostBanPay.Params.ParamByName('PostNo').Value := PostNo;
  Dlg.quPostBanPay.Params.ParamByName('set_article_group_id').Value := SARTICLE_GROUP;
  Dlg.quPostBanPay.Params.ParamByName('Buh').Value := Buh;
  Dlg.quPostBanPay.Open;

  dlg.quControlPayBan.Close;
  dlg.quControlPayBan.Params.ParamByName('PostNo').Value := PostNo;
  Dlg.quControlPayBan.Params.ParamByName('set_article_group_id').Value := SARTICLE_GROUP;
  Dlg.quControlPayBan.Params.ParamByName('Buh').Value := Buh;
  Dlg.quControlPayBan.Params.ParamByName('DateNakl').Value := DateNakl;
  Dlg.quControlPayBan.Open;

  Dlg.quSummaDolga.Close;
  dlg.quSummaDolga.Params.ParamByName('PostNo').Value := PostNo;
  Dlg.quSummaDolga.Params.ParamByName('set_article_group_id').Value := SARTICLE_GROUP;
  dlg.quSummaDolga.Params.ParamByName('Buh').Value := Buh;
  Dlg.quSummaDolga.Open;

  if dlg.quControlPayBan.RecordCount > 0 then Is_ControlPostBanPay := false else Is_ControlPostBanPay := true;


  if ((Dlg.quSummaDolgaSUMMA_ECO.Value > Dlg.quPostBanPayPayBan.Value) and (Dlg.quPostBanPayPayBan.Value <>0)
                                                                       and (Is_ControlPostBanPay = True)) then
  begin
    DescriptionBanPay := 'Превышен лимит ' +#13#10+ 'Сумма дебиторской задолженности ' + FloatToStr(Dlg.quSummaDolgaSUMMA_ECO.Value) +#13#10+ 'Допустимый лимит '+ FloatToStr(Dlg.quPostBanPayPayBan.Value);
    if is_postBanPay = false then ShowMessage(DescriptionBanPay);
    Is_postBanPay := true;
    Saved := false;
  end;

  if (Dlg.quPostBanPostBan.Value = 1) and ((StrToInt(CBReason.KeyFieldValue) = 7) or (StrToInt(CBReason.KeyFieldValue) = 11) or (StrToInt(CBReason.KeyFieldValue) = 13)) then
  begin
    DescriptionBan := 'Для этой фирмы запрещено делать возврат товара' +#13#10+ Dlg.quPostBanDescription.Value;
    ShowMessage(DescriptionBan);
    DataChanged := true;
    Saved := false;
    Is_PostBan := true;
  end;

  Dlg.quPostBan.Close;
  Dlg.quPostBanPay.Close;
  Dlg.quSummaDolga.Close;
  dlg.quControlPayBan.Close;

  if ((Is_PostBan = False) and (Is_PostBanPay = False)) then inherited;
  MlekoBlnkPrivyazka.Privyazka.Label1.Caption:='';
end;

procedure TMlekoBlankParamForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
MlekoBlnkPrivyazka.Privyazka.Label1.Caption:='';
end;

procedure TMlekoBlankParamForm.EdPostExit(Sender: TObject);
begin
  inherited;
{
  quColNPrice.Close;
  quColNPrice.ParamByName('POSTNO').Value := PostNo;
  quColNPrice.Open;
}

  Meko_Blanc_Price.BLANC_PRICE.FirmaLabel.Caption:=EdPost.Text;
  Meko_Blanc_Price.BLANC_PRICE.Firma(EdPost.Text);           // процедура из Meko_Blanc_Price (#1)
  Meko_Blanc_Price.BLANC_PRICE.Price_Change(EdPost.Text);// для изменения цен по партнеру в жкрнале заказов

end;


procedure TMlekoBlankParamForm.Button1Click(Sender: TObject);
begin
    inherited;
  Meko_Blanc_Price.BLANC_PRICE.Nabor_Vid_Query.Active:=True;
     Meko_Blanc_Price.BLANC_PRICE.PriceQuery.Open;
       Meko_Blanc_Price.BLANC_PRICE.ShowModal;

    end;

procedure TMlekoBlankParamForm.FormCreate(Sender: TObject);
begin
  inherited;
 CEColnPrice.Text:='';
 Button1.Enabled:=False;
 Is_PostBan := false;
 Is_PostBanPay := false;
// DBLookupComboboxEhTypeReturn.Enabled := False;
 end;


procedure TMlekoBlankParamForm.CEColnPriceChange(Sender: TObject);
var e:Integer;
begin
  inherited;
   if Meko_Blanc_Price.BLANC_PRICE.Y_N_Label.Caption = 'Y' then
      Meko_Blanc_Price.BLANC_PRICE.Vidname_Price_ITOG(Meko_Blanc_Price.BLANC_PRICE.FirmaLabel.Caption, CEColnPrice.Text)   // процедура из Meko_Blanc_Price (#3-последняя)
                                                           else quColNPrice.Filtered:=False;
end;

procedure TMlekoBlankParamForm.CEColnPriceExit(Sender: TObject);
begin
  inherited;
  ButtonOK.SetFocus;   //Для операторов(быстрая работа с клавиатуры)
end;

procedure TMlekoBlankParamForm.EdDateNaklEnter(Sender: TObject);
begin
  inherited;
  if Button1.Enabled then
  begin
    Button1.Click;        // Для отображения цен справочника
    CEColnPrice.SetFocus;
  end;
end;



procedure TMlekoBlankParamForm.CBReasonExit(Sender: TObject);
begin
  inherited;
  if (CBReason.KeyFieldValue = '7') or (CBReason.KeyFieldValue = '11') or (CBReason.KeyFieldValue = '13') then begin
                                                                                                                 DBLookupComboboxEhTypeReturn.Enabled := True;
                                                                                                                 quTypeReturn.Refresh;
                                                                                                                 ActiveControl := DBLookupComboboxEhTypeReturn;
                                                                                                               end
                                                                                                          else begin
                                                                                                                 DBLookupComboboxEhTypeReturn.Text := '';
                                                                                                                 DBLookupComboboxEhTypeReturn.Enabled := False;
                                                                                                               end;
end;

procedure TMlekoBlankParamForm.DBLookupComboboxEhTypeReturnExit(
  Sender: TObject);
begin
  inherited;
  if (((CBReason.KeyFieldValue = '7')  or (CBReason.KeyFieldValue = '11') or (CBReason.KeyFieldValue = '13'))
   and (DBLookupComboboxEhTypeReturn.Text = '')) then begin
                                                        ShowMessage('Не заполнено обязательное поле ''Тип возврата''!');
                                                        ActiveControl := DBLookupComboboxEhTypeReturn;
                                                      end;
//                                                 else DBLookupComboboxEhTypeReturn.Enabled := False;
end;

procedure TMlekoBlankParamForm.CBReasonChange(Sender: TObject);
begin
  inherited;
  if (CBReason.KeyFieldValue = '7') or (CBReason.KeyFieldValue = '11') or (CBReason.KeyFieldValue = '13') then begin
                                                                                                                 DBLookupComboboxEhTypeReturn.Enabled := True;
                                                                                                                 quTypeReturn.Refresh;
                                                                                                                 ActiveControl := DBLookupComboboxEhTypeReturn;
                                                                                                               end
                                                                                                          else begin
                                                                                                                 DBLookupComboboxEhTypeReturn.Text := '';
                                                                                                                 DBLookupComboboxEhTypeReturn.Enabled := False;
                                                                                                               end;
end;

function TMlekoBlankParamForm.CBReasonIsSelect(Sender: TObject): Boolean;
begin
  inherited;
  if (CBReason.KeyFieldValue = '7') or (CBReason.KeyFieldValue = '11') or (CBReason.KeyFieldValue = '13') then begin
                                                                                                                 DBLookupComboboxEhTypeReturn.Enabled := True;
                                                                                                                 quTypeReturn.Refresh;
                                                                                                                 ActiveControl := DBLookupComboboxEhTypeReturn;
                                                                                                               end
                                                                                                          else begin
                                                                                                                 DBLookupComboboxEhTypeReturn.Text := '';
                                                                                                                 DBLookupComboboxEhTypeReturn.Enabled := False;
                                                                                                               end;
end;

procedure TMlekoBlankParamForm.CBReasonSelectOk(Sender: TObject);
begin
  inherited;
  if (CBReason.KeyFieldValue = '7') or (CBReason.KeyFieldValue = '11') or (CBReason.KeyFieldValue = '13') then begin
                                                                                                                 DBLookupComboboxEhTypeReturn.Enabled := True;
                                                                                                                 quTypeReturn.Refresh;
                                                                                                                 ActiveControl := DBLookupComboboxEhTypeReturn;
                                                                                                               end
                                                                                                          else begin
                                                                                                                 DBLookupComboboxEhTypeReturn.Text := '';
                                                                                                                 DBLookupComboboxEhTypeReturn.KeyValue := '';
                                                                                                                 DBLookupComboboxEhTypeReturn.Enabled := False;
                                                                                                               end;
  if (CBReason.KeyFieldValue = '10') or (CBReason.KeyFieldValue = '11')
   then begin
          EdDescriptionOrderVeb.Visible := true;
          Label4.Visible := true;
        end
   else begin
          EdDescriptionOrderVeb.Visible := false;
          Label4.Visible := false;
        end;   
end;

procedure TMlekoBlankParamForm.EdPostChange(Sender: TObject);
begin
  inherited;
  Meko_Blanc_Price.BLANC_PRICE.FirmaLabel.Caption:=EdPost.Text;
  Meko_Blanc_Price.BLANC_PRICE.Firma(EdPost.Text);           // процедура из Meko_Blanc_Price (#1)
  Meko_Blanc_Price.BLANC_PRICE.Price_Change(EdPost.Text);
end;





end.
