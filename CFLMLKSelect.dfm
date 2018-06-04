inherited CFLMLKSelectDlg: TCFLMLKSelectDlg
  Left = 451
  Top = 185
  Caption = 'CFLMLKSelectDlg'
  ClientHeight = 413
  ClientWidth = 629
  KeyPreview = True
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyUp = FormKeyUp
  ExplicitWidth = 645
  ExplicitHeight = 452
  DesignSize = (
    629
    413)
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl [0]
    Left = 0
    Top = 0
    Width = 629
    Height = 339
    ActivePage = TabSheet1
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 506
    object TabSheet1: TTabSheet
      Caption = #1057#1087#1080#1089#1086#1082
      ExplicitWidth = 498
      object Splitter: TSplitter
        Left = 399
        Top = 0
        Height = 311
        Align = alRight
        Visible = False
        ExplicitLeft = 305
        ExplicitHeight = 226
      end
      object PanelGrid: TPanel
        Left = 0
        Top = 0
        Width = 399
        Height = 311
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 276
        object ToolBar: TToolBar
          Left = 1
          Top = 1
          Width = 397
          Height = 22
          AutoSize = True
          Caption = 'ToolBar'
          Ctl3D = False
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Images = dmDataModule.ImageListToolBar
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          ExplicitWidth = 274
          object ToolButtonRefresh: TToolButton
            Left = 0
            Top = 0
            Action = ActionViewRefresh
          end
          object ToolButtonLayout: TToolButton
            Left = 23
            Top = 0
            Action = ActionViewLayout
          end
          object ToolButton6: TToolButton
            Left = 46
            Top = 0
            Action = ActionCopyProfile
          end
          object ToolButton5: TToolButton
            Left = 69
            Top = 0
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 26
            Style = tbsSeparator
          end
          object btnViewSql: TToolButton
            Left = 77
            Top = 0
            Action = ActionViewBuilderSQL
          end
          object ToolButton1: TToolButton
            Left = 100
            Top = 0
            Action = ActionViewDataSetSQL
          end
          object ToolButton2: TToolButton
            Left = 123
            Top = 0
            Action = ActionViewSelectedSQL
          end
        end
        object DBGrid: TDBGridEh
          Left = 1
          Top = 23
          Width = 397
          Height = 287
          Align = alClient
          DataSource = DS
          DynProps = <>
          TabOrder = 1
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object PanelSelect: TPanel
        Left = 402
        Top = 0
        Width = 219
        Height = 311
        Align = alRight
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        Visible = False
        ExplicitLeft = 279
        object ToolBar1: TToolBar
          Left = 1
          Top = 1
          Width = 217
          Height = 22
          AutoSize = True
          Caption = 'ToolBar'
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Images = dmDataModule.ImageListToolBar
          Indent = 3
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object ToolButton8: TToolButton
            Left = 3
            Top = 0
            Action = ActionMark
          end
          object ToolButton11: TToolButton
            Left = 26
            Top = 0
            Action = ActionUnMark
          end
          object ToolButton10: TToolButton
            Left = 49
            Top = 0
            Width = 8
            Caption = 'ToolButton7'
            ImageIndex = 20
            Style = tbsSeparator
          end
          object ToolButton9: TToolButton
            Left = 57
            Top = 0
            Action = ActionMarkAll
          end
          object ToolButton12: TToolButton
            Left = 80
            Top = 0
            Action = ActionUnMarkAll
          end
          object ToolButton4: TToolButton
            Left = 103
            Top = 0
            Width = 8
            Caption = 'ToolButton4'
            ImageIndex = 37
            Style = tbsSeparator
          end
          object ToolButton3: TToolButton
            Left = 111
            Top = 0
            Action = ActionRefreshSelected
          end
        end
        object DBGridSelection: TDBGridEh
          Left = 1
          Top = 23
          Width = 217
          Height = 287
          Align = alClient
          DataSource = DSSelection
          DynProps = <>
          TabOrder = 1
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
  object ButtonSelect: TButton [1]
    Left = 546
    Top = 349
    Width = 75
    Height = 25
    Action = ActionFormSelect
    Anchors = [akRight, akBottom]
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object ButtonCancel: TButton [2]
    Left = 546
    Top = 380
    Width = 75
    Height = 25
    Action = ActionFormCancel
    Anchors = [akRight, akBottom]
    Cancel = True
    ModalResult = 2
    TabOrder = 2
  end
  object pnlFilter: TPanel [3]
    Left = 0
    Top = 339
    Width = 394
    Height = 74
    Align = alLeft
    BevelOuter = bvLowered
    TabOrder = 3
    ExplicitLeft = 3
    ExplicitTop = 340
    ExplicitHeight = 87
  end
  inherited ActionList: TActionList
    Left = 244
    Top = 96
    object ActionViewRefresh: TAction
      Category = 'View'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1083#1103#1077#1090' '#1080' '#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1085#1072' '#1101#1082#1088#1072#1085#1077
      ImageIndex = 3
      ShortCut = 116
      OnExecute = ActionViewRefreshExecute
    end
    object ActionViewLayout: TAction
      Category = 'View'
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1074#1085#1077#1096#1085#1077#1075#1086' '#1074#1080#1076#1072' '#1101#1082#1088#1072#1085#1072
      ImageIndex = 4
      ShortCut = 118
      OnExecute = ActionViewLayoutExecute
    end
    object ActionGridFirst: TAction
      Category = 'Grid'
      Caption = #1055#1077#1088#1074#1099#1081
      Hint = #1055#1077#1088#1077#1093#1086#1076' '#1085#1072' '#1087#1077#1088#1074#1091#1102' '#1089#1090#1088#1086#1082#1091' '#1074' '#1089#1087#1080#1089#1082#1077
      ImageIndex = 2
      OnExecute = ActionGridFirstExecute
    end
    object ActionGridPrior: TAction
      Category = 'Grid'
      Caption = #1055#1088#1077#1076#1099#1076#1091#1097#1080#1081
      Hint = #1055#1077#1088#1077#1093#1086#1076' '#1085#1072' '#1087#1088#1077#1076#1099#1076#1091#1097#1091#1102' '#1089#1090#1088#1086#1082#1091' '#1074' '#1089#1087#1080#1089#1082#1077
      ImageIndex = 3
      OnExecute = ActionGridPriorExecute
    end
    object ActionGridNext: TAction
      Category = 'Grid'
      Caption = #1057#1083#1077#1076#1091#1102#1097#1080#1081
      Hint = #1055#1077#1088#1077#1093#1086#1076' '#1085#1072' '#1089#1083#1077#1076#1091#1102#1097#1091#1102' '#1089#1090#1088#1086#1082#1091' '#1074' '#1089#1087#1080#1089#1082#1077
      ImageIndex = 4
      OnExecute = ActionGridNextExecute
    end
    object ActionGridLast: TAction
      Category = 'Grid'
      Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1081
      Hint = #1055#1077#1088#1077#1093#1086#1076' '#1085#1072' '#1087#1086#1089#1083#1077#1076#1085#1102#1102' '#1089#1090#1088#1086#1082#1091' '#1074' '#1089#1087#1080#1089#1082#1077
      ImageIndex = 5
      OnExecute = ActionGridLastExecute
    end
    object ActionFormSelect: TAction
      Category = 'Form'
      Caption = #1042#1099#1073#1086#1088
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1086#1090#1084#1077#1095#1077#1085#1085#1091#1102' '#1089#1090#1088#1086#1082#1091
      OnExecute = ActionFormSelectExecute
    end
    object ActionFormCancel: TAction
      Category = 'Form'
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1047#1072#1082#1088#1099#1090#1080#1077' '#1092#1086#1088#1084#1099' '#1073#1077#1079' '#1074#1099#1073#1086#1088#1072
      OnExecute = ActionFormCancelExecute
    end
    object ActionItemAdd: TAction
      Category = 'Item'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Enabled = False
      Hint = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 0
      ShortCut = 45
    end
    object ActionItemProp: TAction
      Category = 'Item'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Enabled = False
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1080#1083#1080' '#1080#1079#1084#1077#1085#1077#1085#1080#1077' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 1
      ShortCut = 113
    end
    object ActionItemDel: TAction
      Category = 'Item'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Enabled = False
      Hint = #1059#1076#1072#1083#1077#1085#1080#1077' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 2
      ShortCut = 16430
    end
    object ActionViewSelectedSQL: TAction
      Caption = 'ActionViewSelectedSQL'
      ImageIndex = 25
      ShortCut = 49239
    end
    object ActionMark: TAction
      Category = 'Item'
      Caption = #1055#1086#1084#1077#1090#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      Hint = #1055#1086#1084#1077#1090#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 36
      ShortCut = 115
      OnExecute = ActionMarkExecute
    end
    object ActionUnMark: TAction
      Category = 'Item'
      Caption = #1057#1085#1103#1090#1100' '#1087#1086#1084#1077#1090#1082#1091' '#1079#1072#1087#1080#1089#1080
      Hint = #1057#1085#1103#1090#1100' '#1087#1086#1084#1077#1090#1082#1091' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 34
      ShortCut = 114
      OnExecute = ActionUnMarkExecute
    end
    object ActionViewBuilderSQL: TAction
      Caption = 'ActionViewBuilderSQL'
      Hint = 'Builder'
      ImageIndex = 20
      ShortCut = 24644
    end
    object ActionCopyProfile: TAction
      Category = 'View'
      Caption = 'ActionCopyProfile'
      Hint = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      ImageIndex = 19
      OnExecute = ActionCopyProfileExecute
    end
    object ActionUnMarkAll: TAction
      Category = 'Item'
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1089#1077
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1074#1089#1077
      ImageIndex = 35
      ShortCut = 16450
      OnExecute = ActionUnMarkAllExecute
    end
    object ActionMarkAll: TAction
      Category = 'Item'
      Caption = #1055#1086#1084#1077#1090#1080#1090#1100' '#1074#1089#1077
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1089#1077
      ImageIndex = 33
      ShortCut = 16449
      OnExecute = ActionMarkAllExecute
    end
    object ActionViewDataSetSQL: TAction
      Caption = 'ActionViewDataSetSQL'
      Hint = 'DataSet Query'
      ImageIndex = 13
    end
    object ActionRefreshSelected: TAction
      Category = 'View'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 3
      OnExecute = ActionRefreshSelectedExecute
    end
  end
  object DS: TDataSource
    DataSet = Query
    Left = 124
    Top = 148
  end
  object Query: TMSQuery
    Connection = dmDataModule.DB
    AfterOpen = QueryAfterOpen
    AfterScroll = QueryAfterScroll
    AfterRefresh = QueryAfterRefresh
    Left = 95
    Top = 148
  end
  object QueryProp: TMSQuery
    Connection = dmDataModule.DB
    Left = 39
    Top = 124
  end
  object DSSelection: TDataSource
    DataSet = QuSelectList
    Left = 352
    Top = 153
  end
  object QuSelectList: TMSQuery
    Connection = dmDataModule.DB
    AfterOpen = QuSelectListAfterOpen
    Left = 346
    Top = 89
  end
  object spCopyProfile: TMSStoredProc
    StoredProcName = 'sp_Copy_Profile'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_Copy_Profile (:p_owner_from, :p_owner_t' +
        'o, :p_section)}')
    Left = 448
    Top = 80
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
  object SQLBuilder: TMLKSQLBuilder
    OnGetWhere = SQLBuilderGetWhere
    Query = Query
    KeyFields.Strings = (
      'ID')
    AutoLocate = False
    Left = 411
    Top = 240
  end
end
