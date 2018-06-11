inherited MlekoSelectSotrudDlg: TMlekoSelectSotrudDlg
  Left = 406
  Top = 174
  Caption = #1042#1099#1073#1086#1088' '#1084#1077#1085#1077#1076#1078#1077#1088#1072
  ClientHeight = 362
  ExplicitHeight = 401
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Height = 291
    ExplicitHeight = 291
    inherited TabSheet1: TTabSheet
      ExplicitHeight = 263
      inherited Splitter: TSplitter
        Height = 263
        ExplicitLeft = 314
        ExplicitHeight = 263
      end
      inherited PanelGrid: TPanel
        Height = 263
        ExplicitHeight = 263
        inherited DBGrid: TDBGridEh
          Height = 239
        end
      end
      inherited PanelSelect: TPanel
        Height = 263
        ExplicitHeight = 263
        inherited DBGridSelection: TDBGridEh
          Height = 239
        end
      end
    end
  end
  inherited ButtonSelect: TButton
    Top = 298
    ExplicitTop = 298
  end
  inherited ButtonCancel: TButton
    Top = 329
    ExplicitTop = 329
  end
  inherited pnlFilter: TMlkFilterPanel
    Top = 291
    Width = 437
    Height = 71
    ExplicitTop = 291
    ExplicitWidth = 437
    ExplicitHeight = 122
    object ftOtdel: TMlkDBComboEdit
      AlignWithMargins = True
      Left = 51
      Top = 6
      Width = 201
      Height = 21
      Enabled = True
      OwnesLButton = True
      OwnesLLabel = True
      LBtnAlignment = baRight
      LBtnDown = False
      LBtnGroupIndex = 0
      LBtnAllowAllUp = False
      LBtnGlyphKind = gkDots
      LBtnShortCut1 = 115
      LBtnShortCut2 = 40
      LBtnWidth = 25
      LLblAlignment = laLeft
      LLblCaption = #1054#1090#1076#1077#1083
      LLblWidth = 35
      LLblFont.Charset = DEFAULT_CHARSET
      LLblFont.Color = clWindowText
      LLblFont.Height = -11
      LLblFont.Name = 'MS Sans Serif'
      LLblFont.Style = []
      LLblRequiredFont.Charset = DEFAULT_CHARSET
      LLblRequiredFont.Color = clWindowText
      LLblRequiredFont.Height = -11
      LLblRequiredFont.Name = 'MS Sans Serif'
      LLblRequiredFont.Style = [fsBold]
      Required = False
      TabOrder = 0
      Text = ''
      Visible = True
      DataSet = quDepts
      LocateKey = False
      KeyField = 'OtdelNo'
      TextField = 'OtdelName'
      Owner = ''
      OnSelectOk = ftOtdelSelectOk
      EditStyle = edCombo
      AutoTabControl = False
    end
  end
  inherited Query: TMSQuery
    SQL.Strings = (
      'select * from v_postList')
  end
  inherited SQLBuilder: TMlkSQLBuilder
    Select.Strings = (
      '*')
    From.Strings = (
      'v_SelectSotrud a')
    Where.Strings = (
      ' (a.SotrudOtdel= :P_OTDELNO or :P_SHOW_ALL = -1)')
    OrderBy.Strings = (
      ' a.SotrudName')
    OnGetParams = SQLBuilderGetParams
    Left = 252
    Top = 166
  end
  object DSOtdels: TDataSource
    DataSet = quOtdels
    Left = 392
    Top = 215
  end
  object quOtdels: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from vidotdel')
    AfterOpen = QueryAfterOpen
    AfterScroll = QueryAfterScroll
    AfterRefresh = QueryAfterRefresh
    Left = 423
    Top = 218
  end
  object quDepts: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      'from dbo.vidOtdel')
    Left = 368
    Top = 296
    object quDeptsOtdelNo: TSmallintField
      FieldName = 'OtdelNo'
    end
    object quDeptsOtdelName: TStringField
      FieldName = 'OtdelName'
      Size = 30
    end
  end
end
