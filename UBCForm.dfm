object BCForm: TBCForm
  Left = 0
  Top = 0
  Caption = 'BCForm'
  ClientHeight = 231
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object ActionList: TActionList
    Left = 16
    object ActionShowSysInfo: TAction
      Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1089#1080#1089#1090#1077#1084#1085#1091#1102' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102
      ShortCut = 57417
      OnExecute = ActionShowSysInfoExecute
    end
    object ActionObjectInspector: TAction
      Caption = 'ActionObjectInspector'
      ShortCut = 57423
    end
    object ActionDebug: TAction
      Caption = #1056#1077#1078#1080#1084' '#1086#1090#1083#1072#1076#1082#1080
      OnExecute = ActionDebugExecute
    end
  end
end
