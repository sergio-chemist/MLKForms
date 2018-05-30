inherited fmMain: TfmMain
  Caption = #1057#1082#1083#1072#1076
  Menu = mmMenu
  ExplicitHeight = 290
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TStatusBar
    ExplicitLeft = 0
    ExplicitWidth = 505
  end
  object mmMenu: TMainMenu
    Left = 224
    Top = 64
    object mnuSettings: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      object mnuUsers: TMenuItem
        Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
        OnClick = mnuUsersClick
      end
    end
    object mnuHelp: TMenuItem
      Caption = '?'
      object mnuAbout: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077' ...'
        OnClick = mnuAboutClick
      end
      object mnuExit: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = mnuExitClick
      end
    end
  end
end
