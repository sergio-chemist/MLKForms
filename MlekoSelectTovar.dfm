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
    ExplicitWidth = 495
    ExplicitHeight = 350
    inherited TabSheet1: TTabSheet
      ExplicitWidth = 487
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
        ExplicitWidth = 265
        ExplicitHeight = 322
        inherited ToolBar: TToolBar
          Width = 263
          ExplicitWidth = 263
        end
        inherited DBGrid: TDBGridEh
          Width = 263
          Height = 298
        end
      end
      inherited PanelSelect: TPanel
        Left = 268
        Height = 322
        ExplicitLeft = 268
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
    ExplicitLeft = 412
    ExplicitTop = 356
    ExplicitHeight = 27
  end
  inherited ButtonCancel: TButton
    Left = 412
    Top = 389
    ExplicitLeft = 412
    ExplicitTop = 389
  end
  inherited pnlFilter: TMlkFilterPanel
    Top = 350
    Height = 72
    ExplicitTop = 350
    ExplicitHeight = 72
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
  inherited SQLBuilder: TMlkSQLBuilder
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
