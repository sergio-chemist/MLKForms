unit BCSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ActnList, BCProp, cxPC, cxControls, StdCtrls, DBAccess, BCFrame,
  dxBarBuiltInMenu, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, System.Actions,
  MLKIntf;

type
  TBCSelectDlg = class(TBCPropDlg, IBCSelectDlg)
  protected
    FieldNameKey: string;
    SelectFrame: TBCFrame;
    function OnSelect: Boolean; override;
    procedure BeforeFrameOpen(Sender: TBCFrame); override;
  private
    FMultiSelect: Boolean;
    FisCloneGridDataSet: Boolean;
    procedure SetMultiSelect(const Value: Boolean);
    procedure SetisCloneGridDataSet(const Value: Boolean);
  public
{    class function OpenSelect(Sender: TObject; DlgClass: string; var ResultDataSet: TDataset;
      MultiSelect: Boolean = false): Boolean; overload; virtual;}
    class function OpenSelect(Sender: TObject; DlgClass: string; var ResultParams: TParams;
      pMultiSelect: Boolean = False; pisCloneGridDataSet: Boolean = False):
      Boolean; virtual;
    property MultiSelect: Boolean read FMultiSelect write SetMultiSelect;
    property isCloneGridDataSet: Boolean read FisCloneGridDataSet write SetisCloneGridDataSet;
    procedure OnSelectOk(DataSet: TDataSet);
  end;

implementation

uses BCCxList, UBCForm, UtilsCommon, BCCommon, ContrUtils, UtilsDataConvert;

{$R *.dfm}

{ TBCSelectDlg }
{
class function TBCSelectDlg.OpenSelect(Sender: TObject; DlgClass: string;
  var ResultDataSet: TDataset; MultiSelect: Boolean): Boolean;
begin
//Under Construct
end;
}

class function TBCSelectDlg.OpenSelect(Sender: TObject; DlgClass: string;
  var ResultParams: TParams; pMultiSelect: Boolean = False; pisCloneGridDataSet: Boolean = False):
  Boolean;
begin
  UtilsCommon.SetParamValue(ResultParams, 'MULTISELECT', pMultiSelect);
  UtilsCommon.SetParamValue(ResultParams, 'ISCLONEGRIDDATASET', pisCloneGridDataSet);
  result := ContrUtils.OpenForm(TObject(Sender), nil, DlgClass, acSELECT, ResultParams);
end;

procedure TBCSelectDlg.SetMultiSelect(const Value: Boolean);
var
  IBCContainer: IBCContainerFrame;
begin
  FMultiSelect := Value;
  if Supports(SelectFrame, IBCContainerFrame, IBCContainer) then
  begin
    IBCContainer.SetMultiSelect(FMultiSelect);
    IBCContainer:= nil;
  end;
end;

procedure TBCSelectDlg.OnSelectOk(DataSet: TDataSet);
begin
  ActionOK.Execute;
end;

procedure TBCSelectDlg.SetisCloneGridDataSet(const Value: Boolean);
var
  IBCContainer: IBCContainerFrame;
begin
  if Supports(SelectFrame, IBCContainerFrame, IBCContainer) then
  begin
    FisCloneGridDataSet := Value;
    IBCContainer.SetIsCloneGridDataSet(FisCloneGridDataSet);
    IBCContainer:= nil;
  end;
end;

function TBCSelectDlg.OnSelect: Boolean;
var
  IBCContainer: IBCContainerFrame;
begin
  Result := inherited OnSelect;
  IsReadOnly := True;
  Result := DoShowModal;
  if Result and Supports(SelectFrame, IBCContainerFrame, IBCContainer) then
  begin
    UtilsDataConvert.DataSetToParams(IBCContainer.GetGridDataSet, Params);
    IBCContainer:= nil;
  end;
end;

procedure TBCSelectDlg.BeforeFrameOpen(Sender: TBCFrame);
var
  IBCContainer: IBCContainerFrame;
begin
  inherited;
  if (Sender.Parent = tsMainProp) and
     Supports(Sender, IBCContainerFrame, IBCContainer) then
  begin
    IBCContainer.SetSelectStyle(Ord(ssSelect));
    IBCContainer.SetDatasetParams(Params);
    IBCContainer.SetSelectOkEvent(Self.OnSelectOk);
    MultiSelect := UtilsCommon.GetParamValue(Params, 'MULTISELECT', varBoolean, False);
    isCloneGridDataSet := UtilsCommon.GetParamValue(Params, 'ISCLONEGRIDDATASET', varBoolean,
      False);
    SelectFrame := Sender;
    IBCContainer:= nil;
  end;
end;

end.

