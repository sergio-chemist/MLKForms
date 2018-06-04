unit MlekoSelectSotrud;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, DB, DBAccess, MsAccess, ActnList,
  ExtCtrls, StdCtrls,
  ComCtrls, ToolWin, Grids, DBGrids,
  PropFilerEh,
  MemDS, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, MLKSQLBuilder, System.Actions,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh;

type
  TMlekoSelectSotrudDlg = class(TCFLMLKSelectDlg)
    DSOtdels: TDataSource;
    quOtdels: TMSQuery;
    quDepts: TMSQuery;
    quDeptsOtdelNo: TSmallintField;
    quDeptsOtdelName: TStringField;
    procedure SQLBuilderGetParams(Sender: TObject; var Params: TParams);
    procedure ftOtdelSelectOk(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    class function SelectSotrud(var aSotrudId:integer; p_otdelNo:integer):boolean;
  end;

var
  MlekoSelectSotrudDlg: TMlekoSelectSotrudDlg;
  ln_otdelNo: integer;

implementation

uses MlkData, DmCommon;

{$R *.dfm}

class function TMlekoSelectSotrudDlg.SelectSotrud(var aSotrudId:integer; p_otdelNo:integer):boolean;
Var lv_SotrudId: String;
begin
  ln_otdelNo:=p_otdelNo;
  inherited;
  if OpenSelect(aSotrudId,true) then begin
      result:=true;
   end else result:=false;
end;

procedure TMlekoSelectSotrudDlg.SQLBuilderGetParams(Sender: TObject;
  var Params: TParams);
begin
  inherited;
    with Params.CreateParam(ftInteger, 'P_OTDELNO', ptInput) do AsInteger := ln_otdelNo;
    with Params.CreateParam(ftInteger, 'P_SHOW_ALL', ptInput) do AsInteger := ln_otdelNo;
end;

procedure TMlekoSelectSotrudDlg.ftOtdelSelectOk(Sender: TObject);
begin
  inherited;
  //IF ftOtdel.Text='' then ln_otdelNo:=-1 else ln_otdelNo:=StrToInt(ftOtdel.KeyFieldValue);
end;

procedure TMlekoSelectSotrudDlg.FormCreate(Sender: TObject);
begin
  inherited;
  ln_otdelNo:=DmCommon.GlobalOtdelNo;
end;

procedure TMlekoSelectSotrudDlg.FormShow(Sender: TObject);
begin
  inherited;
//  ftOtdel.KeyFieldValue:=IntToStr(ln_OtdelNo);
//  ftOtdel.GetLocateKey;
end;

initialization
 RegisterClass(TMlekoSelectSotrudDlg);

finalization
 UnRegisterClass(TMlekoSelectSotrudDlg);

end.
