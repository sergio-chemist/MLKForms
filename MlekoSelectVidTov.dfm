inherited MlekoSelectVidTovDlg: TMlekoSelectVidTovDlg
  Left = 922
  Top = 409
  Caption = #1042#1099#1073#1086#1088' '#1074#1080#1076#1072' '#1090#1086#1074#1072#1088#1072
  ClientHeight = 331
  ClientWidth = 489
  ExplicitWidth = 505
  ExplicitHeight = 370
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 489
    Height = 258
    ExplicitWidth = 629
    ExplicitHeight = 258
    inherited TabSheet1: TTabSheet
      ExplicitWidth = 621
      ExplicitHeight = 230
      inherited Splitter: TSplitter
        Left = 259
        Height = 230
        ExplicitLeft = 242
        ExplicitHeight = 230
      end
      inherited PanelGrid: TPanel
        Width = 259
        Height = 230
        ExplicitWidth = 399
        ExplicitHeight = 230
        inherited ToolBar: TToolBar
          Width = 257
          ExplicitWidth = 397
        end
        inherited DBGrid: TDBGridEh
          Width = 257
          Height = 206
        end
      end
      inherited PanelSelect: TPanel
        Left = 262
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
    Left = 406
    Top = 267
    ExplicitTop = 267
  end
  inherited ButtonCancel: TButton
    Left = 406
    Top = 298
    ExplicitTop = 298
  end
  inherited pnlFilter: TPanel
    Top = 258
    Height = 73
    ExplicitLeft = 0
    ExplicitTop = 258
    ExplicitHeight = 155
    object lbeVidTov: TLabeledEdit
      AlignWithMargins = True
      Left = 105
      Top = 24
      Width = 144
      Height = 21
      EditLabel.Width = 46
      EditLabel.Height = 13
      EditLabel.Caption = 'lbeVidTov'
      EditLabel.Layout = tlCenter
      TabOrder = 0
    end
  end
  inherited ActionList: TActionList
    Left = 116
  end
  inherited DS: TDataSource
    Left = 116
  end
  inherited Query: TMSQuery
    SQL.Strings = (
      'select VidNo as id'
      '      ,VidNo'
      '      ,VidName'
      ' from VidTov a')
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
      'VidNo  as id'
      ',VidNo '
      ',VidName')
    From.Strings = (
      'VidTov a')
    Left = 363
    Top = 168
  end
end
