unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BCMain,
  Vcl.Menus, Vcl.AppEvnts, System.Actions, Vcl.ActnList, Vcl.ComCtrls;

type
  TfmMain = class(TBCMainForm)
    mmMenu: TMainMenu;
    mnuHelp: TMenuItem;
    mnuAbout: TMenuItem;
    mnuExit: TMenuItem;
    mnuSettings: TMenuItem;
    mnuUsers: TMenuItem;
    procedure mnuExitClick(Sender: TObject);
    procedure mnuAboutClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mnuUsersClick(Sender: TObject);
  private
    procedure StartForm;
  protected
    procedure OnSetModule; override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation
uses System.IniFiles, DmCommon, UAbout, Users;

{$R *.dfm}

procedure TfmMain.OnSetModule;
begin
  DataModuleClassName := 'TMlekoDbDsMSSQLDm';
  ResourceModuleClassName := 'TMlekoResDm';
  inherited OnSetModule;
end;

procedure TfmMain.StartForm();
var
  Year, Month, Day: word;
  f1, f2: string;
  Ini: TIniFile;
  i, j, Port: Integer;
  Path1C, ServerType: string;
  Connect1C: Boolean;
begin
  OnSetModule;
  DmCommon.fmMain:= Self;
end;

procedure TfmMain.FormShow(Sender: TObject);
begin
  inherited;
  StartForm();
end;

procedure TfmMain.mnuAboutClick(Sender: TObject);
begin
  inherited;
  ShowAboutBox();
end;

procedure TfmMain.mnuExitClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmMain.mnuUsersClick(Sender: TObject);
begin
  inherited;
  ShowUsers();
end;

end.
