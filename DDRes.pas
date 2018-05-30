unit DDRes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BCRes, ImgList;

type
  TDDResDm = class(TBCResDm)
    procedure EdBtnContractorPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
  public
  end;

implementation

uses BCDbDs, BCCommon;

{$R *.dfm}

{ TDDResDm }

procedure TDDResDm.EdBtnContractorPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var CustomDM: TBCDbDsDm;
begin
  inherited;
  CustomDM:= BCCommon.GetObjectDataModule(Sender);
  if CustomDM=nil then Exit;
//  UtilsCommon.SetParamValue(CustomDM.Params, 'ENTITY_CODE', 'POST');//Возможно нужно удалить
//  CustomDM.DoBeforeChange(Sender, TcxDBButtonEdit(Sender).DataBinding.Field);
//  if BCCommon.OpenForm(Sender,nil,'TMlekoSelectFirmDlg', acSELECT, CustomDM.Params) then
//    CustomDM.DoAfterChange(Sender, TcxDBButtonEdit(Sender).DataBinding.Field);
end;

end.

