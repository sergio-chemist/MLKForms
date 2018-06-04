inherited MlekoSelectVidNaklDlg: TMlekoSelectVidNaklDlg
  Left = 978
  Top = 314
  Caption = #1042#1080#1076' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
  ClientHeight = 331
  ClientWidth = 494
  ExplicitWidth = 510
  ExplicitHeight = 370
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 494
    Height = 258
    ExplicitWidth = 629
    ExplicitHeight = 258
    inherited TabSheet1: TTabSheet
      ExplicitWidth = 621
      ExplicitHeight = 230
      inherited Splitter: TSplitter
        Left = 264
        Height = 230
        ExplicitLeft = 242
        ExplicitHeight = 230
      end
      inherited PanelGrid: TPanel
        Width = 264
        Height = 230
        ExplicitWidth = 399
        ExplicitHeight = 230
        inherited ToolBar: TToolBar
          Width = 262
          ExplicitWidth = 397
        end
        inherited DBGrid: TDBGridEh
          Width = 262
          Height = 206
        end
      end
      inherited PanelSelect: TPanel
        Left = 267
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
    Left = 411
    Top = 267
  end
  inherited ButtonCancel: TButton
    Left = 411
    Top = 298
  end
  inherited pnlFilter: TPanel
    Top = 258
    Height = 73
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
      'VidNaklNo as id, VidNaklNo,VidNaklName')
    From.Strings = (
      'VidNakl a')
    Left = 63
    Top = 41
  end
end
