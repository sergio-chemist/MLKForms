unit Users;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Db,
  DBAccess, MsAccess, MemDS, ActnList, GridsEh, DBGridEh, ToolWin, ComCtrls,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  DBAxisGridsEh, System.Actions;

type
  TfmUsers = class(TMlekoForm)
    Panel1: TPanel;
    quUsers: TMSQuery;
    dsUsers: TDataSource;
    UpdateUsers: TMSUpdateSQL;
    quUsersUserNo: TIntegerField;
    quUsersUserName: TStringField;
    quUsersCodeAccess: TSmallintField;
    quUsersPassword: TStringField;
    quUsersEditPost: TBooleanField;
    quUsersChangePriceInInst: TBooleanField;
    quUsersChangeBuhType: TBooleanField;
    quUsersRequiredData: TBooleanField;
    DBGridEh1: TDBGridEh;
    bbExit: TBitBtn;
    sbnAddUser: TSpeedButton;
    sbnEditUser: TSpeedButton;
    sbnDeleteUser: TSpeedButton;
    sbnToStartOfList: TSpeedButton;
    sbnToEndOfList: TSpeedButton;
    quUsersDontDeleteNakl: TBooleanField;
    quUsersisEditNaklW: TBooleanField;
    procedure quUsersBeforePost(DataSet: TDataSet);
    procedure quUsersBeforeDelete(DataSet: TDataSet);
    procedure quUsersNewRecord(DataSet: TDataSet);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnDeleteUserClick(Sender: TObject);
    procedure sbnAddUserClick(Sender: TObject);
    procedure sbnEditUserClick(Sender: TObject);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure FormCreate(Sender: TObject);
    procedure sbnToStartOfListClick(Sender: TObject);
    procedure sbnToEndOfListClick(Sender: TObject);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    LastIndex: Integer;
    Descending: Boolean;
    SearchString: string;
    procedure ExecuteActionWithUser(Option: Integer);
  public
    { Public declarations }
  end;

var
  fmUsers: TfmUsers;

  procedure ShowUsers;

implementation

uses MlkData, MlekoUtils;

{$R *.DFM}

procedure EditUser();
begin

end;

procedure ShowUsers;
begin
 fmUsers:=TfmUsers.Create(Application);
 try
 fmUsers.quUsers.Open;
 fmUsers.quUsers.Locate('UserNo', UserNo, []);
 fmUsers.ShowModal;
 finally
 fmUsers.quUsers.Close;
 fmUsers.Free;
 end;
end;

procedure TfmUsers.ExecuteActionWithUser(Option: Integer);
begin
  case Option of
  0: EditUser();
  1: begin
       quUsers.Append;
       EditUser();
     end;
  -1:if Application.MessageBox('Вы уверены?','Удаление',MB_YESNO)=IDYES then
             quUsers.Delete;
  end;
end;

procedure TfmUsers.quUsersBeforePost(DataSet: TDataSet);
const
  sql = 'select ISNULL(Max(UserNo), 0) + 1 as MaxUserNo from Users';
begin
 if quUsers.State=dsInsert then
  begin
    dmDataModule.OpenSQL(sql);
    quUsersUserNo.AsInteger:= dmDataModule.QFO.Fields[0].AsInteger;
    UpdateUsers.Apply(ukInsert);
  end
 else
  UpdateUsers.Apply(ukModify);
end;

procedure TfmUsers.quUsersBeforeDelete(DataSet: TDataSet);
begin
 UpdateUsers.Apply(ukDelete);
end;

procedure TfmUsers.quUsersNewRecord(DataSet: TDataSet);
begin
 quUsersEditPost.AsBoolean:= False;
 quUsersDontDeleteNakl.AsBoolean:= True;
end;

procedure TfmUsers.DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  if sbnEditUser.Enabled then
    ExecuteActionWithUser(0);
end;

procedure TfmUsers.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 case Key of
  VK_RETURN: ExecuteActionWithUser(0);
  VK_INSERT: ExecuteActionWithUser(1);
  VK_DELETE: ExecuteActionWithUser(-1);
  VK_DOWN, VK_UP, VK_ESCAPE: SearchString := '';
 end;
end;

procedure TfmUsers.sbnDeleteUserClick(Sender: TObject);
begin
  inherited;
  ExecuteActionWithUser(-1);
end;

procedure TfmUsers.sbnAddUserClick(Sender: TObject);
begin
  inherited;
  ExecuteActionWithUser(1);
end;

procedure TfmUsers.sbnEditUserClick(Sender: TObject);
begin
  inherited;
  ExecuteActionWithUser(0);
end;

procedure TfmUsers.DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
var
 FindUserNo: Integer;
 MacroValue: String;
 OldColumn: TColumnEh;
begin
  inherited;
 Screen.Cursor:=crHourGlass;
 FindUserNo := quUsers.FieldByName('UserNo').AsInteger;
 quUsers.Close;
 if (ACol in [0..1]) then
 begin
 if (LastIndex<>ACol) then
    begin
    if (LastIndex>=0) then
       begin
         OldColumn:= DBGridEh1.Columns[LastIndex];
         OldColumn.Title.SortMarker:= smNoneEh;
       end;
    Descending:= true;
    end;
 case ACol of
    0: MacroValue := 'u.UserNo';
    1: MacroValue := 'u.UserName';
 end;
 Descending:= not Descending;
 if Descending then MacroValue:= MacroValue + ' desc';
 if Descending then
    Column.Title.SortMarker:= smUpEh else
    Column.Title.SortMarker:= smDownEh;
 LastIndex:= ACol;
 end;
 quUsers.MacroByName('_order').Value:= MacroValue;
 quUsers.Prepare;
 quUsers.Open;
 quUsers.Locate('UserNo',FindUserNo,[]);
 Screen.Cursor:=crDefault;
end;

procedure TfmUsers.FormCreate(Sender: TObject);
begin
  inherited;
  LastIndex:= 0;
  Descending:= false;
  if DBGridEh1.RowCount>1 then
     DBGridEh1.Columns[0].Title.SortMarker:= smDownEh;
end;

procedure TfmUsers.sbnToStartOfListClick(Sender: TObject);
begin
  inherited;
  quUsers.First;
end;

procedure TfmUsers.sbnToEndOfListClick(Sender: TObject);
begin
  inherited;
  quUsers.Last;
end;

procedure TfmUsers.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  KeyPressSearchProc(DBGridEh1.SelectedField, Key, SearchString);
end;

end.
