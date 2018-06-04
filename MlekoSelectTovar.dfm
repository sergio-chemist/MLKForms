inherited MlekoSelectTovarDlg: TMlekoSelectTovarDlg
  Left = 1032
  Top = 139
  Caption = 'MlekoSelectTovarDlg'
  ClientHeight = 422
  ClientWidth = 495
  ExplicitWidth = 511
  ExplicitHeight = 461
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 495
    Height = 350
    ExplicitWidth = 629
    ExplicitHeight = 350
    inherited TabSheet1: TTabSheet
      ExplicitWidth = 621
      ExplicitHeight = 322
      inherited Splitter: TSplitter
        Left = 265
        Height = 322
        ExplicitLeft = 312
        ExplicitHeight = 322
      end
      inherited PanelGrid: TPanel
        Width = 265
        Height = 322
        ExplicitWidth = 399
        ExplicitHeight = 322
        inherited ToolBar: TToolBar
          Width = 263
          ExplicitWidth = 397
        end
        inherited DBGrid: TDBGridEh
          Width = 263
          Height = 298
        end
      end
      inherited PanelSelect: TPanel
        Left = 268
        Height = 322
        ExplicitLeft = 402
        ExplicitHeight = 322
        inherited DBGridSelection: TDBGridEh
          Height = 298
        end
      end
    end
  end
  inherited ButtonSelect: TButton
    Left = 412
    Top = 356
    Height = 27
    ExplicitTop = 386
    ExplicitHeight = 27
  end
  inherited ButtonCancel: TButton
    Left = 412
    Top = 389
    ExplicitTop = 419
  end
  inherited pnlFilter: TPanel
    Top = 350
    Height = 72
    ExplicitLeft = 0
    ExplicitTop = 350
    ExplicitHeight = 102
  end
  inherited ActionList: TActionList
    inherited ActionItemDel: TAction
      OnExecute = ActionItemDelExecute
    end
  end
  inherited Query: TMSQuery
    SQL.Strings = (
      'select * from v_postList')
    Filter = 'vidname = '#39' '#39
    BeforeOpen = QueryBeforeOpen
  end
  inherited SQLBuilder: TMLKSQLBuilder
    Select.Strings = (
      'tovarno      AS id'
      '       ,tovarno'
      '       ,nametovar'
      '       ,v.VidName'
      '       ,a.companyno'
      '       ,c.namecompany')
    From.Strings = (
      'tovar a'
      'left outer join dbo.vidtov v on v.vidno = a.vidno'
      'left outer join dbo.company c on c.companyno = a.companyno')
  end
end
