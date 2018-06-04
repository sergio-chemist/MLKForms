inherited MlekoSelectCurrencyDlg: TMlekoSelectCurrencyDlg
  Left = 1003
  Top = 216
  Caption = #1042#1099#1073#1086#1088' '#1074#1072#1083#1102#1090#1099
  ClientHeight = 332
  ClientWidth = 492
  ExplicitWidth = 508
  ExplicitHeight = 371
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 492
    Height = 258
    ExplicitWidth = 629
    ExplicitHeight = 258
    inherited TabSheet1: TTabSheet
      ExplicitWidth = 621
      ExplicitHeight = 230
      inherited Splitter: TSplitter
        Left = 262
        Height = 230
        ExplicitLeft = 242
        ExplicitHeight = 230
      end
      inherited PanelGrid: TPanel
        Width = 262
        Height = 230
        ExplicitWidth = 399
        ExplicitHeight = 230
        inherited ToolBar: TToolBar
          Width = 260
          ExplicitWidth = 397
        end
        inherited DBGrid: TDBGridEh
          Width = 260
          Height = 206
        end
      end
      inherited PanelSelect: TPanel
        Left = 265
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
    Left = 409
    Top = 268
  end
  inherited ButtonCancel: TButton
    Left = 409
    Top = 299
  end
  inherited pnlFilter: TPanel
    Top = 258
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
      '  id as ID'
      ', l_code as CodeCurrency'
      ', Name as NameCurrency')
    From.Strings = (
      'd_currency a')
    Left = 62
    Top = 41
  end
end
