unit UtilsClasses;

interface

uses
  Classes, Db, Forms;

const
  ABase = '95748';
  MaxListSize = Maxint div 32;


type
  TRoundToRange = -37..37;
  TLargeIntegerField = Int64;
  TResourceEvent = procedure(Sender: TObject; var Params: TParams) OF OBJECT;
  PStringInt64Item = ^TStringInt64Item;
  TStringInt64Item = record
    FString: string;
    FInt64: int64;
  end;

  PStringInt64ItemList = ^TStringInt64ItemList;
  TStringInt64ItemList = array[0..MaxListSize] of TStringInt64Item;

  TStringListInt64 = class(TStringList)
  private
    FList: PStringInt64ItemList;
    FCount: Integer;
    FCapacity: Integer;
    procedure Grow;
  protected
    function Get(Index: Integer): string; override;
    function GetCapacity: Integer; override;
    function GetCount: Integer; override;
    function GetInt64(Index: Integer): int64; virtual;
    function GetObject(Index: Integer): TObject; override;
    procedure Put(Index: Integer; const S: string); override;
    procedure PutInt64(Index: Integer; AInt64: int64); virtual;
    procedure PutObject(Index: Integer; AObject: TObject); override;
    procedure SetCapacity(NewCapacity: Integer); override;
    procedure InsertItemInt64(Index: Integer; const S: string; AInt64: int64); virtual;
    procedure InsertItem(Index: Integer; const S: string; AObject: TObject); override;
  public
    destructor Destroy; override;
    function Add(const S: string): Integer; override;
    function AddInt64(const S: string; AInt64: int64): Integer; virtual;
    function AddObject(const S: string; AObject: TObject): Integer; override;
    procedure Clear; override;
    procedure Delete(Index: Integer); override;
//    function Find(const S: string; var Index: Integer): Boolean; virtual;
    function IndexOf(const S: string): Integer; override;
    procedure Insert(Index: Integer; const S: string); override;
    procedure InsertInt64(Index: Integer; const S: string; AInt64: int64); virtual;
    procedure InsertObject(Index: Integer; const S: string; AObject: TObject); override;
    property ObjInt64[Index: Integer]: int64 read GetInt64 write PutInt64;
  end;

implementation

uses
  Windows, SysUtils, Variants, RTLConsts;

{ TStringListInt64 }

function TStringListInt64.Add(const S: string): Integer;
begin
  Result := AddInt64(S, 0);
end;

function TStringListInt64.AddInt64(const S: string;
  AInt64: int64): Integer;
begin
  Result := FCount;
  InsertItemInt64(Result, S, AInt64);
end;

function TStringListInt64.AddObject(const S: string;
  AObject: TObject): Integer;
begin
  Result := AddInt64(S, int64(AObject));
end;

procedure TStringListInt64.Clear;
begin
  if FCount <> 0 then
  begin
    Finalize(FList^[0], FCount);
    FCount := 0;
    SetCapacity(0);
  end;
end;

procedure TStringListInt64.Delete(Index: Integer);
begin
  if (Index < 0) or (Index >= FCount) then Error(@SListIndexError, Index);
  Finalize(FList^[Index]);
  Dec(FCount);
  if Index < FCount then
    System.Move(FList^[Index + 1], FList^[Index],
      (FCount - Index) * SizeOf(TStringInt64Item));
end;

destructor TStringListInt64.Destroy;
begin
  if FCount <> 0 then Finalize(FList^[0], FCount);
  FCount := 0;
  SetCapacity(0);
  inherited Destroy;
end;

function TStringListInt64.Get(Index: Integer): string;
begin
  if (Index < 0) or (Index >= FCount) then Error(@SListIndexError, Index);
  Result := FList^[Index].FString;
end;

function TStringListInt64.GetCapacity: Integer;
begin
  Result := FCapacity;
end;

function TStringListInt64.GetCount: Integer;
begin
  Result := FCount;
end;

function TStringListInt64.GetInt64(Index: Integer): int64;
begin
  if (Index < 0) or (Index >= FCount) then Error(@SListIndexError, Index);
  Result := FList^[Index].FInt64;
end;

function TStringListInt64.GetObject(Index: Integer): TObject;
begin
  Result := TObject(GetInt64(Index));
end;

procedure TStringListInt64.Grow;
var
  Delta: Integer;
begin
  if FCapacity > 64 then Delta := FCapacity div 4 else
    if FCapacity > 8 then Delta := 16 else
      Delta := 4;
  SetCapacity(FCapacity + Delta);
end;

function TStringListInt64.IndexOf(const S: string): Integer;
begin
  Result := inherited IndexOf(S);
end;

procedure TStringListInt64.Insert(Index: Integer; const S: string);
begin
  InsertInt64(Index, S, 0);
end;

procedure TStringListInt64.InsertInt64(Index: Integer; const S: string;
  AInt64: int64);
begin
  if (Index < 0) or (Index > FCount) then Error(@SListIndexError, Index);
  InsertItemInt64(Index, S, AInt64);
end;

procedure TStringListInt64.InsertItem(Index: Integer; const S: string;
  AObject: TObject);
begin
  InsertItemInt64(Index, S, Int64(AObject));
end;

procedure TStringListInt64.InsertItemInt64(Index: Integer; const S: string;
  AInt64: int64);
begin
  if FCount = FCapacity then Grow;
  if Index < FCount then
    System.Move(FList^[Index], FList^[Index + 1],
      (FCount - Index) * SizeOf(TStringInt64Item));
  with FList^[Index] do
  begin
    Pointer(FString) := nil;
    FInt64 := AInt64;
    FString := S;
  end;
  Inc(FCount);
end;

procedure TStringListInt64.InsertObject(Index: Integer; const S: string;
  AObject: TObject);
begin
  InsertItemInt64(Index, S, int64(AObject));
end;

procedure TStringListInt64.Put(Index: Integer; const S: string);
begin
  if (Index < 0) or (Index >= FCount) then Error(@SListIndexError, Index);
  FList^[Index].FString := S;
end;

procedure TStringListInt64.PutInt64(Index: Integer; AInt64: int64);
begin
  if (Index < 0) or (Index >= FCount) then Error(@SListIndexError, Index);
  FList^[Index].FInt64 := AInt64;
end;

procedure TStringListInt64.PutObject(Index: Integer; AObject: TObject);
begin
  PutInt64(Index, int64(AObject));
end;

procedure TStringListInt64.SetCapacity(NewCapacity: Integer);
begin
  ReallocMem(FList, NewCapacity * SizeOf(TStringInt64Item));
  FCapacity := NewCapacity;
end;


end.

