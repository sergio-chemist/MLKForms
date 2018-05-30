object BCExceptionDlg: TBCExceptionDlg
  Left = 445
  Top = 246
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1054#1096#1080#1073#1082#1072
  ClientHeight = 239
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ImageError: TImage
    Left = 16
    Top = 16
    Width = 32
    Height = 32
    AutoSize = True
    Picture.Data = {
      07544269746D617076020000424D760200000000000076000000280000002000
      0000200000000100040000000000000200000000000000000000100000000000
      0000000000000000800000800000008080008000000080008000808000008080
      8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
      FF00888888888888889999888888888888888888888888999999999999888888
      8888888888889999999999999999888888888888888999999999999999999888
      8888888888999999999999999999999888888888899999999999999999999998
      888888889999F9999999999999F9999988888889999FFF99999999999FFF9999
      9888889999FFFFF999999999FFFFF9999988889999FFFFFF9999999FFFFFF999
      99888999999FFFFFF99999FFFFFF9999999889999999FFFFFF999FFFFFF99999
      9998899999999FFFFFF9FFFFFF99999999989999999999FFFFFFFFFFF9999999
      999999999999999FFFFFFFFF999999999999999999999999FFFFFFF999999999
      9999999999999999FFFFFFF999999999999999999999999FFFFFFFFF99999999
      99999999999999FFFFFFFFFFF99999999999899999999FFFFFF9FFFFFF999999
      999889999999FFFFFF999FFFFFF9999999988999999FFFFFF99999FFFFFF9999
      9998899999FFFFFF9999999FFFFFF999998888999FFFFFF999999999FFFFFF99
      9988888999FFFF99999999999FFFF99998888889999FF9999999999999FF9999
      8888888899999999999999999999999888888888899999999999999999999988
      8888888888999999999999999999988888888888888899999999999999998888
      8888888888888999999999999988888888888888888888888999998888888888
      8888}
    Transparent = True
  end
  object BevelDetail: TBevel
    Left = 8
    Top = 120
    Width = 411
    Height = 10
    Shape = bsBottomLine
  end
  object MemoBrief: TMemo
    Left = 64
    Top = 16
    Width = 345
    Height = 57
    TabStop = False
    BorderStyle = bsNone
    ParentColor = True
    ReadOnly = True
    TabOrder = 0
    OnClick = MemoBriefClick
    OnKeyDown = MemoDetailsKeyDown
  end
  object ButtonOK: TButton
    Left = 344
    Top = 88
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnExit = ButtonOKExit
  end
  object ButtonDetails: TButton
    Left = 264
    Top = 88
    Width = 75
    Height = 25
    Caption = #1055#1086#1076#1088#1086#1073#1085#1086' >>'
    TabOrder = 2
    OnClick = ButtonDetailsClick
    OnExit = ButtonOKExit
  end
  object MemoDetails: TMemo
    Left = 16
    Top = 144
    Width = 393
    Height = 81
    TabStop = False
    BorderStyle = bsNone
    ParentColor = True
    ReadOnly = True
    TabOrder = 3
    OnClick = MemoBriefClick
    OnKeyDown = MemoDetailsKeyDown
  end
  object alException: TActionList
    Left = 260
    Top = 4
    object acCancel: TAction
      Caption = 'Cancel'
      ShortCut = 27
      OnExecute = acOKExecute
    end
    object acCopy: TAction
      Caption = 'acCopy'
      SecondaryShortCuts.Strings = (
        'Ctrl+C')
      ShortCut = 16429
      OnExecute = acCopyExecute
      OnUpdate = acCopyUpdate
    end
  end
end
