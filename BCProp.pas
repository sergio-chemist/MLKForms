unit BCProp;

interface

uses
  UBCForm,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList,DB, cxPC, cxControls, StdCtrls, dxBarBuiltInMenu, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, System.Actions, MLKIntf;

type

  TBCPropDlg = class(TBCForm)
    ButtonOK: TButton;
    ButtonCancel: TButton;
    ButtonApply: TButton;
    PageControl: TCxPageControl;
    tsMainProp: TCxTabSheet;
    ActionOK: TAction;
    ActionCancel: TAction;
    ActionApply: TAction;
    procedure FormCreate(Sender: TObject);
    procedure ActionOKExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActionApplyExecute(Sender: TObject);
  private
    FDataChanged: boolean;
    FSaved: boolean;
    FFirstControl: TWinControl;
  protected
    FOpenPage: integer;
    procedure SetDataChanged(Value: boolean); virtual;
    procedure SetSaved(aSaved: boolean); virtual;
    function DoShowModal: boolean; virtual;
    function OnSelect: Boolean; virtual;
    function OnView: boolean; virtual;
    function OnEdit: boolean; virtual;
  public
    function OnAction(Sender:TObject; DataSet:TDataSet): Boolean; override;  
    property DataChanged: boolean read FDataChanged write SetDataChanged;
    property Saved: boolean read FSaved write SetSaved;
    property FirstControl: TWinControl read FFirstControl write FFirstControl;
  end;

implementation

uses UtilsDataConvert,
     //BCList,
     //BCSelect,
     BCContainer, BCCommon;

{$R *.dfm}

procedure TBCPropDlg.SetDataChanged(Value: boolean);
begin
  FDataChanged := Value;
  ActionApply.Enabled := Value;
  ActionOK.Enabled := Value or Supports(Self, IBCSelectDlg);
end;

procedure TBCPropDlg.SetSaved(aSaved: boolean);
begin
  FSaved := aSaved;
end;

procedure TBCPropDlg.FormCreate(Sender: TObject);
begin
  DataChanged := false;
  Saved := false;
  FOpenPage := 0;
  inherited;
end;

procedure TBCPropDlg.ActionOKExecute(Sender: TObject);
begin
  if Supports(Self, IBCSelectDlg) then
  begin
    ModalResult := mrOk;
    Exit;
  end;
  ActionApply.Execute;
  if Saved then
    ModalResult := mrOk
  else
    ModalResult := mrCancel;
end;

procedure TBCPropDlg.ActionCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TBCPropDlg.FormShow(Sender: TObject);
begin
  PageControl.ActivePageIndex := FOpenPage;
  if Assigned(FirstControl) then
    with FirstControl do
      if CanFocus then SetFocus;
end;

procedure TBCPropDlg.ActionApplyExecute(Sender: TObject);
begin
  inherited;
  //
end;

function TBCPropDlg.OnSelect: Boolean;
begin
//virtual
end;

function TBCPropDlg.OnView: boolean;
begin
  IsReadOnly := True;
  Result := DoShowModal;
end;

function TBCPropDlg.DoShowModal: boolean;
begin
  if NoShowModal then
    Result := True
  else
    Result := (ShowModal = mrOk);
end;

function TBCPropDlg.OnEdit: boolean;
begin
  Result := DoShowModal;
end;

function TBCPropDlg.OnAction(Sender:TObject;DataSet:TDataSet): Boolean;
begin
  result := inherited OnAction(Sender,DataSet);
  if Action = acVIEW then
  begin
    Result := OnView;
  end;

  if Action = acEDIT then
  begin
    Result := OnEdit;
  end;

  if Action = acSELECT then
  begin
    Result := OnSelect;
  end;
end;

end.

