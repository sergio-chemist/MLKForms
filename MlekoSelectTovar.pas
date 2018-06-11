unit MlekoSelectTovar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, DB, DBAccess, MsAccess, ActnList,
  StdCtrls,
  ComCtrls, ToolWin, Grids, DBGrids,
  PropFilerEh, MemDS, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, MLKSQLBuilder,
  System.Actions, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, UMlkFilterPanel;

type
  TMlekoSelectTovarDlg = class(TCFLMLKSelectDlg)
    procedure QueryBeforeOpen(DataSet: TDataSet);
    procedure ActionItemDelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    class function SelectTovar(var aFirmId:integer):boolean;
  end;

var
  MlekoSelectTovarDlg: TMlekoSelectTovarDlg;

implementation

//uses MlekoBlkParamPrivyazka, Meko_Blanc_Price;

{$R *.dfm}

class function TMlekoSelectTovarDlg.SelectTovar(var aFirmId:integer):boolean;
Var lv_firmId: String;
begin
  inherited;
  if OpenSelect(aFirmId,true) then begin
      result:=true;
   end else result:=false;
end;

procedure TMlekoSelectTovarDlg.QueryBeforeOpen(DataSet: TDataSet);
begin
  inherited;
//   if   Meko_Blanc_Price.BLANC_PRICE.Y_N_Label.Caption = 'Y' then
//         begin
//           Query.Filter:=Query.Filter + Meko_Blanc_Price.BLANC_PRICE.ITOG_VIDNAME_Memo.Lines.Text;
//           Query.Filtered:=True;
//         end
//         else  if MlekoBlkParamPrivyazka.NaborAddTovar.Label1.Caption <> '' then
//                  begin
//                    Query.Filter:=Query.Filter + MlekoBlkParamPrivyazka.NaborAddTovar.Memo1.Lines.Text;
//                    Query.Filtered:=True;
//                  end
//               else Query.Filtered:=False;
 end;


procedure TMlekoSelectTovarDlg.ActionItemDelExecute(Sender: TObject);
begin
  ShowMessage('Удаление товара запрещено!');
end;

initialization
 RegisterClass(TMlekoSelectTovarDlg);

finalization
 UnRegisterClass(TMlekoSelectTovarDlg);


end.
