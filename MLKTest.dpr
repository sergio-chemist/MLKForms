program MLKTest;

uses
  Vcl.Forms,
  UBCForm in 'UBCForm.pas' {BCForm},
  BCCommon in 'BCCommon.pas',
  BCContainer in 'BCContainer.pas' {BCContainerFrame: TFrame},
  BCRes in 'BCRes.pas' {BCResDm: TDataModule},
  BCDbDs in 'BCDbDs.pas' {BCDbDsDm: TDataModule},
  BCDb in 'BCDb.pas' {BCDbDm: TDataModule},
  BCException in 'BCException.pas' {BCExceptionDlg},
  BCMain in 'BCMain.pas' {BCMainForm},
  Main in 'Main.pas' {fmMain},
  UAbout in 'UAbout.pas' {AboutBox},
  BCProp in 'BCProp.pas' {BCPropDlg},
  BCSelect in 'BCSelect.pas' {BCSelectDlg},
  DDRes in 'DDRes.pas' {DDResDm: TDataModule},
  MlekoRes in 'MlekoRes.pas' {MlekoResDm: TDataModule},
  BCDbMSSQL in 'BCDbMSSQL.pas' {BCDbMSSQLDm: TDataModule},
  MlekoDbDsMSSQL in 'MlekoDbDsMSSQL.pas' {MlekoDbDsMSSQLDm: TDataModule},
  BCDbDsMSSQL in 'BCDbDsMSSQL.pas' {BCDbDsMSSQLDm: TDataModule},
  DmCommon in 'DmCommon.pas',
  MlkData in 'MlkData.pas' {dmDataModule: TDataModule},
  MlekoForm in 'MlekoForm.pas' {MlekoForm},
  BCLogon in 'BCLogon.pas' {BCLogonDlg};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDataModule, dmDataModule);
  Application.CreateForm(TfmMain, fmMain);
  fmMain.MainDm:= dmDataModule;
  fmMain.MainDm.Connect := true;
  if fmMain.MainDm.Connect then
     Application.Run;
end.
