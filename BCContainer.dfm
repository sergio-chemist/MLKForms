inherited BCContainerFrame: TBCContainerFrame
  Width = 451
  Height = 305
  Align = alClient
  PopupMenu = PopupMenuGrid
  ExplicitWidth = 451
  ExplicitHeight = 305
  object PanelGrid: TPanel
    Left = 219
    Top = 28
    Width = 120
    Height = 165
    Align = alClient
    BorderWidth = 2
    Caption = 'PanelGrid'
    TabOrder = 2
    object PageControlTop: TcxPageControl
      Left = 3
      Top = 3
      Width = 114
      Height = 70
      Align = alTop
      TabOrder = 0
      Properties.ActivePage = tsMainFilter
      Properties.CustomButtons.Buttons = <>
      Properties.Style = 8
      ClientRectBottom = 70
      ClientRectRight = 114
      ClientRectTop = 24
      object tsMainFilter: TcxTabSheet
        Caption = #1060#1080#1083#1100#1090#1088#1099
      end
      object tsDynamicFilter: TcxTabSheet
        Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100#1089#1082#1080#1081' '#1092#1080#1083#1100#1090#1088
        ImageIndex = 1
        object BarDockControlFlt: TdxBarDockControl
          Left = 0
          Top = 0
          Width = 96
          Height = 46
          Align = dalLeft
          BarManager = BarManager
        end
        object DbFltControlMain: TcxFilterControl
          Left = 96
          Top = 0
          Width = 18
          Height = 46
          Align = alClient
          TabOrder = 1
          OnApplyFilter = DbFltControlMainApplyFilter
        end
      end
    end
    object SplFilter: TcxSplitter
      Left = 3
      Top = 73
      Width = 114
      Height = 8
      HotZoneClassName = 'TcxSimpleStyle'
      AlignSplitter = salTop
      Control = PageControlTop
      OnAfterOpen = SplFilterAfterOpen
      OnAfterClose = SplFilterAfterClose
    end
  end
  object PageExt: TcxPageControl
    Left = 0
    Top = 201
    Width = 451
    Height = 104
    Align = alBottom
    TabOrder = 1
    Properties.ActivePage = TabSelection
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 100
    ClientRectLeft = 4
    ClientRectRight = 447
    ClientRectTop = 24
    object TabSelection: TcxTabSheet
      Caption = #1055#1086#1084#1077#1095#1077#1085#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 1
      object DBGridSelection: TDBGridEh
        Left = 0
        Top = 0
        Width = 443
        Height = 76
        Align = alClient
        DataSource = DSSelection
        DynProps = <>
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleParams.RowHeight = 17
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object SplitterExt: TcxSplitter
    Left = 0
    Top = 193
    Width = 451
    Height = 8
    HotZoneClassName = 'TcxSimpleStyle'
    AlignSplitter = salBottom
    PositionAfterOpen = 60
    Control = PageExt
    OnMoved = SplitterExtMoved
    OnAfterOpen = SplitterExtAfterOpen
    OnAfterClose = SplitterExtAfterClose
  end
  object PageSettings: TcxPageControl
    Left = 0
    Top = 28
    Width = 211
    Height = 165
    Align = alLeft
    TabOrder = 0
    Properties.ActivePage = TabProp2
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 161
    ClientRectLeft = 4
    ClientRectRight = 207
    ClientRectTop = 24
    object TabProp1: TcxTabSheet
      Caption = #1057#1090#1080#1083#1080
      object vgStyleSheets: TcxVerticalGrid
        Left = 0
        Top = 28
        Width = 203
        Height = 109
        Align = alClient
        OptionsView.RowHeaderWidth = 24
        OptionsBehavior.HeaderSizing = False
        TabOrder = 0
        OnItemChanged = vgStyleSheetsItemChanged
        Version = 1
        object vgStyleSheetsNone: TcxCategoryRow
          Properties.Caption = 'None'
          ID = 0
          ParentID = -1
          Index = 0
          Version = 1
        end
        object vgStyleSheetsUserDefinedStyleSheets: TcxCategoryRow
          Tag = -1
          Properties.Caption = 'User defined style sheets'
          ID = 1
          ParentID = -1
          Index = 1
          Version = 1
        end
        object vgStyleSheetsPredefinedStyleSheets: TcxCategoryRow
          Tag = -1
          Properties.Caption = 'Predefined style sheets'
          ID = 2
          ParentID = -1
          Index = 2
          Version = 1
        end
      end
      object BarDockControlDetailsStyle: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 203
        Height = 28
        Align = dalTop
        BarManager = BarManager
      end
    end
    object TabProp2: TcxTabSheet
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1092#1088#1077#1081#1084#1072
      ImageIndex = 1
      object FrameProp: TValueListEditor
        Left = 0
        Top = 28
        Width = 203
        Height = 109
        Align = alClient
        Strings.Strings = (
          'KEYFIELDS=ID'
          'CustomDMClassName='
          'ResourceModuleClassName='
          'PropClassName='
          'MultiSelect=True'
          'ReadOnly=False'
          'GRIDDataSetName=')
        TabOrder = 0
        TitleCaptions.Strings = (
          #1057#1074#1086#1081#1089#1090#1074#1086
          #1047#1085#1072#1095#1077#1085#1080#1077)
        ColWidths = (
          120
          60)
      end
      object BarDockControlSystem: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 203
        Height = 28
        Align = dalTop
        BarManager = BarManager
      end
    end
  end
  object PageDetails: TcxPageControl
    Left = 347
    Top = 28
    Width = 104
    Height = 165
    Align = alRight
    TabOrder = 4
    Properties.ActivePage = TabDetails1
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 161
    ClientRectLeft = 4
    ClientRectRight = 100
    ClientRectTop = 24
    object TabDetails1: TcxTabSheet
      Caption = #1055#1086#1076#1088#1086#1073#1085#1086
      object GridDetails: TcxDBVerticalGrid
        Left = 0
        Top = 0
        Width = 96
        Height = 137
        Align = alClient
        OptionsView.RowHeaderWidth = 54
        Navigator.Buttons.CustomButtons = <>
        TabOrder = 0
        DataController.DataSource = DS
        Version = 1
      end
    end
  end
  object SplitterDetails: TcxSplitter
    Left = 339
    Top = 28
    Width = 8
    Height = 165
    HotZoneClassName = 'TcxSimpleStyle'
    AlignSplitter = salRight
    PositionAfterOpen = 60
    Control = PageDetails
    OnMoved = SplitterDetailsMoved
    OnAfterOpen = SplitterDetailsAfterOpen
    OnAfterClose = SplitterDetailsAfterClose
  end
  object SplitterSettings: TcxSplitter
    Left = 211
    Top = 28
    Width = 8
    Height = 165
    HotZoneClassName = 'TcxSimpleStyle'
    PositionAfterOpen = 60
    Control = PageSettings
    OnMoved = SplitterSettingsMoved
    OnAfterOpen = SplitterSettingsAfterOpen
    OnAfterClose = SplitterSettingsAfterClose
  end
  object BarDockControlCommon: TdxBarDockControl
    Left = 0
    Top = 0
    Width = 451
    Height = 28
    Align = dalTop
    AllowDocking = False
    BarManager = BarManager
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.ini'
    Filter = '*.ini|*.ini'
    Left = 74
    Top = 205
  end
  object UserActionList: TActionList
    Left = 14
    Top = 174
  end
  object DS: TDataSource
    OnDataChange = DSDataChange
    Left = 104
    Top = 174
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '*.ini'
    Filter = '*.ini|*.ini'
    FilterIndex = 0
    Options = [ofHideReadOnly, ofExtensionDifferent, ofEnableSizing]
    Left = 44
    Top = 205
  end
  object CustomActionList: TActionList
    Left = 74
    Top = 175
    object ActionItemAdd: TAction
      Category = 'Item'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 0
      ShortCut = 45
      OnExecute = ActionItemAddExecute
    end
    object ActionItemProp: TAction
      Category = 'Item'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1080#1083#1080' '#1080#1079#1084#1077#1085#1077#1085#1080#1077' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 1
      ShortCut = 113
      OnExecute = ActionItemPropExecute
    end
    object ActionItemDel: TAction
      Category = 'Item'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1077#1085#1080#1077' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 2
      ShortCut = 16430
      OnExecute = ActionItemDelExecute
    end
    object ActionViewRefresh: TAction
      Category = 'View'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1055#1077#1088#1077#1095#1080#1090#1072#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1080#1079' '#1041#1044
      ImageIndex = 33
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
    end
    object ActionViewFilterOff: TAction
      Category = 'View'
      Caption = #1054#1095#1080#1089#1090#1082#1072' '#1092#1080#1083#1100#1090#1088#1086#1074
      Enabled = False
      Hint = #1054#1095#1080#1089#1090#1082#1072' '#1092#1080#1083#1100#1090#1088#1086#1074
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
    object ActionItemsClear: TAction
      Category = 'Item'
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1074#1089#1077' '#1079#1072#1087#1080#1089#1080
      Enabled = False
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1074#1089#1077' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 7
      Visible = False
      OnExecute = ActionItemsClearExecute
    end
    object ActionItemCopy: TAction
      Category = 'Item'
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1080
      Hint = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 8
      OnExecute = ActionItemCopyExecute
    end
    object ActionMark: TAction
      Category = 'Mark'
      Caption = #1055#1086#1084#1077#1090#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      Hint = #1055#1086#1084#1077#1090#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 10
      ShortCut = 115
      OnExecute = ActionMarkExecute
    end
    object ActionMarkAll: TAction
      Category = 'Mark'
      Caption = #1055#1086#1084#1077#1090#1080#1090#1100' '#1074#1089#1077' '#1079#1072#1087#1080#1089#1080
      Hint = #1055#1086#1084#1077#1090#1080#1090#1100' '#1074#1089#1077' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 9
      ShortCut = 8307
      OnExecute = ActionMarkAllExecute
    end
    object ActionItemAudit: TAction
      Category = 'Item'
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1072#1091#1076#1080#1090#1072' '#1079#1072#1087#1080#1089#1080
      Enabled = False
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1072#1091#1076#1080#1090#1072' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 22
      ShortCut = 24641
      Visible = False
      OnExecute = ActionItemAuditExecute
    end
    object ActionItemView: TAction
      Category = 'Item'
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1079#1072#1087#1080#1089#1080
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 11
      ShortCut = 16397
      OnExecute = ActionItemViewExecute
    end
    object ActionExportToExcel: TAction
      Category = 'Export'
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1074' Excel'
      Enabled = False
      Hint = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1074' Excel'
      ImageIndex = 12
      Visible = False
    end
    object ActionMarkInverse: TAction
      Category = 'Mark'
      Caption = #1048#1085#1074#1077#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1080#1077
      Hint = #1048#1085#1074#1077#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1080#1077
      ImageIndex = 14
      OnExecute = ActionMarkInverseExecute
    end
    object ActionUnMarkAll: TAction
      Category = 'Mark'
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1080#1077
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1080#1077
      ImageIndex = 15
      OnExecute = ActionUnMarkAllExecute
    end
    object ActionItemPrint: TAction
      Category = 'Item'
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100
      ImageIndex = 16
    end
    object ActionShowDetails: TAction
      Category = 'View'
      Caption = #1055#1086#1076#1088#1086#1073#1085#1086
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1087#1086#1076#1088#1086#1073#1085#1091#1102' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1086' '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 13
      ShortCut = 16457
      OnExecute = ActionShowDetailsExecute
    end
    object ActionShowMarked: TAction
      Category = 'View'
      Caption = #1042#1099#1073#1088#1072#1085#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1074#1099#1073#1088#1072#1085#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 25
      OnExecute = ActionShowMarkedExecute
    end
    object ActionShowSettings: TAction
      Category = 'View'
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072
      Hint = #1057#1074#1086#1081#1089#1090#1074#1072
      ImageIndex = 23
      OnExecute = ActionShowSettingsExecute
    end
    object ActionItemState: TAction
      Category = 'Item'
      Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '
      Enabled = False
      Hint = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '
      ImageIndex = 17
      Visible = False
    end
    object ActionExpandAll: TAction
      Category = 'View'
      Caption = #1056#1072#1089#1082#1088#1099#1090#1100' '#1074#1089#1077' '#1074#1077#1090#1082#1080' '#1076#1077#1088#1077#1074#1072
      Hint = #1056#1072#1089#1082#1088#1099#1090#1100' '#1074#1089#1077' '#1074#1077#1090#1082#1080' '#1076#1077#1088#1077#1074#1072
      ImageIndex = 20
    end
    object ActionCollapceAll: TAction
      Category = 'View'
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077' '#1074#1077#1090#1082#1080' '#1076#1077#1088#1077#1074#1072
      Hint = #1057#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077' '#1074#1077#1090#1082#1080' '#1076#1077#1088#1077#1074#1072
      ImageIndex = 19
    end
    object ActionShowFilter: TAction
      Category = 'View'
      Caption = #1060#1080#1083#1100#1090#1088#1099
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100'/'#1089#1082#1088#1099#1090#1100' '#1087#1072#1085#1077#1083#1100' '#1092#1080#1083#1100#1090#1088#1086#1074
      ImageIndex = 5
      OnExecute = ActionShowFilterExecute
    end
    object ActionFltLoad: TAction
      Category = 'Filter'
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ImageIndex = 39
      OnExecute = ActionFltLoadExecute
    end
    object ActionFltSave: TAction
      Category = 'Filter'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ImageIndex = 41
      OnExecute = ActionFltSaveExecute
    end
    object ActionFltApply: TAction
      Category = 'Filter'
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      Hint = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ImageIndex = 40
      OnExecute = ActionFltApplyExecute
    end
    object ActionFltCancel: TAction
      Category = 'Filter'
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ImageIndex = 38
      OnExecute = ActionFltCancelExecute
    end
  end
  object SysActionList: TActionList
    Left = 44
    Top = 174
    object ActionDebug: TAction
      Category = 'System'
      Caption = #1044#1077#1073#1072#1075' '#1076#1083#1103' '#1075#1088#1080#1076#1072
      Hint = #1044#1077#1073#1072#1075' '#1076#1083#1103' '#1075#1088#1080#1076#1072
      ImageIndex = 32
      ShortCut = 24644
      OnExecute = ActionDebugExecute
    end
    object ActionViewSqlBuilder: TAction
      Category = 'System'
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' SQL '
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' SQL '
      ImageIndex = 34
      OnExecute = ActionViewSqlBuilderExecute
    end
    object ActionShowSysInfo: TAction
      Category = 'System'
      Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1089#1080#1089#1090#1077#1084#1085#1091#1102' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102
      Hint = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1089#1080#1089#1090#1077#1084#1085#1091#1102' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102
      ImageIndex = 28
      ShortCut = 57417
      OnExecute = ActionShowSysInfoExecute
    end
    object ActionObjectInspector: TAction
      Category = 'System'
      Caption = #1048#1085#1089#1087#1077#1082#1090#1086#1088' '#1086#1073#1098#1077#1082#1090#1086#1074
      Hint = #1048#1085#1089#1087#1077#1082#1090#1086#1088' '#1086#1073#1098#1077#1082#1090#1086#1074
      ImageIndex = 30
      ShortCut = 57423
      OnExecute = ActionObjectInspectorExecute
    end
    object ActionExecSql: TAction
      Category = 'System'
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1079#1072#1087#1088#1086#1089
      Hint = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1079#1072#1087#1088#1086#1089
      ImageIndex = 31
      ShortCut = 57425
    end
    object ActionDebugAll: TAction
      Category = 'System'
      Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1088#1077#1078#1080#1084' Debug '#1076#1083#1103' '#1074#1089#1077#1093' '#1082#1086#1084#1087#1086#1085#1077#1085#1090
      Hint = #1042#1082#1083#1102#1095#1080#1090#1100' '#1088#1077#1078#1080#1084' Debug '#1076#1083#1103' '#1074#1089#1077#1093' '#1082#1086#1084#1087#1086#1085#1077#1085#1090
      ImageIndex = 29
      ShortCut = 57412
      OnExecute = ActionDebugAllExecute
    end
    object ActionShowSysBar: TAction
      Category = 'System'
      Caption = 'ActionShowSysBar'
      ShortCut = 49221
      OnExecute = ActionShowSysBarExecute
    end
    object actLoadStyle: TAction
      Category = 'Style'
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089#1090#1080#1083#1100' '#1080#1079' '#1092#1072#1081#1083#1072
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089#1090#1080#1083#1100' '#1080#1079' '#1092#1072#1081#1083#1072
      ImageIndex = 7
      OnExecute = actLoadStyleExecute
    end
    object actSaveStyle: TAction
      Category = 'Style'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1089#1090#1080#1083#1100' '#1074' '#1092#1072#1081#1083
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1089#1090#1080#1083#1100' '#1074' '#1092#1072#1081#1083
      ImageIndex = 6
      OnExecute = actSaveStyleExecute
    end
    object actEditStyle: TAction
      Category = 'Style'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1089#1090#1080#1083#1100
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1089#1090#1080#1083#1100
      ImageIndex = 8
      OnExecute = actEditStyleExecute
    end
    object ActionScriptExecute: TAction
      Category = 'System'
      Caption = #1047#1072#1087#1091#1089#1090#1080#1090#1100' '#1089#1082#1088#1080#1087#1090
      Hint = #1047#1072#1087#1091#1089#1090#1080#1090#1100' '#1089#1082#1088#1080#1087#1090
      ImageIndex = 43
      OnExecute = ActionScriptExecuteExecute
    end
  end
  object BarManager: TdxBarManager
    AutoAlignBars = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'System'
      'Action'
      'Panels'
      'Customer'
      'DetailsStyle'
      'Mark'
      'GridView'
      'Export'
      'Filter')
    Categories.ItemsVisibles = (
      2
      2
      2
      2
      2
      2
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True
      True
      True
      True
      True
      True
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 104
    Top = 232
    DockControlHeights = (
      0
      0
      0
      0)
    object ToolBarSystem: TdxBar
      Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077
      CaptionButtons = <>
      DockControl = BarDockControlSystem
      DockedDockControl = BarDockControlSystem
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 557
      FloatTop = 0
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'BBtnShowSysInfo'
        end
        item
          Visible = True
          ItemName = 'BBtnObjectInspector'
        end
        item
          Visible = True
          ItemName = 'BBtnExecSQL'
        end
        item
          Visible = True
          ItemName = 'BBtnDebugAll'
        end
        item
          Visible = True
          ItemName = 'BBtnDebug'
        end
        item
          Visible = True
          ItemName = 'BBtnViewSQL'
        end
        item
          Visible = True
          ItemName = 'BBtnScriptExecute'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object ToolBarAction: TdxBar
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      CaptionButtons = <>
      DockControl = BarDockControlCommon
      DockedDockControl = BarDockControlCommon
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 557
      FloatTop = 0
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'BBtnItemAdd'
        end
        item
          Visible = True
          ItemName = 'BBtnItemProp'
        end
        item
          Visible = True
          ItemName = 'BBtnItemView'
        end
        item
          Visible = True
          ItemName = 'BBtnItemCopy'
        end
        item
          Visible = True
          ItemName = 'BBtnItemDel'
        end
        item
          Visible = True
          ItemName = 'BarSubItemMark'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object ToolBarPanels: TdxBar
      Caption = #1055#1072#1085#1077#1083#1080
      CaptionButtons = <>
      DockControl = BarDockControlCommon
      DockedDockControl = BarDockControlCommon
      DockedLeft = 260
      DockedTop = 0
      FloatLeft = 557
      FloatTop = 0
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'BBtnShowSettings'
        end
        item
          Visible = True
          ItemName = 'BBtnShowMarked'
        end
        item
          Visible = True
          ItemName = 'BBtnShowDetails'
        end
        item
          Visible = True
          ItemName = 'bbtnShowFilter'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object ToolBarDetailsStyle: TdxBar
      Caption = #1057#1090#1080#1083#1080' '#1087#1086#1076#1088#1086#1073#1085#1086#1081' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
      CaptionButtons = <>
      DockControl = BarDockControlDetailsStyle
      DockedDockControl = BarDockControlDetailsStyle
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 557
      FloatTop = 0
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'BBtnSaveStyle'
        end
        item
          Visible = True
          ItemName = 'BBtnLoadStyle'
        end
        item
          Visible = True
          ItemName = 'BBtnEditStyle'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object ToolBarCustomer: TdxBar
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100#1089#1082#1080#1081
      CaptionButtons = <>
      DockControl = BarDockControlCommon
      DockedDockControl = BarDockControlCommon
      DockedLeft = 564
      DockedTop = 0
      FloatLeft = 557
      FloatTop = 0
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = False
      WholeRow = False
    end
    object ToolBarGRIDView: TdxBar
      Caption = #1042#1080#1076' '#1090#1072#1073#1083#1080#1094#1099
      CaptionButtons = <>
      DockControl = BarDockControlCommon
      DockedDockControl = BarDockControlCommon
      DockedLeft = 367
      DockedTop = 0
      FloatLeft = 586
      FloatTop = 0
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'BBtnViewRefresh'
        end
        item
          Visible = True
          ItemName = 'BBtnViewLayout'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object ToolBarExport: TdxBar
      Caption = 'Export'
      CaptionButtons = <>
      DockControl = BarDockControlCommon
      DockedDockControl = BarDockControlCommon
      DockedLeft = 441
      DockedTop = 0
      FloatLeft = 690
      FloatTop = 0
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'BarSubItemExport'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = False
      WholeRow = False
    end
    object ToolBarFilter: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      BorderStyle = bbsNone
      Caption = #1060#1080#1083#1100#1090#1088#1099
      CaptionButtons = <>
      DockControl = BarDockControlFlt
      DockedDockControl = BarDockControlFlt
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 524
      FloatTop = 316
      FloatClientWidth = 51
      FloatClientHeight = 50
      ItemLinks = <
        item
          Visible = True
          ItemName = 'BBtnFltLoad'
        end
        item
          Visible = True
          ItemName = 'BBtnFltSave'
        end
        item
          Visible = True
          ItemName = 'BBtnFltCancel'
        end
        item
          Visible = True
          ItemName = 'BBtnFltApply'
        end>
      MultiLine = True
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object BBtnShowSysInfo: TdxBarButton
      Action = ActionShowSysInfo
      Category = 0
    end
    object BBtnObjectInspector: TdxBarButton
      Action = ActionObjectInspector
      Category = 0
    end
    object BBtnExecSQL: TdxBarButton
      Action = ActionExecSql
      Category = 0
    end
    object BBtnDebugAll: TdxBarButton
      Action = ActionDebugAll
      Category = 0
      ButtonStyle = bsChecked
    end
    object BBtnDebug: TdxBarButton
      Action = ActionDebug
      Category = 0
      ButtonStyle = bsChecked
    end
    object BBtnViewSQL: TdxBarButton
      Action = ActionViewSqlBuilder
      Category = 0
    end
    object BBtnScriptExecute: TdxBarButton
      Action = ActionScriptExecute
      Category = 0
    end
    object BBtnItemAdd: TdxBarButton
      Action = ActionItemAdd
      Category = 1
    end
    object BBtnItemProp: TdxBarButton
      Action = ActionItemProp
      Category = 1
    end
    object BBtnItemView: TdxBarButton
      Action = ActionItemView
      Category = 1
    end
    object BBtnItemDel: TdxBarButton
      Action = ActionItemDel
      Category = 1
    end
    object BBtnItemsClear: TdxBarButton
      Action = ActionItemsClear
      Category = 1
    end
    object BBtnItemAudit: TdxBarButton
      Action = ActionItemAudit
      Category = 1
    end
    object BBtnItemCopy: TdxBarButton
      Action = ActionItemCopy
      Category = 1
    end
    object BBtnShowSettings: TdxBarButton
      Action = ActionShowSettings
      Category = 2
      ButtonStyle = bsChecked
    end
    object BBtnShowMarked: TdxBarButton
      Action = ActionShowMarked
      Category = 2
      ButtonStyle = bsChecked
    end
    object BBtnShowDetails: TdxBarButton
      Action = ActionShowDetails
      Category = 2
      ButtonStyle = bsChecked
    end
    object bbtnShowFilter: TdxBarButton
      Action = ActionShowFilter
      Category = 2
      ButtonStyle = bsChecked
    end
    object BBtnSaveStyle: TdxBarButton
      Action = actSaveStyle
      Category = 4
    end
    object BBtnLoadStyle: TdxBarButton
      Action = actLoadStyle
      Category = 4
    end
    object BBtnEditStyle: TdxBarButton
      Action = actEditStyle
      Category = 4
    end
    object BBtnMark: TdxBarButton
      Action = ActionMark
      Category = 5
    end
    object BBtnMarkAll: TdxBarButton
      Action = ActionMarkAll
      Category = 5
    end
    object BBtnMarkInverse: TdxBarButton
      Action = ActionMarkInverse
      Category = 5
    end
    object BBtnUnMarkAll: TdxBarButton
      Action = ActionUnMarkAll
      Category = 5
    end
    object BarSubItemMark: TdxBarSubItem
      Caption = #1052#1077#1090#1082#1072
      Category = 5
      Visible = ivAlways
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        080000000000000100000000000000000000000100000000000000730800008C
        0800EFA54A00C6846B00BD8C7300CE947300EFB57300FFC67300BD847B00C694
        7B0084848400B5848400B58C8400CE9C8400B5948C00C6A59400EFCE9400C6A5
        9C00EFCE9C00F7D69C00C6ADA500F7D6A500C6BDAD00F7D6AD00DEBDB500DEC6
        B500E7C6B500EFCEB500F7D6B500F7DEB500EFCEBD00F7DEBD00E7DEC600F7DE
        C600F7E7C6000063CE00E7CECE00E7D6CE00F7E7CE00F7E7D600FFEFD600FFEF
        DE00FFEFE700FFF7E700FFF7EF00FFF7F700FFFFF700FF00FF0010F7FF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002F2F0B0B0B0B
        0B0B0B0B0B0B0B0B0B2F2F2F1128221F1D171512101010130B2F2F2F11280A0A
        0A0A0A0A0A0A0A120B2F2F2F142A2726211F1C17121210120B2F002F142B2726
        22211D1C171212100B2F0000002E232323232323232323120B2F000000003030
        30303030303030120B2F010101013030303030303030301D0B2F010101312323
        232323232323231D0B2F012F183131312D2A29272621211C0B2F2F2F19313131
        312D2A29292820160B2F2F2F1A310A0A0A0A0A2C270F0E0C0B2F2F2F1A313131
        3131312E24040602032F2F2F1E31313131313131250907052F2F2F2F1A2D2C2C
        2C2C2C2C24090D2F2F2F2F2F1A1B1B1B1B1A1A1B18082F2F2F2F}
      ItemLinks = <
        item
          Visible = True
          ItemName = 'BBtnMark'
        end
        item
          Visible = True
          ItemName = 'BBtnMarkAll'
        end
        item
          Visible = True
          ItemName = 'BBtnMarkInverse'
        end
        item
          Visible = True
          ItemName = 'BBtnUnMarkAll'
        end>
    end
    object BBtnViewLayout: TdxBarButton
      Action = ActionViewLayout
      Category = 6
    end
    object BBtnViewRefresh: TdxBarButton
      Action = ActionViewRefresh
      Category = 6
    end
    object BBtnCollapseAll: TdxBarButton
      Action = ActionCollapceAll
      Category = 6
    end
    object BBtnExpandAll: TdxBarButton
      Action = ActionExpandAll
      Category = 6
    end
    object BarSubItemGridRowView: TdxBarSubItem
      Caption = #1042#1080#1076' '#1089#1090#1088#1086#1082
      Category = 6
      Visible = ivNever
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        080000000000000100000000000000000000000100000000000000730800008C
        0800EF9C2100F7A55A00FFE7C600FFF7E700FF00FF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00060606060606
        0606060606060606060606060106060606030303030303030303060101000606
        0602050505050505050501010000000606020505050505050505060600060606
        0602040404040404040406060006060606020404040404040404060606060606
        0602040404040404040406060606060606020404040404040404060606060606
        0602040404040404040406060006060606020404040404040404060600060606
        0602040404040404040401010000000606020404040404040404060101000606
        0602040404040404040406060106060606020202020202020202060606060606
        0606060606060606060606060606060606060606060606060606}
      ItemLinks = <
        item
          Visible = True
          ItemName = 'BBtnCollapseAll'
        end
        item
          Visible = True
          ItemName = 'BBtnExpandAll'
        end>
    end
    object BBtnExport: TdxBarButton
      Action = ActionExportToExcel
      Category = 7
    end
    object BarSubItemExport: TdxBarSubItem
      Caption = #1069#1082#1089#1087#1086#1088#1090
      Category = 7
      Visible = ivAlways
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000080
        0006007E00890077006000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000008800A800B100EE006B0052000000000000000000000000000000000000
        0000000000000000000000000000352A2A01130D0D190A03032A0A0303280B03
        032813090628180A0629110706280A0202280901012809000028080000270B00
        0123027200AB00FC00FF00BE00EF004900570000000000000000000000000000
        0000000000000000000000000000423333189F8484C0B9A7A7E1B5A2A2DDC0A9
        A6DD93828ADD656072DE9C8386DDBBA09CDDB59E9DDDB19898DDB19597DCB18D
        95DA46B33BF215FF16FF24FF23FF1DCA1CEE0291025700000000000000000000
        0000000000000000000000000000513B3B21CEB9B9EAFFFFFFFFFFFFFFFFD5DB
        E7FF69ABD2FF5EB8E1FF76A7C9FFB3BECDFFF4F0F1FFFFFFFFFFFFFFFFFFFDFF
        FDFF73E373FF7DF57FFF94FE98FF9DFFA0FF64E464F509C50864000000000000
        00000000000000000000000000004D3A3B1FCAB7B6E2FFFFFFFFC0CCDBFF54A0
        CCFF3FC0F6FF6DD8FFFF6BCBF6FF60AED6FF7297B6FFB0B3C0FFEFE4E4FFFFFA
        F8FFA4EAA9FF8BE899FF90D794FF559852C23BD4459B0ADC2186000000000000
        00000000000000000000000000005A43411ED0B8B5E1BBCFE2FF56A7D4FF46C4
        FAFF4FCAFFFF6ACCFFFF6ECEFFFF78D9FFFF74CFF5FF66A9CAFF7C97B0FFBEBB
        C4FFF1E7E9FFF5F7F4FFE1C6CCFF3930226B0000000004D92305000000000000
        00000000000000000000000000004536371A8491A7E35FB8E5FF5ACEFCFF59CC
        FFFF5DCBFFFF6ACDFFFF64C6FFFF6FCDFFFF7BD6FFFF8AE3FFFF81D4EDFF65A0
        C0FF8999B0FFF3E9EBFFECD4D5FF3F282A700000000000000000000000000000
        00000000000000000000000C19022251727B62BDEAFA6DD8FFFF6AD2FFFF64CF
        FFFF68D1FFFF69CCFFFF5BC1FFFF69CAFFFF74CFFFFF7ED5FFFF8FE3FFFF8EE7
        FEFF6A9DBBFFDED5D9FFEED7D5FF3F2B2B710000000000000000000000000000
        000000000000000000000D487A1855A6D1D885E7FFFF78D7FFFF75D4FFFF70D3
        FFFF73D5FFFF68CAFFFF54BDFFFF61C5FFFF6DCCFFFF77D2FFFF83D9FFFF8CE2
        FDFF76A9C5FFDED6D9FFEDD7D4FF402D2D710000000000000000000000000000
        000000000000000000000C53891A5EACD3D290E7FFFF83DBFFFF80D9FFFF7BD7
        FFFF83DDFFFF70CEFFFF4AB8FFFF59C1FFFF66C8FFFF71CFFFFF7CD6FFFF83DD
        FCFF73A6C5FFDED5D9FFEDD7D4FF422E2E710000000000000000000000000000
        000000000000000000000A538B1962ADD4D19DECFFFF8FE0FFFF89DEFFFF8CDF
        FFFF83D9FEFF60C2FAFF55BFFEFF56C0FFFF5DC3FFFF69CAFFFF76D3FFFF7CD9
        FDFF71A6C8FFDED3D6FFEFD8D6FF433131710000000000000000000000000000
        000000000000000000000A558E1966B0D5D1A8F0FFFF99E5FFFF9BE5FFFF8FDE
        FFFF66C8FFFF50B5F5FF5FC2FBFF66C8FFFF64C8FFFF64C8FFFF6CCCFFFF74D4
        FDFF6EA6C9FFDDD2D5FFF0DAD8FF443434710000000000000000000000000000
        00000000000000000000095994196AB3D8D1B3F5FFFFA9EBFFFF9CE3FFFF78D0
        FFFF74CEFFFF6AC2F5FF6CC6F7FF7AD1FFFF7BD3FFFF7CD4FFFF77D4FFFF70D5
        FFFF6AA7CCFFDBD1D3FFEFD9D7FF453535710000000000000000000000000000
        00000000000000000000065A971A72B9DAD2C5FDFFFFAAE8FFFF8EDAFFFF8BD9
        FFFF92DCFFFF84D2FAFF70C5F2FF86D4FAFF7CCCF4FF78C4EEFF7DC5EAFF77CA
        EDFF629DC6FFDED4D7FFEED8D7FF453738710000000000000000000000000000
        00000000000000000000065A971A74BBDDDBC8FEFFFFA5E5FFFF9CE0FDFF9FE1
        FDFFA0E2FDFFA0E2FDFF60B7EBFF4FA7DEFF61ABD9FF78B7DBFF8BCAE4FF69A8
        CEFF9BADC3FFF3E6E5FFE9D4D4FF463838710000000000000000000000000000
        0000000000000000000010589A063B8AC28581CBEEF9A5E4FBFFB8EDFDFFADE7
        FBFFA8E4FAFF9BDBF6FF8ACFEFFFA9E3F6FFC0F3FCFFC2F9FFFF84C3DEFFABB9
        CCFFF7E3E1FFF5E9E9FFE9D5D6FF483A3A710000000000000000007800050074
        0001000000000000000000000000315D4817B0B9CEE29BD5F6FF9AD9F3FFC9F4
        FCFFE0FEFFFFCDF6FCFFB5E6F5FFE6FFFFFFCFFAFEFF81BBD8FFAAB5C7FFEEDB
        D7FFE4D4D3FFE5D7D7FFE6D2D2FF4C3E3E760000000000000000007900860085
        009F0082009800830099008800A02B661D7CE2CDD2D9F7FBFEFFBADDF3FF92CD
        EFFFAFE0F5FFD6F8FDFFD6F9FDFFD0F3FBFF8BC2E2FFA5AEBDFFDDC4C0FFD9C9
        C8FFD4C4C4FFD8C5C5FFC2A6A6F83B30305100000000000000000075006400A0
        00F400C800FF00C600FF00C200FF297E26C4DBCBD5D7FFFFFFFFFFFFFFFFEAF4
        FBFFADD7F1FF93CEEFFF9DD9F2FF89C2E4FFC9DAE6FFE9D5D0FFEDE6E6FFFEFE
        FFFFFFFFFFFFDECCCCF7745E5E7214101005000000000000000000000000007F
        005700BB00ED00E900FF00E300FF298B27BBDCCBD7D7FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE0EFF9FFACD4EEFFD7E5EFFFFFFAF6FFDFD3D3FFEFEAEAFFFFFF
        FFFFE1D0D0FA7A66667100000000000000000000000000000000000000000000
        00000093005402D402EE08FD09FF2C9D2BBADBCBD8D7FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFCF9FFF9F4F4FFDFD3D3FFF5EEEEFFE6D9
        D9FA675757790000000000000000000000000000000000000000000000000000
        00000000000002AC025221E222EB40AA3EC8DAD0D8DEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFEFEFFFDFAFAFFFCF7F7FFE6DADAFFD8C7C7F97468
        6876000000000000000000000000000000000000000000000000000000000000
        0000000000000000000007C7075A31A8339DD3C8D1C1EAE6E8E1E5E1E1DDE4E0
        E0DDE2DEDEDDE2DBDBDDE1DADADDDED6D6DDE0D6D6E0D9CBCBDF746868752B25
        2501000000000000000000000000000000000000000000000000}
      ItemLinks = <
        item
          Visible = True
          ItemName = 'BBtnExport'
        end>
    end
    object BBtnFltLoad: TdxBarButton
      Action = ActionFltLoad
      Category = 8
    end
    object BBtnFltSave: TdxBarButton
      Action = ActionFltSave
      Category = 8
    end
    object BBtnFltApply: TdxBarButton
      Action = ActionFltApply
      Category = 8
    end
    object BBtnFltCancel: TdxBarButton
      Action = ActionFltCancel
      Category = 8
    end
    object BarGroupSystemDebug: TdxBarGroup
      Items = (
        'BBtnExecSQL'
        'BBtnDebugAll'
        'BBtnDebug'
        'BBtnViewSQL')
    end
    object BarGroupSystemInfo: TdxBarGroup
      Items = (
        'BBtnShowSysInfo'
        'BBtnObjectInspector')
    end
  end
  object PropStore: TcxPropertiesStore
    Components = <
      item
      end>
    StorageName = 'd:\test.ini'
    Left = 136
    Top = 174
  end
  object PopupMenuGrid: TPopupMenu
    Left = 164
    Top = 175
    object pmiInsert: TMenuItem
      Action = ActionItemAdd
    end
    object pmiProp: TMenuItem
      Action = ActionItemProp
    end
    object pmiDelete: TMenuItem
      Action = ActionItemDel
    end
    object mniDiv1: TMenuItem
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
    object mniDiv2: TMenuItem
      Caption = '-'
    end
    object pmiClearFilter: TMenuItem
      Action = ActionViewFilterOff
    end
    object mniActionShowSysBar: TMenuItem
      Action = ActionShowSysBar
      Visible = False
    end
  end
  object DSSelection: TDataSource
    DataSet = VTSelection
    Left = 164
    Top = 205
  end
  object VTSelection: TVirtualTable
    Left = 134
    Top = 205
    Data = {03000000000000000000}
  end
  object PopMenuGRID: TcxGridPopupMenu
    PopupMenus = <
      item
        HitTypes = []
        Index = 0
      end>
    Left = 104
    Top = 205
  end
end
