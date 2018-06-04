inherited MlekoSelectOtdelDlg: TMlekoSelectOtdelDlg
  Left = 1003
  Top = 216
  Caption = #1042#1099#1073#1086#1088' '#1086#1090#1076#1077#1083#1072
  ClientHeight = 329
  ClientWidth = 504
  ExplicitWidth = 520
  ExplicitHeight = 368
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 504
    Height = 258
    ExplicitWidth = 629
    ExplicitHeight = 258
    inherited TabSheet1: TTabSheet
      ExplicitWidth = 621
      ExplicitHeight = 230
      inherited Splitter: TSplitter
        Left = 274
        Height = 230
        ExplicitLeft = 242
        ExplicitHeight = 230
      end
      inherited PanelGrid: TPanel
        Width = 274
        Height = 230
        ExplicitWidth = 399
        ExplicitHeight = 230
        inherited ToolBar: TToolBar
          Width = 272
          ExplicitWidth = 397
        end
        inherited DBGrid: TDBGridEh
          Width = 272
          Height = 206
        end
      end
      inherited PanelSelect: TPanel
        Left = 277
        Height = 230
        ExplicitLeft = 402
        ExplicitHeight = 230
        inherited DBGridSelection: TDBGridEh
          Height = 206
        end
      end
    end
  end
  inherited ButtonSelect: TButton
    Left = 421
    Top = 265
  end
  inherited ButtonCancel: TButton
    Left = 421
    Top = 296
  end
  inherited pnlFilter: TPanel
    Top = 258
    Height = 71
    ExplicitLeft = 0
    ExplicitTop = 258
    ExplicitHeight = 155
  end
  inherited ActionList: TActionList
    Left = 116
  end
  inherited DS: TDataSource
    Left = 116
  end
  inherited Query: TMSQuery
    Left = 87
  end
  inherited QueryProp: TMSQuery
    Left = 31
  end
  inherited DSSelection: TDataSource
    Left = 88
  end
  inherited QuSelectList: TMSQuery
    Left = 55
    Top = 196
  end
  inherited SQLBuilder: TMLKSQLBuilder
    Select.Strings = (
      'OtdelNo as ID, OtdelNo,OTDELNAME')
    From.Strings = (
      'vidOtdel a')
    Left = 62
    Top = 41
  end
end
