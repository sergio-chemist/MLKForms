inherited MlekoSelectUserDlg: TMlekoSelectUserDlg
  Caption = #1042#1099#1073#1086#1088' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    inherited TabSheet1: TTabSheet
      inherited Splitter: TSplitter
        ExplicitLeft = 269
      end
      inherited PanelGrid: TPanel
        inherited DBGrid: TDBGridEh
          ColumnDefValues.Title.TitleButton = True
          SortLocal = True
        end
      end
    end
  end
  inherited ButtonSelect: TButton
    Left = 543
    ExplicitLeft = 543
  end
  inherited ButtonCancel: TButton
    Left = 543
    ExplicitLeft = 543
  end
  inherited Query: TMSQuery
    SQL.Strings = (
      'SELECT  a.UserNo,a.UserNo as ID,a.UserName,a.CodeAccess'
      ' FROM Users a'
      ''
      '')
  end
  inherited spCopyProfile: TMSStoredProc
    Left = 464
    Top = 40
  end
  inherited SQLBuilder: TMLKSQLBuilder
    Select.Strings = (
      ' a.UserNo,a.UserNo as ID,a.UserName,a.CodeAccess')
    From.Strings = (
      'Users a')
    OrderBy.Strings = (
      '')
    UseParams = True
  end
end
