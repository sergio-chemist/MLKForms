inherited BCMainForm: TBCMainForm
  Caption = 'BCMainForm'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TStatusBar [0]
    Left = 0
    Top = 212
    Width = 505
    Height = 19
    Panels = <
      item
        Width = 400
      end
      item
        Alignment = taCenter
        Width = 150
      end
      item
        Width = 50
      end
      item
        Width = 50
      end
      item
        Width = 50
      end>
    ExplicitLeft = -57
    ExplicitWidth = 562
  end
  object ApplicationEvents: TApplicationEvents
    OnHint = ApplicationEventsHint
    Left = 112
    Top = 48
  end
end
