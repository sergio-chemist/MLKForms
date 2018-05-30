unit MlekoPropDbBlockApp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CFLMLKPropDb, DB, DBAccess, MSAccess, ActnList, ComCtrls,
  StdCtrls, cxControls, cxContainer, cxEdit, cxImage, MemDS, ToolWin;

type
  TMlekoPropDbBlockAppDlg = class(TCFLMLKPropDbDlg)
    EditPwd: TEdit;
    LabelPwd: TLabel;
    Image: TcxImage;
    Action1: TAction;
    procedure Action1Execute(Sender: TObject);
    procedure ActionApplyExecute(Sender: TObject);
  private
    { Private declarations }
  public
    class function Block: boolean;
  end;

var
  MlekoPropDbBlockAppDlg: TMlekoPropDbBlockAppDlg;

implementation

uses data;

{$R *.dfm}

class function TMlekoPropDbBlockAppDlg.Block: boolean;
var
  Dlg: TMlekoPropDbBlockAppDlg;
begin
  Dlg := TMlekoPropDbBlockAppDlg.Create(Application);
  try
    Result := Dlg.ShowModal = mrOk;
  finally
    Dlg.Free;
  end;
end;

procedure TMlekoPropDbBlockAppDlg.Action1Execute(Sender: TObject);
begin
  inherited;
  ActionApply.Execute;
end;

procedure TMlekoPropDbBlockAppDlg.ActionApplyExecute(Sender: TObject);
var
  l_Password: string;
  result: Boolean;
begin
  inherited;
  l_Password:= EditPwd.Text;
  result := dmDataModule.is_user_exists(l_Password, data.UserNo, data.CodeAccess, data.FormWight, data.FormHeight, data.FormLeft, data.FormTop);
  if not result then
  begin
    ShowMessage('Неверный пароль');
    Saved := False;
    DataChanged := False;
  end
  else
  begin
    DataChanged := true;
    Saved := True;    
  end;
end;

end.

