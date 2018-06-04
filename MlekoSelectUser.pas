unit MlekoSelectUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, DBAccess, MsAccess, DB, ActnList,
  ExtCtrls, ComCtrls, MemDS,
  StdCtrls, ToolWin, Grids, DBGrids, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  System.Actions, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, MLKSQLBuilder;

type
  TMlekoSelectUserDlg = class(TCFLMLKSelectDlg)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoSelectUserDlg: TMlekoSelectUserDlg;

implementation

{$R *.dfm}

initialization
 RegisterClass(TMlekoSelectUserDlg);

finalization
 UnRegisterClass(TMlekoSelectUserDlg);

end.
