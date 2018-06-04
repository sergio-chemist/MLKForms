object BLANC_PRICE: TBLANC_PRICE
  Left = 888
  Top = 31
  BorderStyle = bsDialog
  Caption = #1062#1077#1085#1099' ('#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082')'
  ClientHeight = 186
  ClientWidth = 416
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object FirmaLabel: TLabel
    Left = 456
    Top = 24
    Width = 51
    Height = 13
    Caption = 'FirmaLabel'
  end
  object NaborLabel: TLabel
    Left = 456
    Top = 48
    Width = 55
    Height = 13
    Caption = 'NaborLabel'
  end
  object Y_N_Label: TLabel
    Left = 744
    Top = 40
    Width = 53
    Height = 13
    Caption = 'Y_N_Label'
  end
  object EnterPriceLabel: TLabel
    Left = 744
    Top = 80
    Width = 75
    Height = 13
    Caption = 'EnterPriceLabel'
  end
  object PriceChangeLabel: TLabel
    Left = 600
    Top = 136
    Width = 87
    Height = 13
    Caption = 'PriceChangeLabel'
  end
  object Memo1: TMemo
    Left = 40
    Top = 192
    Width = 193
    Height = 137
    TabOrder = 0
  end
  object NV_Memo: TMemo
    Left = 256
    Top = 192
    Width = 209
    Height = 137
    TabOrder = 1
  end
  object Result_Memo: TMemo
    Left = 480
    Top = 200
    Width = 201
    Height = 105
    Lines.Strings = (
      '')
    TabOrder = 2
  end
  object ITOG_PRICE_Memo: TMemo
    Left = 24
    Top = 352
    Width = 201
    Height = 137
    TabOrder = 3
  end
  object ITOG_VIDNAME_Memo: TMemo
    Left = 248
    Top = 360
    Width = 201
    Height = 129
    Lines.Strings = (
      '')
    TabOrder = 4
  end
  object ITOG_Grid: TDBGrid
    Left = 0
    Top = 0
    Width = 415
    Height = 185
    DataSource = ITOG_DS
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyPress = ITOG_GridKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'vidname'
        Title.Caption = #1043#1088#1091#1087#1087#1072
        Width = 169
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nabor'
        Title.Caption = #1053#1072#1073#1086#1088
        Width = 153
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ColName'
        Title.Caption = #1062#1077#1085#1072
        Width = 73
        Visible = True
      end>
  end
  object Enter_Price_Memo: TMemo
    Left = 464
    Top = 368
    Width = 185
    Height = 73
    Lines.Strings = (
      ''
      '')
    TabOrder = 6
  end
  object PriceQuery: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select vidname,nabor,Name,ColName,ARTICLE_GROUP_ID'
      'from V_Nabor_Vid_PRICE_A'
      'order by nabor')
    Left = 456
    Top = 72
  end
  object AcceptQuery: TMSQuery
    Connection = dmDataModule.DB
    DetailFields = 'Name'
    Left = 704
    Top = 40
  end
  object Enter_Price_Query: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select vidname,nabor,ARTICLE_GROUP_ID'
      'from V_Nabor_VidName_A')
    Left = 704
    Top = 72
  end
  object Nabor_Vid_Query: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare @PostNo int'
      ''
      'set @PostNo = :PostNo'
      ''
      ''
      'Select vidname,nabor,ARTICLE_GROUP_ID,SET_ARTICLE_GROUP_ID'
      ' from V_Nabor_VidName_A'
      '  where ARTICLE_GROUP_ID in (select ARTICLE_GROUP_ID '
      '                              from L_SET_ARTICLE_GROUP'
      
        '                               where SET_ARTICLE_GROUP_ID in (se' +
        'lect SET_ARTICLE_GROUP_ID from L_POST_SET_ARTGROUP_DELAY where P' +
        'ostNo = @PostNo) or @PostNo is null)'
      ''
      '/*'
      'Select vidname,nabor,ARTICLE_GROUP_ID,SET_ARTICLE_GROUP_ID'
      ' from V_Nabor_VidName_A'
      
        '  where (SET_ARTICLE_GROUP_ID in (select SET_ARTICLE_GROUP_ID fr' +
        'om L_POST_SET_ARTGROUP_PRICE where POSTNO = @PostNo) or @PostNo ' +
        'is null)'
      '*/')
    Left = 528
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
      end>
  end
  object ITOG_DS: TDataSource
    DataSet = ITOG_Query
    Left = 616
    Top = 72
  end
  object ITOG_Query: TMSQuery
    Connection = dmDataModule.DB
    Left = 616
    Top = 41
  end
  object Change_Price_Query: TMSQuery
    Connection = dmDataModule.DB
    Left = 704
    Top = 136
  end
end
