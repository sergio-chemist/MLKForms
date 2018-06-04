inherited MlekoSelectSotrudDlg: TMlekoSelectSotrudDlg
  Left = 406
  Top = 174
  Caption = #1042#1099#1073#1086#1088' '#1084#1077#1085#1077#1076#1078#1077#1088#1072
  ClientHeight = 364
  ClientWidth = 494
  ExplicitWidth = 510
  ExplicitHeight = 403
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 494
    Height = 291
    ExplicitWidth = 629
    ExplicitHeight = 291
    inherited TabSheet1: TTabSheet
      ExplicitWidth = 621
      ExplicitHeight = 263
      inherited Splitter: TSplitter
        Left = 264
        Height = 263
        ExplicitLeft = 314
        ExplicitHeight = 263
      end
      inherited PanelGrid: TPanel
        Width = 264
        Height = 263
        ExplicitWidth = 399
        ExplicitHeight = 263
        inherited ToolBar: TToolBar
          Width = 262
          ExplicitWidth = 397
        end
        inherited DBGrid: TDBGridEh
          Width = 262
          Height = 239
        end
      end
      inherited PanelSelect: TPanel
        Left = 267
        Height = 263
        ExplicitLeft = 402
        ExplicitHeight = 263
        inherited DBGridSelection: TDBGridEh
          Height = 239
        end
      end
    end
  end
  inherited ButtonSelect: TButton
    Left = 411
    Top = 300
  end
  inherited ButtonCancel: TButton
    Left = 411
    Top = 331
  end
  inherited pnlFilter: TPanel
    Top = 291
    Height = 73
    ExplicitLeft = 0
    ExplicitTop = 291
    ExplicitHeight = 122
  end
  inherited Query: TMSQuery
    SQL.Strings = (
      'select * from v_postList')
  end
  inherited SQLBuilder: TMLKSQLBuilder
    Select.Strings = (
      '*')
    From.Strings = (
      'v_SelectSotrud a')
    Where.Strings = (
      ' (a.SotrudOtdel= :P_OTDELNO or :P_SHOW_ALL = -1)')
    OrderBy.Strings = (
      ' a.SotrudName')
    OnGetParams = SQLBuilderGetParams
    Left = 364
    Top = 78
  end
  object DSOtdels: TDataSource
    DataSet = quOtdels
    Left = 392
    Top = 215
  end
  object quOtdels: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from vidotdel')
    AfterOpen = QueryAfterOpen
    AfterScroll = QueryAfterScroll
    AfterRefresh = QueryAfterRefresh
    Left = 423
    Top = 218
  end
  object quDepts: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      'from dbo.vidOtdel')
    Left = 336
    Top = 336
    object quDeptsOtdelNo: TSmallintField
      FieldName = 'OtdelNo'
    end
    object quDeptsOtdelName: TStringField
      FieldName = 'OtdelName'
      Size = 30
    end
  end
end
