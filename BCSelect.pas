unit BCSelect;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BCProp, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.ComCtrls;

type
  TBCSelectDlg = class(TBCPropDlg)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BCSelectDlg: TBCSelectDlg;

implementation

{$R *.dfm}

end.
