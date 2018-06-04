unit MlekoSelectFirm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, DB, DBAccess, MsAccess, ActnList,
  ExtCtrls, StdCtrls,
  ComCtrls, ToolWin, Grids, DBGrids,
  PropFilerEh, MemDS, DBGridEh, Mask, DBCtrlsEh, DBLookupEh, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, MLKSQLBuilder, System.Actions, EhLibVCL, GridsEh, DBAxisGridsEh;

type
  TMlekoSelectFirmDlg = class(TCFLMLKSelectDlg)
    BtNone: TButton;
    ToolButton7: TToolButton;
    pnlCount: TPanel;
    dsOurCommercialNetworkFilter: TMSDataSource;
    quOurCommercialNetworkFilter: TMSQuery;
    procedure QueryBeforeOpen(DataSet: TDataSet);
    procedure QueryAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  protected
    { Private declarations }
  public
    class function SelectFirm(var aFirmId: integer): boolean;
  end;

var
  MlekoSelectFirmDlg: TMlekoSelectFirmDlg;

implementation

uses MlkData;

{$R *.dfm}

class function TMlekoSelectFirmDlg.SelectFirm(var aFirmId: integer): boolean;
var
  lv_firmId: string;
begin
  inherited;
  if OpenSelect(aFirmId, true) then
  begin
    result := true;
  end
  else
    result := false;
end;

procedure TMlekoSelectFirmDlg.QueryBeforeOpen(DataSet: TDataSet);
var
  _dolg_sql, _only_dolg, _only_zatrati, _skip_hidden, _OurCommercialNetwork, _NotSales: string;
begin
  inherited;
  quOurCommercialNetworkFilter.Open;
  _dolg_sql := '';
  _only_dolg := '';
  _only_zatrati := '';
  _skip_hidden := '';
  _NotSales := '';
//  if chkShowDolg.Checked then _dolg_sql := ',(SELECT Sum(freesumma) FROM   v_list_entity v  WHERE  v.postno = a.postno) AS summadolg';
//  if chkOnlyDolg.Checked then _only_dolg := ' and exists (select 1 from NaklR where SummaDolg<>0  and PostNoFirst=a.PostNo union all select 1 from Naklp p where SummaDolg<>0  and p.postNo=a.PostNo) ';
//  if chkOnlyZatrati.Checked then _only_zatrati := ' and (select prop_id from l_firm_prop where PostNo = a.PostNo and prop_id = 11) is not null ';
//  if chkSkipHidden.Checked then _skip_hidden := ' and (ISNULL(a.Visible, 0) = 0) ';
//  if chkNoSales.Checked then _NotSales := ' and isnull((select prop_id from l_firm_prop l where l.PostNo = a.Postno and l.prop_id = 29),0) = 29 ';
//
//  if ((DBLookupComboboxEhOurCommercialNetwork.Text <> '') and (DBLookupComboboxEhOurCommercialNetwork.Text <> 'Все'))
//   then _OurCommercialNetwork := ' and a.CommercialNetworkNo = ' + IntToStr(DBLookupComboboxEhOurCommercialNetwork.KeyValue);

  TMSQuery(DataSet).MacroByName('_dolg_sql').Value:= _dolg_sql;
  TMSQuery(DataSet).MacroByName('_only_dolg').Value:= _only_dolg;
  TMSQuery(DataSet).MacroByName('_only_zatrati').Value:= _only_zatrati;
  TMSQuery(DataSet).MacroByName('_skip_hidden').Value:= _skip_hidden;
  TMSQuery(DataSet).MacroByName('_OurCommercialNetwork').Value:= _OurCommercialNetwork;
  TMSQuery(DataSet).MacroByName('_NotSales').Value:= _NotSales;
end;

procedure TMlekoSelectFirmDlg.QueryAfterOpen(DataSet: TDataSet);
begin
  inherited;
  pnlCount.Caption:= 'Элементов: ' + IntToStr(Query.RecordCount);
end;

procedure TMlekoSelectFirmDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  quOurCommercialNetworkFilter.Close;
end;

initialization
  RegisterClass(TMlekoSelectFirmDlg);

finalization
  UnRegisterClass(TMlekoSelectFirmDlg);

end.

