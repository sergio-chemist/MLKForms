unit BCMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBCForm, Vcl.ActnList,
  Vcl.ComCtrls, Vcl.AppEvnts, System.Actions;

type
  TCheckActionMethod = function(aAction: TBasicAction; aActionExecRightList: TStringList): boolean of object;

  TBCMainForm = class(TBCForm)
    ApplicationEvents: TApplicationEvents;
    StatusBar: TStatusBar;
    procedure ApplicationEventsHint(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure SaveLogException(E: Exception); virtual;
  public
    FLogError:Boolean;
    CheckActionMethod: TCheckActionMethod;
    procedure ApplyActionMask(const aFormName: string; aActionList: TActionList; aActionPropList: TStringList); virtual;
//    function DataModuleByName(ConnectionName: String): TBCDbDm;
  published
    DmList:TStrings;
  end;

var
  BCMainForm: TBCMainForm;

implementation

{$R *.dfm}

procedure TBCMainForm.ApplicationEventsHint(Sender: TObject);
begin
  inherited;
  StatusBar.Panels[4].Text := Application.Hint;
end;

procedure TBCMainForm.ApplyActionMask(const aFormName: string;
  aActionList: TActionList; aActionPropList: TStringList);
begin

end;

procedure TBCMainForm.FormShow(Sender: TObject);
begin
  inherited;
  OnAction(Sender,nil);
end;

procedure TBCMainForm.SaveLogException(E: Exception);
begin

end;

end.
