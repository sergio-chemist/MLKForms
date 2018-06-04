unit MlekoSelectTipTovara;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, DBAccess, MsAccess, DB, ActnList,
  ExtCtrls,StdCtrls, ComCtrls,
  ToolWin, Grids, DBGrids, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, MLKSQLBuilder, System.Actions, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh, MemDS;

type
  TMlekoSelectTipTovaraDlg = class(TCFLMLKSelectDlg)
  private
    { Private declarations }
  public
    class function SelectTipNo(var aTipNo:integer):boolean;
    { Public declarations }
  end;

var
  MlekoSelectTipTovaraDlg: TMlekoSelectTipTovaraDlg;

implementation

uses MlkData;

{$R *.dfm}

class function TMlekoSelectTipTovaraDlg.SelectTipNo(var aTipNo:integer):boolean;
Var lv_firmId: String;
begin
  inherited;
  if OpenSelect(aTipNo,true) then begin
      result:=true;
   end else result:=false;
end;

initialization
 RegisterClass(TMlekoSelectTipTovaraDlg);

finalization
 UnRegisterClass(TMlekoSelectTipTovaraDlg);

end.
