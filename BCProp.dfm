inherited BCPropDlg: TBCPropDlg
  Anchors = [akRight, akBottom]
  Caption = 'BCPropDlg'
  ClientHeight = 283
  ClientWidth = 289
  ExplicitWidth = 305
  ExplicitHeight = 322
  DesignSize = (
    289
    283)
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl [0]
    Left = 0
    Top = 0
    Width = 289
    Height = 248
    ActivePage = tsMainProp
    Align = alTop
    TabOrder = 0
    object tsMainProp: TTabSheet
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
  end
  object ButtonOK: TButton [1]
    Left = 56
    Top = 254
    Width = 75
    Height = 21
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    TabOrder = 1
    ExplicitLeft = 142
    ExplicitTop = 344
  end
  object ButtonCancel: TButton [2]
    Left = 131
    Top = 254
    Width = 75
    Height = 21
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
    ExplicitLeft = 217
    ExplicitTop = 344
  end
  object ButtonApply: TButton [3]
    Left = 206
    Top = 254
    Width = 75
    Height = 21
    Anchors = [akRight, akBottom]
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 3
    ExplicitLeft = 292
    ExplicitTop = 344
  end
  inherited ActionList: TActionList
    Left = 8
    Top = 64
  end
end
