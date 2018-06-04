unit MlekoSelectOtdel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, DBAccess, MsAccess, DB, ActnList,
  ExtCtrls, ComCtrls,
  MemDS, StdCtrls, ToolWin, Grids, DBGrids, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, MLKSQLBuilder, System.Actions, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh;

type
  TMlekoSelectOtdelDlg = class(TCFLMLKSelectDlg)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoSelectOtdelDlg: TMlekoSelectOtdelDlg;

implementation

{$R *.dfm}

initialization
 RegisterClass(TMlekoSelectOtdelDlg);

finalization
 UnRegisterClass(TMlekoSelectOtdelDlg);

end.
