inherited BCPropDlg: TBCPropDlg
  Left = 536
  Top = 197
  BorderStyle = bsDialog
  Caption = 'BCPropDlg'
  ClientHeight = 362
  ClientWidth = 323
  OldCreateOrder = True
  Position = poMainFormCenter
  OnShow = FormShow
  ExplicitWidth = 329
  ExplicitHeight = 391
  DesignSize = (
    323
    362)
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonOK: TButton [0]
    Left = 97
    Top = 341
    Width = 75
    Height = 21
    Action = ActionOK
    Anchors = [akRight, akBottom]
    Default = True
    TabOrder = 0
  end
  object ButtonCancel: TButton [1]
    Left = 172
    Top = 341
    Width = 75
    Height = 21
    Action = ActionCancel
    Anchors = [akRight, akBottom]
    Cancel = True
    ModalResult = 2
    TabOrder = 1
  end
  object ButtonApply: TButton [2]
    Left = 247
    Top = 341
    Width = 75
    Height = 21
    Action = ActionApply
    Anchors = [akRight, akBottom]
    TabOrder = 2
  end
  object PageControl: TcxPageControl [3]
    Left = 0
    Top = 0
    Width = 322
    Height = 339
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    Properties.ActivePage = tsMainProp
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 335
    ClientRectLeft = 4
    ClientRectRight = 318
    ClientRectTop = 24
    object tsMainProp: TcxTabSheet
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
  end
  inherited ActionList: TActionList
    object ActionOK: TAction [2]
      Caption = 'OK'
      OnExecute = ActionOKExecute
    end
    object ActionCancel: TAction [3]
      Caption = #1054#1090#1084#1077#1085#1072
      OnExecute = ActionCancelExecute
    end
    object ActionApply: TAction [4]
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      Enabled = False
      OnExecute = ActionApplyExecute
    end
  end
end
