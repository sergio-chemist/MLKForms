unit MlekoRes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  DB, DDRes, ImgList;

type
  TMlekoResDm = class(TDDResDm)
    procedure RpDbEdActionPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoResDm: TMlekoResDm;

implementation



{$R *.dfm}

procedure TMlekoResDm.RpDbEdActionPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  //BCCommon.ChangePropFieldValue(Sender,'TMlekoSelectActionDlg',TcxDBButtonEdit(Sender).DataBinding.Field);
end;


initialization
  RegisterClass(TMlekoResDm);

finalization
  UnRegisterClass(TMlekoResDm);

end.

