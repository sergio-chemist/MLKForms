inherited MlekoSelectFIrmDlg: TMlekoSelectFIrmDlg
  Left = 568
  Top = 174
  Caption = #1042#1099#1073#1086#1088' '#1092#1080#1088#1084#1099
  ClientHeight = 452
  ClientWidth = 637
  ExplicitWidth = 653
  ExplicitHeight = 491
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 637
    Height = 390
    ExplicitWidth = 637
    ExplicitHeight = 390
    inherited TabSheet1: TTabSheet
      ExplicitWidth = 629
      ExplicitHeight = 362
      inherited Splitter: TSplitter
        Left = 407
        Height = 362
        ExplicitLeft = 599
        ExplicitHeight = 365
      end
      inherited PanelGrid: TPanel
        Width = 407
        Height = 362
        ExplicitWidth = 407
        ExplicitHeight = 362
        inherited ToolBar: TToolBar
          Width = 405
          ExplicitWidth = 405
          object ToolButton7: TToolButton
            Left = 146
            Top = 0
            Width = 8
            Caption = 'ToolButton7'
            ImageIndex = 26
            Style = tbsSeparator
          end
          object pnlCount: TPanel
            Left = 154
            Top = 0
            Width = 119
            Height = 22
            Alignment = taLeftJustify
            BevelOuter = bvNone
            Caption = #1069#1083#1077#1084#1077#1085#1090#1086#1074': 123456'
            TabOrder = 0
          end
        end
        inherited DBGrid: TDBGridEh
          Width = 405
          Height = 338
        end
      end
      inherited PanelSelect: TPanel
        Left = 410
        Height = 362
        ExplicitLeft = 410
        ExplicitHeight = 362
        inherited DBGridSelection: TDBGridEh
          Height = 338
        end
      end
    end
  end
  inherited ButtonSelect: TButton
    Left = 554
    Top = 423
    ParentShowHint = False
    ShowHint = True
    ExplicitLeft = 554
    ExplicitTop = 423
  end
  inherited ButtonCancel: TButton
    Left = 554
    Top = 394
    ParentShowHint = False
    ShowHint = True
    ExplicitLeft = 554
    ExplicitTop = 394
  end
  inherited pnlFilter: TMlkFilterPanel
    Top = 390
    Width = 526
    Height = 62
    ExplicitTop = 390
    ExplicitWidth = 526
    ExplicitHeight = 62
  end
  object BtNone: TButton [4]
    Left = 753
    Top = 499
    Width = 75
    Height = 25
    Hint = #1055#1088#1086#1076#1086#1083#1078#1080#1090#1100' '#1073#1077#1079' '#1074#1099#1073#1086#1088#1072
    Action = ActionFormCancel
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1041#1077#1079' '#1074#1099#1073#1086#1088#1072
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Visible = False
  end
  inherited Query: TMSQuery
    SQL.Strings = (
      'SELECT a.postno    AS id'
      '       ,name     AS shortname'
      '       ,namelong'
      '       ,okpo'
      '       ,contact'
      '       ,address'
      '       ,a.postno'
      '       &_dolg_sql'
      ' FROM post a')
    BeforeOpen = QueryBeforeOpen
    MacroData = <
      item
        Name = '_dolg_sql'
      end>
  end
  inherited SQLBuilder: TMlkSQLBuilder
    Select.Strings = (
      'a.postno    AS id'
      '       ,name     AS shortname'
      
        '       ,case when (select prop_id from l_firm_prop where PostNo ' +
        '= a.PostNo and prop_id = 11) is null then '#39#1053#1077#1090#39' else '#39#1044#1072#39' end as' +
        ' Zatrati'
      '       ,namelong'
      '       ,okpo'
      '       ,contact'
      '       ,address'
      '       ,a.postno '
      
        '       ,(select NameCommercialNetwork from OurCommercialNetwork ' +
        'where CommercialNetworkNo = a.CommercialNetworkNo) as NameCommer' +
        'cialNetwork'
      '       '
      '       &_dolg_sql')
    From.Strings = (
      'post a')
    Where.Strings = (
      
        '1=1 &_only_dolg &_only_zatrati &_skip_hidden &_OurCommercialNetw' +
        'ork &_NotSales')
    OrderBy.Strings = (
      'Order by Name')
  end
  object dsOurCommercialNetworkFilter: TMSDataSource
    DataSet = quOurCommercialNetworkFilter
    Left = 533
    Top = 272
  end
  object quOurCommercialNetworkFilter: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select 0 as CommercialNetworkNo, '#39#1042#1089#1077#39' as NameCommercialNetwork'
      'union'
      
        'select CommercialNetworkNo, NameCommercialNetwork from OurCommer' +
        'cialNetwork')
    Left = 445
    Top = 264
  end
end
