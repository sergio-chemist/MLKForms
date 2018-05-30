// Updated: 2018-05-18 10:41:51
unit MlekoDbDsMSSQL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ExtCtrls, DBAccess,
  ActnList, //CitDbComboEdit,
  ADODB,
  MsAccess, BCDbDsMSSQL, MemDS
  ;

type
  TMlekoDbDsMSSQLDm = class(TBCDbDsMSSQLDm)
    quDSPEC: TMSQuery;
    QuLAGGroup: TMSQuery;
    QuPostArtGroupPriceType: TMSQuery;
    QuVidTovGroup: TMSQuery;
    QuBuh: TMSQuery;
    dsBuh: TDataSource;
    dsVidTovGroup: TDataSource;
    QuPostArtGroupDelayPay: TMSQuery;
    QuVidTov: TMSQuery;
    dsVidTov: TDataSource;
    QuArticleGroup: TMSQuery;
    dsArticleGroup: TDataSource;                                
    QuArticleGroupForSelect: TMSQuery;
    QuSetArticleGroup: TMSQuery;
    dsSetArticleGroup: TDataSource;
    QuLSetArticleGroup: TMSQuery;
    dsArticleGroupForSelect: TDataSource;
    QuPriceType: TMSQuery;
    dsPriceType: TDataSource;
    dsPost: TDataSource;
    quPost: TMSQuery;
    QuTrash: TMSQuery;
    dsTrash: TDataSource;
    quTovar: TMSQuery;
    dsTovar: TDataSource;
    quTipTovara: TMSQuery;
    dsTipTovara: TDataSource;
    dsCompany: TDataSource;
    quCompany: TMSQuery;
    QuVidOtdel: TMSQuery;
    DsVidOtdel: TDataSource;
    QuTara: TMSQuery;
    DsTara: TDataSource;
    QuLAGArticle: TMSQuery;
    QuPostArtGroupDelayPayid: TLargeintField;
    QuPostArtGroupDelayPaySET_ARTICLE_GROUP_ID: TLargeintField;
    QuPostArtGroupDelayPayset_article_group_Name: TStringField;
    QuPostArtGroupDelayPayPostNo: TLargeintField;
    QuPostArtGroupDelayPayDay_delay: TIntegerField;
    QuPostArtGroupDelayPayDay_delay_ext: TIntegerField;
    QuPostArtGroupDelayPaybuh: TLargeintField;
    QuPostArtGroupDelayPaybuh_name: TStringField;
    QuPostArtGroupDelayPayPayBan: TIntegerField;
    quPostPostNo: TSmallintField;
    quPostName: TStringField;
    quPostNameLong: TStringField;
    quPostSotrudNo: TSmallintField;
    quPostNoSvidNDS: TStringField;
    quPostCodeNDS: TStringField;
    quPostTown: TStringField;
    quPostAddress: TStringField;
    quPostPhone: TStringField;
    quPostRS: TStringField;
    quPostMFO: TStringField;
    quPostNameBank: TStringField;
    quPostAddressBank: TStringField;
    quPostOKPO: TStringField;
    quPostDogovorNo: TStringField;
    quPostDateDogovor: TDateTimeField;
    quPostPrintPost: TBooleanField;
    quPostNotPlatNDS: TBooleanField;
    quPostContact: TStringField;
    quPostRegionNo: TWordField;
    quPostCategorName: TStringField;
    quPostAddressFact: TStringField;
    quPostMarschrutNo: TSmallintField;
    quPostAddressNo: TSmallintField;
    quPostDayDelay: TSmallintField;
    quPostAccountCash: TBooleanField;
    quPostExport1C: TBooleanField;
    quPostChange1C: TBooleanField;
    quPostCod1C: TStringField;
    quPostID1C: TStringField;
    quPostIDBank1C: TStringField;
    quPostPrint3: TBooleanField;
    quPostVisible: TBooleanField;
    quPostVIP: TBooleanField;
    quPostCreateDate: TDateTimeField;
    quPosttrash: TSmallintField;
    quPostpkey: TLargeintField;
    quPostAccept: TStringField;
    quPostPriceChange: TStringField;
    quPostTTN: TBooleanField;
    quPostTTN_USE_Name: TBooleanField;
    quPostTTN_Name: TStringField;
    quPostTrashName: TStringField;
    quPostExpire_Date: TDateTimeField;
    dsUsers: TMSDataSource;
    quUsers: TMSQuery;
    quUsersUserNo: TIntegerField;
    quUsersUserName: TStringField;
    quUsersCodeAccess: TSmallintField;
    quUsersPassword: TStringField;
    quUsersEditPost: TBooleanField;
    quUsersFormWight: TIntegerField;
    quUsersFormHeight: TIntegerField;
    quUsersFormLeft: TIntegerField;
    quUsersFormTop: TIntegerField;
    quUsersSkin: TIntegerField;
    quDSPECNaklNo: TIntegerField;
    quDSPECNo_pp: TIntegerField;
    quDSPECorder_num: TSmallintField;
    quDSPECqty: TFloatField;
    quDSPECPRICE_ECO: TFloatField;
    quDSPECPRICE_ECO_IN: TFloatField;
    quDSPECarticle_Name: TStringField;
    quDSPECQTY_PAY: TFloatField;
    quDSPECvid_name: TStringField;
    quDSPECWeight: TFloatField;
    quDSPECdhead_id: TLargeintField;
    quDSPECID: TLargeintField;
    quDSPECvid_Name_1: TStringField;
    quDSPECproducer_name: TStringField;
    quDSPECsumma: TFloatField;
    quDSPECsumma_no_nds: TFloatField;
    quDSPECdhead_id_1: TLargeintField;
    quDSPECDateOfManufacture: TDateTimeField;
    quTovarNameTovar: TStringField;
    quTovarNameTovarShort: TStringField;
    quTovarEdIzm: TStringField;
    quTovarVidNo: TSmallintField;
    quTovarCompany: TStringField;
    quTovarCompanyNo: TSmallintField;
    quTovarSrokReal: TSmallintField;
    quTovarWeight: TFloatField;
    quTovarTipNo: TSmallintField;
    quTovarCodReport: TStringField;
    quTovarExport1C: TBooleanField;
    quTovarChange1C: TBooleanField;
    quTovarCod1C: TStringField;
    quTovarID1C: TStringField;
    quTovarOtdelNo: TSmallintField;
    quTovarTaraNo: TIntegerField;
    quTovarVisible: TBooleanField;
    quTovarweight_packed: TBooleanField;
    quTovarbarCode: TLargeintField;
    quTovaris_weight: TBooleanField;
    quTovarpkey: TLargeintField;
    quTovarIsInternal: TBooleanField;
    quTovarMinCarryover: TFloatField;
    quDSPECCurrency: TStringField;
    quDSPECPaymentPrice: TFloatField;
    quCurrency: TMSQuery;
    quCurrencyID: TIntegerField;
    quCurrencyNAME: TStringField;
    quCurrencyL_CODE: TStringField;
    quCurrencySHORT_NAME: TStringField;
    quCurrencyIsDefault: TBooleanField;
    quCurrencyisTrash: TBooleanField;
    quCurrencyisCrossCurrency: TBooleanField;
    dsCurrency: TMSDataSource;
    QuPostArtGroupDelayPayCurrency: TStringField;
    quTovarUKT_ZED: TStringField;
    quTovarCurrency: TStringField;
    quTovarTovarNo: TLargeintField;
    quDSPECarticle_id: TLargeintField;
    quDSPECHouseID: TSmallintField;
    quDSPECHouseName: TStringField;
    quPostPrint1: TBooleanField;
    quPostPrint_Return_Nakl: TBooleanField;
    quDspecDel: TMSQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    SmallintField1: TSmallintField;
    LargeintField1: TLargeintField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField1: TStringField;
    FloatField4: TFloatField;
    StringField2: TStringField;
    FloatField5: TFloatField;
    LargeintField2: TLargeintField;
    LargeintField3: TLargeintField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    LargeintField4: TLargeintField;
    DateTimeField1: TDateTimeField;
    StringField5: TStringField;
    FloatField8: TFloatField;
    StringField6: TStringField;
    SmallintField2: TSmallintField;
    quPostCommercialNetworkNo: TIntegerField;
    quPostNameCommercialNetwork: TStringField;
    quTovarDescription: TStringField;
    quDSPECUKT_ZED: TStringField;
    quPostPrintReturnNakl: TBooleanField;
    quPostNotDecryptTovInTTN: TBooleanField;
    quDSPECPRICE_INIT: TFloatField;
    quPostSales: TStringField;
    quTovarKolPerPak: TFloatField;
    quPostNoSales: TBooleanField;
    quPostTovLoss: TBooleanField;
    procedure quDSPECAfterPost(DataSet: TDataSet);
    procedure quDSPECBeforeUpdateExecute(Sender: TCustomMSDataSet;
      StatementTypes: TStatementTypes; Params: TMSParams);
    procedure quDSPECAfterUpdateExecute(Sender: TCustomMSDataSet;
      StatementTypes: TStatementTypes; Params: TMSParams);
    procedure DataModuleCreate(Sender: TObject);
    procedure QuVidTovGroupAfterPost(DataSet: TDataSet);
    procedure QuLSetArticleGroupBeforePost(DataSet: TDataSet);
    procedure quPostAfterUpdateExecute(Sender: TCustomMSDataSet;
      StatementTypes: TStatementTypes; Params: TMSParams);
    procedure quPostBeforeUpdateExecute(Sender: TCustomMSDataSet;
      StatementTypes: TStatementTypes; Params: TMSParams);
    procedure quTovarBeforeUpdateExecute(Sender: TCustomMSDataSet;
      StatementTypes: TStatementTypes; Params: TMSParams);
    procedure quTovarAfterUpdateExecute(Sender: TCustomMSDataSet;
      StatementTypes: TStatementTypes; Params: TMSParams);
  private
    procedure OnSetMainDataModule; override;
  public
    procedure DspecRefresh;
  end;


implementation

{$R *.DFM}

procedure TMlekoDbDsMSSQLDm.OnSetMainDataModule;
begin
  MainDmClassName := 'TdmDataModule';
  inherited;
end;



procedure TMlekoDbDsMSSQLDm.DspecRefresh;
var
  l_old_id: Int64;
begin
  l_old_id := quDspec.FieldByName('id').Value;
  quDspec.Close;
  quDspec.Open;
  if not quDspec.Locate('ID', l_old_id, []) then quDspec.Last;
end;

procedure TMlekoDbDsMSSQLDm.quDSPECAfterPost(DataSet: TDataSet);
begin
  inherited;
  DspecRefresh;
end;

procedure TMlekoDbDsMSSQLDm.quDSPECBeforeUpdateExecute(
  Sender: TCustomMSDataSet; StatementTypes: TStatementTypes;
  Params: TMSParams);
begin
  inherited;
  if stInsert in StatementTypes then
  begin
    Params.ParamByName('ID').ParamType := ptOutput;
  end;
end;

procedure TMlekoDbDsMSSQLDm.quDSPECAfterUpdateExecute(
  Sender: TCustomMSDataSet; StatementTypes: TStatementTypes;
  Params: TMSParams);
begin
  inherited;
  if stInsert in StatementTypes then
  begin
//    Sender.FieldByName('ID').Value := Params.ParamByName('ID').Value;
    quDSPECId.Value := Params.ParamByName('ID').Value;
  end;
end;

procedure TMlekoDbDsMSSQLDm.DataModuleCreate(Sender: TObject);
begin
  inherited;
  QuBuh.Open;
end;

procedure TMlekoDbDsMSSQLDm.QuVidTovGroupAfterPost(DataSet: TDataSet);
begin
  inherited;
  QuVidTovGroup.Refresh;
end;

procedure TMlekoDbDsMSSQLDm.QuLSetArticleGroupBeforePost(
  DataSet: TDataSet);
begin
  inherited;
//  TMSQuery(DataSet).FieldByName('SET_ARTICLE_GROUP_ID').Value:= QuSetArticleGroup.
end;

procedure TMlekoDbDsMSSQLDm.quPostAfterUpdateExecute(
  Sender: TCustomMSDataSet; StatementTypes: TStatementTypes;
  Params: TMSParams);
begin
  inherited;
  if stInsert in StatementTypes then
  begin
    Sender.FieldByName('PostNo').Value := Params.ParamByName('PostNo').Value;
  end;
end;

procedure TMlekoDbDsMSSQLDm.quPostBeforeUpdateExecute(
  Sender: TCustomMSDataSet; StatementTypes: TStatementTypes;
  Params: TMSParams);
begin
  inherited;
  if stInsert in StatementTypes then
  begin
    Params.ParamByName('PostNo').ParamType := ptOutput;
  end;
end;

procedure TMlekoDbDsMSSQLDm.quTovarBeforeUpdateExecute(
  Sender: TCustomMSDataSet; StatementTypes: TStatementTypes;
  Params: TMSParams);
begin
  inherited;
  if stInsert in StatementTypes then
  begin
    Params.ParamByName('TovarNo').ParamType := ptOutput;
  end;
end;

procedure TMlekoDbDsMSSQLDm.quTovarAfterUpdateExecute(
  Sender: TCustomMSDataSet; StatementTypes: TStatementTypes;
  Params: TMSParams);
begin
  inherited;
  if stInsert in StatementTypes then
  begin
    Sender.FieldByName('TovarNo').Value := Params.ParamByName('TovarNo').Value;
  end;
end;

initialization
  RegisterClass(TMlekoDbDsMSSQLDm);

finalization
  UnRegisterClass(TMlekoDbDsMSSQLDm);

end.

