unit MlekoBlkParamPrivyazka;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, MemDS, DBAccess, MSAccess, Grids, DBGrids;

type
  TNaborAddTovar = class(TForm)
    Label1: TLabel;
    Memo1: TMemo;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    MSQuery1: TMSQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NaborAddTovar: TNaborAddTovar;

implementation

{$R *.dfm}

end.
