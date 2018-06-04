unit MlekoSelectVidTov;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, DBAccess, MsAccess, DB, ActnList,
  ExtCtrls, StdCtrls, ComCtrls,
  ToolWin, Grids, DBGrids, MemDS,
  DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, MLKSQLBuilder, System.Actions, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh;

type
  TMlekoSelectVidTovDlg = class(TCFLMLKSelectDlg)
    lbeVidTov: TLabeledEdit;
  protected
  function GetLikeStr: string; virtual;


  private
    { Private declarations }
  public
    class function SelectVidNo(var aVidNo:integer):boolean;
    { Public declarations }
  end;

var
  MlekoSelectVidTovDlg: TMlekoSelectVidTovDlg;

implementation

uses MlkData;

{$R *.dfm}

function TMlekoSelectVidTovDlg.GetLikeStr: string;
begin
  Result:= lbeVidTov.Text;
  // LikeStr := '%'+LikeStr+'%';
end;

class function TMlekoSelectVidTovDlg.SelectVidNo(var aVidNo:integer):boolean;
Var lv_firmId: String;
begin
  inherited;
  if OpenSelect(aVidNo,true) then begin
      result:=true;
   end else result:=false;
end;

initialization
 RegisterClass(TMlekoSelectVidTovDlg);

finalization
 UnRegisterClass(TMlekoSelectVidTovDlg);

end.
