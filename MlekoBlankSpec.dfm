inherited MlekoBlankSpecForm: TMlekoBlankSpecForm
  Left = 330
  Top = 123
  Width = 1253
  Height = 627
  Caption = #1057#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1103' '#1079#1072#1082#1072#1079#1072
  KeyPreview = True
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter: TSplitter [0]
    Left = 0
    Top = 445
    Width = 1237
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  inherited StatusBar: TStatusBar
    Top = 567
    Width = 1237
    Height = 21
    Panels = <
      item
        Width = 50
      end>
    Visible = False
  end
  inherited ToolBar: TToolBar
    Width = 1237
    Height = 25
    ButtonHeight = 23
    object ToolButton10: TToolButton
      Left = 146
      Top = 0
      Action = ActionCopyToExcel
    end
    object ToolButton6: TToolButton
      Left = 169
      Top = 0
      Action = ActionFind
    end
    object ToolButton7: TToolButton
      Left = 192
      Top = 0
      Action = ActionShowPackWeight
    end
    object ToolButton2: TToolButton
      Left = 215
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 223
      Top = 0
      Action = ActionViewRest
      Style = tbsCheck
    end
    object ToolButton9: TToolButton
      Left = 246
      Top = 0
      Action = ActionChangePrice
    end
    object ToolButton12: TToolButton
      Left = 269
      Top = 0
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 22
      Style = tbsSeparator
    end
    object ToolButton11: TToolButton
      Left = 277
      Top = 0
      Action = ActionAllZero
    end
  end
  inherited PageControlTop: TPageControl
    Top = 25
    Width = 1237
    Height = 91
    inherited TabSheet1: TTabSheet
      inherited FilterPanel: TTargetFilter_Panel
        Width = 1229
        Height = 81
        object Panel1: TPanel
          Left = 1
          Top = 32
          Width = 75
          Height = 26
          Align = alLeft
          Caption = 'Panel1'
          TabOrder = 0
          object CBPriceEnable: TCheckBox
            Left = 3
            Top = 4
            Width = 68
            Height = 17
            Action = ActionEnableChangePrice
            Caption = #1048#1079#1084'. '#1062#1077#1085
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
          end
        end
        object Panel2: TPanel
          Left = 1
          Top = 1
          Width = 1227
          Height = 31
          Align = alTop
          TabOrder = 1
          object DBText1: TDBText
            Left = 2
            Top = 15
            Width = 187
            Height = 15
            Color = clInfoBk
            DataField = 'PostName'
            DataSource = DSBlankParam
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label1: TLabel
            Left = 61
            Top = 1
            Width = 59
            Height = 13
            Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
          end
          object DBText2: TDBText
            Left = 193
            Top = 15
            Width = 71
            Height = 15
            Color = clInfoBk
            DataField = 'DateNakl'
            DataSource = DSBlankParam
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label7: TLabel
            Left = 193
            Top = 1
            Width = 70
            Height = 13
            Caption = #1044#1072#1090#1072' '#1088#1072#1089#1093#1086#1076#1072
          end
          object DBText3: TDBText
            Left = 268
            Top = 15
            Width = 84
            Height = 15
            Color = clInfoBk
            DataField = 'buhName'
            DataSource = DSBlankParam
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label4: TLabel
            Left = 291
            Top = 1
            Width = 19
            Height = 13
            Caption = #1058#1080#1087
          end
          object DBText4: TDBText
            Left = 356
            Top = 15
            Width = 86
            Height = 15
            Color = clInfoBk
            DataField = 'ColnPriceName'
            DataSource = DSBlankParam
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label3: TLabel
            Left = 360
            Top = 1
            Width = 72
            Height = 13
            Caption = #1050#1086#1083#1086#1085#1082#1072' '#1094#1077#1085#1099
          end
          object DBText5: TDBText
            Left = 448
            Top = 15
            Width = 54
            Height = 15
            Color = clInfoBk
            DataField = 'KolDayPlan'
            DataSource = DSBlankParam
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label2: TLabel
            Left = 458
            Top = 1
            Width = 27
            Height = 13
            Caption = #1044#1085#1077#1081
          end
          object Label5: TLabel
            Left = 529
            Top = 0
            Width = 26
            Height = 13
            Caption = #1044#1086#1083#1075
          end
          object DBText6: TDBText
            Left = 600
            Top = 12
            Width = 130
            Height = 15
            Color = clInfoBk
            DataField = 'UserName'
            DataSource = DSBlankParam
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label6: TLabel
            Left = 616
            Top = 1
            Width = 73
            Height = 13
            Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
          end
          object Label12: TLabel
            Left = 752
            Top = 0
            Width = 58
            Height = 13
            Caption = #1050#1086#1076' '#1079#1072#1082#1072#1079#1072
          end
          object DBText10: TDBText
            Left = 744
            Top = 12
            Width = 80
            Height = 15
            Color = clInfoBk
            DataField = 'Document_Id'
            DataSource = DSBlankParam
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object DBText11: TDBText
            Left = 832
            Top = 11
            Width = 58
            Height = 15
            Color = clInfoBk
            DataField = 'CurrencyHead'
            DataSource = DSBlankParam
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label13: TLabel
            Left = 832
            Top = 0
            Width = 38
            Height = 13
            Caption = #1042#1072#1083#1102#1090#1072
          end
          object ceSummaDolg: TComboEdit
            Left = 505
            Top = 12
            Width = 92
            Height = 18
            TabStop = False
            Alignment = taRightJustify
            BorderStyle = bsNone
            Ctl3D = False
            DirectInput = False
            NumGlyphs = 1
            ParentCtl3D = False
            TabOrder = 0
            Text = 'ceSummaDolg'
            OnButtonClick = ceSummaDolgButtonClick
          end
        end
        object Panel3: TPanel
          Left = 76
          Top = 32
          Width = 118
          Height = 26
          Align = alLeft
          Caption = 'Panel3'
          TabOrder = 2
          object CBOnlyRest: TCheckBox
            Left = 2
            Top = 4
            Width = 115
            Height = 17
            Action = ActionIsRest
            Caption = #1058#1086#1074#1072#1088' '#1085#1072' '#1086#1089#1090#1072#1090#1082#1072#1093
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
          end
        end
        object Panel5: TPanel
          Left = 194
          Top = 32
          Width = 97
          Height = 26
          Align = alLeft
          Caption = 'Panel5'
          TabOrder = 3
          object CBOnlyOrd: TCheckBox
            Left = 4
            Top = 4
            Width = 89
            Height = 17
            Action = ActionIsOrd
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
          end
        end
        object Panel6: TPanel
          Left = 491
          Top = 32
          Width = 254
          Height = 26
          Align = alLeft
          TabOrder = 4
          object Label8: TLabel
            Left = 2
            Top = 4
            Width = 34
            Height = 15
            Caption = #1042#1093' '#1075#1088#1085
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object DBText7: TDBText
            Left = 35
            Top = 4
            Width = 55
            Height = 15
            Color = 16777088
            DataField = 'summaIn'
            DataSource = DSBlankParam
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label9: TLabel
            Left = 92
            Top = 4
            Width = 43
            Height = 15
            Caption = #1042#1099#1093' '#1075#1088#1085
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object DBText8: TDBText
            Left = 133
            Top = 4
            Width = 55
            Height = 15
            Color = 16777088
            DataField = 'summa'
            DataSource = DSBlankParam
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label10: TLabel
            Left = 188
            Top = 4
            Width = 11
            Height = 15
            Caption = '%'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object DBText9: TDBText
            Left = 199
            Top = 4
            Width = 39
            Height = 15
            Color = 16777088
            DataField = 'Procent'
            DataSource = DSBlankParam
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
        end
        object Panel4: TPanel
          Left = 291
          Top = 32
          Width = 200
          Height = 26
          Align = alLeft
          Caption = 'Panel4'
          TabOrder = 5
          object ftOtdel: TcitDBComboEdit
            Left = 37
            Top = 2
            Width = 135
            Height = 21
            Enabled = True
            OwnesLButton = True
            OwnesLLabel = True
            LBtnAlignment = baRight
            LBtnDown = False
            LBtnGroupIndex = 0
            LBtnAllowAllUp = False
            LBtnGlyphKind = gkDots
            LBtnShortCut1 = 115
            LBtnShortCut2 = 40
            LBtnWidth = 25
            LLblAlignment = laLeft
            LLblCaption = #1054#1090#1076#1077#1083
            LLblWidth = 35
            LLblFont.Charset = DEFAULT_CHARSET
            LLblFont.Color = clWindowText
            LLblFont.Height = -11
            LLblFont.Name = 'MS Sans Serif'
            LLblFont.Style = []
            LLblRequiredFont.Charset = DEFAULT_CHARSET
            LLblRequiredFont.Color = clWindowText
            LLblRequiredFont.Height = -11
            LLblRequiredFont.Name = 'MS Sans Serif'
            LLblRequiredFont.Style = [fsBold]
            Required = False
            TabOrder = 0
            Visible = True
            DataSet = quDepts
            LocateKey = False
            KeyField = 'OtdelNo'
            TextField = 'OtdelName'
            OnSelectOk = ftOtdelSelectOk
            EditStyle = edCombo
            AutoTabControl = False
          end
        end
        object Panel7: TPanel
          Left = 1
          Top = 58
          Width = 1227
          Height = 22
          Align = alBottom
          TabOrder = 6
          object Label11: TLabel
            Left = 3
            Top = 4
            Width = 50
            Height = 13
            Caption = #1054#1087#1080#1089#1072#1085#1080#1077
          end
          object DBMemo1: TDBMemo
            Left = 64
            Top = 1
            Width = 681
            Height = 20
            Color = 16776176
            Ctl3D = False
            DataField = 'description'
            DataSource = DSBlankParam
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial Narrow'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object cbVidTov: TCheckBox
          Left = 894
          Top = 38
          Width = 123
          Height = 15
          Anchors = [akLeft]
          Caption = #1060#1080#1083#1100#1090#1088' '#1074#1080#1076' '#1090#1086#1074#1072#1088#1072
          Checked = True
          State = cbChecked
          TabOrder = 7
          OnClick = cbVidTovClick
        end
        object SearchTovarNo: TCheckBox
          Left = 752
          Top = 38
          Width = 145
          Height = 17
          Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1082#1086#1076#1091' '#1090#1086#1074#1072#1088#1072
          TabOrder = 8
          OnClick = SearchTovarNoClick
        end
        object dblcVidTov: TDBLookupComboboxEh
          Left = 1019
          Top = 35
          Width = 201
          Height = 21
          EditButtons = <>
          KeyField = 'VidNo'
          ListField = 'VidName'
          ListSource = dsVidTov
          TabOrder = 9
          Visible = True
          OnChange = dblcVidTovChange
        end
      end
    end
  end
  inherited PanelGrid: TPanel
    Top = 116
    Width = 1237
    Height = 329
    inherited DBGrid: TDBGrid
      Width = 1231
      Height = 299
      LightedFont.Color = clRed
      SQLBuilder = nil
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentFont = False
      OnColEnter = DBGridColEnter
      OnDrawDataCell = DBGridDrawDataCell
    end
    object PanelSearch: TPanel
      Left = 3
      Top = 302
      Width = 1231
      Height = 24
      Align = alBottom
      Caption = #1055#1086#1080#1089#1082' '#1090#1086#1074#1072#1088#1072
      TabOrder = 1
      Visible = False
      object EdSearch: TEdit
        Left = 2
        Top = 2
        Width = 393
        Height = 21
        TabOrder = 0
        OnChange = EdSearchChange
        OnKeyDown = EdSearchKeyDown
        OnKeyUp = EdSearchKeyUp
      end
      object EdSearchTovarNo: TEdit
        Left = 2
        Top = 1
        Width = 121
        Height = 21
        TabOrder = 1
        OnChange = EdSearchTovarNoChange
        OnEnter = EdSearchTovarNoEnter
        OnKeyDown = EdSearchTovarNoKeyDown
        OnKeyPress = EdSearchTovarNoKeyPress
      end
    end
  end
  object PanelPaymentLink: TPanel [5]
    Left = 0
    Top = 448
    Width = 1237
    Height = 100
    Align = alBottom
    BorderWidth = 2
    Caption = 'PanelGrid'
    Constraints.MinHeight = 100
    TabOrder = 4
    Visible = False
    object DBGridPaymentLink: TDBGrid
      Left = 3
      Top = 33
      Width = 1231
      Height = 64
      MarkDisabled = False
      MarkColor = clAqua
      MarkFont.Charset = DEFAULT_CHARSET
      MarkFont.Color = clNavy
      MarkFont.Height = -11
      MarkFont.Name = 'MS Sans Serif'
      MarkFont.Style = []
      LightedFont.Charset = DEFAULT_CHARSET
      LightedFont.Color = clMaroon
      LightedFont.Height = -11
      LightedFont.Name = 'MS Sans Serif'
      LightedFont.Style = []
      LightedColor = clWindow
      DisabledFont.Charset = DEFAULT_CHARSET
      DisabledFont.Color = clSilver
      DisabledFont.Height = -11
      DisabledFont.Name = 'MS Sans Serif'
      DisabledFont.Style = []
      DisabledColor = clWindow
      MultiPress = True
      EnableTitlePress = True
      MarkShortCut = 16429
      SaveOnClose = False
      PropStorage = ComponentProps
      OnTitlePressed = DBGridTitlePressed
      TitleGlyph.Data = {
        36010000424D360100000000000076000000280000001C0000000C0000000100
        040000000000C000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0088FFFFFFFFFF
        88888880F888888800007088888888F8888888088F8888880000870888888F88
        8888808888F88888000088708888F88888880888888F888800008887088F8888
        888088888888F8880000888870F888888808888888888F880000888887888888
        8877777777777788000088888888888888888888888888880000888888888888
        8888888888888888000088888888888888888888888888880000888888888888
        8888888888888888000088888888888888888888888888880000}
      TitleHeight = 17
      TitleColor = clBtnFace
      Align = alClient
      DataSource = dsLink
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object ToolBar1: TToolBar
      Left = 3
      Top = 3
      Width = 1231
      Height = 30
      AutoSize = True
      BorderWidth = 1
      Caption = 'ToolBarSerialNum'
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      Flat = True
      Images = dmDataModule.ImageListToolBar
      TabOrder = 1
      object ToolButton3: TToolButton
        Left = 0
        Top = 0
        Action = ActionLinkRefresh
      end
      object ToolButton5: TToolButton
        Left = 23
        Top = 0
        Action = ActionLinkLayout
      end
    end
  end
  object Panel150: TPanel [6]
    Left = 0
    Top = 548
    Width = 1237
    Height = 19
    Align = alBottom
    Caption = 
      #1042#1085#1080#1084#1072#1085#1080#1077' !!! '#1047#1072#1082#1072#1079' '#1087#1086' '#1076#1072#1085#1085#1086#1081' '#1090#1086#1088#1075#1086#1074#1086#1081' '#1090#1086#1095#1082#1077' '#1084#1077#1085#1100#1096#1077' '#1095#1077#1084' 150 '#1075#1088#1085'. ' +
      #1054#1073#1088#1072#1090#1080#1090#1077' '#1074#1085#1080#1084#1072#1085#1080#1077
    Color = clYellow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  inherited ActionList: TActionList
    Left = 134
    Top = 164
    inherited ActionItemAdd: TAction
      OnExecute = ActionItemAddExecute
    end
    inherited ActionItemDel: TAction
      OnExecute = ActionItemDelExecute
    end
    inherited ActionFind: TAction
      Enabled = True
      ImageIndex = 20
      OnExecute = ActionFindExecute
    end
    object ActionIsRest: TAction
      Category = 'View'
      Caption = #1058#1086#1083#1100#1082#1086' '#1090#1086#1074#1072#1088' '#1085#1072' '#1086#1089#1090#1072#1090#1082#1072#1093
      Hint = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1090#1086#1074#1072#1088' '#1085#1072' '#1086#1089#1090#1072#1090#1082#1072#1093' '
      ShortCut = 49234
      OnExecute = ActionIsRestExecute
    end
    object ActionEnableChangePrice: TAction
      Category = 'View'
      Caption = #1048#1079#1084#1077#1085#1103#1090#1100' '#1062#1077#1085#1099
      Hint = #1048#1079#1084#1077#1085#1103#1090#1100' '#1094#1077#1085#1099
      ShortCut = 49219
      OnExecute = ActionEnableChangePriceExecute
    end
    object ActionAudit: TAction
      Category = 'Item'
      Caption = 'ActionAudit'
      ShortCut = 49217
      OnExecute = ActionAuditExecute
    end
    object ActionIsOrd: TAction
      Caption = #1058#1086#1083#1100#1082#1086' '#1079#1072#1082#1072#1079
      OnExecute = ActionIsOrdExecute
    end
    object ActionListTovarAdd: TAction
      Category = 'Item'
      Caption = 'ActionListTovarAdd'
      Hint = #1053#1077' '#1085#1072#1078#1080#1084#1072#1090#1100
      ImageIndex = 0
    end
    object ActionViewRest: TAction
      Category = 'View'
      Caption = 'ActionViewRest'
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1086#1089#1090#1072#1090#1082#1080
      ImageIndex = 18
      OnExecute = ActionViewRestExecute
    end
    object ActionRefreshSumma: TAction
      Caption = 'ActionRefreshSumma'
    end
    object ActionShowPackWeight: TAction
      Category = 'Item'
      Caption = 'ActionShowPackWeight'
      Hint = #1056#1086#1089#1087#1080#1089#1100' '#1091#1087#1072#1082#1086#1074#1082#1080' '#1074#1077#1089#1086#1074#1086#1075#1086' '#1090#1086#1074#1072#1088#1072
      ImageIndex = 12
      ShortCut = 16453
      OnExecute = ActionShowPackWeightExecute
    end
    object ActionChangePrice: TAction
      Caption = 'ActionChangePrice'
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1094#1077#1085#1091' '#1085#1072' '#1087#1086#1089#1083#1077#1076#1085#1102#1102
      ImageIndex = 11
      ShortCut = 16471
      OnExecute = ActionChangePriceExecute
    end
    object ActionCheckBlank: TAction
      Caption = 'ActionCheckBlank'
      OnExecute = ActionCheckBlankExecute
    end
    object ActionCopyToExcel: TAction
      Category = 'View'
      Caption = 'ActionCopyToExcel'
      Hint = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1069#1082#1089#1077#1083#1100
      ImageIndex = 14
      OnExecute = ActionCopyToExcelExecute
    end
    object ActionAllZero: TAction
      Category = 'Item'
      Caption = 'ActionAllZero'
      Hint = #1054#1073#1085#1091#1083#1080#1090#1100' '#1074#1089#1077' '#1087#1086#1079#1080#1094#1080#1080' '#1079#1072#1082#1072#1079#1072
      ImageIndex = 21
      ShortCut = 24622
      OnExecute = ActionAllZeroExecute
    end
  end
  inherited SQLBuilder: TMlkSQLBuilder
    Left = 722
    Top = 164
  end
  inherited Query: TMSQuery
    Left = 428
    Top = 212
  end
  inherited DS: TDataSource
    DataSet = GenInputOrder
    Left = 526
    Top = 164
  end
  inherited ComponentProps: TcitComponentProps
    IniSection = 'MlekoBlankSpecForm'
    Left = 232
    Top = 164
  end
  inherited QueryStorage: TMSQuery
    Left = 330
    Top = 212
  end
  inherited PopupMenuGrid: TPopupMenu
    Left = 624
    Top = 164
  end
  inherited spCopyProfile: TMSStoredProc
    Left = 330
    Top = 260
  end
  object quBlankParam: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select v.*'
      
        '--,case when v.summain>0 then round(100*(v.summa-v.summaIn)/v.su' +
        'mmain,2) else 0 end as Procent'
      
        ',case when v.summain>0 then 100 * convert(decimal(18,3),SUBSTRIN' +
        'G(convert(varchar,(convert(varchar,(convert(decimal(18,3),SUBSTR' +
        'ING(convert(varchar,v.summa),1,PATINDEX('#39'%.%'#39',convert(varchar,v.' +
        'summa))+3))-convert(decimal(18,3),SUBSTRING(convert(varchar,v.su' +
        'mmain),1,PATINDEX('#39'%.%'#39',convert(varchar,v.summain))+3)))/convert' +
        '(decimal(18,3),SUBSTRING(convert(varchar,v.summain),1,PATINDEX('#39 +
        '%.%'#39',convert(varchar,v.summain))+3))))),1,PATINDEX('#39'%.%'#39',convert' +
        '(varchar,(convert(varchar,(convert(decimal(18,3),SUBSTRING(conve' +
        'rt(varchar,v.summa),1,PATINDEX('#39'%.%'#39',convert(varchar,v.summa))+3' +
        '))-convert(decimal(18,3),SUBSTRING(convert(varchar,v.summain),1,' +
        'PATINDEX('#39'%.%'#39',convert(varchar,v.summain))+3)))/convert(decimal(' +
        '18,3),SUBSTRING(convert(varchar,v.summain),1,PATINDEX('#39'%.%'#39',conv' +
        'ert(varchar,v.summain))+3))))))+2)) else 0 end as Procent'
      
        ',(select sum(summa) from v_blanklist where dateNakl=v.DateNakl a' +
        'nd PostNo=v.PostNo and AddressNo=v.AddressNo) as SummaTT'
      'from dbo.v_blanklist v'
      'where document_id=:document_id')
    AfterOpen = quBlankParamAfterOpen
    AfterRefresh = quBlankParamAfterRefresh
    Left = 722
    Top = 212
    ParamData = <
      item
        DataType = ftInteger
        Name = 'document_id'
        Value = 15
      end>
  end
  object DSBlankParam: TDataSource
    DataSet = quBlankParam
    Left = 330
    Top = 164
  end
  object GenInputOrder: TMSStoredProc
    StoredProcName = 'sp_GenInputOrder;1'
    SQLUpdate.Strings = (
      'begin'
      '  print :tovarNo'
      'end')
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_GenInputOrder;1(:document_id, :p_otdelN' +
        'o, :is_only_rest, :is_only_ord, :DateNaklFirst, :DateNaklSecond,' +
        ' :DateNaklThird)}')
    Options.StrictUpdate = False
    Filter = 'vidname = '#39' '#39
    BeforeOpen = GenInputOrderBeforeOpen
    AfterOpen = GenInputOrderAfterOpen
    AfterPost = GenInputOrderAfterPost
    AfterScroll = GenInputOrderAfterScroll
    AfterRefresh = GenInputOrderAfterRefresh
    Left = 134
    Top = 260
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'document_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_otdelNo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'is_only_rest'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'is_only_ord'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DateNaklFirst'
        ParamType = ptInputOutput
      end
      item
        DataType = ftDateTime
        Name = 'DateNaklSecond'
        ParamType = ptInputOutput
      end
      item
        DataType = ftDateTime
        Name = 'DateNaklThird'
        ParamType = ptInputOutput
      end>
    object GenInputOrderID: TLargeintField
      FieldName = 'ID'
      ReadOnly = True
    end
    object GenInputOrderdocument_id: TIntegerField
      FieldName = 'document_id'
      Origin = '#tmp_out.document_id'
    end
    object GenInputOrderTovarNo: TLargeintField
      FieldName = 'TovarNo'
      ReadOnly = True
    end
    object GenInputOrderNameTovar: TStringField
      FieldName = 'NameTovar'
      Origin = '#tmp_out.NameTovar'
      Size = 30
    end
    object GenInputOrderKolFirstNakl: TFloatField
      FieldName = 'KolFirstNakl'
      Origin = '#tmp_out.KolFirstNakl'
    end
    object GenInputOrderKolSecondNakl: TFloatField
      FieldName = 'KolSecondNakl'
      Origin = '#tmp_out.KolSecondNakl'
    end
    object GenInputOrderKolThirdNakl: TFloatField
      FieldName = 'KolThirdNakl'
      Origin = '#tmp_out.KolThirdNakl'
    end
    object GenInputOrderPriceFirstNakl: TFloatField
      FieldName = 'PriceFirstNakl'
      Origin = '#tmp_out.PriceFirstNakl'
    end
    object GenInputOrderPriceSecondNakl: TFloatField
      FieldName = 'PriceSecondNakl'
      Origin = '#tmp_out.PriceSecondNakl'
    end
    object GenInputOrderPriceThirdNakl: TFloatField
      FieldName = 'PriceThirdNakl'
      Origin = '#tmp_out.PriceThirdNakl'
    end
    object GenInputOrderKolRash: TFloatField
      FieldName = 'KolRash'
      Origin = '#tmp_out.KolRash'
    end
    object GenInputOrderKolOst: TFloatField
      FieldName = 'KolOst'
      Origin = '#tmp_out.KolOst'
    end
    object GenInputOrderKolOrd: TFloatField
      FieldName = 'KolOrd'
      Origin = '#tmp_out.KolOrd'
      Precision = 9
    end
    object GenInputOrderboss_price: TFloatField
      FieldName = 'boss_price'
      Origin = '#tmp_out.boss_price'
    end
    object GenInputOrderSrokReal: TSmallintField
      FieldName = 'SrokReal'
      Origin = '#tmp_out.SrokReal'
    end
    object GenInputOrdervidname: TStringField
      FieldName = 'vidname'
      Origin = '#tmp_out.vidname'
      Size = 30
    end
    object GenInputOrderis_set_price: TStringField
      FieldName = 'is_set_price'
      Origin = '#tmp_out.is_set_price'
      Size = 1
    end
    object GenInputOrderCreateUserName: TStringField
      FieldName = 'CreateUserName'
      Origin = '#tmp_out.CreateUserName'
    end
    object GenInputOrderLastEditUserName: TStringField
      FieldName = 'LastEditUserName'
      Origin = '#tmp_out.LastEditUserName'
    end
    object GenInputOrderkolBegin: TFloatField
      FieldName = 'kolBegin'
      Origin = '#tmp_out.kolBegin'
      Precision = 9
    end
    object GenInputOrderAvgPriceIn: TFloatField
      FieldName = 'AvgPriceIn'
      Origin = '#tmp_out.AvgPriceIn'
    end
    object GenInputOrderKolExt: TFloatField
      FieldName = 'KolExt'
      Origin = '#tmp_out.KolExt'
    end
    object GenInputOrderweight_packed: TBooleanField
      FieldName = 'weight_packed'
      Origin = '#tmp_out.weight_packed'
    end
    object GenInputOrderCreateUser: TIntegerField
      FieldName = 'CreateUser'
      Origin = '#tmp_out.CreateUser'
    end
    object GenInputOrderColN_Price: TFloatField
      FieldName = 'ColN_Price'
      ReadOnly = True
    end
    object GenInputOrderResidue: TFloatField
      FieldName = 'Residue'
    end
    object GenInputOrderNeed: TFloatField
      FieldName = 'Need'
    end
    object GenInputOrderCurrency: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072' '#1087#1088#1072#1081#1089#1072
      FieldName = 'Currency'
      ReadOnly = True
      Size = 5
    end
    object GenInputOrderRate: TFloatField
      DisplayLabel = #1050#1091#1088#1089' '#1074#1072#1083#1102#1090#1099
      FieldName = 'Rate'
      ReadOnly = True
    end
    object GenInputOrderCrossPrice: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1087#1088#1072#1081#1089#1072
      FieldName = 'CrossPrice'
      ReadOnly = True
    end
    object GenInputOrderCurrencyHead: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'CurrencyHead'
      ReadOnly = True
      Size = 5
    end
    object GenInputOrderPaymentPrice: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'PaymentPrice'
      ReadOnly = True
    end
    object GenInputOrderKolPerPak: TFloatField
      FieldName = 'KolPerPak'
    end
  end
  object quBlankSumma: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'select ROUND(SUM(ROUND(Boss_price * ISNULL(KolOrd, 0), 3)), 2) a' +
        's summa'
      
        ',ROUND(SUM(ROUND(AvgPriceIn * ISNULL(KolOrd, 0), 3)), 2) as summ' +
        'aIn'
      'FROM dbo.e_blanks b'
      'where b.document_id=:document_id')
    Left = 36
    Top = 212
    ParamData = <
      item
        DataType = ftInteger
        Name = 'document_id'
      end>
  end
  object spEditBlankPosition: TMSStoredProc
    StoredProcName = 'sp_EditBlankPosition;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_EditBlankPosition;1(:document_id, :tova' +
        'rNo, :UserNo, :KolBeg, :KolOrd, :Boss_Price, :Residue, :Need, :C' +
        'urrency, :Rate, :CrossPrice, :PaymentPrice, :BossPriceFirst, :id' +
        ', :summa)}')
    Left = 624
    Top = 260
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'document_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tovarNo'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'UserNo'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'KolBeg'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'KolOrd'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'Boss_Price'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'Residue'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'Need'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Currency'
        ParamType = ptInput
        Size = 5
      end
      item
        DataType = ftFloat
        Name = 'Rate'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CrossPrice'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PaymentPrice'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'BossPriceFirst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInputOutput
      end
      item
        DataType = ftFloat
        Name = 'summa'
        ParamType = ptInputOutput
      end>
  end
  object spCheckPrice: TMSStoredProc
    StoredProcName = 'sp_CheckPrice;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_CheckPrice;1(:tovarNo, :ColnPrice, :Kol' +
        'Ord, :Boss_Price, :UserNo)}')
    BeforeOpen = GenInputOrderBeforeOpen
    AfterPost = GenInputOrderAfterPost
    Left = 526
    Top = 260
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'tovarNo'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'ColnPrice'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'KolOrd'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'Boss_Price'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UserNo'
        ParamType = ptInput
      end>
  end
  object spAddTovarOtdel: TMSStoredProc
    StoredProcName = 'sp_AddTovarOtdel;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_AddTovarOtdel;1(:p_OtdelNo, :p_TovarNo,' +
        ' :p_id)}')
    BeforeOpen = GenInputOrderBeforeOpen
    AfterPost = GenInputOrderAfterPost
    Left = 428
    Top = 260
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'p_OtdelNo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_TovarNo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_id'
        ParamType = ptInputOutput
      end>
  end
  object spDelTovarOtdel: TMSStoredProc
    StoredProcName = 'sp_DelTovarOtdel'
    Connection = dmDataModule.DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL sp_DelTovarOtdel (:p_OtdelNo, :p_TovarNo)}')
    BeforeOpen = GenInputOrderBeforeOpen
    AfterPost = GenInputOrderAfterPost
    Left = 36
    Top = 260
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'p_OtdelNo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_TovarNo'
        ParamType = ptInput
      end>
  end
  object quTemp: TMSQuery
    Connection = dmDataModule.DB
    Left = 134
    Top = 212
  end
  object qryLink: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from v_List_rest'
      'where  tovarNo= :p_TovarNo')
    AfterOpen = qryLinkAfterOpen
    BeforeClose = qryLinkBeforeClose
    Left = 232
    Top = 212
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'p_TovarNo'
      end>
  end
  object dsLink: TDataSource
    DataSet = qryLink
    Left = 428
    Top = 164
  end
  object ActionListLink: TActionList
    Images = dmDataModule.ImageListToolBar
    Left = 36
    Top = 164
    object ActionLinkAdd: TAction
      Category = 'Item'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 0
    end
    object ActionLinkProp: TAction
      Category = 'Item'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1080#1083#1080' '#1080#1079#1084#1077#1085#1077#1085#1080#1077' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 1
    end
    object ActionLinkDel: TAction
      Category = 'Item'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1077#1085#1080#1077' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 2
      ShortCut = 16430
    end
    object ActionLinkRefresh: TAction
      Category = 'View'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1080#1079' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
      ImageIndex = 3
      ShortCut = 32884
    end
    object ActionLinkLayout: TAction
      Category = 'View'
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1074#1085#1077#1096#1085#1077#1075#1086' '#1074#1080#1076#1072' '#1090#1072#1073#1083#1080#1094#1099
      ImageIndex = 4
      OnExecute = ActionLinkLayoutExecute
    end
    object ActionLinkMenuItemVisible: TAction
      Category = 'View'
      Caption = #1055#1088#1080#1074#1103#1079#1082#1072' '#1086#1087#1083#1072#1090
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1087#1088#1080#1074#1103#1079#1082#1080' '#1086#1087#1083#1072#1090
    end
    object ActionRestoreLink: TAction
      Category = 'Item'
      Caption = 'ActionRestoreLink'
      Hint = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1076#1086#1083#1075
      ImageIndex = 18
    end
    object ActionUnlink: TAction
      Category = 'Item'
      Caption = 'ActionUnlink'
      Hint = #1059#1084#1077#1085#1100#1096#1080#1090#1100' '#1076#1086#1083#1075' '#1085#1072' '#1089#1091#1084#1084#1091' '#1087#1088#1080#1074#1103#1079#1082#1080
      ImageIndex = 19
    end
    object GoExelLink: TAction
      Category = 'View'
      Caption = 'GoExelLink'
      ImageIndex = 14
    end
  end
  object quDepts: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      'from dbo.vidOtdel'
      'Order by OtdelName')
    Left = 624
    Top = 212
    object quDeptsOtdelNo: TSmallintField
      FieldName = 'OtdelNo'
    end
    object quDeptsOtdelName: TStringField
      FieldName = 'OtdelName'
      Size = 30
    end
  end
  object quBlankRec: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select b.*'
      
        ', isnull((select sum(kolord) from e_blanks s where s.DateNakl=b.' +
        'dateNakl and s.TovarNo=b.TovarNo and s.status<>-1),0) as KolRash' +
        ' '
      'FROM dbo.e_blanks b'
      'where b.document_id= :document_id'
      'and b.TovarNo= :tovarNo')
    Left = 526
    Top = 212
    ParamData = <
      item
        DataType = ftInteger
        Name = 'document_id'
      end
      item
        DataType = ftSmallint
        Name = 'tovarNo'
      end>
  end
  object quVidTov: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'DECLARE '
      '         @PostNo         SmallInt,'
      '         @OtdelNo         SmallInt,'
      '         @ColNPrice      SmallInt,'
      '         @document_id int,'
      '         @is_only_ord int,'
      '         @is_only_rest int'
      '         '
      'set @document_id = :document_id'
      ''
      'select @PostNo = PostNo '
      ',@ColNPrice = ColNPrice'
      ',@OtdelNo = -1'
      'from e_blank_head where id = @document_id'
      ''
      'set @is_only_ord = 0'
      'set @is_only_rest = 0'
      ''
      'SELECT distinct vt.VidNo, vt.VidName'
      
        'FROM (select tovarNo from  dbo.l_otdel_tovar where otdelNo=@Otde' +
        'lNo or @OtdelNo=-1 union '
      
        '      select tovarNo from e_blanks where document_id=@document_i' +
        'd and CreateUser is not null)  o inner join '
      
        #9'  ostatok k on k.TovarNo=o.TovarNo  and (k.kol>0 or @is_only_re' +
        'st=0) left join '
      #9'  PriceForVeb pfv on pfv.TovarNo = k.TovarNo inner join '
      #9'  tovar t on o.tovarNo=t.tovarNo inner join '
      #9'  vidtov vt on t.vidno=vt.vidno inner join '
      #9'  e_blank_head h on h.id=@document_id left outer join  '
      
        #9'  dbo.e_blanks b on b.document_id=@document_id and b.TovarNo=o.' +
        'TovarNo left outer join '
      '  '
      #9'  d_currency dc on dc.L_CODE = pfv.Currency left join'
      
        #9'  CurrencyExchange ce on ce.CurrencyId = dc.ID and isActive = 1' +
        '  left join'
      #9'  d_currency dch on dch.L_CODE = h.CurrencyHead left join'
      
        #9'  CurrencyExchange ceh on ceh.CurrencyId = dch.ID and ceh.IsAct' +
        'ive = 1'
      'where (b.CreateUser is not null or @is_only_ord=0)'
      '  and o.TovarNo in (select distinct ARTICLE_ID '
      
        '                     from L_POST_SET_ARTGROUP_DELAY lpsagd left ' +
        'join'
      
        '                          L_SET_ARTICLE_GROUP lsag on lsag.SET_A' +
        'RTICLE_GROUP_ID = lpsagd.SET_ARTICLE_GROUP_ID left join'
      
        #9'                      L_ARTICLE_GROUP l on l.ARTICLE_GROUP_ID =' +
        ' lsag.ARTICLE_GROUP_ID and l.ACTIVE = '#39'Y'#39
      '                      where POSTNO = @PostNo'
      
        '                        and isnull(lpsagd.DAY_DELAY,0) = isnull(' +
        'h.KolDayPlan,0)'
      '                        and lpsagd.BUH = h.Buh'
      
        '                        and l.ARTICLE_ID in (select distinct ART' +
        'ICLE_ID'
      
        '                                              from L_POST_SET_AR' +
        'TGROUP_PRICE lpsagp left join'
      
        '                                                   L_SET_ARTICLE' +
        '_GROUP lsag on lsag.SET_ARTICLE_GROUP_ID = lpsagp.SET_ARTICLE_GR' +
        'OUP_ID left join'
      
        #9'                                               L_ARTICLE_GROUP ' +
        'l on l.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID and l.ACTIVE = '#39 +
        'Y'#39
      
        '                                               where POSTNO = @P' +
        'ostNo'
      
        '                                                 and COLNPRICE =' +
        ' @ColNPrice))'
      
        '                                                                ' +
        '         '
      'order by vt.vidname')
    Left = 1072
    Top = 164
    ParamData = <
      item
        DataType = ftInteger
        Name = 'document_id'
      end>
    object quVidTovVidNo: TSmallintField
      FieldName = 'VidNo'
    end
    object quVidTovVidName: TStringField
      FieldName = 'VidName'
      Size = 30
    end
  end
  object dsVidTov: TMSDataSource
    DataSet = quVidTov
    Left = 1120
    Top = 164
  end
end
