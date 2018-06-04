unit Meko_Blanc_Price;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, MemDS, DBAccess, MSAccess, Grids, DBGrids, RXDice;

type
  TBLANC_PRICE = class(TForm)
    Memo1: TMemo;
    PriceQuery: TMSQuery;
    FirmaLabel: TLabel;
    NaborLabel: TLabel;
    AcceptQuery: TMSQuery;
    Enter_Price_Query: TMSQuery;
    NV_Memo: TMemo;
    Result_Memo: TMemo;
    ITOG_PRICE_Memo: TMemo;
    ITOG_VIDNAME_Memo: TMemo;
    Nabor_Vid_Query: TMSQuery;
    ITOG_Grid: TDBGrid;
    ITOG_DS: TDataSource;
    ITOG_Query: TMSQuery;
    Y_N_Label: TLabel;
    Enter_Price_Memo: TMemo;
    EnterPriceLabel: TLabel;
    PriceChangeLabel: TLabel;
    Change_Price_Query: TMSQuery;
    procedure Firma(a:string);  // Для работы с ценами справочника (Цена + набор + имя)
    procedure Nabor(b:string;PostNo:integer); // Для работы с ценами справочника (Цена + набор + имя)
    procedure Vidname_Price_ITOG(c:string; x:string); // Для работы с ценами справочника (Цена + набор + имя)
    procedure Price_Change(s:string); // Разрешает редактирование цены в расходной накладной и журнале заказов
    procedure FormShow(Sender: TObject);
    procedure ITOG_GridKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BLANC_PRICE: TBLANC_PRICE;

implementation

uses MlekoBlankParam,MlekoBlankSpec,MlekoBlankList;

{$R *.dfm}

{ TBLANC_PRICE }

procedure TBLANC_PRICE.Vidname_Price_ITOG(c:string; x:string); // Для работы с ценами справочника (Цена + набор + имя)
var
  e:Integer;
begin
 Meko_Blanc_Price.BLANC_PRICE.ITOG_Query.Close;
   Meko_Blanc_Price.BLANC_PRICE.ITOG_Query.SQL.Clear;
     Meko_Blanc_Price.BLANC_PRICE.ITOG_Query.SQL.Add('Select * from V_Nabor_Vid_PRICE_A where Name =' + ''''+c+'''');
       Meko_Blanc_Price.BLANC_PRICE.ITOG_Query.Open;
         Meko_Blanc_Price.BLANC_PRICE.ITOG_Query.Filter:='ARTICLE_GROUP_ID=0' + Meko_Blanc_Price.BLANC_PRICE.Result_Memo.Lines.Text;
         Meko_Blanc_Price.BLANC_PRICE.ITOG_Query.Filtered:=True;
  Meko_Blanc_Price.BLANC_PRICE.ITOG_VIDNAME_Memo.Lines.Clear;
      Meko_Blanc_Price.BLANC_PRICE.ITOG_Query.First;
       for e:=0 to  Meko_Blanc_Price.BLANC_PRICE.ITOG_Query.RecordCount -1   do
     begin
         if Meko_Blanc_Price.BLANC_PRICE.ITOG_Query.FieldByName('ColName').AsString = x then
         Meko_Blanc_Price.BLANC_PRICE.ITOG_VIDNAME_Memo.Lines.Add('or vidname='+'"'+Meko_Blanc_Price.BLANC_PRICE.ITOG_Query.FieldByName('vidname').AsString+'"');
         Meko_Blanc_Price.BLANC_PRICE.ITOG_Query.Next;
      end;
end;

procedure TBLANC_PRICE.Firma(a:string); // Для работы с ценами справочника (Цена + набор + имя)
var
  z:Integer;
begin
     Meko_Blanc_Price.BLANC_PRICE.PriceQuery.Close;
     Meko_Blanc_Price.BLANC_PRICE.PriceQuery.SQL.Clear;
     Meko_Blanc_Price.BLANC_PRICE.PriceQuery.SQL.Add('Select ARTICLE_GROUP_ID,vidname,nabor,ColName,Name'+
     ' from V_Nabor_Vid_PRICE_A where Name =' + '''' + a + '''');
     Meko_Blanc_Price.BLANC_PRICE.PriceQuery.Open;
     Meko_Blanc_Price.BLANC_PRICE.Memo1.Lines.Clear;
     Meko_Blanc_Price.BLANC_PRICE.PriceQuery.First;
    for z:=0 to  Meko_Blanc_Price.BLANC_PRICE.PriceQuery.RecordCount -1   do
    begin
     Meko_Blanc_Price.BLANC_PRICE.Memo1.Lines.Add(Meko_Blanc_Price.BLANC_PRICE.PriceQuery.FieldByName('ARTICLE_GROUP_ID').AsVariant);
     Meko_Blanc_Price.BLANC_PRICE.PriceQuery.Next;
      end;
   end;


procedure TBLANC_PRICE.Nabor(b:string;PostNo:integer);  // Для работы с ценами справочника (Цена + набор + имя)
var
  i,j,e,z:Integer;
  Filter:String;
begin

  Filter := 'nabor=' + QuotedStr(b);
  Meko_Blanc_Price.BLANC_PRICE.Nabor_Vid_Query.Close;
  Meko_Blanc_Price.BLANC_PRICE.Nabor_Vid_Query.ParamByName('PostNo').Value := PostNo;
  Meko_Blanc_Price.BLANC_PRICE.Nabor_Vid_Query.Open;

  Meko_Blanc_Price.BLANC_PRICE.Nabor_Vid_Query.Active:=True;
  Meko_Blanc_Price.BLANC_PRICE.Nabor_Vid_Query.Refresh;
  Meko_Blanc_Price.BLANC_PRICE.Nabor_Vid_Query.Filter:= Filter;
  Meko_Blanc_Price.BLANC_PRICE.Nabor_Vid_Query.Filtered:=True;
  Meko_Blanc_Price.BLANC_PRICE.NV_Memo.Lines.Clear;
  Meko_Blanc_Price.BLANC_PRICE.Nabor_Vid_Query.First;

//  showmessage('Наборы '+inttostr(Meko_Blanc_Price.BLANC_PRICE.Nabor_Vid_Query.RecordCount)+' цены '+inttostr(Meko_Blanc_Price.BLANC_PRICE.Memo1.Lines.Count));

  for z:=0 to  Meko_Blanc_Price.BLANC_PRICE.Nabor_Vid_Query.RecordCount -1   do
   begin
     Meko_Blanc_Price.BLANC_PRICE.NV_Memo.Lines.Add(Meko_Blanc_Price.BLANC_PRICE.Nabor_Vid_Query.FieldByName('ARTICLE_GROUP_ID').AsVariant);
     Meko_Blanc_Price.BLANC_PRICE.Nabor_Vid_Query.Next;
   end;
  Meko_Blanc_Price.BLANC_PRICE.Result_Memo.Lines.Clear;


  
  for i:=0 to Meko_Blanc_Price.BLANC_PRICE.Memo1.Lines.Count -1 do
   begin
     for j:=0 to Meko_Blanc_Price.BLANC_PRICE.NV_Memo.Lines.Count -1 do
      begin
        if Meko_Blanc_Price.BLANC_PRICE.Memo1.Lines.Strings[i] = Meko_Blanc_Price.BLANC_PRICE.NV_Memo.Lines.Strings[j] then
          Meko_Blanc_Price.BLANC_PRICE.Result_Memo.Lines.Add('or ARTICLE_GROUP_ID=' + Meko_Blanc_Price.BLANC_PRICE.Memo1.Lines.Strings[i]);
      end;
   end;
  Meko_Blanc_Price.BLANC_PRICE.ITOG_Query.Close;
  Meko_Blanc_Price.BLANC_PRICE.ITOG_Query.SQL.Clear;
  Meko_Blanc_Price.BLANC_PRICE.ITOG_Query.SQL.Add('Select * from V_Nabor_Vid_PRICE_A where Name =' + ''''+Meko_Blanc_Price.BLANC_PRICE.FirmaLabel.Caption+'''');
  Meko_Blanc_Price.BLANC_PRICE.ITOG_Query.Open;
  Meko_Blanc_Price.BLANC_PRICE.ITOG_Query.Filter:='ARTICLE_GROUP_ID=0' + Meko_Blanc_Price.BLANC_PRICE.Result_Memo.Lines.Text;
  Meko_Blanc_Price.BLANC_PRICE.ITOG_Query.Filtered:=True;
  Meko_Blanc_Price.BLANC_PRICE.ITOG_PRICE_Memo.Lines.Clear;
  Meko_Blanc_Price.BLANC_PRICE.ITOG_Query.First;
  
  for e:=0 to  Meko_Blanc_Price.BLANC_PRICE.ITOG_Query.RecordCount -1   do
   begin
     Meko_Blanc_Price.BLANC_PRICE.ITOG_PRICE_Memo.Lines.Add('or ColName=' + '"' + Meko_Blanc_Price.BLANC_PRICE.ITOG_Query.FieldByName('ColName').AsString + '"');
     Meko_Blanc_Price.BLANC_PRICE.ITOG_Query.Next;
   end;
end;

procedure TBLANC_PRICE.FormShow(Sender: TObject);
begin
ITOG_Grid.SetFocus; // Фокус для закрытия
end;

procedure TBLANC_PRICE.ITOG_GridKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
Close;
end;

procedure TBLANC_PRICE.Price_Change(s: string);
 var
 ch : string;
begin

Change_Price_Query.Close;
Change_Price_Query.SQL.Clear;
Change_Price_Query.SQL.Add('Select cast(Isnull(PriceChange,0) as CHAR(1)) PriceChange from Post where Name ='+''''+s+'''');
Change_Price_Query.Open;
PriceChangeLabel.Caption:=Change_Price_Query.FieldValues['PriceChange'];

end;

end.
