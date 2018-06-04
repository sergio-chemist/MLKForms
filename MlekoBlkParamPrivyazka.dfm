object NaborAddTovar: TNaborAddTovar
  Left = 593
  Top = 389
  Width = 810
  Height = 261
  Caption = 'NaborAddTovar'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 19
    Top = 184
    Width = 3
    Height = 13
  end
  object Memo1: TMemo
    Left = 16
    Top = 8
    Width = 242
    Height = 161
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 272
    Top = 8
    Width = 513
    Height = 161
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'vidname'
        Width = 243
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nabor'
        Width = 251
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = MSQuery1
    Left = 168
    Top = 184
  end
  object MSQuery1: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select a.ID,'
      #39'or vidname ='#39' + '#39'"'#39' + d.NAME + '#39'"'#39' as vidname,'
      'e.NAME as nabor,'
      'a.ARTICLE_GROUP_ID,'
      'a.SET_ARTICLE_GROUP_ID'
      'from  L_SET_ARTICLE_GROUP as a'
      'join D_ARTICLE_GROUP as d '
      'on a.ARTICLE_GROUP_ID = d.ID '
      'join D_SET_ARTICLE_GROUP as e'
      'on a.SET_ARTICLE_GROUP_ID = e.ID')
    Left = 216
    Top = 184
  end
end
