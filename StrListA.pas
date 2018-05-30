unit StrListA;

interface

uses
  Classes;

type
  TStringListArray = class(TStringList)
  private
    Free_Obj: Boolean;
    FirstFiller: String;
    EmptyFiller: String;
    StrDelimiter: String;
    strPrefix, strPostfix: String;
    procedure FreeObjects;
    function AssignStringsByIndex(AStrings: TStrings; Index, Direction: Integer): Boolean;
    procedure AddStringsByIndex(Index: Integer; AStrings: TStrings; Replace: Boolean = False);
    function FindItem(const S: string; var Index: Integer): Boolean;
    function CountInChild(Index: Integer): Integer;
    function GetTransposedStr(Index: Integer): String;
    procedure TransposeIntoStringsEx(Dest: TStrings; ADelimiter: String = ', '; AEmptyFiller: String = '');
    function ExportToString(Index: Integer; ADelimiter: Char = '='): String;
    function ImportFromString(S: String; ADelimiter: Char = '='): Integer;
    function AddItemWithText(Item, AText: string): Integer;
    function AddChildByIndex(Index: Integer): TStrings;
  public
    constructor Create();
    destructor Destroy; override;
    function GetMaxCountInChildren(): Integer;
    function IndexOfChild(Child: TStrings): Integer;
    function GetChild(Index: Integer): TStrings;
    function AddItem(Item: string; AStrings: TStrings; Replace: Boolean = False): Integer;
    function FindItemStrings(Item: string; DoCreate: Boolean = True): TStrings;
    function ImportFromStrings(Source: TStrings; ADelimiter: Char = '='): Integer;
    procedure ExportToStrings(Dest: TStrings; ADelimiter: Char = '=');
    procedure SetTransposeParams(
          ADelimiter: String = ', '; AEmptyFiller: String = '';
          AFirstFiller: String = '-1';
          APrefix: String = '('; APostfix: String=')');
    procedure SetTransposeParamsNull;
    procedure TransposeToStrings( Dest: TStrings; WithHeader: Boolean = False;
                                  DoClear: Boolean = True; MinCountIsOne: Boolean = False);
    procedure Clear;
    procedure ClearStrObjects;
  end;

function SplitStrFast(S: string; PValue: PString; ValueAsResult: Boolean = False; Delim: Char = '='): string;  

implementation

uses
  SysUtils, StrUtils;

procedure DeleteLastEmptyItems(Source: TStrings);
var
  i, n: Integer;
begin
  if Source <> nil then
  begin
    repeat
      i := Source.Count - 1;
      if (i >= 0) and (Trim(Source[i]) = '') then
        Source.Delete(i)
      else
        Break;
    until False;
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
    Result := Length(S) > 0;
  end;
  if (not Result) then exit;
  if TrimStr then
  begin
    S1 := Trim(S1); S2 := Trim(S2);
  end;
  if (P1 <> nil) then P1^ := S1;
  if (P2 <> nil) then P2^ := S2;
end;

function SplitStrFast(S: string; PValue: PString; ValueAsResult: Boolean = False; Delim: Char = '='): string;
begin
  if ValueAsResult then
     SplitStrWithCharSafe(S, PValue, @Result, Delim, True, 1) else
     SplitStrWithCharSafe(S, @Result, PValue, Delim, True, 1);
end;


  { TStringListArray }

procedure TStringListArray.FreeObjects();
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    Objects[i].Free;
end;

constructor TStringListArray.Create();
begin
  inherited Create;
  Free_Obj := True;
  FirstFiller:= '-1';
  StrDelimiter:= ', ';
  EmptyFiller:= '';
  strPrefix:= '(';
  strPostfix:= ')';
end;

destructor TStringListArray.Destroy;
begin
  if Free_Obj then FreeObjects();
  inherited;
end;

function TStringListArray.AddChildByIndex(Index: Integer): TStrings;
begin
  Result:= nil;
  if (Index < 0) or (Index >= Count) then
    Exit;
  Result := TStringList(Objects[Index]);
  if (Result = nil) then
  begin
    Result := TStringList.Create;
    Objects[Index] := Result;
  end;
end;

procedure TStringListArray.AddStringsByIndex(Index: Integer; AStrings: TStrings; Replace: Boolean = False);
var
  Child: TStrings;
begin
  Child:= AddChildByIndex(Index);
  if (Child<>nil) and (AStrings <> nil) then
    if Replace then
      Child.Assign(AStrings)
    else
      Child.AddStrings(AStrings);
end;

function TStringListArray.FindItem(const S: string; var Index: Integer): Boolean;
begin
  Index := IndexOf(S);
  Result := Index >= 0;
end;

function TStringListArray.GetChild(Index: Integer): TStrings;
begin
  Result:= nil;
  if (Index>=0) and (Index<Count) then
     Result:= TStrings(Objects[Index]);
end;

function TStringListArray.IndexOfChild(Child: TStrings): Integer;
begin
  Result:= IndexOfObject(Child);
end;

function TStringListArray.CountInChild(Index: Integer): Integer;
var Child: TStrings;
begin
  Result:= 0;
  Child:= GetChild(Index);
  if Child<>nil then Result:= Child.Count;
end;

function TStringListArray.FindItemStrings(Item: string; DoCreate: Boolean = True): TStrings;
var
  Index: Integer;
begin
  Result := nil;
  if FindItem(Item, Index) then
    Result := GetChild(Index)
  else if DoCreate then
  begin
    Result := TStringList.Create;
    Index := Add(Item);
    Objects[Index] := Result;
  end;
end;

function TStringListArray.AddItem(Item: string; AStrings: TStrings; Replace: Boolean = False): Integer;
begin
  if not Find(Item, Result) then Result := Add(Item);
  AddStringsByIndex(Result, AStrings, Replace);
end;

function TStringListArray.AddItemWithText(Item, AText: string): Integer;
var Child: TStrings;
begin
  if not FindItem(Item, Result) then Result := Add(Item);
  Child:= AddChildByIndex(Result);
  Child.CommaText:= AText;
end;

function TStringListArray.AssignStringsByIndex(AStrings: TStrings; Index, Direction: Integer): Boolean;
var
  List: TStrings;
begin
  Result := False;
  if (AStrings <> nil) then
  begin
    List := GetChild(Index);
    if (List <> nil) then
    begin
      if Direction > 0 then
        List.Assign(AStrings)
      else
        AStrings.Assign(List);
      Result := True;
    end;
  end;
end;

procedure TStringListArray.Clear();
begin
  if Free_Obj then
    FreeObjects();
  inherited Clear;
end;

procedure TStringListArray.ClearStrObjects();
var
  Obj: TObject;
  i: Integer;
begin
  for i := 0 to Count - 1 do
  begin
    Obj := Objects[i];
    if (Obj is TStringListArray) then
      (Obj as TStringListArray).Clear;
  end;
end;

function TStringListArray.GetMaxCountInChildren(): Integer;
var i, n: Integer;
begin
  Result:= 0;
for i:=0 to Count-1 do
  begin
    n:= CountInChild(i);
    if n>Result then Result:= n;
  end;
end;

function TStringListArray.ExportToString(Index: Integer; ADelimiter: Char = '='): String;
var i, h: Integer; Child: TStrings;
begin
  Result:= ''; h:= Count-1;
  Child:= GetChild(i);
  if (Child<>nil) then
     Result:= Strings[Index] + ADelimiter + Child.CommaText;
end;

function TStringListArray.ImportFromString(S: String; ADelimiter: Char = '='): Integer;
var S1, S2: string;
begin
  Result:= -1;
  if SplitStrWithCharSafe(S, @S1, @S2, ADelimiter, True, 0) then
     Result:= AddItemWithText(S1, S2);
end;

function TStringListArray.ImportFromStrings(Source: TStrings; ADelimiter: Char = '='): Integer;
var i: Integer; S: String;
begin
  Clear;
  for i:=0 to Source.Count-1 do
    begin
      S:= Trim(Source[i]);
      if (S<>'') then
         ImportFromString(S, ADelimiter);
    end;
  Result:= Count;
end;

procedure TStringListArray.ExportToStrings(Dest: TStrings; ADelimiter: Char = '=');
var i, MaxCount: Integer;
begin
  Dest.BeginUpdate;
  try
    Dest.Clear;
  for i:=0 to Count-1 do
    Dest.Add(ExportToString(i));
  finally
    Dest.EndUpdate;
  end;
end;

function TStringListArray.GetTransposedStr(Index: Integer): String;
var i, h: Integer; Child: TStrings; S: String;
begin
  Result:= ''; h:= Count-1;
  for i:=0 to h do
  begin
    Child:= GetChild(i);
    if (Child<>nil) and (Index<Child.Count) then
       S:= Child[index] else
       if (Index=0) and (FirstFiller<>'')
          then S:= FirstFiller
          else S:= EmptyFiller;
    Result:= Result + S;
    if (i<h) then Result:= Result + StrDelimiter;
  end;
  Result:= strPrefix + Result + strPostfix;
end;

procedure TStringListArray.TransposeToStrings(
          Dest: TStrings; WithHeader: Boolean = False; DoClear: Boolean = True;
          MinCountIsOne: Boolean = False);
var i, MaxCount: Integer;
begin
  Dest.BeginUpdate;
  try
    MaxCount:= GetMaxCountInChildren();
    if MinCountIsOne and (MaxCount=0) then MaxCount:= 1;
    if DoClear then Dest.Clear;
    if WithHeader then Dest.Add(CommaText);
  for i:=0 to MaxCount-1 do
    Dest.Add(GetTransposedStr(i));
  finally
    Dest.EndUpdate;
  end;
end;

procedure TStringListArray.SetTransposeParams(
          ADelimiter: String = ', '; AEmptyFiller: String = '';
          AFirstFiller: String = '-1';
          APrefix: String = '('; APostfix: String=')');
begin
  StrDelimiter:= ADelimiter; EmptyFiller:= AEmptyFiller;
  strPrefix:= APrefix; strPostfix:= APostfix; FirstFiller:= AFirstFiller;
end;

procedure TStringListArray.SetTransposeParamsNull();
begin
  StrDelimiter:= ', '; EmptyFiller:= 'NULL';
end;

procedure TStringListArray.TransposeIntoStringsEx(Dest: TStrings; ADelimiter: String = ', '; AEmptyFiller: String = '');
begin
  SetTransposeParams(ADelimiter, AEmptyFiller);
  TransposeToStrings(Dest);
end;


end.


