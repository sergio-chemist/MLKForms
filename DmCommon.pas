unit DmCommon;

interface
uses UBCForm;

var
  fmMain: TBCForm;
  Connect1C, EditPostUser, EditPriceInInst: Boolean;
  DeltaPriceInInst: Real;
  onesobj: Olevariant;
  FiscPrinter: Olevariant;
  PKO, RashNaklReturn, PrihNaklReturn, PrihNakl, RashNakl: Olevariant;
  Kontragent, DenSchet, TMC: Olevariant;
  Path1C, User1C, Pass1C, DataBase1C, Server1C: string;
  PrinterOpenCashBox, PrinterCash: Boolean;
  GlobalOtdelNo: Integer;
  GlobalDateNakl: TDate;
  GlobalOurFirmNo: Integer;
  GlobalPathExe: String;
  day_of_week: integer;
  Edit_CrossBlankOrder: Boolean;
  IsSelectItemTTN :Boolean;
  isPrintTTNForNight :Boolean;
  DateOfManufacture: TDate;
  isPrintTTNOne: boolean;

implementation

end.
