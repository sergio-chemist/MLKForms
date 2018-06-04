unit MlekoSelectCurrency;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, DBAccess, MsAccess, DB, ActnList,
  ExtCtrls, StdCtrls, ComCtrls,
  ToolWin, Grids, DBGrids, MemDS, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  MLKSQLBuilder, System.Actions, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh;

type
  TMlekoSelectCurrencyDlg = class(TCFLMLKSelectDlg)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoSelectCurrencyDlg: TMlekoSelectCurrencyDlg;

implementation

{$R *.dfm}

initialization
 RegisterClass(TMlekoSelectCurrencyDlg);

finalization
 UnRegisterClass(TMlekoSelectCurrencyDlg);

end.
