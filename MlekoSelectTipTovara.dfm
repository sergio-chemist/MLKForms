inherited MlekoSelectTipTovaraDlg: TMlekoSelectTipTovaraDlg
  Left = 922
  Top = 409
  Caption = #1042#1099#1073#1086#1088' '#1074#1080#1076#1072' '#1090#1086#1074#1072#1088#1072
  ClientHeight = 327
  ClientWidth = 486
  ExplicitWidth = 502
  ExplicitHeight = 366
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 486
    Height = 258
    ExplicitWidth = 629
    ExplicitHeight = 258
    inherited TabSheet1: TTabSheet
      ExplicitWidth = 621
      ExplicitHeight = 230
      inherited Splitter: TSplitter
        Left = 256
        Height = 230
        ExplicitLeft = 242
        ExplicitHeight = 230
      end
      inherited PanelGrid: TPanel
        Width = 256
        Height = 230
        ExplicitWidth = 399
        ExplicitHeight = 230
        inherited ToolBar: TToolBar
          Width = 254
          ExplicitWidth = 397
        end
        inherited DBGrid: TDBGridEh
          Width = 254
          Height = 206
        end
      end
      inherited PanelSelect: TPanel
        Left = 259
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
    Left = 403
    Top = 263
  end
  inherited ButtonCancel: TButton
    Left = 403
    Top = 294
  end
  inherited pnlFilter: TPanel
    Top = 258
    Height = 69
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
    SQL.Strings = (
      'select TipNo as id'
      '      ,TipNo'
      '      ,TipName'
      ' from TipTovara a')
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
      'TipNo  as id'
      ',TipNo '
      ',TipName')
    From.Strings = (
      'TipTovara a')
    Left = 435
    Top = 176
  end
end
