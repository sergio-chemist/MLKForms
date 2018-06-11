inherited CFLMLKListForm: TCFLMLKListForm
  Left = 762
  ActiveControl = DBGrid
  Caption = 'CFLMLKListForm'
  ClientHeight = 348
  ClientWidth = 621
  ExplicitWidth = 637
  ExplicitHeight = 387
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TStatusBar
    Top = 329
    Width = 621
    ExplicitTop = 329
    ExplicitWidth = 621
  end
  inherited ToolBar: TToolBar
    Width = 621
    Height = 22
    AutoSize = True
    ExplicitWidth = 621
    ExplicitHeight = 22
    object ToolBtnAdd: TToolButton
      Left = 0
      Top = 0
      Action = ActionItemAdd
    end
    object ToolBtnProp: TToolButton
      Left = 23
      Top = 0
      Action = ActionItemProp
    end
    object ToolBtnDel: TToolButton
      Left = 46
      Top = 0
      Action = ActionItemDel
    end
    object ToolButton4: TToolButton
      Left = 69
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolBtnRefresh: TToolButton
      Left = 77
      Top = 0
      Action = ActionViewRefresh
    end
    object TBCopyProfile: TToolButton
      Left = 100
      Top = 0
      Action = ActionCopyProfile
    end
    object BtnLayot: TToolButton
      Left = 123
      Top = 0
      Action = ActionViewLayout
    end
  end
  object PageControlTop: TPageControl [2]
    Left = 0
    Top = 22
    Width = 621
    Height = 94
    ActivePage = TabSheet1
    Align = alTop
    MultiLine = True
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = #1060#1080#1083#1100#1090#1088#1099
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 497
      ExplicitHeight = 0
      object FilterPanel: TMlkFilterPanel
        Left = 0
        Top = 0
        Width = 613
        Height = 84
        Align = alClient
        BevelInner = bvLowered
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 497
      end
    end
  end
  object PanelGrid: TPanel [3]
    Left = 0
    Top = 116
    Width = 621
    Height = 213
    Align = alClient
    BorderWidth = 2
    Caption = 'PanelGrid'
    TabOrder = 3
    ExplicitWidth = 505
    ExplicitHeight = 96
    object DBGrid: TDBGridEh
      Left = 3
      Top = 3
      Width = 615
      Height = 207
      Align = alClient
      Ctl3D = True
      DataSource = DS
      DynProps = <>
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      PopupMenu = PopupMenuGrid
      TabOrder = 0
      TitleParams.RowHeight = 17
      OnKeyDown = DBGridKeyDown
      OnKeyPress = DBGridKeyPress
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  inherited ActionList: TActionList
    Left = 60
    Top = 180
    inherited ActionDebug: TAction
      ShortCut = 24644
    end
    object ActionItemAdd: TAction
      Category = 'Item'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 0
      ShortCut = 45
    end
    object ActionItemProp: TAction
      Category = 'Item'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1080#1083#1080' '#1080#1079#1084#1077#1085#1077#1085#1080#1077' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 1
      ShortCut = 113
    end
    object ActionItemDel: TAction
      Category = 'Item'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1077#1085#1080#1077' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 2
      ShortCut = 16430
    end
    object ActionViewRefresh: TAction
      Category = 'View'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1055#1077#1088#1077#1095#1080#1090#1072#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1080#1079' '#1041#1044
      ImageIndex = 3
      ShortCut = 116
      OnExecute = ActionViewRefreshExecute
    end
    object ActionViewLayout: TAction
      Category = 'View'
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1074#1085#1077#1096#1085#1077#1075#1086' '#1074#1080#1076#1072' '#1090#1072#1073#1083#1080#1094#1099
      ImageIndex = 4
      OnExecute = ActionViewLayoutExecute
    end
    object ActionViewFilter: TAction
      Category = 'View'
      Caption = #1060#1080#1083#1100#1090#1088#1099
      Hint = #1055#1077#1088#1077#1093#1086#1076' '#1084#1077#1078#1076#1091' '#1092#1080#1083#1100#1090#1088#1072#1084#1080' '#1080' '#1089#1087#1080#1089#1082#1086#1084' '#1080' '#1085#1072#1079#1072#1076
      ImageIndex = 5
      ShortCut = 118
      OnExecute = ActionViewFilterExecute
    end
    object ActionViewFilterOff: TAction
      Category = 'View'
      Caption = #1054#1095#1080#1089#1090#1082#1072' '#1092#1080#1083#1100#1090#1088#1086#1074
      ImageIndex = 6
      ShortCut = 16502
      Visible = False
      OnExecute = ActionViewFilterOffExecute
    end
    object ActionRowSelect: TAction
      Category = 'View'
      Caption = #1042#1099#1076#1077#1083#1103#1090#1100' '#1089#1090#1088#1086#1082#1091
      Checked = True
      ShortCut = 16466
      OnExecute = ActionRowSelectExecute
    end
    object ActionDebugAll: TAction
      Caption = 'ActionDebugAll'
      ShortCut = 57412
    end
    object ActionFind: TAction
      Category = 'Search'
      Caption = #1053#1072#1081#1090#1080
      Enabled = False
      Hint = #1053#1072#1081#1090#1080
      ShortCut = 16454
    end
    object ActionFindNext: TAction
      Category = 'Search'
      Caption = #1053#1072#1081#1090#1080' '#1089#1083#1077#1076#1091#1102#1097#1080#1081
      Enabled = False
      Hint = #1053#1072#1081#1090#1080' '#1089#1083#1077#1076#1091#1102#1097#1080#1081
      ShortCut = 114
    end
    object ActionFindReverse: TAction
      Category = 'Search'
      Caption = #1054#1073#1088#1072#1090#1085#1099#1081' '#1087#1086#1080#1089#1082
      Enabled = False
      Hint = #1054#1073#1088#1072#1090#1085#1099#1081' '#1087#1086#1080#1089#1082
      ShortCut = 8306
    end
    object ActionShowContextValues: TAction
      Caption = 'ActionShowContextValues'
      ShortCut = 57411
    end
    object ActionDebugBuilder: TAction
      Caption = 'ActionDebugBuilder'
      ShortCut = 24642
    end
    object ActionCopyProfile: TAction
      Category = 'View'
      Caption = 'ActionCopyProfile'
      Hint = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      ImageIndex = 19
      OnExecute = ActionCopyProfileExecute
    end
    object ActionRestoreFormat: TAction
      Category = 'View'
      Caption = 'ActionRestoreFormat'
      ImageIndex = 5
    end
  end
  object SQLBuilder: TMlkSQLBuilder
    OnGetOrderBy = SQLBuilderGetOrderBy
    Query = Query
    UseParams = True
    AutoLocate = False
    Left = 332
    Top = 180
  end
  object Query: TMSQuery
    Connection = dmDataModule.DB
    AfterOpen = QueryAfterOpen
    AfterScroll = QueryAfterScroll
    AfterRefresh = QueryAfterRefresh
    Left = 468
    Top = 180
  end
  object DS: TDataSource
    DataSet = Query
    Left = 196
    Top = 180
  end
  object QueryStorage: TMSQuery
    Connection = dmDataModule.DB
    Left = 400
    Top = 180
  end
  object PopupMenuGrid: TPopupMenu
    Left = 264
    Top = 180
    object pmiInsert: TMenuItem
      Action = ActionItemAdd
    end
    object pmiProp: TMenuItem
      Action = ActionItemProp
    end
    object pmiDelete: TMenuItem
      Action = ActionItemDel
    end
    object pmiDiv1: TMenuItem
      Caption = '-'
    end
    object pmiRefresh: TMenuItem
      Action = ActionViewRefresh
    end
    object pmiLayout: TMenuItem
      Action = ActionViewLayout
    end
    object pmiRowSelect: TMenuItem
      Action = ActionRowSelect
    end
    object pmiDiv2: TMenuItem
      Caption = '-'
    end
    object pmiClearFilter: TMenuItem
      Action = ActionViewFilterOff
    end
  end
  object spCopyProfile: TMSStoredProc
    StoredProcName = 'sp_Copy_Profile'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_Copy_Profile (:p_owner_from, :p_owner_t' +
        'o, :p_section)}')
    Left = 536
    Top = 180
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = nil
      end
      item
        DataType = ftString
        Name = 'p_owner_from'
        ParamType = ptInput
        Size = 32
        Value = nil
      end
      item
        DataType = ftString
        Name = 'p_owner_to'
        ParamType = ptInput
        Size = 32
        Value = nil
      end
      item
        DataType = ftString
        Name = 'p_section'
        ParamType = ptInput
        Size = 128
        Value = nil
      end>
  end
end
