object BCContainerFrame: TBCContainerFrame
  Left = 0
  Top = 0
  Width = 320
  Height = 240
  TabOrder = 0
  object FrameProp: TValueListEditor
    Left = 0
    Top = 0
    Width = 320
    Height = 240
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
      194)
  end
  object DS: TDataSource
    Left = 72
    Top = 16
  end
end
