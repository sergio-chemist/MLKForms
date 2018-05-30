unit BCProp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBCForm,
  Vcl.StdCtrls, Vcl.ComCtrls, System.Actions, Vcl.ActnList;

type
  TBCPropDlg = class(TBCForm)
    PageControl: TPageControl;
    ButtonOK: TButton;
    ButtonCancel: TButton;
    ButtonApply: TButton;
    tsMainProp: TTabSheet;
  private
    FDataChanged: boolean;
    FSaved: boolean;
    FFirstControl: TWinControl;
  protected
    FOpenPage: integer;
  public
    { Public declarations }
  end;

var
  BCPropDlg: TBCPropDlg;

implementation

{$R *.dfm}

end.
