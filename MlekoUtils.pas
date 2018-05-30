unit MlekoUtils;

interface

uses
  Windows, Classes, Variants, TypInfo, SysUtils, Graphics, Controls, StdCtrls,
  ComCtrls, ExtCtrls, Dialogs, ValEdit, DB, Menus,
  Forms, Messages, ZLib, ActnList, Actions, MlkData,
  {$IFNDEF NoCIT}
  CFLMLKCustom, CFLMLKSelect,
  {$ENDIF}
  DBAccess, MSAccess,
  Grids, GridsEh, DBGrids, DBGridEh,
  {$IFNDEF VER150}
  ToolCtrlsEh,
  {$ENDIF}
  {$IFNDEF NoXLS}
  DBGridXLS,
  {$ENDIF}
   StrListA;

const
  idSearchAllPos = 0;
  idSearchFirstPos = 1;
  KeyListDefText = '-1';
  KeyListEmptyText = '-2';
  entMacro = 'M';
  entParam = 'P';
  entField = 'F';

  gf_None = -1;
  gf_Empty = 0;
  gf_Bitmap = 1;
  gf_Icon = 2;
  gf_JPEGImage = 3;
  gf_Default = 4;

  tx_None = -1;
  tx_Empty = 0;
  tx_Plain = 1;
  tx_Rich = 2;
  tx_Default = 3;

  clMax = ZLib.clMax;

  DocStateBitShift = 8;

  idRefreshDocOnStart =      Integer(1) shl 0;
  idRefreshCRCOnStart =      Integer(1) shl 1;
  idEnableColorHighlite =    Integer(1) shl 2;
  idEnableDeleteSignedDocs = Integer(1) shl 3;

const
   SEncashColor = 'EncashColor';
   SErrorColor = 'ErrorColor';
   SPaymentColor = 'PaymentColor';
   SSignColor = 'SignColor';
   SNoSignColor = 'NoSignColor';
   SFormOptions = 'FormOptions';
   SEmptyColor = 'EmptyColor';
   SNotEmptyColor = 'NotEmptyColor';

Type

  TListSortCompareObj = function (Item1, Item2: Pointer): Integer of object;
  TFindCompareObj = function (Index: Integer; PValue: Pointer): Integer of object;
  TSortObjFunc = function(Obj1, Obj2: TObject): Integer;

  TUserPrivelege = (upNone, upAuthor, upSigner, upConductor);
  TUserPriveleges = set of TUserPrivelege;

  TUserActionType = (uatEdit, uatSign, uatControl, uatConduct);

  TExternalEventType = (etUpdate, etClose, etResize, etSave, etLoad, etShow, etOwner, etLink, etInfo, etClone);
  TExternalEventArray = array[TExternalEventType] of TNotifyEvent;

  TSimpleDataType = (sdtInteger, sdtFloat, sdtString);
  TIntBoolFunc = function(Index: Integer): Boolean of object;
  TObjBoolFunc = function(Obj: TObject): Boolean of object;

  TSetPropValueFunc = function (Instance: TObject; PropName: string; Value: Variant): Boolean of object;

  TDynIntegerArray = array of Integer;
  PDynIntegerArray = ^TDynIntegerArray;
  TDynVariantArray = array of Variant;
  TDynStringArray = array of String;

  TCustomControlType = (cctAuto, cctCheckBox, cctLabel, cctEdit);

  TLaunchRec = record
  ID, Code, UserNo, Step, Count: Integer;
  LaunchTime: TDateTime;
  TimeStr: String[32];
  Owner: TThread;
  Form: TForm;
  TimeUnit: Char;
  AsModal: Boolean;
  end;
  PLaunchRec = ^TLaunchRec;

const
  SigVisible = [upSigner, upConductor];

  cmpItemCompare = 0;
  cmpObjAsIntCompare = 32;
  cmpObjAsInt64Compare = 64;
  cmpNameCompareText = 1;
  cmpValueCompareText = 2;
  cmpUserObjCompare = -1;

type

  PIdentMapEntry = ^TIdentMapEntry;

  THackControl = class(TControl);
  THackGrid = class(TCustomGrid);
  THackGridEh = class(TCustomGridEh);
  THackStream = class(TStream);

  TTimeTracer = class
  private
    FTime: Int64;
    pCreationTime, pExitTime, pKernelTime, pUserTime: Int64;
    FProcessHandle: THandle;
    FIsSuccess: Boolean;
    FFreq, FStartCount, FStopCount: int64;
    FLastTime: TDateTime;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Start;
    procedure Stop;
    property IsSuccess: Boolean read FIsSuccess;
    property LastTime: TDateTime read FLastTime;
  end;

function HTMLColorToIdent(Color: Longint; var Ident: string): Boolean;
function IdentToHTMLColor(const Ident: string; var Color: Longint): Boolean;
function HTMLColorsItemPtr(const Index: Integer): PIdentMapEntry;
function GetCustomColorValue(const Section, Ident: string; HTMLColorName: string = 'clWhite'): Integer;
procedure GetDocStateValues();
procedure SwapArgs(var Arg1, Arg2);
procedure IntDecomp(x: Integer; var Sign, AbsVal: Integer);
procedure DivModLong(Dividend: Integer; Divisor: Integer; var Result, Remainder: Integer);
procedure SetBit(Addr: Pointer; Index: Integer; Value: Boolean);
function GetBit(Addr: Pointer; Index: Integer): Boolean;
function WriteStrToStream(S: string; Stream: TStream; ReturnPos: Boolean = False): Integer;
function WriteStrDataToZip( Dest: TDataSet;
                            ActiveName, TimeName, FormName, ScriptName, DataName,
                            FNameValue, SNameValue, DataValue: string;
                            Compressed: Boolean = True): Integer;
function ReadStrDataFromZip( Source: TDataSet; ActiveName, FormName, ScriptName, DataName,
                             FNameValue, SNameValue: string;
                             PSize: PInteger = nil): string;
function FindObjectsOnForm( ClassList, ExcludeList: string; Form: TForm;
                            var Dest: TDynStringArray; ObjNames: TStrings = nil): Integer;
function CanUserDoAction(IdVidDoc, UserNo: Integer; UserActionType: TUserActionType): Boolean;
procedure DefineUserPriveleges(var Priveleges: TUserPriveleges; IdVidDoc, UserNo: Integer);
function DeleteFirstChar(S: string; Ch: Char): string;
function DeleteLastChar(S: string; Ch: Char): string;
function DequoteStr(S: string; Quotes: String): string;
function IsQuotedStr(S: string; Quotes: String): Boolean;
function QuotedStrEx(const S: string; Quotes: String; SkipEmpty: Boolean = True): string;
function EncloseInBrackets(S: string; Brackets: string = '[]'; Delims: string = ', '): string;
function LevensteinSimilarity(s, t: String): Double;
function SplitCaseChange(const S: string; const Ch: Char = #32): string;
function SplitStrWithCharSafe(S: string;
  P1, P2: PString;
  Ch: Char = '=';
  TrimStr: Boolean = false;
  NoDelimIndex: Integer = 0;
  ReversePos: Boolean = False): Boolean;
function GetDelimSplitStr(S: string; Delim: Char; IsFirst: Boolean = True; TrimStr: Boolean = True): string;
function SplitStrFast(S: string; var Value: String; Delim: Char = '='): string; overload;
function SplitStrFast(S: string; PValue: PString; ValueAsResult: Boolean = False; Delim: Char = '='): string; overload;
procedure AutosizeControl( Control: TControl; Shift: Integer = 0; ACaption: string = '';
                           ControlType: TCustomControlType = cctAuto);
procedure SetAllChecked(CheckObj: TObject; Value: Boolean);
procedure ScanAllChecked(CheckObj: TObject; List: TStrings = nil);
procedure AssignListObjects(Src, Dst: TStrings);
procedure AssignOnlyNames(Src, Dst: TStrings; StartFrom: Integer = 0);
procedure AssignOnlyValues(Src, Dst: TStrings; StartFrom: Integer = 0);
function ActiveItemIndex(Menu: TMenuItem): Integer;
function ActivateAllIMenutems(Menu: TMenuItem): Integer;
function ItemIndexByTag(Menu: TMenuItem; ATag: Integer): Integer;
function ToggleMenuItemOrd(Sender: TObject): Integer;
function ToggleMenuItemIdx(Sender: TObject): Integer;
function ActivateMenuItem(Sender: TObject): Integer;
function ExecuteHotKeyForActionList(ActionList: TActionList; HotKey: TShortCut): Boolean;
procedure ClickOnControl(Control: TControl);
function GetControlText(Control: TControl): string;
function GetNormalDateStr(ADate: TDate): String;
function GetCellRect(Grid: TCustomGrid; Row, Col: Integer): TRect;
function GetOffsetPoint(Owner, Child: TControl): TPoint;
function ExtractParamField(const Fields: string; var Pos: Integer; const Delimiter: Char = ';'): string;
function ExtractParamFields(const Fields: string; Dest: TStrings; const Delimiter: Char = ';'): Integer;
procedure ParseStringItems(Source, Dest: TStrings; ReplaceOption: Integer = 0);
function JoinStringItems(Source1, Source2, Dest: TStrings): Integer;
procedure InsertChildInStringGrid(
          Child: TControl; Parent: TCustomGrid; Row, Col: Integer; AWidth: Integer = 0);
function InsertRowIntoValueListEditor( Editor: TValueListEditor; Key, Value: String;
                                       DefValue: Variant;
                                       ReadOnly: Boolean; EditStyle: Grids.TEditStyle;
                                       RowHeight: Integer = 0;
                                       Delimiter: Char = ';'): Integer;
procedure VerifyEmptySelections(SelectEditor: TValueListEditor; SelectArray: TStringListArray);                                       
function ParseExpandSelectItems( Source: TStrings;
                                 CheckObj: TObject;
                                 SelectEditor: TValueListEditor;
                                 ParamArray, SelectArray: TStringListArray;
                                 OptionList: TStrings;
                                 EntityNames: string = 'COL,ID,TBL,';
                                 Temp: TStrings = nil;
                                 ValueDelim: Char = '|'): Integer;
procedure SetBoolValueInObjects(Items: TStrings; Index: Integer; Value: Integer; StrValue: string = '');
function GetBoolValueInObjects(Items: TStrings; Index: Integer): Boolean;
function SetListValuesFast( List: TStrings; Values: string; Delimiter: Char = ';'): Integer;
procedure ErrorMessageDlg(const Msg: string);
function QueryMessageDlg(const Msg, Caption: String): Boolean;
function GetParamValueDef(Params: TParams; ParamName: String; DefValue: string = ''): String;
function EncodeSecretValue(Value, Secret: Integer): Integer;
function DecodeSecretValue(Code: Integer; var Secret: Integer): Integer;
function Ctrl_Is_Down(): Boolean;
function Shift_Is_Down(): Boolean;
function Alt_Is_Down(): Boolean;
function GetEntityTable(KeyField, TextField: String): String;
{$IFNDEF NoCIT}
function SelectMLKItemsByDialog(MLKForm: TCFLMLKCustomForm; Items: TStrings;
         OwnerName, ParamName, ParamCode: string;
         MultiSelect: BOOL = True; KeyValues: TStrings = nil;
         SQLFilter: string = ''; UpdateEvent: TNotifyEvent = nil): Integer;
function SelectMLKItemsInEditor( OwnerName: string; SelectEditor: TValueListEditor; SelectArray: TStringListArray;
                                 Temp: TStrings = nil; Delim: string = ', '): Integer;

{$ENDIF}
function TestActionFormDlgEx(ActionID: Integer; FormClassName: string = ''; ShowErrorDlg: Boolean = False): Integer;
function GetDelimText( Source: TStrings; Delim: String; Quote: Char = #0;
                       BoolFunc: TIntBoolFunc = nil; MaxCount: Integer = 0): string;
function GetDelimTextOfIntArray( const Source: PIntegerArray;
                                 const Count: Integer; const Delim: String): string; overload;
function GetDelimTextOfIntArray(const Source: TDynIntegerArray; Delim: String): string; overload;
function TrimStrWithDelim(S, Delim: string; CheckDelim: Boolean = False): string;
function BuildIntList(Start, Count: Integer; Increment: Integer = 1; Delimiter: Char = ','): String;
procedure IntArrayToStrings(const Source: TDynIntegerArray; Dest: TStrings); overload;
procedure IntArrayToStrings( const Source: PIntegerArray;
                             const Count: Integer; Dest: TStrings;
                             const DoClear: Boolean); overload;
function IndexOfIntValue(Value: Integer; const Source: array of Integer): Integer;                             
procedure StackToDynArray(const Source: array of Integer; var Dest: TDynIntegerArray);
procedure StringObjectsToDynArray(const Source: TStrings; var Dest: TDynIntegerArray);
procedure AssignIntValuesToStringObjects(const Source: array of Integer; const Dest: TStrings);
procedure StringsToDynArray(const Source: TStrings; var Dest: TDynStringArray; const MaxCount: Integer = 0);
procedure ParseTextToDynArray(const AText: String; var Dest: TDynStringArray; Delimiter: Char = ';');
function GetContainsPosIndex( Source: TStrings; S: string;
                              LookForPos: Integer = idSearchAllPos;
                              MaxCount: Integer = 0;
                              LookForward: Boolean = True;
                              StartIndex: Integer = 0): Integer;
function GetStartPosIndex( Source: TStrings; S: string; MaxCount: Integer = 0;
                           LookForward: Boolean = True; Start: Integer = -1;
                           UseSameText: Boolean = False): Integer;
function GetStartTextIndex( Source: TStrings; S: string): Integer;                           
function GetSameTextIndex( Source: TStrings; S: string): Integer;
function IndexOfValue( const Source: TStrings; const S: string;
                       const StartFrom: Integer = 0;
                       const CaseSensitive: Boolean = True): Integer;
function IndexOfName( const Source: TStrings; const S: string;
                      const StartFrom: Integer = 0;
                      const CaseSensitive: Boolean = False): Integer;
function IndexOfText( const AText: string;
                      const AValues: array of string;
                      const CaseSensitive: Boolean = False): Integer;
function TextAsVarType(const AText: string): Integer;                                           
procedure DeleteItemsInStrings(Strings: TStrings; Start, Qty: Integer);
procedure DeleteItemsInStringsUntilEmpty(Strings: TStrings; Start: Integer);
procedure DequoteStringItems(Items: TStrings; Dequote: Char);
procedure PrepareStrValues(Variables: string; Keys: TStrings; Dequote: Char = '"');
function VerifyIntKeys(Values: string; Keys: TStrings; DefValue: Integer = MaxInt): Integer;
function VerifyDateKeys(Values: string; Keys: TStrings; StartDate: TDate): Integer;
function VerifyTextValues(Variables, Table, KeyField, TextField: string;
         List, Keys: TStrings; SQL: string = '';
         AsInteger: Boolean = False; MaxLength: Integer = 20;
         InitValue: Integer = -1;
         UseKeyValues: Boolean = True;
         UseKeyField: Boolean = False;
         TextToKeys: Boolean = False): Integer;
function IndexOfColumnByTag(DBGridEh: TDBGridEh; TagValue: Integer): Integer;
function IndexOfColumnByFieldName(DBGridEh: TDBGridEh; const FieldName: string): Integer;
function GetFieldNameByColumn(Column: TCollectionItem): String;
function GetColumnCollection(const Grid: TCustomControl): TCollection;
function FindDBGridColumn(Grid: TCustomControl; const FieldName: string): TCollectionItem;
function GetActualGridWidth(Grid: TCustomControl; BorderWidth: Integer = 2; Margin: Integer = 0): Integer;
function SetActualGridWidth(Grid: TCustomControl; BorderWidth: Integer = 2; Margin: Integer = 0): Integer;
function GetMaxColumnWidth(Grid: TCustomControl; const FieldName: string; UseTitleBar: Boolean = True): Integer;
function SetMaxColumnWidth( Grid: TCustomControl; const FieldName: string;
                            UseTitleBar: Boolean = True; Margin: Integer = 10): Integer;
function FindColumnByFieldName(const Grid: TCustomControl; const FieldName: string): TColumnEh;
function GetCellRectByFieldName( var Rect: TRect; const Grid: TDBGridEh; const FieldName: string;
                                 ColShift: Integer = 1; RowShift: Integer = 0;
                                 PRowHeight: PInteger = nil): Boolean;
procedure SetColumnFooterText(Grid: TDBGridEh; FieldName, AText: String; FooterIndex: Integer = 0);
function MoveColumnInGrid(const Grid: TCustomControl; const Index, Delta: Integer): Integer;
function IsDataSetEmpty(DataSet: TDataSet): Boolean;
function ProcessDataSetField(DataSet: TDataSet; FieldName: string; Option: Integer; List: TStrings): Integer;
function GetSelectedRowsStr(Grid: TCustomControl; const FieldName: string; Delimiter: Char = ','): String;
function SetSelectedRowsStr( Grid: TCustomControl; const FieldName, SelectionStr: string;
                             Delimiter: Char = ','; InverseSelection: Boolean = False): Integer;
procedure ShowColumnByFieldName(const Grid: TCustomControl; const FieldName: string; Visible: Boolean = True);
procedure ShowColumnsByFieldNames(const Grid: TCustomControl; const FieldNames: string; Visible: Boolean);
procedure InvokePopupMenu( Control: TControl; PopupMenu: TPopupMenu;
                           Button: TMouseButton; Shift: TShiftState;
                           X, Y: Integer; UseCtrlKey: Boolean = True);
function FindParamInDataSet(DataSet: TDataSet; ParamName: String): TParam;
function SortMSQueryInEhGrid( var OldCol, OldDir: Integer;
          Col, OrderLine: Integer; Column: TColumnEh; Source: TStrings;
          MSQuery: TMSQuery; MainField: String; OrderFields: String = '';
          DoOpen: Boolean = True; UseOrderBy: Boolean = True): String;
function VarToInt64Def(V: Variant; DefValue: Int64 = 0): Int64;
function VarToIntDef(V: Variant; DefValue: Integer = 0): Integer;
function GetOrderByColumnStr( var OldCol, OldDir: Integer; Column: TColumnEh; OrderFields: String = '';
                              HelpList: TStrings = nil; MainField: String = ''; DoSort: Boolean = False): String;
function SafeFieldValue(DataSet: TDataSet; Name: string; DefValue: Variant): Variant;
procedure AssignDisplayInfo(Source, Dest: TDataSet);
{$IFNDEF NoXLS}
procedure SaveDBGridToXLSFile(DBGridEh: TCustomDBGridEh; const FileName: String; IsSaveAll: Boolean);
function ExportToExcelWithDialog(
         Dlg: TSaveDialog; DBGridEh: TCustomDBGridEh; const FileNamePrefix: String; IsSaveAll: Boolean): Integer;
{$ENDIF}
function DetectDataType(s: string): TVarType;
function DetectDataTypeOfItems(Items: TStrings): TVarType;
function DetectDataTypeVar(s: string; var V: Variant): TVarType;
function IsNan(const Value: Double): Boolean;
function GetNan(): Double;
function GetFieldsAndValues(DataSet: TDataSet; GetNames, GetTitles, GetValues,
    SeparateLists: Boolean; EnableFunc: TObjBoolFunc = nil; Delimiter: string = ';'): string;
procedure CopyStrToClipboard(s: string; MessageFormat: string = ''; MessageOnEmpty: string = '');
function GetStrFromClipboard(): string;
function AddSystemMenuItem(SysMenu: HMenu; CommandID: DWORD; AText: PChar; AddSeparator: Boolean): Boolean;
function SetSystemMenuItemText(SysMenu: HMenu; CommandID: DWORD; AText: PChar): Boolean;
function SetSystemMenuItemState(SysMenu: HMenu; CommandID: DWORD; AState: UINT): Boolean;
function ToggleWinControlVisibility(WinControl: TWinControl; Splitter: TSplitter; State: Integer = -1): Boolean;
function ToggleWinControlLayOut( WinControl, Neighbour: TWinControl; Splitter: TSplitter;
                                 Horiz: Integer = -1; Shift: Integer = 0): Boolean;
function SetStatusPanelText(StatusBar: TStatusBar; Index: Integer; AText: String): Boolean;
function IndexOfPanelUnderMouse(StatusBar: TStatusBar; AX: Integer): Integer;
procedure CopyFieldsAndValues( DataSet: TDataSet;
                               CopyFields, CopyTitles, CopyValues, SeparateLists: Boolean;
                               EnableFunc: TObjBoolFunc = nil; Delimiter: string = ';';
                               MessageFormat: string = ''; MessageOnEmpty: string = '');
procedure CopyColumnPropList( Grid: TCustomControl; FieldNames,
                              PropNames: string; Delim1: string = ';'; Delim2: string = ';';
                              MessageFormat: string = ''; MessageOnEmpty: string = '');                                  
function GetListValues(List: TStrings; Delimiter: string = ';'; DoTrim: Boolean = True): string;
function CopyDataValuesToArray( DataObj: TObject; var Values: TDynVariantArray; Names: string;
                                ResetValues: Boolean = True): Integer;
function BatchCreateParams(Params: TParams; ParamNames: string; FieldTypes: array of TFieldType): Integer;
function SetParamValues(Params: TParams; ParamNames: string; ParamValues: array of Variant): Integer;
function CopyFieldValuesToParams(Source: TDataSet; Dest: TParams; FieldNames: string; SrcNames: string = ''): Integer;
function CopyParamValuesToParams(Source: TParams; Dest: TParams; SrcNames: string; DstNames: string = ''): Integer;
function BatchCopyParamValues(DataObj: TObject; Source: TParams; SrcNames: string; DstNames: string = ''): Integer;
procedure AssignParamValuesToNull(Params: TParams; ParamNames: array of String);
function BatchAssignParamValues(
         DataObj: TObject; FieldNames: string; Values: array of Variant;
         StartLineIndex: Integer = 0; FastReplace: Boolean = False;
         DoOpen: Boolean = False): Integer;
function ReplaceChars(S: string; Chars: string; Replacements: string; Flags: TReplaceFlags; Delimiter: Char = ';'): string; overload;
function ReplaceChars(const S: string; MinChar, MaxChar: Char; NewPattern: string; Flags: TReplaceFlags): string; overload;
function HandleCustomPropList(
         const UserNo: Integer; const OwnerName, ObjName, PropName: String; PropList: TMemoryStream;
         DoRead: Boolean = True): Integer;
function HandleColumnPropListInStream(
         const Grid: TCustomControl; const PropList: TStream; const DoRead: Boolean = True;
         const FieldNames: string = ''; PropNames: string = '';
         const CustomPropValueFunc: TSetPropValueFunc = nil;
         const PropNamesPtr: PString = nil): Integer;         
function HandleColumnPropList(
         const UserNo: Integer; const Grid: TCustomControl; const DoRead: Boolean = True;
         const FieldNames: string = ''; PropNames: string = '';
         const CustomPropValueFunc: TSetPropValueFunc = nil;
         const PropNamesPtr: PString = nil;
         const UseOwnerClassName: Boolean = True): Integer;
function HandleCustomSettingsValue(
         const Section, Ident: string;
         var Value: string; VType: PString = nil;
         DefValue: string = ''; DoRead: Boolean = True): Integer;
function HandleCustomIntValue(const Section, Ident: string; Default: Integer = 0; DoRead: Boolean = True): Integer;
procedure ExecuteCustomSort( Items: TStrings; SortObj: TStringList; SortOrder: Integer;
                             SortDigits: Integer; ObjFunc: TSortObjFunc = nil);
function  PackLinesToStream( Lines: TStrings; Dest: TStream;
                             CompressionLevel: ZLib.TCompressionLevel = ZLib.clMax;
                             TextType: ShortInt = tx_Default): Integer;                             
function  PackLinesToBlob( Lines: TStrings; FBlob: TField;
                           CompressionLevel: ZLib.TCompressionLevel = ZLib.clMax;
                           TextType: ShortInt = tx_Default): Integer;
function PackManyLinesToStream( const Source: array of TStrings; Dest: TStream;
                                 CompressionLevel: ZLib.TCompressionLevel = ZLib.clMax;
                                 TextType: ShortInt = tx_Default;
                                 DoPack: Boolean = True): Integer;
function  PackManyLinesToBlob( const Source: array of TStrings; FBlob: TField;
                               CompressionLevel: ZLib.TCompressionLevel = ZLib.clMax;
                               TextType: ShortInt = tx_Default): Integer;
function LoadManyLinesFromStream( Dest: array of TStrings; Source: TStream;
                                    TextTypeEvent: TNotifyEvent): Integer;
function UnPackManyLinesFromStream( Dest: array of TStrings; Source: TStream;
                                    TextTypeEvent: TNotifyEvent): Integer;                                                                 
function UnPackManyLinesFromBlob( Dest: array of TStrings; FBlob: TField;
                                  TextTypeEvent: TNotifyEvent): Integer;
function GetGraphicType(Graphic: TGraphic): ShortInt;
function GetGraphicTypeStr(GraphicType: ShortInt; DefValue: string = ''): String;
function GetTextTypeStr(TextType: ShortInt; DefValue: string = ''): String;
function  PackGraphicToBlob( Graphic: TGraphic;
                             FBlob: TField; CompressionLevel: ZLib.TCompressionLevel = ZLib.clMax;
                             TargetType: ShortInt = gf_Default): Integer;
function LoadLinesFromStream(Lines: TStrings; Source: TStream; PTextType: PShortInt = nil; Help: TStrings = nil): Integer;
function UnpackLinesFromStream(Lines: TStrings; Source: TStream; PTextType: PShortInt = nil; Help: TStrings = nil): Integer;                           
function UnpackLinesFromBlob(Lines: TStrings; FBlob: TField; PTextType: PShortInt = nil; Help: TStrings = nil): Integer;
function UnpackGraphicFromBlob(Picture: TPicture; FBlob: TField; PGraphicType: PShortInt = nil): Integer;
function SafeAssignEntityValue(DataSet: TDataSet; Name: string; Value: Variant;
    Entity: Char; OpenAfterAssign: Boolean = True): Boolean;
function FindFirstClass(WinControl: TWinControl; ObjClass: TClass; SkipObj: TObject = nil): TControl;
function SaveDataSetValues(DataSet: TDataSet): Boolean;
function EditDataSetValues(DataSet: TDataSet): Boolean;
function GetFieldValueList(DataSet: TDataSet; KeyField, TextField, Delimiter: string): string; overload;
function GetFieldValueList( DataSet: TDataSet; KeyField, TextField, Delimiter: string;
                            List: TStrings; AddObjects: Boolean = True): Integer; overload;
procedure UpdateFieldValue(DataSet: TDataSet; FieldName: string; Value: Variant; FieldFunc: TObjBoolFunc = nil);
function GetDBGridColumnFields(Grid: TObject; OnlyVisible: Boolean = True; Delim: string = ';'): string;
function GetObjPropTypeKind(Instance: TObject; PropName: string): TTypeKind;
function GetObjPropInfo(Instance: TObject; PropName: string): PPropInfo;
function GetObjPropValue(Instance: TObject; PropName: string; Quote: Char = ''''; PreferStrings: Boolean = True): Variant;
function GetColumnPropValueExt(Instance: TObject; PropName: string): Variant;
procedure GetTypeInfoForOrdinal(OrdTypeInfo: Pointer; AStrings: TStrings);
function GetOrdinalNameList(OrdTypeInfo: Pointer; Delimiter: Char = ';'): String;
function GetObjectPropLong(Instance: TObject; PropName: string; GetLastObj: Boolean = False): TObject;
function SetObjPropValue(Instance: TObject; PropName: string; Value: Variant; DetectVarType: Boolean = True): Boolean;
function GetChildPropValue(Comp: TComponent; PropName: string; Quote: Char = #0; PreferStrings: Boolean = True): Variant;
function SetChildPropValue(Comp: TComponent; PropName: string; Value: Variant; DetectVarType: Boolean = True): Boolean;
function SetObjPropValues(Instance: TObject; PropNames: string; Values: TDynStringArray; Delimiter: Char = ';'): Integer;
function ConvertPropValuesOfObject( Instance: TObject; PropValues: string;
                                    var Values: TDynStringArray;
                                    FillValues: Boolean = True;
                                    PropDelim: Char = ';';
                                    EquChar: Char = '='): String;
function GetComponentProperties(Instance: TPersistent; AList: TStrings; ExcludeTypeKinds: array of TTypeKind): Integer;
procedure ExpandComponentProperties(Instance: TPersistent; AList: TStrings; ExpandProps: array of ShortString);
function GetFieldPropList( DataSet: TDataSet; FieldNames, PropNames: string;
                           Delim1: string = ';'; Delim2: string = ','): string;
function GetColumnPropList( Grid: TCustomControl; FieldNames, PropNames: string;
                            Delim1: string = ';'; Delim2: string = ','; UsePropIndexes: Boolean = False): string;
function ParseColumnPropList( Grid: TCustomControl; PropList: String; Delim1: Char = ';'; Delim2: Char = '|';
                              CustomPropValueFunc: TSetPropValueFunc = nil; PropNames: string = ''): Integer;                            
function IndexOfColumnTitleUnderMouse(Grid: TCustomControl; AX, AY: Integer; NeedZeroRow: Boolean = True): Longint;
procedure SetAutoHandMouseCursor(Sender: TObject; X, Y: Integer; NeedHandCursor: array of Integer); overload;
procedure SetAutoHandMouseCursor(Sender: TObject; X, Y: Integer); overload;
function IndexOfColumnClickInTitle(Grid: TCustomControl): Integer;
function IndexOfPanelClickInStatusBar(StatusBar: TStatusBar): Integer;
procedure IntProgressEvent(Sender: TObject; Progress: TProgressBar);
procedure AdjustFormPosition(Owner, Form: TForm; HorizAlign, VertAlign: Integer; HorizPriority: Boolean = False);
procedure DisplayFormInsideWinControl( Form: TForm; ParentControl: TWinControl; ParentForm: TForm;
                                       InsideControl: Boolean = True; DoVisible: Boolean = True);
procedure KeyPressSearchProc(Field: TField; var Key: Char; var SearchString: String);
procedure ApplyPlaceRectToForm( Form: TForm;
                                const PlaceRect: TRect; const OwnerRowHeight: Integer;
                                const Tolerance: Integer = 0);

var
  DocStatesAreReady: Boolean = False;
  idCreated: Integer = 0;
  idNotSigned: Integer = 1;
  idSigned: Integer = 2;
  idControlled: Integer = 3;
  idConducted: Integer = 4;
  idNotConducted: Integer = 5;
  idAutoCreated: Integer = 6;
  idUpdated: Integer = 7;

implementation
uses Types, StrUtils, DateUtils, Math, Clipbrd, CheckLst, UtilsCommon, JPeg
  {$IFNDEF NoRXLib}
  , rxStrHlder
  {$ENDIF}
     ;

type
   TCompareMatrix = array[0..255, 0..255] of Integer;

const
  SQL_Template = 'SELECT %s, %s FROM %s WHERE %s IN (%s)';
  SQL_Like = 'SELECT %s, %s FROM %s WHERE %s LIKE ''%%%s%%''';
  idParamPrefix = 'SET @';
  idParamPostfix = ' = ';

var
  Missing: array[0..1] of Integer = (Integer($FFFFFFFF), Integer($FFFFFFFF));
  FNan: Double absolute Missing;
  DummyEntry: TIdentMapEntry;

var
  SortItemsOrder: Integer;
  SortObjFunc: TSortObjFunc;

constructor TTimeTracer.Create;
begin
  inherited Create;
  FProcessHandle := GetCurrentProcess;
  QueryPerformanceFrequency(FFreq);
  FIsSuccess := FFreq <> 0;
end;

destructor TTimeTracer.Destroy;
begin
  inherited Destroy;
end;

procedure TTimeTracer.Start;
begin
  QueryPerformanceCounter(FStartCount);
end;

procedure TTimeTracer.Stop;
begin
  QueryPerformanceCounter(FStopCount);
  if FIsSuccess then
    FLastTime := (FStopCount - FStartCount) / FFreq
  else
    FLastTime := -1;
end;

procedure GetDocStateValues();
var DS: TDataSet; ID, Code: TField;
begin
  if DocStatesAreReady then Exit;
  dmDataModule.OpenSQL('select ID, Code from DocStateNames order by ID');
  DS:= dmDataModule.qfo;
  ID:= DS.FindField('ID');
  Code:= DS.FindField('Code');
  if (ID<>nil) and (Code<>nil) then
  begin
    DS.First;
    while not DS.Eof do
    begin
      if Code.AsString = 'NEW' then idCreated:= ID.AsInteger else
      if Code.AsString = 'NSI' then idNotSigned:= ID.AsInteger else
      if Code.AsString = 'SGN' then idSigned:= ID.AsInteger else
      if Code.AsString = 'CON' then idControlled:= ID.AsInteger else
      if Code.AsString = 'APP' then idConducted:= ID.AsInteger else
      if Code.AsString = 'NAP' then idNotConducted:= ID.AsInteger else
      if Code.AsString = 'AUT' then idAutoCreated:= ID.AsInteger else
      if Code.AsString = 'UPD' then idUpdated:= ID.AsInteger;
      DS.Next;
    end;
    DocStatesAreReady:= True;
    DS.Close;
  end else
  raise Exception.Create('Не все состояния документа определены');
end;

procedure SwapArgs(var Arg1, Arg2); // Swap 4-byte arguments
begin
//  I := Int1; Int1 := Int2; Int2 := I;
  asm
    MOV     ECX, DWORD PTR [EAX] // Buf:= Int1;
    XCHG    ECX, DWORD PTR [EDX] // Buf<->Int2;
    MOV     DWORD PTR [EAX], ECX // Int1:= Buf;
  end;
end;

procedure IntDecomp(x: Integer; var Sign, AbsVal: Integer);
asm
//  AbsVal:= Abs(x); Sign:= IntSign(x);
  push    EBX
  test    EAX, EAX
  setg    BL           // AL=(x>0) - x Greater then zero
  sets    BH           // DL=(x<0) - x has Sign
  sub     BL, BH
  movsx   EBX, BL
  mov     [EDX], EBX

  cdq     // if x>=0 then EDX=0 else EDX=-1
	xor     EAX, EDX
	sub     EAX, EDX
  mov     [ECX], EAX

  pop     EBX
end;

procedure DivModLong(Dividend: Integer; Divisor: Integer; var Result, Remainder: Integer);
asm
        PUSH    EBX
        MOV     EBX,EDX
        XOR     EDX, EDX
        IDIV    EBX
        MOV     EBX,Remainder
        MOV     [ECX],EAX
        MOV     [EBX],EDX
        POP     EBX
end;

procedure SetBit(Addr: Pointer; Index: Integer; Value: Boolean);
asm
        OR      Value, Value
        JZ      @Zero
        BTS     [EAX], Index
        RET
@Zero:  BTR     [EAX], Index
        RET
end;

function GetBit(Addr: Pointer; Index: Integer): Boolean;
asm
        BT      [EAX], Index
        SBB     EAX, EAX
        AND     EAX, 1
end;

function EncodeSecretValue(Value, Secret: Integer): Integer;
asm
        test    EAX, EAX  // if (Code<0) then
        js      @Quit       // go to @Quit
        mov     AH, DL   // Result:= Secret * 256 + Value;

@Quit:
end;

function DecodeSecretValue(Code: Integer; var Secret: Integer): Integer;
asm
        mov     DWORD PTR[EDX], 0         // Secret = 0
        test    EAX, EAX                  // if (Code<0) then
        js      @Quit                       // go to @Quit
        movzx   ECX, AH                 // ECX = AH (32 bit <- 8 bit)
        mov     DWORD PTR[EDX], ECX    // Secret:= Code div 256;
        AND     EAX, $FF                // Result = Code mod 256;

@Quit:
end;

function Ctrl_Is_Down(): Boolean;
var
  State: TKeyboardState;
begin
  GetKeyboardState(State);
  Result := ((State[VK_CONTROL] and 128) <> 0);
end;

function Shift_Is_Down(): Boolean;
var
  State: TKeyboardState;
begin
  GetKeyboardState(State);
  Result := ((State[VK_SHIFT] and 128) <> 0);
end;

function Alt_Is_Down(): Boolean;
var
  State: TKeyboardState;
begin
  GetKeyboardState(State);
  Result := ((State[VK_MENU] and 128) <> 0);
end;

const
  HTMLColors: array[0..152] of TIdentMapEntry = (
      (Value: $000000; Name: 'clBlack'),
      (Value: $800000; Name: 'clNavy'),
      (Value: $8B0000; Name: 'clDarkBlue'),
      (Value: $CD0000; Name: 'clMediumBlue'),
      (Value: $FF0000; Name: 'clBlue'),
      (Value: $006400; Name: 'clDarkGreen'),
      (Value: $008000; Name: 'clGreen'),
      (Value: $808000; Name: 'clTeal'),
      (Value: $8B8B00; Name: 'clDarkCyan'),
      (Value: $FFBF00; Name: 'clDeepSkyBlue'),
      (Value: $D1CE00; Name: 'clDarkTurquoise'),
      (Value: $9AFA00; Name: 'clMediumSpringGreen'),
      (Value: $00FF00; Name: 'clLime'),
      (Value: $7FFF00; Name: 'clSpringGreen'),
      (Value: $FFFF00; Name: 'clAqua'),
      (Value: $FFFF00; Name: 'clCyan'),
      (Value: $701919; Name: 'clMidnightBlue'),
      (Value: $FF901E; Name: 'clDodgerBlue'),
      (Value: $AAB220; Name: 'clLightSeaGreen'),
      (Value: $228B22; Name: 'clForestGreen'),
      (Value: $578B2E; Name: 'clSeaGreen'),
      (Value: $4F4F2F; Name: 'clDarkSlateGray'),
      (Value: $4F4F2F; Name: 'clDarkSlateGrey'),
      (Value: $FF9DFF; Name: 'clLightMagenta'),
      (Value: $32CD32; Name: 'clLimeGreen'),
      (Value: $71B33C; Name: 'clMediumSeaGreen'),
      (Value: $D0E040; Name: 'clTurquoise'),
      (Value: $E16941; Name: 'clRoyalBlue'),
      (Value: $B48246; Name: 'clSteelBlue'),
      (Value: $8B3D48; Name: 'clDarkSlateBlue'),
      (Value: $CCD148; Name: 'clMediumTurquoise'),
      (Value: $82004B; Name: 'clIndigo'),
      (Value: $2F6B55; Name: 'clDarkOliveGreen'),
      (Value: $A09E5F; Name: 'clCadetBlue'),
      (Value: $ED9564; Name: 'clCornflowerBlue'),
      (Value: $993366; Name: 'clRebeccaPurple'),
      (Value: $AACD66; Name: 'clMediumAquaMarine'),
      (Value: $696969; Name: 'clDimGray'),
      (Value: $696969; Name: 'clDimGrey'),
      (Value: $CD5A6A; Name: 'clSlateBlue'),
      (Value: $238E6B; Name: 'clOliveDrab'),
      (Value: $908070; Name: 'clSlateGray'),
      (Value: $908070; Name: 'clSlateGrey'),
      (Value: $998877; Name: 'clLightSlateGray'),
      (Value: $998877; Name: 'clLightSlateGrey'),
      (Value: $EE687B; Name: 'clMediumSlateBlue'),
      (Value: $00FC7C; Name: 'clLawnGreen'),
      (Value: $00FF7F; Name: 'clChartreuse'),
      (Value: $D4FF7F; Name: 'clAquamarine'),
      (Value: $000080; Name: 'clMaroon'),
      (Value: $800080; Name: 'clPurple'),
      (Value: $008080; Name: 'clOlive'),
      (Value: $808080; Name: 'clGray'),
      (Value: $808080; Name: 'clGrey'),
      (Value: $EBCE87; Name: 'clSkyBlue'),
      (Value: $FACE87; Name: 'clLightSkyBlue'),
      (Value: $E22B8A; Name: 'clBlueViolet'),
      (Value: $00008B; Name: 'clDarkRed'),
      (Value: $8B008B; Name: 'clDarkMagenta'),
      (Value: $13458B; Name: 'clSaddleBrown'),
      (Value: $8FBC8F; Name: 'clDarkSeaGreen'),
      (Value: $90EE90; Name: 'clLightGreen'),
      (Value: $DB7093; Name: 'clMediumPurple'),
      (Value: $FF8080; Name: 'clBluePurple'),
      (Value: $D30094; Name: 'clDarkViolet'),
      (Value: $98FB98; Name: 'clPaleGreen'),
      (Value: $CC3299; Name: 'clDarkOrchid'),
      (Value: $32CD9A; Name: 'clYellowGreen'),
      (Value: $2D52A0; Name: 'clSienna'),
      (Value: $2A2AA5; Name: 'clBrown'),
      (Value: $A9A9A9; Name: 'clDarkGray'),
      (Value: $A9A9A9; Name: 'clDarkGrey'),
      (Value: $E6D8AD; Name: 'clLightBlue'),
      (Value: $2FFFAD; Name: 'clGreenYellow'),
      (Value: $EEEEAF; Name: 'clPaleTurquoise'),
      (Value: $DEC4B0; Name: 'clLightSteelBlue'),
      (Value: $E6E0B0; Name: 'clPowderBlue'),
      (Value: $E0DFCF; Name: 'clPowderGreen'),
      (Value: $2222B2; Name: 'clFireBrick'),
      (Value: $0B86B8; Name: 'clDarkGoldenRod'),
      (Value: $D355BA; Name: 'clMediumOrchid'),
      (Value: $8F8FBC; Name: 'clRosyBrown'),
      (Value: $6BB7BD; Name: 'clDarkKhaki'),
      (Value: $C0C0C0; Name: 'clSilver'),
      (Value: $8515C7; Name: 'clMediumVioletRed'),
      (Value: $5C5CCD; Name: 'clIndianRed'),
      (Value: $3F85CD; Name: 'clPeru'),
      (Value: $1E69D2; Name: 'clChocolate'),
      (Value: $8CB4D2; Name: 'clTan'),
      (Value: $D3D3D3; Name: 'clLightGray'),
      (Value: $D3D3D3; Name: 'clLightGrey'),
      (Value: $D8BFD8; Name: 'clThistle'),
      (Value: $D670DA; Name: 'clOrchid'),
      (Value: $20A5DA; Name: 'clGoldenRod'),
      (Value: $9370DB; Name: 'clPaleVioletRed'),
      (Value: $3C14DC; Name: 'clCrimson'),
      (Value: $DCDCDC; Name: 'clGainsboro'),
      (Value: $DDA0DD; Name: 'clPlum'),
      (Value: $87B8DE; Name: 'clBurlyWood'),
      (Value: $FFFFE0; Name: 'clLightCyan'),
      (Value: $FAE6E6; Name: 'clLavender'),
      (Value: $7A96E9; Name: 'clDarkSalmon'),
      (Value: $EE82EE; Name: 'clViolet'),
      (Value: $AAE8EE; Name: 'clPaleGoldenRod'),
      (Value: $8080F0; Name: 'clLightCoral'),
      (Value: $8CE6F0; Name: 'clKhaki'),
      (Value: $FFF8F0; Name: 'clAliceBlue'),
      (Value: $F0FFF0; Name: 'clHoneyDew'),
      (Value: $FFFFF0; Name: 'clAzure'),
      (Value: $60A4F4; Name: 'clSandyBrown'),
      (Value: $B3DEF5; Name: 'clWheat'),
      (Value: $DCF5F5; Name: 'clBeige'),
      (Value: $F5F5F5; Name: 'clWhiteSmoke'),
      (Value: $FAFFF5; Name: 'clMintCream'),
      (Value: $FFF8F8; Name: 'clGhostWhite'),
      (Value: $7280FA; Name: 'clSalmon'),
      (Value: $D7EBFA; Name: 'clAntiqueWhite'),
      (Value: $E6F0FA; Name: 'clLinen'),
      (Value: $D2FAFA; Name: 'clLightGoldenRodYellow'),
      (Value: $E6F5FD; Name: 'clOldLace'),
      (Value: $0000FF; Name: 'clRed'),
      (Value: $FF00FF; Name: 'clFuchsia'),
      (Value: $FF00FF; Name: 'clMagenta'),
      (Value: $9314FF; Name: 'clDeepPink'),
      (Value: $FF9DFF; Name: 'clLightPink'),
      (Value: $0045FF; Name: 'clOrangeRed'),
      (Value: $4763FF; Name: 'clTomato'),
      (Value: $B469FF; Name: 'clHotPink'),
      (Value: $507FFF; Name: 'clCoral'),
      (Value: $008CFF; Name: 'clDarkOrange'),
      (Value: $7AA0FF; Name: 'clLightSalmon'),
      (Value: $00A5FF; Name: 'clOrange'),
      (Value: $C1B6FF; Name: 'clLightPink'),
      (Value: $CBC0FF; Name: 'clPink'),
      (Value: $00D7FF; Name: 'clGold'),
      (Value: $B9DAFF; Name: 'clPeachPuff'),
      (Value: $ADDEFF; Name: 'clNavajoWhite'),
      (Value: $D5FFFF; Name: 'clCreamYellow'),
      (Value: $B5E4FF; Name: 'clMoccasin'),
      (Value: $C4E4FF; Name: 'clBisque'),
      (Value: $E1E4FF; Name: 'clMistyRose'),
      (Value: $CDEBFF; Name: 'clBlanchedAlmond'),
      (Value: $D5EFFF; Name: 'clPapayaWhip'),
      (Value: $F5F0FF; Name: 'clLavenderBlush'),
      (Value: $EEF5FF; Name: 'clSeaShell'),
      (Value: $DCF8FF; Name: 'clCornsilk'),
      (Value: $CDFAFF; Name: 'clLemonChiffon'),
      (Value: $F0FAFF; Name: 'clFloralWhite'),
      (Value: $FAFAFF; Name: 'clSnow'),
      (Value: $00FFFF; Name: 'clYellow'),
      (Value: $E0FFFF; Name: 'clLightYellow'),
      (Value: $F0FFFF; Name: 'clIvory'),
      (Value: $FFFFFF; Name: 'clWhite'));

function HTMLColorToIdent(Color: Longint; var Ident: string): Boolean;
begin
  Result := IntToIdent(Color, Ident, HTMLColors);
end;

function IdentToHTMLColor(const Ident: string; var Color: Longint): Boolean;
begin
  Color := StrToIntDef(Ident, -2);
  Result := (Color<>-2) or IdentToInt(Ident, Color, HTMLColors);
  if not Result then Color:= -1;
end;

function HTMLColorsItemPtr(const Index: Integer): PIdentMapEntry;
begin
  if (Index<0) then
  begin
    DummyEntry.Name:= '';
    DummyEntry.Value:= Length(HTMLColors);
    Result:= @DummyEntry;
  end else
  if (Index<Length(HTMLColors)) then
     Result:= @HTMLColors[Index];
end;

function GetCustomColorValue(const Section, Ident: string; HTMLColorName: string = 'clWhite'): Integer;
var s: string; n: Integer;
begin
  IdentToHTMLColor(HTMLColorName, Result);
  n:= HandleCustomSettingsValue(Section, Ident, s, nil, '', True);
  if (n=0) and (Result>=0) then
  begin
    s:= '$'+IntToHex(Result, 6);
    HandleCustomSettingsValue(Section, Ident, s, nil, '', False);
  end else
  if (n=1) then
    Result:= StrToIntDef(s, Result);
end;

function HandleCustomIntValue(const Section, Ident: string; Default: Integer = 0; DoRead: Boolean = True): Integer;
var s: string; n: Integer;
begin
  s:= IntToStr(Default);
  n:= HandleCustomSettingsValue(Section, Ident, s, nil, '', DoRead);
  if DoRead then
    if (n=0) then
    begin
      Result:= Default;
      s:= IntToStr(Default);
      HandleCustomSettingsValue(Section, Ident, s, nil, '', False);
    end else
    if (n=1) then
      Result:= StrToIntDef(s, Default);
end;

procedure QuickSortObj( SortList: PPointerList; L, R: Integer;
                        SCompare: TListSortCompareObj);
var
  I, J: Integer;
  P, T: Pointer;
begin
if (not Assigned (SortList)) or (not Assigned(SCompare)) then exit;
  repeat
    I := L;
    J := R;
    P := SortList^[(L + R) shr 1];
    repeat
      while TListSortCompareObj(SCompare)(SortList^[I], P) < 0 do Inc(I);
      while TListSortCompareObj(SCompare)(SortList^[J], P) > 0 do Dec(J);
      if I <= J then
      begin
        SwapArgs(SortList^[I], SortList^[J]);
        //T := SortList^[I];
        //SortList^[I] := SortList^[J];
        //SortList^[J] := T;
        Inc(I);
        Dec(J);
      end;
    until I > J;
    if L < J then QuickSortObj(SortList, L, J, SCompare);
    L := I;
  until I >= R;
end; {QuickSortObj}

procedure QuickSortList(IndexList: TList; Compare: TListSortCompareObj);
begin
  if (IndexList <> nil) and (IndexList.Count > 0) then
  {$IFDEF CompilerVersion > 15}
     QuickSortObj(IndexList.List, 0, IndexList.Count - 1, Compare);
  {$ENDIF}
end;

function QuickFind( PValue: Pointer; L, H: Integer;
                    Compare: TFindCompareObj; var Index: Integer): Boolean;
var
  I, C: Integer;
begin
  Result := False;
  if not Assigned(Compare) then exit;
  //L := 0;
  //H := FCount - 1;
  while L <= H do
  begin
    I := (L + H) shr 1;
    C := Compare(I, PValue);
    if C < 0 then L := I + 1 else
    begin
      H := I - 1;
      if C = 0 then
      begin
        Result := True;
        //if Duplicates <> dupAccept then
        L := I;
      end;
    end;
  end;
  Index := L;
end;

function LeadingZero( const what,len : Integer;
                      const AsHex: Boolean = false;
                      const AddDollarSign: Boolean = true) : ShortString;
var
  L: word;
Begin
if AsHex then
   begin
   if AsHex then
      Result:= Format('%x', [what]) else
      Result:= Format('%d', [what]);
   L:= Len-Length(Result);
   if L>0 then
      Result:= StringOfChar('0', L)+Result;
    if AsHex and AddDollarSign then
       Result:= '$' + Result;
   end else
   Result:= FormatFloat(StringOfChar('0', len), what);
End;

function ItemCompareFunc(List: TStringList; Index1, Index2: Integer): Integer;
begin
  Result:= AnsiCompareStr(List[Index1], List[Index2])*SortItemsOrder;
end;

function ObjAsIntCompareFunc(List: TStringList; Index1, Index2: Integer): Integer;
begin
  Result:= (Integer(List.Objects[Index1]) - Integer(List.Objects[Index2]))*SortItemsOrder;
end;

function ObjAsInt64CompareFunc(List: TStringList; Index1, Index2: Integer): Integer;
begin
  Result:= Sign(PInt64(List.Objects[Index1])^ - PInt64(List.Objects[Index2])^)*SortItemsOrder;
end;

function UserObjCompareFunc(List: TStringList; Index1, Index2: Integer): Integer;
begin
  Result:= SortObjFunc(List.Objects[Index1], List.Objects[Index2])*SortItemsOrder;
end;

function ItemValueCompareText(List: TStringList; Index1, Index2: Integer): Integer;
begin
  Result:= AnsiCompareText(List.ValueFromIndex[Index1], List.ValueFromIndex[Index2])*SortItemsOrder;
end;

function ItemNameCompareText(List: TStringList; Index1, Index2: Integer): Integer;
begin
  Result:= AnsiCompareText(List.Names[Index1], List.Names[Index2])*SortItemsOrder;
end;

function ListItemCompareFunc(Item1, Item2: TListItem; lParamSort: Integer): Integer stdcall;
begin
  if lParamSort = 0 then
     Result := lstrcmp(PChar(Item1.Caption), PChar(Item2.Caption)) else
     Result:= Integer(Item1.Data) - Integer(Item2.Data);
  Result:= Result*SortItemsOrder;
end;

procedure ExecuteCustomSort( Items: TStrings; SortObj: TStringList; SortOrder: Integer;
                             SortDigits: Integer; ObjFunc: TSortObjFunc = nil);
var CompareFunc: TStringListSortCompare;
begin
  SortItemsOrder:= SortOrder;
  if (Items<>SortObj) then
  begin
    SortObj.Clear;
    SortObj.Sorted:= False;
    SortObj.Assign(Items);
  end;
  {
    cmpItemCompare = 0;
  cmpObjAsIntCompare = 32;
  cmpObjAsInt64Compare = 64;
  cmpNameCompare = -1;
  cmpValueCompare = -2;
  cmpUserObjCompare = -3;
  }
  case SortDigits of
    cmpItemCompare: CompareFunc:= @ItemCompareFunc;
    cmpObjAsIntCompare: CompareFunc:= @ObjAsIntCompareFunc;
    cmpObjAsInt64Compare: CompareFunc:= @ObjAsInt64CompareFunc;
    cmpNameCompareText: CompareFunc:= @ItemNameCompareText;
    cmpValueCompareText: CompareFunc:= @ItemValueCompareText;
    cmpUserObjCompare: begin
         SortObjFunc:= ObjFunc;
         CompareFunc:= @UserObjCompareFunc;
        end;
  end;
  Items.BeginUpdate;
  SortObj.CustomSort(CompareFunc);
  if (Items<>SortObj) then
     Items.Assign(SortObj);
  Items.EndUpdate;
end;

procedure CompressText( Source: String; Dest: TStream; var CompSize: Integer;
                        DoCompress: Boolean = True);
var ZStream: TCompressionStream; Size, Start, Last: Integer;
begin
//  CompSize:= 0; // CompSize is compression flag
//  Dest.WriteBuffer(CompSize, SizeOf(CompSize));
  CompSize:= Length(Source);
  Dest.WriteBuffer(CompSize, SizeOf(CompSize));
  Start:= Dest.Position;
  Size:= 0;
  Dest.WriteBuffer(Size, SizeOf(Size));
  if not DoCompress then
  begin
    Dest.WriteBuffer(Pointer(Source)^, CompSize);
    CompSize:= 0;
  end
      else
      begin
        ZStream:= TCompressionStream.Create(ZLib.clMax, Dest);
        try
          ZStream.WriteBuffer(Pointer(Source)^, Length(Source));
        finally
          ZStream.Free;
        end;
        Last:= Dest.Position;
        CompSize:= Last - Start - SizeOf(Size);
        Dest.Position:= Start;
        Dest.WriteBuffer(CompSize, SizeOf(CompSize));
        Dest.Position:= Last;
      end;
end;

function UnCompressText(Source: TStream; var CompSize: Integer): String;
var MemStream, TmpStream: TMemoryStream;
    ZStream: TDecompressionStream;
    P, UnCompSize: Integer;
begin
  Result:= ''; CompSize:= 0;
  if (Source=nil) or (Source.Size<SizeOf(CompSize)*2) then Exit;
  Source.Read(UnCompSize, SizeOf(UnCompSize));
  Source.Read(CompSize, SizeOf(CompSize));
  if (CompSize=0) then
  begin
    SetLength(Result, UnCompSize);
    Source.Read(Pointer(Result)^, UnCompSize);
  end else
  begin
    MemStream:= TMemoryStream.Create;
    try
      MemStream.SetSize(CompSize);
      MemStream.Position:= 0;
      Source.Read(MemStream.Memory^, CompSize);
      if (UnCompSize>0) then
      begin
        ZStream:= TDecompressionStream.Create(MemStream);
        try
          ZStream.Seek(0, soFromBeginning);
          SetLength(Result, UnCompSize);
          ZStream.Read(Pointer(Result)^, UnCompSize);
        finally
        ZStream.Free;
        end;
      end;
    finally
    MemStream.Free;
    end;
  end;
end;

function PackStreamToZip( Source: TMemoryStream; FBlob: TField;
                          CompressionLevel: ZLib.TCompressionLevel = ZLib.clMax): Integer;
var Stream: TStream;
    ZStream: TCompressionStream;
    Size: Integer;
begin
  Result:= -1;
  if (FBlob=nil) or (not FBlob.IsBlob) then Exit;
  FBlob.DataSet.Edit;
  Stream := FBlob.DataSet.CreateBlobStream(FBlob, bmWrite);
  try
    Result:= 0;
    Size:= Source.Size;
    if (Size>0) then
    begin
      Stream.WriteBuffer(Size, SizeOf(Size));
      ZStream:= TCompressionStream.Create(CompressionLevel, Stream);
      try
        ZStream.WriteBuffer(Source.Memory^, Size);
        Result:= Stream.Size - SizeOf(Size);
      finally
        ZStream.Free;
      end;
    end;
  finally
    Stream.Free;
    FBlob.DataSet.Post;
  end;
end;

function UnpackStreamFromStream(Source: TStream; Dest: TMemoryStream): Integer;
var MemStream: TMemoryStream;
    ZStream: TDecompressionStream;
    UnCompSize: Integer;
begin
  Result:= -1;
  if Source.Size > SizeOf(Integer)*2 then
  begin
    Result:= 0;
    MemStream:= TMemoryStream.Create;
    try
      Source.Read(UnCompSize, SizeOf(UnCompSize));
      if UnCompSize>0 then
        begin
          Source.Read(Result, SizeOf(Result));
          MemStream.SetSize(Result);
          MemStream.Position:= 0;
          Source.Read(MemStream.Memory^, Result);
          ZStream:= TDecompressionStream.Create(MemStream);
          ZStream.Seek(0, soFromBeginning);
          Dest.SetSize(UnCompSize);
          ZStream.ReadBuffer(Dest.Memory^, UnCompSize);
          Dest.Position:= 0;
          ZStream.Free;
        end;
    finally
      MemStream.Free;
    end;
  end;
end;

function UnpackStreamFromBlob(Dest: TMemoryStream; FBlob: TField): Integer;
var Source: TStream;
    MemStream: TMemoryStream;
    ZStream: TDecompressionStream;
    UnCompSize: Integer;
begin
  Result:= -1;
  if (FBlob=nil) or (not FBlob.IsBlob) or FBlob.IsNull then Exit;
  Source := FBlob.DataSet.CreateBlobStream(FBlob, bmRead);
  try
    if Source.Size > SizeOf(Integer)*2 then
       Result:= UnpackStreamFromStream(Source, Dest);
  finally
  Source.Free;
  end;
end;

function LoadLinesFromStream(Lines: TStrings; Source: TStream; PTextType: PShortInt = nil; Help: TStrings = nil): Integer;
var TextType: ShortInt;
begin
//    Result:= UnpackStreamFromBlob(Source, FBlob);
//    Result:= Max(Result, 0);
//    Source.Position:= 0;
    Source.Read(TextType, SizeOf(TextType));
    if (TextType>=0) and (TextType in [tx_Empty, tx_Plain, tx_Rich]) then
       begin
         case TextType of
           tx_Empty: Lines.Clear;
           tx_Plain: if (Help <> nil) then Help.LoadFromStream(Source);
           tx_Rich: Lines.LoadFromStream(Source);
         end;
       end else
       begin
         Source.Position:= 0;
         Lines.LoadFromStream(Source);
       end;
    Result:= Lines.Count;
    if not (TextType in [tx_Empty, tx_Plain, tx_Rich]) then
       TextType:= tx_Rich;
    if (PTextType <> nil) then PTextType^:= TextType;
end;

function UnpackLinesFromStream(Lines: TStrings; Source: TStream; PTextType: PShortInt = nil; Help: TStrings = nil): Integer;
var MS: TMemoryStream; TextType: ShortInt;
begin
  MS:= TMemoryStream.Create;
  try
    Result:= UnpackStreamFromStream(Source, MS);
    Result:= Max(Result, 0);
    MS.Position:= 0;
    LoadLinesFromStream(Lines, MS, PTextType, Help);
  finally
    MS.Free;
  end;
end;

function UnpackLinesFromBlob(Lines: TStrings; FBlob: TField; PTextType: PShortInt = nil; Help: TStrings = nil): Integer;
var MS: TMemoryStream; TextType: ShortInt;
begin
  MS:= TMemoryStream.Create;
  try
    Result:= UnpackStreamFromBlob(MS, FBlob);
    Result:= Max(Result, 0);
    MS.Position:= 0;
    LoadLinesFromStream(Lines, MS, PTextType, Help);
//    MS.Read(TextType, SizeOf(TextType));
//    if (TextType>=0) and (TextType in [tx_Empty, tx_Plain, tx_Rich]) then
//       begin
//         case TextType of
//           tx_Empty: Lines.Clear;
//           tx_Plain: if (Help <> nil) then Help.LoadFromStream(MS);
//           tx_Rich: Lines.LoadFromStream(MS);
//         end;
//       end else
//       begin
//         MS.Position:= 0;
//         Lines.LoadFromStream(MS);
//       end;
//    if not (TextType in [tx_Empty, tx_Plain, tx_Rich]) then
//       TextType:= tx_Rich;
//    if (PTextType <> nil) then PTextType^:= TextType;
  finally
    MS.Free;
  end;
end;

function UnpackGraphicFromBlob(Picture: TPicture; FBlob: TField; PGraphicType: PShortInt = nil): Integer;
var MS: TMemoryStream; NewGraphic: TGraphic; GraphicType: ShortInt;
begin
  Result:= 0; NewGraphic:= nil;
  MS:= TMemoryStream.Create;
  try
    Result:= UnpackStreamFromBlob(MS, FBlob);
    Result:= Max(Result, 0);
    MS.Position:= 0;
    MS.Read(GraphicType, SizeOf(GraphicType));
    case GraphicType of
      gf_Bitmap: NewGraphic:= TBitmap.Create();
      gf_Icon: NewGraphic:= TIcon.Create();
      gf_JPEGImage: NewGraphic:= TJPEGImage.Create();
    end;
    if (NewGraphic<>nil) or (GraphicType = gf_Empty) then
    begin
      if (NewGraphic<>nil) then
      begin
        NewGraphic.LoadFromStream(MS);
        Picture.Graphic:= NewGraphic;
      end else
      if GraphicType = gf_Empty then
         Picture.Bitmap:= nil;
    end;
    if (PGraphicType <> nil) then PGraphicType^:= GraphicType;
  finally
    MS.Free;
    NewGraphic.Free;
  end;
end;

{
    Ext:= '';
    if Graphic is TBitmap then Ext:= 'bmp' else
    if Graphic is TIcon then Ext:= 'ico';
    if Graphic is TJPEGImage then Ext:= 'jpg';
    MS.Write(Pointer(Ext)^, Length(Ext));
    Graphic.SaveToStream(MS);
    Result:= PackStreamToBlob(MS, FBlob, CompressionLevel);
}

//function UnpackLinesFromZip(Lines: TStrings; FBlob: TField): Integer;
//var MS: TMemoryStream; S: string; Stream: TStream;
//begin
//  MS:= TMemoryStream.Create;
//  try
//    //Result:= UnpackStreamFromZip(MS, FBlob);
//    Stream := FBlob.DataSet.CreateBlobStream(FBlob, bmRead);
//    S:= UnCompressText(Stream, Result);
//    Stream.Free;
//    Lines.Text:= S;
//  finally
//    MS.Free;
//  end;
//end;

//function  PackLinesToZip(Lines: TStrings; FBlob: TField): Integer;
//var MS: TMemoryStream; Stream: TStream;
//begin
//  MS:= TMemoryStream.Create;
//  try
//    //Lines.SaveToStream(MS);
//    //Result:= PackStreamToZip(MS, FBlob);
//    FBlob.DataSet.Edit;
//    Stream := FBlob.DataSet.CreateBlobStream(FBlob, bmWrite);
//    CompressText(Lines.Text, Stream, Result);
//    Stream.Free;
//    FBlob.DataSet.Post;
//  finally
//    MS.Free;
//  end;
//end;

function PackStreamToStream( Source: TMemoryStream; Dest: TStream;
                             CompressionLevel: ZLib.TCompressionLevel = ZLib.clMax): Integer;
var MemStream: TMemoryStream;
    ZStream: TCompressionStream; CompSize: Integer;
begin
  CompSize:= Source.Size;
  Dest.WriteBuffer(CompSize, SizeOf(CompSize));
  if (CompSize = 0) then Exit;
  MemStream:= TMemoryStream.Create;
  ZStream:= TCompressionStream.Create(ZLib.clMax, MemStream);
  ZStream.WriteBuffer(Source.Memory^, Source.Size);
  ZStream.Free;
  Result:= MemStream.Size;
  Dest.WriteBuffer(Result, SizeOf(Result));
  Dest.WriteBuffer(MemStream.Memory^, Result);
  MemStream.Free;
end;

function PackStreamToBlob( Source: TMemoryStream; FBlob: TField;
                           CompressionLevel: ZLib.TCompressionLevel = ZLib.clMax): Integer;
var Dest: TStream;
begin
  Result:= -1;
  if (FBlob=nil) or (not FBlob.IsBlob) then Exit;
  if FBlob.DataSet.State in [dsEdit, dsInsert] then FBlob.DataSet.Post;
  FBlob.DataSet.Edit;
  Dest := FBlob.DataSet.CreateBlobStream(FBlob, bmWrite);
  try
    Result:= PackStreamToStream(Source, Dest, CompressionLevel);
  finally
    Dest.Free;
  end;
  FBlob.DataSet.Post;
end;

function  PackLinesToStream( Lines: TStrings; Dest: TStream;
                             CompressionLevel: ZLib.TCompressionLevel = ZLib.clMax;
                             TextType: ShortInt = tx_Default): Integer;
var MS: TMemoryStream;
begin
  MS:= TMemoryStream.Create;
  try
    if (Lines.Count>0) then
    begin
      MS.Write(TextType, SizeOf(TextType));
      Lines.SaveToStream(MS);
    end;
    Result:= PackStreamToStream(MS, Dest, CompressionLevel);
  finally
    MS.Free;
  end;
end;

function  PackLinesToBlob( Lines: TStrings; FBlob: TField;
                           CompressionLevel: ZLib.TCompressionLevel = ZLib.clMax;
                           TextType: ShortInt = tx_Default): Integer;
var MS: TMemoryStream;
begin
  MS:= TMemoryStream.Create;
  try
    //if (Lines.Count=0) then TextType:= tx_Empty;
      MS.Write(TextType, SizeOf(TextType));
    if (Lines.Count>0) then
      Lines.SaveToStream(MS);
    Result:= PackStreamToBlob(MS, FBlob, CompressionLevel);
  finally
    MS.Free;
  end;
end;

function PackManyLinesToStream( const Source: array of TStrings; Dest: TStream;
                                 CompressionLevel: ZLib.TCompressionLevel = ZLib.clMax;
                                 TextType: ShortInt = tx_Default;
                                 DoPack: Boolean = True): Integer;
var Tmp, MS: TMemoryStream;
    i, n, p: Integer; Lines: TStrings;
begin
  Tmp:= TMemoryStream.Create;
  MS:= TMemoryStream.Create;
  try
    n:= Length(Source); p:= Dest.Position;
    if (n>0) and (TextType in [tx_Plain, tx_Rich]) then
    begin
      MS.Write(TextType, SizeOf(TextType));
      MS.Write(n, SizeOf(n));
      for i := Low(Source) to High(Source) do
      begin
        Lines:= Source[i];
        n:= Lines.Count;
        Tmp.Clear;
        if n > 0 then
        begin
          Lines.SaveToStream(Tmp);
          n:= Tmp.Size;
        end;
        MS.Write(n, SizeOf(n));
        if n > 0 then
           Tmp.SaveToStream(MS);
      end;
    end;
    if DoPack then
       Result:= PackStreamToStream(MS, Dest, CompressionLevel) else
       begin
         Result:= MS.Size;
         MS.SaveToStream(Dest);
       end;
  finally
    MS.Free;
    Tmp.Free;
  end;
end;

function  PackManyLinesToBlob( const Source: array of TStrings; FBlob: TField;
                               CompressionLevel: ZLib.TCompressionLevel = ZLib.clMax;
                               TextType: ShortInt = tx_Default): Integer;
var MS: TMemoryStream;
begin
  MS:= TMemoryStream.Create;
  try
    PackManyLinesToStream(Source, MS, CompressionLevel, TextType, False);
    MS.Position:= 0;
    Result:= PackStreamToBlob(MS, FBlob, CompressionLevel);
  finally
    MS.Free;
  end;
end;

function LoadManyLinesFromStream( Dest: array of TStrings; Source: TStream;
                                    TextTypeEvent: TNotifyEvent): Integer;
var Tmp: TMemoryStream; BadSize: Boolean;
    Lines: TStrings; TextType: ShortInt;
    n, i, k: Integer; p: Int64;
begin
  Tmp:= TMemoryStream.Create;
  try
    Result:= 0;
    if (Source.Size - Source.Position <= 0) then
    begin
      for i := 0 to High(Dest) do
        Dest[i].Clear;
    end else
    begin
      Source.Read(TextType, SizeOf(TextType));
      if not (TextType in [tx_Empty, tx_Plain, tx_Rich]) then
         TextType:= tx_Rich;
      if (TextType>=0) and (TextType in [tx_Plain, tx_Rich]) then
         begin
           Source.Read(n, SizeOf(n));
           n:= Min(n, Length(Dest));
           if Assigned(TextTypeEvent) then
              TextTypeEvent(Pointer(n));
           if Assigned(TextTypeEvent) then
              TextTypeEvent(Pointer(-TextType));
           while Result < n do
           begin
             Lines:= Dest[Result];
             Source.Read(k, SizeOf(k));
             BadSize:= (k<0) or ((k>0) and (Source.Position + k > Source.Size));
             if (k=0) or BadSize then
             begin
               Lines.Clear;
               if BadSize then Break;
             end
                 else
             begin
               Tmp.SetSize(k);
               Source.Read(Tmp.Memory^, k);
               Tmp.Position:= 0;
               Lines.LoadFromStream(Tmp);
             end;
             Inc(Result);
             if (Source.Position >= Source.Size) then Break;
           end;
         end;
    end;
    //if (PTextType <> nil) then PTextType^:= TextType;
  finally
    Tmp.Free;
  end;
end;

function UnPackManyLinesFromStream( Dest: array of TStrings; Source: TStream;
                                    TextTypeEvent: TNotifyEvent): Integer;
var MS: TMemoryStream;
begin
  MS:= TMemoryStream.Create;
  try
    Result:= UnpackStreamFromStream(Source, MS);
    Result:= Max(Result, 0);
    MS.Position:= 0;
    LoadManyLinesFromStream(Dest, MS, TextTypeEvent);
  finally
    MS.Free;
  end;
end;

function UnPackManyLinesFromBlob( Dest: array of TStrings; FBlob: TField;
                                  TextTypeEvent: TNotifyEvent): Integer;
var MS: TMemoryStream;
begin
  MS:= TMemoryStream.Create;
  try
    Result:= UnpackStreamFromBlob(MS, FBlob);
    Result:= Max(Result, 0);
    MS.Position:= 0;
    LoadManyLinesFromStream(Dest, MS, TextTypeEvent);
  finally
    MS.Free;
  end;
end;

function GetGraphicType(Graphic: TGraphic): ShortInt;
begin
  Result:= gf_None;
  if (Graphic=nil) or Graphic.Empty then Result:= gf_Empty else
  if Graphic is TBitmap then Result:= gf_Bitmap else
  if Graphic is TIcon then Result:= gf_Icon else
  if Graphic is TJPEGImage then Result:= gf_JPEGImage;
end;

function GetGraphicTypeStr(GraphicType: ShortInt; DefValue: string = ''): String;
begin
  Result:= DefValue;
  case GraphicType of
    gf_Bitmap: Result:= 'BMP';
    gf_Icon: Result:= 'ICO';
    gf_JPEGImage: Result:= 'JPG';
  end;
end;

function GetTextTypeStr(TextType: ShortInt; DefValue: string = ''): String;
begin
  Result:= DefValue;
  case TextType of
    tx_Plain: Result:= 'TXT';
    tx_Rich: Result:= 'RTF';
  end;
end;

{
  tx_None = -1;
  tx_Empty = 0;
  tx_Plain = 1;
  tx_Rich = 2;
}

function  PackGraphicToBlob( Graphic: TGraphic;
                             FBlob: TField; CompressionLevel: ZLib.TCompressionLevel = ZLib.clMax;
                             TargetType: ShortInt = gf_Default): Integer;
var MS: TMemoryStream; GraphicType: ShortInt; JPEGImage: TJPEGImage; Bitmap: TBitmap;
begin
  MS:= TMemoryStream.Create; Result:= 0;
  try
    GraphicType:= GetGraphicType(Graphic);
    if (GraphicType <> gf_None) then
    begin
      JPEGImage:= nil; Bitmap:= nil;
      try
        if (TargetType <> GraphicType) and (GraphicType <> gf_Empty) then
        begin
          case TargetType of
          gf_Bitmap:
             begin
               Bitmap:= TBitmap.Create;
               Bitmap.Assign(Graphic);
               Graphic:= Bitmap;
             end;
          gf_JPEGImage:
             begin
               JPEGImage:= TJPEGImage.Create;
               JPEGImage.Assign(Graphic);
               Graphic:= JPEGImage;
             end;
          end;
          GraphicType:= TargetType;
        end;
        MS.Write(GraphicType, SizeOf(GraphicType));
        if (GraphicType <> gf_Empty) then
           Graphic.SaveToStream(MS);
      finally
        Bitmap.Free; JPEGImage.Free;
      end;
      MS.Position:= 0;
      Result:= PackStreamToBlob(MS, FBlob, CompressionLevel);
    end;
  finally
    MS.Free;
  end;
end;

function WriteStrToStream(S: string; Stream: TStream; ReturnPos: Boolean = False): Integer;
begin
  Result:= Stream.Position;
  if Length(S)>0 then
  Stream.WriteBuffer(Pointer(s)^, Length(S));
  if ReturnPos then
     Stream.Position:= Result else
     Result:= Stream.Position;
end;

function WriteStrDataToZip( Dest: TDataSet;
                            ActiveName, TimeName, FormName, ScriptName, DataName,
                            FNameValue, SNameValue, DataValue: string;
                            Compressed: Boolean = True): Integer;
var FBlob, FName, SName, FActive, FTime: TField; Stream: TStream;
begin
  Result:= -1;
  FBlob:= Dest.FindField(DataName);
  FName:= Dest.FindField(FormName);
  SName:= Dest.FindField(ScriptName);
  FActive:= Dest.FindField(ActiveName);
  FTime:= Dest.FindField(TimeName);
  if (FName=nil) or (SName=nil) or (FBlob=nil) or (not FBlob.IsBlob) then Exit;
  if (Dest.State in [dsEdit, dsInsert]) then Dest.Post;
  if not (Dest.Locate(FormName + ';' + ScriptName, VarArrayOf([FNameValue, SNameValue]), [])) then
  begin
    Dest.Append;
    FName.AsString:= FNameValue;
    SName.AsString:= SNameValue;
    if (FActive<>nil) then FActive.AsBoolean:= True;
  end else
  Dest.Edit;
  try
    Result:= 0;
    if DataValue = '' then FBlob.Value:= NULL else
    begin
      Stream := Dest.CreateBlobStream(FBlob, bmWrite);
      CompressText(DataValue, Stream, Result, Compressed);
      Stream.Free;
    end;
    if (FTime<>nil) then FTime.AsDateTime:= Now();
  finally
  Dest.Post;
  end;
end;

function ReadStrDataFromZip( Source: TDataSet; ActiveName, FormName, ScriptName, DataName,
                             FNameValue, SNameValue: string;
                             PSize: PInteger = nil): string;
var FBlob, FName, SName, FActive: TField; Stream: TStream; CompSize: Integer;
begin
  Result:= '';
  FBlob:= Source.FindField(DataName);
  FName:= Source.FindField(FormName);
  SName:= Source.FindField(ScriptName);
  FActive:= Source.FindField(ActiveName);
  if (FName=nil) or (SName=nil) or (FBlob=nil) or (not FBlob.IsBlob) then Exit;
  if (Source.Locate(FormName + ';' + ScriptName, VarArrayOf([FNameValue, SNameValue]), [])) then
    if (FActive=nil) or FActive.AsBoolean then
    begin
      Stream := Source.CreateBlobStream(FBlob, bmRead);
      Result:= UnCompressText(Stream, CompSize);
      if (PSize<>nil) then PSize^:= CompSize;
      Stream.Free;
    end;
end;


(*
function ReadQueryFromZip(Source: TDataSet; Query: TMSQuery; FormName: string = ''; Compressed: Boolean = True): Integer;
var FBlob, FName, SName: TField; Stream: TStream; S: string;
begin
  FillChar(Result, SizeOf(Result), -1);
  FBlob:= Source.FindField('Script');
  FName:= Source.FindField('FormName');
  SName:= Source.FindField('ScriptName');
  if (FName=nil) or (SName=nil) or (FBlob=nil) or (not FBlob.IsBlob) then Exit;
    if (FormName='') then
       if (Query.Owner is TForm) then FormName:= TForm(Query.Owner).Name;
    if (FormName<>'') then
       begin
         if (Source.Locate('FormName;ScriptName', VarArrayOf([FormName, Query.Name]), [])) then
            begin
              Stream := Source.CreateBlobStream(FBlob, bmRead);
              Query.DisableControls;
              Query.Close;
              Query.SQL.Text:= UnCompressText(Stream, Result);
              Query.Open;
              Query.EnableControls;
              Stream.Free;
            end;
       end;
end;
*)

function FindObjectsOnForm( ClassList, ExcludeList: string; Form: TForm;
                            var Dest: TDynStringArray; ObjNames: TStrings = nil): Integer;
var i: Integer; Comp: TComponent; List, ExcList, NameList: TStringList; S: string;
begin
  Result:= 0; SetLength(Dest, 0);
  List:= TStringList.Create;
  ExcList:= TStringList.Create;
  NameList:= TStringList.Create;
  ExtractParamFields(ClassList, List, ';');
  ExtractParamFields(ExcludeList, ExcList, ';');
  for i := 0 to List.Count-1 do
    List[i]:= UpperCase(List[i]);
  for i := 0 to Form.ComponentCount-1 do
    begin
      Comp:= Form.Components[i];
      if (ExcList.IndexOf(Comp.Name)<0) and (List.IndexOf(UpperCase(Comp.ClassName()))>=0) then
         NameList.Add(Comp.Name);
    end;
  if (ObjNames<>nil) then ObjNames.Assign(NameList);
  StringsToDynArray(NameList, Dest);
  Result:= NameList.Count;
  NameList.Free;
  ExcList.Free;
  List.Free;
end;

function CanUserDoAction(IdVidDoc, UserNo: Integer; UserActionType: TUserActionType): Boolean;
const
  Template = 'select UserNo from %s where Active = 1 and IdVidDoc = %d and UserNo = %d';
var TableName, SQL: string;
begin
  case UserActionType of
    uatEdit, uatSign: TableName:= 'ListUserForVidDoc';
    uatControl: TableName:= 'ListUserForControlDoc';
    uatConduct: TableName:= 'ListUserForConductingDoc';
  end;
  SQL:= Format(Template, [TableName, IdVidDoc, UserNo]);
  if (UserActionType=uatEdit) then SQL:= SQL + ' and IsCanEdit=1';
  dmDataModule.OpenSQL(SQL);
  Result:= dmDataModule.QFO.RecordCount>0;
end;

procedure DefineUserPriveleges(var Priveleges: TUserPriveleges; IdVidDoc, UserNo: Integer);
begin
  Priveleges:= [];
  if CanUserDoAction(IdVidDoc, UserNo, uatEdit) then
     Priveleges:= Priveleges + [upAuthor];
  if CanUserDoAction(IdVidDoc, UserNo, uatSign) then
     Priveleges:= Priveleges + [upSigner];
  if CanUserDoAction(IdVidDoc, UserNo, uatConduct) then
     Priveleges:= Priveleges + [upConductor];
end;

function DeleteFirstChar(S: string; Ch: Char): string;
begin
  Result := S;
  if AnsiStartsText(Ch, Result) then
    Delete(Result, 1, 1);
end;

function DeleteLastChar(S: string; Ch: Char): string;
begin
  Result := S;
  if AnsiEndsText(Ch, Result) then
    Delete(Result, Length(Result), 1);
end;

function IsQuotedStr(S: string; Quotes: String): Boolean;
var n: Integer;
begin
  Result:= False;
  n:= Length(S);
  if (n>1) and (Quotes<>'') then
  begin
    Result:= (s[1]=Quotes[1]);
    if Result then
    begin
      if Length(Quotes)=1 then
        Result:= (s[n]=Quotes[1]) else
        Result:= (s[n]=Quotes[2]);
    end;
  end;
end;

function DequoteStr(S: string; Quotes: String): string;
begin
  Result:= S;
  if (S<>'') and (Quotes<>'') then
  begin
    Result:= DeleteFirstChar(s, Quotes[1]);
    if Length(Quotes)=1 then
    Result:= DeleteLastChar(Result, Quotes[1]) else
    Result:= DeleteLastChar(Result, Quotes[2]);
  end;
end;

function QuotedStrEx(const S: string; Quotes: String; SkipEmpty: Boolean = True): string;
begin
  Result:= S;
  if ((not SkipEmpty) or (S<>'')) and (Quotes<>'') then
  begin
    Result:= Quotes[1] + s;
    if Length(Quotes)=1 then
    Result:= Result + Quotes[1] else
    Result:= Result + Quotes[2];
  end;
end;

function EncloseInBrackets(S: string; Brackets: string = '[]'; Delims: string = ', '): string;
var L: TStringList;
    i: Integer;
    V: string;
begin
  Result:= '';
  if (S='') then Exit;
  L:= TStringList.Create;
  ExtractParamFields(S, L, Delims[1]);
  for i := 0 to L.Count - 1 do
  begin
    S:= SplitStrFast(L[i], V, Delims[2]);
    if (V<>'') then V:= Delims[2] + V;
    Result:= Result + QuotedStrEx(S, Brackets) + V + Delims[1];
  end;
  Result:= TrimStrWithDelim(Result, Delims[1]);
  L.Free;
end;

function IntMin3(x, y, z: Integer): Integer;
begin
  Result:= Min(z, Min(x, y));
end;

function LevensteinDistance(s, t: String): Integer;
//Source: https://en.wikipedia.org/wiki/Levenshtein_distance
var d: TCompareMatrix;
    i, j, n, m, subCost: Integer;
begin
  Result:= 0;
  if (s=t) then Exit;
  n:= Length(t);
  m:= Length(s);
  if (m=0) or (n=0) then Result:= m + n else
  begin
    //FillChar(d, SizeOf(d), 0);
    // source prefixes can be transformed into empty string by
    // dropping all characters
    for i:= 1 to m do
        d[i, 0] := i;

    // target prefixes can be reached from empty source prefix
    // by inserting every character
    for j:= 1 to n do
        d[0, j] := j;

    for j:= 1 to n do
        for i:= 1 to m do
            d[i, j] := IntMin3( d[i-1, j] + 1,                    // deletion
                                d[i, j-1] + 1,                    // insertion
                                d[i-1, j-1] + Ord(s[i] <> t[j])); // substitution

    Result:= d[m, n];
  end;
end;

function LevensteinSimilarity(s, t: String): Double;
var m: Integer;
begin
  Result:= 1.0;
  m:= Max(Length(s), Length(t));
  if (m>0) then
     Result:= 1.0 - LevensteinDistance(s, t)/m;
end;

function SplitCaseChange(const S: string; const Ch: Char = #32): string;
var i, n, c, k: Integer; IsUpper1, IsUpper2: Boolean;
begin
  Result:= s;
  n:= Length(Result);
  if (n<2) then Exit;
  c:= Length(ch);
  i:= 1; IsUpper1:= False;
  IsUpper1:= IsCharUpper(Result[1]);
  Inc(i); k:= 0;
  while (i<=n) do
  begin
    IsUpper2:= IsCharUpper(Result[i]);
    if (IsUpper2 <> IsUpper1) and (k>1) then
       begin
         Insert(ch, Result, i);
         Inc(i, c);
         Inc(n, c);
         k:= 0;
       end;
    Inc(i); Inc(k);
    IsUpper1:= IsUpper2;
  end;
end;

function SplitStrWithCharSafe(S: string;
  P1, P2: PString;
  Ch: Char = '=';
  TrimStr: Boolean = false;
  NoDelimIndex: Integer = 0;
  ReversePos: Boolean = False): Boolean;
var CharPos: Integer; S1, S2: string;
begin
  Result := false;
  if not ReversePos then
    CharPos := Pos(Ch, S) else
    CharPos := LastDelimiter(Ch, S);
  if (CharPos = 0) and (NoDelimIndex = 0) then exit;
  if CharPos > 0 then
  begin
    if (CharPos = 1) or (CharPos = Length(S))
      then Delete(S, CharPos, 1);
    S1 := Copy(S, 1, CharPos - 1);
    S2 := Copy(S, CharPos + 1, Length(S));
    Result := true;
  end else
  begin
    case NoDelimIndex of
      1: begin S1 := S; S2 := ''; end;
      2: begin S1 := ''; S2 := S; end;
    end;
    Result := (NoDelimIndex>0) and (Length(S) > 0);
  end;
  if (not Result) then exit;
  if TrimStr then
  begin
    S1 := Trim(S1); S2 := Trim(S2);
  end;
  if (P1 <> nil) then P1^ := S1;
  if (P2 <> nil) then P2^ := S2;
end;

function GetDelimSplitStr(S: string; Delim: Char; IsFirst: Boolean = True; TrimStr: Boolean = True): string;
begin
  if IsFirst then
     SplitStrWithCharSafe(S, @Result, nil, Delim, TrimStr, 1, False) else
     SplitStrWithCharSafe(S, nil, @Result, Delim, TrimStr, 2, False);
end;

function SplitStrFast(S: string; var Value: String; Delim: Char = '='): string;
begin
  SplitStrWithCharSafe(S, @Result, @Value, Delim, True, 1, False);
end;

function SplitStrFast(S: string; PValue: PString; ValueAsResult: Boolean = False; Delim: Char = '='): string;
begin
  if ValueAsResult then
     SplitStrWithCharSafe(S, PValue, @Result, Delim, True, 1, False) else
     SplitStrWithCharSafe(S, @Result, PValue, Delim, True, 1, False);
end;

procedure AutosizeControl( Control: TControl; Shift: Integer = 0; ACaption: string = '';
                           ControlType: TCustomControlType = cctAuto);
var Size: Integer;
begin
  if (ACaption='') then ACaption:= THackControl(Control).Caption;
  Size:= UtilsCommon.GetTextWidth(ACaption, THackControl(Control).Font);
  if (Shift=0) then
  case ControlType of
    cctCheckBox: Shift:= UtilsCommon.GetTextWidth('FFF', THackControl(Control).Font);
  end;
  Control.Width:= Size + Shift;
  THackControl(Control).Caption:= ACaption;
end;

procedure SetAllChecked(CheckObj: TObject; Value: Boolean);
var i: Integer;
begin
  if CheckObj is TCheckListBox then
  with TCheckListBox(CheckObj) do
  for i := 0 to Items.Count-1 do
    Checked[i]:= Value;
end;

procedure ScanAllChecked(CheckObj: TObject; List: TStrings = nil);
var i, n: Integer;
begin
  if CheckObj is TCheckListBox then
  with TCheckListBox(CheckObj) do
  begin
    if (List = nil) then List:= Items;
    n:= Min(List.Count, Items.Count);
    for i := 0 to n-1 do
      List.Objects[i]:= Pointer(Ord(Checked[i]));
  end;
end;

procedure AssignListObjects(Src, Dst: TStrings);
var i, n: Integer;
begin
  n:= Min(Src.Count, Dst.Count);
  for i := 0 to n-1 do
    Dst.Objects[i]:= Src.Objects[i];
end;

procedure AssignOnlyNames(Src, Dst: TStrings; StartFrom: Integer = 0);
var i, n: Integer;
begin
  Dst.Clear;
  for i := StartFrom to Src.Count-1 do
    Dst.Add(SplitStrFast(Src[i], nil, False, '='));
end;

procedure AssignOnlyValues(Src, Dst: TStrings; StartFrom: Integer = 0);
var i, n: Integer;
begin
  Dst.Clear;
  for i := StartFrom to Src.Count-1 do
    Dst.Add(SplitStrFast(Src[i], nil, True, '='));
end;

function ActiveItemIndex(Menu: TMenuItem): Integer;
begin
if (Menu<>nil) then
for Result := 0 to Menu.Count-1 do
    with Menu[Result] do
      if Visible and Checked then exit;
Result:= -1;
end;

function ActivateAllIMenutems(Menu: TMenuItem): Integer;
var i: Integer;
begin
  Result := 0;
  if (Menu<>nil) then
  begin
    Result := Menu.Count;
    for i := 0 to Result-1 do
        Menu[i].Visible:= True;
  end;
end;

function ItemIndexByTag(Menu: TMenuItem; ATag: Integer): Integer;
begin
if (Menu<>nil) then
for Result := 0 to Menu.Count-1 do
    with Menu[Result] do
      if Tag = ATag then exit;
Result:= -1;
end;

function ToggleMenuItemOrd(Sender: TObject): Integer;
begin
  Result:= -1;
if (Sender is TMenuItem) then
with Sender as TMenuItem do
  begin
    Checked:= not Checked;
    Result:= Ord(Checked);
  end;
end;

function ToggleMenuItemIdx(Sender: TObject): Integer;
begin
  Result:= -1;
if (Sender is TMenuItem) then
with Sender as TMenuItem do
  begin
    Checked:= not Checked;
    Result:= MenuIndex+1;
    if not Checked then Result:= -Result;
  end;
end;

function ActivateMenuItem(Sender: TObject): Integer;

procedure UnCheckActiveChild(Menu: TMenuItem);
var I: Integer; Item: TMenuItem;
Begin
if Menu.Count>0 then
   for I:=0 to Menu.Count-1 do
       begin
       Item:= Menu[I];
       if Item.Visible and (Item.Count=0) and Item.Checked then
          Item.Checked:= false;
       end;
End;

Begin
  Result:= -1;
if (Sender is TMenuItem) then
with Sender as TMenuItem do
begin
   if (not Checked)
   then
   begin
   UnCheckActiveChild(Parent);
   Checked:= true;
   end;
   Result:= MenuIndex;
end;
End;

function ExecuteHotKeyForActionList(ActionList: TActionList; HotKey: TShortCut): Boolean;
var i: Integer; Action: TContainedAction;
begin
for i := 0 to ActionList.ActionCount - 1 do
  begin
    Action:= ActionList[i];
    if (Action is TAction) and
        (TAction(Action).ShortCut = HotKey) then
          Result:= TAction(Action).Execute;
  end;
  Result:= False;
end;

procedure ClickOnControl(Control: TControl);
begin
if Assigned(THackControl(Control).OnClick) then THackControl(Control).OnClick(Control);
end;

function GetControlText(Control: TControl): string;
var
  Len: Integer;
begin
  Len := Control.GetTextLen + 1;
  SetLength(Result, Len);
  Control.GetTextBuf(Pointer(Result), Len);
  Result := Trim(Result);
  //Result:= Control.Text; No Text property in TControl but in debug mode it is visible
end;

function GetNormalDateStr(ADate: TDate): String;
 var Settings: TFormatSettings;
begin
  Settings.DateSeparator := '.';
  Settings.ShortDateFormat := 'dd.mm.yyyy';
  Result:= DateToStr(ADate, Settings);
end;

function GetCellRect(Grid: TCustomGrid; Row, Col: Integer): TRect;
begin
  Result := THackGrid(Grid).CellRect(Col, Row);
end;

function GetOffsetPoint(Owner, Child: TControl): TPoint;
var POwner, PChild: TPoint;
begin
  POwner:= Owner.ClientToScreen(Point(0,0));
  PChild:= Child.ClientToScreen(Point(0,0));
  Result:= Point(PChild.X - POwner.X, PChild.Y - POwner.Y);
end;

function ExtractParamField(const Fields: string; var Pos: Integer; const Delimiter: Char = ';'): string;
begin
  Result := MlkData.ExtractParamField(Fields, Pos, Delimiter);
end;

function ExtractParamFields(const Fields: string; Dest: TStrings; const Delimiter: Char = ';'): Integer;
begin
  Result := 0;
  if (Fields='') then Dest.Clear else
     Result := MlkData.ExtractParamFields(Fields, Dest, Delimiter);
end;

procedure ParseStringItems(Source, Dest: TStrings; ReplaceOption: Integer = 0);
var i: Integer; SName, SValue: String;
begin
  Dest.Clear;
  for i := 0 to Source.Count - 1 do
  begin
    SName:= Source.Names[i];
    if (SName<>'') then
       begin
         SValue:= Source.ValueFromIndex[i];
         if (Dest<>nil) then
            if (SValue<>'') then
               Dest.AddObject(SValue, Pointer(i)) else
               Dest.AddObject(SName, Pointer(i));
         case ReplaceOption of
           0: Source[i]:= SName;
           1: Source[i]:= SValue;
         end;
       end else
       Dest.AddObject(Source[i], Pointer(i));
  end;
end;

function JoinStringItems(Source1, Source2, Dest: TStrings): Integer;
var i, n: Integer;
begin
  Result:= 0;
  if (Dest<>Source2) then Dest.Clear;
  n:= Min(Source1.Count, Source2.Count);
  for i := 0 to n - 1 do
  begin
  if (Dest<>Source2)
     then Dest.Add(Source1[i] + '=' + Source2[i])
     else Dest[i]:= Source1[i] + '=' + Source2[i];
     Inc(Result);
  end;
end;

procedure InsertChildInStringGrid(
          Child: TControl; Parent: TCustomGrid; Row, Col: Integer; AWidth: Integer = 0);
var
  Rect: TRect;
begin
  Rect:= GetCellRect(Parent, Row, Col);
  with Rect do
  begin
    if AWidth=-1 then AWidth:= Bottom - Top;
    if AWidth=0 then
      Child.SetBounds(Left, Top, Right - Left, Bottom - Top) else
      Child.SetBounds(Left, Top, AWidth, Bottom - Top);
  end;
end;

function InsertRowIntoValueListEditor( Editor: TValueListEditor; Key, Value: String;
                                       DefValue: Variant;
                                       ReadOnly: Boolean; EditStyle: Grids.TEditStyle;
                                       RowHeight: Integer = 0;
                                       Delimiter: Char = ';'): Integer;
var ItemProp: TItemProp; i, DefRowHeight, VType: Integer;
begin
  if (EditStyle<>Grids.esPickList) then
    Result:= Editor.InsertRow(Key, Value, True) else
    Result:= Editor.InsertRow(Key, '', True);
  if (doColumnTitles in Editor.DisplayOptions) then
     Dec(Result);
  ItemProp:= Editor.ItemProps[Result];
  ItemProp.PickList.Clear;
  ItemProp.ReadOnly:= ReadOnly;
  ItemProp.EditStyle:= EditStyle;
  DefRowHeight:= Editor.DefaultRowHeight;
  if (RowHeight > 0) then
     Editor.RowHeights[Result]:= RowHeight;
  if (EditStyle=Grids.esPickList) then
  begin
    ExtractParamFields(Value, ItemProp.PickList, Delimiter);
    if (ItemProp.PickList.Count>0) then
    if VarIsType(DefValue, [varByte, varWord, varLongWord, varShortInt, varSmallint, varInteger]) then
       begin
         i:= DefValue;
         if (i>=0) and (i<ItemProp.PickList.Count) then
           Editor.Values[Key]:= ItemProp.PickList[i];
       end else
    if VarIsType(DefValue, [varString]) then
       begin
         Value:= DefValue;
         i:= ItemProp.PickList.IndexOf(Value);
         if (i<0) then i:= 0;
         Editor.Values[Key]:= ItemProp.PickList[i];
       end;
  end;
end;

{
;ColName=Col_ID|Table|ExpName|SelName
OtdelName=OtdelNo|VIDOTDEL|Отделу продаж=1|Отделы продаж=10
VidName=VidNo|VIDTOV|Виду товара=1|Виды товара
TipName=TipNo|TIPTOVARA|Типу товара|Типы товара
SotrudName=SotrudNo|SOTRUD|Сотруднику|Сотрудники
AgentName=PostNo|POST|Контрагенту|Контрагенты
TovarName=TovarNo|TOVAR|Товару|Товары
}

procedure VerifyEmptySelections(SelectEditor: TValueListEditor; SelectArray: TStringListArray);
var i, n: Integer; Vars: string; Keys: TStrings;
begin
  n:= SelectEditor.Strings.Count;
  for i := 0 to n-1 do
    begin
      Vars:= Trim(SelectEditor.Strings.ValueFromIndex[i]);
      Keys:= SelectArray.GetChild(i);
      if (Vars='') then Keys.Clear;
    end;
end;

function ParseExpandSelectItems( Source: TStrings;
                                 CheckObj: TObject;
                                 SelectEditor: TValueListEditor;
                                 ParamArray, SelectArray: TStringListArray;
                                 OptionList: TStrings;
                                 EntityNames: string = 'COL,ID,TBL,';
                                 Temp: TStrings = nil;
                                 ValueDelim: Char = '|'): Integer;
var CLB: TCheckListBox; Tmp, Lst, Prm: TStrings;
    i, j, k, p: Integer; Delim: Char;
    SName, SValue, S_Name, T_Name: String;
begin
  if (Temp=nil) then
      Tmp:= TStringList.Create else
      Tmp:= Temp;
  Lst:= TStringList.Create;
  try
    Result:= 0; CLB:= nil; Delim:= ' ';
    if CheckObj is TCheckListBox then
       CLB:= TCheckListBox(CheckObj);
    if (CLB<>nil) then CLB.Clear;
    ParamArray.Clear; SelectArray.Clear; SelectEditor.Strings.Clear; OptionList.Clear;
    if Length(EntityNames)>0 then Delim:= EntityNames[Length(EntityNames)]
                             else Delim:= ',';
    if Pos(Delim, ',;|') > 0 then
    begin
      ExtractParamFields(EntityNames, Lst, Delim);
      if (Lst.Count > 2) then
      begin
        for i := 0 to 2 do
          ParamArray.AddItem(Lst[i], nil);
        for i := 0 to Source.Count - 1 do
        begin
          SName:= SplitStrFast(Source[i], SValue);
          if (SValue<>'') and (SName<>'') and (SName[1]<>';') then
             begin
               Prm:= ParamArray.GetChild(0);
               Prm.Add(SName);
               ExtractParamFields(SValue, Tmp, ValueDelim);
               if Tmp.Count > 3 then
               begin
                 for k := 0 to 4 do
                 begin
                   if (k<2) then
                      begin
                        Prm:= ParamArray.GetChild(k+1);
                        Prm.Add(Tmp[k]);
                        if (k=1) then T_Name:= Tmp[k];
                      end else
                      begin
                        S_Name:= SplitStrFast(Tmp[k], SValue);
                        if (k=2) then
                           begin
                             if (CLB<>nil) then
                                begin
                                  p:= StrToIntDef(SValue, 0);
                                  j:= CLB.Items.AddObject(S_Name, Pointer(p));
                                  CLB.Checked[j]:= Boolean(p);
                                end;
                           end else
                           if (k=3) then
                           begin
                             InsertRowIntoValueListEditor(SelectEditor, S_Name, '', null, False, Grids.esSimple);
                             j:= SelectArray.AddItem(T_Name, nil);
                             Prm:= SelectArray.GetChild(j);
                             Prm.CommaText:= SValue;
                           end else
                           if (k=4) then
                           begin
                             OptionList.Add(Tmp[k]);
                           end;
                      end;
                 end;
               end;
             end;
        end;
      end;
    end;
  finally
  Lst.Free;
  if Tmp <> Temp then Tmp.Free;
  end;
end;


procedure SetBoolValueInObjects(Items: TStrings; Index: Integer; Value: Integer; StrValue: string = '');
begin
  if (Value=-1) then Value:= 1-Integer(Items.Objects[Index]);
  if (StrValue<>'') then Items.ValueFromIndex[Index]:= StrValue;
  Items.Objects[Index]:= Pointer(Value);
end;

function GetBoolValueInObjects(Items: TStrings; Index: Integer): Boolean;
begin
  Result:= Boolean(Integer(Items.Objects[Index]));
end;

function SetListValuesFast( List: TStrings; Values: string; Delimiter: Char = ';'): Integer;
begin
  List.BeginUpdate;
  List.Clear;
  List.Delimiter:= Delimiter;
  List.DelimitedText:= Values;
  Result:= List.Count;
  List.EndUpdate;
end;

procedure ErrorMessageDlg(const Msg: string);
begin
  MessageDlg(Msg, mtError, [mbOK], 0);
end;

function QueryMessageDlg(const Msg, Caption: String): Boolean;
begin
  Result:= Application.MessageBox(PChar(Msg), PChar(Caption), MB_YESNO or MB_DEFBUTTON2) = ID_YES
end;

function GetParamValueDef(Params: TParams; ParamName: String; DefValue: string = ''): String;
begin
  if (DefValue='') then DefValue:= ParamName;
  Result:= DefValue;
  if (Params<>nil) then
     Result:= UtilsCommon.GetParamValue(Params, ParamName, varString, DefValue);
end;

function GetEntityTable(KeyField, TextField: String): String;
begin
  Result:= '';
  MlkData.dmDataModule.OpenSQL('select Name from d_entity_type d where d.key_field= :p1 and d.txt_field=:p2', [KeyField, TextField]);
  if (MlkData.dmDataModule.QFO.RecordCount=1) then
  Result:= MlkData.dmDataModule.QFO.FieldByName('Name').AsString;
end;

{$IFNDEF NoCIT}
function SelectMLKItemsByDialog(MLKForm: TCFLMLKCustomForm; Items: TStrings;
  OwnerName, ParamName, ParamCode: string;
  MultiSelect: BOOL = True; KeyValues: TStrings = nil;
  SQLFilter: string = ''; UpdateEvent: TNotifyEvent  = nil): Integer;
var
  Keys: TStrings;
  i, c, v: Integer;
  l_param_code, l_query_filter, l_param_name, l_owner, l_style: string;
  is_multiselect: boolean;
begin
  Result := -1;
  l_owner := OwnerName;
  l_param_name := UpperCase(ParamName);
  l_param_code := ParamCode;
  l_query_filter := SQLFilter;
  l_style := 'unknown';
  is_multiselect:= MultiSelect;
  if TCFLMLKSelectDlg.OpenHoldSelect(l_Owner, l_param_name, l_param_code,
    is_multiselect, l_query_filter, l_style, UpdateEvent) then
  begin
    if (KeyValues<>nil) then
       Keys:= KeyValues else
       Keys := TStringList.Create;
    try
      Result := dmDataModule.get_selected_value(OwnerName, ParamName, ParamCode,
        Items, Keys);
      if (KeyValues=nil) then
        for i := 0 to Result - 1 do
        begin
          Val(Keys[i], v, c);
          if (c = 0) then
            Items.Objects[i] := Pointer(v)
          else
            Items[i] := Items[i] + '=' + Keys[i];
        end;
    finally
      if not is_multiselect then
         dmDataModule.Del_session_params(OwnerName, ParamName, Keys[0]);
      if (KeyValues=nil) then Keys.Free;
    end;
  end;
end;

function SelectMLKItemsInEditor( OwnerName: string; SelectEditor: TValueListEditor; SelectArray: TStringListArray;
                                 Temp: TStrings = nil; Delim: string = ', '): Integer;
var
  i, z: Integer; Tmp: TStrings; Prev, Tbl: String;
begin
  if (Temp=nil) then
      Tmp:= TStringList.Create else
      Tmp:= Temp;
  try
    Result:= -1;
    i:= SelectEditor.Row-1;
    Prev:= SelectEditor.Strings.ValueFromIndex[i];
    Tbl:= SelectArray[i];
    Result:= SelectMLKItemsByDialog(
             nil, Temp, OwnerName, 'prm_' + Tbl, Tbl, True, SelectArray.GetChild(i));
    if (Result>=0) then
    begin
      SelectEditor.Values[SelectEditor.Keys[i+1]]:= Trim(GetDelimText(Temp, Delim));
    end else
    SelectEditor.Values[SelectEditor.Keys[i+1]]:= Prev;
  finally
  if Tmp <> Temp then Tmp.Free;
  end;
end;
{$ENDIF}

function TestActionFormDlgEx(ActionID: Integer; FormClassName: string = ''; ShowErrorDlg: Boolean = False): Integer;
const
  sql = 'select FormClassName from ActionForms where ActionID = :p1_ActionID';
var PClass: TComponentClass;
    Dlg: TForm;
    Field: TField;
begin
  Result:= -1;
  if (FormClassName='') then
     begin
       dmDataModule.OpenSQL(sql, [ActionID]);
       if dmDataModule.QFO.RecordCount=1 then
          FormClassName:= dmDataModule.QFO.Fields[0].Value;
     end;
  if (FormClassName<>'') then
  begin
    PClass := TComponentClass(GetClass(FormClassName));
    Result:= 0;
    if (PClass=nil) then
       if ShowErrorDlg then
          ErrorMessageDlg(Format('Класс %s не зарегистрирован', [FormClassName])) else else
        begin
          Application.CreateForm(PClass, Dlg);
          Dlg.ShowModal;
          Dlg.Free;
          Result:= 1;
        end;
  end;
  dmDataModule.QFO.Close;
end;

function GetDelimText( Source: TStrings; Delim: String; Quote: Char = #0;
                       BoolFunc: TIntBoolFunc = nil; MaxCount: Integer = 0): string;
var i, h: Integer;
begin
  Result:= '';
  h:= Source.Count;
  if (MaxCount>0) then
     h:= Min(h, MaxCount);
  for i := 0 to h - 1 do
  if (not Assigned(BoolFunc)) or BoolFunc(i) then
  begin
    if (Quote=#0) then
       Result:= Result + Source[i] else
       Result:= Result + AnsiQuotedStr(Source[i], Quote);
    Result:= Result + Delim;
  end;
  Result:= TrimStrWithDelim(Result, Delim);
end;

function GetDelimTextOfIntArray( const Source: PIntegerArray;
                                 const Count: Integer; const Delim: String): string;
var i, h: Integer;
begin
  Result:= '';
  if (Source <> nil) then
  begin
    h:= Count - 1;
    for i := 0 to h do
    begin
      Result:= Result + IntToStr(Source[i]);
      if (i<h) then
         Result:= Result + Delim;
    end;
  end;
end;

function GetDelimTextOfIntArray(const Source: TDynIntegerArray; Delim: String): string;
var i, n: Integer;
begin
  Result:= '';
  n:= Length(Source);
  if (n>0) then
     Result:= GetDelimTextOfIntArray(@Source[0], n, Delim);
end;

function TrimStrWithDelim(S, Delim: string; CheckDelim: Boolean = False): string;
begin
  Result:= S;
  if (Result<>'') and (Delim<>'') then
  begin
    if (not CheckDelim) or AnsiEndsText(Delim, S) then
       SetLength(Result, Length(Result)-Length(Delim));
  end;
end;

function BuildIntList(Start, Count: Integer; Increment: Integer = 1; Delimiter: Char = ','): String;
begin
  Result:= '';
  while Count>0 do
  begin
    Result:= Result + IntToStr(Start) + Delimiter;
    Dec(Count); Inc(Start, Increment);
  end;
  Result:= TrimStrWithDelim(Result, Delimiter, False);
end;

procedure IntArrayToStrings(const Source: TDynIntegerArray; Dest: TStrings);
var i: Integer;
begin
  Dest.Clear;
  for i := 0 to High(Source) do
  Dest.Add(IntToStr(Source[i]));
end;

procedure IntArrayToStrings( const Source: PIntegerArray;
                             const Count: Integer; Dest: TStrings;
                             const DoClear: Boolean);
var i: Integer;
begin
  if DoClear then Dest.Clear;
  if (Source<>nil) then
  for i := 0 to Count-1 do
  Dest.Add(IntToStr(Source[i]));
end;

function IndexOfIntValue(Value: Integer; const Source: array of Integer): Integer;
begin
  for Result := Low(Source) to High(Source) do
      if Value = Source[Result] then Exit;
  Result:= -1;
end;

procedure StackToDynArray(const Source: array of Integer; var Dest: TDynIntegerArray);
var n: Integer;
begin
  n:= Length(Source);
  SetLength(Dest, n);
  if n>0 then
     System.Move(Source[0], Dest[0], SizeOf(Integer)*n);
end;

procedure StringObjectsToDynArray(const Source: TStrings; var Dest: TDynIntegerArray);
var i, n: Integer;
begin
  n:= Source.Count;
  SetLength(Dest, n);
  for i := 0 to n-1 do
  Dest[i]:= Integer(Source.Objects[i]);
end;

procedure AssignIntValuesToStringObjects(const Source: array of Integer; const Dest: TStrings);
var i, n: Integer;
begin
  n:= Min(Dest.Count, Length(Source));
  for i := 0 to n-1 do
  Dest.Objects[i]:= Pointer(Source[i]);
end;

procedure StringsToDynArray(const Source: TStrings; var Dest: TDynStringArray; const MaxCount: Integer = 0);
var i, n: Integer;
begin
  n:= MaxCount;
  if (n<=0) then
     n:= Source.Count else
     n:= Min(Source.Count, MaxCount);
  SetLength(Dest, n);
  for i := 0 to n-1 do
  Dest[i]:= Source[i];
end;

procedure ParseTextToDynArray(const AText: String; var Dest: TDynStringArray; Delimiter: Char = ';');
var i, n, k: Integer; s: String;
begin
  SetLength(Dest, 0); k:= 0;
  i:= 1; n:= Length(AText);
  while i<=n do
  begin
    s:= MlkData.ExtractParamField(AText, i, Delimiter);
    Inc(k);
    SetLength(Dest, k);
    Dest[k-1]:= s;
  end;
end;

function AnsiTextPos(const Substr, S: string): Integer;
begin
  Result:= AnsiPos(AnsiUppercase(Substr), AnsiUppercase(S));
end;

function GetContainsPosIndex( Source: TStrings; S: string;
                              LookForPos: Integer = idSearchAllPos;
                              MaxCount: Integer = 0;
                              LookForward: Boolean = True;
                              StartIndex: Integer = 0): Integer;
function IsFound(i: Integer): Boolean;
var p: Integer;
begin
  p:=  AnsiTextPos(S, Source[i]);
  Result:= (p>0) and ((LookForPos=idSearchAllPos) or (LookForPos=p));
end;

begin
  if (MaxCount<=0) or (MaxCount>Source.Count) then
      MaxCount:= Source.Count;
  if LookForward then
  begin
    for Result := StartIndex to MaxCount - 1 do
      if IsFound(Result) then Exit
  end
  else
  begin
    for Result := Source.Count-1 downto Source.Count-MaxCount do
      if IsFound(Result) then Exit
  end;
  Result := -1;
end;

function GetStartPosIndex( Source: TStrings; S: string; MaxCount: Integer = 0;
                           LookForward: Boolean = True; Start: Integer = -1;
                           UseSameText: Boolean = False): Integer;
function IsFound(i: Integer): Boolean;
begin
  if UseSameText then
     Result:= AnsiSameText(S, Source[i]) else
     Result:= AnsiStartsText(S, Source[i]);
end;

begin
  if (MaxCount<=0) or (MaxCount>Source.Count) then
      MaxCount:= Source.Count;
  if LookForward then
  begin
    if (Start<0) then Start:= 0;
    //if (Start>=0) then
    for Result := Start to MaxCount - 1 do
      if IsFound(Result) then Exit
  end
  else
  begin
    if (Start<0) then Start:= Source.Count-1;
    //if (Start>=0) then
    for Result := Start downto Source.Count-MaxCount do
      if IsFound(Result) then Exit
  end;
  Result := -1;
end;

function GetStartTextIndex( Source: TStrings; S: string): Integer;
begin
  Result:= GetStartPosIndex(Source, S, 0, True, 0, False);
end;

function GetSameTextIndex( Source: TStrings; S: string): Integer;
begin
  Result:= GetStartPosIndex(Source, S, 0, True, 0, True);
end;

function IndexOfValue( const Source: TStrings; const S: string;
                       const StartFrom: Integer = 0;
                       const CaseSensitive: Boolean = True): Integer;
var
  CompareFunc: function(const S1, S2: string): Integer;
begin
  if CaseSensitive then
     CompareFunc:= @AnsiCompareStr else
     CompareFunc:= @AnsiCompareText;
  for Result := StartFrom to Source.Count - 1 do
    if CompareFunc(Source.ValueFromIndex[Result], S) = 0 then Exit;
  Result := -1;
end;

function IndexOfName( const Source: TStrings; const S: string;
                      const StartFrom: Integer = 0;
                      const CaseSensitive: Boolean = False): Integer;
var
  CompareFunc: function(const S1, S2: string): Integer;
begin
  if CaseSensitive then
     CompareFunc:= @AnsiCompareStr else
     CompareFunc:= @AnsiCompareText;
  for Result := StartFrom to Source.Count - 1 do
    if CompareFunc(Source.Names[Result], S) = 0 then Exit;
  Result := -1;
end;

function IndexOfText( const AText: string;
                      const AValues: array of string;
                      const CaseSensitive: Boolean = False): Integer;
var
  CompareFunc: function(const S1, S2: string): Integer;
var
  I: Integer;
begin
  if CaseSensitive then
     CompareFunc:= @AnsiCompareStr else
     CompareFunc:= @AnsiCompareText;
  Result := -1;
  for I := Low(AValues) to High(AValues) do
    if CompareFunc(AText, AValues[I]) = 0 then
    begin
      Result := I;
      Break;
    end;
end;

function TextAsVarType(const AText: string): Integer;
// CText is taken from Variants.VarTypeAsText
const
  CText: array [varEmpty..varInt64] of string = ('Empty', 'Null', 'Smallint', //Do not localize
    'Integer', 'Single', 'Double', 'Currency', 'Date', 'OleStr', 'Dispatch', //Do not localize
    'Error', 'Boolean', 'Variant', 'Unknown', 'Decimal', '$0F', 'ShortInt', //Do not localize
    'Byte', 'Word', 'LongWord', 'Int64');
begin
  Result:= IndexOfText(AText, CText, False);
  if (Result = -1) then
     if SameText(AText, 'String') then
        Result:= varString else
     if SameText(AText, 'Any') then
        Result:= varAny;
end;

procedure DeleteItemsInStrings(Strings: TStrings; Start, Qty: Integer);
var i: Integer;
begin
while (Qty>0) do
  begin
    i:= Start + Qty - 1;
    if (i<Strings.Count) then
       Strings.Delete(i) else
       Qty:= 1;
    Dec(Qty);
  end;
end;

procedure DeleteItemsInStringsUntilEmpty(Strings: TStrings; Start: Integer);
var i: Integer;
begin
while (Start < Strings.Count) do
  begin
  if (Trim(Strings[Start])<>'') then
       Strings.Delete(Start) else
       Break;
  end;
end;

procedure DequoteStringItems(Items: TStrings; Dequote: Char);
var i: Integer;
begin
for i := 0 to Items.Count-1 do
  begin
    Items[i]:= AnsiDequotedStr(Trim(Items[i]), Dequote);
  end;
end;

procedure PrepareStrValues(Variables: string; Keys: TStrings; Dequote: Char = '"');
begin
  Keys.Clear;
  ExtractStrings([','], [], PChar(Variables), Keys);
  if Dequote<>#0 then
     DequoteStringItems(Keys, Dequote);
end;

function VerifyIntKeys(Values: string; Keys: TStrings; DefValue: Integer = MaxInt): Integer;
var i, v, c: Integer;
begin
  Result:= 0;
  PrepareStrValues(Values, Keys);
  while (Result<Keys.Count) do
  begin
    Val(Keys[Result], v, c);
    if (c = 0) then
      Inc(Result)
    else
    if (DefValue=MaxInt) then
       Keys.Delete(Result) else
       begin
         Keys[Result]:= IntToStr(DefValue);
         Inc(Result);
       end;
  end;
end;

function VerifyDateKeys(Values: string; Keys: TStrings; StartDate: TDate): Integer;
var i: Integer; ADate: TDate; BadDate: TDate;
begin
  PrepareStrValues(Values, Keys); Result := 0;
  BadDate:= StrToDate('01.01.1900');
  while (Result<Keys.Count) do
  begin
    ADate:= StrToDateDef(Keys[Result], BadDate);
    if (ADate<>BadDate) then
    begin
      Keys[Result]:= IntToStr(DaysBetween(StartDate, ADate));
      Inc(Result);
    end else
    Keys.Delete(Result);
  end;
end;

function VerifyTextValues(Variables, Table, KeyField, TextField: string;
         List, Keys: TStrings; SQL: string = '';
         AsInteger: Boolean = False; MaxLength: Integer = 20;
         InitValue: Integer = -1;
         UseKeyValues: Boolean = True;
         UseKeyField: Boolean = False;
         TextToKeys: Boolean = False): Integer;
var
  P: PAnsiChar;
  aSQL, Values, s, t: string;
  i, n, v, c, m: Integer;
begin
  Result := 0;
  List.Clear; if (Keys<>nil) then Keys.Clear;
  if Trim(Variables)='' then Exit;
  ExtractStrings([','], [], PChar(Variables), List);
  Values := '';
  n := List.Count;
  m := 0;
  for i := 0 to n - 1 do
  begin
    s := (AnsiDequotedStr(Trim(List[i]), '"'));
    if AsInteger then
    begin
      s:= Trim(s);
      List[i]:= s;
    end;
    c := 0;
    List.Objects[i] := Pointer(InitValue);
    if AsInteger then
      Val(s, v, c) else
      s:= QuotedStr(s);
    if (c = 0) then
    begin
      //List.Objects[i]:= Pointer(0);
      Values := Values + s + ',';
      Inc(Result);
    end;
  end;
  if Result > 0 then
  begin
    if TextToKeys and (Keys<>nil) then
       begin
         Keys.Assign(List);
         Exit;
       end;  
    Delete(Values, Length(Values), 1);
    if (SQL<>'') then t := SQL
                 else t:= SQL_Template;
    if (not AsInteger) and (Result=1) and (SQL='') then
    aSQL := Format(SQL_Like, [KeyField, TextField, Table, TextField,
            AnsiDequotedStr(Values, '''')]) else
    if UseKeyField then
    aSQL := Format(t, [KeyField, TextField, Table, KeyField, Values]) else
    aSQL := Format(t, [KeyField, TextField, Table, TextField, Values]);
    dmDataModule.OpenSQL(aSQL);
    dmDataModule.QFO.First;
    Result := 0;
    while not dmDataModule.QFO.Eof do
    begin
      s := dmDataModule.QFO.FieldByName(TextField).AsString;
      if UseKeyField then i:= Result else
      begin
        i := List.IndexOf(S);
      end;
      if (i >= 0) then
      begin
        v := dmDataModule.QFO.FieldByName(KeyField).AsInteger;
        List.Objects[i] := Pointer(v);
        if (Keys<>nil) then
              if UseKeyValues then
                 if Keys.IndexOf(IntToStr(v))<0 then
                    Keys.Add(IntToStr(v)) else else
                 if Keys.IndexOf(s)<0 then
                    Keys.Add(s);
        Inc(Result);
      end;
      dmDataModule.QFO.Next;
    end;
    dmDataModule.QFO.Close;
  end;
end;

function IndexOfColumnByTag(DBGridEh: TDBGridEh; TagValue: Integer): Integer;
var Cols: TDBGridColumnsEh;
begin
  Cols:= DBGridEh.Columns;
  for Result := 0 to Cols.Count-1 do
      if Cols[Result].Tag = TagValue then Exit;
  Result:= -1;
end;

function IndexOfColumnByFieldName(DBGridEh: TDBGridEh; const FieldName: string): Integer;
var Cols: TDBGridColumnsEh;
begin
  Cols:= DBGridEh.Columns;
  for Result := 0 to Cols.Count-1 do
      if Cols[Result].FieldName = FieldName then Exit;
  Result:= -1;
end;

function FindDBGridColumn(Grid: TCustomControl; const FieldName: string): TCollectionItem;
var Cols: TCollection; i: Integer;
begin
  if (Grid is TDBGridEh) then
     with TDBGridEh(Grid) do
     begin
       Cols:= Columns;
       for i:= 0 to Cols.Count-1 do
       begin
         Result:= Cols.Items[i];
         if SameText(TColumnEh(Result).FieldName, FieldName) then Exit;
       end;
     end else
  if (Grid is TDBGrid) then
     with TDBGrid(Grid) do
     begin
       Cols:= Columns;
       for i:= 0 to Cols.Count-1 do
       begin
         Result:= Cols.Items[i];
         if SameText(TColumn(Result).FieldName, FieldName) then Exit;
       end;
     end;
  Result:= nil;
end;

function GetFieldNameByColumn(Column: TCollectionItem): String;
begin
  Result:= '';
  if Column is TColumnEh then
     Result:= TColumnEh(Column).FieldName else
  if Column is TColumn then
     Result:= TColumn(Column).FieldName;
end;

function GetColumnCollection(const Grid: TCustomControl): TCollection;
begin
  Result:= nil;
  if (Grid is TDBGridEh) then
     Result:= TDBGridEh(Grid).Columns else
  if (Grid is TDBGrid) then
     Result:= TDBGridEh(Grid).Columns;
end;

function FindColumnInGridCollection(const GridCols: TCollection; const FieldName: string): TCollectionItem;
var i: Integer;
begin
  for i:= 0 to GridCols.Count-1 do
  begin
   Result:= GridCols.Items[i];
   if SameText(GetFieldNameByColumn(Result), FieldName) then Exit;
  end;
  Result:= nil;
end;

function GetActualGridWidth(Grid: TCustomControl; BorderWidth: Integer = 2; Margin: Integer = 0): Integer;
var Cols: TCollection; i, w: Integer; Visible: Boolean;
begin
  Result:= 0; Cols:= GetColumnCollection(Grid);
  if (Cols <> nil) then
       for i:= 0 to Cols.Count-1 do
       begin
         Visible:= GetObjPropValue(Cols.Items[i], 'Visible', #0);
         if not Visible then Continue;
         w:= VarToIntDef(GetObjPropValue(Cols.Items[i], 'Width', #0), 0);
         if W>0 then Inc(Result, W + BorderWidth);
       end;
  if Result>0 then Inc(Result, Margin);
end;

function SetActualGridWidth(Grid: TCustomControl; BorderWidth: Integer = 2; Margin: Integer = 0): Integer;
var W: Integer;
begin
  W:= GetActualGridWidth(Grid, BorderWidth, Margin);
  SetObjPropValue(Grid, 'Width', IntToStr(W));
end;

function GetMaxColumnWidth(Grid: TCustomControl; const FieldName: string; UseTitleBar: Boolean = True): Integer;
var Item: TCollectionItem; DataSet: TDataSet;
    F: TField; Size: Integer; S: string; Obj: TObject;
    Bookmark: TBookmark;
begin
  Result:= 0;
  Item:=FindDBGridColumn(Grid, FieldName);
  if Item <> nil then
     begin
       if UseTitleBar then
          begin
            S:= GetObjPropValue(Item, 'Title.Caption', #0);
            Obj:= GetObjectProp(Item, 'Font');
            if (Obj is TFont) then
               Result:= UtilsCommon.GetTextWidth(S, TFont(Obj));
          end;
       Obj:= THackControl(Grid).Font;
       DataSet:= nil;
       if Grid is TDBGrid then
          DataSet:= TDBGrid(Grid).DataSource.DataSet else
       if Grid is TDBGridEh then
          DataSet:= TDBGridEh(Grid).DataSource.DataSet;
       if (DataSet <> nil) then
          begin
            DataSet.DisableControls;
            try
              DataSet.Open;
              Bookmark:= DataSet.GetBookmark;
              try
                F:= DataSet.FindField(FieldName);
                if (F <> nil) then
                begin
                  DataSet.First;
                  while not DataSet.Eof do
                  begin
                    Size:= UtilsCommon.GetTextWidth(VarToStr(F.Value), TFont(Obj));
                    Result:= Max(Result, Size);
                    DataSet.Next;
                  end;
                end;
              finally
                DataSet.GotoBookmark(Bookmark);
                DataSet.FreeBookmark(Bookmark);
              end;
            finally
              DataSet.EnableControls;
            end;
          end;
     end;
end;

function SetMaxColumnWidth( Grid: TCustomControl; const FieldName: string;
                            UseTitleBar: Boolean = True; Margin: Integer = 10): Integer;
var MaxWidth: Integer; var Item: TCollectionItem;
begin
  Result:= GetMaxColumnWidth(Grid, FieldName, UseTitleBar);
  if (Result>0) then
     begin
       Inc(Result, Margin);
       Item:=FindDBGridColumn(Grid, FieldName);
       SetObjPropValue(Item, 'Width', IntToStr(Result));
     end;
end;

function IsDataSetEmpty(DataSet: TDataSet): Boolean;
begin
  Result:= (DataSet=nil) or (not DataSet.Active) or
           (DataSet.Bof = DataSet.Eof);
end;


function ProcessDataSetField(DataSet: TDataSet; FieldName: string; Option: Integer; List: TStrings): Integer;
{
case Option of
-1: Delete
1: Add
0: Toggle
}
var SKey: string; i, n: Integer;
begin
  SKey:= DataSet.FieldByName(FieldName).AsString;
  n:= List.Count;
  if (SKey<>'') then
  begin
    i:= List.IndexOf(SKey);
    case Option of
      1: if i<0 then List.Add(SKey);
      -1: if i>=0 then List.Delete(i);
      0: if i<0 then List.Add(SKey) else
                     List.Delete(i);
    end;
  end;    
  Result:= Sign(List.Count - n);
end;

function GetSelectedRowsStr(Grid: TCustomControl; const FieldName: string;
  Delimiter: Char = ','): string;
var
  i: Integer;
  F: TField;
  DS: TDataSet;
  Place: TBookmark;
begin
  Result := '';
  if (Grid is TDBGridEh) then
    with TDBGridEh(Grid) do
    begin
      DS := TDBGridEh(Grid).DataSource.DataSet;
      if (DS <> nil) then
      begin
        F := DS.FindField(FieldName);
        if (F <> nil) then
        begin
          DS.DisableControls;
          try
            TDBGridEh(Grid).SaveBookmark;
            for i := 0 to TDBGridEh(Grid).SelectedRows.Count - 1 do
            begin
              DS.Bookmark := TDBGridEh(Grid).SelectedRows[i];
              Result := Result + VarToStr(F.Value) + Delimiter;
            end;
            TDBGridEh(Grid).RestoreBookmark;
          finally
            DS.EnableControls;
          end;
        end;
      end;
    end
  else if (Grid is TDBGrid) then
  with TDBGrid(Grid) do
  begin
    DS := TDBGrid(Grid).DataSource.DataSet;
    if (DS <> nil) then
    begin
      F := DS.FindField(FieldName);
      if (F <> nil) then
      begin
        DS.DisableControls;
        try
          for i := 0 to TDBGrid(Grid).SelectedRows.Count - 1 do
          begin
            DS.Bookmark := TDBGrid(Grid).SelectedRows[i];
            Result := Result + VarToStr(F.Value) + ',';
          end;
          DS.GotoBookmark(Place);
          DS.FreeBookmark(Place);
        finally
          DS.EnableControls;
        end;
      end;
    end;
  end;
  if (Result <> '') then
    SetLength(Result, Length(Result) - 1);
end;

function SetSelectedRowsStr( Grid: TCustomControl; const FieldName, SelectionStr: string;
                             Delimiter: Char = ','; InverseSelection: Boolean = False): Integer;
var F: TField; DS: TDataSet; List: TStringList;
begin
  Result:= 0;
  List:= TStringList.Create;
  List.Delimiter:= Delimiter;
  List.DelimitedText:= SelectionStr;
  if (List.Count>0) or InverseSelection then
  begin
    List.Sorted:= True;
    if (Grid is TDBGridEh) then
       with TDBGridEh(Grid) do
       begin
         DS:= TDBGridEh(Grid).DataSource.DataSet;
         if (DS<>nil) and DS.Active then
         begin
           F:= DS.FindField(FieldName);
           if (F<>nil) then
           begin
             DS.DisableControls;
             TDBGridEh(Grid).SaveBookmark;
             try
               DS.First;
               TDBGridEh(Grid).SelectedRows.Clear;
               while (not DS.Eof) do
               begin
                 if (List.IndexOf(VarToStr(F.Value))<0) = InverseSelection then
                 begin
                   TDBGridEh(Grid).SelectedRows.CurrentRowSelected:= True;
                   Inc(Result);
                 end;
                 DS.Next;
               end;
             finally
             TDBGridEh(Grid).RestoreBookmark;
             DS.EnableControls;
             end;
           end;
         end;
       end else
    if (Grid is TDBGrid) then
       with TDBGrid(Grid) do
       begin
         DS:= TDBGrid(Grid).DataSource.DataSet;
         if (DS<>nil) and DS.Active then
         begin
           F:= DS.FindField(FieldName);
           if (F<>nil) then
           begin
             DS.DisableControls;
             try
               DS.First;
               TDBGrid(Grid).SelectedRows.Clear;
               while (not DS.Eof) do
               begin
                 if List.IndexOf(VarToStr(F.Value))>=0 then
                 begin
                   TDBGrid(Grid).SelectedRows.CurrentRowSelected:= True;
                   Inc(Result);
                 end;
                 DS.Next;
               end;
             finally
             DS.EnableControls;
             end;
           end;
         end;
       end;
  end;
  List.Free;
end;

function FindColumnByFieldName(const Grid: TCustomControl; const FieldName: string): TColumnEh;
// Do not change TColumnEh to TCollectionItem: it is used in EditTextFieldTable
begin
  Result:= TColumnEh(FindDBGridColumn(Grid, FieldName));
end;

function GetCellRectByFieldName( var Rect: TRect; const Grid: TDBGridEh; const FieldName: string;
                                 ColShift: Integer = 1; RowShift: Integer = 0; PRowHeight: PInteger = nil): Boolean;
var Col: TColumnEh; R: TRect;
begin
  Result:= False;
  Col:= FindColumnByFieldName(Grid, FieldName);
  if (Col <> nil) then
  begin
    Rect:= Grid.CellRect(Col.Index + ColShift, RowShift);
    if (PRowHeight <> nil) then
       begin
         if RowShift>1 then
            R:= Grid.CellRect(Col.Index + ColShift, RowShift-1) else
            R:= Grid.CellRect(Col.Index + ColShift, RowShift+1);
         PRowHeight^:= Abs(Rect.Top - R.Top);
       end;
    Rect.TopLeft:= Grid.ClientToScreen(Point(Rect.Left, Rect.Bottom));
    Rect.BottomRight:= Grid.ClientToScreen(Point(Rect.Right, Rect.Bottom));
    Result:= True;
  end;
end;

procedure SetColumnFooterText(Grid: TDBGridEh; FieldName, AText: String; FooterIndex: Integer = 0);
var Col: TColumnEh;
begin
  Col:= FindColumnByFieldName(Grid, FieldName);
  if (Col <> nil) then
     if (FooterIndex>=0) and (FooterIndex < Col.Footers.Count) then
        Col.Footers[FooterIndex].Value:= AText else
        Col.Footer.Value:= AText;
end;

function MoveColumnInGrid(const Grid: TCustomControl; const Index, Delta: Integer): Integer;
begin
  Result:= Index + Delta;
  if (Grid is TCustomGrid) then
     THackGrid(Grid).MoveColumn(Index, Result)
     else
  if (Grid is TCustomGridEh) then
     THackGridEh(Grid).MoveColumn(Index, Result) else
  Result:= -1;
end;

procedure ShowColumnByFieldName(const Grid: TCustomControl; const FieldName: string; Visible: Boolean = True);
var Col: TColumnEh;
begin
  Col:= FindColumnByFieldName(Grid, FieldName);
  if (Col<>nil) then Col.Visible:= Visible;
end;

procedure ShowColumnsByFieldNames(const Grid: TCustomControl; const FieldNames: string; Visible: Boolean);
var i, n: Integer; Item: TCollectionItem; Name: string;
begin
  i:= 1; n:= Length(FieldNames);
  while (i<n) do
  begin
    Name:=  DB.ExtractFieldName(FieldNames, i);
    if (Name<>'') then
     begin
       Item:= FindDBGridColumn(Grid, Name);
       if (Item<>nil) then
           SetObjPropValue(Item, 'Visible', BoolToStr(Visible, True));
     end;
  end;
end;

procedure InvokePopupMenu( Control: TControl; PopupMenu: TPopupMenu;
                           Button: TMouseButton; Shift: TShiftState;
                           X, Y: Integer; UseCtrlKey: Boolean = True);
var P: TPoint;
begin
  if (Button=mbRight) and ((not UseCtrlKey) or (Shift = [ssCtrl])) then
  begin
    P:= Control.ClientToScreen(Point(X, Y));
    with P do
         PopupMenu.Popup(X, Y);
  end;
end;

function FindParamInDataSet(DataSet: TDataSet; ParamName: String): TParam;
begin
  Result:= nil;
  if (DataSet is TMSQuery) then
     Result:= TMSQuery(DataSet).FindParam(ParamName);
end;

function SortMSQueryInEhGrid( var OldCol, OldDir: Integer;
          Col, OrderLine: Integer; Column: TColumnEh; Source: TStrings;
          MSQuery: TMSQuery; MainField: String; OrderFields: String = '';
          DoOpen: Boolean = True;
          UseOrderBy: Boolean = True): String;
const
  idOrderBy = 'ORDER BY';
var
  OrderStr: string;
  DoInsert: Boolean;
begin
  //  TSortMarkerEh = (smNoneEh, smDownEh, smUpEh);
  Result:= OrderFields;
  DoInsert:= False;
  if (OrderLine<=0) and (Source<>nil) then
  begin
    OrderLine:= GetStartPosIndex(Source, idOrderBy, 10, False);
    if (OrderLine<=0) then
    begin
      OrderLine:= GetStartPosIndex(Source, '--'+idOrderBy, 10, False);
      if (OrderLine>0) then
      begin
        DoInsert:= True;
        Inc(OrderLine);
      end;
    end;
  end;
  if (OrderLine>0) then
  begin
    if (OldCol<>-2) then
      if (OldCol<>Col) or (OldDir=0)
         then OldDir:= 1
         else OldDir:= -OldDir;
         OldCol:= Col;
   Column.Title.SortMarker:= TSortMarkerEh((3-OldDir) div 2);
   if (OldDir<0) then OrderStr:= ' DESC' else OrderStr:= ' ASC';
   if (OrderFields='') and
      (not SameText(MainField, Column.Field.FieldName)) then
           OrderFields:= Column.Field.FieldName;
   if (OrderFields<>'') then OrderStr:= OrderStr + ', ';
   Result:= MainField + OrderStr + OrderFields;
   if UseOrderBy then Result:= idOrderBy + ' ' + Result;
   if (MSQuery=nil) then Exit;
   MSQuery.Close;
   if DoInsert and (Source<>nil) then
   begin
     MSQuery.SQL.Assign(Source);
     MSQuery.SQL.Insert(OrderLine, Result);
   end
      else
      MSQuery.SQL[OrderLine]:= Result;
   if DoOpen then MSQuery.Open;
  end;
end;

function GetOrderByColumnStr( var OldCol, OldDir: Integer; Column: TColumnEh; OrderFields: String = '';
                              HelpList: TStrings = nil; MainField: String = ''; DoSort: Boolean = False): String;
var ACol, Idx: Integer;
    DoFree: Boolean;
begin
  ACol:= Column.Index; DoFree:= False;
  if (OldDir=0) then
     begin
     { At first call pretend that OldDir:= 1 i.e. default sorting is ASCending
       and the same column is used, as to inverse sorting direction
     }
     OldDir:= 1; OldCol:= ACol;
     end;
  if (MainField = '') then MainField:= Column.FieldName;
  if (HelpList=nil) then
     begin
       DoFree:= True;
       HelpList:= TStringList.Create;
     end;
  try
  //HelpList.CommaText:= OrderFields;  we cannot use CommaText since it cannot handle spaces
  ExtractParamFields(OrderFields, HelpList, ',');
  // We account for sort option (desc, asc) following MainField
  Idx:= GetStartPosIndex(HelpList, MainField);
  if (Idx>=0) then HelpList.Delete(Idx);
  OrderFields:= GetDelimText(HelpList, ','); 
  //if DoSort then
  Result:= SortMSQueryInEhGrid( OldCol, OldDir, ACol, 1, Column,
                                nil, nil, MainField, OrderFields, False, False);
  finally
  if DoFree then HelpList.Free;
  end;
end;

function VarToInt64Def(V: Variant; DefValue: Int64 = 0): Int64;
begin
  Result:= StrToInt64Def(VarToStr(V), DefValue);
end;

function VarToIntDef(V: Variant; DefValue: Integer = 0): Integer;
begin
  Result:= StrToIntDef(VarToStr(V), DefValue);
end;

function SafeFieldValue(DataSet: TDataSet; Name: string; DefValue: Variant): Variant;
var Field: DB.TField;
begin
  Result:= DefValue;
  DataSet.Open;
  Field:= DataSet.FindField(Name);
  if (Field<>nil) then
  Result:= Field.Value;
end;

procedure AssignDisplayInfo(Source, Dest: TDataSet);
var
  I: Integer;
  F, FSrc: TField;
begin
    for I := 0 to Min(Source.FieldDefs.Count - 1, Dest.FieldDefs.Count - 1) do
    begin
      F := Dest.FindField(Dest.FieldDefs[I].Name);
      FSrc := Source.FindField(Source.FieldDefs[I].Name);
      if (F <> nil) and (FSrc <> nil) then begin
          F.Visible:= FSrc.Visible;
          if FSrc.Visible then
          begin
            F.DisplayWidth:= FSrc.DisplayWidth;
            F.DisplayLabel:= FSrc.DisplayLabel;
            F.Alignment:= FSrc.Alignment;
            if (F is TFloatField) and (FSrc is TFloatField) then
               TFloatField(F).DisplayFormat:= TFloatField(FSrc).DisplayFormat;
          end;
      end;
    end;
end;

{$IFNDEF NoXLS}
procedure SaveDBGridToXLSFile(DBGridEh: TCustomDBGridEh; const FileName: String; IsSaveAll: Boolean);
var DBGridExport: TCustomDataGridExportAsXLS;
begin
  DBGridExport := TCustomDataGridExportAsXLS.Create;
  try
    DBGridExport.DBGridEh := DBGridEh;
    DBGridExport.ExportToFile(FileName, IsSaveAll);
  finally
    DBGridExport.Free;
  end;
end;

function ExportToExcelWithDialog(
         Dlg: TSaveDialog; DBGridEh: TCustomDBGridEh; const FileNamePrefix: String; IsSaveAll: Boolean): Integer;
var
  Settings: TFormatSettings;
begin
  Result:= -1;
  if (Dlg.FileName = '') then
  begin
    Settings.DateSeparator := '-';
    Settings.ShortDateFormat := 'dd-mm-yy';
    Dlg.FileName := ExtractFilePath(Application.ExeName) +
      FileNamePrefix + DateToStr(Date(), Settings);
  end;
  if Dlg.Execute then
  begin
    Result:= 0;
    SaveDBGridToXLSFile(DBGridEh, Dlg.FileName, True);
    if FileExists(Dlg.FileName) then
    begin
      ShowMessage('Создан файл: ' + Dlg.FileName);
      Result:= 1;
    end
    else
      ShowMessage('Файл ' + Dlg.FileName + ' не создан!' +
        #10#13 + 'Обратитесь к системному администратору!');
  end;
end;
{$ENDIF}


function IsNan(const Value: Double): Boolean;
begin
Result:= CompareMem(@FNan, @Value, SizeOf(Value));
end;

function GetNan(): Double;
begin
Result:= FNan;
end;

function DetectDataType(s: string): TVarType;
var i, c: Integer; f: Double;
begin
  Val(s, i, c);
  if (c=0) then
     Result:= varInteger else
     begin
       f:= StrToFloatDef(s, GetNan());
       if IsNan(f) then
          Result:= varString else
          Result:= varDouble
     end;
end;

function DetectDataTypeOfItems(Items: TStrings): TVarType;
var i, n: Integer; f: Double;
begin
  Result:= varEmpty;
  if (Items.Count>0) then
  begin
    Result:= DetectDataType(Items[0]);
    for i := 1 to Items.Count-1 do
      if (DetectDataType(Items[i])<>Result) then
        begin
          Result:= varError;
          Exit;
        end;
  end;
end;

function DetectDataTypeVar(s: string; var V: Variant): TVarType;
var i, c: Integer; f: Double; d: TDateTime;
begin
  Val(s, i, c);
  if (c=0) then
  begin
    Result:= varInteger;
    V:= i;
  end
     else
     begin
       d:= StrToDateDef(s, GetNan());
       if not IsNan(d) then
          begin
            V:= d;
            Result:= varDate;
          end else
          begin
            f:= StrToFloatDef(s, GetNan());
            if IsNan(f) then
            begin
              Result:= varString;
              V:= s;
            end
               else
               begin
                 Result:= varDouble;
                 V:= f;
               end;
          end;
     end;
end;

procedure SetParameterInLines(Lines: TStrings; Index: Integer; Key, Value: string);
begin
  Lines[Index] := idParamPrefix + Key + idParamPostfix + Value;
end;

function SetParameterInLinesEx(Lines: TStrings; Key, Value: string; StartIndex: Integer): Integer;
begin
  Result:= GetStartPosIndex(Lines, idParamPrefix + Key, 0, True, StartIndex, False);
  if (Result >= 0) then
     SetParameterInLines(Lines, Result, Key, Value);
end;

function ReplaceSQLParamValue( List: TStrings; Name, Value: string; Quoted: Boolean;
                               StartIndex: Integer = 0; FastReplace: Boolean = False): Boolean;

var i, k: Integer; s: string;
begin
  if Quoted then Value:= QuotedStr(Value);
  if FastReplace then
     Result:= SetParameterInLinesEx(List, Name, Value, StartIndex) >= 0 else
     begin
       Result:= False; s:= ':' + Name;
       k:= GetContainsPosIndex(List, s, 0, 0, True, StartIndex);
       if (k>=0) then
           begin
             i:= AnsiTextPos(s, List[k]);
             // see: Length(idParamPrefix)=5
             if (i>6) and (AnsiStartsText(idParamPrefix+Name, List[k])) then
               begin
                 //if Quoted then Value:= QuotedStr(Value);
                 List[k]:= StuffString(List[k], i, Length(s), Value);
                 Result:= True;
               end;
           end;
     end;
end;

function CopyDataValuesToArray( DataObj: TObject;
                                var Values: TDynVariantArray; Names: string;
                                ResetValues: Boolean = True): Integer;
var i, n, m: Integer; Name: string; F: TField; P: TParam; V: Variant;
begin
  Result:= 0;
  i:= 1; n:= Length(Names);
  Result:= 0;
  if ResetValues then SetLength(Values, 0);
  if (DataObj is TDataSet) or (DataObj is TParams) then
    while (i<=n) do
    begin
      Name:= UpperCase(DB.ExtractFieldName(Names, i));
      if (Name<>'') then
      begin
        V:= Unassigned;
        if (DataObj is TDataSet) then
            begin
            F:= TDataSet(DataObj).FindField(Name);
            if (F<>nil) then V:= F.Value;
            end else
        if (DataObj is TParams) then
           begin
             P := TParams(DataObj).FindParam(Name);
             if P <> nil then
             V := P.Value;
           end;
        if (V<>Unassigned) then
          begin
             Inc(Result);
             if ResetValues then
                SetLength(Values, Result);
             if (Result<=Length(Values)) then
             Values[Result-1]:= V else
             Exit;
          end;
      end;
    end;
end;

function BatchCreateParams(Params: TParams; ParamNames: string; FieldTypes: array of TFieldType): Integer;
var i, k, m, n: Integer; Name: string; F: TField; P: TParam;
begin
  Result:= 0;
  i:= 1; n:= Length(ParamNames); m:= Length(FieldTypes);
    while (i<=n) do
    begin
      Name:= UpperCase(DB.ExtractFieldName(ParamNames, i));
      if (Name<>'') then
      begin
        P := Params.FindParam(Name);
        if (P = nil) and (Result < m) then
           P:= Params.CreateParam(FieldTypes[Result], Name, ptInput);
        Inc(Result);
      end;
    end;
end;

function SetParamValues(Params: TParams; ParamNames: string; ParamValues: array of Variant): Integer;
var i, k, m, n: Integer; Name: string; F: TField; P: TParam;
begin
  Result:= 0;
  i:= 1; n:= Length(ParamNames); m:= Length(ParamValues);
    while (i<=n) do
    begin
      Name:= UpperCase(DB.ExtractFieldName(ParamNames, i));
      if (Name<>'') then
        if (Result < m) then
        begin
          SetParamValue(Params, Name, ParamValues[Result]);
          Inc(Result);
        end;
    end;
end;

function CopyFieldValuesToParams(Source: TDataSet; Dest: TParams; FieldNames: string; SrcNames: string = ''): Integer;
var i, n: Integer; Name, DstNames: string; F: TField; P: TParam;
    i_dst, n_dst: Integer;
begin
  Result:= 0; DstNames:= '';
  if (SrcNames<>'') then
  begin
    DstNames:= FieldNames;
    FieldNames:= SrcNames;
  end;
  i:= 1; n:= Length(FieldNames);
  i_dst:= 1; n_dst:= Length(DstNames);
  Source.Open;
  if (Source.RecordCount>0) then
    while (i<=n) do
    begin
      Name:= UpperCase(DB.ExtractFieldName(FieldNames, i));
      if (Name<>'') then
      begin
        F:= Source.FindField(Name);
        if (F<>nil) then
           begin
            if (i_dst<=n_dst) then
               Name:= UpperCase(DB.ExtractFieldName(DstNames, i_dst));
             P := Dest.FindParam(Name);
             if P = nil then
               P:= Dest.CreateParam(F.DataType, Name, ptInput);
             P.Value := F.Value;
             Inc(Result);
           end;
      end;
    end;
end;

function CopyParamValuesToParams(Source: TParams; Dest: TParams; SrcNames: string; DstNames: string = ''): Integer;
var i_src, i_dst, n_src, n_dst: Integer; Name_s, Name_d: string; P_src, P_dst: TParam;
begin
  Result:= 0;
  i_src:= 1; n_src:= Length(SrcNames);
  i_dst:= 1; n_dst:= Length(DstNames);
    while (i_src<=n_src) do
    begin
      Name_s:= UpperCase(DB.ExtractFieldName(SrcNames, i_src));
      if (Name_s<>'') then
      begin
        P_src:= Source.FindParam(Name_s);
        if (P_src<>nil) then
           begin
            if (i_dst<=n_dst) then
               Name_d:= UpperCase(DB.ExtractFieldName(DstNames, i_dst)) else
               Name_d:= Name_s;
             P_dst := Dest.FindParam(Name_d);
             if P_dst = nil then
               P_dst:= Dest.CreateParam(P_src.DataType, Name_d, ptInput);
             P_dst.Value := P_src.Value;
             Inc(Result);
           end;
      end;
    end;
end;

function BatchCopyParamValues(DataObj: TObject; Source: TParams; SrcNames: string; DstNames: string = ''): Integer;
var i, j, n, k, x: Integer; Name: string; Param: DB.TParam; Dest: TParams;
begin
  Result:= 0;
  if (DataObj is TMSQuery) or (DataObj is TMSSQL) or
     (DataObj is TMSStoredProc) or (DataObj is TStrings) or (DataObj is TParams) then
  begin
    if (DataObj is TMSQuery) then
       TMSQuery(DataObj).Close;
    Dest:= nil;
             if (DataObj is TMSQuery) then
                Dest:= TMSQuery(DataObj).Params else
             if (DataObj is TMSSQL) then
                Dest:= TMSSQL(DataObj).Params else
             if (DataObj is TMSStoredProc) then
                Dest:= TMSStoredProc(DataObj).Params else
             if (DataObj is TParams) then
                 Dest:= TParams(DataObj);
    if (Dest<>nil) then
    Result:= CopyParamValuesToParams(Source, Dest, SrcNames, DstNames);
  end;
end;

//Uses Data
function ReplaceChars(S: string; Chars: string; Replacements: string; Flags: TReplaceFlags; Delimiter: Char = ';'): string; overload;
var i, j, n, k: Integer; Pattern: string;
begin
  Result:= S;
  n:= Length(Chars);
  k:= Length(Replacements);
  for i := 1 to n do
  begin
    if (j<=k) then
       Pattern:= ExtractParamField(Replacements, j, Delimiter) else
       Break;
    Result:= StringReplace(Result, Chars[i], Pattern, Flags);
  end;
end;

function ReplaceChars(const S: string; MinChar, MaxChar: Char; NewPattern: string; Flags: TReplaceFlags): string; overload;
var Ch: Char;
begin
  Result:= S;
for Ch := MinChar to MaxChar do
    if Pos(Ch, Result) > 0 then
       Result:= StringReplace(Result, Ch, NewPattern, Flags);
end;

function HTMLReplaceChars(S: string): string;
const
  Chars = '"&><''';
  Replace = '|quot;|amp;|gt;|lt;|apos';
begin
  Result:= ReplaceChars(S, Chars, Replace, [rfReplaceAll]);
  Result:= StringReplace(Result, '|', '&', [rfReplaceAll]);
end;

procedure AssignParamValuesToNull(Params: TParams; ParamNames: array of String);
var i, n, k: Integer; Param: DB.TParam;
begin
  n:= Length(ParamNames);
for i := 0 to Params.Count - 1 do
  begin
    Param:= Params[i];
    if (n=0) or (AnsiIndexText(Param.Name, ParamNames)>=0) then
      Param.Value:= Null;
  end;
end;

function BatchAssignParamValues( DataObj: TObject; FieldNames: string; Values: array of Variant;
                                 StartLineIndex: Integer = 0; FastReplace: Boolean = False;
                                 DoOpen: Boolean = False): Integer;
var i, j, n, k, x: Integer; Name: string; Param: DB.TParam;
begin
  Result:= 0;
  if (DataObj is TMSQuery) or (DataObj is TMSSQL) or
     (DataObj is TMSStoredProc) or (DataObj is TStrings) or (DataObj is TParams) then
  begin
    i:= 1; j:= 0; n:= Length(FieldNames); k:= Length(Values);
    if (DataObj is TMSQuery) then
       TMSQuery(DataObj).Close else
    if (DataObj is TMSStoredProc) then
       TMSStoredProc(DataObj).Close;
    while (i<n) do
    begin
        Name:=  DB.ExtractFieldName(FieldNames, i);
        if (Name<>'') then
         begin
             Param:= nil;
             if (DataObj is TMSQuery) then
                Param:= TMSQuery(DataObj).FindParam(Name) else
             if (DataObj is TMSSQL) then
                Param:= TMSSQL(DataObj).FindParam(Name) else
             if (DataObj is TMSStoredProc) then
                Param:= TMSStoredProc(DataObj).FindParam(Name) else
             if (DataObj is TParams) then
                 Param:= TParams(DataObj).FindParam(Name);
                if (Param<>nil) and (j<k) then
                begin
                  Param.Value:= Values[j];
                  Inc(Result);
                end else
                if (DataObj is TStrings) and (j<k) then
                   if ReplaceSQLParamValue(TStrings(DataObj), Name,
                      VarToStr(Values[j]), VarIsType(Values[j], [varOleStr, varString, varDate]),
                      StartLineIndex, FastReplace) then
                      Inc(Result);
             Inc(j);
         end;
    end;
  end;
end;

function HandleCustomPropList(
         const UserNo: Integer; const OwnerName, ObjName, PropName: String; PropList: TMemoryStream;
         DoRead: Boolean = True): Integer;
const
  Insert_Template = 'INSERT INTO PropertyList(ID, UserNo, OwnerName, ObjName, PropName) ' +
                    'Values((SELECT ISNULL(MAX(ID), 0) + 1 FROM PropertyList), %d, ''%s'', ''%s''';//')';
  StrArg = ', ''%s'''; //')';
  Paren = ')';
var qry: TMSQuery; sql, tmp: String; RecNum: Integer;
begin
  Result:= -1;
  qry:= MlkData.dmDataModule.quPropertyList;
  if BatchAssignParamValues(qry, 'UserNo;OwnerName;ObjName;PropName', [UserNo, OwnerName, ObjName, PropName])=4 then
  begin
    qry.Open;
    RecNum:= qry.RecordCount;
      if (RecNum>1) then Exit;
      if DoRead then
        begin
          Result:= 0;
          if (RecNum=1) then
             Result:= UnpackStreamFromBlob(PropList, qry.FieldByName('PropList'));
        end else
        begin
          if RecNum=0 then
             begin
               if PropName='' then
               sql:= Format(Insert_Template, [UserNo, OwnerName, ObjName]) else
               sql:= Format(Insert_Template + StrArg, [UserNo, OwnerName, ObjName, PropName]);
               dmDataModule.ExecSQL(sql + Paren);
               qry.Refresh;
             end;
          Result:= PackStreamToBlob(PropList, qry.FieldByName('PropList'));
        end;
    end;
end;

{
function GetColumnPropList( Grid: TCustomControl; FieldNames, PropNames: string;
                            Delim1: string = ';'; Delim2: string = ','): string;
}
function ParseColumnPropList( Grid: TCustomControl; PropList: String; Delim1: Char = ';'; Delim2: Char = '|';
                              CustomPropValueFunc: TSetPropValueFunc = nil; PropNames: string = ''): Integer;
var i, n, k, m, p: Integer; FName, FProps, Prop, Value: String;
    Cols: TCollection; Item: TCollectionItem; PropItems: TStringList;
begin
  Result:= 0;
  Cols:= GetColumnCollection(Grid);
  if (Cols = nil) then Exit;
  i:= 1; n:= Length(PropList);
  Cols.BeginUpdate; PropItems:= nil;
  if (PropNames<>'') then
  begin
    PropItems:= TStringList.Create;
    ExtractParamFields(PropNames, PropItems);
  end;
  try
    while i <= n do
    begin
    // ID=(Index=0;Visible=True;Width=64;Title.Caption='ID')|
      if SplitStrWithCharSafe(ExtractParamField(PropList, i, Delim2), @FName, @FProps, '=', True) then
         if IsQuotedStr(FProps, '()') then
           begin
             Item:= FindColumnInGridCollection(Cols, FName);
             if (Item <> nil) then
             begin
               FProps:= DequoteStr(FProps, '()');
               k:= 1; m:= Length(FProps);
               while k <= m do
               if SplitStrWithCharSafe(ExtractParamField(FProps, k, Delim1), @Prop, @Value, '=', True) then
               begin
                 Value:= DequoteStr(Value, '''');
                 p:= StrToIntDef(Prop, -1);
                 if (p>=0) and (PropItems <> nil) and (p<PropItems.Count) then
                     Prop:= PropItems[p];
                 if SetObjPropValue(Item, Prop, Value) or
                    (Assigned(CustomPropValueFunc) and CustomPropValueFunc(Item, Prop, Value)) then
                    Inc(Result);
               end;
             end;
           end;
    end;
  finally
  Cols.EndUpdate;
  PropItems.Free;
  end;          
end;

function HandleColumnPropListInStream(
         const Grid: TCustomControl; const PropList: TStream; const DoRead: Boolean = True;
         const FieldNames: string = ''; PropNames: string = '';
         const CustomPropValueFunc: TSetPropValueFunc = nil;
         const PropNamesPtr: PString = nil): Integer;
const
  Delim1 = ';';
  Delim2 = '|';
  PrefixForPropNames = '[PropNames]=';
  FormatForPropNames = PrefixForPropNames + '%s|%s';
var Size, p: Integer; Owner: TComponent;
    s, OwnerName: string;
begin
  Result:= 0;
  if (not DoRead) then
  begin
    s:= GetColumnPropList(Grid, FieldNames, PropNames, Delim1, Delim2, True);
    if (PropNamesPtr<>nil) and (PropNames<>'') then
       s:= Format(FormatForPropNames, [PropNames, s]);
    Result:= Length(s);
    PropList.WriteBuffer(Pointer(s)^, Result);
  end else
  begin
    if (PropList.Size>0) then
        begin
          Result:= PropList.Size;
          SetLength(s, Result);
          PropList.Position:= 0;
          PropList.ReadBuffer(Pointer(s)^, Result);
          if (Pos(PrefixForPropNames, s) = 1) then
             begin
               p:= Pos('|', s);
               if (p>0) then
               begin
                 Size:= p - Length(PrefixForPropNames) - 1;
                 if (Size > 0) then
                 begin
                   PropNames:= Copy(s, Length(PrefixForPropNames)+1, Size);
                   if PropNamesPtr <> nil then PropNamesPtr^:= PropNames;
                   Delete(s, 1, p);
                 end;
               end;
             end;
          Size:= ParseColumnPropList(Grid, s, Delim1, Delim2, CustomPropValueFunc, PropNames);
          if (Size = 0) then Result:= 0;
        end;
  end;
end;

function HandleColumnPropList(
         const UserNo: Integer; const Grid: TCustomControl; const DoRead: Boolean = True;
         const FieldNames: string = ''; PropNames: string = '';
         const CustomPropValueFunc: TSetPropValueFunc = nil;
         const PropNamesPtr: PString = nil;
         const UseOwnerClassName: Boolean = True): Integer;
const
  Delim1 = ';';
  Delim2 = '|';
  PrefixForPropNames = '[PropNames]=';
  FormatForPropNames = PrefixForPropNames + '%s|%s';
var PropList: TMemoryStream; Size, p: Integer; Owner: TComponent;
    s, OwnerName: string;
begin
  Result:= 0;
  PropList:= TMemoryStream.Create;
  try
    Owner:= Grid.Owner;
    if UseOwnerClassName then
       OwnerName:= Copy(Owner.ClassName, 2, MaxInt) else
       OwnerName:= Owner.Name;
    if (not DoRead) then
    begin
      Size:= HandleColumnPropListInStream( Grid, PropList, DoRead, FieldNames, PropNames,
                                           nil, PropNamesPtr);
      if (Size > 0) then
      Result:= HandleCustomPropList(UserNo, OwnerName, Grid.Name, 'Columns', PropList, DoRead);
    end else
    begin
      Result:= HandleCustomPropList(UserNo, OwnerName, Grid.Name, 'Columns', PropList, DoRead);
      if (Result>0) then
          begin
            Size:= HandleColumnPropListInStream( Grid, PropList, DoRead, FieldNames, PropNames,
                                                 CustomPropValueFunc, PropNamesPtr);
            if (Size = 0) then Result:= 0;
          end;
    end;
  finally
    PropList.Free;
  end;
end;

function HandleCustomSettingsValue(
         const Section, Ident: string;
         var Value: string; VType: PString = nil;
         DefValue: string = ''; DoRead: Boolean = True): Integer;
const
  Update_Template = 'UPDATE CustomSettings SET Value=''%s'' WHERE  Section = ''%s'' and Ident = ''%s''';
  Insert_Template = 'INSERT INTO CustomSettings(Section, Ident, VType, Value) Values(''%s'', ''%s'', %s, ''%s'')';
var qry: TMSQuery; sql, vt: String;
begin
  Result:= -1;
  qry:= MlkData.dmDataModule.quCustomSettings;
  if BatchAssignParamValues(qry, 'Section;Ident', [Section, Ident])=2 then
    begin
      qry.Open; Result:= qry.RecordCount;
      if (Result>1) then Exit;
      if DoRead then
        begin
          Value:= DefValue; if (VType<>nil) then VType^:= '';
          if Result = 1 then
          begin
            Value:= VarToStr(qry.FieldByName('Value').Value);
            if (VType<>nil) then VType^:= VarToStr(qry.FieldByName('VType').Value);
          end;
        end else
        begin
          if Result=1 then
             sql:= Format(Update_Template, [Value, Section, Ident]) else
             begin
               if (VType=nil) then vt:= 'NULL'
                              else vt:= AnsiQuotedStr(VType^, '''');
               sql:= Format(Insert_Template, [Section, Ident, vt, Value]);
             end;
          dmDataModule.ExecSQL(sql);
          Result:= 1;
        end;
    end;
end;

function SafeAssignEntityValue(DataSet: TDataSet; Name: string; Value: Variant;
    Entity: Char; OpenAfterAssign: Boolean = True): Boolean;
var Macro: DBAccess.TMacro;
    Param: DB.TParam;
    Field: DB.TField;
    Query: TMSQuery;
begin
  Result:= False;
  Entity:= UpCase(Entity);
  if (Entity=entField) then
  begin
    Field:= DataSet.FindField(Name);
    if (Field<>nil) then
    begin
      DataSet.Open;
      DataSet.Edit;
      Field.Value:= Value;
      DataSet.Post;
      Result:= True;
    end;
  end else
  if (DataSet is TMSQuery) then
  begin
    Query:= TMSQuery(DataSet);
    if (Entity=entMacro) then
    begin
      Macro:= Query.FindMacro(Name);
      if (Macro<>nil) then
      begin
        Query.Close;
        Macro.Value:= Value;
        Result:= True;
      end;
    end else
    if (Entity=entParam) then
    begin
      Param:= Query.FindParam(Name);
      if (Param<>nil) then
      begin
        Query.Close;
        Param.Value:= Value;
        Result:= True;
      end;
    end;
    if Result and OpenAfterAssign then Query.Open;
  end;
end;

function FindFirstClass(WinControl: TWinControl; ObjClass: TClass; SkipObj: TObject = nil): TControl;
var i: Integer;
begin
for i := 0 to WinControl.ControlCount-1 do
begin
Result:= WinControl.Controls[i];
if (Result is ObjClass) then
   if (Result=SkipObj) then
       Result:=nil else
       exit;
end;
Result:= nil;
end;

function SaveDataSetValues(DataSet: TDataSet): Boolean;
begin
  Result:= DataSet.Active;
  if Result then
  if (DataSet.State in [dsEdit, dsInsert]) then
    DataSet.Post;
end;

function EditDataSetValues(DataSet: TDataSet): Boolean;
begin
  Result:= DataSet.Active;
  if Result then
  if not (DataSet.State in [dsEdit, dsInsert]) then
    DataSet.Edit;
end;

function GetFieldValueList(DataSet: TDataSet; KeyField, TextField, Delimiter:
    string): string;
var KeyValue: Variant; DataField: TField; Bookmark: TBookmark;
begin
  Result:= '';
  if (DataSet=nil) or (not DataSet.Active) then Exit;
  DataSet.DisableControls;
  Bookmark:= DataSet.GetBookmark;
  try
    KeyValue:= null;
    DataField:= DataSet.FieldByName(TextField);
    if (KeyField<>'') then KeyValue:= DataSet.FieldByName(KeyField).Value;
    DataSet.First;
    while not DataSet.Eof do
    begin
      Result:= Result + VarToStr(DataField.Value);
      DataSet.Next;
      if (not DataSet.Eof) then
         Result:= Result + Delimiter;
    end;
    if (KeyField<>'') and (not VarIsNull(KeyValue)) then
       DataSet.Locate(KeyField, KeyValue, []) else
       DataSet.GotoBookmark(Bookmark);
  finally
  DataSet.FreeBookmark(Bookmark);
  DataSet.EnableControls;
  end;
end;

function GetFieldValueList(DataSet: TDataSet; KeyField, TextField, Delimiter:
    string; List: TStrings; AddObjects: Boolean = True): Integer;
var KeyValue: Variant; DataField: TField; i: Integer;
begin
  Result:= -1;
  if (DataSet=nil) or (not DataSet.Active) then Exit;
  DataSet.DisableControls;
  List.BeginUpdate;
  try
    KeyValue:= null;
    DataField:= DataSet.FieldByName(TextField);
    if (KeyField<>'') then KeyValue:= DataSet.FieldByName(KeyField).Value;
    List.Clear; DataSet.First; i:= 0;
    while not DataSet.Eof do
    begin
      List.AddObject(VarToStr(DataField.Value), Pointer(i));
      if AddObjects then Inc(i);
      DataSet.Next;
    end;
    if (KeyField<>'') and (not VarIsNull(KeyValue)) then
       DataSet.FieldByName(KeyField).Value:= KeyValue;
    Result:= List.Count;
  finally
  List.EndUpdate;
  DataSet.EnableControls;
  end;
end;

function GetListValues(List: TStrings; Delimiter: string = ';'; DoTrim: Boolean
    = True): string;
var
  i: Integer; s: string;
begin
  Result:= '';
  for i := 0 to List.Count-1 do
  begin
    if DoTrim then s:= Trim(List[i])
              else s:= List[i];
    if (s<>'') then
    Result:= Result + s + Delimiter;
  end;
  if (Result<>'') then
     Result:= TrimStrWithDelim(Result, Delimiter, False);
end;

function GetObjPropTypeKind(Instance: TObject; PropName: string): TTypeKind;
var
  PropInfo: PPropInfo; SProp: string; i, n: Integer;
begin
  Result:= tkUnknown;
  i:=1; n:= Length(PropName);
  while (i<n) and (Instance<>nil) do
  begin
    SProp:= ExtractParamField(PropName, i, '.');
    PropInfo := GetPropInfo(Instance, SProp);
    if PropInfo <> nil then
      if (PropInfo^.PropType^.Kind<>tkClass) then
         if (i>=n) then
         begin
           Result:= PropInfo^.PropType^.Kind;
         end
             else
            Result:= tkUnknown else
            Instance:= GetObjectProp(Instance, SProp);
  end;
end;

function GetObjPropInfo(Instance: TObject; PropName: string): PPropInfo;
var
  PropInfo: PPropInfo; SProp: string; i, n: Integer;
begin
  Result:= nil;
  i:=1; n:= Length(PropName);
  while (i<n) and (Instance<>nil) do
  begin
    SProp:= ExtractParamField(PropName, i, '.');
    PropInfo := GetPropInfo(Instance, SProp);
    if PropInfo <> nil then
      if (PropInfo^.PropType^.Kind<>tkClass) then
         if (i>=n) then
         begin
           Result:= PropInfo;
         end
             else
            Result:= nil else
            Instance:= GetObjectProp(Instance, SProp);
  end;
end;

procedure GetTypeInfoForOrdinal(OrdTypeInfo: Pointer; AStrings: TStrings);
var
  AOrdTypeInfo: PTypeInfo;
  OrdTypeData: PTypeData;
  MinVal, MaxVal: Integer;
  i: integer;
begin
  AOrdTypeInfo:= PTypeInfo(OrdTypeInfo);
  // Get the TTypeData pointer
  OrdTypeData := GetTypeData(AOrdTypeInfo);
  // Get the minimum and maximum values for the type
  MinVal := OrdTypeData^.MinValue;
  MaxVal := OrdTypeData^.MaxValue;
  // Add the information to the memo
  with AStrings do
  begin
  BeginUpdate;
  try
    // Call this function recursively to show the enumeration
    // values for this set type.
    if AOrdTypeInfo^.Kind = tkSet then
    begin
    AStrings.Clear;
      GetTypeInfoForOrdinal(OrdTypeData^.CompType^, AStrings);
    end else
    // Show the values and names of the enumerated types belonging to the
    // set.
        if AOrdTypeInfo^.Kind = tkEnumeration then
    begin
    AStrings.Clear;
      for i := MinVal to MaxVal do
        Add(GetEnumName(AOrdTypeInfo, i));
    end;
  finally
  EndUpdate;
  end;
  end;
end;

function GetOrdinalNameList(OrdTypeInfo: Pointer; Delimiter: Char = ';'): String;
var List: TStringList;
begin
  List:= TStringList.Create;
  try
    GetTypeInfoForOrdinal(OrdTypeInfo, List);
    Result:= GetDelimText(List, Delimiter);
  finally
    List.Free;
  end;
end;

function GetObjPropValue(Instance: TObject; PropName: string; Quote: Char = ''''; PreferStrings: Boolean = True): Variant;
var
  PropInfo: PPropInfo; SProp: string; i, n: Integer;
begin
  i:=1; n:= Length(PropName); Result:= Null;
  while (i<n) and (Instance<>nil) do
  begin
    SProp:= ExtractParamField(PropName, i, '.');
    PropInfo := GetPropInfo(Instance, SProp);
    if PropInfo <> nil then
       if (PropInfo^.PropType^.Kind<>tkClass) then
          if (i>=n) then
          begin
            Result:= GetPropValue(Instance, SProp, PreferStrings);
            if (not PreferStrings) and (PropInfo^.PropType^.Kind = tkEnumeration) then
            if VarIsType(Result, varBoolean) then
               Result:= Ord(Result = True) else else
            if (Quote<>#0) and
               (PropInfo^.PropType^.Kind in [tkString, tkWChar, tkLString, tkWString]) then
               Result:= Quote + Result + Quote;
          end
              else
             Result:= Null else
             Instance:= GetObjectProp(Instance, SProp);
  end;
end;

function GetColumnPropValueExt(Instance: TObject; PropName: string): Variant;
begin
  if SameText(PropName, 'Index') then
     Result:= TCollectionItem(Instance).Index else
  Result:= GetObjPropValue(Instance, PropName, #0, False);
end;

function GetObjectPropLong(Instance: TObject; PropName: string; GetLastObj: Boolean = False): TObject;
var
  PropInfo: PPropInfo; SProp: string; i, n: Integer;
begin
  i:=1; n:= Length(PropName);
  Result:= nil;
  while (i<n) and (Instance<>nil) do
  begin
    SProp:= ExtractParamField(PropName, i, '.');
    PropInfo := GetPropInfo(Instance, SProp);
    if (PropInfo <> nil) and (PropInfo^.PropType^.Kind=tkClass) then
       Instance:= GetObjectProp(Instance, SProp) else
       Instance:= nil;
    if (Instance <> nil) then Result:= Instance;
  end;
  if GetLastObj then Result:= Instance;
end;

function SetObjPropValue(Instance: TObject; PropName: string; Value: Variant; DetectVarType: Boolean = True): Boolean;
const
  Quote: Char = '''';
var
  PropInfo: PPropInfo; SProp: string; i, n: Integer;
  V: Variant; t: TVarType; k: TTypeKind; GoodVar: Boolean;
begin
  i:=1; n:= Length(PropName); Result:= False;
  while (i<n) and (Instance<>nil) do
  begin
    SProp:= ExtractParamField(PropName, i, '.');
    PropInfo := GetPropInfo(Instance, SProp);
    if PropInfo <> nil then
    begin
      k:= PropInfo^.PropType^.Kind;
      if (k<>tkClass) then
         if (i>=n) then
         begin
           if DetectVarType then
           begin
             t:= varString;
             if IsQuotedStr(Value, Quote) then
                V:= DequoteStr(Value, Quote) else
                t:= DetectDataTypeVar(Value, V);
           end else
             t:= VarType(Value);
           GoodVar:= False;
           case k of
           tkInteger: GoodVar:= (t=varInteger);
           tkFloat:   GoodVar:= (t=varDouble) or (t=varDate);
           tkSet: GoodVar:= (t=varString);
           tkEnumeration: GoodVar:= (t=varString) or (t=varInteger);
           tkString, tkLString:
             begin
               GoodVar:= (t=varString) or
                         (t=varInteger) or
                         (t=varDouble) or
                         (t=varDate);
               if GoodVar and (t<>varString) then
                  V:= VarToStr(Value);
             end;
           end;
           if GoodVar then
              SetPropValue(Instance, SProp, V);
           Result:= True;
         end else else
         Instance:= GetObjectProp(Instance, SProp);
    end;
  end;
end;

function GetChildPropValue(Comp: TComponent; PropName: string; Quote: Char = #0; PreferStrings: Boolean = True): Variant;
var
  PropInfo: PPropInfo; SProp: string; i, n: Integer; Child: TComponent;
begin
  i:=1; n:= Length(PropName); Result:= Null;
  SProp:= ExtractParamField(PropName, i, '.');
  Child:= Comp.FindComponent(SProp);
  if (Child <> nil) then
      Result:= GetObjPropValue(Child, Copy(PropName, i, MaxInt), Quote, PreferStrings);
end;

function SetChildPropValue(Comp: TComponent; PropName: string; Value: Variant; DetectVarType: Boolean = True): Boolean;
var
  PropInfo: PPropInfo; SProp: string; i, n: Integer; Child: TComponent;
begin
  i:=1; n:= Length(PropName); Result:= False;
  SProp:= ExtractParamField(PropName, i, '.');
  Child:= Comp.FindComponent(SProp);
  if (Child <> nil) then
      Result:= SetObjPropValue(Child, Copy(PropName, i, MaxInt), Value, DetectVarType);
end;

function SetObjPropValues(Instance: TObject; PropNames: string; Values: TDynStringArray; Delimiter: Char = ';'): Integer;
var SProp: string; i, j, k, n: Integer;
begin
  Result:= 0;
  i:=1; j:=0; n:= Length(PropNames); k:= Length(Values);
  if (Instance<>nil) then
  while (i<n) and (j<k) do
  begin
    SProp:= ExtractParamField(PropNames, i, Delimiter);
    if SetObjPropValue(Instance, SProp, Values[j]) then
       Inc(Result);
    Inc(j);
  end;
end;

function ConvertPropValuesOfObject( Instance: TObject; PropValues: string;
                                    var Values: TDynStringArray;
                                    FillValues: Boolean = True;
                                    PropDelim: Char = ';';
                                    EquChar: Char = '='): String;
var SProp, S1, S2: string; i, j, k, n: Integer;
begin
  Result:= '';
  i:=1; j:=0; n:= Length(PropValues);
  SetLength(Values, 0);
  if (Instance<>nil) then
  while (i<n) do
  begin
    SProp:= ExtractParamField(PropValues, i, PropDelim);
    if SplitStrWithCharSafe(SProp, @S1, @S2, EquChar, True) then
       begin
         Result:= Result + S1 + ';';
         Inc(j);
         SetLength(Values, j);
         Values[j-1]:= S2;
       end;
  end;
end;

function IndexOfTypeKind(const Value: TTypeKind; const TypeKinds: array of TTypeKind): Integer;
begin
  for Result := 0 to High(TypeKinds) do
    if TypeKinds[Result]= Value then Exit;
  Result:= -1;
end;

function GetComponentProperties(
         Instance: TPersistent; AList: TStrings; ExcludeTypeKinds: array of TTypeKind): Integer;
// Source: http://www.delphigroups.info/2/64/515492.html
// RTTI getting list of published properties
var
  I, Count: Integer;
  PropInfo: PPropInfo;
  PropList: PPropList;
begin
  Result := 0;
  AList.BeginUpdate;
  try
    AList.Clear;
    Count := GetTypeData(Instance.ClassInfo)^.PropCount;
    if Count > 0 then
    begin
      GetMem(PropList, Count * SizeOf(Pointer));
      try
        GetPropInfos(Instance.ClassInfo, PropList);
        for I := 0 to Count - 1 do
        begin
          PropInfo := PropList^[I];
          if PropInfo = nil then Break;
          //if IsStoredProp(Instance, PropInfo) then
          begin
            if (Length(ExcludeTypeKinds) = 0) or
                (IndexOfTypeKind(PropInfo^.PropType^.Kind, ExcludeTypeKinds) < 0) then
                AList.Add(PropInfo^.Name);
            {
            case PropInfo^.PropType^.Kind of
              tkInteger:
              tkMethod:
              tkClass:
              ...
            end;
            }
          end;
        end;
      finally
        FreeMem(PropList, Count * SizeOf(Pointer));
      end;
    end;
  finally
  Result := AList.Count;
  AList.EndUpdate;
  end;          
end;

procedure ExpandComponentProperties(Instance: TPersistent; AList: TStrings; ExpandProps: array of ShortString);
var i, k: Integer; s: ShortString;
    Properties: TStringList;
    PropObj: TObject;
begin
  Properties:= TStringList.Create;
  try
    for i := 0 to High(ExpandProps) do
      begin
        s:= ExpandProps[i];
        k:= GetSameTextIndex(AList, s);
        if (k>=0) then
           begin
             PropObj:= GetObjectPropLong(Instance, s);
             if (PropObj <> nil) and (PropObj is TPersistent) then
             begin
               GetComponentProperties(TPersistent(PropObj), Properties, [tkMethod]);
               if (Properties.Count > 0) then
                  begin
                    AList.Delete(k);
                    for k := 0 to Properties.Count - 1 do
                      AList.Add(s + '.' + Properties[k]);
                  end;
             end;
           end;
      end;
  finally
    Properties.Free;
  end;
end;

function GetDBGridColumnFields(Grid: TObject; OnlyVisible: Boolean = True; Delim: string = ';'): string;
var i: Integer;
begin
  Result:= '';
  if (Grid is TDBGridEh) then
     with TDBGridEh(Grid) do
     begin
       for i := 0 to Columns.Count-1 do
         with Columns[i] do
         if (not OnlyVisible) or Visible then
            Result:= Result + FieldName + Delim;
     end else
  if (Grid is TDBGrid) then
     with TDBGrid(Grid) do
     begin
       for i := 0 to Columns.Count-1 do
         with Columns[i] do
         if (not OnlyVisible) or Visible then
            Result:= Result + FieldName + Delim;
     end;
end;

function GetFieldPropList( DataSet: TDataSet; FieldNames, PropNames: string;
                           Delim1: string = ';'; Delim2: string = ','): string;
const
  SIdx = 'Index';
  SVis = 'Visible';
  SWid = 'DisplayWidth';
  STit = 'DisplayLabel';
  SAll =  SIdx + ';' + SVis + ';' + SWid + ';' + STit;
var FIndex, PIndex: Integer; SField, SProp, SName, SValue: string; LFields, LProps: Integer;
    FList: TFieldList; Field: TField;
begin
  Result:= '';
  FList:= DataSet.FieldList;
  // TFieldList is inherited from TStrings
  if (FieldNames='') then FieldNames:= GetDelimText(FList, ';');
  FIndex:= 1;
  LFields:= Length(FieldNames);
  if (PropNames='') then PropNames:= SAll;
  LProps:= Length(PropNames);
  while (FIndex<LFields) do
  begin
    SField:= DB.ExtractFieldName(FieldNames, FIndex);
    Field:= FList.Find(SField); SValue:= '';
    if (Field<>nil) then
       begin
         Result:= Result + SField + '(';
         PIndex:= 1;
         while (PIndex<LProps) do
          begin
          SName:= DB.ExtractFieldName(PropNames, PIndex);
          SValue:= VarToStr(GetObjPropValue(Field, SName));
          if (SValue<>'') then Result:= Result + SName + '=' + SValue + Delim1;
          end;
          Result:= TrimStrWithDelim(Result, Delim1, False);
          Result:= Result + ')' + Delim2;
       end;
  end;
end;

function GetColumnIndexFast(Column: TCollectionItem): Integer;
begin
  Result:= -1;
  if (Column is TColumnEh) then
     Result:= TColumnEh(Column).Index else
  if (Column is TColumn) then
     Result:= TColumn(Column).Index;
end;

function GetColumnPropList( Grid: TCustomControl; FieldNames, PropNames: string;
                            Delim1: string = ';'; Delim2: string = ','; UsePropIndexes: Boolean = False): string;
const
  SIdx = 'Index';
  SVis = 'Visible';
  SWid = 'Width';
  STit = 'Title.Caption';
  SAll =  SIdx + ';' + SVis + ';' + SWid + ';' + STit;
var FIndex, PIndex, Index: Integer; SField, SProp, SName, SValue: string; LFields, LProps: Integer;
    Column: TCollectionItem;
begin
  Result:= '';
  //FList:= DataSet.FieldList;
  // TFieldList is inherited from TStrings
  if (FieldNames='') then FieldNames:= GetDBGridColumnFields(Grid, False, ';');
  FIndex:= 1;
  LFields:= Length(FieldNames);
  if (PropNames='') then PropNames:= SAll;
  LProps:= Length(PropNames);
  while (FIndex<LFields) do
  begin
    SField:= DB.ExtractFieldName(FieldNames, FIndex);
    Column:= FindDBGridColumn(Grid, SField);
    if (Column<>nil) then
       begin
         Result:= Result + SField + '=('; // Enable extracting in INI-files
         PIndex:= 1; Index:= 0;
         while (PIndex<LProps) do
          begin
          SName:= DB.ExtractFieldName(PropNames, PIndex);
          if SameText(SName, SIdx) then
             SValue:= IntToStr(GetColumnIndexFast(Column)) else
             SValue:= VarToStr(GetObjPropValue(Column, SName));
          if UsePropIndexes then SName:= IntToStr(Index);
          if (SValue<>'') then Result:= Result + SName + '=' + SValue + Delim1;
          Inc(Index);
          end;
          Result:= TrimStrWithDelim(Result, Delim1);
          Result:= Result + ')' + Delim2;
       end;
  end;
end;

procedure CopyStrToClipboard(s: string; MessageFormat: string = ''; MessageOnEmpty: string = '');
begin
  if (Length(s)=0) then
     if (MessageOnEmpty<>'') then
     ShowMessage(MessageOnEmpty) else else
     begin
       Clipboard.AsText:= s;
       if (MessageFormat<>'') then
       ShowMessage(Format(MessageFormat, [Length(s)]));
     end;
end;

function GetStrFromClipboard(): string;
begin
  Result:= '';
  if Clipboard.HasFormat(CF_TEXT) then
     Result:= Clipboard.AsText;
end;

function AddSystemMenuItem(SysMenu: HMenu; CommandID: DWORD; AText: PChar; AddSeparator: Boolean): Boolean;
begin
  Result:= False;
  if AddSeparator then
     AppendMenu(SysMenu, MF_SEPARATOR, 0, '') ;
  AppendMenu(SysMenu, MF_STRING, CommandID, AText) ;
end;

function SetSystemMenuItemText(SysMenu: HMenu; CommandID: DWORD; AText: PChar): Boolean;
// Source: http://www.cnblogs.com/tonysuen/articles/1605503.html
var
  MenuItemInfo : TMenuItemInfo;
begin
  FillChar(MenuItemInfo,SizeOf(TMenuItemInfo), #0) ;
  MenuItemInfo.cbSize := SizeOf(TMenuItemInfo) ;
  MenuItemInfo.fMask := MIIM_TYPE or MIIM_ID or MIIM_STATE;
  MenuItemInfo.fType := MFT_STRING;
  MenuItemInfo.wId := CommandID;
  MenuItemInfo.dwTypeData := AText;
  MenuItemInfo.cch := StrLen(AText) ;
  SetMenuItemInfo(SysMenu, CommandID, FALSE, MenuItemInfo) ;
end;

function SetSystemMenuItemState(SysMenu: HMenu; CommandID: DWORD; AState: UINT): Boolean;
var
  MenuItemInfo : TMenuItemInfo;
begin
  FillChar(MenuItemInfo,SizeOf(TMenuItemInfo), #0) ;
  MenuItemInfo.cbSize := SizeOf(TMenuItemInfo) ;
  MenuItemInfo.fMask := MIIM_ID or MIIM_STATE;
  MenuItemInfo.fState := AState;
  MenuItemInfo.wId := CommandID;
  SetMenuItemInfo(SysMenu, CommandID, FALSE, MenuItemInfo);
end;

function CheckSystemMenuItem(SysMenu: HMenu; CommandID: DWORD; IsChecked: Boolean): Boolean;
const
  BoolChecks: array[Boolean] of UINT = (MF_UNCHECKED, MF_CHECKED);
begin
  CheckMenuItem(SysMenu, CommandID, MF_BYCOMMAND + BoolChecks[IsChecked]);
end;

function ToggleWinControlVisibility(WinControl: TWinControl; Splitter: TSplitter; State: Integer = -1): Boolean;
var VState: Integer;
begin
  if WinControl.Align in [alTop, alBottom, alLeft, alRight] then
  begin
    VState:= Ord(WinControl.Visible);
    if (State=-2) then State:= 1 - VState;
    if (State <> VState) then
    begin
      if (State=-1) then State:= VState;
      if (State = 0) then
         begin
           WinControl.Visible:= False;
           Splitter.Visible:= False;
         end else
         begin
           case WinControl.Align of
             alLeft, alTop:
             begin
               Splitter.Visible:= True;
               WinControl.Visible:= True;
             end;
             alBottom, alRight:
             begin
               WinControl.Visible:= True;
               Splitter.Visible:= True;
             end;
           end;
         end;
    end;
  end;
  Result:= WinControl.Visible;
end;

function ToggleWinControlLayOut( WinControl, Neighbour: TWinControl; Splitter: TSplitter;
                                 Horiz: Integer = -1; Shift: Integer = 0): Boolean;
var VState: Integer;
begin
  if (WinControl.Align in [alTop, alBottom, alLeft, alRight]) and (WinControl.Visible) then
  begin
    VState:= Ord(WinControl.Align in [alLeft, alRight]);
    if (Horiz <> VState) then
       begin
        if (Horiz=-1) then Horiz:= VState;
        Neighbour.Visible:= False;
        if Horiz = 1 then
           begin
            WinControl.Align:= alRight;
            WinControl.Width:= WinControl.Parent.ClientWidth div 2 - Shift;
            Splitter.Align:= alRight;
           end else
           begin
            WinControl.Align:= alBottom;
            WinControl.Height:= WinControl.Parent.ClientHeight div 2 - Shift;
            Splitter.Align:= alBottom;
           end;
        Neighbour.Visible:= True;
        Neighbour.Refresh;
        WinControl.Refresh;
       end;
  end;
  Result:= (WinControl.Align in [alLeft, alRight]);
end;

function SetStatusPanelText(StatusBar: TStatusBar; Index: Integer; AText: String): Boolean;
begin
  Result:= True;
  if StatusBar.SimplePanel then
     StatusBar.SimpleText:= AText else
     if (Index < 0) or (Index >= StatusBar.Panels.Count) then
        Result:= False else
        StatusBar.Panels[Index].Text:= AText;
end;

function IndexOfPanelUnderMouse(StatusBar: TStatusBar; AX: Integer): Integer;
var X, W: Integer;
begin
  Result:= -1; X:= 0;
  for Result := 0 to StatusBar.Panels.Count - 1 do
  begin
    W:= StatusBar.Panels[Result].Width;
    if (AX > X) and (AX < X + W) then Exit;
    Inc(X, W);
  end;
  Result:= -1;
end;

function IndexOfColumnTitleUnderMouse(Grid: TCustomControl; AX, AY: Integer; NeedZeroRow: Boolean = True): Longint;
var Col: Integer; LR: LongRec; Pt: TPoint; Count: Integer;
begin
  Result:= -1; LR:= LongRec(Result);
  if (Grid is TDBGridEh) then
      with TDBGridEh(Grid) do
        begin
          with MouseCoord(AX, AY) do
            Pt:= Point(X, Y);
          Count:= Columns.Count;
        end else
  if (Grid is TDBGrid) then
      with TDBGrid(Grid) do
        begin
          with MouseCoord(AX, AY) do
            Pt:= Point(X, Y);
          Count:= Columns.Count;
        end;
   with Pt do
     begin
     Col:= X-1; LR.Hi:= Word(Y);
     if ((not NeedZeroRow) or (LR.Hi=0)) and (Col >= 0) and (Col < Count) then
        if NeedZeroRow then
           Result:= Col else
           LR.Lo:= Col;
     end;
  if not NeedZeroRow then
     Result:= LongInt(LR);
end;

procedure SetAutoHandMouseCursor(Sender: TObject; X, Y: Integer; NeedHandCursor: array of Integer);
const
  Cursors: array[Boolean] of TCursor = (crDefault, crHandPoint);
var i, n, k: Integer; LR: LongRec; IsButton: Boolean;
begin
  n:= Length(NeedHandCursor);
  i:= IndexOfColumnTitleUnderMouse(TCustomControl(Sender), X, Y, n=0);
  LR:= LongRec(i); i:= SmallInt(LR.Lo);
  if (n>0) then
  begin
    if (SmallInt(LR.Hi)>0) then
    begin
      n:= IndexOfIntValue(i, NeedHandCursor) + 1;
      i:= -1;
    end else
       n:= 0;
  end;
  if (Sender is TDBGridEh) then
  begin
    IsButton:= (n>0) or
               ((i>=0) and TDBGridEh(Sender).Columns[i].Title.TitleButton);
    TDBGridEh(Sender).Cursor:= Cursors[IsButton]
  end
  else
  if (Sender is TDBGrid) then
  begin
    IsButton:= (n>0) or (i>=0);
    TDBGrid(Sender).Cursor:= Cursors[IsButton];
  end;
end;

procedure SetAutoHandMouseCursor(Sender: TObject; X, Y: Integer);
begin
  SetAutoHandMouseCursor(Sender, X, Y, []);
end;

function IndexOfColumnClickInTitle(Grid: TCustomControl): Integer;
var
  Pt: TPoint; Pos: DWORD;
begin
  Pos:= GetMessagePos;
  Pt := Grid.ScreenToClient(SmallPointToPoint(TSmallPoint(Pos)));
  Result := IndexOfColumnTitleUnderMouse(Grid, Pt.X, Pt.Y);
  //Result := (Grid.MouseCoord(Pt.X, Pt.Y).Y = 0) and (dgTitles in Grid.Options);
end;

function IndexOfPanelClickInStatusBar(StatusBar: TStatusBar): Integer;
var
  Pt: TPoint; Pos: DWORD;
begin
  Pos:= GetMessagePos;
  Pt := StatusBar.ScreenToClient(SmallPointToPoint(TSmallPoint(Pos)));
  Result := IndexOfPanelUnderMouse(StatusBar, Pt.X);
end;

function GetFieldsAndValues(DataSet: TDataSet; GetNames, GetTitles, GetValues,
    SeparateLists: Boolean; EnableFunc: TObjBoolFunc = nil; Delimiter: string =
    ';'): string;
var FL: TFieldList; F: TField; s: string;
    i: Integer;
begin
  Result:= '';
  FL:= DataSet.FieldList;
  for i := 0 to FL.Count-1 do
  begin
    F:= FL[i]; s:= '';
    if (not Assigned(EnableFunc)) or EnableFunc(F) then
       begin
         if GetNames then
         begin
           s:= s + F.FieldName;
           if GetTitles or GetValues then s:= s + '=';
         end;
         if GetTitles then
           begin
              s:= s + F.DisplayLabel;
           if GetValues and DataSet.Active then s:= s + '|';
           end;
           if GetValues and DataSet.Active then s:= s + VarToStr(F.Value);
       end;
    if (s<>'') then
    Result:= Result + s + Delimiter;
  end;
  if (Result<>'') then
     Result:= TrimStrWithDelim(Result, Delimiter);
end;

procedure CopyFieldsAndValues( DataSet: TDataSet;
                               CopyFields, CopyTitles, CopyValues, SeparateLists: Boolean;
                               EnableFunc: TObjBoolFunc = nil; Delimiter: string = ';';
                               MessageFormat: string = ''; MessageOnEmpty: string = '');
var s: WideString;
begin
  s:= GetFieldsAndValues(DataSet, CopyFields, CopyTitles, CopyValues, SeparateLists, EnableFunc, Delimiter);
  CopyStrToClipboard(s, MessageFormat, MessageOnEmpty);
end;

procedure CopyColumnPropList( Grid: TCustomControl; FieldNames,
                              PropNames: string; Delim1: string = ';'; Delim2: string = ';';
                              MessageFormat: string = ''; MessageOnEmpty: string = '');
var s: WideString;
begin
  s:= GetColumnPropList( Grid, FieldNames, PropNames, Delim1, Delim2);
  CopyStrToClipboard(s, MessageFormat, MessageOnEmpty);
end;

procedure UpdateFieldValue(DataSet: TDataSet; FieldName: string; Value: Variant; FieldFunc: TObjBoolFunc = nil);
var F: TField; SavePlace: TBookmark; Stop: Boolean;
begin
  F:= DataSet.FindField(FieldName);
  if (F=nil) then Exit;
    DataSet.Open;
    SavePlace:= DataSet.GetBookMark;
    DataSet.DisableControls;
  try
    DataSet.First;
      while not DataSet.Eof do
      begin
        DataSet.Edit;
        Stop:= False;
        if Assigned(FieldFunc) then
           Stop:= not FieldFunc(F) else
        F.Value:= Value;
        DataSet.Post;
        if Stop then Break;
        DataSet.Next;
      end;
  finally
    DataSet.GotoBookMark(SavePlace);
    DataSet.EnableControls;
    DataSet.FreeBookmark(SavePlace);
  end;
end;

procedure IntProgressEvent(Sender: TObject; Progress: TProgressBar);
var N: Longint absolute Sender;
begin
if N<0 then
   begin
   Progress.Position:= 0;
   Progress.Max:= -N;
   end else
   Progress.Position:= N;
Application.ProcessMessages;
end;

procedure AdjustFormPosition(Owner, Form: TForm; HorizAlign, VertAlign: Integer; HorizPriority: Boolean = False);
const
  HTol = -14;
  VTol = -8;
  VTol_H = 2;
var L, T, W, H: Integer;
begin
  L:= Form.Left; T:= Form.Top; W:= Form.Width; H:= Form.Height;
  case HorizAlign of
    -1: L:= Owner.Left - W;
    1:  L:= Owner.Left + Owner.Width;
    0:  L:= Owner.Left + (Owner.Width - W) div 2;
  end;
  case VertAlign of
    -1: T:= Owner.Top - H - VTol;
    1:  T:= Owner.Top + Owner.Height + VTol;
    0:  T:= Owner.Top + (Owner.Height - H) div 2;
  end;
  //if (Abs(HorizAlign) + Abs(VertAlign) = 2) or (Abs(HorizAlign) * Abs(VertAlign) = 0) then
  if HorizPriority then
  begin
    L:= L - HorizAlign*W;
    T:= T + VertAlign*VTol_H;
  end
     else
     begin
       T:= T - VertAlign*(H+VTol);
       L:= L + HorizAlign*HTol;
     end;
  Form.SetBounds(L, T, W, H);
end;

procedure DisplayFormInsideWinControl( Form: TForm; ParentControl: TWinControl; ParentForm: TForm;
                                              InsideControl: Boolean = True; DoVisible: Boolean = True);
var W, H, CW, CH: Integer; BR, CR, FR: TRect;
begin
   Form.BorderIcons:= [];
   Form.BorderStyle:= bsNone;
   Form.Align:= alNone;
   if InsideControl or (ParentForm=nil) then
   if (ParentControl<>nil) then
      begin
        if (ParentForm<>nil) then
        ParentForm.Visible:= False;
       Form.Parent := ParentControl;
       Form.Visible:= DoVisible;
      end else else
  if (ParentForm<>nil) then
     begin
       ParentForm.ClientWidth:= Form.ClientWidth;
       ParentForm.ClientHeight:= Form.ClientHeight;
//       CR:= ParentForm.ClientRect;
//       BR:= ParentForm.BoundsRect;
//       FR:= ParentForm.BoundsRect;
//       CW:= ((BR.Right-BR.Left)-(CR.Right-CR.Left));
//       CH:= ((BR.Bottom-BR.Top)-(CR.Bottom-CR.Top));
//       ParentForm.SetBounds(BR.Left, BR.Top, CW + (FR.Right-FR.Left), CH + (FR.Bottom-FR.Top));
       Form.Parent := ParentForm;
       if DoVisible then
          ParentForm.Visible:= True;
     end;
   Form.Align:= alClient;
end;

procedure KeyPressSearchProc(Field: TField; var Key: Char; var SearchString: String);
var
  Found: boolean;
begin
  if (Field<>nil) and (Key in MlkData.SearchSet) then
  begin
    SearchString := SearchString + Key;
    Key := Chr(0);
    Found := False;
    try
      Found := Field.DataSet.Locate(Field.FieldName, SearchString, [loPartialKey, loCaseInsensitive]);
    except
      SearchString := '';
    end;
    if (not Found) and (Field.DataType = ftString) then
      SearchString := Copy(SearchString, 1, length(SearchString) - 1);
  end;
end;

procedure ApplyPlaceRectToForm( Form: TForm;
                                const PlaceRect: TRect; const OwnerRowHeight: Integer;
                                const Tolerance: Integer = 0);
begin
  with PlaceRect do
  begin
      if (Left + Form.Width < Screen.Width) then
        Form.Left := Left
      else
        Form.Left := Left - Form.Width;
      if (Top + Form.Height < Screen.Height - Tolerance) then
        Form.Top := Top
      else
        Form.Top := Top - Form.Height - OwnerRowHeight;
  end;
end;

end.
