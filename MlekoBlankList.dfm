inherited MlekoBlankListForm: TMlekoBlankListForm
  Left = 438
  Top = 211
  Caption = #1057#1087#1080#1089#1086#1082' '#1079#1072#1082#1072#1079#1086#1074
  ClientHeight = 367
  ClientWidth = 693
  OnActivate = FormActivate
  OnShow = nil
  ExplicitWidth = 709
  ExplicitHeight = 406
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TStatusBar
    Top = 348
    Width = 693
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  inherited ToolBar: TToolBar
    Width = 693
    ButtonWidth = 24
    inherited ToolBtnAdd: TToolButton
      ExplicitWidth = 24
    end
    inherited ToolBtnProp: TToolButton
      Left = 24
      ExplicitLeft = 24
      ExplicitWidth = 24
    end
    inherited ToolBtnDel: TToolButton
      Left = 48
      ExplicitLeft = 48
      ExplicitWidth = 24
    end
    inherited ToolButton4: TToolButton
      Left = 72
      ExplicitLeft = 72
    end
    inherited ToolBtnRefresh: TToolButton
      Left = 80
      ExplicitLeft = 80
      ExplicitWidth = 24
    end
    inherited TBCopyProfile: TToolButton
      Left = 104
      ExplicitLeft = 104
      ExplicitWidth = 24
    end
    inherited BtnLayot: TToolButton
      Left = 128
      ExplicitLeft = 128
      ExplicitWidth = 24
    end
    object ToolButton3: TToolButton
      Left = 152
      Top = 0
      Action = ActionRestore
    end
    object ToolButton18: TToolButton
      Left = 176
      Top = 0
      Action = ActionItemCopy
    end
    object ToolButton15: TToolButton
      Left = 200
      Top = 0
      Width = 8
      Caption = 'ToolButton15'
      ImageIndex = 13
      Style = tbsSeparator
    end
    object ToolButton13: TToolButton
      Left = 208
      Top = 0
      Action = ActionOrderBlock
    end
    object ToolButton14: TToolButton
      Left = 232
      Top = 0
      Action = ActionOrderUnBlock
    end
    object ToolButton7: TToolButton
      Left = 256
      Top = 0
      Action = ActionSpecPrint
    end
    object ToolButton6: TToolButton
      Left = 280
      Top = 0
      Action = ActionGoExcel
    end
    object ToolButton5: TToolButton
      Left = 304
      Top = 0
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 312
      Top = 0
      Action = ActionGoBlank
    end
    object ToolButton2: TToolButton
      Left = 336
      Top = 0
      Action = ActionDelFromBlank
    end
    object ToolButton12: TToolButton
      Left = 360
      Top = 0
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object ToolButton10: TToolButton
      Left = 368
      Top = 0
      Hint = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1085#1072#1082#1083#1072#1076#1085#1099#1077' '#1080#1079' '#1078#1091#1088#1085#1072#1083#1072' '#1079#1072#1082#1072#1079#1086#1074
      Action = ActionAllCorrelation
    end
    object ToolButton11: TToolButton
      Left = 392
      Top = 0
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1074#1089#1077' '#1079#1072#1082#1072#1079#1099' '#1080#1079' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
      Action = ActionDelAllFromNaklR
    end
    object ToolButton16: TToolButton
      Left = 416
      Top = 0
      Width = 8
      Caption = 'ToolButton16'
      ImageIndex = 13
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 424
      Top = 0
      Action = ActionOpenCrossGrid
    end
    object ToolButton17: TToolButton
      Left = 448
      Top = 0
      Action = ActionCheckNakl
    end
    object ToolButton19: TToolButton
      Left = 472
      Top = 0
      Width = 8
      Caption = 'ToolButton19'
      ImageIndex = 20
      Style = tbsSeparator
    end
    object ToolButton20: TToolButton
      Left = 480
      Top = 0
      Action = ActionAutoLoadAll
    end
    object ToolButtonTmpCross: TToolButton
      Left = 504
      Top = 0
      Hint = #1057#1077#1090#1082#1072' '#1087#1077#1088#1077#1076' '#1072#1074#1090#1086#1087#1086#1088#1077#1079#1082#1086#1081
      Caption = 'ToolButtonTmpCross'
      ImageIndex = 27
      OnClick = ToolButtonTmpCrossClick
    end
  end
  inherited PageControlTop: TPageControl
    Width = 693
    Height = 75
    TabHeight = 1
    TabPosition = tpRight
    ExplicitHeight = 75
    inherited TabSheet1: TTabSheet
      ParentFont = False
      ExplicitTop = 4
      ExplicitHeight = 67
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 685
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 642
        object Label1: TLabel
          Left = 365
          Top = 7
          Width = 80
          Height = 13
          Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
        end
        object CBReason4: TCheckBox
          Left = 615
          Top = -1
          Width = 153
          Height = 17
          Caption = #1053#1077' '#1086#1090#1075#1088#1091#1078#1077#1085#1085#1099#1077' '#1079#1072#1082#1072#1079#1099
          TabOrder = 0
        end
        object CBReason5: TCheckBox
          Left = 615
          Top = 13
          Width = 189
          Height = 17
          Caption = #1057#1092#1086#1088#1084#1080#1088'. '#1079#1072#1082#1072#1079#1099' '#1072#1074#1090#1086#1079#1072#1075#1088#1091#1079#1082#1080
          TabOrder = 1
        end
      end
    end
  end
  inherited PanelGrid: TPanel
    Width = 693
    Height = 232
    BevelOuter = bvNone
    BorderWidth = 1
    inherited DBGrid: TDBGrid
      Left = 1
      Top = 1
      Width = 691
      Height = 230
      OnDrawDataCell = DBGridDrawDataCell
      OnDblClick = DBGridDblClick
    end
  end
  object PanelMsg: TPanel [4]
    Left = 0
    Top = 97
    Width = 693
    Height = 19
    Align = alTop
    Caption = 'hgh'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    ExplicitWidth = 650
    object PB: TProgressBar
      Left = 1
      Top = 1
      Width = 691
      Height = 17
      Align = alClient
      Step = 1
      TabOrder = 0
      ExplicitWidth = 648
    end
  end
  inherited ActionList: TActionList
    Left = 28
    Top = 156
    inherited ActionItemAdd: TAction
      OnExecute = ActionItemAddExecute
    end
    inherited ActionItemProp: TAction
      OnExecute = ActionItemPropExecute
    end
    inherited ActionItemDel: TAction
      OnExecute = ActionItemDelExecute
    end
    object ActionOpenSpec: TAction [14]
      Category = 'Item'
      Caption = 'ActionOpenSpec'
      ShortCut = 13
      OnExecute = ActionOpenSpecExecute
    end
    object ActionGoBlank: TAction [15]
      Category = 'Item'
      Caption = 'ActionGoBlank'
      Hint = '[Ctrl+T] '#1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1082#1072#1079' '#1074' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
      ImageIndex = 32
      ShortCut = 16468
      OnExecute = ActionGoBlankExecute
    end
    object ActionRestore: TAction [16]
      Category = 'Item'
      Caption = 'ActionRestore'
      Hint = '[Ctrl+R] '#1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1091#1076#1072#1083#1077#1085#1085#1099#1081
      ImageIndex = 10
      ShortCut = 16466
      OnExecute = ActionRestoreExecute
    end
    object ActionDelFromBlank: TAction [17]
      Category = 'Item'
      Caption = 'ActionDelFromBlank'
      Hint = '[Ctrl+Alt+T] '#1055#1077#1088#1077#1074#1077#1089#1090#1080' '#1074' '#1095#1077#1088#1085#1086#1074#1080#1082' ('#1091#1076#1072#1083#1080#1090#1100' '#1085#1072#1082#1083#1072#1076#1085#1099#1093')'
      ImageIndex = 31
      ShortCut = 49236
      OnExecute = ActionDelFromBlankExecute
    end
    object ActionGoExcel: TAction [18]
      Caption = #1042' Excel'
      ImageIndex = 14
      ShortCut = 16453
      OnExecute = ActionGoExcelExecute
    end
    object ActionSpecPrint: TAction [19]
      Category = 'Item'
      Caption = #1055#1077#1095#1072#1090#1100' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080
      ImageIndex = 15
      ShortCut = 16464
      OnExecute = ActionSpecPrintExecute
    end
    object ActionOpenCrossGrid: TAction [20]
      Caption = 'ActionOpenCrossGrid'
      Hint = #1057#1077#1090#1082#1072'/'#1054#1073#1097#1080#1081' '#1073#1083#1072#1085#1082' '#1079#1072#1082#1072#1079#1086#1074
      ImageIndex = 9
      OnExecute = ActionOpenCrossGridExecute
    end
    object ActionAllCorrelation: TAction [21]
      Caption = 'ActionAllCorrelation'
      Hint = #1042#1089#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077' '#1074' '#1089#1077#1090#1082#1091
      ImageIndex = 8
      OnExecute = ActionAllCorrelatiOnExecute
    end
    object ActionDelAllFromNaklR: TAction [22]
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1089#1077' '#1080#1079' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1074#1089#1077' '#1080#1079' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
      ImageIndex = 12
      OnExecute = ActionDelAllFromNaklRExecute
    end
    object ActionOrderBlock: TAction [23]
      Category = 'Item'
      Caption = #1047#1072#1087#1088#1077#1090#1080#1090#1100' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Hint = #1047#1072#1073#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1082#1072#1079
      ImageIndex = 17
      ShortCut = 16450
      OnExecute = ActionOrderBlockExecute
    end
    object ActionOrderUnBlock: TAction [24]
      Category = 'Item'
      Caption = #1057#1085#1103#1090#1100' '#1079#1072#1087#1088#1077#1090
      Hint = #1056#1072#1079#1073#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1082#1072#1079
      ImageIndex = 16
      ShortCut = 49218
      OnExecute = ActionOrderUnBlockExecute
    end
    object ActionCheckNakl: TAction
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
      Hint = #1055#1088#1086#1074#1077#1088#1082#1072' '#1085#1072#1082#1083#1072#1076#1085#1099#1093' '#1080' '#1094#1077#1085
      ImageIndex = 23
      OnExecute = ActionCheckNaklExecute
    end
    object ActionItemCopy: TAction
      Category = 'Item'
      Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1082#1072#1079
      Hint = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1082#1072#1079
      ImageIndex = 24
      ShortCut = 49219
      OnExecute = ActionItemCopyExecute
    end
    object ActionAutoLoadAll: TAction
      Caption = #1055#1088#1086#1074#1077#1089#1090#1080' '#1074#1089#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' '#1072#1074#1090#1086#1079#1072#1075#1088#1091#1079#1082#1080
      Hint = #1055#1088#1086#1074#1077#1089#1090#1080' '#1074#1089#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' '#1072#1074#1090#1086#1079#1072#1075#1088#1091#1079#1082#1080
      ImageIndex = 25
      OnExecute = ActionAutoLoadAllExecute
    end
  end
  inherited SQLBuilder: TMLKSQLBuilder
    Select.Strings = (
      'a.*'
      
        '--       ,(select TypeReturnName from d_TypeReturn where TypeRet' +
        'urnNo = l.TypeReturnNo) as TypeReturn')
    From.Strings = (
      'dbo.v_blanklist a /*left join'
      '      dbo.L_BlankReturn l on l.Document_id = a.Document_id*/')
    Where.Strings = (
      ' DateNakl between :p_date_beg and :p_date_end'
      ' and (otdelNo= :P_OTDELNO or :P_SHOW_ALL = -1)'
      
        ' and (exists (select 1 from e_blanks where document_id=a.id and ' +
        'TovarNo = :p_tovarno ) or :is_show_all_tov =1 )'
      ' and OurFIrmNo = :OurFIrmNo'
      ' and (ReasonId = :Reason_id or isnull(:is_show_all_Reason,0)=1)')
    OrderBy.Strings = (
      'a.ID')
    OnGetParams = SQLBuilderGetParams
    Left = 368
    Top = 252
  end
  inherited Query: TMSQuery
    SQLRefresh.Strings = (
      'select  a.*'
      
        '--       ,(select TypeReturnName from d_TypeReturn where TypeRet' +
        'urnNo = l.TypeReturnNo) as TypeReturn'
      ' from dbo.v_blanklist a /* left join'
      '      dbo.L_BlankReturn l on l.Document_id = a.Document_id*/'
      'WHERE a.ID = :ID')
    SQL.Strings = (
      'select  a.*'
      ' from dbo.v_blanklist a'
      'where (otdelNo= :P_OTDELNO or :P_SHOW_ALL = -1)')
    Left = 28
    Top = 204
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'P_OTDELNO'
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'P_SHOW_ALL'
        Value = nil
      end>
    object QueryId: TIntegerField
      FieldName = 'Id'
    end
    object QueryDocument_Id: TIntegerField
      FieldName = 'Document_Id'
    end
    object QueryNum: TStringField
      FieldName = 'Num'
      ReadOnly = True
      Size = 43
    end
    object QueryDatenakl: TDateTimeField
      FieldName = 'Datenakl'
    end
    object QuerySubnum: TIntegerField
      FieldName = 'Subnum'
    end
    object QueryPostno: TSmallintField
      FieldName = 'Postno'
    end
    object QueryPostname: TStringField
      FieldName = 'Postname'
      Size = 30
    end
    object QueryPostdaydelay: TSmallintField
      FieldName = 'Postdaydelay'
      ReadOnly = True
    end
    object QuerySotrudno: TSmallintField
      FieldName = 'Sotrudno'
    end
    object QuerySotrudname: TStringField
      FieldName = 'Sotrudname'
      ReadOnly = True
      Size = 30
    end
    object QueryBuh: TSmallintField
      FieldName = 'Buh'
    end
    object QueryBuhname: TStringField
      FieldName = 'Buhname'
      ReadOnly = True
    end
    object QueryVidnaklno: TSmallintField
      FieldName = 'Vidnaklno'
    end
    object QueryVidnaklname: TStringField
      FieldName = 'Vidnaklname'
      ReadOnly = True
    end
    object QueryUserno: TSmallintField
      FieldName = 'Userno'
    end
    object QueryUsername: TStringField
      FieldName = 'Username'
      ReadOnly = True
    end
    object QueryAddressno: TSmallintField
      FieldName = 'Addressno'
    end
    object QueryAddress: TStringField
      FieldName = 'Address'
      Size = 256
    end
    object QueryOtdelno: TSmallintField
      FieldName = 'Otdelno'
    end
    object QueryOtdelname: TStringField
      FieldName = 'Otdelname'
      ReadOnly = True
      Size = 30
    end
    object QueryColnprice: TSmallintField
      FieldName = 'Colnprice'
    end
    object QueryColnpricename: TStringField
      FieldName = 'Colnpricename'
      ReadOnly = True
      Size = 64
    end
    object QueryKoldayplan: TSmallintField
      FieldName = 'Koldayplan'
    end
    object QueryStatus: TSmallintField
      FieldName = 'Status'
    end
    object QueryStatusname: TStringField
      FieldName = 'Statusname'
      ReadOnly = True
      Size = 32
    end
    object QuerySumma: TFloatField
      FieldName = 'Summa'
    end
    object QuerySumkol: TFloatField
      FieldName = 'Sumkol'
      ReadOnly = True
    end
    object QueryWeight: TFloatField
      FieldName = 'Weight'
    end
    object QueryDatecorrelation: TDateTimeField
      FieldName = 'Datecorrelation'
    end
    object QueryCreatedate: TDateTimeField
      FieldName = 'Createdate'
    end
    object QueryIs_Read_Only: TIntegerField
      FieldName = 'Is_Read_Only'
      ReadOnly = True
    end
    object QueryReserve: TSmallintField
      FieldName = 'Reserve'
    end
    object QueryReasonid: TSmallintField
      FieldName = 'Reasonid'
    end
    object QueryReasonname: TStringField
      FieldName = 'Reasonname'
      ReadOnly = True
      Size = 100
    end
    object QueryRashoddatenakl: TDateTimeField
      FieldName = 'Rashoddatenakl'
      ReadOnly = True
    end
    object QueryRashodnom: TIntegerField
      FieldName = 'Rashodnom'
    end
    object QueryNaklno: TIntegerField
      FieldName = 'Naklno'
    end
    object QueryRashodnum: TStringField
      FieldName = 'Rashodnum'
      ReadOnly = True
      Size = 43
    end
    object QuerySummain: TFloatField
      FieldName = 'Summain'
      ReadOnly = True
    end
    object QueryExpeditionno: TIntegerField
      FieldName = 'Expeditionno'
    end
    object QueryParentid: TIntegerField
      FieldName = 'Parentid'
    end
    object QueryVidtovgroupid: TLargeintField
      FieldName = 'Vidtovgroupid'
    end
    object QueryVidtovgroupname: TStringField
      FieldName = 'Vidtovgroupname'
      ReadOnly = True
      Size = 512
    end
    object QueryDescription: TStringField
      FieldName = 'Description'
      Size = 512
    end
    object QueryDay_Of_Week: TIntegerField
      FieldName = 'Day_Of_Week'
      ReadOnly = True
    end
    object QueryIncar: TBooleanField
      FieldName = 'Incar'
    end
    object QueryContract_Id: TIntegerField
      FieldName = 'Contract_Id'
    end
    object QueryContract_Description: TStringField
      FieldName = 'Contract_Description'
      ReadOnly = True
      Size = 1024
    end
    object QueryRegionno: TWordField
      FieldName = 'Regionno'
    end
    object QueryRegionname: TStringField
      FieldName = 'Regionname'
      ReadOnly = True
      Size = 50
    end
    object QueryOurfirmno: TIntegerField
      FieldName = 'Ourfirmno'
    end
    object Queryrowid: TLargeintField
      FieldName = 'rowid'
    end
    object QueryTypeReturn: TStringField
      FieldName = 'TypeReturn'
      ReadOnly = True
      Size = 50
    end
    object QueryTimeCreate: TFloatField
      FieldName = 'TimeCreate'
      ReadOnly = True
    end
    object QueryIdVeb: TStringField
      FieldName = 'IdVeb'
      ReadOnly = True
      Size = 30
    end
    object QueryDescriptionOrderVeb: TStringField
      FieldName = 'DescriptionOrderVeb'
      Size = 1024
    end
    object QueryCurrencyHead: TStringField
      FieldName = 'CurrencyHead'
      Size = 5
    end
    object QueryIsVeb: TBooleanField
      FieldName = 'IsVeb'
    end
  end
  inherited DS: TDataSource
    Left = 164
    Top = 156
  end
  inherited QueryStorage: TMSQuery
    Left = 504
    Top = 156
  end
  inherited PopupMenuGrid: TPopupMenu
    Left = 300
    Top = 252
  end
  inherited spCopyProfile: TMSStoredProc
    Left = 504
    Top = 204
  end
  object spBlankCorrelation: TMSStoredProc
    StoredProcName = 'sp_BlankToNaklR;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_BlankToNaklR;1(:p_document_id, :p_dateN' +
        'akl)}')
    Left = 368
    Top = 204
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'p_document_id'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftDateTime
        Name = 'p_dateNakl'
        ParamType = ptInput
        Value = nil
      end>
  end
  object spRestoreInputOrder: TMSStoredProc
    StoredProcName = 'sp_RestoreInputOrder'
    Connection = dmDataModule.DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL sp_RestoreInputOrder (:document_id)}')
    Left = 436
    Top = 204
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'document_id'
        ParamType = ptInput
        Value = nil
      end>
  end
  object SpDelOrderFromSetka: TMSStoredProc
    StoredProcName = 'Sp_DelOrderFromNaklR'
    Connection = dmDataModule.DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL Sp_DelOrderFromNaklR (:document_id)}')
    Left = 164
    Top = 252
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'document_id'
        ParamType = ptInput
        Value = nil
      end>
  end
  object spDelInputOrder: TMSStoredProc
    StoredProcName = 'sp_DelInputOrder'
    Connection = dmDataModule.DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL sp_DelInputOrder (:document_id)}')
    Left = 232
    Top = 252
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'document_id'
        ParamType = ptInput
        Value = nil
      end>
  end
  object quBlankSpec: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT '
      '              b.TovarNo '
      '            , t.NameTovar '
      '            , b.KolOrd'
      '            ,b.Boss_price'
      '            ,t.KolPerPak'
      '            ,t.SrokReal'
      '            ,v.vidname'
      'FROM dbo.e_blanks b, tovar t, vidtov v'
      'where b.tovarNo=t.tovarNo'
      'and t.vidno=v.vidno'
      'and document_id=:document_id'
      'and isNull(KolOrd,0)<>0')
    Left = 300
    Top = 204
    ParamData = <
      item
        DataType = ftInteger
        Name = 'document_id'
        Value = 15
      end>
  end
  object quDepts: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      'from dbo.vidOtdel')
    Left = 96
    Top = 204
  end
  object DSDepts: TDataSource
    DataSet = quDepts
    Left = 232
    Top = 156
  end
  object QuSumma: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select '
      'sum(weight) as weight'
      ',sum(summa) as summa'
      ' from e_blank_head '
      'where (dateNakl between :p_dateBeg and :p_dateEnd)'
      ' and status<>-1')
    AfterOpen = QueryAfterOpen
    AfterScroll = QueryAfterScroll
    AfterRefresh = QueryAfterRefresh
    Left = 164
    Top = 204
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'p_dateBeg'
        Value = nil
      end
      item
        DataType = ftDateTime
        Name = 'p_dateEnd'
        Value = nil
      end>
  end
  object spSetOrderReserve: TMSStoredProc
    StoredProcName = 'sp_SetOrderReserve'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_SetOrderReserve (:p_document_id, :p_res' +
        'erve)}')
    Left = 96
    Top = 252
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'p_document_id'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftSmallint
        Name = 'p_reserve'
        ParamType = ptInput
        Value = nil
      end>
  end
  object DSVtTemp: TDataSource
    DataSet = VTTemp
    Left = 368
    Top = 156
  end
  object spCopyBlank: TMSStoredProc
    StoredProcName = 'sp_Copy_Blank;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_Copy_Blank;1(:p_document_id, :p_date_to' +
        ', :p_UserNo)}')
    Left = 28
    Top = 252
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = nil
      end
      item
        DataType = ftString
        Name = 'p_document_id'
        ParamType = ptInputOutput
        Size = 32
        Value = nil
      end
      item
        DataType = ftDateTime
        Name = 'p_date_to'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'p_UserNo'
        ParamType = ptInput
        Value = nil
      end>
  end
  object QueryExistBlank: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select max(RashodNum) as RashodNum, max(id) as ID'
      'from dbo.v_blankList'
      'where status=0 '
      'and DateNakl= :p_DateNakl'
      'and PostNo=  :p_PostNo'
      'and AddressNo= :p_AddressNo'
      'and VidTovGroupId= :p_VidTovGroupId'
      'and OtdelNo= :p_OtdelNo'
      'and SotrudNo= :p_SotrudNo'
      'and ColNPrice= :p_ColNPrice')
    Left = 436
    Top = 156
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'p_DateNakl'
        Value = nil
      end
      item
        DataType = ftSmallint
        Name = 'p_PostNo'
        Value = nil
      end
      item
        DataType = ftSmallint
        Name = 'p_AddressNo'
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'p_VidTovGroupId'
        Value = nil
      end
      item
        DataType = ftSmallint
        Name = 'p_OtdelNo'
        Value = nil
      end
      item
        DataType = ftSmallint
        Name = 'p_SotrudNo'
        Value = nil
      end
      item
        DataType = ftSmallint
        Name = 'p_ColNPrice'
        Value = nil
      end>
  end
  object VTTemp: TVirtualTable
    FieldDefs = <
      item
        Name = 'OtdelNo'
        DataType = ftInteger
      end
      item
        Name = 'Reason_Id'
        DataType = ftLargeint
      end>
    Left = 436
    Top = 252
    Data = {
      0300020007004F7464656C4E6F03000000000000000900526561736F6E5F4964
      1900000000000000000000000000}
  end
  object QuReason: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from d_blank_reason')
    AfterOpen = QueryAfterOpen
    AfterScroll = QueryAfterScroll
    AfterRefresh = QueryAfterRefresh
    Left = 232
    Top = 204
  end
  object DsReason: TDataSource
    DataSet = QuReason
    Left = 300
    Top = 156
  end
  object QuCheckNakl: TMSQuery
    SQLRefresh.Strings = (
      'select * from dbo.v_blanklist a'
      'WHERE ID = :ID')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select u.id,u.blank_cnt,u.Nakl_cnt,u.spis_cnt'
      'from '
      '(    '
      'SELECT  h.id'
      '       ,(SELECT Count(s.id)'
      '        FROM   e_blanks s'
      '        WHERE  s.document_id = h.id'
      '        AND s.kolord <> 0) AS blank_cnt'
      '       ,(SELECT Count(s1.id)'
      '        FROM   dspec s1'
      '        WHERE  s1.dhead_id = h.rowid'
      '        AND s1.qty <> 0) AS nakl_cnt'
      '       ,(SELECT Count(s2.id)'
      '        FROM   dspec s2'
      '        WHERE  s2.dhead_id IN (SELECT pkey'
      '                               FROM   naklr'
      
        '                               WHERE  nomreturn = h.rowid)) AS s' +
        'pis_cnt'
      '       ,h.vidnaklno'
      'FROM   e_blank_head h'
      'WHERE  h.datenakl = :p_date_Nakl'
      'AND h.status <> -1) u'
      
        'where blank_cnt<>Nakl_cnt or (u.vidnaklNo=3 and u.blank_cnt<>u.s' +
        'pis_cnt)')
    AfterOpen = QueryAfterOpen
    AfterScroll = QueryAfterScroll
    AfterRefresh = QueryAfterRefresh
    Left = 572
    Top = 204
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_date_Nakl'
        Value = nil
      end>
  end
end
