inherited MlekoBlankParamForm: TMlekoBlankParamForm
  Left = 836
  Top = 108
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  ClientHeight = 402
  ClientWidth = 377
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inherited ButtonOK: TButton
    Left = 169
    Top = 378
    TabOrder = 2
  end
  inherited ButtonCancel: TButton
    Left = 239
    Top = 378
    TabOrder = 3
  end
  inherited ButtonApply: TButton
    Left = 309
    Top = 378
    TabOrder = 4
  end
  inherited PageControl: TPageControl
    Width = 377
    Height = 353
    TabOrder = 1
    TabStop = False
    inherited TabSheet1: TTabSheet
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1086#1089#1085#1086#1074#1085#1099#1077
      object lblAgent: TLabel
        Left = 10
        Top = 146
        Width = 35
        Height = 13
        Caption = #1040#1075#1077#1085#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblOtdel: TLabel
        Left = 8
        Top = 170
        Width = 37
        Height = 13
        Caption = #1054#1090#1076#1077#1083
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EdOtdel: TLabel
        Left = 88
        Top = 167
        Width = 245
        Height = 19
        AutoSize = False
        Color = clInfoBk
        ParentColor = False
        WordWrap = True
      end
      object edSotrud: TLabel
        Left = 88
        Top = 143
        Width = 245
        Height = 19
        AutoSize = False
        Color = clInfoBk
        ParentColor = False
        WordWrap = True
      end
      object lblDelay: TLabel
        Left = 88
        Top = 211
        Width = 38
        Height = 20
        AutoSize = False
        Color = clInfoBk
        ParentColor = False
        WordWrap = True
      end
      object lblBuh: TLabel
        Left = 176
        Top = 211
        Width = 157
        Height = 20
        AutoSize = False
        Color = clInfoBk
        ParentColor = False
        WordWrap = True
      end
      object lblCapBuhName: TLabel
        Left = 128
        Top = 214
        Width = 45
        Height = 13
        Caption = #1041#1091#1093' '#1090#1080#1087
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCapDelay: TLabel
        Left = 5
        Top = 214
        Width = 79
        Height = 13
        Caption = #1054#1089#1090#1088#1086#1095#1082#1072', '#1076#1085
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EdAddress: TLabel
        Left = 88
        Top = 103
        Width = 245
        Height = 36
        AutoSize = False
        Color = clInfoBk
        ParentColor = False
        WordWrap = True
      end
      object Label3: TLabel
        Left = 3
        Top = 32
        Width = 82
        Height = 13
        Caption = #1058#1080#1087' '#1074#1086#1079#1074#1088#1072#1090#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 8
        Top = 264
        Width = 49
        Height = 13
        Caption = #1042#1072#1083#1102#1090#1072' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EdOutTrade: TcitEdit
        Left = 88
        Top = 80
        Width = 245
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
        LLblCaption = #1053#1072#1073#1086#1088', '#1072#1076#1088#1077#1089
        LLblWidth = 81
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
        Required = True
        TabOrder = 2
        Visible = True
        OnExit = EdOutTradeExit
        OnKeyPress = EdOutTradeKeyPress
        OnPushButton = ActionSelectPostExecute
      end
      object CBReason: TcitDBComboEdit
        Left = 88
        Top = 3
        Width = 245
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
        LLblCaption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
        LLblWidth = 80
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
        Required = True
        TabOrder = 0
        Visible = True
        OnChange = CBReasonChange
        OnExit = CBReasonExit
        LocateKey = False
        KeyField = 'ID'
        TextField = 'ReasonName'
        EntityCode = 'D_BLANK_REASON'
        OnSelectOk = CBReasonSelectOk
        OnIsSelect = CBReasonIsSelect
        EditStyle = edSelect
        AutoTabControl = True
      end
      object Panel1: TPanel
        Left = 0
        Top = 292
        Width = 369
        Height = 33
        Align = alBottom
        TabOrder = 5
        object Label1: TLabel
          Left = 1
          Top = 1
          Width = 86
          Height = 31
          Align = alLeft
          Alignment = taRightJustify
          Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
          Layout = tlCenter
          WordWrap = True
        end
        object Splitter1: TSplitter
          Left = 87
          Top = 1
          Width = 4
          Height = 31
        end
        object Panel2: TPanel
          Left = 91
          Top = 1
          Width = 277
          Height = 31
          Align = alClient
          BevelInner = bvLowered
          Caption = 'Panel2'
          TabOrder = 0
          object LInfo: TLabel
            Left = 2
            Top = 2
            Width = 273
            Height = 27
            Align = alClient
            Color = 15924189
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            WordWrap = True
          end
        end
      end
      object EdDateNakl: TcitDBDateEdit
        Left = 88
        Top = 187
        Width = 100
        Height = 21
        DataField = 'DateNakl'
        DataSource = dsRecomBlankParam
        DialogStyle = dsNoCaption
        DontPushIfDisabled = False
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
        LLblCaption = #1044#1072#1090#1072' '
        LLblWidth = 80
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
        Required = True
        MaxLength = 10
        PickFromField = False
        DatePickMethod = dmToday
        TabOrder = 3
        Visible = True
        OnEnter = EdDateNaklEnter
        OnKeyPress = EdDateNaklKeyPress
        HeaderColor = clBtnFace
        DayBackgroundColor = clActiveCaption
        CalendarColor = clWindow
        DayTextColor = clCaptionText
        WeekEndColor = clRed
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clBlack
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Style = []
        CalendarFont.Charset = DEFAULT_CHARSET
        CalendarFont.Color = clWindowText
        CalendarFont.Height = -11
        CalendarFont.Name = 'MS Sans Serif'
        CalendarFont.Style = []
        TodayShortCut = 116
        DisableCheck = True
        DateFormat = dfLong
      end
      object CEColnPrice: TcitDBComboEdit
        Left = 86
        Top = 235
        Width = 224
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
        LLblCaption = #1058#1080#1087' '#1094#1077#1085#1099
        LLblWidth = 80
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
        Required = True
        MaxLength = 280
        TabOrder = 4
        Visible = True
        OnChange = CEColnPriceChange
        OnExit = CEColnPriceExit
        DataSet = quColNPrice
        LocateKey = False
        KeyField = 'ColNPrice'
        TextField = 'ColName'
        EditStyle = edCombo
        AutoTabControl = True
      end
      object EdPost: TcitDBComboEdit
        Left = 88
        Top = 54
        Width = 245
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
        LLblCaption = #1060#1080#1088#1084#1072
        LLblWidth = 80
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
        Required = True
        TabOrder = 1
        Visible = True
        OnChange = EdPostChange
        OnExit = EdPostExit
        LocateKey = False
        EntityCode = 'POST_FOR_BLANK'
        OnSelectOk = EdPostSelectOk
        EditStyle = edSelect
        AutoTabControl = True
      end
      object Button1: TButton
        Left = 340
        Top = 232
        Width = 25
        Height = 25
        Hint = #1062#1077#1085#1099' '#1076#1083#1103' '#1082#1083#1080#1077#1085#1090#1072' ('#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082')'
        Caption = '$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = Button1Click
      end
      object DBLookupComboboxEhTypeReturn: TDBLookupComboboxEh
        Left = 88
        Top = 28
        Width = 271
        Height = 21
        Enabled = False
        EditButtons = <>
        KeyField = 'TypeReturnNo'
        ListField = 'TypeReturnName'
        ListSource = dsTypeReturn
        TabOrder = 7
        Visible = True
        OnExit = DBLookupComboboxEhTypeReturnExit
      end
      object DBLookupComboboxEhCurrency: TDBLookupComboboxEh
        Left = 88
        Top = 264
        Width = 267
        Height = 21
        EditButtons = <>
        KeyField = 'L_CODE'
        ListField = 'NAME'
        ListSource = dsCurrency
        TabOrder = 8
        Visible = True
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077
      ImageIndex = 2
      object Label2: TLabel
        Left = 6
        Top = 184
        Width = 89
        Height = 13
        Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1079#1072#1103#1074#1082#1080
      end
      object Label4: TLabel
        Left = 6
        Top = 232
        Width = 89
        Height = 26
        Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1079#1072#1103#1074#1082#1080' '#1089' '#1089#1072#1081#1090#1072
        Transparent = False
        WordWrap = True
      end
      object ftOurFirm: TcitDBComboEdit
        Left = 105
        Top = 122
        Width = 205
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
        LLblCaption = #1053#1072#1096#1072' '#1092#1080#1088#1084#1072
        LLblWidth = 100
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
        Required = True
        TabOrder = 0
        Visible = True
        DataSet = quOurFirm
        LocateKey = False
        KeyField = 'PostNo'
        TextField = 'Name'
        EditStyle = edCombo
        AutoTabControl = True
      end
      object CBContract: TcitDBComboEdit
        Left = 105
        Top = 153
        Width = 205
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
        LLblCaption = #1044#1086#1075#1086#1074#1086#1088
        LLblWidth = 100
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
        Required = True
        TabOrder = 1
        Visible = True
        DataSet = quContract
        LocateKey = False
        KeyField = 'ID'
        TextField = 'description'
        EditStyle = edCombo
        AutoTabControl = True
      end
      object EdDescription: TEdit
        Left = 104
        Top = 179
        Width = 232
        Height = 21
        TabOrder = 2
      end
      object EdDescriptionOrderVeb: TEdit
        Left = 104
        Top = 232
        Width = 233
        Height = 21
        TabOrder = 3
      end
    end
  end
  inherited ToolBar: TToolBar
    Width = 377
    TabOrder = 0
  end
  inherited ActionList: TActionList
    Left = 20
    Top = 20
    object ActionSelectPost: TAction
      Caption = 'ActionSelectPost'
      OnExecute = ActionSelectPostExecute
    end
    object ActionSelectSotrud: TAction
      Caption = 'ActionSelectSotrud'
    end
  end
  inherited Query: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select max(RashodNum) as RashodNum,max(id) as ID'
      'from dbo.v_blankList'
      'where status=0 '
      'and DateNakl= :p_DateNakl'
      'and PostNo=  :p_PostNo'
      'and AddressNo= :p_AddressNo'
      'and VidTovGroupId= :p_VidTovGroupId'
      'and OtdelNo= :p_OtdelNo'
      'and SotrudNo= :p_SotrudNo'
      'and ColNPrice= :p_ColNPrice')
    Left = 44
    Top = 124
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'p_DateNakl'
      end
      item
        DataType = ftSmallint
        Name = 'p_PostNo'
      end
      item
        DataType = ftSmallint
        Name = 'p_AddressNo'
      end
      item
        DataType = ftInteger
        Name = 'p_VidTovGroupId'
      end
      item
        DataType = ftSmallint
        Name = 'p_OtdelNo'
      end
      item
        DataType = ftSmallint
        Name = 'p_SotrudNo'
      end
      item
        DataType = ftSmallint
        Name = 'p_ColNPrice'
      end>
  end
  inherited DS: TDataSource
    Left = 156
    Top = 20
  end
  inherited quCMD: TMSQuery
    Left = 136
    Top = 124
  end
  object quColNPrice: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select distinct dpt.colnprice'
      '               ,dpt.colname -- dpt.* distinct dpt.colnprice'
      ' from d_price_type dpt left join '
      
        '      L_POST_SET_ARTGROUP_PRICE lpsagp on lpsagp.COLNPRICE = dpt' +
        '.ColNPrice'
      '  where lpsagp.POSTNO = :POSTNO'
      ''
      ''
      '-- Select * from d_price_type')
    Filter = 'ColName = '#39' '#39
    Left = 140
    Top = 156
    ParamData = <
      item
        DataType = ftInteger
        Name = 'POSTNO'
      end>
    object quColNPriceColNPrice: TSmallintField
      FieldName = 'ColNPrice'
      Visible = False
    end
    object quColNPriceColName: TStringField
      DisplayWidth = 20
      FieldName = 'ColName'
      Size = 64
    end
  end
  object spAddInputOrder: TMSStoredProc
    StoredProcName = 'sp_AddInputOrder;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_AddInputOrder;1(:PostNo, :DateNakl, :So' +
        'trudNo, :VidNaklNo, :UserNo, :AddressNo, :OtdelNo, :ColnPrice, :' +
        'KolDayPlan, :Buh, :ReasonId, :VidTovGroupId, :description, :cont' +
        'ract_id, :ln_document_id, :ourFirmNo, :descriptionOrderVeb, :Cur' +
        'rency, :IsVeb)}')
    Left = 312
    Top = 204
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftSmallint
        Name = 'PostNo'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DateNakl'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'SotrudNo'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'VidNaklNo'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'UserNo'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'AddressNo'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'OtdelNo'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'ColnPrice'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'KolDayPlan'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'Buh'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'ReasonId'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'VidTovGroupId'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'description'
        ParamType = ptInput
        Size = 1024
      end
      item
        DataType = ftInteger
        Name = 'contract_id'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'ln_document_id'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'ourFirmNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'descriptionOrderVeb'
        ParamType = ptInput
        Size = 1024
      end
      item
        DataType = ftString
        Name = 'Currency'
        ParamType = ptInput
        Size = 5
      end
      item
        DataType = ftBoolean
        Name = 'IsVeb'
        ParamType = ptInput
      end>
  end
  object sp_EditBlankParam: TMSStoredProc
    StoredProcName = 'sp_EditBlankParam'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_EditBlankParam (:PostNo, :DateNakl, :So' +
        'trudNo, :VidNaklNo, :UserNo, :AddressNo, :OtdelNo, :ColnPrice, :' +
        'KolDayPlan, :Buh, :ReasonId, :VidTovGroupId, :description, :cont' +
        'ract_id, :ln_document_id, :OurFirmNo, :descriptionOrderVeb, :Cur' +
        'rency, :isVeb)}')
    Left = 300
    Top = 164
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftSmallint
        Name = 'PostNo'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DateNakl'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'SotrudNo'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'VidNaklNo'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'UserNo'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'AddressNo'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'OtdelNo'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'ColnPrice'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'KolDayPlan'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'Buh'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'ReasonId'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'VidTovGroupId'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'description'
        ParamType = ptInput
        Size = 1024
      end
      item
        DataType = ftInteger
        Name = 'contract_id'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'ln_document_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'OurFirmNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'descriptionOrderVeb'
        ParamType = ptInput
        Size = 1024
      end
      item
        DataType = ftString
        Name = 'Currency'
        ParamType = ptInput
        Size = 1
      end
      item
        DataType = ftBoolean
        Name = 'isVeb'
        ParamType = ptInput
      end>
  end
  object dsRecomBlankParam: TDataSource
    DataSet = spRecomBlankParam
    Left = 88
    Top = 20
  end
  object spRecomBlankParam: TMSStoredProc
    StoredProcName = 'sp_gen_Last_Rash_param;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_gen_Last_Rash_param;1(:PostNo, :OtdelNo' +
        ', :document_id, :DateNakl, :AddressNo)}')
    Left = 256
    Top = 164
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftSmallint
        Name = 'PostNo'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'OtdelNo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'document_id'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DateNakl'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'AddressNo'
        ParamType = ptInput
      end>
  end
  object quContract: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select max (u.id) as id, description'
      ' from'
      '(select -1 as id,'#39#1044#1086#1075#1086#1074#1086#1088' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102#39' as description'
      'union all'
      'select id,description'
      'from d_firm_contract v'
      'where v.PostNo = :p_PostNo'
      '  and GETDATE() between v.Create_Date and v.Expire_Date) u'
      'group by description'
      ''
      '/*'
      'select -1 as id,'#39#1044#1086#1075#1086#1074#1086#1088' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102#39' as description'
      'union all'
      'select id,description'
      'from d_firm_contract v'
      'where v.PostNo = :p_PostNo'
      '  and GETDATE() between v.Create_Date and v.Expire_Date'
      '*/'
      '/*'
      'select -1 as id,'#39#1044#1086#1075#1086#1074#1086#1088' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102#39' as description'
      'union all'
      'select id,description'
      'from d_firm_contract v'
      'where v.PostNo = :p_PostNo'
      '*/')
    Left = 92
    Top = 124
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_PostNo'
      end>
    object quContractid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object quContractdescription: TStringField
      DisplayWidth = 40
      FieldName = 'description'
      Size = 1024
    end
  end
  object quOurFirm: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select p.name,p.PostNo '
      'from Post p,d_our_firm o'
      'where p.PostNo=o.PostNo')
    Left = 96
    Top = 156
    object quOurFirmname: TStringField
      FieldName = 'name'
      Origin = 'Post.name'
      Size = 10
    end
    object quOurFirmPostNo: TSmallintField
      FieldName = 'PostNo'
    end
  end
  object SpCheckBlank: TMSStoredProc
    StoredProcName = 'pr_Check_Blank;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL pr_Check_Blank;1(:p_Postno, :p_Reason_id, ' +
        ':DateNakl, :OtdelNo, :SET_ARTICLE_GROUP_ID, :err_level, :err_mes' +
        'sage)}')
    Left = 216
    Top = 164
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftLargeint
        Name = 'p_Postno'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'p_Reason_id'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DateNakl'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'OtdelNo'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'SET_ARTICLE_GROUP_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'err_level'
        ParamType = ptInputOutput
      end
      item
        DataType = ftString
        Name = 'err_message'
        ParamType = ptInputOutput
        Size = 1024
      end>
  end
  object dsPostBan: TDataSource
    DataSet = quPostBan
    Left = 348
    Top = 16
  end
  object quPostBan: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'begin'
      'declare'
      ' @PostBan int'
      ' ,@Description varchar(85)'
      ' '
      ' select @PostBan =  Check1'
      '  from Post_Ban_Return where PostNo = :p_PostNo'
      ''
      'select @Description = Description '
      ' from Post_Ban_Return where PostNo = :p_PostNo'
      ''
      
        ' select ISNULL(@PostBan,0) PostBan, ISNULL(@Description,0) Descr' +
        'iption'
      'end')
    Left = 320
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_PostNo'
      end
      item
        DataType = ftInteger
        Name = 'p_PostNo'
      end>
    object quPostBanPostBan: TIntegerField
      FieldName = 'PostBan'
      ReadOnly = True
    end
    object quPostBanDescription: TStringField
      FieldName = 'Description'
      ReadOnly = True
      Size = 85
    end
  end
  object dsPostBanPay: TDataSource
    DataSet = quPostBanPay
    Left = 320
    Top = 128
  end
  object quPostBanPay: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select PostNo_PayBan'
      '      ,set_article_group_id_PayBan'
      '      ,IsNull(PayBan,0) as PayBan'
      
        '      ,ltrim(rtrim((select Name from Post where PostNo = l.PostN' +
        'o_PayBan))) as PostName'
      
        '      ,ltrim(rtrim((select NAME from D_SET_ARTICLE_GROUP where i' +
        'd = l.Set_Article_Group_Id_PayBan))) as SetArticleGroupName'
      
        '      ,ltrim(rtrim((select Buh_type_name from d_buh_type where b' +
        'uh = l.Buh))) as BuhName'
      ' from L_Post_Set_ArtGroup_PayBan l'
      '  where PostNo_PayBan = :PostNo'
      '    and set_article_group_id_PayBan = :set_article_group_id'
      '    and Buh = :Buh'
      ''
      '/*'
      'select PostNo_PayBan'
      '      ,set_article_group_id_PayBan'
      '      ,IsNull(PayBan,0) as PayBan'
      ' from L_Post_Set_ArtGroup_PayBan'
      '  where PostNo_PayBan = :PostNo'
      '    and set_article_group_id_PayBan = :set_article_group_id'
      '    and Buh = :Buh'
      '*/')
    Left = 284
    Top = 128
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'PostNo'
      end
      item
        DataType = ftLargeint
        Name = 'set_article_group_id'
      end
      item
        DataType = ftLargeint
        Name = 'Buh'
      end>
    object quPostBanPayid: TIntegerField
      FieldName = 'id'
      ReadOnly = True
    end
    object quPostBanPayPostNo_PayBan: TSmallintField
      FieldName = 'PostNo_PayBan'
    end
    object quPostBanPaySET_ARTICLE_GROUP_ID_PayBan: TLargeintField
      FieldName = 'SET_ARTICLE_GROUP_ID_PayBan'
    end
    object quPostBanPayPayBan: TIntegerField
      FieldName = 'PayBan'
    end
    object quPostBanPayPostName: TStringField
      FieldName = 'PostName'
      ReadOnly = True
      Size = 30
    end
    object quPostBanPaySetArticleGroupName: TStringField
      FieldName = 'SetArticleGroupName'
      ReadOnly = True
      Size = 512
    end
    object quPostBanPayBuhName: TStringField
      FieldName = 'BuhName'
      ReadOnly = True
    end
  end
  object quSummaDolga: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT '
      '       isnull(SUM(v.SUMMA_ECO),0) as SUMMA_ECO'
      '       , v.CONTRACTOR_ACC_ID'
      '       , v.SET_ARTICLE_GROUP_ID'
      '       , v.Buh'
      'FROM   v_dhead v'
      'WHERE  v.free_summa_eco <> 0'
      'and v.type_id = 12'
      'and v.our_firm_id = (select PostNo from d_our_firm)'
      'and v.CONTRACTOR_ACC_ID = :PostNo'
      'and v.SET_ARTICLE_GROUP_ID = :Set_Article_Group_Id'
      'and v.Buh = isnull(:Buh, v.Buh)'
      'group by  v.CONTRACTOR_ACC_ID'
      '        , v.SET_ARTICLE_GROUP_ID'
      '        , v.Buh')
    Left = 220
    Top = 128
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'PostNo'
      end
      item
        DataType = ftLargeint
        Name = 'Set_Article_Group_Id'
      end
      item
        DataType = ftLargeint
        Name = 'Buh'
      end>
    object quSummaDolgaSUMMA_ECO: TFloatField
      FieldName = 'SUMMA_ECO'
      ReadOnly = True
    end
    object quSummaDolgaCONTRACTOR_ACC_ID: TSmallintField
      FieldName = 'CONTRACTOR_ACC_ID'
    end
    object quSummaDolgaSET_ARTICLE_GROUP_ID: TLargeintField
      FieldName = 'SET_ARTICLE_GROUP_ID'
    end
    object quSummaDolgaBuh: TSmallintField
      FieldName = 'Buh'
    end
  end
  object dsSummaDolga: TDataSource
    DataSet = quSummaDolga
    Left = 188
    Top = 136
  end
  object quControlPayBan: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select  isnull (d.Date_Beg,0) as DateBeg'
      '       ,isnull (d.Date_End,0) as DateEnd'
      '       ,isnull (d.Description,'#39#39') as Description'
      '       ,d.Active'
      '       ,l.PayBan'
      ' from L_Post_Set_ArtGroup_PayBan l left join '
      
        '      D_Post_PayBan_Stop_Control d on d.L_Post_Set_ArtGroup_PayB' +
        'an_Id = l.id'
      '  where PostNo_PayBan = :PostNo'
      '    and Set_Article_Group_Id_PayBan = :Set_Article_Group_Id'
      '    and Buh = :Buh'
      '    and Active = 1'
      '    and :DateNakl between d.Date_Beg and d.Date_End')
    Left = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
      end
      item
        DataType = ftLargeint
        Name = 'Set_Article_Group_Id'
      end
      item
        DataType = ftInteger
        Name = 'Buh'
      end
      item
        DataType = ftDateTime
        Name = 'DateNakl'
      end>
    object quControlPayBanDateBeg: TDateTimeField
      FieldName = 'DateBeg'
      ReadOnly = True
    end
    object quControlPayBanDateEnd: TDateTimeField
      FieldName = 'DateEnd'
      ReadOnly = True
    end
    object quControlPayBanDescription: TStringField
      FieldName = 'Description'
      ReadOnly = True
      Size = 100
    end
    object quControlPayBanActive: TBooleanField
      FieldName = 'Active'
    end
    object quControlPayBanPayBan: TIntegerField
      FieldName = 'PayBan'
    end
  end
  object dsControlPayBan: TDataSource
    DataSet = quControlPayBan
    Left = 284
  end
  object quTypeReturn: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      ' from D_TypeReturn'
      '  where Active = 1')
    Top = 75
    object quTypeReturnTypeReturnNo: TIntegerField
      FieldName = 'TypeReturnNo'
      ReadOnly = True
    end
    object quTypeReturnTypeReturnName: TStringField
      FieldName = 'TypeReturnName'
      Size = 50
    end
    object quTypeReturnActive: TFloatField
      FieldName = 'Active'
    end
  end
  object dsTypeReturn: TMSDataSource
    DataSet = quTypeReturn
    Left = 31
    Top = 99
  end
  object spModifyLinkBlankReturn: TMSStoredProc
    StoredProcName = 'sp_ModifyLinkBlankReturn;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_ModifyLinkBlankReturn;1(:Document_id, :' +
        'TypeReturnNo)}')
    Left = 60
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'Document_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TypeReturnNo'
        ParamType = ptInput
      end>
  end
  object quTypeReturnBlank: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select TypeReturnNo '
      ' from L_BlankReturn'
      '  where Document_id = :Document_id')
    Left = 4
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Document_id'
      end>
    object quTypeReturnBlankTypeReturnNo: TIntegerField
      FieldName = 'TypeReturnNo'
    end
  end
  object dsCurrency: TMSDataSource
    DataSet = quCurrency
    Left = 52
    Top = 308
  end
  object quCurrency: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      ' from d_currency')
    Left = 20
    Top = 308
    object quCurrencyID: TIntegerField
      FieldName = 'ID'
    end
    object quCurrencyNAME: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      DisplayWidth = 30
      FieldName = 'NAME'
      Size = 100
    end
    object quCurrencyL_CODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1074#1072#1083#1102#1090#1099
      DisplayWidth = 5
      FieldName = 'L_CODE'
      Size = 3
    end
    object quCurrencySHORT_NAME: TStringField
      FieldName = 'SHORT_NAME'
      Size = 10
    end
    object quCurrencyIsDefault: TBooleanField
      FieldName = 'IsDefault'
    end
    object quCurrencyisTrash: TBooleanField
      FieldName = 'isTrash'
    end
  end
end
