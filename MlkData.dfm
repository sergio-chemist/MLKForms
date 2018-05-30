inherited dmDataModule: TdmDataModule
  Height = 837
  Width = 1030
  inherited DB: TMSConnection
    ConnectionTimeout = 0
    Options.PersistSecurityInfo = True
    Options.ApplicationName = 'MLEKO'
    Options.Provider = prSQL
    Server = '192.168.0.3\KVAZAR'
    Connected = True
    Left = 220
    Top = 132
    EncryptedPassword = 'CCFFDCFFA0FFB4FFA9FFBEFFA5FFBEFFADFFBFFF'
  end
  inherited QFO: TMSQuery
    Left = 32
    Top = 190
  end
  object dsTovar: TDataSource
    DataSet = quTovar
    Left = 326
    Top = 74
  end
  object dsSotrud: TDataSource
    DataSet = quSotrud
    Left = 424
    Top = 74
  end
  object dsVidTov: TDataSource
    DataSet = quVidTov
    Left = 522
    Top = 74
  end
  object quWork: TMSQuery
    Connection = DB
    Left = 522
    Top = 132
  end
  object UpdateTovar: TMSUpdateSQL
    InsertSQL.Strings = (
      'insert into Tovar'
      
        '  (TovarNo, NameTovar, NameTovarShort, EdIzm, VidNo, CompanyNo, ' +
        'KolPerPak, '
      
        '   SrokReal, Weight, TipNo, CodReport, Export1C, Change1C, Cod1C' +
        ', ID1C, OtdelNo, '
      'TaraNo, Visible,BarCode,MinCarryover,Description)'
      'values'
      
        '  (:TovarNo, :NameTovar, :NameTovarShort, :EdIzm, :VidNo, :Compa' +
        'nyNo, '
      ':KolPerPak, '
      
        '   :SrokReal, :Weight, :TipNo, :CodReport, :Export1C, :Change1C,' +
        ' :Cod1C, '
      
        '   :ID1C, :OtdelNo, :TaraNo, :Visible, :barCode, :MinCarryover, ' +
        ':Description)')
    DeleteSQL.Strings = (
      'delete from Tovar'
      'where'
      '  TovarNo = :OLD_TovarNo')
    ModifySQL.Strings = (
      'update Tovar'
      'set'
      '  TovarNo = :TovarNo,'
      '  NameTovar = :NameTovar,'
      '  NameTovarShort = :NameTovarShort,'
      '  EdIzm = :EdIzm,'
      '  VidNo = :VidNo,'
      '  CompanyNo = :CompanyNo,'
      '  KolPerPak = :KolPerPak,'
      '  SrokReal = :SrokReal,'
      '  Weight = :Weight,'
      '  TipNo = :TipNo,'
      '  CodReport = :CodReport,'
      '  Export1C = :Export1C,'
      '  Change1C = 1,'
      '  Cod1C = :Cod1C,'
      '  ID1C = :ID1C,'
      '  OtdelNo = :OtdelNo,'
      '  TaraNo = :TaraNo,'
      '   Visible = :Visible,'
      '   weight_packed = :weight_packed,'
      '  barCode = :barCode,'
      '  is_weight= :is_weight,'
      '  MinCarryover = :MinCarryover,'
      '  Description = :Description '
      'where'
      '  TovarNo = :OLD_TovarNo')
    Left = 32
    Top = 422
  end
  object quTovar: TMSQuery
    Connection = DB
    SQL.Strings = (
      'SELECT t.tovarno,'
      '       t.nametovar,'
      '       t.nametovarshort,'
      '       t.edizm,'
      '       t.vidno,'
      '       t.companyno,'
      '       t.KolPerPak,'
      '       t.srokreal,'
      '       t.weight,'
      '       c.namecompany,'
      '       vt.vidname,'
      '       tt.tipname,'
      '       tt.tipno,'
      '       t.codreport,'
      '       t.export1c,'
      '       t.change1c,'
      '       t.cod1c,'
      '       t.id1c,'
      '       t.otdelno,'
      '       vo.otdelname,'
      '       t.tarano,'
      '       t.visible,'
      '       t.weight_packed,'
      '       t.barcode,'
      '       t.is_weight,'
      '       t.MinCarryover,'
      '       t.Description,'
      '       t.UKT_ZED'
      'FROM   tovar t LEFT OUTER JOIN '
      '       vidotdel vo ON t.otdelno = vo.otdelno LEFT OUTER JOIN '
      '       tiptovara tt ON t.tipno = tt.tipno LEFT OUTER JOIN '
      
        '       vidtov vt ON vt.vidno = t.vidno LEFT OUTER JOIN company c' +
        ' ON c.companyno = t.companyno'
      '&_where'
      'order by &_order'
      '--option (fast 30)')
    CachedUpdates = True
    UpdateObject = UpdateTovar
    AfterOpen = quTovarAfterOpen
    BeforeClose = quTovarBeforeClose
    BeforePost = quTovarBeforePost
    BeforeDelete = quTovarBeforeDelete
    OnNewRecord = quTovarNewRecord
    Left = 424
    Top = 248
    MacroData = <
      item
        Name = '_where'
      end
      item
        Name = '_order'
        Value = 'NameTovar'
      end>
    object quTovartovarno: TLargeintField
      FieldName = 'tovarno'
    end
    object quTovarNameTovar: TStringField
      FieldName = 'NameTovar'
      Origin = 'tovar.nametovar'
      FixedChar = True
      Size = 128
    end
    object quTovarNameTovarShort: TStringField
      FieldName = 'NameTovarShort'
      Origin = 'tovar.nametovarshort'
      FixedChar = True
      Size = 64
    end
    object quTovarEdIzm: TStringField
      FieldName = 'EdIzm'
      Origin = 'tovar.edizm'
      Size = 5
    end
    object quTovarVidNo: TSmallintField
      FieldName = 'VidNo'
      Origin = 'tovar.vidno'
    end
    object quTovarCompanyNo: TSmallintField
      FieldName = 'CompanyNo'
      Origin = 'tovar.companyno'
    end
    object quTovarSrokReal: TSmallintField
      FieldName = 'SrokReal'
      Origin = 'tovar.srokreal'
    end
    object quTovarWeight: TFloatField
      FieldName = 'Weight'
      Origin = 'tovar.weight'
      Precision = 10
    end
    object quTovarNameCompany: TStringField
      FieldName = 'NameCompany'
      Origin = 'company.namecompany'
      Size = 30
    end
    object quTovarVidName: TStringField
      FieldName = 'VidName'
      Origin = 'vidtov.vidname'
      Size = 30
    end
    object quTovarVidNameLC: TStringField
      FieldKind = fkLookup
      FieldName = 'VidNameLC'
      LookupDataSet = quVidTov
      LookupKeyFields = 'VidNo'
      LookupResultField = 'VidName'
      KeyFields = 'VidNo'
      Size = 30
      Lookup = True
    end
    object quTovarNameCompanyLC: TStringField
      FieldKind = fkLookup
      FieldName = 'NameCompanyLC'
      LookupDataSet = quCompany
      LookupKeyFields = 'CompanyNo'
      LookupResultField = 'NameCompany'
      KeyFields = 'CompanyNo'
      Size = 30
      Lookup = True
    end
    object quTovarTipName: TStringField
      FieldName = 'TipName'
      Origin = 'tiptovara.tipname'
      Size = 30
    end
    object quTovarTipNameLC: TStringField
      FieldKind = fkLookup
      FieldName = 'TipNameLC'
      LookupDataSet = quTipTovara
      LookupKeyFields = 'TipNo'
      LookupResultField = 'TipName'
      KeyFields = 'TipNo'
      Size = 30
      Lookup = True
    end
    object quTovarTipNo: TSmallintField
      FieldName = 'TipNo'
      Origin = 'tiptovara.tipno'
    end
    object quTovarCodReport: TStringField
      FieldName = 'CodReport'
      Origin = 'tovar.codreport'
      FixedChar = True
    end
    object quTovarExport1C: TBooleanField
      FieldName = 'Export1C'
      Origin = 'tovar.export1c'
    end
    object quTovarChange1C: TBooleanField
      FieldName = 'Change1C'
      Origin = 'tovar.change1c'
    end
    object quTovarCod1C: TStringField
      FieldName = 'Cod1C'
      Origin = 'tovar.cod1c'
      FixedChar = True
      Size = 6
    end
    object quTovarID1C: TStringField
      FieldName = 'ID1C'
      Origin = 'tovar.id1c'
      FixedChar = True
      Size = 6
    end
    object quTovarOtdelName: TStringField
      FieldName = 'OtdelName'
      Origin = 'vidotdel.otdelname'
      FixedChar = True
      Size = 30
    end
    object quTovarOtdelNameLC: TStringField
      FieldKind = fkLookup
      FieldName = 'OtdelNameLC'
      LookupDataSet = quOtdel
      LookupKeyFields = 'OtdelNo'
      LookupResultField = 'OtdelName'
      KeyFields = 'OtdelNo'
      Size = 30
      Lookup = True
    end
    object quTovarOtdelNo: TSmallintField
      FieldName = 'OtdelNo'
      Origin = 'tovar.otdelno'
    end
    object quTovarTaraNo: TSmallintField
      FieldName = 'TaraNo'
      Origin = 'tovar.tarano'
    end
    object quTovarTaraNameLC: TStringField
      FieldKind = fkLookup
      FieldName = 'TaraNameLC'
      LookupDataSet = quTara
      LookupKeyFields = 'TovarNo'
      LookupResultField = 'NameTovar'
      KeyFields = 'TaraNo'
      Lookup = True
    end
    object quTovarVisible: TBooleanField
      FieldName = 'Visible'
      Origin = 'tovar.visible'
    end
    object quTovarweight_packed: TBooleanField
      FieldName = 'weight_packed'
      Origin = 'tovar.weight_packed'
    end
    object quTovaris_weight: TBooleanField
      FieldName = 'is_weight'
      Origin = 'tovar.is_weight'
    end
    object quTovarBarCode: TLargeintField
      FieldName = 'BarCode'
      Origin = 'tovar.barcode'
    end
    object quTovarMinCarryover: TFloatField
      FieldName = 'MinCarryover'
    end
    object quTovarDescription: TStringField
      FieldName = 'Description'
      Size = 150
    end
    object quTovarUKT_ZED: TStringField
      FieldName = 'UKT_ZED'
    end
    object quTovarKolPerPak: TFloatField
      FieldName = 'KolPerPak'
    end
  end
  object quVidTov: TMSQuery
    Connection = DB
    SQL.Strings = (
      'select VidNo'
      '     , VidName'
      '     , PrintToPrice'
      '     , PriceWithNDS'
      '     , PrintToExpedition'
      '     , SotrudNo'
      
        '     , (select SotrudName from Sotrud where SotrudNo = vt.Sotrud' +
        'No) as SotrudName'
      '     , LimitOnReturn'
      '     , Visible'
      'from VidTov vt'
      '&_where'
      'order by &_order')
    CachedUpdates = True
    UpdateObject = UpdateVidTov
    BeforePost = quVidTovBeforePost
    BeforeDelete = quVidTovBeforeDelete
    OnNewRecord = quVidTovNewRecord
    Left = 620
    Top = 190
    MacroData = <
      item
        Name = '_where'
      end
      item
        Name = '_order'
        Value = 'VidName'
      end>
    object quVidTovVidNo: TSmallintField
      FieldName = 'VidNo'
      Origin = 'VidTov.VidNo'
    end
    object quVidTovVidName: TStringField
      FieldName = 'VidName'
      Origin = 'VidTov.VidName'
      Size = 30
    end
    object quVidTovPrintToPrice: TBooleanField
      FieldName = 'PrintToPrice'
      Origin = 'VidTov.PrintToPrice'
    end
    object quVidTovPriceWithNDS: TBooleanField
      FieldName = 'PriceWithNDS'
      Origin = 'VidTov.PriceWithNDS'
    end
    object quVidTovPrintToExpedition: TBooleanField
      FieldName = 'PrintToExpedition'
      Origin = 'VidTov.PrintToExpedition'
    end
    object quVidTovSotrudNo: TIntegerField
      FieldName = 'SotrudNo'
    end
    object quVidTovSotrudName: TStringField
      FieldName = 'SotrudName'
      Size = 30
    end
    object quVidTovLimitOnReturn: TFloatField
      FieldName = 'LimitOnReturn'
    end
    object quVidTovVisible: TBooleanField
      FieldName = 'Visible'
      Origin = 'VidTov.Visible'
    end
  end
  object quCompany: TMSQuery
    Connection = DB
    SQL.Strings = (
      'select CompanyNo,NameCompany,PercentSalary, Visible'
      'from Company'
      '&_where'
      'order by &_order')
    CachedUpdates = True
    UpdateObject = UpdateCompany
    BeforePost = quCompanyBeforePost
    BeforeDelete = quCompanyBeforeDelete
    Left = 130
    Top = 306
    MacroData = <
      item
        Name = '_where'
      end
      item
        Name = '_order'
        Value = 'NameCompany'
      end>
    object quCompanyCompanyNo: TSmallintField
      FieldName = 'CompanyNo'
      Origin = 'Company.CompanyNo'
    end
    object quCompanyNameCompany: TStringField
      FieldName = 'NameCompany'
      Origin = 'Company.NameCompany'
      Size = 30
    end
    object quCompanyPercentSalary: TFloatField
      FieldName = 'PercentSalary'
      Origin = 'Company.PercentSalary'
      DisplayFormat = '0.00'
      Precision = 10
    end
    object quCompanyVisible: TBooleanField
      FieldName = 'Visible'
      Origin = 'Company.Visible'
    end
  end
  object UpdateVidTov: TMSUpdateSQL
    InsertSQL.Strings = (
      'insert into VidTov'
      
        '  (VidNo, VidName, PrintToPrice, PriceWithNDS, PrintToExpedition' +
        ', SotrudNo, LimitOnReturn, Visible)'
      'values'
      
        '  (:VidNo, :VidName, :PrintToPrice, :PriceWithNDS, :PrintToExped' +
        'ition, :SotrudNo, :LimitOnReturn, :Visible)')
    DeleteSQL.Strings = (
      'delete from VidTov'
      'where'
      '  VidNo = :OLD_VidNo')
    ModifySQL.Strings = (
      'declare @cnt int'
      ''
      'select @cnt = count(*) from VidTov where VidNo = :OLD_VidNo'
      ''
      'if @cnt = 1'
      'update VidTov'
      'set'
      '  VidNo = :VidNo,'
      '  VidName = :VidName,'
      '  PrintToPrice = :PrintToPrice,'
      '  PriceWithNDS = :PriceWithNDS,'
      '  PrintToExpedition = :PrintToExpedition,'
      '  SotrudNo = :SotrudNo,'
      '  LimitOnReturn = :LimitOnReturn,'
      '  Visible = :Visible'
      'where'
      '  VidNo = :OLD_VidNo'
      'else'
      'insert into VidTov'
      
        '  (VidNo, VidName, PrintToPrice, PriceWithNDS, PrintToExpedition' +
        ', SotrudNo, LimitOnReturn, Visible)'
      'values'
      
        '  (:VidNo, :VidName, :PrintToPrice, :PriceWithNDS, :PrintToExped' +
        'ition, :SotrudNo, :LimitOnReturn, :Visible)')
    Left = 130
    Top = 422
  end
  object UpdateCompany: TMSUpdateSQL
    InsertSQL.Strings = (
      'insert into Company'
      '  (CompanyNo, NameCompany, PercentSalary)'
      'values'
      '  (:CompanyNo, :NameCompany, :PercentSalary)')
    DeleteSQL.Strings = (
      'delete from Company'
      'where'
      '  CompanyNo = :OLD_CompanyNo')
    ModifySQL.Strings = (
      'update Company'
      'set'
      '  CompanyNo = :CompanyNo,'
      '  NameCompany = :NameCompany,'
      '  PercentSalary = :PercentSalary'
      'where'
      '  CompanyNo = :OLD_CompanyNo')
    Left = 620
    Top = 364
  end
  object dsCompany: TDataSource
    DataSet = quCompany
    Left = 326
    Top = 16
  end
  object quSotrud: TMSQuery
    Connection = DB
    SQL.Strings = (
      'SELECT     Sotrud.SotrudNo'
      '         , Sotrud.SotrudName'
      '         , Sotrud.SotrudOtdel'
      '         , VidOtdel.OtdelName'
      '         , Sotrud.Visible'
      '         , Sotrud.SotrudLevelInPepsico'
      
        '         , (select LevelName from VidSotrudInPepsico where Level' +
        ' = Sotrud.SotrudLevelInPepsico) NameLevel'
      '         , Sotrud.ParentSotrudNo'
      
        '         , (select so.SotrudName from Sotrud so where SotrudNo =' +
        ' s.ParentSotrudNo) as ParentSotrudName'
      '         , isnull(Sotrud.Checket, 0) as V'
      'FROM         Sotrud INNER JOIN'
      
        '                      VidOtdel ON Sotrud.SotrudOtdel = VidOtdel.' +
        'OtdelNo inner join'
      #9' sotrud s on s.SotrudNo = Sotrud.SotrudNo'
      '&_where'
      'order by &_order')
    CachedUpdates = True
    UpdateObject = UpdateSotrud
    BeforePost = quSotrudBeforePost
    BeforeDelete = quSotrudBeforeDelete
    OnNewRecord = quSotrudNewRecord
    Left = 32
    Top = 248
    MacroData = <
      item
        Name = '_where'
      end
      item
        Name = '_order'
        Value = 'Sotrud.SotrudName'
      end>
    object quSotrudSotrudNo: TSmallintField
      FieldName = 'SotrudNo'
    end
    object quSotrudSotrudName: TStringField
      FieldName = 'SotrudName'
      Size = 30
    end
    object quSotrudSotrudOtdel: TSmallintField
      FieldName = 'SotrudOtdel'
    end
    object quSotrudOtdelName: TStringField
      FieldName = 'OtdelName'
      Size = 30
    end
    object quSotrudVisible: TBooleanField
      FieldName = 'Visible'
    end
    object quSotrudSotrudLevelInPepsico: TStringField
      FieldName = 'SotrudLevelInPepsico'
      FixedChar = True
      Size = 2
    end
    object quSotrudParentSotrudNo: TSmallintField
      FieldName = 'ParentSotrudNo'
    end
    object quSotrudParentSotrudName: TStringField
      DisplayLabel = #1053#1072#1095#1072#1083#1100#1085#1080#1082
      FieldName = 'ParentSotrudName'
      Size = 30
    end
    object quSotrudNameLevel: TStringField
      DisplayLabel = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      DisplayWidth = 30
      FieldName = 'NameLevel'
      ReadOnly = True
      FixedChar = True
      Size = 50
    end
    object quSotrudV: TBooleanField
      FieldName = 'V'
    end
  end
  object UpdateSotrud: TMSUpdateSQL
    InsertSQL.Strings = (
      'insert into Sotrud'
      
        '  (SotrudNo, SotrudName, SotrudOtdel, Visible, SotrudLevelInPeps' +
        'ico, ParentSotrudNo, Checket)'
      'values'
      
        '  (:SotrudNo, :SotrudName, :SotrudOtdel, :Visible, :SotrudLevelI' +
        'nPepsico, :ParentSotrudNo, :V)')
    DeleteSQL.Strings = (
      'delete from Sotrud'
      'where'
      '  SotrudNo = :OLD_SotrudNo')
    ModifySQL.Strings = (
      'update Sotrud'
      'set'
      '--  SotrudNo = :SotrudNo,'
      '  SotrudName = :SotrudName,'
      '  SotrudOtdel = :SotrudOtdel,'
      '  Visible = :Visible,'
      '  SotrudLevelInPepsico = :SotrudLevelInPepsico,'
      '  ParentSotrudNo = :ParentSotrudNo,'
      '  Checket = :V'
      'where'
      '  SotrudNo = :SotrudNo'
      ''
      '/*'
      'update Sotrud'
      'set'
      '--  SotrudNo = :SotrudNo,'
      '  SotrudName = :SotrudName,'
      '  SotrudOtdel = :SotrudOtdel,'
      '  Visible = :Visible,'
      '  SotrudLevelInPepsico = :SotrudLevelInPepsico,'
      '  ParentSotrudNo = :ParentSotrudNo'
      'where'
      '  SotrudNo = :OLD_SotrudNo'
      '*/')
    Left = 424
    Top = 364
  end
  object spGetSummaNaklP: TMSStoredProc
    StoredProcName = 'dbo.GetSummaNaklP'
    Connection = DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL dbo.GetSummaNaklP (:NaklNo)}')
    Options.EnableBCD = True
    Left = 326
    Top = 306
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'NaklNo'
        ParamType = ptInput
        Value = nil
      end>
    object spGetSummaNaklPSumma: TFloatField
      FieldName = 'Summa'
    end
    object spGetSummaNaklPSummaDolg: TFloatField
      FieldName = 'SummaDolg'
    end
  end
  object spGetSummaNaklR: TMSStoredProc
    StoredProcName = 'GetSummaNaklR;1'
    Connection = DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL GetSummaNaklR;1(:NaklNo)}')
    Options.EnableBCD = True
    Left = 424
    Top = 306
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'NaklNo'
        ParamType = ptInput
        Value = nil
      end>
    object spGetSummaNaklRSumma: TFloatField
      FieldName = 'Summa'
    end
    object spGetSummaNaklRSummaDolg: TFloatField
      FieldName = 'SummaDolg'
    end
  end
  object quTipNakl: TMSQuery
    Connection = DB
    SQL.Strings = (
      'select TipNo,TipName'
      'from TipNakl')
    Left = 228
    Top = 248
    object quTipNaklTipNo: TSmallintField
      FieldName = 'TipNo'
      Origin = 'TipNakl.TipNo'
    end
    object quTipNaklTipName: TStringField
      FieldName = 'TipName'
      Origin = 'TipNakl.TipName'
      Size = 10
    end
  end
  object spGetNomNaklR: TMSStoredProc
    StoredProcName = 'dbo.GetNomNaklR'
    Connection = DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL dbo.GetNomNaklR (:Buh)}')
    Left = 130
    Top = 364
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = nil
      end
      item
        DataType = ftSmallint
        Name = 'Buh'
        ParamType = ptInput
        Value = nil
      end>
    object spGetNomNaklRNom: TIntegerField
      FieldName = 'Nom'
    end
  end
  object spGetNomNaklP: TMSStoredProc
    StoredProcName = 'dbo.GetNomNaklP'
    Connection = DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL dbo.GetNomNaklP }')
    Left = 228
    Top = 364
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = nil
      end>
    object spGetNomNaklPNom: TIntegerField
      FieldName = 'Nom'
    end
  end
  object quRegions: TMSQuery
    Connection = DB
    SQL.Strings = (
      'select RegionNo,RegionName, Visible'
      'from Regions'
      '&_where'
      'order by &_order')
    CachedUpdates = True
    UpdateObject = UpdateRegions
    BeforePost = quRegionsBeforePost
    BeforeDelete = quRegionsBeforeDelete
    Left = 130
    Top = 248
    MacroData = <
      item
        Name = '_where'
      end
      item
        Name = '_order'
        Value = 'RegionName'
      end>
    object quRegionsRegionNo: TSmallintField
      FieldName = 'RegionNo'
      Origin = 'Regions.RegionNo'
    end
    object quRegionsRegionName: TStringField
      FieldName = 'RegionName'
      Origin = 'Regions.RegionName'
      Size = 50
    end
    object quRegionsVisible: TBooleanField
      FieldName = 'Visible'
      Origin = 'BASE.Regions.Visible'
    end
  end
  object dsRegions: TDataSource
    DataSet = quRegions
    Left = 424
    Top = 16
  end
  object UpdateRegions: TMSUpdateSQL
    InsertSQL.Strings = (
      'insert into Regions'
      '  (RegionNo, RegionName, Visible)'
      'values'
      '  (:RegionNo, :RegionName, :Visible)')
    DeleteSQL.Strings = (
      'delete from Regions'
      'where'
      '  RegionNo = :OLD_RegionNo')
    ModifySQL.Strings = (
      'update Regions'
      'set'
      '  RegionNo = :RegionNo,'
      '  RegionName = :RegionName,'
      '  Visible = :Visible'
      'where'
      '  RegionNo = :OLD_RegionNo')
    Left = 522
    Top = 364
  end
  object quMenu: TMSQuery
    Connection = DB
    SQL.Strings = (
      'select UserNo,ItemName,Enabled'
      'from Menu'
      'where UserNo=:UserNo'
      'and enabled = 1')
    Left = 32
    Top = 306
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'UserNo'
        Value = nil
      end>
    object quMenuUserNo: TSmallintField
      FieldName = 'UserNo'
      Origin = 'Menu.UserNo'
    end
    object quMenuItemName: TStringField
      FieldName = 'ItemName'
      Origin = 'Menu.ItemName'
    end
    object quMenuEnabled: TBooleanField
      FieldName = 'Enabled'
      Origin = 'Menu.Enabled'
    end
  end
  object quVidRashod: TMSQuery
    Connection = DB
    SQL.Strings = (
      
        'select VidRashodNo, VidRashodName, Visible,Group_id,IsExtInBDDS,' +
        'IsVisebleInDolg,IsOperationalBDDS'
      'from VidRashod'
      'where VidRashodDel<>1 &_where'
      'order by &_order')
    CachedUpdates = True
    UpdateObject = UpdateVidRashod
    BeforePost = quVidRashodBeforePost
    BeforeDelete = quVidRashodBeforeDelete
    Left = 620
    Top = 248
    MacroData = <
      item
        Name = '_where'
      end
      item
        Name = '_order'
        Value = 'VidRashodName'
      end>
    object quVidRashodVidRashodNo: TSmallintField
      FieldName = 'VidRashodNo'
      Origin = 'BASE.VidRashod.VidRashodNo'
    end
    object quVidRashodVidRashodName: TStringField
      FieldName = 'VidRashodName'
      Origin = 'BASE.VidRashod.VidRashodName'
      FixedChar = True
      Size = 50
    end
    object quVidRashodVisible: TBooleanField
      FieldName = 'Visible'
      Origin = 'BASE.VidRashod.Visible'
    end
    object quVidRashodGroup_id: TSmallintField
      FieldName = 'Group_id'
    end
    object quVidRashodGroupName2: TStringField
      FieldKind = fkLookup
      FieldName = 'GroupName'
      LookupDataSet = quVidRashodGroup
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'Group_id'
      Size = 32
      Lookup = True
    end
    object quVidRashodIsExtInBDDS: TBooleanField
      FieldName = 'IsExtInBDDS'
    end
    object quVidRashodIsVisebleInDolg: TBooleanField
      FieldName = 'IsVisebleInDolg'
    end
    object quVidRashodIsOperationalBDDS: TBooleanField
      FieldName = 'IsOperationalBDDS'
    end
  end
  object dsVidRashod: TDataSource
    DataSet = quVidRashod
    Left = 228
    Top = 16
  end
  object UpdateVidRashod: TMSUpdateSQL
    InsertSQL.Strings = (
      'insert into VidRashod'
      
        '  (VidRashodNo, VidRashodName, Visible,Group_id,IsExtInBDDS,IsVi' +
        'sebleInDolg,IsOperationalBDDS)'
      'values'
      
        '  (:VidRashodNo, :VidRashodName, :Visible,:Group_id,:IsExtInBDDS' +
        ',:IsVisebleInDolg,1)')
    DeleteSQL.Strings = (
      'update VidRashod'
      'set'
      '  VidRashodDel = 1'
      'where'
      '  VidRashodNo = :OLD_VidRashodNo')
    ModifySQL.Strings = (
      'update VidRashod'
      'set'
      '  VidRashodNo = :VidRashodNo,'
      '  VidRashodName = :VidRashodName,'
      '  Group_id = :Group_id,'
      '  Visible = :Visible,'
      '  IsExtInBDDS = :IsExtInBDDS,'
      '  IsVisebleInDolg = :IsVisebleInDolg,'
      '  IsOperationalBDDS = :IsOperationalBDDS'
      'where'
      '  VidRashodNo = :OLD_VidRashodNo')
    Left = 522
    Top = 422
  end
  object dsTipTovara: TDataSource
    DataSet = quTipTovara
    Left = 32
    Top = 16
  end
  object quTipTovara: TMSQuery
    SQLDelete.Strings = (
      'UPDATE TipTovara'
      'SET'
      '  Visible = 1'
      'WHERE'
      '  TipNo = :TipNo')
    Connection = DB
    SQL.Strings = (
      'select TipNo,TipName, Visible'
      'from TipTovara'
      '&_where'
      'order by &_order')
    CachedUpdates = True
    UpdateObject = UpdateTipTovara
    BeforePost = quTipTovaraBeforePost
    BeforeDelete = quTipTovaraBeforeDelete
    Left = 326
    Top = 132
    MacroData = <
      item
        Name = '_where'
      end
      item
        Name = '_order'
        Value = 'TipName'
      end>
    object quTipTovaraTipNo: TSmallintField
      FieldName = 'TipNo'
      Origin = 'TipTovara.TipNo'
    end
    object quTipTovaraTipName: TStringField
      FieldName = 'TipName'
      Origin = 'TipTovara.TipName'
      FixedChar = True
      Size = 30
    end
    object quTipTovaraVisible: TBooleanField
      FieldName = 'Visible'
      Origin = 'TipTovara.Visible'
    end
  end
  object UpdateTipTovara: TMSUpdateSQL
    InsertSQL.Strings = (
      'insert into TipTovara'
      '  (TipNo, TipName, Visible)'
      'values'
      '  (:TipNo, :TipName, :Visible)')
    DeleteSQL.Strings = (
      '/*'
      'delete from TipTovara'
      'where'
      '  TipNo = :OLD_TipNo'
      '*/'
      'update TipTovara'
      'set'
      '  Visible = 1'
      'where'
      '  TipNo = :OLD_TipNo')
    ModifySQL.Strings = (
      'update TipTovara'
      'set'
      '  TipNo = :TipNo,'
      '  TipName = :TipName,'
      '  Visible = :Visible'
      'where'
      '  TipNo = :OLD_TipNo')
    Left = 620
    Top = 422
  end
  object dsCars: TDataSource
    DataSet = quCars
    Left = 130
    Top = 16
  end
  object UpdateCars: TMSUpdateSQL
    InsertSQL.Strings = (
      'insert into Cars'
      
        '  (CarsNo, CarsName, CarsDelete, CarsDriver, CarsType, CarsNomer' +
        ', CarsOKPO, CarsFirma, Visible, is_Refrigerator, IdCarCompany, C' +
        'arDriversID, is_our, MOLPostNo, is_TTN)'
      'values'
      
        '  (:CarsNo, :CarsName, 0, :CarsDriver, :CarsType, :CarsNomer, :C' +
        'arsOKPO, :CarsFirma, :Visible, :is_Refrigerator, :IdCarCompany, ' +
        ':CarDriversID, :is_our, :MOLPostNo, :is_TTN)'
      ''
      'insert into L_CarsProperty'
      '   (CarsNo, Capacity, Volume, Our_Car)'
      'values'
      '   (:CarsNo, :Capacity, convert(decimal(4,2),:Volume), :Our_Car)')
    DeleteSQL.Strings = (
      'update Cars'
      'set'
      '  CarsNo = :CarsNo,'
      '  CarsName = :CarsName,'
      '  CarsDelete = 1,'
      '  CarsDriver = :CarsDriver,'
      '  CarsType = :CarsType,'
      '  CarsNomer = :CarsNomer,'
      '  CarsOKPO = :CarsOKPO,'
      '  CarsFirma = :CarsFirma,'
      '  Visible = :Visible'
      'where'
      '  CarsNo = :OLD_CarsNo')
    ModifySQL.Strings = (
      'declare'
      '  @cnt int'
      ''
      
        'select @cnt = isnull(count(*),0) from L_CarsProperty where CarsN' +
        'o = :CarsNo'
      ''
      'update Cars'
      'set'
      '  CarsNo = :CarsNo,'
      '  CarsName = :CarsName,'
      '  CarsDelete = :CarsDelete,'
      '  CarsDriver = :CarsDriver,'
      '  CarsType = :CarsType,'
      '  CarsNomer = :CarsNomer,'
      '  CarsOKPO = :CarsOKPO,'
      '  CarsFirma = :CarsFirma,'
      '  Visible = :Visible,'
      '  MolPostNo = :MolPostNo,'
      '  Is_our = :is_our,'
      '  is_Refrigerator = :is_Refrigerator,'
      '  IdCarCompany = :IdCarCompany,'
      '  CarDriversID = :CarDriversID,'
      '  is_TTN = :is_TTN'
      'where'
      '  CarsNo = :CarsNo'
      ''
      'if @cnt = 0'
      ' insert into L_CarsProperty'
      '   (CarsNo, Capacity, Volume, Our_car)'
      ' values'
      '   (:CarsNo, :Capacity, :Volume, :Our_Car)'
      'else'
      'update L_CarsProperty'
      ' set Capacity = :Capacity'
      '    ,Volume = :Volume'
      '    ,Our_Car = :Our_Car'
      'where CarsNo = :OLD_CarsNo')
    Left = 424
    Top = 422
  end
  object quCars: TMSQuery
    Connection = DB
    SQL.Strings = (
      'SELECT  c.CarsNo'
      '       ,c.CarsName'
      '       ,c.CarsDelete'
      '       ,c.CarDriversID'
      '       --,c.CarsDriver'
      
        '       ,(SELECT cd.Name from CarDrivers cd where cd.ID=c.CarDriv' +
        'ersID) as CarsDriver'
      '       ,c.CarsType'
      '       ,c.CarsNomer'
      '       ,c.CarsOKPO'
      '       ,c.CarsFirma'
      '       ,c.Visible'
      '       ,c.MOLPostNo'
      
        '       ,(select Name from Post where PostNo=c.MOLPostNo) as MolN' +
        'ame'
      '       ,c.is_our'
      '       ,lcp.Capacity'
      '       ,lcp.Volume'
      '       ,isnull(lcp.Our_Car,0) as Our_Car'
      '       ,isnull(is_Refrigerator,0) as is_Refrigerator'
      '       ,IdCarCompany'
      
        '       ,case when IdCarCompany in (1,3) then cast(1 as bit) else' +
        ' cast(isnull(is_TTN,0) as bit) end as is_TTN'
      'FROM Cars c left join'
      '     L_CarsProperty lcp on lcp.CarsNo = c.CarsNo'
      'WHERE (c.CarsName is not null or c.CarsName <> '#39' '#39') &_where'
      'order by &_order'
      ''
      ''
      '--select * from Cars')
    CachedUpdates = True
    UpdateObject = UpdateCars
    AfterOpen = quCarsAfterOpen
    BeforeClose = quCarsBeforeClose
    BeforePost = quCarsBeforePost
    BeforeDelete = quCarsBeforeDelete
    Left = 424
    Top = 132
    MacroData = <
      item
        Name = '_where'
      end
      item
        Name = '_order'
        Value = 'CarsName'
      end>
    object quCarsCarsNo: TSmallintField
      FieldName = 'CarsNo'
    end
    object quCarsCarsName: TStringField
      FieldName = 'CarsName'
      Size = 64
    end
    object quCarsCarsDelete: TBooleanField
      FieldName = 'CarsDelete'
    end
    object quCarsCarsDriver: TStringField
      FieldName = 'CarsDriver'
      Size = 64
    end
    object quCarsCarsType: TStringField
      FieldName = 'CarsType'
    end
    object quCarsCarsNomer: TStringField
      FieldName = 'CarsNomer'
      Size = 10
    end
    object quCarsCarsOKPO: TStringField
      FieldName = 'CarsOKPO'
      Size = 10
    end
    object quCarsCarsFirma: TStringField
      FieldName = 'CarsFirma'
      Size = 30
    end
    object quCarsVisible: TBooleanField
      FieldName = 'Visible'
    end
    object quCarsMOLPostNo: TSmallintField
      FieldName = 'MOLPostNo'
    end
    object quCarsMolName: TStringField
      FieldName = 'MolName'
      Size = 30
    end
    object quCarsis_our: TBooleanField
      FieldName = 'is_our'
    end
    object quCarsCapacity: TIntegerField
      FieldName = 'Capacity'
    end
    object quCarsVolume: TFloatField
      FieldName = 'Volume'
    end
    object quCarsOur_Car: TBooleanField
      FieldName = 'Our_Car'
    end
    object quCarsis_Refrigerator: TBooleanField
      DisplayLabel = #1056#1077#1092'.'
      FieldName = 'is_Refrigerator'
    end
    object quCarsIdCarCompany: TIntegerField
      FieldName = 'IdCarCompany'
    end
    object quCarsCarDriversID: TSmallintField
      FieldName = 'CarDriversID'
    end
    object quCarsis_TTN: TBooleanField
      Alignment = taCenter
      DisplayLabel = #1058#1058#1053
      DisplayWidth = 3
      FieldName = 'is_TTN'
    end
  end
  object dsShipping_Agent: TDataSource
    DataSet = quShipping_Agent
    Left = 130
    Top = 74
  end
  object UpdateShipping_Agent: TMSUpdateSQL
    InsertSQL.Strings = (
      'insert into Shipping_Agent'
      
        '  (Shipping_AgentNo, Shipping_AgentName, Shipping_AgentDelete, V' +
        'isible)'
      'values'
      '  (:Shipping_AgentNo, :Shipping_AgentName, 0, :Visible)')
    DeleteSQL.Strings = (
      'update Shipping_Agent'
      'set'
      '  Shipping_AgentNo = :Shipping_AgentNo,'
      '  Shipping_AgentName = :Shipping_AgentName,'
      '  Shipping_AgentDelete = 1,'
      '  Visible = :Visible'
      'where'
      '  Shipping_AgentNo = :OLD_Shipping_AgentNo')
    ModifySQL.Strings = (
      'update Shipping_Agent'
      'set'
      '  Shipping_AgentNo = :Shipping_AgentNo,'
      '  Shipping_AgentName = :Shipping_AgentName,'
      '  Shipping_AgentDelete = :Shipping_AgentDelete,'
      '  Visible = :Visible,'
      '   is_our= :is_our'
      'where'
      '  Shipping_AgentNo = :OLD_Shipping_AgentNo')
    Left = 228
    Top = 422
  end
  object quShipping_Agent: TMSQuery
    Connection = DB
    SQL.Strings = (
      'SELECT     *'
      'FROM         Shipping_Agent'
      'WHERE Shipping_AgentDelete=0 &_where'
      'order by &_order')
    CachedUpdates = True
    UpdateObject = UpdateShipping_Agent
    AfterOpen = quShipping_AgentAfterOpen
    BeforeClose = quShipping_AgentBeforeClose
    BeforePost = quShipping_AgentBeforePost
    BeforeDelete = quShipping_AgentBeforeDelete
    Left = 326
    Top = 190
    MacroData = <
      item
        Name = '_where'
        Value = 'and Visible=0'
      end
      item
        Name = '_order'
        Value = 'Shipping_AgentName'
      end>
    object quShipping_AgentShipping_AgentNo: TSmallintField
      FieldName = 'Shipping_AgentNo'
      Origin = 'BASE.Shipping_Agent.Shipping_AgentNo'
    end
    object quShipping_AgentShipping_AgentName: TStringField
      FieldName = 'Shipping_AgentName'
      Origin = 'BASE.Shipping_Agent.Shipping_AgentName'
      FixedChar = True
      Size = 30
    end
    object quShipping_AgentShipping_AgentDelete: TBooleanField
      FieldName = 'Shipping_AgentDelete'
      Origin = 'BASE.Shipping_Agent.Shipping_AgentDelete'
    end
    object quShipping_AgentVisible: TBooleanField
      FieldName = 'Visible'
      Origin = 'BASE.Shipping_Agent.Visible'
    end
    object quShipping_Agentis_our: TBooleanField
      FieldName = 'is_our'
      Origin = 'BASE.Shipping_Agent.is_our'
    end
  end
  object ADOConnection1C: TMSConnection
    Database = 'MLK_TRADE_SQL_2011'
    Options.KeepDesignConnected = False
    Username = 'sa'
    Server = '1C7SERVER\SRV_TERM'
    LoginPrompt = False
    Left = 130
    Top = 132
  end
  object quOtdel: TMSQuery
    Connection = DB
    SQL.Strings = (
      'SELECT     *'
      'FROM         [dbo].[VidOtdel]')
    CachedUpdates = True
    Left = 424
    Top = 190
    object quOtdelOtdelNo: TSmallintField
      FieldName = 'OtdelNo'
      Origin = 'dbo.VidOtdel.OtdelNo'
    end
    object quOtdelOtdelName: TStringField
      FieldName = 'OtdelName'
      Origin = 'dbo.VidOtdel.OtdelName'
      FixedChar = True
      Size = 30
    end
  end
  object dsOtdel: TDataSource
    DataSet = quOtdel
    Left = 228
    Top = 74
  end
  object quTara: TMSQuery
    Connection = DB
    SQL.Strings = (
      'SELECT     TovarNo, NameTovar'
      'FROM         Tovar'
      'WHERE     (OtdelNo = 3)'
      'ORDER BY NameTovar')
    CachedUpdates = True
    Left = 522
    Top = 190
    object quTaraTovarNo: TLargeintField
      FieldName = 'TovarNo'
    end
    object quTaraNameTovar: TStringField
      FieldName = 'NameTovar'
      Origin = 'Tovar.NameTovar'
      FixedChar = True
      Size = 128
    end
  end
  object dsTara: TDataSource
    DataSet = quTara
    Left = 32
    Top = 74
  end
  object dsSetup: TDataSource
    DataSet = quSetup
    Left = 522
    Top = 16
  end
  object quSetup: TMSQuery
    Connection = DB
    SQL.Strings = (
      'SELECT     *'
      'FROM         Setup')
    CachedUpdates = True
    UpdateObject = UpdateSetup
    BeforePost = quSetupBeforePost
    Left = 130
    Top = 190
    object quSetupDateBlock: TDateTimeField
      FieldName = 'DateBlock'
      Origin = 'Setup.DateBlock'
    end
  end
  object UpdateSetup: TMSUpdateSQL
    InsertSQL.Strings = (
      'insert into Setup'
      '  (DateBlock)'
      'values'
      '  (:DateBlock)')
    DeleteSQL.Strings = (
      'delete from Setup'
      'where'
      '  DateBlock = :OLD_DateBlock')
    ModifySQL.Strings = (
      'update Setup'
      'set'
      '  DateBlock = :DateBlock'
      'where'
      '  DateBlock = :OLD_DateBlock')
    Left = 326
    Top = 426
  end
  object spSetUserLoginParam: TMSStoredProc
    StoredProcName = 'pr_SetUserLoginParam;1'
    Connection = DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL pr_SetUserLoginParam;1(:UserNo, :pwd, :Con' +
        'nect_type, :SPID)}')
    Left = 326
    Top = 364
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'UserNo'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'pwd'
        ParamType = ptInput
        Size = 100
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'Connect_type'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'SPID'
        ParamType = ptInput
        Value = nil
      end>
  end
  object ImageListToolBar: TImageList
    Left = 620
    Top = 498
    Bitmap = {
      494C01013A003B00100010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000F0000000010020000000000000F0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BFDBE80040B5D20042B7D60042B7
      D60042B7D60042B7D60042B7D60042B7D60042B7D60042B7D60042B7D60042B7
      D60042B7D60041ADD00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A3CBDE0033CAEC0039D5F60039D5
      F60039D5F60039D5F60039D5F60039D5F60039D5F60039D5F60039D5F60039D5
      F60039D5F60036CFF100CDE2EC000000000000000000BFB4AD00AA8F7A00A489
      7400A4897400A4897400A4897400A4897400A4897400A4897400A4897400A489
      7400B39A8200C9BEB80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5D5E40033C0E2003DDAF7003DDA
      F7003DDAF7003DDAF7003DDAF7003DDAF7003DDAF7003DDAF7003DDAF7003DDA
      F7003DDAF7003DDBF70098CBDF000000000000000000968E8600AB7C5400CB95
      6100CB956100CB956100CB956100CB946100CB946000CB946000CB946000CB94
      6000CB946000B6865D00DDDBDB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5D5E40025B6DA0033E1FB0033E1
      FB0033E1FB0033E1FB0033E1FB0033E1FB0033E1FB0033E1FB0033E1FB0033E1
      FB0033E1FB0033E1FB0064BFD80000000000000000009D9D9D008F755F00CE9C
      6F00CE9B6C00CE9B6C00CE9B6C00CD9B6C00CD9B6B00CD9B6B00CD9A6B00CD9A
      6B00CD9A6A00C5976300E1CDBC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B3D4E40022B8DC003FE2FA003FE2
      FA003FE2FA003FE2FA003FE2FA003FE2FA003FE2FA003FE2FA003FE2FA003FE2
      FA003FE2FA003FE2FA0045BADA000000000000000000999999007F797400C598
      7100D2A57A00D1A27700D0A17500D0A07400CFA07300CF9F7300CF9F7200CF9F
      7200CF9F7200D0A27600D2B09500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B2D4E3001AC0E4004AE1F8004BE3
      F9004BE3F9004BE3F9004BE3F9004BE3F9004BE3F9004BE3F9004BE3F9004BE3
      F9004BE3F9004BE3F9003ABFDD0000000000000000009797970083838300BA91
      7000D4A87F00D3A87F00D3A77E00D3A77E00D3A77D00D3A67D00D2A57B00D1A2
      7700CF9F7300CF9F7200C9A48300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B2D4E30018D1F2004CD2EA0056E4
      F70056E4F70056E4F70056E4F70056E4F70056E4F70056E4F70056E4F70056E4
      F70056E4F70056E4F7004DD4EC00D5E7EF00000000009B9B9B008C8C8C00B593
      7700D5AB8400D4AA8100D4A98100D4A98000D4A88000D4A87F00D3A87F00D3A7
      7E00D2A67C00D0A17400CA9F7900F0E7E0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B0D3E30017DEFD0048C2DD0062E5
      F60062E5F60062E5F60062E5F60062E5F60062E5F60062E5F60062E5F60062E5
      F60062E5F60062E5F60061E4F500A8D0E100E0E0E0009E9E9E0094949400AF91
      7700D7B08B00D5AB8400D5AB8400D5AB8300D5AA8300D4AA8200D4AA8100D4A9
      8000D4A88000D3A87F00D7AE8800D9BEA9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B0D3E3001EE0FD004BB9D9007FD6
      E8007FD6E8007FD6E8007FD6E8007FD6E8007FD6E8007FD6E8007FD6E8007FD6
      E8007FD6E8007FD6E8007FD6E80087C3D900CCCCCC00AFAFAF009E9E9E00A88C
      7600CCA88800C9A38100C9A38100C9A38100C9A38100C9A28100C9A28100C49E
      7B00CAA58300CCA88700D0AC8C00CDA98B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AFD3E2004FE3F8004EE2F7004EE1
      F7004EE1F7004EE1F7004EE1F7004EE1F7004EE1F70049D9E6003AC3B1003AC3
      B1003AC3B1002EA99C00CDE5D10000000000BDBDBD00BABABA00A6A6A600A5A4
      A400A3A2A100A3A2A100A1A09F00A1A09F00A09F9E009F9E9D009E9D9C009492
      9200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C9E1EB006FD7E9007FE7F3007FE7
      F3007FE7F3007DE5F2005EBAD4006DBCD6006DBCD60065B7C40032A84A005AD2
      6A0067D7750073DD800068BE710000000000BCBCBC00B8B8B800A8A8A800A7A7
      A700A7A7A700A7A7A700A6A6A600A6A6A600A6A6A600A6A6A600A6A6A6009D9D
      9D00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000087C3DA0097D9E80097D9
      E80097D9E80056A99800C2E0CA00000000000000000000000000D4E8D8003EB9
      4F005DD46D0069D9780067BD700000000000BDBDBD00B2B2B200A8A8A800A8A8
      A800A8A8A800A7A7A7009F9F9F00B0B0B000B3B3B300B3B3B300B3B3B300BCBC
      BC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002EA03D0073BE7D00B3D7B6008AC6910033AB400047CA
      590053CF64005FD46E0062BB6E0000000000BBBBBB00BDBDBD00BABABA00BABA
      BA00BABABA00BABABA00B6B6B600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DAEBDC0034A8430026B63A0029BD3E0030C0450037BE
      4A0043AD510042B052005FBA690000000000D9D9D900BABABA00BABABA00BABA
      BA00BABABA00BABABA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C2DFC60086C68E0086C68C00C5E1
      C8000000000000000000A3D2AA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000009900000F9D0F00CEEACE00000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00A48E5900AC80
      1400AC801400AC801400AE811300AE811300AE811300AE811300AE811300AE81
      1300AE811300A28D5900FBFBFB00FCFCFC00FFFFFF00FFFFFF00FEFEFE00FCFC
      FC00FBFBFB00FCFCFC00B7E0B700FFFFFF00FFFFFF00A5A5E100FFFFFF00FFFF
      FF00FEFEFE00FCFCFC00FBFBFB00FCFCFC00FFFFFF00F7F7F700626262000808
      080023242400B8B8B800FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FCFCFC00FBFBFB00FCFCFC000000000000000000000000000000
      00000000000000000000000000000099000072C16F000F9D0F00CEEACE000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00A48E5500B484
      0C00B1820E00B0810E00B1820E00B4840C00B5840C00B5840C00B5840C00B584
      0C00B5840C00A48E5500F8F8F800FBFBFB00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00F8F8F8009BD29D005CBB6300FEFEFE00FFFFFF003A3ABC009292DB00FFFF
      FF00FFFFFF00FEFEFE00F8F8F800FBFBFB00F7F7F7004A4A4A00010101006464
      64002D2D2D0009090900AFAFAF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00F8F8F800FBFBFB000000000000000000000000000000
      000000000000000000000000000000990000ADD7A70071C16D000F9D0F00CEEA
      CE0000000000000000000000000000000000FFFFFF00FFFFFF00A6946300B886
      0D00B7860D00B2831000AA811C00A2874700A78A4800A88A4700A88A4700A88A
      4700A88A4700AB9F7F00FEFEFE00FCFCFC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009FD79F0048B04E005BB76500F5F5F500FDFDFD003D3DC5002626B8009292
      DB00FFFFFF00FFFFFF00FEFEFE00FCFCFC0061616100010101009D9D9D00FFFF
      FF00ECECEC00343434000A0A0A00ADADAD00FDFDFD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FCFCFC000000000000000000000000000000
      0000000000000000000000000000009900008DCA84009BD093006FC16C000F9D
      0F00CEEACE00000000000000000000000000FFFFFF00FFFFFF00F1F0F000AA8C
      4300BB880D00BA880D00B5841000ADA38E00F5F5F500FDFDFD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFFFF009FD8
      9F0048B64F0047B655005AB86A00F3F4F400F5F5F5004444C9002B2BBF002626
      B8009292DB00FFFFFF00FFFFFF00FEFEFE000606060067676700FFFFFF00FFFF
      FF00FFFFFF00ECECEC00343434000A0A0A00E1E1E100FDFDFD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00007F00000083000000870000008B
      0000008F000000930000009700000099000077C06C005CB34F0099CF92006FC1
      6B000F9D0F00CEEACE000000000000000000FFFFFF00FFFFFF00FFFFFF00F3F3
      F300AB8E4800BE8B0D00BD8B0D00B7871000A99E8200F4F4F400FDFDFD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009FD79F0048B6
      4F0047B7550046B95B0059C17300F5F5F500F3F4F4004A4BCA003232C6002B2B
      BF002626B8009292DB00FFFFFF00FFFFFF001E1E1E0031313100F1F1F100FFFF
      FF00FFFFFF00FFFFFF00ECECEC0095959500F1F2F200F5F5F500FDFDFD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00007B000098D3930098D3920097D2
      910096D18F0095D08D0093CF8B0091CD890085C77C0054B046005AB34D0099CF
      91006FC16B000F9D0F00CEEACE0000000000FFFFFF00FEFEFE00FFFFFF00FFFF
      FF00F6F6F600AA914E00C18D0E00C08D0E00BA891100A6977300F4F4F400FDFD
      FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009FD79F0048B64F0047B7
      550046B95B0046BA610059C37700FDFDFD00F5F5F5004F4FD200393AC8003232
      C6002B2BBF002626B8009292DB00FFFFFF00B2B2B2000404040038383800F1F1
      F100FFFFFF00FFFFFF00FFFFFF00ABABAB003E3F3F0045454500B9B9B900FDFD
      FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF000077000072C56B0033AB280030A9
      25002DA722002AA41D0026A11800229E13001E9A0E0049AD3C0053B045005AB3
      4D009ACF920070C06C000F9D0F00CEEACE00FFFFFF00FCFCFC00FEFEFE00FFFF
      FF00FFFFFF00F8F8F800AC935500C4900E00C38F0E00BD8C1100A5946700F2F2
      F200FDFDFD00FFFFFF00FFFFFF00FFFFFF00AEDDAE0059BB5F0058BB630057BD
      6A0057BE6E0056C0750068C98700FFFFFF00FDFDFD006868DD005151D2004B4C
      CC004545CA003F3FC3003A3ABE00A5A5E100FFFFFF00ABABAB00040404003838
      3800F1F1F100FFFFFF00A2A2A200000000002C2C2C00212121000A0A0A00ADAD
      AD00FDFDFD00FFFFFF00FFFFFF00FFFFFF000072000077CA72003BB2320038AF
      2F0034AC2A0030A925002CA5200027A21A00239E14003EA931004FAF420054B0
      47005CB350009CCF940071C06D000F9D0F00FFFFFF00FBFBFB00F8F8F800FDFD
      FD00FFFFFF00FFFFFF00FAFAFA00AD965B00C7920E00C6910E00C08E1100A796
      6D00F5F5F500FDFDFD00FFFFFF00FFFFFF00FFFFFF00FBFBFB00F8F8F800FDFD
      FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00F5F5F500F3F4
      F400F5F5F500FDFDFD00FFFFFF00FFFFFF00FFFFFF00FBFBFB00A9A9A9000404
      040038383800F1F1F1008B8B8B0059595900F8F8F800ECECEC00343434000A0A
      0A00ADADAD00FDFDFD00FFFFFF00FFFFFF00006E00007DCF7A0043B83D0040B6
      39003CB2330037AF2D0032AA27002DA6210027A21A0037A72A004EAF400052B0
      450058B24B007EC374008CCA87000F9D0F00FFFFFF00FCFCFC00F7F7F700F5F5
      F500FDFDFD00FFFFFF00FFFFFF00C0BBAC00C9950F00C9950F00C8940F00A98F
      4B00F3F4F400F5F5F500FEFEFE00FFFFFF00FFFFFF00FCFCFC00F7F7F700F5F5
      F500FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00F5F5
      F500F3F4F400F5F5F500FEFEFE00FFFFFF00FFFFFF00FCFCFC00F7F7F700A7A7
      A7000404040038383800F1F1F100F8F8F8005B5B5B0093939300ECECEC003434
      34000A0A0A00ADADAD00FEFEFE00FFFFFF00006A000084D482004CBF480048BC
      430043B83D003EB4360038AF2F0032AA27002CA6200037A82A004DB0410052B1
      450077C06C0070C0680018A01700CEEACE00FFFFFF00FEFEFE00F8F8F800F3F4
      F400F5F5F500FDFDFD00B8AF9700CA951000CC970F00CC970F00BA923000DFDE
      DB00F5F5F500F3F4F400F8F8F800FEFEFE009AD8FB002EB6F9002EBAF3002FBF
      EE002DC9F0002AD8F80045E4FB00FFFFFF00FFFFFF00DEB03E00D6A52800CF9E
      2800C2992A00BE912A00BB902800DFCC9B00FFFFFF00FEFEFE00F8F8F800F3F4
      F400A7A7A70004040400252525002D2D2D0000000000A3A3A300FFFFFF00ECEC
      EC00343434000A0A0A00AFAFAF00FEFEFE00006600008ADA8A0088D8870085D5
      830081D27E007CCE780078CB730073C76D006FC3670033A827004FB2430073C1
      6A0068BC6000149F1300CEEACE0000000000FFFFFF00FFFFFF00FEFEFE00F5F5
      F500F2F3F300ACA07D00CE990F00CF9A0F00CF9A0F00B5964300ECECEB00FFFF
      FF00FDFDFD00F5F5F500F7F7F700FCFCFC00FFFFFF0086D1FB0019B1F8001AB4
      F1001ABBEF0019C5F10031D7F900FFFFFF00FFFFFF00D3A22500CB960F00C591
      0E00BE8C0E00B3841000D1B97F00FCFCFC00FFFFFF00FFFFFF00FEFEFE00F5F5
      F500F3F4F400B2B2B2003F3F3F0039393900AAAAAA00FFFFFF00FFFFFF00FFFF
      FF00ECECEC003434340009090900B8B8B8000063000000660000006A0000006E
      00000072000000770000007B0000007F000072C56B0037AB2B0073C26A0068BC
      6100149A1400CEE9CE000000000000000000FFFFFF00FFFFFF00FFFFFF00F9F9
      F900AB986600C9971300CA971300D19B1000B39A5A00F6F6F600FFFFFF00FFFF
      FF00FFFFFF00FDFDFD00F8F8F800FBFBFB00FFFFFF00FFFFFF0086D1FB0019B0
      F8001AB4F1001ABBEF0032C8F000FDFDFD00FFFFFF00CF9E2500C5910E00BF8C
      0E00B9870D00D7BE8100F8F8F800FBFBFB00FFFFFF00FFFFFF00FFFFFF00FDFD
      FD00F5F5F500F3F4F400F5F5F500FAFAFA00A0A0A000F1F1F100FFFFFF00FFFF
      FF00FFFFFF00ECECEC002D2D2D00232424000000000000000000000000000000
      0000000000000000000000000000007B000074C76E0066BF5E0069BD63001593
      1400CEE8CE00000000000000000000000000FFFFFF00FFFFFF00F4F4F400B599
      5300D49D1000CD991300CC991300AC9D7200FBFBFB00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FCFCFC00FFFFFF00FFFFFF00FFFFFF0086D1
      FB0019B0F8001AB4F10033C0EF00F5F5F500FDFDFD00C89B2400BF8C0E00B987
      0D00D8BF8200FFFFFF00FEFEFE00FCFCFC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFDFD00F5F5F500F3F4F400DDDDDD000404040038383800F1F1F100FFFF
      FF00FFFFFF00FFFFFF0066666600090909000000000000000000000000000000
      00000000000000000000000000000077000076C9700061BA5C00158D1500CEE6
      CE0000000000000000000000000000000000FFFFFF00FFFFFF00B3A17000D8A1
      1000D8A11000D7A11000CB9A1B00B3974F00B4985000B79B5000B79B5000B79B
      5000B79B5000CDC9C000FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0086D1FB0019B1F80032BDF400F7F7F700F8F8F800C4942400B9870D00D8BF
      8200FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00F8F8F800F7F7F700A9A9A9000404040038383800F1F1
      F100FFFFFF009D9D9D0001010100626262000000000000000000000000000000
      00000000000000000000000000000072000061BB5D0015861500CEE6CE000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00B59F6600DBA3
      1100DBA31100DBA31100DBA31100D8A11200D8A11200D8A11200DBA31100DBA3
      1100DBA31100C1BAA900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0086D1FB0032BAF900FCFCFC00FBFBFB00BB912400D8BF8200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FCFCFC00FBFBFB00ACACAC00040404003131
      3100696969000101010048484800F7F7F7000000000000000000000000000000
      0000000000000000000000000000006E00000F790F00CEE3CE00000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00B5A16A00D8A3
      1800D8A31800D8A31800D8A31800D8A31800D8A31800D8A31800D8A31800D8A3
      1800D8A31800C2BCAB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF009DDAFB00FFFFFF00FFFFFF00DEC99800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B4B4B4001E1E
      1E000606060060606000F7F7F700FFFFFF00FFFFFF00FFFFFF00FEFEFE00FCFC
      FC00DBDAD80098908A006C615A00564B3F00564C42006E635B009C948F00E1DF
      DC00FEFEFE00FCFCFC00FBFBFB00FCFCFC000000000000000000000000000000
      0000007F0000007B00000077000000720000006E0000006A0000006600000063
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CEEACE000F9D0F000F9D0F00CEEACE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CEEACE000F9D0F000099000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00F8F8F800978F
      89005F564C00A6A09B00D8D7D500EAE9E800EBEAE900DDDBD900A8A29D006153
      4C009A928D00F9F8F800F8F8F800FBFBFB000000000000000000000000000000
      00000083000098D3930072C56B0077CA72007DCF7A0084D482008ADA8A000066
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CEEACE000F9D0F0071C06D008CCA870018A01700CEEACE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CEEACE000F9D0F0072C16F000099000000000000000000000000
      000000000000000000000000000000000000FFFFFF00F8F8F8007B716B008C83
      7C00E4E2E100DCDAD900F3F4F400837B75008A817B00FFFFFF00E2E1DE00FCFC
      FC00887F78007F746E00F9F9F900FCFCFC000000000000000000000000000000
      00000087000098D3920033AB28003BB2320043B83D004CBF480088D88700006A
      0000000000000000000000000000000000000000000000000000000000000000
      0000CEEACE000F9D0F0070C06C009CCF94007EC3740070C06800149F1300CEE9
      CE00000000000000000000000000000000000000000000000000000000000000
      0000CEEACE000F9D0F0071C16D00ADD7A7000099000000000000000000000000
      000000000000000000000000000000000000FFFFFF00978F89008C847C00FEFE
      FD00F2F1F000E8E7E500F5F5F500DEDCDB00DFDFDD00FDFDFD00E8E7E500F4F3
      F300FDFDFD00897F79009A928C00FEFEFE000000000000000000000000000000
      0000008B000097D2910030A9250038AF2F0040B6390048BC430085D58300006E
      000000000000000000000000000000000000000000000000000000000000CEEA
      CE000F9D0F006FC16B009ACF92005CB3500058B24B0077C06C0068BC6000149A
      1400CEE8CE00000000000000000000000000000000000000000000000000CEEA
      CE000F9D0F006FC16C009BD093008DCA84000099000000000000000000000000
      000000000000000000000000000000000000DEDCDA0063564D00E5E3E300F4F3
      F300FFFFFF00FFFFFF00FDFDFD00F5F5F500F3F4F400F4F2F100D9AC7D00E8CE
      B400F4F3F300FCFBFB0061534C00E1DFDC000000000000000000000000000000
      0000008F000096D18F002DA7220034AC2A003CB2330043B83D0081D27E000072
      0000000000000000000000000000000000000000000000000000CEEACE000F9D
      0F006FC16B0099CF91005AB34D0054B0470052B0450052B1450073C16A0068BC
      610015931400CEE6CE0000000000000000000000000000000000CEEACE000F9D
      0F006FC16B0099CF92005CB34F0077C06C00009900000097000000930000008F
      0000008B00000087000000830000007F000098918B00ADA7A200E0DDDC00EAE7
      E700FFFFFF00FFFFFF00FFFFFF00FDFDFD00F4F3F300CE9F7000BB752C00E7CD
      B300E9E8E600E2E1DE00A8A29D009B948D000000000000000000000000000000
      00000093000095D08D002AA41D0030A9250037AF2D003EB436007CCE78000077
      00000000000000000000000000000000000000000000CEEACE000F9D0F006FC1
      6C0099CF92005AB34D0053B045004FAF42004EAF40004DB041004FB2430073C2
      6A0069BD6300158D1500CEE6CE000000000000000000CEEACE000F9D0F006FC1
      6B0099CF91005AB34D0054B0460085C77C0091CD890093CF8B0095D08D0096D1
      8F0097D2910098D3920098D39300007B000069605700DEDCDA00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFEFE00D9AC7D00BB752C00D9BA9A00F5F5
      F500FDFDFD00FFFFFF00DEDBD9006E635B000000000000000000000000000000
      00000097000093CF8B0026A118002CA5200032AA270038AF2F0078CB7300007B
      000000000000000000000000000000000000CEEACE000F9D0F0071C16D009BD0
      93005CB34F0054B0460049AD3C003EA9310037A72A0037A82A0033A8270037AB
      2B0066BF5E0061BA5C0015861500CEE3CE00CEEACE000F9D0F0070C06C009ACF
      92005AB34D0053B0450049AD3C001E9A0E00229E130026A118002AA41D002DA7
      220030A9250033AB280072C56B000077000054493F00E9E8E700887F7900EBEA
      E800FFFFFF00FFFFFF00FFFFFF00DAAF8200CB915100DEB99400F5F5F500F3F4
      F400E0DFDE008B827B00FCFBFB00564C42000099000000990000009900000099
      00000099000091CD8900229E130027A21A002DA6210032AA270073C76D00007F
      0000007B00000077000000720000006E00000F9D0F0072C16F00ADD7A7008DCA
      840077C06C0085C77C001E9A0E00239E140027A21A002CA620006FC3670072C5
      6B0074C76E0076C9700061BB5D000F790F000F9D0F0071C06D009CCF94005CB3
      500054B047004FAF42003EA93100239E140027A21A002CA5200030A9250034AC
      2A0038AF2F003BB2320077CA72000072000054493F00EAE9E800847C7500E1E0
      DF00FDFDFD00FFFFFF00FFFFFF00DBAE8100CF985D00FDFCFA00FDFDFD00F5F5
      F500DFDDDC00847C7500F9F9F900564C42000F9D0F0072C16F00ADD7A7008DCA
      840077C06C0085C77C001E9A0E00239E140027A21A002CA620006FC3670072C5
      6B0074C76E0076C9700061BB5D000F790F000099000000990000009900000099
      00000099000091CD8900229E130027A21A002DA6210032AA270073C76D00007F
      0000007B00000077000000720000006E00000F9D0F008CCA87007EC3740058B2
      4B0052B045004EAF400037A72A0027A21A002DA6210032AA270037AF2D003CB2
      330040B6390043B83D007DCF7A00006E00006A5E5700E1DFDC00F8F8F800F3F4
      F400F5F5F500FDFDFD00FFFFFF00FFFFFF00D39E6900E2C19E00FFFFFF00FDFD
      FD00F5F5F500F3F4F400D8D5D4006C615A00CEEACE000F9D0F0071C16D009BD0
      93005CB34F0054B0460049AD3C003EA9310037A72A0037A82A0033A8270037AB
      2B0066BF5E0061BA5C0015861500CEE3CE000000000000000000000000000000
      00000097000093CF8B0026A118002CA5200032AA270038AF2F0078CB7300007B
      000000000000000000000000000000000000CEEACE0018A0170070C0680077C0
      6C0052B145004DB0410037A82A002CA6200032AA270038AF2F003EB4360043B8
      3D0048BC43004CBF480084D48200006A0000968F8900ADA7A300E2E0DE00E2E2
      E000F3F4F400F5F5F500FDFDFD00FFFFFF00F5EBE000C6803B00F9F0E900FFFF
      FF00E9E7E600DCDAD900A59F9A0099908B0000000000CEEACE000F9D0F006FC1
      6C0099CF92005AB34D0053B045004FAF42004EAF40004DB041004FB2430073C2
      6A0069BD6300158D1500CEE6CE00000000000000000000000000000000000000
      00000093000095D08D002AA41D0030A9250037AF2D003EB436007CCE78000077
      00000000000000000000000000000000000000000000CEEACE00149F130068BC
      600073C16A004FB2430033A827006FC3670073C76D0078CB73007CCE780081D2
      7E0085D5830088D887008ADA8A0000660000DCD9D60063595000F6F6F400F1F1
      F000F5F5F500F3F4F400F5F5F500FDFDFD00FFFFFF00DFB79000D7A77700FFFF
      FF00F2F1F000E4E2E00060554C00DDDAD9000000000000000000CEEACE000F9D
      0F006FC16B0099CF91005AB34D0054B0470052B0450052B1450073C16A0068BC
      610015931400CEE6CE0000000000000000000000000000000000000000000000
      0000008F000096D18F002DA7220034AC2A003CB2330043B83D0081D27E000072
      0000000000000000000000000000000000000000000000000000CEE9CE00149A
      140068BC610073C26A0037AB2B0072C56B00007F0000007B0000007700000072
      0000006E0000006A00000066000000630000FFFFFF00928A85008E878000FEFE
      FD00F2F1F100E2E2E000F3F4F400E2E1E000EBE9E800FCF9F500C8874100F3E6
      D700FEFEFD008C837C00988F8A00FCFCFC00000000000000000000000000CEEA
      CE000F9D0F006FC16B009ACF92005CB3500058B24B0077C06C0068BC6000149A
      1400CEE8CE000000000000000000000000000000000000000000000000000000
      0000008B000097D2910030A9250038AF2F0040B6390048BC430085D58300006E
      000000000000000000000000000000000000000000000000000000000000CEE8
      CE001593140069BD630066BF5E0074C76E00007B000000000000000000000000
      000000000000000000000000000000000000FFFFFF00F7F7F700796F68009087
      8100F7F6F600E2E0DE00F8F8F800857C760089817A00FEFEFE00F7EDE300F4F0
      ED008C847C007B716B00F8F8F800FEFEFE000000000000000000000000000000
      0000CEEACE000F9D0F0070C06C009CCF94007EC3740070C06800149F1300CEE9
      CE00000000000000000000000000000000000000000000000000000000000000
      00000087000098D3920033AB28003BB2320043B83D004CBF480088D88700006A
      0000000000000000000000000000000000000000000000000000000000000000
      0000CEE6CE00158D150061BA5C0076C970000077000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00F7F7F700948C
      860064584F00AFA9A400E2DFDF00F2F1F000F2F2F100DDDBD900ACA5A1006356
      4D00968E8800F8F8F800FFFFFF00FFFFFF000000000000000000000000000000
      000000000000CEEACE000F9D0F0071C06D008CCA870018A01700CEEACE000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000083000098D3930072C56B0077CA72007DCF7A0084D482008ADA8A000066
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CEE6CE001586150061BB5D000072000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DDDBD900978F89006A5E570054493F0054493F0069605700988F8A00DEDB
      D900FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000CEEACE000F9D0F000F9D0F00CEEACE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F0000007B00000077000000720000006E0000006A0000006600000063
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CEE3CE000F790F00006E000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000036312E002A2A20002A2D200029282000646160000000
      00000000000000000000000000000000000000000000FEFEFE00F2F2F200F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000FCFCFC00000000000000000000000000C68C8400DEA58400DE9C
      7B00DE9C8400DE9C8400DE9C8400DE9C8400DE9C8400DE9C8400DE9C8400DE9C
      8400DE9C7B00DE9C8400BD847B00000000000000000000000000000000000000
      000000000000010100001E100600361D0A00361D0A001E100600010000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000313029000C410C00157B15001A8C1A00105F100012290E006461
      600000000000000000000000000000000000F9F9F90073749A005E64EC00656B
      F000666DF100666DF300656BF5006268F7005F64F8005D61F8005A5DF900585A
      F7005A5EF2004747A100E9E9E90000000000C68C8400CE948400EFB59400FFCE
      9400FFCE9400FFCE9400FFCE9400FFCE9400FFCE9400FFCE9400FFCE9400FFCE
      9400FFD69C00E7B58C00C68C8400BD847B000000000000000000000000000301
      01004D290F00A0562000B7632500B8642600B8642600B76325009F561F004D29
      0E00030101000000000000000000000000000000000000000000000000000000
      0000352A2A000D330A001C981C0054E6540068F2680033CB3300105F10001A16
      0E00646060000000000000000000000000009C9CB2000C0CC1000000C5000000
      CB000000D1000000D8000000DE000000E400070AE900151BEA00212AEC002B38
      EE003645EF003F51F100494BAB0000000000C68C8400E7B58C00C68C8400F7CE
      AD00F7D6AD00F7CEAD00F7CEAD00F7CEAD00F7CEAD00F7CEAD00F7CEAD00F7D6
      AD00EFC6A500C68C8400EFBD9C00C68C840000000000000000000C0602008A4B
      1C00BD682900CE7F4400E4AF8800EFC8AA00EFC8AA00E4AF8700CD7E4400BC67
      2800894A1B000C0602000000000000000000000000000000000000000000352A
      2A001B0C0C0012490F0036CF360095FD9500A5FFA50068F268001A8B1A001817
      0C001E0F0F006460600000000000000000003E3EB7000000BD000000C4000000
      CA000000D1005D5DE500F9F9FE00FFFFFF00FFFFFF009A9DF500212BEC002C39
      EE003746EF004052F1004554E700FEFEFE00BD848400F7D6B500DEA58C00CEA5
      9C00EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDE
      C600C6949400DEAD9400EFDEC600BD84840000000000030100008C4C1D00C46D
      2E00E5AF8600F9EFE500FAF2EA00EBD4C100EEDBCD00FBF4EE00F9EFE500E4AE
      8600C36C2D008B4B1C0003010000000000000000000000000000382E2E001B0C
      0C001B0C0C0010400D002ABC2A0080F8800096FD960054E65400157A15001816
      0C001B0C0C001E0F0F0000000000000000003131AC000000BC000000C3000000
      C900F9F9FD00FFFFFF00FFFFFF00CCCCF300F9F9FD00FFFFFF00FFFFFF00343F
      EE003644EF003F51F1003C4CE300FEFEFE00BD848400EFDECE00F7D6B500C68C
      7B00DEC6BD00EFE7D600EFDED600EFDED600EFDED600EFDED600EFE7DE00D6B5
      AD00CE948400F7E7CE00EFDECE00BD848400000000004F2A0F00C56F2E00E4AF
      8700FBF4ED00FBF4ED00FBF4ED00BC774300BD784500FCF6F000FBF4EC00FBF4
      EC00E4AF8600C46D2D004E2A0F000000000000000000000000003B3131002D20
      2000291D1D000D250A001074220027D95E003AEC760018AC3D000B4411001B13
      0E002D2020002D20200000000000000000003131A6000808BB000909C200DFDF
      F700FFFFFF005252D7000000DA000000E1000101E7001E22E200FFFFFF00FFFF
      FF003341EF003C4DF0003848DC00FEFEFE00BD8C8400EFE7DE00FFF7E700EFC6
      A500BD8C8400EFD6D600EFE7DE00EFDED600EFDED600EFE7D600E7CEC600C68C
      8400EFDEC600F7F7EF00EFE7DE00BD8C840001010000A95E2500D3834800FBF2
      EA00FCF5EF00FCF5EF00FCF5EF00E8CEB900ECD8C800FBF5EF00FBF5EF00FBF5
      EF00FAF1E900D2824700A75C2500010000000000000000000000000000000000
      0000615C5C0008272600006B620000CEB70001EDD200009D8E0001423F002522
      22000000000000000000000000000000000031319E002323BE002626C500FFFF
      FF00CECEEF003030D8003131DD001111E0000000E400090CE9005559E700FFFF
      FF006973F3003747EF003341D600FEFEFE00BD8C8400F7EFEF00F7F7EF00D6AD
      A500C68C8400C6949400BD848400BD848400BD848400C68C8C00C6949400C684
      8400E7CEC600FFFFFF00F7EFEF00C68C84001E100500CA723100E5B28C00FCF7
      F200FCF7F200FCF7F200FCF7F200CB885600D6A17A00FDF9F500FCF7F100FCF7
      F100FCF7F100E5B28B00C87030001E1005000000000000000000000000006460
      60001E0F0F00053D3D0000A6A60012F6F6001CFEFE0004DBDB00006D6D001615
      1500352A2A00000000000000000000000000313197003535C0005555CE00FFFF
      FF006767DA004141D7004444DD004848E3004B4BE8002929EA000E12E900FFFF
      FF00B3B7F8002F3DEE002C38D400FEFEFE00C68C8C00EFD6D600C6949400CEA5
      A500F7EFEF00F7EFEF00E7E7E700E7E7E700E7E7E700E7E7E700E7F7F700DED6
      D600BD949400D6A5A500EFE7DE00C68C8C00361D0A00D2783600EDC9AF00FDF8
      F400FDF8F400FDF8F400FDF8F400DBA47B00C8753700F2DDCE00FDFAF600FDF8
      F400FCF8F400ECC9AE00D0773500361D0A000000000000000000646060001E0F
      0F001B0C0C000545450000BBBB001CFDFD0026FFFF0006EEEE00007B7B001617
      17001B0C0C00352A2A000000000000000000313190004545C1005353C800FFFF
      FF008989E1005151D8005454DC00AEAEF0005B5BE5005D5DEA006161EE00FFFF
      FF009C9FF400242FEC00232DD000FEFEFE00BD848400BD949400E7C6C600FFFF
      FF00F7FFFF00F7FFFF00F7FFFF00EFFFFF00EFFFFF00EFFFFF00EFFFFF00EFFF
      FF00E7F7F700CEB5B500C6949400BD848400361D0A00D67C3900ECCAB000FDFA
      F700FDFAF700FDFAF600FEFBF800FAF2EB00D9956200D07B3C00F4DECE00FDFB
      F700FDFAF600ECC9AF00D47A3800361D0A0000000000000000002D2020001B0C
      0C001B0C0C00053333000085860003DADF0006EDF40001B5B800005757001613
      13001B0C0C001B0C0C00000000000000000031318B005555C2005858C800FFFF
      FF00FCFCFE006161D7006464DB00FFFFFF009999EC006C6CE800D3D3F900FFFF
      FF003A3CE700141AEA00161CCC00FEFEFE00B5847B00A5DEDE00FFFFFF00FFFF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00EFFFFF00E7F7F700E7F7
      F700D6EFEF00C6EFF700ADBDC600B57B7B001E100500D47A3800E6B48F00FEFB
      F900FEFBF900E8B08600F2D2BA00FEFCFA00FDF7F200DD905600DE935B00FEFD
      FB00FEFBF800E5B38E00D27936001D1005000000000000000000000000000000
      00005E59590010111B00002C59000059B1000067CE0000438500031C3500281D
      1E0000000000000000000000000000000000313189006464C4006767C800A7A7
      D700FFFFFF00F3F3FB007373DA00FFFFFF00A2A2EC00D3D3F600FFFFFF00EEEE
      F7008282EF002121E8000303C800FEFEFE00BD847B00B5A5A500FFFFFF00FFFF
      FF00FFFFFF00EFF7F700E7EFEF00CEE7E700A5CED60094C6CE0084BDC6007BB5
      C6006BADCE0073A5BD00A5848C00B57B7B0001010000B4662D00DB8A4E00FCF9
      F500FEFDFB00E79A6200E6965B00FEF9F600FEFAF800E69B6300E4945900FEFD
      FC00FCF8F400DA894D00B3652C00010000000000000000000000000000000000
      0000352A2A0005023300000186000309DF00060DF4000104B80000005700190D
      160064606000000000000000000000000000313187007373C5007676C9007878
      CE00BABADA00F1F1F7008080DA00FFFFFF00ACACEA00FFFFFF00EBEBF4008D8D
      E9008F8FEA009292EC000000BD00FEFEFE0000000000C6737300BD949400A5DE
      DE008CFFFF007BDEEF0073D6E7006BDEE7006BDEE7006BDEEF006BDEEF006BDE
      FF0084BDD600B58C8C00C67B7B000000000000000000512C1100E1844000E4B2
      8C00FFFEFE00FAE2D000EB925100EC945300EC955600EA8D4900F7D6BE00FFFE
      FD00E3B18C00DF833F00502C110000000000000000000000000000000000352A
      2A001B0C0C00050245000000BB001C1CFD002626FF000606EE0000007B00160A
      17001E0F0F00646060000000000000000000313185008181C7008383CA008686
      CE008989D2008B8BD5008E8ED900FFFFFF00B5B5E9009696E1009898E4009A9A
      E5009D9DE700A0A0E8003C3CBF00FEFEFE00000000000000000000000000B584
      840094B5BD0073EFFF006BF7FF0073EFFF0073EFFF006BF7FF0073E7FF009CAD
      B500BD848400000000000000000000000000000000000301000099562500E487
      4200E4B28D00FDFAF800FEF6F100F9D8C000F8D5BC00FDF1E900FDFAF800E3B1
      8C00E38641009755240003010000000000000000000000000000382E2E001B0C
      0C001B0C0C0005023D000000A6001212F6001C1CFE000404DB0000006D00160A
      15001B0C0C001E0F0F0000000000000000004C4C90008E8EC8009191CC009494
      CF009696D3009999D6009B9BD900FFFFFF00A6A6DB00A3A3DF00A5A5E200A8A8
      E300AAAAE400ADADE4008D8DD200000000000000000000000000000000000000
      0000C67B7B00AD9C9C0084D6E70073EFFF0073EFFF0084D6E700AD949C00C67B
      7B000000000000000000000000000000000000000000000000000B0602009A57
      2600E7894400DF8D5100E5B49000E9C9B200E9C9B200E5B49000DF8D5000E789
      4400995725000B060200000000000000000000000000000000003B3131002D20
      20002D2020000B062900000062000000A8000000BE000000860001004000261B
      21002D2020002D2020000000000000000000C6C6CE00A2A2CE009F9FCE00A1A1
      D100A4A4D400A6A6D700A9A9D900ABABDC00AEAEDE00B0B0DF00B3B3E100B5B5
      E100B8B8E200BBBBE2008989B400000000000000000000000000000000000000
      00000000000000000000BD848400B5949400B5949400BD848400000000000000
      0000000000000000000000000000000000000000000000000000000000000301
      0100522D1200BA6B3100E2854000EA8C4600EA8C4600E2854000BA6B3100512D
      1200030101000000000000000000000000000000000000000000000000000000
      0000000000005E595A0004023000000054000000610000004200201727000000
      00000000000000000000000000000000000000000000B9B9C800A2A2D400B2B2
      DC00B6B6DD00B9B9DF00BCBCE100C0C0E200C3C3E400C6C6E600C8C8E600CACA
      E700C7C7E6009696B70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000010000001E100500351C0A00351C0A001D100500010000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C00000000000000000000000000848484008484
      84008C8C8C000000000000000000000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C9C9C009C9C9C00D6CECE009494940039393900525252009C949400C6C6
      C600D6D6D6008484840000000000000000000000000000000000C6A59C00FFEF
      D600F7E7C600F7DEBD00F7DEB500F7D6AD00F7D6A500EFCE9C00EFCE9400EFCE
      9400EFCE9400F7D69C00B584840000000000000000000000000000000000CE63
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE63
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C9C9C009C9C
      9C00F7F7F700FFFFFF00D6D6D6009C9C9C004242420021182100211821003131
      310063636300848484008C8C8C00000000000000000000000000C6A59C00FFEF
      D600F7E7CE00F7DEC600F7DEBD00F7D6B5009C390800EFCE9C00EFCE9C00EFCE
      9400EFCE9400EFCE9C00B584840000000000000000000000000000000000CE63
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE63
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000948C8C009C9C9C00EFEFEF00FFFF
      FF00EFE7E700C6C6C6009C9C9C008C8C8C009494940084848400636363003939
      3900182121002118210073737300000000000000000000000000C6ADA500FFEF
      E700F7E7D600F7E7CE00F7DEC6009C3908009C390800F7D6AD00EFCE9C00EFCE
      9C00EFCE9400EFCE9C00B584840000000000000000000000000000000000CE63
      00000000000000000000CE630000CE630000CE6300005A524200CE6300000000
      000000000000000000000000000000000000000000000000000000000000CE63
      00000000000000000000CE630000CE630000CE630000CE630000CE6300000000
      0000000000000000000000000000000000009C9C9C00E7E7E700E7E7E700BDBD
      BD00A5A5A500B5ADAD00C6BDBD00A5A5A50094949400948C8C00949494009C94
      94008C8C8C006B6B6B0084848400000000000000000000000000C6ADA500FFF7
      E700F7E7D600F7E7CE009C3908009C390800CE630000F7D6B500F7D6AD00EFCE
      9C00EFCE9C00EFCE9400B584840000000000000000000000000000000000CE63
      0000CE630000CE630000CE630000FFFFFF00FFFFFF004A4A4A00000000000000
      000000000000000000000000000000000000000000000000000000000000CE63
      0000CE630000CE630000CE630000FFFFFF00FFFFFF00FFDEB500CE6300000000
      00000000000000000000000000000000000094949400ADADAD00A5A5A500ADAD
      AD00C6C6C600D6D6D600EFEFEF00EFEFEF00DEDEDE00C6C6C600ADADAD009C9C
      9C00948C8C00949494008C8C8C00000000000000000000000000CEB5AD00FFFF
      F700FFEFE7009C390800CE630000CE630000CE630000CE630000CE630000CE63
      0000EFCE9C00EFCE9C00B584840000000000000000000000000000000000CE63
      00000000000000000000CE630000CE630000CE6300005A524A00000000000000
      000000000000000000000000000000000000000000000000000000000000CE63
      00000000000000000000CE630000CE630000CE630000CE630000CE6300000000
      000000000000000000000000000000000000948C8C00ADADAD00C6C6C600CECE
      CE00C6C6C600DEDEDE00CECECE00A5ADA500BDBDBD00CECECE00D6D6D600D6D6
      D600C6C6C600B5B5B50094949400000000000000000000000000D6B5AD00FFFF
      FF00FFF7EF00FFEFE700F7AD4A00F7AD4A00CE630000F7DEC600F7DEBD00CE63
      0000F7D6A500F7D6A500B584840000000000000000000000000000000000CE63
      000000000000000000000000000000000000000000005A524A0000FFFF0000C6
      C60000000000000000000000000000000000000000000000000000000000CE63
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C00CECECE00CECE
      CE00DEDEDE00C6C6C600B5B5B500A5D6A500BDC6BD00C6A5A500ADA5A500A5A5
      A500B5B5B500C6BDBD00A5A5A500000000000000000000000000D6BDB500FFFF
      FF00FFF7F700FFF7EF00FFEFDE00F7AD4A00F7AD4A00F7E7C600F7DEC600CE63
      0000F7D6B500F7D6AD00B584840000000000000000000000000000000000CE63
      00000000000000000000CE630000CE630000CE6300007373730018F7F70000C6
      C60000000000000000000000000000000000000000000000000000000000CE63
      00000000000000000000CE630000CE630000CE630000CE630000CE6300000000
      00000000000000000000000000000000000000000000000000009C9C9C00BDBD
      BD00ADADAD00ADADAD00E7E7E700F7EFEF00EFEFEF00EFE7DE00D6D6D600CECE
      CE00B5B5B5009494940000000000000000000000000000000000D6BDB500FFFF
      FF00FFFFFF00FFF7F700FFF7EF00FFEFE700F7AD4A00F7E7CE00F7DEC600CE63
      0000F7DEB500F7DEB500B584840000000000000000000000000000000000CE63
      0000CE630000CE630000CE630000FFFFFF00FFFFFF00FFDEB5005A52520000FF
      FF0000C6C600000000000000000000000000000000000000000000000000CE63
      0000CE630000CE630000CE630000FFFFFF00FFFFFF00FFDEB500CE6300000000
      0000000000000000000000000000000000000000000000000000000000009C9C
      9C00D6D6D600CECECE009C9C9C00BDBDBD00D6D6D600D6D6D600D6D6D600C6C6
      C600ADADAD000000000000000000000000000000000000000000DEBDB500FFFF
      FF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00F7E7D600F7E7CE00CE63
      0000F7DEC600F7D6B500B584840000000000000000000000000000000000CE63
      00000000000000000000CE630000CE630000CE630000CE6300009C94840021FF
      FF0000C6C600000000000000000000000000000000000000000000000000CE63
      00000000000000000000CE630000CE630000CE630000CE630000CE6300000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFE7E700FFDECE00E7C6BD00E7C6BD00E7CEC600DED6CE00CECECE009494
      9400000000000000000000000000000000000000000000000000DEC6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00FFEFDE00FFEF
      D600E7DEC600C6BDAD00B584840000000000000000000000000000000000CE63
      0000000000000000000000000000000000000000000000000000000000004A39
      390000FFFF0000C6C6000000000000000000000000000000000000000000CE63
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CE9C9C00FFDECE00FFCEBD00FFC6AD00FFBDA500FFAD9C00000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00F7E7D600C6A5
      9400B5948C00B58C8400B58484000000000000000000CE630000CE630000CE63
      0000CE630000CE63000000000000000000000000000000000000000000007352
      4A0021F7EF0000C6C600000000000000000000000000CE630000CE630000CE63
      0000CE630000CE63000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CE9C9C00FFDECE00FFCEBD00FFC6AD00FFBDA500F7AD9400000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700E7CECE00BD8C
      7300EFB57300EFA54A00C6846B000000000000000000CE630000FFFFFF00FFFF
      FF00FFDEB500CE63000000000000000000000000000000000000000000000000
      00005A4A290000000000008400000000000000000000CE630000FFFFFF00FFFF
      FF00FFDEB500CE63000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CE9C9C00FFDECE00FFCEBD00FFC6AD00FFBDA500F7AD9C00000000000000
      0000000000000000000000000000000000000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00C694
      7B00FFC67300CE947300000000000000000000000000CE630000CE630000CE63
      0000CE630000CE63000000000000000000000000000000000000000000000000
      000073524A0000840000008400002100210000000000CE630000CE630000CE63
      0000CE630000CE63000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE9C
      9C00FFE7D600FFDECE00FFCEBD00FFC6AD00FFBDA500F7AD9C00000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E7CECE00C694
      7B00CE9C84000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006300630063006300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE9C
      9C00CE9C9C00CE9C9C00CE9C9C00F7AD9C00F7AD9C0000000000000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500D6BDB500BD84
      7B0000000000000000000000000000000000D4CEC600D4CEC600D4CEC600D4CE
      C600D4CEC600D4CEC600D4CEC600D4CEC600D4CEC600D4CEC600D4CEC600D4CE
      C600D4CEC600D4CEC600D4CEC600D4CEC6000000000000000000000000000000
      0000F9F9F900BEC0C8007B84AB007985B600858EB9007179A80082859E00CACA
      CD00F7F7F7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D4CEC600D4CEC600D4CEC600D4CE
      C600D4CEC600D4CEC600D4CEC600D4CEC600D4CEC600D4CEC600D4CEC600D4CE
      C600D4CEC600D4CEC600D4CEC600D4CEC600000000000000000000000000DFDF
      E2003B4EC300080DF400D6D7F600F4F4F400F4F4F400F4F4F400F3F3F500868A
      DA0063669800E6E6E60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D4CEC600D4CEC600D4CEC600D4CE
      C600D4CEC600D4CEC600D4CEC600D4CEC600D4CEC600D4CEC600D4CEC600D4CE
      C600D4CEC600D4CEC600D4CEC600D4CEC6000000000000000000DADBDF001C31
      E5001314F9001414F0009999EC00EDEDED00ECECEC00EDEDED00EAEAF0002F2F
      EF001112F3003E429C00E6E6E60000000000000000000000000000000000CE63
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE63
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D9D9D900D0D0D000D1D1D100D9D9
      D900DADADA00D8D9DC008799E0009AA8E000D4CEC600D4CEC600D4CEC600D4CE
      C600D4CEC600D4CEC600D4CEC600D4CEC60000000000F6F6F6002E49E0002626
      FB002727EF002525E3004347D9009FAAD400929ECE00AEB7D6008A8BDE002727
      E1002727ED002021F40063679800F7F7F700000000000000000000000000CE63
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE63
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E2E2E200EDEDED00EDEDED00EEEE
      EE00EEEEEE00C8CDE0005070DE00607AD900CBCBCB00EEEEEE00EEEEEE00DEDE
      DE00D4CEC600D4CEC600D4CEC600D4CEC60000000000A7B4D4005E61FC003A3A
      F4003636E6001829D400A8AEC300F6F6F700FCFCFD00EDEEF1007480BF001B1F
      CF003838E5003939F2001F23DC00CBCBCE00000000000000000000000000CE63
      00000000000000000000CE630000CE630000CE630000CE630000CE6300000000
      000000000000000000000000000000000000000000000000000000000000CE63
      00000000000000000000CE630000CE630000CE630000CE630000CE6300000000
      000000000000000000000000000000000000E3E3E300EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00CED3EA004D71DE005C77D700D1D1D100EEEEEE00EEEEEE00EEEE
      EE00D4CEC600D4CEC600D4CEC600D4CEC600FCFCFD009BB1E200F7F7F800C5C5
      F200353FE000BCC0CB0000000000000000000000000000000000FEFEFE007380
      C3003839DD004C4CEE004444F900767A9F00000000000000000000000000CE63
      0000CE630000CE630000CE630000FFFFFF00FFFFFF00FFDEB500CE6300000000
      000000000000000000000000000000000000000000000000000000000000CE63
      0000CE630000CE630000CE630000FFFFFF00FFFFFF00FFDEB500CE6300000000
      000000000000000000000000000000000000E3E3E300EEEEEE00EDEDED00EDED
      ED00EDEDED00CCD1E8004B6EDC005871D500DADADA00EEEEEE00EEEEEE00DCDC
      DC00D4CEC600D4CEC600D4CEC600D4CEC600EEEEF100D0DCF700F8F8F800F0F0
      F000738DCA00F9F9F9000000000000000000000000000000000000000000ECED
      F100444DD000B8B8F000E5E5F8007178A700000000000000000000000000CE63
      00000000000000000000CE630000CE630000CE630000CE630000CE6300000000
      000000000000000000000000000000000000000000000000000000000000CE63
      00000000000000000000CE630000CE630000CE630000CE630000CE6300000000
      000000000000000000000000000000000000E3E3E300E8E8E800DDDDDD00D4D4
      D400D4D4D400B4B9D100496BD900546BCC00D0D0D000D4D4D400CACACA00DEDE
      DE00D4CEC600D4CEC600D4CEC600D4CEC600E8EBF000E0E7F800F8F8F800EFF0
      F0008091B900FDFDFD000000000000000000000000000000000000000000FCFC
      FD00939FCF00F3F3F300F9F9F900828BBA00000000000000000000000000CE63
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE63
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DFE0E20096A6DF00556FD2005068
      CB004F65C100455BBC005173DC00405BC4004C61BE004E64C3004D65C900667D
      D600C2C9DF00D4CEC600D4CEC600D4CEC600ECEDF100DFE7F700F9F9F900F2F2
      F3007B8EBF00F8F8F8000000000000000000000000000000000000000000F6F6
      F800A1ADD700F5F5F500FAFAFA007884B700000000000000000000000000CE63
      00000000000000000000CE630000CE630000CE630000CE630000CE6300000000
      000000000000000000000000000000000000000000000000000000000000CE63
      00000000000000000000CE630000CE630000CE630000CE630000CE6300000000
      000000000000000000000000000000000000D3D7E3007D9DEE007DA7F30077A1
      F000709CEE006B97EB006992EC006E9AED006F9AED00739EEE0077A1F00077A0
      EF0099ACE600D4CEC600D4CEC600D4CEC600FAFBFC00B8C3EE00CACAFC00A8A8
      F8003C4BE200CFD0D200FEFEFE0000000000000000000000000000000000ABB1
      C400DBDFEA00F7F7F700FAFAFA007B83AB00000000000000000000000000CE63
      0000CE630000CE630000CE630000FFFFFF00FFFFFF00FFDEB500CE6300000000
      000000000000000000000000000000000000000000000000000000000000CE63
      0000CE630000CE630000CE630000FFFFFF00FFFFFF00FFDEB500CE6300000000
      000000000000000000000000000000000000E1E1E200DFE3EF00D9DEEF00D6DB
      ED00D3D9EC00B1BDE800709FED00617FDD00BBC2D700D4D9EC00C7CCDE00C8CF
      E200D5D9E000D4CEC600D4CEC600D4CEC60000000000A4AFE2009A9BFE00A8A8
      FC008B8CF4004E63C900CFD0D200F8F8F800FDFDFD00F9F9F900BBBFCB003040
      DC00C8C8F600F5F5FA00DCE2F400BEC0C800000000000000000000000000CE63
      00000000000000000000CE630000CE630000CE630000CE630000CE6300000000
      000000000000000000000000000000000000000000000000000000000000CE63
      00000000000000000000CE630000CE630000CE630000CE630000CE6300000000
      000000000000000000000000000000000000E3E3E300EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00D2D7EC0073A0EE006C87DE00D7D7D700EEEEEE00D4CEC600D4CE
      C600D4CEC600D4CEC600D4CEC600D4CEC60000000000EFF1F500757DF700BABA
      FE00BBBBFC00A0A1F600AAB9E3007C90BF008091BA003F5ACB004751EA00B2B2
      F800BBBBFC00B4B4FE006275C300F9F9F900000000000000000000000000CE63
      0000000000000000000000000000000000000000000000000000000000000000
      000021842900000000000000000000000000000000000000000000000000CE63
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E1E1E100EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00D2D7EB0078A6F1007591E300DDDDDD00ECECEC00DEDEDE00D4CE
      C600D4CEC600D4CEC600D4CEC600D4CEC6000000000000000000C5C9D800878B
      FD00C9C9FE00E7E7FC00FAFAFA00F7F8F800F6F6F700CBCBFA00CACAFC00CACA
      FD00C2C2FE004255E600DFDFE2000000000000000000CE630000CE630000CE63
      0000CE630000CE63000000000000000000000000000000000000000000000000
      00002184290000000000000000000000000000000000CE630000CE630000CE63
      0000CE630000CE63000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E3E3E300EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00D4D8EB007AA7F1007B95E600E2E2E200EEEEEE00DEDEDE00D4CE
      C600D4CEC600D4CEC600D4CEC600D4CEC6000000000000000000FEFEFE00C1C6
      D4008890F600FAFBFD00FCFCFC00FCFCFC00FCFCFC00E4E4FD00CACAFE00A1A4
      FE00435DE000DADBDF00000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFDEB500CE63000000000000000000000000000000000000218429002184
      29002184290021842900218429000000000000000000CE630000FFFFFF00FFFF
      FF00FFDEB500CE630000000000000000000000000000000000000021A5000021
      A5000021A5000021A5000021A50000000000DFDFDF00EEEEEE00EEEEEE00EEEE
      EE00EDECEC00E5E7F10089A5F0009AAFEE00EEEEEE00EEEEEE00DEDEDE00D4CE
      C600D4CEC600D4CEC600D4CEC600D4CEC6000000000000000000000000000000
      0000EDEEF100B1BAD000C6D2EC00E0E7F900E1E9F900BDC9F7005B70E200A0AD
      D500F7F7F80000000000000000000000000000000000CE630000CE630000CE63
      0000CE630000CE63000000000000000000000000000000000000000000000000
      00002184290000000000000000000000000000000000CE630000CE630000CE63
      0000CE630000CE630000000000000000000000000000000000000029E7000029
      E7000029E7000029E7000029E70000000000DEDEDE00E1E1E100E3E3E300E0E0
      E000E3E2E200E3E3E300D7DBE400DDDFE400E3E3E300E2E2E200D4CEC600D4CE
      C600D4CEC600D4CEC600D4CEC600D4CEC6000000000000000000000000000000
      00000000000000000000F9F9F900EAEBEF00E2E5ED00EFEFF100FCFCFD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000218429000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C7FDDA00FEFFFE00000000000000
      00000000000000000000FEFEFE00000000000000000000000000000000000000
      000000000000000000000000000000000000EDE1E600EDE1E600EDE1E600EDE1
      E600EDE1E600EDE1E600EDE1E600EDE1E600EDE1E600EDE1E600EDE1E600EDE1
      E600EDE1E600EDE1E600EDE1E600EDE1E6000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00000000000000
      00000000000000000000FEFEFE00FADAC6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000064DE8B00D1FFDE00000000000000
      00000000000000000000E6F9ED00DAFFE6000000000000000000000000000000
      000000000000000000000000000000000000F8F2F500E0CAD300DBC1CC00D8BA
      C700E0C8D200EDE1E600EDE1E600EDE1E600EDE1E600EDE1E600EDE1E600EDE1
      E600EDE1E600EDE1E600EDE1E600EDE1E6000000000000000000000000000000
      000000000000000000000000000000000000FEE6D900F7EDE700000000000000
      00000000000000000000FEDECF00D38D67000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFB56B00FFB5
      6B00FFB56B00FFB56B00FFB56B00FFB56B0021AB4B00B8FED200D0FFE000FDFE
      FD000000000000000000AFDDBF00AAF8C500E9FFF00000000000000000000000
      000000000000000000000000000000000000F8F2F500F8F2F500F8F2F500F8F2
      F500EDE1E600DDC5CF00DBBFCB00DBBFCB00E3CDD600EDE1E600EDE1E600EDE1
      E600EDE1E600EDE1E600EDE1E600EDE1E6000000000000000000000000000000
      0000000000000000000000000000FEEFE800F3C3A600D7C0B200000000000000
      0000FEFDFD00FDDFCE00FAD0B3009C5028000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7A55A00FFF7
      E700FFF7E700FFF7E700FFF7E700FFF7E70099CEAA0007C441006BF79800B0FD
      CB00E0FEEA000000000093CBA0001FDB5A00ADFECA00F7FFF900000000000000
      000000000000000000000000000000000000F8F2F500F8F2F500F8F2F500F8F2
      F500F8F2F500F8F2F500F8F2F500F8F2F500F8F2F500F8F2F500F8F2F500D9BD
      C900EDE1E600EDE1E600EDE1E600EDE1E6000000000000000000000000000000
      00000000000000000000FEF9F600FCC8A800C7612A00C7A0930000000000FCEB
      E000F9CBAE00EF996A00B1471100C5AC9D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7A55A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFDFD003490450001B3390026D4
      6D0071FF9B0069FD99005DDB850001BD3F004DF37D009AFFBB00FAFFFB000000
      000000000000000000000000000000000000F8F2F500F8F2F500F8F2F500F8F2
      F500F8F2F500F8F2F500F8F2F500F8F2F500F8F2F500F8F2F500F8F2F500E0CA
      D300EDE1E600EDE1E600EDE1E600EDE1E6000000000000000000000000000000
      000000000000FEFBFA00FCBB9400E9804E00B2420100CC8A6500F69C6A00F99C
      6E00C0703100A63D030084493900FDFDFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7A55A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F8FBF9007EC694001697
      700004D360000FED530000D9490002CA460001DB480060F78C00C1FED500FDFE
      FD0000000000000000000000000000000000F8F2F500F8F2F500F8F2F500F8F2
      F500F8F2F500F8F2F500F8F2F500F8F2F500F8F2F500F8F2F500F8F2F500EBDB
      E200EDE1E600EDE1E600EDE1E600EDE1E6000000000000000000000000000000
      0000FEFDFD00FDD4BC00EE8E6000CC4D0500C0490200CD4D0200D85B1B00BF63
      0F00866A1D00BA968300FAF9F800000000000063CE000063CE000063CE000063
      CE000063CE000063CE0000000000000000000073080000000000EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C21000000000000000000FBFCFB006EA1
      A70001A39F0001B33D0002C2430001C9460001CA460002D2470072F49B0090FF
      B300FDFEFD00000000000000000000000000F8F2F500F8F2F500F8F2F500F8F2
      F500F8F2F500F8F2F500F8F2F500F8F2F500F8F2F500F8F2F500F8F2F500EDE1
      E600EDE1E600EDE1E600EDE1E600EDE1E600000000000000000000000000FEFD
      FD00FAB58E00EC9C7100C64B0300C0490100BF490100B8460200A94001009192
      0900969C7200FCFBFB00000000000000000010F7FF0010F7FF0010F7FF0010F7
      FF0010F7FF000063CE0000000000000000000073080000730800000000000000
      000000000000000000000000000000000000000000000000000000000000CBD9
      E4002781BC0004A87D0000BD400001C4430000BE3F0002AE360028B0650062CA
      CA00F2FBF500000000000000000000000000F8F2F500E8D6DE00E7D5DD00E7D5
      DD00E7D5DD00E7D5DD00E7D5DD00E7D5DD00E7D5DD00E7D5DD00E7D5DD00EDE1
      E600EDE1E600EDE1E600EDE1E600EDE1E600000000000000000000000000FAF5
      F200BBBE6800A1662F00A4390200B4420000BA460100B343000096770C0075A9
      3000D6DFCE0000000000000000000000000010F7FF0010F7FF0010F7FF0010F7
      FF0010F7FF000063CE00007308000073080000730800008C0800007308000000
      000000000000000000000000000000000000000000000000000000000000F9FB
      FC001F4C69006AB7F70000AD8B000BA83B0085D3A000F8FCF900A0C8B80061B5
      F800DCF1FF00000000000000000000000000F8F2F500E7D5DD00E7D5DD00E7D5
      DD00E7D5DD00E7D5DD00E7D5DD00E7D5DD00E7D5DD00E7D5DD00E7D5DD00EDE1
      E600EDE1E600EDE1E600EDE1E600EDE1E600000000000000000000000000EFFE
      DA00ACF06100C2B7A200FBF9F800C9A28B009B3F0E009E850500AEEF6900445E
      2300FAFBF90000000000000000000000000010F7FF0010F7FF0010F7FF0010F7
      FF0010F7FF000063CE000000000000000000008C0800008C0800000000000000
      000000000000000000000000000000000000000000000000000000000000FCFD
      FD0079A29D00024D7C00279CEB0085CCFF00D4ECFD000000000093A3AA000A66
      A40070BFFF00F1F9FF000000000000000000F4ECEF00E8D6DE00C0616300DEA4
      A300DFA4A500DFA6A700DFA7A600E0A8A700E1A7A700E2A9A800E2A9A800E2AA
      AA00D47C7D00D47D7D00EDE1E600EDE1E6000000000000000000F9FEF000B8FF
      68005B9312009FA6930000000000EAFBD500C5F9850090DE2B00436D08009A97
      7C00FDFDFC000000000000000000000000000063CE000063CE000063CE000063
      CE000063CE000063CE000000000000000000008C080000000000EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C21000000000000000000000000000000
      0000F8FCFB0035475000013C66000585CA0027B0FE0055A7DE004B88B5000140
      6F001696DD0059BAFF00F6FBFE0000000000F5EDF000E8D3D500C8646400E095
      9400E0959400E0959400E0959400E0959400E0959400E0959400E0959400E095
      9400E5A8A800D3707100EDE1E600EDE1E60000000000FBFEF600B0FF510087C9
      21003765010080A850009FD55700A4F9230076B70F00335B010041483600FBFA
      F900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7A55A00FFF7
      E700FFF7E700FFF7E700FFF7E700FFF7E7000000000000000000000000000000
      000000000000F5F8FA00798C99000233570000548B00006BB00000518C000247
      7E0001548E002D9ADD008FCFFF00FCFDFF00F9F5F700F9F5F700E8AFAF00E291
      9000E4979600E9A5A400ECAAAA00F1B9B600F3BBBA00EDAEAE00EAA6A600E499
      9900E1929400E7BEBE00EDE1E600EDE1E600FDFEFC00C8FD89008ECF31004A82
      02003E740200478200005FA00600497D04002B4D020087917B00F7F9F5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7A55A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000FBFBFB00A0B1BD000A334E0001396600024476000146
      7C0001477D00024F86003F96DA005BBAFE00F8F4F600F8F4F600F8F4F600F9F5
      F700FAF6F800FAF6F800FAF6F800FAF6F800FAF6F800FAF6F800E6D4DB00EDE1
      E600EDE1E600EDE1E600EDE1E600EDE1E600B1F45E008CCD4300457B03003E73
      01003D7201003B6C0200315C01002B410C00AEB8A200FBFBFB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7A55A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000FEFEFE00D3DBE0000E395800004070000144
      770000417100023A6200406E8D00A0C0D600F0E1E700F0E2E800F1E2E800F5EC
      F000F9F2F500FBF7F900FBF7F900FBF7F900FBF7F900FBF7F900E7D5DD00EDE1
      E600EDE1E600EDE1E600EDE1E600EDE1E600BBCCA50067824400325802003867
      00003B6D010037660000314F0E00D9DDD400FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C21000000000000000000000000000000
      000000000000000000000000000000000000D5E2EC000847710004426E000D45
      65007A9AB200F4F8FA00F9FAFB00FEFEFE00F1E3E900EEE0E600EEDEE500F6ED
      F100F9F4F600FBF7F900FBF7F900FBF7F900FBF7F900FBF7F900E9D9E000EDE1
      E600EDE1E600EDE1E600EDE1E600EDE1E600FEFEFE00FAFBF900F7F9F40095AA
      7D003C571200396304003F650900E0E9D7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FDFEFE00ABC3D30087AAC100B1C1CE00F9FB
      FC0000000000000000000000000000000000FEFEFE00EEDDE400F2E6EB00FAF6
      F800FBF9FA00FBF9FA00FBF9FA00FBF9FA00FBF9FA00FBF9FA00E5D3DA00EDE1
      E600EDE1E600EDE1E600EDE1E600EDE1E6000000000000000000000000000000
      0000FAFCF900BFC9B300A5B78B00BFCCAE00FEFEFD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F9F900E0E0E000DFDEDE00DFDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DFDEDE00F6F6F6000000000000000000AD5A5A00AD52
      5200A54A4A00AD949400C6CEC600CECEC600CECEC600C6CEC600C6CEC600B59C
      9C009C4242009C424200A55252000000000000000000EF9C2100FFE7C600FFE7
      C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFF7
      E700FFF7E700F7A55A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D0CECE00DFD3D300E4DADA00E2D8D700D4CBC700DFD3D300DFD2D200DECF
      CF00DCCCCC00D8C6C600CAB1B100D3D2D20000000000BD7B7300CE636300CE6B
      6B00B55A5A009C848400BDA5A500E7CECE00FFF7F700FFFFF700F7F7F700CEB5
      B500942929009C313100C65A5A00AD5A5A0000000000EF9C2100FFE7C600FFE7
      C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFF7
      E700FFF7E700F7A55A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CFCDCD00F5F2F200FAFDFA0074DF70002AC9230096C98F00EAE7E500F7F3
      F300F7F1F100EEE3E200DBC8C700D2D1D10000000000BD7B7300CE636300CE63
      6300B55A5A009C7B7B009C424200B5737300E7DEDE00FFF7F700FFFFFF00D6B5
      B500943131009C313100BD5A5A00AD5A5A0000000000EF9C2100FFE7C600FFE7
      C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFF7
      E700FFF7E700F7A55A000000000000000000FFB56B00FFB56B00FFB56B00FFB5
      6B00FFB56B00FFB56B00FFB56B00FFB56B000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDFD
      FD00B1AEB300ECEBE70064D75A0007EB030017C90C0007E0010031D32E00EDE7
      E600F5EFEF00F1E7E700DECDCC00D3D1D10000000000BD7B7300CE636300CE63
      6300B55A5A00AD8484009C3939009C393900CEBDBD00EFEFEF00FFFFFF00E7C6
      C6009429290094313100BD5A5A00AD5A5A0000000000EF9C2100FFE7C600FFE7
      C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFF7
      E700FFF7E700F7A55A000000000000000000FFF7E700FFF7E700FFF7E700FFF7
      E700FFF7E700FFF7E700FFF7E700F7A55A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FCFCFC008E98
      B400184DE7004E6FBB0013C207000ADB02001EB20E000BCC000017DE1300EAE5
      E200F4EDED00ECE1E000DBC9C800D3D1D10000000000BD7B7300CE636300CE63
      6300B55A5A00B58C8C009C4A4A0094313100A59C9C00D6D6D600FFFFFF00E7C6
      C6009429290094313100BD5A5A00AD5A5A0000000000EF9C2100FFE7C600FFE7
      C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFF7
      E700FFF7E700F7A55A000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7A55A000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE008193BA001A63
      F800226AFF001D68E70018B50B0017C00A0012B4010013BF05001FCE1600EAE4
      E100F3EBEB00EDE2E200DDCBCA00D3D1D10000000000BD7B7300CE636300CE63
      6300BD5A5A00C6948C00C6949400B5848400AD8C8C00BDA5A500E7C6C600DEAD
      AD00A5393900A5393900C65A5A00AD5A5A0000000000EF9C2100FFE7C600FFE7
      C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFF7
      E700FFF7E700F7A55A000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7A55A000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD004987E700277A
      FF002E7FFE004481D700AB951B0030CA010005EA000008E803007FD47500F2EA
      EA00F1E8E800EBDFDE00DBC9C900D3D1D10000000000BD7B7300CE636300CE63
      6300CE636300CE636300CE636300CE636300CE636300C65A5A00C65A5A00CE63
      6300CE636300CE636300CE6B6B00AD525A0000000000EF9C2100FFE7C600FFE7
      C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFF7
      E700FFF7E700F7A55A0000000000000000000063CE000063CE000063CE000063
      CE000063CE000063CE000063CE000063CE000063CE000063CE000063CE000000
      00000000000000730800000000000000000000000000FDFDFD005297EA002D85
      FE00366AD700E29D2000FEB11100F8AE0100A1AB010090D17900F2EBEA00F1E8
      E800F0E6E600EADFDD00DBCAC900D3D2D20000000000BD7B7300B5525200B55A
      5A00C6848400D6A5A500D6ADAD00D6ADA500D6ADAD00D6A5A500D6A5A500D6AD
      A500D6ADAD00D69C9C00CE636300AD52520000000000EF9C2100FFE7C600FFE7
      C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFF7
      E700FFF7E700F7A55A00000000000000000010F7FF0010F7FF0010F7FF0010F7
      FF0010F7FF0010F7FF0010F7FF0010F7FF0010F7FF0010F7FF000063CE000000
      00000000000000730800007308000000000000000000FDFDFE00699ADC00328D
      F900D5AE3D00FFC60000FFB51300FFAB0000FDB90200E5C7B700F4EBEB00F0E6
      E600EFE4E400EADDDC00DBC9C900D3D2D20000000000BD7B7300AD524A00E7CE
      CE00F7F7F700F7F7EF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700DEBDBD00C65A5A00AD525A0000000000EF9C2100EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100F7A55A00000000000000000010F7FF0010F7FF0010F7FF0010F7
      FF0010F7FF0010F7FF0010F7FF0010F7FF0010F7FF0010F7FF000063CE000073
      08000073080000730800008C0800007308000000000000000000FDFDFD00C1C7
      D200DEBF3A00FFD30800FFB00800FFAC0500FDB00300E7CBBA00F7F2F200F2E9
      E900EDE2E200E8DBDA00DBCAC900D3D2D20000000000BD7B7300B5524A00EFD6
      D600FFF7F700F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7F7F700DEBDBD00C65A5A00AD525A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000010F7FF0010F7FF0010F7FF0010F7
      FF0010F7FF0010F7FF0010F7FF0010F7FF0010F7FF0010F7FF000063CE000000
      000000000000008C0800008C080000000000000000000000000000000000FDFC
      FC00E7BE4000FFC80300FFC50000FFC50000F9B61700F4E2D900F7F2F200F3EC
      EC00EEE2E200E8DBDA00DCCCCB00D3D2D20000000000BD7B7300B5524A00EFD6
      D600EFEFEF00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600EFEFEF00DEBDBD00C65A5A00AD525A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000063CE000063CE000063CE000063
      CE000063CE000063CE000063CE000063CE000063CE000063CE000063CE000000
      000000000000008C080000000000000000000000000000000000000000000000
      0000CBC6BF00F6C74D00FED80500FACA1C00FAE6D500FBF8F800F6F1F100D3C3
      C300D4C3C300D0BDBD00BCA4A400DFDFDF0000000000BD7B7300B5524A00EFD6
      D600EFEFEF00DED6D600DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DED6
      D600EFEFEF00DEBDBD00C65A5A00AD525A000000000000000000000000000073
      0800000000000000000000000000000000000000000000000000000000000073
      080000000000000000000000000000000000FFF7E700FFF7E700FFF7E700FFF7
      E700FFF7E700FFF7E700FFF7E700EF9C21000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D1D0D000F8F6F600FCE9CE00FDF2E500FEFDFD00FBF8F800F6F1F100DFD4
      D400FCFBFB00DCCFCF00C1BEBE00FEFEFE0000000000BD7B7300B5524A00EFD6
      D600F7F7EF00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DE
      DE00EFEFEF00DEBDBD00C65A5A00AD525A000000000000000000007308000073
      0800000000000000000000000000000000000000000000000000000000000073
      080000730800000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7A55A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D1D1D100F8F8F800FFFFFF00FFFFFF00FEFDFD00FBF8F800F6F1F100E0D4
      D400E0D6D600BFBCBC00FEFEFE000000000000000000BD7B7300B5524A00EFD6
      D600EFEFEF00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600EFEFEF00DEBDBD00C65A5A00AD525A0000000000008C0800008C08000073
      0800007308000073080000000000000000000000000000730800007308000073
      0800008C0800008C08000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7A55A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D1D1D100F6F5F500FAFAFA00FAF9F900F9F7F700F6F2F200F2EBEB00CFC0
      C000BEBBBB00FEFEFE00000000000000000000000000BD7B7300B5524A00E7D6
      CE00FFF7F700F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00FFF7F700DEBDBD00C65A5A00AD525A000000000000000000008C0800008C
      080000000000000000000000000000000000000000000000000000000000008C
      0800008C0800000000000000000000000000EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C21000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ECEBEB00C0BFBF00BFBEBE00BFBDBD00BEBCBC00BDBBBB00BDBABA00C7C5
      C500FDFDFD000000000000000000000000000000000000000000AD524A00CEB5
      B500D6D6D600CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00D6D6D600CEADAD00A54A4A0000000000000000000000000000000000008C
      080000000000000000000000000000000000000000000000000000000000008C
      0800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B58C8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000F7F7F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D2D2D2006482640043777B0051818400959E9E00FBFBFB000000
      00000000000000000000000000000000000000000000EBE7E200B89B7A00B29B
      8100D3C9BE00EEEAE600FAF9F800FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B58C8C00FFF7E700F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00F7EFDE00F7E7CE008C5A5A00000000000000000000000000000000000000
      0000000000000000000098A5B9001963CB00B5B6B900F4F4F400000000000000
      000000000000000000000000000000000000000000000000000000000000F0F0
      F000286F280000A50000009F00000BA6AE0000BFCB0000BAC40001A9AE009BA3
      A40000000000000000000000000000000000F5EEE800DF8A2F00FDAA4F00F9A5
      4800E38C2C00BB762B00A87F5300B9A59000D9D1C800F1EEEB00FBFAFA000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B58C8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00EFDECE008C5A5A00000000000000000000000000000000000000
      0000000000006388B20097EBFE0092FFFF0071E6FF000A51BE00C7C7C700F9F9
      F900000000000000000000000000000000000000000000000000EDEDED000692
      060000AF000000B5000000B800000EC6CE0000E6F30000DAE70000C4D00000BC
      C30073878800000000000000000000000000F0DECC00FCA34100FFB25F00FFB9
      6D00FEBD7400FFBD7600FEB96D00F5A34A00DD882B00B4763100A7856000C0B0
      9E00DFD8D100F5F3F100FEFEFE00000000000000000000000000000000000000
      000000000000B58C8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE008C5A5A0000000000000000000000000000000000FEFE
      FE00327EC40078FAFF007EFFFF0070FCFF0065FBFF0063FAFF0058E2FE00144F
      B300D3D3D30000000000000000000000000000000000000000001A7F1A00008E
      000000870000008A00000084000009A2AA0001A7AF0000A8B10000B0B90000AE
      B80000A2A500BABCBC000000000000000000EDD8C200FCA74C00FFB46300FFB6
      6700FFB96D00FFBD7500FFBF7A00FFC38200FFC68600FFC58500FEBA7100F19F
      4700D4822700A77E5100F8F7F6000000000000000000B58C8C008C5A5A008C5A
      5A008C5A5A00B58C8C00FFF7EF00F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00EFDECE009C6B6300000000000000000000000000000000001387
      DA005CF3FF005DF5FF005EF5FF005DEDFF004FEAFF004DE9FF004CE7FF004AE6
      FF000957C300FDFDFD00000000000000000000000000AAB0AA0000C4000000C4
      000000C6000000C5000000C1000008DEE70002F2FF0001F2FF0000F2FF0000E6
      F30000C5D100148486000000000000000000EAD1B600FCAC5500FEB66600FFB3
      5F00FFB66700FFB96D00FFBD7500FFBF7A00FFC38200FFC68700FFC98E00FFC9
      8F00FFC48500B5773400F7F5F4000000000000000000B58C8C00FFF7E700F7EF
      DE00F7EFDE00B58C8C00FFF7EF00F7E7CE00F7DEC600F7DEC600F7DEC600F7DE
      C600F7E7D600EFDECE009C6B6B00000000000000000000000000FEFEFE0044E1
      FF0044E2FF0045E2FF0046E3FF0049DEFF0039D9FF0038D8FF0036D6FF0034D5
      FF000656C300FDFDFD000000000000000000000000002A8A2A0002C7010001C7
      000000C6000000C5000000C1000008E2EC0001F2FF0001F2FF0000F2FF0000F0
      FD0000DAE60000C1C700CCCCCC0000000000E6C9A800FDB36300FFB66700FFAF
      5800FFB35F00FFB66700FFB96D00FFBD7500FFBF7A00FFC38200FFC68700FFC9
      8E00FFC58600B5773400F7F5F4000000000000000000B58C8C00F7EFDE00F7DE
      CE00F7DEC600B58C8C00FFFFF700FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500EFE7D600A57B7300000000000000000000000000FEFEFE002CCF
      FF002DCFFF00ACEEBC0000CE1D0000CE1D0000CE1D0000CE1D003CDA54001EBF
      F9000357C500FDFDFD000000000000000000FAFAFA0007BF030007CC030001C7
      000000C6000000C5000001BE010009E4EE0002F2FF0001F2FF0000F2FF0000F2
      FF0000E6F20000C8D3007B8F900000000000D2B79A00FEB76800FFB66700FFAC
      5100FFAF5800FFB35F00FFB66700FFB96D00FFBD7500FFBF7A00FFC38200FFC6
      8700FFC58500B5773400F7F5F4000000000000000000B58C8C00FFF7E700FFD6
      A500FFD6A500B58C8C00FFFFF700FFE7D600FFE7D600F7E7D600F7E7CE00FFE7
      D600FFF7E700EFDEDE00A57B7300000000000000000000000000FEFEFE0015BC
      FF0011A9F300A9E8B000B4FDB500B4FDB500B4FDB500B4FDB50037CE370037B9
      E7000056C600E9E9E9000000000000000000F1F3F1000CD004000ACD040001C6
      000000C6000000C5000002B902000AE6EE0003F3FF0002F2FF0001F2FF0000F2
      FF0000EBF80000D0DD00477C7E0000000000D9A97500FEBA7000DE811B00DF83
      1E00F28D1D00F09B3E00FEA94D00FEB56400FFB96C00FFBD7500FFBF7A00FFC3
      8200FFC27F00B5773400F7F5F4000000000000000000B58C8C00FFF7EF00F7DE
      C600F7DEC600B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700EFDE
      DE00D6C6C600BDADAD00B5847300000000000000000000000000F0F0F00036D3
      FC0047E3FE00AAE3B00061FD610061FE610060FD610061FD610036BD370049DD
      F60037D7FF000D81DC00A7ABB100F3F3F300EDF0EC0012D808000CD0050001C7
      000000C6000000C5000000C0000015945C0013ACAA0003F3FF0001F2FF0000F2
      FF0000EDFA0000D6E200407A7D0000000000D99A5600FEBA7000EF8A1C00FFAD
      5300FEAC5200FDA74800F39C3E00F3973200E28C2F00F3912500EEA14C00FCB2
      6100FEBD7600B4753100F2F0ED000000000000000000B58C8C00FFF7EF00F7E7
      CE00F7DEC600B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700B58C
      8C00B58C8C00B58C8C00B58C8C000000000000000000E5E5E6007DEBFF006AF2
      FF002ACCFE00A9DCAF000DFD0D000DFE0D000DFD0D000DFD0D0037AD370059E7
      F0000164CF003670B8008D9EB700F7F7F700F7F9F70016D4090010D3070002C8
      010000C6000000C5000000C4000000C600001A92810001F3FF0001F2FF0000F2
      FF0000EDFA0000D9E6006C8C8E0000000000D8975000FDBA7100ED943200FFB4
      6200FFB46200FFB46200FFB46200FFE0C000FFF1E200FFD4A600FDAE5800F7A4
      4A00F0963300C9731500D3C8BC000000000000000000B58C8C00FFFFF700FFD6
      A500FFD6A500B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B58C
      8C00EFB56B00C68C7B000000000000000000DBE0E20061CEFF0016AFF500A0D0
      A10000880100008A010000E5010000E6010000E5010000E50100008A01000089
      00003DA03E00056BCF00E3E3E30000000000000000002CBF1D0017D80A0006CB
      030001B001000003000000C3000000C500000DAA770001F7FF0012181500009D
      A50000ECF90000E1E800AEB0B00000000000D38C3D00FAA74D00F2B06700FFBF
      7800FFBB7100FFBA6F00FFBA6E00FFBE7700FFC48400FFC27F00FFBA6E00FFBA
      6E00FFBA6E00E78E2D00DBD3CA000000000000000000B58C8C00FFFFF700FFE7
      D600FFE7D600B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C
      8C00BD84840000000000000000000000000000000000000000003CC5FE00B4FF
      FF0080B7800000C2000000C9000000C9000000C9000000C9000000C90000378C
      37002ACDFF0014BCFF005081B700000000000000000087C17C0020E00D000FD2
      070005C7040041A0410000C6000000C600000EAC780002F3FF0036DCE50000EC
      F80000EBF80002BEC100FAFAFA0000000000C86D0A00F1993A00FDC78C00FEDF
      BD00FFEAD400FFE6CB00FFE8CF00FFD6A900FFCD9800FFC58500FFC07D00FFC0
      7B00FFBF7A00D7842A00E4DED8000000000000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFFFF700EFDEDE00D6C6C600BDADAD00B58473000000
      00000000000000000000000000000000000000000000DBE5EA00CFFCFF00B9FF
      FF009DFFFF0080AC800000A6000000AC000000AC000000AC0000377C37004EE9
      FF0037D7FE008BA6BF00000000000000000000000000F6FAF50028DB11001EDE
      0D000CCF050002C8010000C5000000C6000022A3700003F3FF0003F3FF0003F3
      FF0000F0F9007D9293000000000000000000F5EADE00ECD7C000DEB99000D79C
      5C00EA841500E88A2400E9953800ECAD6900FCC28300FDD3A400FEE2C400FFE5
      C800FEDEBC00BF803B00EEEBE7000000000000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFFFF700B58C8C00B58C8C00B58C8C00B58C8C000000
      00000000000000000000000000000000000000000000000000000000000016B2
      F900A2FEFF0088FFFF0080A78000008A0000008F00003774370074FFFF0056ED
      FD00C3CBD0000000000000000000000000000000000000000000C4E4BD002AE9
      120021E00E0011D4070006CA030002C7010025A36F0008F5FF000BF4FF0007F5
      FF0022969A00000000000000000000000000000000000000000000000000FDFB
      F900EC8D2600E37E1000BF905D00E1C19F00BB6C1400C2660200B8762D00C38C
      5000D8A06300DCCCBB00FDFDFD000000000000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B58C8C00EFB56B00C68C7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FBFBFB0019BCFD0074FFFF0080A78000FDFDFD0016AAF4006BEBFC00E4E5
      E50000000000000000000000000000000000000000000000000000000000BFE3
      B7002CE5120027E510001EDE0D0018D90A0034B86C0017F8FF0013F9FF00339D
      9200FDFDFD00000000000000000000000000000000000000000000000000FDFB
      F900EBB17000FDA84A00FC9B3000FA8D1500F2810500E2760000B59C8200FEFE
      FE000000000000000000000000000000000000000000B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C00BD84840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E3E9EC00EDEDED000000000000000000FDFDFD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F6FBF5007DD16C0030DA190025DF100037BD5E003BBA9900BDD0BE000000
      000000000000000000000000000000000000000000000000000000000000FEFD
      FD00EAD0B500E1BE9700D19B6000CF822D00CF6F0600CC6C0100CEBEAD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000032000006640000076500000022000000000000000000000000000000
      00000000000000000C0000003A0000003F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000566000005666000056670000566000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000036400003DDB000058ED000136C4000000000000000000000000000000
      0100000253000020B800003AD800002ECB0000003B0000000000000000000000
      0000000007000000360000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000056630000569D510056B8630057963A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFEFEF00D3D3D300F5F5F5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      43000024BA000056ED000066F5001E69E9000000000000000000000000000007
      6B000039D7000052E900005CEF000058ED000024BB0000002000000000000000
      000000035D001E40C60000002600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005660
      00005684300056B6630056C66B0074C95F0000000000FCFCFC00FBFBFB000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D7D7D70089898900BDBDBD00999999000000000000000000000000000000
      0000000033000000090000000400000000000000000000000000000056000013
      9800005BEF000066F5000C6BF5002038B100000000000000000000001B00001B
      B4000044E2000061F2000065F4000065F400005AEE0000129500000006000000
      23000029C3001870F4002F49B900000015000000000000000000000000000000
      0000566000005660000056600000000000000000000000000000566000005673
      0E0056BB650056C66B0062CB6B0076982700ECECEC008A8A8A007D7D7D00C9C9
      C900F7F7F7000000000000000000FBFBFB00F3F3F300F4F4F400FBFBFB00C3C3
      C30069696900989898008D8D8D008F8F8F00000000000000000000002E000004
      4700001B9900002EB600001B960001064F000000080000003D0000139100005F
      F0000066F5000B66F00010249A0000002A000000000000000000000000000000
      1D00001090000042DE000062F2000065F4000065F4000048DF00000153000013
      99000055EB000065F400418EF900131E84000000000000000000566000005664
      0000567B0F00568E2C00567B0C005766000056600000566000005673070056BF
      660056C66B0061C666006684100056600000AAAAAA009A9A9A00C9C9C9007171
      71006D6D6D00CBCBCB00C5CBCE00438AB1001C7EB7002670A200727E87007373
      7300BCBCBC00C7C7C70080808000F1F1F100000000000000460000138E000558
      E7003E71D800587ED0001F65E1000360EF000C219A0000119200005EEF000468
      F5001C5BDD00080E6A0000002C00000000000000000000000000000000000000
      000000000800000879000042DC000064F3000065F4000064F3000027C1000048
      E2000065F4000065F4004786EF0003054B000000000056600000567304005BB8
      5D0094D14E00AEDE460075C5570059C06500628110005671080056BE65005AC8
      6B0072BB53005E6E00005660000000000000E3E3E300A6A6A600C3C3C300CDCD
      CD00A2A2A2006E6E6F002968850013B7F70005B6FD002699CF00797B7C00C8C8
      C800BABABA008A8A8A00F8F8F8000000000000001E00000B75001460E400CCB8
      AD00FBCD9B00F6D1A300E9D4AC006D8ECA000C69F300235BE0001A65E800162B
      9D0002035B0000002A0000000000000000000000000000000000000000000000
      0000000000000000020000097E00004AE2000065F4000065F400005DF0000063
      F3000065F4002A80F8002235A5000000070056600000566B00006AC05A00FFFF
      2300FFFF1100FFFF1900FFFF2200C3EE400062C9690079BB560070C55E006C8B
      13005863000056600000000000000000000000000000F9F9F900C1C1C100A0A0
      A000CBCBCB00CCCCCC009F9F9F006CABC30049CBFD005AA0B900D0D0D000ADAE
      AF007E808500FAFAFA00000000000000000000013F000244D600B9AAAF00F9CF
      9E00F0D4A800E6D9B100DDDDBB00D2E1C5002D70DE00246BE900030443000000
      1C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000800001198000059EE000065F4000065F4000065
      F400116FF5004169D60000002900000000005661000058A44C00FFFF2500FFFF
      1400FFFF1E00FFFF2700FFFF3100FFFF3B0083D054007ACB5F00596400005660
      000000000000000000000000000000000000000000000000000000000000F9F9
      F900B1C4CD0094A3A900BCBEBF009DD4E8007FDBFD003DC5F6005AA8C500209C
      D6004A647E00FBFBFB000000000000000000020557002165E300F3D6AD00EAD6
      AE00E0DBB700D7E0C100D3E6CC00F2F8E20089B4DC001571F6000B1262000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000264000040DA000065F4000065F4000A6B
      F5004A83EA000508540000000000000000005865000077C55900FFFF2300FFFF
      2400FFFF2D00FFFF3700FFFF4200FFFF5800DFFF52006BD16C00617200000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D8EAF30071D3F900EEF7FA00CFF0FD00A6E6FD0055D2FD0026C3FD0003B3
      FB0030517100D5D5D500FAFAFA0000000000091275003272E100FDF7D300F4F0
      CF00D7E4C900D3EBD400F9FBEA00FFFEF300A5CCEB001471F700141F81000000
      0900000000000000000000000000000000000000000000000000000000000000
      0000000000000000020000056200003BD5000061F2000065F4000064F4004985
      ED000B116D000000000000000000000000005F72000088D25700FFFF4900FFFF
      4500FFFF3F00FFFF4A00FFFF6000FFFF6900FBFF61006AD16D006A7F00005660
      0000000000000000000000000000000000000000000000000000000000000000
      0000D5D8D90044B7EA00F2FBFD00F4FBFD00D4F2FD0086DEFD0032C7FD0006A7
      E90069768500676767007C7C7C00D9D9D900070B6A00296FE800F7F6D900FFFC
      E300FEFEEB00FEFFF200FFFFF700FFFFFC0079ADEA001B77F700111976000000
      0700000000000000000000000000000000000000000000000000000000000000
      000000001100000B8400004BE1000065F4000065F4001774F6000065F4002E57
      D10000000A000000000000000000000000005D6B00007FCF5E00FFFF4F00FFFF
      5900FFFF6100FFFF6800FFFF6D00FFFF7200CFFF600071D76D00677900005660
      000000000000000000000000000000000000000000000000000000000000C7C7
      C7006E6E6E0076A8C1007DD2F400EAF9FD00F5FBFD00D4F2FD0076D2F6002D69
      9300CDCECF00C5C5C5009898980063636300020360002065E600A9C3DB00FFFF
      F100FFFFF600FFFFFB00FFFFFE00EFF6FC001A6AEB003F84F000030549000000
      0000000000000000000000000000000000000000000000000000000000000000
      37000023B300005CEE000065F4000E6DF500428CF6003154CC000060F000254F
      CE00000009000000000000000000000000005863000076C55C00FFFF5100FFFF
      6700FFFF6C00FFFF7100FFFF7400FFFF720070CA610095E46600596500000000
      0000000000000000000000000000000000000000000000000000D3D3D3007676
      7600BBBBBB00C9C9C900678392004C9CC40048A4D100398CB800728DA100E7E8
      E800B3B3B300A6A6A600D2D2D200A4A4A4000000360017289B001E71F000ACCE
      EB00F5FBFB00FBFCFE00DCEDF9003C7FE8001E78F7002B44B400000025000000
      0000000000000000000000000000000000000000000000001B00000F7F000049
      DC000267F4002079F7003A7EED003555C800090F690000002C00003ED2001D3F
      BC0000000100000000000000000000000000566000006D88110074D16600FFFF
      6100FFFF7100FFFF7400FFFF6F0092DF5E0074D86D0081A42A00566000000000
      0000000000000000000000000000000000000000000000000000BBBBBB00C6C6
      C600BDBDBD008E8E8E00F6F6F600FDFDFD00F9F9F900FBFBFB00000000000000
      000000000000F4F4F400C5C5C500D3D3D30000000000000152002E4DC3002076
      F5001668EC001A61E7000A65F0002A80F8004066D10001023300000000000000
      00000000000000000000000000000000000000005A00000FA700073ACA001740
      C700223AAB00111A7B000000440000000E000000000000000000001A99001124
      900000000000000000000000000000000000000000005661000084AD390076D6
      6B006CC8620070C15D0060C5660080E06E0096C6470057620000000000000000
      0000000000000000000000000000000000000000000000000000F7F7F700B8B8
      B800B7B7B700FBFBFB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000010143001723
      9700416CDA00487EE7004877E0001C2C9B000101440000000000000000000000
      0000000000000000000000000000000000000000030000000300000003000000
      0200000000000000000000000000000000000000000000000000000253000204
      5500000000000000000000000000000000000000000000000000576100006D83
      0D0097CC50009EDE5D009ED75600728C11005761000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      4C0000014A0002038B0001015500000028000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000011000000
      1300000000000000000000000000000000000000000000000000000000005660
      0000566100005863010057610000566000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000704A000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004D320100A67625004F350400110B00000000160000014B0000038A000005
      8C0000036E0000002A0000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F560D00DA9F6100B07A410048314500001FAB000042D7000153E5000140
      D000000E90000000600000008000000000000000000000000000FFFFFF0000BF
      BF00C0C0C00000BFBF0080808000000000008080800000BFBF00C0C0C00000BF
      BF00808080000000000000000000000000000000000000000000FFFFFF0000BF
      BF00C0C0C00000BFBF0080808000000000008080800000BFBF00C0C0C00000BF
      BF00808080000000000000000000000000000000000000000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000003923
      0000BC894100AD743B003F327A00014DE2000064F3000D64EC00444794004630
      1F0034230500724D040021160000000000000000000000000000FFFFFF00C0C0
      C00000BFBF00C0C0C000808080000000000080808000C0C0C00000BFBF00C0C0
      C000808080000000000000000000000000000000000000000000FFFFFF00C0C0
      C00000BFBF00C0C0C000808080000000000080808000C0C0C00000BFBF00C0C0
      C00080808000000000000000000000000000000000000000000084000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000000000000000000007953
      1100CE9559006D495600014CE1000066F500146BEF0077649500EEB78100F2BD
      8600EDB98200DBB17F004B320300000000000000000000000000FFFFFF0000BF
      BF00C0C0C00000BFBF0080808000000000008080800000BFBF00C0C0C00000BF
      BF00808080000000000000000000000000000000000000000000FFFFFF0000BF
      BF00C0C0C00000BFBF0080808000000000008080800000BFBF00C0C0C00000BF
      BF0080808000000000000000000000000000000000000000000084000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00840000000000000000000000000000000000000035200100C28C
      4D00B0784200192DA7000063F3000669F5004855B500EEB88300F3BD8700F6C0
      8B00F7C59100CC9F6D00593C0500000000000000000000000000FFFFFF00C0C0
      C00000BFBF00C0C0C000000000000000000000000000C0C0C00000BFBF00C0C0
      C000808080000000000000000000000000000000000000000000FFFFFF00C0C0
      C00000BFBF00C0C0C000000000000000000000000000C0C0C00000BFBF00C0C0
      C00080808000000000000000000000000000000000000000000084000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00840000000000000000000000000000003D290100AA7A35003F2F
      7B004E3972000242D8000065F4002979F200AC8E9E00F6C28F00F7C28D00F9C5
      9000F9CEA700BA874A0055390300000000000000000000000000FFFFFF0000BF
      BF00C0C0C00000BFBF00C0C0C00000BFBF00C0C0C00000BFBF00C0C0C00000BF
      BF00808080000000000000000000000000000000000000000000FFFFFF0000BF
      BF00C0C0C00000BFBF00C0C0C00000BFBF00C0C0C00000BFBF00C0C0C00000BF
      BF0080808000000000000000000000000000000000000000000084000000FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF0084000000000000000000000069450100AE7F3600E3AB72003130
      8F000055EB00005CEF000165F4004783EB00856E9200E2BFB000FED6B400FED7
      B600EBC8A800B685450034220000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00808080000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080808000000000000000000000000000000000000000000084000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000004E340200D5A66800F1BD8A007859
      72000057EB000066F5000065F4001472F6005089ED00665DAE00FCD8BC00FFDB
      BF00D3AB8200AC803F006A450000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084000000FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00840000000000000000000000000000003F2A0100C89C5F00D3AF
      9A00063CCD000065F4000568F4004177E3009D8BB500FDDBC200FEDCC300FEDD
      C700C69665009B7333003F280000000000000000000000000000000000000000
      0000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C0000000000000000000000000000000000000000000C0C0C0000000
      000000000000000000000000000000000000000000000000000084000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00840000000000000000000000000000001A11000064450C00BE90
      5500433C85000063F2002D67DF00B9A3BC00FEDEC700FFDFC900FFDFCB00FBDF
      CD00BF8B56008C682F0000000000000000000000000000000000000000000000
      0000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C0000000000080808000000000008080800000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000003C27
      0200835E2B000C36B90082616E00CEA37900F1D5BE00FDE2D000FEE2D200F1D9
      C500C28E5B008A682F0000000000000000000000000000000000000000000000
      0000C0C0C0000000000080808000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000C0C0C000000000000000000000000000C0C0C000808080000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      00003A26000026192300A47B3900C89A6700C38E5C00C89A6C00DFC1A200E1C4
      A800C5915E00B3863A0000000000000000000000000000000000000000000000
      000080808000C0C0C000000000000000000000000000C0C0C000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080808000C0C0C000C0C0C000C0C0C00080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000392600005438040084612500BE935B00CB9B6C00C795
      6400C79464009672350000000000000000000000000000000000000000000000
      00000000000080808000C0C0C000C0C0C000C0C0C00080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000332101005D3F05007051
      1C009B773A007A591A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000362300005F3F00000000000000000000C0C0C00000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001E701C00267423002D7A2B00337D
      3100388036003B8339003D843B003E843C003E843C003D843B003B8239003881
      3600337E31002E7A2C0027752400257422000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C00080808000C0C0C000FFFF
      FF00FFFFFF00C0C0C000C0C0C00000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      00000000000000000000000000000000000020711D003A80380082A27E0082A2
      7E0087A482008FAB8B0095AF920090AB8C0088A7840086A5820087A584008DAA
      880090AB8D0082A27E00497A44002474220000000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD0000000000C0C0C00080808000C0C0C000FFFF
      FF00FFFFFF00C0C0C00080008000800080008000800080008000800080008000
      800080008000C0C0C000C0C0C000C0C0C0000000000000000000800000008000
      00008000000000000000C0C0C000C0C0C0008080800000000000800000008000
      00008000000000000000000000000000000021701E00488A46009DB49A006092
      5D005D935A0093B69100E1E7DF00BCCABA006D976900598F56005E945B0087AE
      8600DFE5DD00C3CFC1005B8255002374210000000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD0000000000C0C0C00080808000C0C0C000FFFF
      FF00FFFFFF00C0C0C000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00800080000000000000000000000000000000000000000000808000008080
      000000000000C0C0C000C0C0C000C0C0C000C0C0C00080808000000000008080
      0000808000000000000000000000000000001F6F1C00498B4800C3CFC10090A9
      8C0050894D0099B69600E0E5DF00BFCBBC00648A5E00378035004D8C4B00C7D4
      C500F1F3F100C9D4C7005982540022731F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C00080808000C0C0C000FFFF
      FF00FFFFFF00C0C0C000C0C0C00000000000FFFFFF00FFFFFF00FFFFFF00FF00
      FF0080008000FFFFFF00FFFFFF00000000000000000000000000808000000000
      00008080800080808000C0C0C000C0C0C000C0C0C00080808000808080000000
      0000808000000000000000000000000000001C6E1900488B4700DFE3DD00D8DF
      D600A2B6A00061935F009EBA9C009EB19A00457F4100327D300080A87E00EBEE
      EA00F8F9F800C9D3C700567F51001F711C0000000000FFFFFF00BDBDBD00FFFF
      FF00BDBDBD00FFFFFF00BDBDBD00FFFFFF00BDBDBD00FFFFFF00BDBDBD00FFFF
      FF00BDBDBD00FFFFFF00BDBDBD0000000000C0C0C00080808000C0C0C000FFFF
      FF00FFFFFF00C0C0C000C0C0C00000000000FFFFFF00FFFFFF00FFFFFF00FF00
      FF0080008000FFFFFF00FFFFFF0000000000000000000000000000000000C0C0
      C000FF00FF000000FF0080808000C0C0C000808080000000FF000000FF008080
      800000000000000000000000000000000000186B150044894300E4E9E300F7F8
      F700DFE5DE00A9BBA5005C8D590054844F002C772A0039813700C0CFBE00F6F7
      F600FAFAFA00C8D2C500537D4D001B6E180000000000BDBDBD00FFFFFF00BDBD
      BD00FFFFFF00BDBDBD00FFFFFF00BDBDBD00FFFFFF00BDBDBD00FFFFFF00BDBD
      BD00FFFFFF000000FF00FFFFFF0000000000C0C0C00080808000C0C0C000FFFF
      FF00FFFFFF00C0C0C000C0C0C00000000000FFFFFF00FFFFFF00FFFFFF00FF00
      FF0080008000FFFFFF00FFFFFF00000000000000000000000000C0C0C000C0C0
      C000C0C0C000FF00FF000000FF00808080000000FF000000FF00C0C0C000C0C0
      C000808080000000000000000000000000001468110040863E00E3E7E200FCFC
      FC00FAFBFA00DAE0D8008CA3870032732E00227220005D945B00E2E7E000FCFC
      FC00FBFBFB00C7D2C500507A4A00166B130000000000FFFFFF00BDBDBD00FFFF
      FF00BDBDBD00FFFFFF00BDBDBD00FFFFFF00BDBDBD00FFFFFF00BDBDBD00FFFF
      FF00BDBDBD00FFFFFF00BDBDBD0000000000C0C0C0000000000080808000C0C0
      C00080808000808080008080800000000000FFFFFF008000000000008000FF00
      FF008000800080008000800000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000FF00FF000000FF000000FF00C0C0C000C0C0C000C0C0
      C000C0C0C0008080800000000000000000000F650C003D843B00E4E8E300FCFC
      FC00FCFCFC00DBE2DA007D9978002C7529002A7728006C9A6900D5DDD400F7F8
      F700FAFBFA00C8D2C600547E4E0012690F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C000C0C0C0008080800000000000FFFFFF0080000000FF00
      FF00FF00FF0080000000FFFFFF000000000000000000FFFFFF00C0C0C000C0C0
      C000C0C0C000808080000000FF000000FF000000FF0080808000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000B6308003A833900E5E9E400FCFC
      FC00F8F9F800BAC7B60058835200317C2F004D8B4A0072986E007CA57A00D4DE
      D400F1F3F000CAD4C800598354000E670B000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000C0C0C000C0C0C000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008000
      000080000000FFFFFF00FFFFFF00000000000000000000000000FFFFFF00C0C0
      C000808080000000FF000000FF00C0C0C000FF00FF000000FF0080808000C0C0
      C000C0C0C0000000000000000000000000000962060039823700E5E9E500F8F9
      F800E4E9E20091A88D004783430040863E0097B49400BCC9B8007A9E760076A3
      7400CCD6CA00C7D1C40061885C000C6609000000000000000000000000000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000000000000000000000000000C0C0C000C0C0C000C0C0C000FFFF
      FF00C0C0C0000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      FF000000FF000000FF00C0C0C000C0C0C000C0C0C000FF00FF000000FF00C0C0
      C000000000000000000000000000000000000861050039823700E7EAE600F3F5
      F300BBC8B800688E63004889460052915000B6C9B400DEE5DE00A0B49C005B90
      58006EA06B00AFC2AC006B9165000B6508000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000808000000000
      0000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000808000000000000000000000000000000861050039833800E8ECE700F3F5
      F300BFCCBD0084A5800080A27D0090AD8C00BDCEBB00E9ECE800B9C7B60088A7
      850092B08F00ABC1A90073976E000B6508000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008080000080800000000000000000000000000000808000008080
      000000000000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000000000008080
      000080800000000000000000000000000000086105003A833900E9ECE800F6F7
      F600EFF1EE00E7EBE600E6EAE500E9EDE800F0F2F000F7F8F600EFF2EF00E6EA
      E600E7EBE600CED7CB007A9C75000B6508000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C0C0C0000000000000000000FFFF0000FFFF
      0000FFFF000000000000FFFFFF00C0C0C000C0C0C00000000000FFFF0000FFFF
      0000FFFF000000000000000000000000000008610500367F3400D4DBD200D7DF
      D500D5DED400D4DCD300D4DDD300D4DDD400D5DCD300D4DDD400D5DDD300D4DC
      D400D4DDD200C4CFC10081A37D000B6508000000000000000000000000000000
      0000FFFFFF0000000000BDBDBD00FFFFFF0000000000FFFFFF00000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C000C0C0C0000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000560020010670D002E782B002E79
      2B002E782B002E782B002E782B002E782B002E782B002E782B002E782B002E78
      2B002E782B002C7729001E6E1C000B6408000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      000000000000C0C0C000C0C0C000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000460020005610300066104000661
      0400066104000661040006610400066104000661040006610400066104000661
      04000661040006610400056103000A6307000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FF00
      FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF00000080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF0000000000FFB56B00FFB56B00FFB56B00FFB5
      6B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB5
      6B00FFB56B00FFB56B00FFB56B00FFB56B000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF00000080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF0000000000FFB56B00FFFFFF00FFFFFF00FFB5
      6B00FFE7C600FFE7C600FFF7E700FFB56B00FFE7C600FFE7C600FFF7E700FFB5
      6B00FFE7C600FFE7C600FFF7E700FFB56B000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF00000080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF0000000000FFB56B00FFFFFF00FFFFFF00FFB5
      6B00FFE7C600FFE7C600FFF7E700FFB56B00FFE7C600FFE7C600FFF7E700FFB5
      6B00FFE7C600FFE7C600FFF7E700FFB56B000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF00000080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF0000000000FFB56B00FFFFFF00FFFFFF00FFB5
      6B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB5
      6B00FFB56B00FFB56B00FFB56B00FFB56B000000000080808000808080008080
      80000000FF000000FF000000FF000000FF000000FF000000FF00000080008080
      800080808000808080008080800080808000000000000000000000000000FFFF
      0000000000000000000000000000FFFF00000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF0000000000FFB56B00FFFFFF00FFFFFF00FFB5
      6B00FFE7C600FFE7C600FFF7E700FFB56B00FFE7C600FFE7C600FFF7E700FFB5
      6B00FFE7C600FFE7C600FFF7E700FFB56B000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF0080808000000000000000000000000000FFFF
      0000800000008080800000000000FFFF00008000000080808000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7A55A00F7A55A00F7A55A00F7A5
      5A00FFE7C600FFE7C600FFF7E700F7A55A00FFE7C600FFE7C600FFF7E700F7A5
      5A00FFE7C600FFE7C600FFF7E700F7A55A000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF0080808000000000000000000000000000FFFF
      0000FF000000FF0000008000000080808000FF000000FF000000800000008080
      800000000000000000000000000000000000FFFFFF00FFFFFF0000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFF
      FF00FFFFFF0000000000FFFFFF0000000000F7A55A00FFFFFF00FFFFFF00F7A5
      5A00F7A55A00F7A55A00F7A55A00F7A55A00F7A55A00F7A55A00F7A55A00F7A5
      5A00F7A55A00F7A55A00F7A55A00F7A55A000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF0080808000000000000000000000000000FFFF
      0000FF000000FF000000FF000000FFFF0000FF000000FF000000FF000000FFFF
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF0000000000F7A55A00FFFFFF00FFFFFF00F7A5
      5A00FFE7C600FFE7C600FFF7E700F7A55A00FFE7C600FFE7C600FFF7E700F7A5
      5A00FFE7C600FFE7C600FFF7E700F7A55A000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF0080808000000000000000000000000000FFFF
      0000FF000000FFFF000000000000FFFF0000FF000000FFFF0000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF0000000000EF9C2100FFFFFF00FFFFFF00EF9C
      2100FFE7C600FFE7C600FFF7E700EF9C2100FFE7C600FFE7C600FFF7E700EF9C
      2100FFE7C600FFE7C600FFF7E700EF9C21000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF0080808000000000000000000000000000FFFF
      0000000000000000000000000000FFFF00000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0000000000EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C21000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EF9C2100FFFFFF00FFFFFF00EF9C
      2100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EF9C2100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EF9C21000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF00000080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF0000000000EF9C2100FFFFFF00FFFFFF00EF9C
      2100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EF9C2100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EF9C21000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF00000080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C21000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF00000080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF00000080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000008181BC004F4F9B004D4D98004D4D
      96004D4D95004D4D93004D4D91004D4D91004C4C8C00A5A5A900ECECEC00F0F0
      F000F0F0F000F0F0F000F0F0F000F4F4F4004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000004D4DCF003131FD003030FE002E2E
      FE003232FE003232FE003232FE003232FE002423DD007656590085655E008362
      5D00805F5B007E5C5B007E5C5B00AAA7A7004A4A4A00A5A5A500527BC600527B
      C600FFFFFF00FFFFFF00A5A5A500FFFFFF00FFFFFF00FFFFFF00A5A5A500FFFF
      FF00FFFFFF00FFFFFF004A4A4A00000000000000000000000000000000000000
      00000000000000000000FFFFFF00C6C6C6008484840084848400000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000C6C6C600C6C6C60000000000000000000000
      0000000000000000FF0000000000000000009D9DE7000707F5001A1AFF001919
      FF001717FF000606FD000606FD000606FD001911BE00F8A23E00FCA63D00FCA6
      3D00FCA53D00FCA53D00DC802F009E9595004A4A4A00A5A5A50000F7FF00527B
      C600527BC600FFFFFF00A5A5A500FFFFFF00FFFFFF00FFFFFF00A5A5A500FFFF
      FF00FFFFFF00FFFFFF004A4A4A00000000000000000000000000000000000000
      00000000000000000000FFFFFF00C6C6C600C6C6C60084848400000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000C6C6C6008484840000000000000000000000
      00000000FF00000000000000000000000000ECECFA001414DE004F4FFF005050
      FF005050FF003B3BFC001B1BF6001111F30060337300FF870800FF8E0E00FF91
      0A00FF910A00FF910A00C2590B00BFBDBD004A4A4A00A5A5A50039A5FF0000F7
      FF00527BC600527BC600527BC600A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A5004A4A4A00000000000000000000000000000000000000
      00000000000000000000FFFFFF00C6C6C6008484840084848400000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF00000000000000000000000000C6C6C600C6C6C60000000000000000000000
      FF000000FF00000000000000000000000000000000008080E3005050F6008686
      FF008686FF008686FF008282FF00231FCF00E38B4100FF9B3300FF9B3300FF95
      2100FF8C0C00FE89080091432700E6E6E6004A4A4A00A5A5A500A5A5A50039A5
      FF0094FFFF0000F7FF00527BC600527BC600FFFFFF00FFFFFF00A5A5A500FFFF
      FF00FFFFFF00FFFFFF004A4A4A00000000000000000000000000000000000000
      00000000000000000000FFFFFF00C6C6C600C6C6C60084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000C6C6C60084848400000000000000FF000000
      FF000000000000000000000000000000000000000000FAFAFD005353D8005D5D
      F0009B9BFC009090FB002E2ED7008D677A00F9A54E00FFBC7600FFBC7600FFBC
      7600FFBC7400DE7B2900A99C9900FDFDFD004A4A4A00527BC600527BC600527B
      C600527BC60094FFFF0000F7FF00527BC600527BC600FFFFFF00A5A5A500FFFF
      FF00FFFFFF00FFFFFF004A4A4A00000000000000000000000000000000000000
      00000000000000000000FFFFFF00C6C6C6008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000C6C6C600C6C6C6000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000E6E6E700636F
      A0001131B800253AA10086899900D2D1D000C4835300F8BB7D00FFE0BF00FEDB
      B600E69855009E786B00F7F7F700000000004A4A4A0039A5FF0094FFFF0000F7
      FF0000F7FF0000F7FF0000F7FF0000F7FF00527BC600527BC600A5A5A500A5A5
      A500A5A5A500A5A5A5004A4A4A00000000000000000000000000000000000000
      00000000000000000000FFFFFF00C6C6C600C6C6C60084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF00FFFFFF00C6C6C6000000FF000000FF00000000000000
      00000000000000000000000000000000000000000000E1E2E3004585BB0082BE
      F0009ED3FD0093CAF7005091CA0063748400CBCAC9009F87790097654500905E
      420092847E00DCDCDC00FBFBFB00000000004A4A4A00A5A5A50039A5FF0094FF
      FF0000F7FF00527BC600527BC600FFFFFF00FFFFFF00FFFFFF00A5A5A500FFFF
      FF00FFFFFF00FFFFFF004A4A4A00000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00C6C6C60084848400C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF00C6C6C60084848400C6C6C6000000
      000000000000000000000000000000000000F7F7F7004D8FC50087C8FD008BCB
      FF008BCBFF008BCBFF008ACBFF004E94D3003B709E006AABE1008AC3F10082BC
      EC004180B7006F7B8700D9D9D900FDFDFD004A4A4A004A4A4A004A4A4A0039A5
      FF0094FFFF0000F7FF00527BC600527BC6004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C60084848400C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000FF000000FF000000FF0084848400C6C6C600848484008484
      8400000000000000000000000000000000005787B500128BD8003C99E40068AE
      F2007FC1FE006FB8FF006EB7FF0067B2FA0057A1DF008ECDFF008ECDFF008ECD
      FF008DCDFE004A91CD0091959900F3F3F3004A4A4A00EF9C2100EF9C210039A5
      FF0094FFFF0000F7FF0000F7FF00527BC600527BC600EF9C2100EF9C2100EF9C
      2100EF9C2100EF9C21004A4A4A0000000000000000000000000000000000FFFF
      FF00FFFFFF00C6C6C600FFFFFF00C6C6C60084848400C6C6C600848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      FF000000FF00FFFFFF00C6C6C600C6C6C6000000FF0084848400C6C6C6008484
      8400848484000000000000000000000000000089DA0008E0FF000ADEFE000AC9
      F3002691DB0089BFF50081BFFF0067B0FD003177BA0075B2EC007DC1FE0072BB
      FF0072BBFF006DB7FB00506F8C00EAEAEA004A4A4A00EF9C2100EF9C2100EF9C
      210039A5FF0094FFFF0000F7FF0000F7FF00527BC600527BC600EF9C2100EF9C
      2100EF9C2100EF9C21004A4A4A00000000000000000000000000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C600C6C6C600C6C6C60084848400C6C6C6008484
      8400848484000000000000000000000000000000FF000000FF000000FF000000
      FF00FFFFFF00C6C6C600C6C6C600C6C6C6000000FF000000FF00848484008484
      8400848484000000000000000000000000002989DA0040DFFE004EE4FF004EE4
      FF004BE2FE002CB3EA004594DA005D9EE0000B609F0010528C00366195008BBD
      F00076B9FF0063AEFE00466E9400EEEEEE004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A0039A5FF0094FFFF0000F7FF0000F7FF00527BC600527BC6004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00C6C6C600C6C6C600C6C6C60084848400C6C6C600848484008484
      8400848484000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF00000000000000000000000000CADEF5003FAFEC0097EFFF0098EF
      FF0098EFFF0098EFFF008CEAFE000D92E200397FB5004689B3004183AE002354
      87005E7BA6007CAADC0072819000F3F3F3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C600C6C6C600C6C6C60084848400C6C6C6008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF00000000000000000000000000A3C7EE0064B0E900C7EF
      FC00D8F7FE00B3E8FD00349AE400296FB2008FB7D20090B8D20090B8D20090B8
      D20082ACC900134A82007B7F8B00FAFAFA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000E6EFFA0097BE
      EA0064A3E0008BB2DD00D8DBDF008EA6BA007599B500CEDFEA00D2E3ED00C7DB
      E8005684AB004E5F7C00F0F0F000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00C4D0DB003D648800305983002048
      7600989EA900F8F8F80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C6B63009C6B
      63009C6B63009C6B63009C6B63009C6B63009C6B63009C6B63009C6B63009C6B
      63009C6B63009C6B6300A56B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000031DE000031DE000000000000000000A5636B00A563
      6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B00A5636B0000000000000000000000000000000000AD73
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B58484000000000000000000000000009C736B00FFE7
      C600F7DEB500F7D6AD00F7D69C00F7CE9400EFC68400EFC68400EFC68400EFC6
      8400EFC68400EFC684009C6B630000000000000000000031DE000031DE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031DE000031DE00000000000000000000000000A5636B00FFEF
      C600C6CE9400D6CE9400EFCE9C00E7CE9400EFC68400EFBD8400EFBD7B00EFBD
      8400EFBD8400EFC68400A5636B0000000000000000000000000000000000AD73
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B58484000000000000000000000000009C736B00F7E7
      C600F7DEBD00F7D6AD00EFCEA500EFCE9C00EFC69400EFC68400EFBD7B00EFBD
      7B00EFBD7B00EFBD7B009C6B630000000000000000000031DE000031DE000031
      DE00000000000000000000000000000000000000000000000000000000000000
      00000031DE000031DE0000000000000000000000000000000000A5636B00FFEF
      CE009CBD7300299C21006BAD4A0021941000219410005AA53900CEB57300EFBD
      7B00EFBD7B00EFC68400A5636B0000000000000000000000000000000000AD73
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B58484000000000000000000000000009C736B00F7E7
      D600FFEFCE00F7DEBD00FFDEB500F7D6AD00EFCE9C00EFC69400EFC68400EFBD
      7B00EFBD7B00EFBD7B009C6B630000000000000000000031DE000031DE000031
      DE000031DE000000000000000000000000000000000000000000000000000031
      DE000031DE000000000000000000000000000000000000000000A5635A00FFEF
      DE00BDCE9C00108C08000084000000840000008400000084000029941800DEBD
      7B00EFBD7B00EFC68400A5636B0000000000000000000000000000000000AD73
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B5848400000000000000000000000000A5737300FFF7
      DE00948C8C00948C8C00948C8C00948C8C00E7C69C00EFCE9C00EFC69400EFC6
      8400EFBD7B00EFBD7B009C6B63000000000000000000000000000031EF000031
      DE000031DE000031DE00000000000000000000000000000000000031DE000031
      DE00000000000000000000000000000000000000000000000000A5635A00FFF7
      E700BDCE9C00189410000084000018941000ADBD730073AD4A000084000073AD
      4A00EFBD8400EFC68400A5636B0000000000000000000000000000000000AD73
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B5848400000000000000000000000000A57B7300FFFF
      F700313129006B7394001029A50021213900D6B58C00F7D6AD00EFCE9C00EFC6
      9400EFC68400EFBD7B009C6B6300000000000000000000000000000000000000
      00000031DE000031DE000031DE00000000000031DE000031DE000031DE000000
      0000000000000000000000000000000000000000000000000000A5736B00FFF7
      EF00BDD6A500088C0800008400000084000084B55A00EFCEA500A5B56B006BAD
      4A00EFC68C00EFC68400A5636B0000000000000000000000000000000000AD73
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B5848400000000000000000000000000AD847B00FFFF
      F70031313900637BE7007B94FF0010219C00DEC69C00FFDEB500EFCEA500EFCE
      9C00EFC69400EFC684009C6B6300000000000000000000000000000000000000
      0000000000000031DE000031E7000031E7000031E7000031DE00000000000000
      0000000000000000000000000000000000000000000000000000A5736B00FFFF
      FF00E7E7D600A5CE94009CC6840094BD73009CBD7300EFD6AD00EFCEA5009CC6
      7B00EFC69400EFC68C00A5636B0000000000000000000000000000000000AD73
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B5848400000000000000000000000000B58C7B00FFFF
      FF0042424200524A4A005A524A00182994006373D600C6B59C00F7D6B500EFCE
      A500EFCE9C00EFC694009C6B6300000000000000000000000000000000000000
      000000000000000000000031E7000031E7000031EF0000000000000000000000
      0000000000000000000000000000000000000000000000000000BD846B00FFFF
      FF00A5DEA500FFEFE700F7EFD6009CC6840094BD730094BD73009CBD7300EFCE
      A500EFCE9C00F7CE9400A5636B0000000000000000000000000000000000AD73
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B5848400000000000000000000000000BD8C7B00FFFF
      FF00FFFFFF00F7EFE700F7E7D600F7E7D600637BE700425AE700E7CEBD00F7D6
      AD00EFCEA500EFCE9C009C6B6300000000000000000000000000000000000000
      0000000000000031DE000031EF000031E7000031EF000031F700000000000000
      0000000000000000000000000000000000000000000000000000BD846B00FFFF
      FF0073C67300ADD6A500FFEFE70084C673000084000000840000088C0800EFD6
      AD00EFCEA500F7D6A500A5636B000000000000000000000000003184FF003184
      FF003184FF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700B5848400000000000000000000000000C6947B00FFFF
      FF00948C8C00948C8C00948C8C00948C8C00EFE7CE00C6BDDE00EFD6C600F7D6
      B500F7D6AD00E7C69C0094736B00000000000000000000000000000000000000
      00000031F7000031EF000031E70000000000000000000031F7000031F7000000
      0000000000000000000000000000000000000000000000000000D6946B00FFFF
      FF0084CE8400008400007BC67300ADD6A5001894180000840000108C0800F7D6
      B500F7D6AD00EFCEA500A5636B000000000000000000000000003184FF0042B5
      F7003184FF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00B5848400000000000000000000000000CE9C8400FFFF
      FF0031312900A5A5A5005263AD0029314200D6CEBD00FFF7DE00FFEFCE00F7E7
      C600DECEAD00B5A58C00846B6300000000000000000000000000000000000031
      FF000031EF000031F700000000000000000000000000000000000031FF000031
      F700000000000000000000000000000000000000000000000000D6946B00FFFF
      FF00F7F7EF0029A5290000840000008400000084000000840000108C0800FFEF
      CE00DECEB500B5AD9400A5636B00000000003184FF003184FF003184FF0042B5
      F7003184FF003184FF003184FF00E7E7E700E7E7E700E7E7E700E7E7E700B584
      7300B5948C00B58C8400B5848400000000000000000000000000CE9C8400FFFF
      FF0042424A007B94FF00426BFF0018297B00E7DEC600FFF7E700E7CEBD00A56B
      6B00A56B6B00A56B6B00A56B6B000000000000000000000000000031F7000031
      F7000031FF000000000000000000000000000000000000000000000000000031
      F7000031F7000000000000000000000000000000000000000000DE9C7300FFFF
      FF00FFFFFF00DEF7DE0063BD6300219C2100219C210073BD6B00299C2100946B
      5200A56B5A00A56B5A00A5636B00000000003184FF008CD6F700B5DEF700B5DE
      F700B5DEF7008CD6F7003184FF00DEDEDE00DEDEDE00DEDEDE00C6C6C600B584
      7300FFFFFF00FFFFFF00B5848400000000000000000000000000D6A58400FFFF
      FF0029292900636B84008C8C9C000821A500BDC6F700FFFFF700D6B5AD00A56B
      6B00E79C4A00E78C3100A56B6B0000000000000000000031F7000031F7000031
      F700000000000000000000000000000000000000000000000000000000000000
      0000000000000031F70000000000000000000000000000000000DE9C7300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DEF7DE00DEF7DE00FFFFF700ADB594008C6B
      5200E79C5200E78C3100B56B4A00000000003184FF003184FF003184FF00B5DE
      F7003184FF003184FF003184FF00D6D6D600D6D6D600D6D6D600C6C6C600B584
      7300FFFFFF00B584840000000000000000000000000000000000D6A58400FFFF
      FF00ADB5B50094949400949494008C9CC6004263FF009CB5FF00D6B5BD00A56B
      6B00F7AD5A00A56B6B0000000000000000000031F7000031F7000031F7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7AD7B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEC6C600A56B
      5A00FFB55A00BD7B5A00000000000000000000000000000000003184FF00B5DE
      F7003184FF00CECECE00CECECE00CECECE00CECECE00CECECE00C6C6C600B584
      7300B58484000000000000000000000000000000000000000000D6A58400F7EF
      E700FFFFF700FFFFF700FFFFF700FFF7EF00CECEEF005A73EF00B5A5B500A56B
      6B00A56B6B000000000000000000000000000031F7000031F700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7AD7B00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00DEC6C600A56B
      5A00BD846B0000000000000000000000000000000000000000003184FF003184
      FF003184FF00EFD6C600EFD6C600EFD6C600EFD6C600EFD6C600D6BDB500B584
      7300000000000000000000000000000000000000000000000000D6946B00D69C
      7B00D69C7B00D69C7B00CE947300C68C7300C68C7300C68C7300AD736B00A56B
      6B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7AD7B00D694
      6B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00A56B
      5A0000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000F00000000100010000000000800700000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF000000000003FFFF00000000
      0001800300000000000180010000000000018001000000000001800100000000
      0001800100000000000080000000000000000000000000000000000000000000
      0001000F000000000001000F0000000081C1000F00000000FC0101FF00000000
      FC0103FF00000000FF0DFFFF00000000FE3F000000000000FE1F000000000000
      FE0F000000000000FE0700000000000000030000000000000001000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00010000000000000003000000000000FE07000000000000FE0F000000000000
      FE1F000000000000FE3F0000000000000000F00FFC3FFC7F0000F00FF81FF87F
      0000F00FF00FF07F0000F00FE007E07F0000F00FC003C0000000F00F80018000
      0000F00F000000000000000000000000000000000000000000000000F00F0000
      00008001F00F80000000C003F00FC0000000E007F00FE07F0000F00FF00FF07F
      0000F81FF00FF87F0000FC3FF00FFC7FFC1F80038001F81FF80F00010000E007
      F00700010000C003E003000000008001C003000000008001C003000000000000
      F00F000000000000E007000000000000C003000000000000C003000000000000
      F00F000000000000F007000080018001E0030000E0078001C0030001F00FC003
      C0030001FC3FE007F81F8003FFFFF81FFFFFFFFFFDC7C001FFFFFFFFF003C001
      EFFFEFFFC001C001EFFFEFFF0001C001EC1FEC1F0001C001E01FE01F0001C001
      EC0FEC1F0001C001EF87EFFF8001C001EC07EC1FC003C001E003E01FE007C001
      EC03EC1FF00FC001EFE1EFFFF03FC00183E183FFF03FC00183F083FFF03FC003
      83F083FFE03FC007FFF9FFFFE07FC00F0000F007FFFFFFFF0000E003FFFFFFFF
      0000C001EFFFEFFF00008000EFFFEFFF00008000EC1FEC1F000003C0E01FE01F
      000003E0EC1FEC1F000003E0EFFFEFFF000003E0EC1FEC1F000001E0E01FE01F
      00008000EC1FEC1F00008000EFF7EFFF0000C00183F783FF0000C00383C183C1
      0000F00783F783C10000FC1FFFF7FFFFFFFF3DFF0000FFBCFFFF3CFF0000FF3C
      FFC00C7F0000FE30FFC0043F0000FC20FFC0001F0000F800FFC0800F0000F001
      0340C0070000E003033FE0070000E007001FE0070000E007033FE0430000C207
      0340F0010000800FFFC0F8000000001FFFC0FC000000003FFFC0FE000000007F
      FFC0FF00000000FFFFFFFE0F0000F07FF000C0018003FFFFF00080008003FFFF
      F0008000800300FFE0008000800300FFC0008000800300FF80008000800300FF
      800080008003001B80008000800300198000800080030000C0008000FFFF0019
      E0008000FFFF001BF0008000EFEF00FFF0008000CFE700FFF0018000838300FF
      F0038000CFE700FFF007C001EFEFFFFFF801FEFFF81F80FFF801FC3FE00F001F
      F801F80FC0070001F801E007C00300018001E003800300018001C00380010001
      8001C003000100018001C003000100018001C000000100018001800000010001
      80030001800100018007C00180010001801F800380030001801FE007C007E001
      803FF00FE007E00F807FFCDFF01FE01FFFF0F8FFFFF0FFFFFFF0E073FFF0FFF8
      FFE0E031FFE09FF0F1C0C000F1C00600C000E000C00000008001F00080010001
      0003F80000038003000FFC01000FE003001FFE03001FF001000FF807000FF000
      000FF007000FE000001FE007001FC000001F8007001FC038803F00CF803FC3FF
      C07F0FCFC07FFFFFE0FFFFCFE0FFFFFFFFFFFFFFFFFFFBFFC007C007FFFFF003
      80038003FFFFF00180038003C003E00180038003C003E00180038003C003C001
      80038003C003800180038003C003000180038003C0030001C007C007C0038001
      E3FFE38FC0038003E3FFE10FC003E003E10FE00FC003F003E00FF01FFFFFFC03
      F01FF83FFFFFFF83F83FFFFFFFFFFFF30000FEFF000080010000FC7F00000000
      0000800300000000000080030000000000008003000000000000800300000000
      00008003000000000000000100000000000000010000E007000080030000E007
      000080030000E007000080030000E007000080030000E00F000080030000E01F
      0000FC7F0000E03F0000FEFF0000E07F0000FFFFF81FFFFF0000FFFFF01FFFFF
      00000000F01FFFFF00000000F01FFFFF00000000F01FFFFF000000008000EEFF
      000000000000E23F000000000000E00F000000000000E00F000000000000E23F
      000000000000EEFF000000000001FFFF00000000F01FFFFF00000000F01FFFFF
      00000000F01FFFFF0000FFFFF01FFFFFFFFFFFFFFFFD00000001FFFFFC3B0000
      0001FC3F9C3B00000001FC3FDC3700000001FC3FCC2780000001FC3FEC0F8000
      0001FC3FF41FC0010001FC3FF81F80010001F81FF00F00000001F00FE0070000
      0001E007C00300000001C003000300000001C00300030000FFFFC003FFE38000
      FFFFFFFFFFF1C001FFFFFFFFFFFDFE03FFFFC001FFFCC001E001C0019FF9C001
      E001C0018FF3C001E001C00187E7C001E001C001C3CFC001E001C001F11FC001
      E001C001F83FC001E001C001FC7FC001E001C001F83FC001C001C001F19FC001
      C001C001E3CFC0010001C001C7E7C0010001C0018FFBC0010003C0031FFFC003
      C007C0073FFFC007C00FC00FFFFFC00F00000000000000000000000000000000
      000000000000}
  end
  object SpGenTmpTable: TMSStoredProc
    StoredProcName = 'sp_gen_tmp_table;1'
    SQLUpdate.Strings = (
      'begin'
      ' print 1'
      'end')
    Connection = DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL sp_gen_tmp_table;1(:p_sql_string)}')
    Options.StrictUpdate = False
    Options.EnableBCD = True
    Left = 620
    Top = 306
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = 'p_sql_string'
        ParamType = ptInput
        Size = 7000
        Value = nil
      end>
  end
  object quVidRashodGroup: TMSQuery
    Connection = DB
    SQL.Strings = (
      'select * '
      'from d_vidrash_Group')
    CachedUpdates = True
    Left = 620
    Top = 132
    object quVidRashodGroupid: TAutoIncField
      FieldName = 'id'
      Origin = 'BASE.d_vidrash_Group.id'
    end
    object quVidRashodGroupname: TStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      DisplayWidth = 30
      FieldName = 'name'
      Origin = 'BASE.d_vidrash_Group.name'
      FixedChar = True
      Size = 255
    end
    object quVidRashodGroupIsTrash: TBooleanField
      DisplayLabel = 'V'
      DisplayWidth = 3
      FieldName = 'IsTrash'
    end
  end
  object spAdd_session_params: TMSStoredProc
    StoredProcName = 'sp_Add_session_params'
    Connection = DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_Add_session_params (:p_UserNo, :p_owner' +
        '_name, :p_param_name, :p_param_value, :SPID)}')
    Options.EnableBCD = True
    Left = 522
    Top = 306
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'p_UserNo'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'p_owner_name'
        ParamType = ptInput
        Size = 1
        Value = nil
      end
      item
        DataType = ftString
        Name = 'p_param_name'
        ParamType = ptInput
        Size = 1
        Value = nil
      end
      item
        DataType = ftString
        Name = 'p_param_value'
        ParamType = ptInput
        Size = 1
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'SPID'
        ParamType = ptInput
        Value = nil
      end>
  end
  object spDel_session_params: TMSStoredProc
    StoredProcName = 'sp_del_session_params'
    Connection = DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_del_session_params (:p_UserNo, :p_owner' +
        '_name, :p_param_name, :p_param_value, :SPID)}')
    Left = 228
    Top = 306
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'p_UserNo'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'p_owner_name'
        ParamType = ptInput
        Size = 64
        Value = nil
      end
      item
        DataType = ftString
        Name = 'p_param_name'
        ParamType = ptInput
        Size = 64
        Value = nil
      end
      item
        DataType = ftString
        Name = 'p_param_value'
        ParamType = ptInput
        Size = 64
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'SPID'
        ParamType = ptInput
        Value = nil
      end>
  end
  object QFO1: TMSQuery
    Connection = DB
    Left = 522
    Top = 248
  end
  object ImageList_32_32: TImageList
    Height = 32
    Width = 32
    Left = 32
    Top = 132
    Bitmap = {
      494C010101000400100020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000002000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C001B0C
      0C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001B0C
      0C0009270900093409000C450C000E500E000E500E000C450C00093409000927
      09001B0C0C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001B0C0C000927
      09000B3D0B000F5A0F0014781400188B1800188B1800147814000F5A0F000B3D
      0B00092709001B0C0C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001B0C0C00092709000B3D
      0B00126A12001A9A1A0023C7230033DB330033DB330023C723001A9A1A00126A
      12000B3D0B00092709001B0C0C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001B0C0C001B0C0C00073307000F5A
      0F001A9A1A0029D9290059EA59006DF96D006DF96D0059EA590029D929001A9A
      1A000F5A0F00073307001B0C0C001B0C0C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001B0C0C001B0C0C001B0C0C000B410B001478
      140023C7230059EA59008AFE8A00A2FFA200A2FFA2008AFE8A0059EA590023C7
      2300147814000B410B001B0C0C001B0C0C001B0C0C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001B0C0C001B0C0C001B0C0C001B0C0C000D4A0D00188B
      180033DB33006DF96D00A2FFA200A8FFA800A8FFA800A2FFA2006DF96D0033DB
      3300188B18000D4A0D001B0C0C001B0C0C001B0C0C001B0C0C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C000D4A0D00188B
      180033DB33006DF96D00A2FFA200A8FFA800A8FFA800A2FFA2006DF96D0033DB
      3300188B18000D4A0D001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C000B410B001478
      140023C7230059EA59008AFE8A00A2FFA200A2FFA2008AFE8A0059EA590023C7
      2300147814000B410B001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C001B0C
      0C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C00083208001059
      10001A9A1A0029D9290059EA59006DF96D006DF96D0059EA590029D929001A9A
      1A0010591000083208001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C001B0C
      0C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C00062706000A3C
      0A00116E1A0017AA350020E2550043EA730043EA730020E2550017AA3500116E
      1A000A3C0A00062706001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C001B0C
      0C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001B0C0C001B0C0C000032
      210001583A000292630002CB890003F3A40003F3A40002CB8900029263000158
      3A00003221001B0C0C001B0C0C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001B0C0C00002C2C00003C
      3C000065620000988F0000CDBC0000F0DB0000F0DB0000CDBC0000988F000065
      6200003C3C00002C2C001B0C0C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001B0C0C001B0C0C00003434000053
      53000086860000B9B90000E4E40000FCFC0000FCFC0000E4E40000B9B9000086
      860000535300003434001B0C0C001B0C0C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001B0C0C001B0C0C001B0C0C0000404000006B
      6B0000A9A90000E4E40014FFFF0024FFFF0024FFFF0014FFFF0000E4E40000A9
      A900006B6B00004040001B0C0C001B0C0C001B0C0C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001B0C0C001B0C0C001B0C0C001B0C0C0000474700007A
      7A0000C1C10000FCFC0024FFFF0028FFFF0028FFFF0024FFFF0000FCFC0000C1
      C100007A7A00004747001B0C0C001B0C0C001B0C0C001B0C0C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C0000474700007A
      7A0000C1C10000FCFC0024FFFF0028FFFF0028FFFF0024FFFF0000FCFC0000C1
      C100007A7A00004747001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C0000404000006B
      6B0000A9A90000E4E40014FFFF0024FFFF0024FFFF0014FFFF0000E4E40000A9
      A900006B6B00004040001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C001B0C
      0C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C00003434000053
      53000086860000B9B90000E4E40000FCFC0000FCFC0000E4E40000B9B9000086
      860000535300003434001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C001B0C
      0C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C00002C2C00003C
      3C00005D63000082920000A3C10000BAE00000BAE00000A3C10000829200005D
      6300003C3C00002C2C001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C001B0C
      0C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001B0C0C001B0C0C000018
      300000284F00003F7E000057AD000066CD000066CD000057AD00003F7E000028
      4F00001830001B0C0C001B0C0C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001B0C0C0000002C000000
      3C000006630000109200001EC1000025E0000025E000001EC100001092000006
      630000003C0000002C001B0C0C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001B0C0C001B0C0C00000034000000
      5300000086000000B9000000E4000000FC000000FC000000E4000000B9000000
      860000005300000034001B0C0C001B0C0C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001B0C0C001B0C0C001B0C0C00000040000000
      6B000000A9000000E4001414FF002424FF002424FF001414FF000000E4000000
      A90000006B00000040001B0C0C001B0C0C001B0C0C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001B0C0C001B0C0C001B0C0C001B0C0C00000047000000
      7A000000C1000000FC002424FF002828FF002828FF002424FF000000FC000000
      C10000007A00000047001B0C0C001B0C0C001B0C0C001B0C0C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C00000047000000
      7A000000C1000000FC002424FF002828FF002828FF002424FF000000FC000000
      C10000007A00000047001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C00000040000000
      6B000000A9000000E4001414FF002424FF002424FF001414FF000000E4000000
      A90000006B00000040001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C001B0C
      0C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C00000034000000
      5400000086000000B9000000E4000000FC000000FC000000E4000000B9000000
      860000005400000034001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C001B0C
      0C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C0000002D000000
      3D0000006000000086000000A9000000C1000000C1000000A900000086000000
      600000003D0000002D001B0C0C001B0C0C001B0C0C001B0C0C001B0C0C001B0C
      0C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001B0C0C000000
      2D000000400000005A000000750000008800000088000000750000005A000000
      400000002D001B0C0C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001B0C
      0C0000002F0000003A0000004C00000059000000590000004C0000003A000000
      2F001B0C0C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000200000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF000000000000000000000000
      FFF00FFF000000000000000000000000FFE007FF000000000000000000000000
      FFC003FF000000000000000000000000FF8001FF000000000000000000000000
      FF0000FF000000000000000000000000FE00007F000000000000000000000000
      FC00003F000000000000000000000000F800001F000000000000000000000000
      F000000F000000000000000000000000F000000F000000000000000000000000
      F000000F000000000000000000000000FF8001FF000000000000000000000000
      FF8001FF000000000000000000000000FF0000FF000000000000000000000000
      FE00007F000000000000000000000000FC00003F000000000000000000000000
      F800001F000000000000000000000000F000000F000000000000000000000000
      F000000F000000000000000000000000F000000F000000000000000000000000
      FF8001FF000000000000000000000000FF8001FF000000000000000000000000
      FF0000FF000000000000000000000000FE00007F000000000000000000000000
      FC00003F000000000000000000000000F800001F000000000000000000000000
      F000000F000000000000000000000000F000000F000000000000000000000000
      F000000F000000000000000000000000FFC003FF000000000000000000000000
      FFE007FF00000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object spclear_session_params: TMSStoredProc
    StoredProcName = 'sp_clear_session_params;1'
    Connection = DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL sp_clear_session_params;1(:spid)}')
    Options.EnableBCD = True
    Left = 32
    Top = 364
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'spid'
        ParamType = ptInput
        Value = nil
      end>
  end
  object quPost: TMSQuery
    Connection = DB
    SQL.Strings = (
      'select *'
      'from Post'
      'where Post.Trash=0 and Post.Visible=0'
      'and PostNO = Isnull( :PostNo ,PostNo)'
      'order by Name')
    Left = 326
    Top = 239
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
        Value = nil
      end>
  end
  object dsCategoryTT: TMSDataSource
    DataSet = quCategoryTT
    Left = 616
    Top = 24
  end
  object quCategoryTT: TMSQuery
    Connection = DB
    SQL.Strings = (
      'select CategoryName '
      ' from D_CategoryTT'
      '  where active = 1')
    Left = 616
    Top = 80
  end
  object spGetPrihodOrderNo: TMSStoredProc
    StoredProcName = 'GetPrihodOrderNo'
    Connection = DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL GetPrihodOrderNo }')
    Left = 32
    Top = 488
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end>
    object spGetPrihodOrderNoOrderNo: TIntegerField
      FieldName = 'OrderNo'
      ReadOnly = True
    end
  end
  object quSetupForExpedition: TMSQuery
    Connection = DB
    SQL.Strings = (
      'SELECT *'
      'FROM SetupForExpedition')
    CachedUpdates = True
    UpdateObject = UpdateSetupForExpedition
    BeforePost = quSetupForExpeditionBeforePost
    Left = 218
    Top = 190
    object quSetupForExpeditionDateBlock: TDateTimeField
      FieldName = 'DateBlock'
      Origin = 'SetupForExpedition.DateBlock'
    end
  end
  object UpdateSetupForExpedition: TMSUpdateSQL
    InsertSQL.Strings = (
      'insert into SetupForExpedition'
      '  (DateBlock)'
      'values'
      '  (:DateBlock)')
    DeleteSQL.Strings = (
      'delete from SetupForExpedition'
      'where'
      '  DateBlock = :OLD_DateBlock')
    ModifySQL.Strings = (
      'update SetupForExpedition'
      'set'
      '  DateBlock = :DateBlock'
      'where'
      '  DateBlock = :OLD_DateBlock')
    Left = 374
    Top = 426
  end
  object UpdateDeliveryOfGoods: TMSUpdateSQL
    InsertSQL.Strings = (
      'insert into DeliveryOfGoods'
      '  (DeliveryGoodsName, Visible, NoVisibleOfOtchetZero)'
      'values'
      '  (:DeliveryGoodsName, :Visible, :NoVisibleOfOtchetZero)')
    DeleteSQL.Strings = (
      'update DeliveryOfGoods'
      'set'
      '  Visible = 1'
      'where'
      '  DeliveryTovarNo = :OLD_DeliveryTovarNo')
    ModifySQL.Strings = (
      'update DeliveryOfGoods'
      'set'
      '   DeliveryGoodsName = :DeliveryGoodsName'
      '  ,Visible = :Visible'
      '  ,NoVisibleOfOtchetZero = :NoVisibleOfOtchetZero'
      'where'
      '  DeliveryTovarNo = :DeliveryTovarNo')
    Left = 796
    Top = 78
  end
  object dsDeliveryOfGoods: TDataSource
    DataSet = quDeliveryOfGoods
    Left = 800
    Top = 120
  end
  object quDeliveryOfGoods: TMSQuery
    SQLDelete.Strings = (
      'UPDATE DeliveryOfGoods'
      'SET'
      '  Visible = 1'
      'WHERE'
      '  DeliveryTovarNo = :DeliveryTovarNo')
    Connection = DB
    SQL.Strings = (
      'select   DeliveryTovarNo'
      '       , DeliveryGoodsName'
      '       , Visible'
      
        '       , isnull(NoVisibleOfOtchetZero,0) as NoVisibleOfOtchetZer' +
        'o'
      'from DeliveryOfGoods'
      '&_where'
      'order by &_order')
    UpdateObject = UpdateDeliveryOfGoods
    Left = 800
    Top = 32
    MacroData = <
      item
        Name = '_where'
      end
      item
        Name = '_order'
        Value = 'DeliveryTovarNo'
      end>
    object quDeliveryOfGoodsDeliveryTovarNo: TIntegerField
      FieldName = 'DeliveryTovarNo'
      ReadOnly = True
    end
    object quDeliveryOfGoodsDeliveryGoodsName: TStringField
      FieldName = 'DeliveryGoodsName'
      Size = 50
    end
    object quDeliveryOfGoodsVisible: TBooleanField
      FieldName = 'Visible'
    end
    object quDeliveryOfGoodsNoVisibleOfOtchetZero: TBooleanField
      FieldName = 'NoVisibleOfOtchetZero'
    end
  end
  object quClassifierABCDZ: TMSQuery
    SQLInsert.Strings = (
      'insert into ClassifierABCDZ (ClassifierName,Active) '
      'values (:ClassifierName,:Active)')
    SQLDelete.Strings = (
      'update ClassifierABCDZ'
      ' set Active = '#39'0'#39
      'where ClassifierNo = :ClassifierNo')
    SQLUpdate.Strings = (
      'update ClassifierABCDZ'
      ' set ClassifierName = :ClassifierName'
      '    ,Active = :Active'
      'where ClassifierNo = :ClassifierNo')
    Connection = DB
    SQL.Strings = (
      'Select * from ClassifierABCDZ')
    Left = 784
    Top = 216
    object quClassifierABCDZClassifierNo: TIntegerField
      FieldName = 'ClassifierNo'
    end
    object quClassifierABCDZClassifierName: TStringField
      FieldName = 'ClassifierName'
      Size = 50
    end
    object quClassifierABCDZActive: TFloatField
      FieldName = 'Active'
    end
  end
  object dsClassifierABCDZ: TMSDataSource
    DataSet = quClassifierABCDZ
    Left = 816
    Top = 216
  end
  object quBanks: TMSQuery
    SQLInsert.Strings = (
      'declare'
      '   @Cnt int'
      '  ,@Cnt1 int'
      '  ,@Pkey bigint'
      '  ,@Invoice_pkey bigint'
      ''
      'select @Cnt = count(*) from D_BANK where pkey = :Pkey'
      
        'select @Cnt1 = count(*) from D_BANK_INVOICE where pkey = :Invoic' +
        'e_pkey'
      ''
      'set @Pkey = -1 * Cast(Cast(Newid() AS BINARY(16)) AS BIGINT)'
      
        'set @Invoice_pkey = -1 * Cast(Cast(Newid() AS BINARY(16)) AS BIG' +
        'INT)'
      ''
      'if @Cnt = 0'
      ' insert into D_BANK (NAME,MFO,OKPO,PKEY)'
      '  values (:NAME,:MFO,:OKPO,@Pkey)'
      ''
      'if @Cnt1 = 0'
      
        ' insert into D_BANK_INVOICE (invoice_num,Bank_Name,Description,D' +
        'ate,SummaRest,IsMain,isActive,bank_pkey,pkey)'
      
        '  values (:invoice_num,:Name_Invoice,:Description,:Date,:SummaRe' +
        'st,:IsMain,1,@Pkey,@Invoice_pkey)')
    SQLDelete.Strings = (
      'declare'
      '   @Cnt int'
      '  ,@Cnt1 int'
      ''
      'select @Cnt = count(*) from D_BANK where pkey = :Pkey'
      
        'select @Cnt1 = count(*) from D_BANK_INVOICE where pkey = :Invoic' +
        'e_pkey'
      ''
      'if @Cnt = 1 and :Pkey is not null'
      ' delete D_BANK where pkey = :Pkey'
      'if @Cnt1 = 1 and :Invoice_pkey is not null'
      ' delete D_BANK_INVOICE where pkey = :Invoice_pkey')
    SQLUpdate.Strings = (
      'declare'
      '   @Cnt int'
      '  ,@Cnt1 int'
      '  ,@Pkey bigint'
      '  ,@Invoice_pkey bigint'
      ''
      'select @Cnt = count(*) from D_BANK where pkey = :Pkey'
      
        'select @Cnt1 = count(*) from D_BANK_INVOICE where pkey = :Invoic' +
        'e_pkey'
      ''
      'set @Pkey = -1 * Cast(Cast(Newid() AS BINARY(16)) AS BIGINT)'
      
        'set @Invoice_pkey = -1 * Cast(Cast(Newid() AS BINARY(16)) AS BIG' +
        'INT)'
      ''
      'if @Cnt = 0'
      ' insert into D_BANK (NAME,MFO,OKPO,PKEY)'
      '  values (:NAME,:MFO,:OKPO,@Pkey)'
      'else'
      ' update D_BANK'
      '  set NAME = :NAME'
      '     ,MFO = :MFO'
      '     ,OKPO = :OKPO'
      ' where PKEY = :Pkey'
      ''
      'if @Cnt1 = 0'
      
        ' insert into D_BANK_INVOICE (invoice_num,Bank_Name,Description,D' +
        'ate,SummaRest,IsMain,isActive,bank_pkey,pkey)'
      
        '  values (:invoice_num,:Name_Invoice,:Description,:Date,:SummaRe' +
        'st,:IsMain,1,@Pkey,@Invoice_pkey)'
      'else'
      ' update D_BANK_INVOICE'
      '  set invoice_num = :invoice_num'
      '     ,Bank_Name = :Name_Invoice'
      '     ,Description = :Description'
      '     ,Date = :Date'
      '     ,SummaRest = :SummaRest'
      '     ,IsMain = :IsMain'
      '     ,bank_pkey = :Pkey'
      '     ,isActive = :isActive'
      ' where pkey = :Invoice_pkey')
    Connection = DB
    SQL.Strings = (
      'select  db.NAME '
      '      , db.MFO'
      '      , db.OKPO'
      '      , dbi.id'
      '      , dbi.invoice_num'
      '      , dbi.Bank_Name as Name_Invoice'
      '      , dbi.Description'
      '      , dbi.Date'
      '      , dbi.SummaRest'
      '      , isnull(dbi.IsMain, 0) as IsMain'
      '      , isnull(dbi.isActive, 0) as isActive'
      '      , db.Pkey'
      '      , dbi.pkey as Invoice_pkey'
      '      '
      ' from D_BANK db left join'
      '      D_BANK_INVOICE dbi on dbi.bank_pkey = db.pkey')
    Left = 784
    Top = 288
    object quBanksNAME: TStringField
      FieldName = 'NAME'
      Size = 512
    end
    object quBanksMFO: TStringField
      FieldName = 'MFO'
      Size = 128
    end
    object quBanksOKPO: TStringField
      FieldName = 'OKPO'
      Size = 128
    end
    object quBanksid: TIntegerField
      FieldName = 'id'
      ReadOnly = True
    end
    object quBanksinvoice_num: TFloatField
      FieldName = 'invoice_num'
    end
    object quBanksName_Invoice: TStringField
      FieldName = 'Name_Invoice'
      Size = 512
    end
    object quBanksDescription: TStringField
      FieldName = 'Description'
      Size = 1024
    end
    object quBanksDate: TWideStringField
      FieldName = 'Date'
      Size = 10
    end
    object quBanksSummaRest: TFloatField
      FieldName = 'SummaRest'
    end
    object quBanksIsMain: TBooleanField
      FieldName = 'IsMain'
    end
    object quBanksPkey: TLargeintField
      FieldName = 'Pkey'
    end
    object quBanksInvoice_pkey: TLargeintField
      FieldName = 'Invoice_pkey'
    end
    object quBanksisActive: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'A'
      DisplayWidth = 3
      FieldName = 'isActive'
    end
  end
  object dsBanks: TMSDataSource
    DataSet = quBanks
    Left = 824
    Top = 288
  end
  object quKassa: TMSQuery
    SQLUpdate.Strings = (
      'update d_Kassa'
      ' set Date = :Date'
      '    ,SummaRest = :SummaRest'
      'where Name = :Name')
    Connection = DB
    SQL.Strings = (
      'select * from d_Kassa')
    Left = 784
    Top = 336
    object quKassaName: TStringField
      FieldName = 'Name'
      Size = 5
    end
    object quKassaDate: TWideStringField
      FieldName = 'Date'
      Size = 10
    end
    object quKassaSummaRest: TFloatField
      FieldName = 'SummaRest'
    end
  end
  object dsKassa: TMSDataSource
    DataSet = quKassa
    Left = 824
    Top = 336
  end
  object dsVidSotrudInPepsico: TMSDataSource
    DataSet = quVidSotrudInPepsico
    Left = 824
    Top = 384
  end
  object quVidSotrudInPepsico: TMSQuery
    Connection = DB
    SQL.Strings = (
      'select  Id'
      '       ,vsp.Level'
      '       ,vsp.LevelName'
      #9'   ,SubLevelAbb'
      #9'   ,Active'
      ' from VidSotrudInPepsico vsp'
      '&_where')
    UpdateObject = UpdateVidSotrudInPepsico
    Left = 787
    Top = 385
    MacroData = <
      item
        Name = '_where'
      end>
    object quVidSotrudInPepsicoLevel: TStringField
      DisplayLabel = #1059#1088#1086#1074#1077#1085#1100
      FieldName = 'Level'
      FixedChar = True
      Size = 2
    end
    object quVidSotrudInPepsicoLevelName: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1091#1088#1086#1074#1085#1103
      FieldName = 'LevelName'
      FixedChar = True
      Size = 50
    end
    object quVidSotrudInPepsicoSubLevelAbb: TStringField
      DisplayLabel = #1057#1086#1082#1088#1072#1097#1077#1085#1080#1077' '#1087#1086' '#1091#1088#1086#1074#1085#1102
      FieldName = 'SubLevelAbb'
      FixedChar = True
      Size = 10
    end
    object quVidSotrudInPepsicoActive: TBooleanField
      DisplayLabel = #1040#1082#1090#1080#1074#1077#1085
      FieldName = 'Active'
    end
    object quVidSotrudInPepsicoId: TIntegerField
      FieldName = 'Id'
      ReadOnly = True
    end
  end
  object UpdateVidSotrudInPepsico: TMSUpdateSQL
    InsertSQL.Strings = (
      
        'Insert into VidSotrudInPepsico (Level, LevelName, SubLevelAbb, A' +
        'ctive)'
      ' values (:Level, :LevelName, :SubLevelAbb, :Active)')
    DeleteSQL.Strings = (
      'update VidSotrudInPepsico'
      ' set Active = 0'
      'where Id = :Id')
    ModifySQL.Strings = (
      'update VidSotrudInPepsico'
      ' set  Level = :Level'
      '     ,LevelName = :LevelName'
      '     ,SubLevelAbb = :SubLevelAbb'
      '     ,Active = :Active'
      'where Id = :Id')
    Left = 864
    Top = 384
  end
  object quSalesChannelsOfPepsico: TMSQuery
    Connection = DB
    SQL.Strings = (
      'select  scop.Id'
      '       ,scop.Code'
      '       ,scop.ChannelL1'
      '       ,scop.ChannelL2'
      '       ,scop.ChannelL3'
      '       ,scop.ChannelL4'
      '       ,scop.Active'
      ' from SalesChannelsOfPepsico scop'
      '&_where')
    UpdateObject = UpdateSalesChannelsOfPepsico
    Left = 787
    Top = 430
    MacroData = <
      item
        Name = '_where'
      end>
    object quSalesChannelsOfPepsicoCode: TIntegerField
      FieldName = 'Code'
    end
    object quSalesChannelsOfPepsicoChannelL1: TStringField
      FieldName = 'ChannelL1'
      Size = 50
    end
    object quSalesChannelsOfPepsicoChannelL2: TStringField
      FieldName = 'ChannelL2'
      Size = 50
    end
    object quSalesChannelsOfPepsicoChannelL3: TStringField
      FieldName = 'ChannelL3'
      Size = 50
    end
    object quSalesChannelsOfPepsicoChannelL4: TStringField
      FieldName = 'ChannelL4'
      Size = 50
    end
    object quSalesChannelsOfPepsicoActive: TBooleanField
      FieldName = 'Active'
    end
    object quSalesChannelsOfPepsicoId: TIntegerField
      FieldName = 'Id'
      ReadOnly = True
    end
  end
  object dsSalesChannelsOfPepsico: TMSDataSource
    DataSet = quSalesChannelsOfPepsico
    Left = 824
    Top = 429
  end
  object UpdateSalesChannelsOfPepsico: TMSUpdateSQL
    InsertSQL.Strings = (
      
        'Insert into SalesChannelsOfPepsico (Code, ChannelL1, ChannelL2, ' +
        'ChannelL3, ChannelL4, Active)'
      
        ' values (:Code, :ChannelL1, :ChannelL2, :ChannelL3, :ChannelL4, ' +
        ':Active)')
    DeleteSQL.Strings = (
      'update SalesChannelsOfPepsico'
      ' set Active = 0'
      'where Id = :Id')
    ModifySQL.Strings = (
      'update SalesChannelsOfPepsico'
      ' set  Code = :Code'
      '     ,ChannelL1 = :ChannelL1'
      '     ,ChannelL2 = :ChannelL2'
      '     ,ChannelL3 = :ChannelL3'
      '     ,ChannelL4 = :ChannelL4'
      '     ,Active = :Active'
      'where Id = :Id')
    Left = 864
    Top = 429
  end
  object quKOATUU: TMSQuery
    Connection = DB
    SQL.Strings = (
      'select *'
      ' from KOATUUOfPepsico'
      '&_where')
    UpdateObject = UpdateKOATUU
    Left = 792
    Top = 480
    MacroData = <
      item
        Name = '_where'
      end>
    object quKOATUUKOATUU_ID_CODE: TStringField
      FieldName = 'KOATUU_ID_CODE'
      FixedChar = True
      Size = 12
    end
    object quKOATUUKOATUU_L1_Name_Rus: TStringField
      FieldName = 'KOATUU_L1_Name_Rus'
      FixedChar = True
      Size = 50
    end
    object quKOATUUKOATUU_L2_Name_Rus: TStringField
      FieldName = 'KOATUU_L2_Name_Rus'
      FixedChar = True
      Size = 50
    end
    object quKOATUUKOATUU_L3_Name_Rus: TStringField
      FieldName = 'KOATUU_L3_Name_Rus'
      FixedChar = True
      Size = 50
    end
    object quKOATUUKOATUU_L4_Name_Rus: TStringField
      FieldName = 'KOATUU_L4_Name_Rus'
      FixedChar = True
      Size = 50
    end
    object quKOATUUKOATUU_L1_Name_En: TStringField
      FieldName = 'KOATUU_L1_Name_En'
      FixedChar = True
      Size = 50
    end
    object quKOATUUKOATUU_L2_Name_En: TStringField
      FieldName = 'KOATUU_L2_Name_En'
      FixedChar = True
      Size = 50
    end
    object quKOATUUKOATUU_L3_Name_En: TStringField
      FieldName = 'KOATUU_L3_Name_En'
      FixedChar = True
      Size = 50
    end
    object quKOATUUKOATUU_L4_Name_En: TStringField
      FieldName = 'KOATUU_L4_Name_En'
      FixedChar = True
      Size = 50
    end
    object quKOATUUKOATUU_LEVEL: TWideStringField
      FieldName = 'KOATUU_LEVEL'
      FixedChar = True
      Size = 1
    end
    object quKOATUUActive: TBooleanField
      FieldName = 'Active'
    end
    object quKOATUUId: TIntegerField
      FieldName = 'Id'
      ReadOnly = True
    end
  end
  object dsKOATUU: TMSDataSource
    DataSet = quKOATUU
    Left = 824
    Top = 480
  end
  object UpdateKOATUU: TMSUpdateSQL
    InsertSQL.Strings = (
      'insert into KOATUUOfPepsico( KOATUU_ID_CODE'
      '                            ,KOATUU_L1_Name_Rus'
      '                            ,KOATUU_L2_Name_Rus'
      '                            ,KOATUU_L3_Name_Rus'
      '                            ,KOATUU_L4_Name_Rus'
      '                            ,KOATUU_L1_Name_En'
      '                            ,KOATUU_L2_Name_En'
      '                            ,KOATUU_L3_Name_En'
      '                            ,KOATUU_L4_Name_En'
      '                            ,KOATUU_LEVEL'
      '                            ,Active)'
      '  values ( :KOATUU_ID_CODE'
      '          ,:KOATUU_L1_Name_Rus'
      '          ,:KOATUU_L2_Name_Rus'
      '          ,:KOATUU_L3_Name_Rus'
      '          ,:KOATUU_L4_Name_Rus'
      '          ,:KOATUU_L1_Name_En'
      '          ,:KOATUU_L2_Name_En'
      '          ,:KOATUU_L3_Name_En'
      '          ,:KOATUU_L4_Name_En'
      '          ,:KOATUU_LEVEL'
      '          ,:Active)')
    DeleteSQL.Strings = (
      'update KOATUUOfPepsico'
      ' set Active = 0'
      'where Id = :Id')
    ModifySQL.Strings = (
      'update KOATUUOfPepsico'
      ' set  KOATUU_ID_CODE = :KOATUU_ID_CODE'
      '     ,KOATUU_L1_Name_Rus = :KOATUU_L1_Name_Rus'
      '     ,KOATUU_L2_Name_Rus = :KOATUU_L2_Name_Rus'
      '     ,KOATUU_L3_Name_Rus = :KOATUU_L3_Name_Rus'
      '     ,KOATUU_L4_Name_Rus = :KOATUU_L4_Name_Rus'
      '     ,KOATUU_L1_Name_En = :KOATUU_L1_Name_En'
      '     ,KOATUU_L2_Name_En = :KOATUU_L2_Name_En'
      '     ,KOATUU_L3_Name_En = :KOATUU_L3_Name_En'
      '     ,KOATUU_L4_Name_En = :KOATUU_L4_Name_En'
      '     ,KOATUU_LEVEL = :KOATUU_LEVEL'
      '     ,Active = :Active'
      'where Id = :Id')
    Left = 864
    Top = 480
  end
  object quAddressPost_CODE_Commerce_Network: TMSQuery
    Connection = DB
    SQL.Strings = (
      'select *'
      ' from AddressPost_CODE_Commerce_Network_Of_Pepsico'
      '&_where')
    UpdateObject = UpdateAddressPost_CODE_Commerce_Network
    Left = 792
    Top = 526
    MacroData = <
      item
        Name = '_where'
      end>
    object quAddressPost_CODE_Commerce_NetworkID: TIntegerField
      FieldName = 'ID'
      ReadOnly = True
    end
    object quAddressPost_CODE_Commerce_NetworkCode: TWideStringField
      FieldName = 'Code'
      FixedChar = True
      Size = 12
    end
    object quAddressPost_CODE_Commerce_NetworkDescription: TWideStringField
      FieldName = 'Description'
      FixedChar = True
      Size = 50
    end
    object quAddressPost_CODE_Commerce_NetworkDescriptionRUS: TWideStringField
      FieldName = 'DescriptionRUS'
      FixedChar = True
      Size = 50
    end
    object quAddressPost_CODE_Commerce_NetworkActive: TBooleanField
      FieldName = 'Active'
    end
  end
  object dsAddressPost_CODE_Commerce_Network: TMSDataSource
    DataSet = quAddressPost_CODE_Commerce_Network
    Left = 824
    Top = 526
  end
  object UpdateAddressPost_CODE_Commerce_Network: TMSUpdateSQL
    InsertSQL.Strings = (
      'insert into AddressPost_CODE_Commerce_Network_Of_Pepsico( Code'
      
        '                                                         ,Descri' +
        'ption'
      
        '                                                         ,Descri' +
        'ptionRus '
      
        '                                                         ,Active' +
        ')'
      '  values ( :Code'
      '          ,:Description'
      '          ,:DescriptionRus '
      '          ,:Active)')
    DeleteSQL.Strings = (
      'update AddressPost_CODE_Commerce_Network_Of_Pepsico'
      ' set Active = 0'
      'where Id = :Id')
    ModifySQL.Strings = (
      'update AddressPost_CODE_Commerce_Network_Of_Pepsico'
      ' set   Description = :Description'
      '      ,DescriptionRus = :DescriptionRus '
      '      ,Active = :Active'
      'where Id = :Id')
    Left = 864
    Top = 526
  end
  object dsReasonForUnlocking: TMSDataSource
    DataSet = quReasonForUnlocking
    Left = 192
    Top = 536
  end
  object quReasonForUnlocking: TMSQuery
    SQLDelete.Strings = (
      'UPDATE ReasonForUnlocking'
      'SET'
      '  Visible = 1'
      'WHERE'
      '  ReasonNo = :ReasonNo')
    Connection = DB
    SQL.Strings = (
      
        'select ReasonNo,ReasonName, Limit, isnull(Visible,0) as Visible,' +
        ' PercentUnlocking, IsSendForCite'
      'from ReasonForUnlocking'
      '&_where'
      'order by &_order')
    UpdateObject = UpdateReasonForUnlocking
    Left = 232
    Top = 536
    MacroData = <
      item
        Name = '_where'
      end
      item
        Name = '_order'
        Value = 'ReasonName'
      end>
    object quReasonForUnlockingReasonNo: TSmallintField
      FieldName = 'ReasonNo'
      Origin = 'ReasonForUnlocking.ReasonNo'
    end
    object quReasonForUnlockingReasonName: TStringField
      FieldName = 'ReasonName'
      Origin = 'ReasonForUnlocking.ReasonName'
      Size = 50
    end
    object quReasonForUnlockingVisible: TBooleanField
      FieldName = 'Visible'
      Origin = '.'
    end
    object quReasonForUnlockingLimit: TIntegerField
      FieldName = 'Limit'
      Origin = 'ReasonForUnlocking.Limit'
    end
    object quReasonForUnlockingIsSendForCite: TBooleanField
      FieldName = 'IsSendForCite'
      Origin = 'ReasonForUnlocking.IsSendForCite'
    end
    object quReasonForUnlockingPercentUnlocking: TIntegerField
      FieldName = 'PercentUnlocking'
    end
  end
  object UpdateReasonForUnlocking: TMSUpdateSQL
    InsertSQL.Strings = (
      'declare'
      '  @ReasonNo smallint'
      ''
      
        'select @ReasonNo = isnull(max(ReasonNo),0)+1 from ReasonForUnloc' +
        'king'
      ''
      'insert into ReasonForUnlocking'
      
        '  (ReasonNo, ReasonName,Limit, Visible, PercentUnlocking, IsSend' +
        'ForCite)'
      'values'
      
        '  (@ReasonNo, :ReasonName,:Limit, 0, :PercentUnlocking, :IsSendF' +
        'orCite)')
    DeleteSQL.Strings = (
      'update ReasonForUnlocking'
      'set'
      '  Visible = 1'
      'where'
      '  ReasonNo = :ReasonNo')
    ModifySQL.Strings = (
      '-- declare @PercentUnlocking decimal (3, 2)'
      ''
      '-- set @PercentUnlocking = :PercentUnlocking'
      ''
      'update ReasonForUnlocking'
      'set'
      '  ReasonNo = :ReasonNo,'
      '  ReasonName = :ReasonName,'
      '  Limit = :Limit,'
      '  Visible = :Visible, '
      '  PercentUnlocking = :PercentUnlocking,'
      '  IsSendForCite = :IsSendForCite'
      'where'
      '  ReasonNo = :ReasonNo')
    Left = 272
    Top = 536
  end
  object dsVidOtdel: TMSDataSource
    DataSet = quVidOtdel
    Left = 906
    Top = 24
  end
  object quVidOtdel: TMSQuery
    Connection = DB
    SQL.Strings = (
      'select  vo.OtdelNo'
      '      , vo.OtdelName'
      '      , vo.Manager_Team_Id'
      
        '      , (select Name from D_Manager_team where id = vo.Manager_T' +
        'eam_Id) as NameManegerTeam'
      '      , dat.id as D_ACTIVITY_TYPE_ID'
      '      , dat.name as D_ACTIVITY_TYPE_NAME'
      '      , drd.id as D_RESPONSE_DEPT_ID'
      '      , drd.Name as D_RESPONSE_DEPT_NAME'
      '      , da.id as area_id'
      '      , da.Name as AreaName'
      '      , dobt.id as brand_type_id'
      '      , dobt.Name as Brend_TypeName'
      ' from VidOtdel vo left join'
      '      l_VidOtdelProp l on l.OtdelNo = vo.OtdelNo left join'
      
        '      D_ACTIVITY_TYPE dat on dat.id = l.D_ACTIVITY_TYPE_ID left ' +
        'join'
      
        '      D_RESPONSE_DEPT drd on drd.id = l.D_RESPONSE_DEPT_ID left ' +
        'join'
      '      D_AREA da on da.id = vo.area_id left join'
      '      D_OTDEL_BRAND_TYPE dobt on dobt.id = vo.brand_type_id')
    UpdateObject = UpdateVidOtdel
    Left = 874
    Top = 24
    object quVidOtdelOtdelNo: TSmallintField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1086#1090#1076#1077#1083#1072
      FieldName = 'OtdelNo'
      Origin = 'VidOtdel.OtdelNo'
    end
    object quVidOtdelOtdelName: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1090#1076#1077#1083#1072
      FieldName = 'OtdelName'
      Origin = 'VidOtdel.OtdelName'
      Size = 30
    end
    object quVidOtdelManager_Team_Id: TSmallintField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1090#1080#1087#1072' '#1086#1090#1076#1077#1083#1072
      FieldName = 'Manager_Team_Id'
      Origin = 'VidOtdel.Manager_Team_Id'
    end
    object quVidOtdelNameManegerTeam: TStringField
      DisplayLabel = #1058#1080#1087' '#1086#1090#1076#1077#1083#1072
      DisplayWidth = 30
      FieldName = 'NameManegerTeam'
      Origin = '.'
      ReadOnly = True
      Size = 128
    end
    object quVidOtdelD_ACTIVITY_TYPE_ID: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = #1053#1086#1084#1077#1088' '#1076#1077#1103#1090#1077#1083#1100#1085#1086#1089#1090#1080
      FieldName = 'D_ACTIVITY_TYPE_ID'
      Origin = 'D_ACTIVITY_TYPE.id'
    end
    object quVidOtdelD_ACTIVITY_TYPE_NAME: TStringField
      DisplayLabel = #1042#1080#1076' '#1076#1077#1103#1090#1077#1083#1100#1085#1086#1089#1090#1080
      DisplayWidth = 30
      FieldName = 'D_ACTIVITY_TYPE_NAME'
      Origin = 'D_ACTIVITY_TYPE.name'
      Size = 100
    end
    object quVidOtdelD_RESPONSE_DEPT_ID: TLargeintField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1062#1060#1054
      FieldName = 'D_RESPONSE_DEPT_ID'
      Origin = 'D_RESPONSE_DEPT.ID'
    end
    object quVidOtdelD_RESPONSE_DEPT_NAME: TStringField
      DisplayLabel = #1062#1060#1054
      DisplayWidth = 30
      FieldName = 'D_RESPONSE_DEPT_NAME'
      Origin = 'D_RESPONSE_DEPT.NAME'
      Size = 512
    end
    object quVidOtdelarea_id: TLargeintField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1090#1077#1088#1088#1080#1090#1086#1088#1080#1080
      DisplayWidth = 20
      FieldName = 'area_id'
      Origin = 'D_AREA.id'
    end
    object quVidOtdelAreaName: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1077#1088#1088#1080#1090'.'
      DisplayWidth = 20
      FieldName = 'AreaName'
      Origin = 'D_AREA.Name'
      Size = 512
    end
    object quVidOtdelbrand_type_id: TLargeintField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1073#1088#1077#1085#1076#1072
      DisplayWidth = 20
      FieldName = 'brand_type_id'
      Origin = 'D_OTDEL_BRAND_TYPE.id'
    end
    object quVidOtdelBrend_TypeName: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1073#1088#1077#1085#1076#1072
      DisplayWidth = 20
      FieldName = 'Brend_TypeName'
      Origin = 'D_OTDEL_BRAND_TYPE.Name'
      Size = 256
    end
  end
  object UpdateVidOtdel: TMSUpdateSQL
    InsertSQL.Strings = (
      'declare'
      ' @OtdelNo smallint'
      ''
      'set @OtdelNo = :OtdelNo'
      ''
      'if @OtdelNo is null'
      ' select @OtdelNo = max(isnull(OtdelNo,0)+1) from VidOtdel'
      ''
      
        'insert into VidOtdel (OtdelNo,OtdelName,manager_team_id,area_id,' +
        'brand_type_id) '
      
        '  values (@OtdelNo,:OtdelName,:Manager_Team_Id,:area_id,:brand_t' +
        'ype_id)'
      ''
      
        'insert into l_VidOtdelProp (OtdelNo,D_RESPONSE_DEPT_ID,D_ACTIVIT' +
        'Y_TYPE_ID)'
      '   values (@OtdelNo,:D_RESPONSE_DEPT_ID,:D_ACTIVITY_TYPE_ID)')
    DeleteSQL.Strings = (
      'declare @OtdelNo int'
      ''
      'set @OtdelNo = :OtdelNo'
      ''
      'delete l_VidOtdelProp where OtdelNo = @OtdelNo'
      'delete VidOtdel where OtdelNo = @OtdelNo')
    ModifySQL.Strings = (
      'declare @Cnt int'
      '       ,@Cnt1 int'
      '       ,@OtdelNo int'
      ''
      'set @OtdelNo = :OtdelNo'
      ''
      
        'if @OtdelNo is null select @OtdelNo = max(isnull(OtdelNo,0)+1) f' +
        'rom VidOtdel'
      ''
      
        'select @Cnt = count(*) from l_VidOtdelProp where OtdelNo = @Otde' +
        'lNo'
      'select @Cnt1 = count(*) from VidOtdel where OtdelNo = @OtdelNo'
      ''
      'if @Cnt1 > 0'
      ' update VidOtdel'
      '  set OtdelName = :OtdelName'
      '     ,Manager_Team_Id = :Manager_Team_Id'
      '     ,area_id = :area_id'
      '     ,brand_type_id = :brand_type_id '
      ' where OtdelNo = @OtdelNo'
      ''
      'if @Cnt > 0'
      ' update l_VidOtdelProp '
      '  set D_RESPONSE_DEPT_ID = :D_RESPONSE_DEPT_ID'
      '     ,D_ACTIVITY_TYPE_ID = :D_ACTIVITY_TYPE_ID'
      ' where OtdelNo = @OtdelNo'
      ''
      'if @Cnt1 = 0'
      
        ' insert into VidOtdel (OtdelNo,OtdelName,manager_team_id,area_id' +
        ',brand_type_id) '
      
        '  values (@OtdelNo,:OtdelName,:Manager_Team_Id,:area_id,:brand_t' +
        'ype_id)'
      ''
      'if @Cnt = 0'
      
        ' insert into l_VidOtdelProp (OtdelNo,D_RESPONSE_DEPT_ID,D_ACTIVI' +
        'TY_TYPE_ID)'
      '   values (@OtdelNo,:D_RESPONSE_DEPT_ID,:D_ACTIVITY_TYPE_ID)')
    Left = 936
    Top = 24
  end
  object dsUsers: TMSDataSource
    DataSet = quUsers
    Left = 410
    Top = 536
  end
  object quUsers: TMSQuery
    Connection = DB
    SQL.Strings = (
      'select *'
      ' from Users')
    Left = 384
    Top = 536
    object quUsersUserNo: TIntegerField
      FieldName = 'UserNo'
      Origin = 'Users.UserNo'
    end
    object quUsersUserName: TStringField
      FieldName = 'UserName'
      Origin = 'Users.UserName'
    end
    object quUsersCodeAccess: TSmallintField
      FieldName = 'CodeAccess'
      Origin = 'Users.CodeAccess'
    end
    object quUsersPassword: TStringField
      FieldName = 'Password'
      Origin = 'Users.Password'
      Size = 8
    end
    object quUsersEditPost: TBooleanField
      FieldName = 'EditPost'
      Origin = 'Users.EditPost'
    end
    object quUsersFormWight: TIntegerField
      FieldName = 'FormWight'
      Origin = 'Users.FormWight'
    end
    object quUsersFormHeight: TIntegerField
      FieldName = 'FormHeight'
      Origin = 'Users.FormHeight'
    end
    object quUsersFormLeft: TIntegerField
      FieldName = 'FormLeft'
      Origin = 'Users.FormLeft'
    end
    object quUsersFormTop: TIntegerField
      FieldName = 'FormTop'
      Origin = 'Users.FormTop'
    end
    object quUsersSkin: TIntegerField
      FieldName = 'Skin'
      Origin = 'Users.Skin'
    end
  end
  object quVidNakl: TMSQuery
    Connection = DB
    SQL.Strings = (
      'select *'
      ' from VidNakl')
    Left = 464
    Top = 544
  end
  object dsVidNakl: TMSDataSource
    DataSet = quVidNakl
    Left = 493
    Top = 544
  end
  object dsCheckMeshCutting: TMSDataSource
    DataSet = quCheckMeshCutting
    Left = 8
    Top = 544
  end
  object quCheckMeshCutting: TMSQuery
    SQLInsert.Strings = (
      'INSERT INTO CheckMeshCutting'
      '  (Id, DateCheck, IsCheck)'
      'VALUES'
      '  (1 :DateCheck, :IsCheck)')
    SQLDelete.Strings = (
      'DELETE FROM CheckMeshCutting'
      'WHERE'
      '  Id = :Old_Id')
    SQLUpdate.Strings = (
      'UPDATE CheckMeshCutting'
      'SET'
      '   DateCheck = :DateCheck, IsCheck = :IsCheck'
      'WHERE'
      '  Id = 1')
    SQLRefresh.Strings = (
      
        'SELECT CheckMeshCutting.Id, CheckMeshCutting.DateCheck, CheckMes' +
        'hCutting.IsCheck FROM CheckMeshCutting'
      'WHERE'
      '  Id = :Id')
    Connection = DB
    SQL.Strings = (
      'select * from CheckMeshCutting')
    Left = 48
    Top = 544
    object quCheckMeshCuttingDateCheck: TDateTimeField
      FieldName = 'DateCheck'
      Origin = 'CheckMeshCutting.DateCheck'
    end
    object quCheckMeshCuttingIsCheck: TBooleanField
      FieldName = 'IsCheck'
      Origin = 'CheckMeshCutting.IsCheck'
    end
  end
  object UpdateCheckMeshCutting: TMSUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO CheckMeshCutting'
      '  (Id, DateCheck, IsCheck)'
      'VALUES'
      '  (1, :DateCheck, :IsCheck)')
    ModifySQL.Strings = (
      'UPDATE CheckMeshCutting'
      'SET'
      '  DateCheck = :DateCheck, IsCheck = :IsCheck'
      'WHERE'
      '  Id = 1')
    ModifyObject = quGroupCutting
    Left = 88
    Top = 544
  end
  object dsGroupCutting: TMSDataSource
    Left = 24
    Top = 600
  end
  object quGroupCutting: TMSQuery
    SQLInsert.Strings = (
      'INSERT INTO GroupCutting'
      '  (NameGropCutting, PriorityGroupCutting,PercentGroupCutting)'
      'VALUES'
      '  (:NameGropCutting, :PriorityGroupCutting,:PercentGroupCutting)'
      'SET :id = SCOPE_IDENTITY()')
    SQLDelete.Strings = (
      'DELETE FROM GroupCutting'
      'WHERE'
      '  id = :Old_id')
    SQLUpdate.Strings = (
      'UPDATE GroupCutting'
      'SET'
      
        '  NameGropCutting = :NameGropCutting, PriorityGroupCutting = :Pr' +
        'iorityGroupCutting, PercentGroupCutting = :PercentGroupCutting'
      'WHERE'
      '  id = :Old_id')
    SQLRefresh.Strings = (
      
        'SELECT GroupCutting.NameGropCutting, GroupCutting.PriorityGroupC' +
        'utting,PercentGroupCutting FROM GroupCutting'
      'WHERE'
      '  id = :id')
    Connection = DB
    SQL.Strings = (
      'select *'
      ' from GroupCutting')
    Left = 89
    Top = 517
    object quGroupCuttingid: TIntegerField
      DisplayLabel = #8470' '#1075#1088#1091#1087#1087#1099
      FieldName = 'id'
      ReadOnly = True
    end
    object quGroupCuttingNameGropCutting: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099
      FieldName = 'NameGropCutting'
      Size = 50
    end
    object quGroupCuttingPriorityGroupCutting: TIntegerField
      DisplayLabel = #1055#1088#1080#1086#1088#1080#1090#1077#1090
      FieldName = 'PriorityGroupCutting'
    end
    object quGroupCuttingPercentGroupCutting: TIntegerField
      DisplayLabel = '%'
      DisplayWidth = 3
      FieldName = 'PercentGroupCutting'
    end
  end
  object dsCurrency: TMSDataSource
    DataSet = quCurrency
    Left = 136
    Top = 632
  end
  object quCurrency: TMSQuery
    Connection = DB
    SQL.Strings = (
      'select *'
      ' from d_currency'
      'where 1=1 '
      '&_where')
    UpdateObject = UpdateCurrency
    Left = 191
    Top = 632
    MacroData = <
      item
        Name = '_where'
      end>
    object quCurrencyID: TIntegerField
      DisplayLabel = #1063#1080#1089#1083#1086#1074#1086#1081' '#1082#1086#1076' '#1074#1072#1083#1102#1090#1099
      FieldName = 'ID'
    end
    object quCurrencyNAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1074#1072#1083#1102#1090#1099
      DisplayWidth = 30
      FieldName = 'NAME'
      Size = 100
    end
    object quCurrencyL_CODE: TStringField
      DisplayLabel = #1041#1091#1082#1074#1077#1085#1085#1099#1081' '#1082#1086#1076' '#1074#1072#1083#1102#1090#1099
      DisplayWidth = 11
      FieldName = 'L_CODE'
      Size = 3
    end
    object quCurrencySHORT_NAME: TStringField
      DisplayLabel = #1057#1086#1082#1088#1072#1097#1077#1085#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 15
      FieldName = 'SHORT_NAME'
      Size = 10
    end
    object quCurrencyIsDefault: TBooleanField
      DisplayLabel = 'V'
      DisplayWidth = 3
      FieldName = 'IsDefault'
    end
    object quCurrencyisTrash: TBooleanField
      FieldName = 'isTrash'
    end
    object quCurrencyisCrossCurrency: TBooleanField
      FieldName = 'isCrossCurrency'
    end
  end
  object UpdateCurrency: TMSUpdateSQL
    InsertSQL.Strings = (
      'insert into d_currency'
      '  (ID,NAME,L_CODE,SHORT_NAME,IsDefault,isTrash)'
      'values'
      '  (:ID,:NAME,:L_CODE,:SHORT_NAME,:IsDefault,0)')
    DeleteSQL.Strings = (
      'update d_currency'
      'set'
      '  isTrash = 1'
      'where'
      '  ID = :OLD_ID')
    ModifySQL.Strings = (
      'update d_currency'
      ' set'
      '   ID = :ID'
      ' , NAME = :NAME'
      ' , L_CODE = :L_CODE'
      ' , SHORT_NAME = :SHORT_NAME'
      ' , IsDefault = :IsDefault'
      ' , isTrash = :isTrash'
      'where'
      '  ID = :OLD_ID')
    Left = 239
    Top = 632
  end
  object dsCurrencyExchange: TMSDataSource
    DataSet = quCurrencyExchange
    Left = 279
    Top = 632
  end
  object quCurrencyExchange: TMSQuery
    Connection = DB
    SQL.Strings = (
      'select  *'
      
        '      , (select Name from D_CURRENCY where id = CurrencyId) as C' +
        'yrrencyName'
      
        '      , (select L_CODE from D_CURRENCY where id = CurrencyId) as' +
        ' CyrrencyAbv'
      ' from CurrencyExchange'
      'where 1=1 '
      '&_where')
    UpdateObject = UpdateCurrencyExchange
    Left = 326
    Top = 632
    MacroData = <
      item
        Name = '_where'
      end>
    object quCurrencyExchangeid: TLargeintField
      FieldName = 'id'
      ReadOnly = True
    end
    object quCurrencyExchangeCurrencyId: TIntegerField
      FieldName = 'CurrencyId'
    end
    object quCurrencyExchangeDateExchange: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DateExchange'
    end
    object quCurrencyExchangeRate: TFloatField
      DisplayLabel = #1050#1091#1088#1089
      FieldName = 'Rate'
    end
    object quCurrencyExchangeIsActive: TBooleanField
      DisplayLabel = 'V'
      DisplayWidth = 3
      FieldName = 'IsActive'
    end
    object quCurrencyExchangeCyrrencyName: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      DisplayWidth = 30
      FieldName = 'CyrrencyName'
      ReadOnly = True
      Size = 100
    end
    object quCurrencyExchangeCyrrencyAbv: TStringField
      DisplayLabel = #1050#1086#1076
      DisplayWidth = 5
      FieldName = 'CyrrencyAbv'
      ReadOnly = True
      Size = 3
    end
  end
  object UpdateCurrencyExchange: TMSUpdateSQL
    InsertSQL.Strings = (
      'declare  @Cnt int'
      '       , @CurrencyId int'
      ''
      'set @CurrencyId = :CurrencyId'
      ''
      
        'select @Cnt = count(*) from CurrencyExchange where CurrencyId = ' +
        ':CurrencyId'
      ''
      'if @Cnt > 0'
      ' update CurrencyExchange'
      '  set IsActive = 0'
      ' where CurrencyId = @CurrencyId'
      ''
      'insert into CurrencyExchange'
      '  (CurrencyId,DateExchange,Rate,IsActive)'
      'values'
      '  (@CurrencyId,:DateExchange,:Rate,1)')
    DeleteSQL.Strings = (
      'update d_currency'
      'set'
      '  IsActive = 1'
      'where'
      '  ID = :OLD_ID')
    ModifySQL.Strings = (
      'update CurrencyExchange'
      ' set'
      '   CurrencyId = :CurrencyId'
      ' , DateExchange = :DateExchange'
      ' , Rate = :Rate'
      ' , IsActive = :IsActive'
      ''
      'where'
      '  ID = :OLD_ID')
    Left = 374
    Top = 632
  end
  object dsVidRashodGroup1: TMSDataSource
    DataSet = quVidRashodGroup1
    Left = 184
    Top = 480
  end
  object UpdateVidRashodGroup1: TMSUpdateSQL
    InsertSQL.Strings = (
      'insert into d_vidrash_Group (name, IsTrash)'
      'values (:name, :IsTrash)')
    DeleteSQL.Strings = (
      'update d_vidrash_Group'
      'set'
      '  IsTrash = 1'
      'where id = :id')
    ModifySQL.Strings = (
      'update d_vidrash_Group'
      ' set  name = :name'
      '    , IsTrash = :IsTrash'
      'where id = :id')
    Left = 272
    Top = 480
  end
  object quVidRashodGroup1: TMSQuery
    SQLInsert.Strings = (
      'INSERT INTO d_vidrash_Group'
      '  (name, IsTrash)'
      'VALUES'
      '  (:name, :IsTrash)'
      'SET :id = SCOPE_IDENTITY()')
    SQLDelete.Strings = (
      'update d_vidrash_Group'
      ' set IsTrash = 1'
      'WHERE'
      '  id = :Old_id')
    SQLUpdate.Strings = (
      'UPDATE d_vidrash_Group'
      'SET'
      '  name = :name, IsTrash = :IsTrash'
      'WHERE'
      '  id = :Old_id')
    SQLRefresh.Strings = (
      
        'SELECT d_vidrash_Group.name, d_vidrash_Group.IsTrash FROM d_vidr' +
        'ash_Group'
      'WHERE'
      '  id = :id')
    Connection = DB
    SQL.Strings = (
      'select * '
      'from d_vidrash_Group'
      'where 1=1 '
      '&_where')
    Left = 232
    Top = 480
    MacroData = <
      item
        Name = '_where'
      end>
    object quVidRashodGroup1id: TIntegerField
      FieldName = 'id'
      ReadOnly = True
    end
    object quVidRashodGroup1name: TStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      DisplayWidth = 30
      FieldName = 'name'
      Size = 256
    end
    object quVidRashodGroup1IsTrash: TBooleanField
      DisplayLabel = 'D'
      DisplayWidth = 3
      FieldName = 'IsTrash'
    end
  end
  object quArea: TMSQuery
    Connection = DB
    SQL.Strings = (
      'select * '
      ' from D_Area'
      '  where (Name is not null or Name <> '#39' '#39')'
      '&_where'
      'order by &_order')
    UpdateObject = UpdateArea
    Left = 784
    Top = 587
    MacroData = <
      item
        Name = '_where'
      end
      item
        Name = '_order'
        Value = 'Name'
      end>
    object quAreaid: TLargeintField
      Alignment = taCenter
      DisplayLabel = #1053#1086#1084#1077#1088' '#1090#1077#1088#1088#1080#1090#1086#1088#1080#1080
      DisplayWidth = 20
      FieldName = 'id'
    end
    object quAreaName: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1077#1088#1088#1080#1090#1086#1088#1080#1080
      DisplayWidth = 30
      FieldName = 'Name'
      Size = 512
    end
    object quAreaTrash: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'D'
      DisplayWidth = 3
      FieldName = 'Trash'
    end
    object quAreaVisible: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'V'
      DisplayWidth = 3
      FieldName = 'Visible'
    end
  end
  object dsArea: TMSDataSource
    DataSet = quArea
    Left = 816
    Top = 587
  end
  object UpdateArea: TMSUpdateSQL
    InsertSQL.Strings = (
      'insert into d_area (Name,Trash,Visible)'
      ' values (:Name,0,1)')
    DeleteSQL.Strings = (
      'update d_area '
      ' set Trash = 1'
      'where id = :id')
    ModifySQL.Strings = (
      'update d_area '
      ' set  Name = :Name'
      '    , Trash = :Trash'
      '    , Visible = :Visible'
      'where id = :id')
    RefreshSQL.Strings = (
      'select * from d_Area')
    Left = 848
    Top = 587
  end
  object quOtdelBrandType: TMSQuery
    Connection = DB
    SQL.Strings = (
      'select * '
      ' from d_Otdel_Brand_Type'
      '  where (Name is not null or Name <> '#39' '#39')'
      '&_where'
      'order by &_order')
    UpdateObject = UpdateOtdelBrandType
    Left = 784
    Top = 637
    MacroData = <
      item
        Name = '_where'
      end
      item
        Name = '_order'
        Value = 'Name'
      end>
    object quOtdelBrandTypeid: TLargeintField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1073#1088#1077#1085#1076#1072
      DisplayWidth = 20
      FieldName = 'id'
    end
    object quOtdelBrandTypeName: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1073#1088#1077#1085#1076#1072
      DisplayWidth = 30
      FieldName = 'Name'
      Size = 256
    end
    object quOtdelBrandTypeTrash: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'D'
      DisplayWidth = 3
      FieldName = 'Trash'
    end
    object quOtdelBrandTypeVisible: TBooleanField
      DisplayLabel = 'V'
      DisplayWidth = 3
      FieldName = 'Visible'
    end
  end
  object dsOtdelBrandType: TMSDataSource
    DataSet = quOtdelBrandType
    Left = 816
    Top = 637
  end
  object UpdateOtdelBrandType: TMSUpdateSQL
    InsertSQL.Strings = (
      'insert into d_Otdel_Brand_Type (Name,Trash,Visible)'
      ' values (:Name,0,1)')
    DeleteSQL.Strings = (
      'update d_Otdel_Brand_Type'
      ' set Trash = 1'
      'where id = :id')
    ModifySQL.Strings = (
      'update d_Otdel_Brand_Type '
      ' set  Name = :Name'
      '    , Trash = :Trash'
      '    , Visible = :Visible'
      'where id = :id')
    RefreshSQL.Strings = (
      'select * from d_Otdel_Brand_Type')
    Left = 848
    Top = 637
  end
  object quKassaNew: TMSQuery
    SQLInsert.Strings = (
      
        'insert into d_KassaNew (Name, Date, SummaRest, Description, isMa' +
        'in, isTrash)'
      '   values (:Name, :Date, :SummaRest, :Description, :isMain, 0)')
    SQLDelete.Strings = (
      'update d_KassaNew'
      '  set isTrash = 1'
      ' where id = :id')
    SQLUpdate.Strings = (
      'declare @Cnt int'
      '       ,@id int'
      ''
      'set @id = :id'
      ''
      'select @Cnt = count(*) from d_KassaNew where id = @id'
      ''
      'if @Cnt > 0'
      ' update d_KassaNew'
      '  set Name = :Name'
      '     ,Date = :Date'
      '     ,SummaRest = :SummaRest'
      '     ,Description = :Description'
      '     ,isMain = :isMain'
      ' where id = @id')
    Connection = DB
    SQL.Strings = (
      'select * from d_KassaNew')
    Left = 864
    Top = 336
    object quKassaNewid: TIntegerField
      FieldName = 'id'
      ReadOnly = True
    end
    object quKassaNewName: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 12
      FieldName = 'Name'
      Size = 10
    end
    object quKassaNewDate: TWideStringField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'Date'
      Size = 10
    end
    object quKassaNewSummaRest: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1086#1089#1090#1072#1090#1082#1072
      DisplayWidth = 13
      FieldName = 'SummaRest'
    end
    object quKassaNewDescription: TStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077
      DisplayWidth = 30
      FieldName = 'Description'
      Size = 50
    end
    object quKassaNewisMain: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'V'
      DisplayWidth = 3
      FieldName = 'isMain'
    end
    object quKassaNewisTrash: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'D'
      DisplayWidth = 3
      FieldName = 'isTrash'
    end
  end
  object dsKassaNew: TMSDataSource
    DataSet = quKassaNew
    Left = 904
    Top = 336
  end
  object quCarCompany: TMSQuery
    SQLDelete.Strings = (
      '/*'
      'update CarCompany'
      ' set IsTrash = 1'
      'where IdCarCompany = :IdCarCompany'
      '*/')
    Connection = DB
    SQL.Strings = (
      'select * '
      ' from CarCompany'
      '  where &_where')
    UpdateObject = UpdateCarCompany
    Left = 368
    Top = 480
    MacroData = <
      item
        Name = '_where'
        Value = '1=1'
      end>
    object quCarCompanyIdCarCompany: TIntegerField
      DisplayLabel = #8470' '#1060#1080#1088#1084#1099
      DisplayWidth = 10
      FieldName = 'IdCarCompany'
      ReadOnly = True
    end
    object quCarCompanyNameCarCompany: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1092#1080#1088#1084#1099
      FieldName = 'NameCarCompany'
      Size = 30
    end
    object quCarCompanyIsVisible: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'V'
      DisplayWidth = 3
      FieldName = 'IsVisible'
    end
    object quCarCompanyIsTrash: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'D'
      DisplayWidth = 3
      FieldName = 'IsTrash'
    end
  end
  object dsCarCompany: TMSDataSource
    DataSet = quCarCompany
    Left = 400
    Top = 480
  end
  object UpdateCarCompany: TMSUpdateSQL
    InsertSQL.Strings = (
      'insert into CarCompany(NameCarCompany, IsVisible, IsTrash)'
      ' values (:NameCarCompany, 1, 0)')
    DeleteSQL.Strings = (
      'update CarCompany'
      ' set IsTrash = 1'
      'where IdCarCompany = :IdCarCompany')
    ModifySQL.Strings = (
      'update CarCompany'
      ' set NameCarCompany = :NameCarCompany'
      '   , isVisible = :isVisible'
      'where IdCarCompany = :IdCarCompany')
    Left = 432
    Top = 480
  end
  object quCarDrivers: TMSQuery
    SQLInsert.Strings = (
      'INSERT INTO CarDrivers'
      '  (Name, IsVisible, IsTrash)'
      'VALUES'
      '  (:Name, 1, 0)'
      'SET :ID = SCOPE_IDENTITY()')
    SQLDelete.Strings = (
      '/*'
      'DELETE FROM CarDrivers'
      'WHERE'
      '  ID = :Old_ID'
      '*/'
      'update CarDrivers'
      ' set IsTrash = 1'
      'where ID = :ID')
    SQLUpdate.Strings = (
      'UPDATE CarDrivers'
      'SET'
      '  Name = :Name, IsVisible = :IsVisible, IsTrash = :IsTrash'
      'WHERE'
      '  ID = :Old_ID')
    Connection = DB
    SQL.Strings = (
      'select * from CarDrivers'
      'where 1=1 &_where')
    Left = 545
    Top = 480
    MacroData = <
      item
        Name = '_where'
      end>
    object quCarDriversID: TSmallintField
      AutoGenerateValue = arAutoInc
      DisplayWidth = 5
      FieldName = 'ID'
      Origin = 'CarDrivers.ID'
      ReadOnly = True
    end
    object quCarDriversName: TStringField
      DisplayLabel = #1042#1086#1076#1080#1090#1077#1083#1100
      DisplayWidth = 40
      FieldName = 'Name'
      Origin = 'CarDrivers.Name'
      Size = 64
    end
    object quCarDriversIsVisible: TBooleanField
      DisplayLabel = 'V'
      DisplayWidth = 3
      FieldName = 'IsVisible'
      Origin = 'CarDrivers.IsVisible'
    end
    object quCarDriversIsTrash: TBooleanField
      DisplayLabel = 'D'
      DisplayWidth = 3
      FieldName = 'IsTrash'
      Origin = 'CarDrivers.IsTrash'
    end
  end
  object dsCarDrivers: TMSDataSource
    DataSet = quCarDrivers
    Left = 512
    Top = 480
  end
  object quCustomSettings: TMSQuery
    Connection = DB
    SQL.Strings = (
      'DECLARE'
      '   @Section   varchar(32),'
      '   @Ident   varchar(32)'
      ''
      'set @Ident = :Ident'
      'set @Section = :Section'
      ''
      'SELECT VType, Value FROM CustomSettings'
      
        'where (Section=ISNULL(@Section, Section)) and (Ident=ISNULL(@Ide' +
        'nt, Ident))')
    CachedUpdates = True
    Left = 618
    Top = 558
    ParamData = <
      item
        DataType = ftString
        Name = 'Ident'
        Value = nil
      end
      item
        DataType = ftString
        Name = 'Section'
        Value = nil
      end>
  end
  object quSetSendXML: TMSQuery
    SQLRefresh.Strings = (
      
        'SELECT SetSendXML.name, SetSendXML.Company, SetSendXML.URL FROM ' +
        'SetSendXML'
      'WHERE'
      '  id = :id')
    Connection = DB
    SQL.Strings = (
      'select * from SetSendXML')
    UpdateObject = UpdateSetSendXML
    Left = 496
    Top = 632
    object quSetSendXMLid: TIntegerField
      DisplayLabel = #8470
      DisplayWidth = 5
      FieldName = 'id'
      ReadOnly = True
    end
    object quSetSendXMLname: TStringField
      DisplayLabel = #1052#1072#1075#1072#1079#1080#1085
      FieldName = 'name'
    end
    object quSetSendXMLCompany: TStringField
      DisplayLabel = #1050#1086#1084#1087#1072#1085#1080#1103' '#1074#1083#1072#1076#1077#1083#1077#1094
      FieldName = 'Company'
      Size = 50
    end
    object quSetSendXMLURL: TStringField
      DisplayLabel = #1057#1072#1081#1090' '#1084#1072#1075#1072#1079#1080#1085#1072
      FieldName = 'URL'
      Size = 50
    end
  end
  object dsSetSendXML: TMSDataSource
    DataSet = quSetSendXML
    Left = 464
    Top = 632
  end
  object UpdateSetSendXML: TMSUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO SetSendXML'
      '  (name, Company, URL)'
      'VALUES'
      '  (:name, :Company, :URL)'
      'SET :id = SCOPE_IDENTITY()')
    DeleteSQL.Strings = (
      'DELETE FROM SetSendXML'
      'WHERE'
      '  id = :Old_id')
    ModifySQL.Strings = (
      'UPDATE SetSendXML'
      'SET'
      '  name = :name, Company = :Company, URL = :URL'
      'WHERE'
      '  id = :Old_id')
    Left = 528
    Top = 632
  end
  object quCalcNewTimes: TMSQuery
    SQLDelete.Strings = (
      'DELETE FROM ControlPersonParams'
      'WHERE'
      '  ID = :Old_ID')
    Connection = DB
    SQL.Strings = (
      'USE WORK'
      ''
      'DECLARE @UserNo INT'
      #9',@Now DATETIME'
      ''
      'set @UserNo = :UserNo'
      'set @Now = ISNULL(:Now, GETDATE())'
      ''
      'SELECT * from ('
      
        #9'SELECT DATEADD(SECOND, T1.DelayAfterStart, LastTime) AS NewTime' +
        ','
      #9#9'T1.ID,'
      #9#9'cpt.ActionID,'
      #9#9'T1.ShowInterval,'
      #9#9'T1.BrowseSetCount,'
      #9#9'T1.Active'#9#9
      #9'FROM ('
      #9#9'SELECT '
      '                   ActivateTime AS LastTime'
      #9#9#9',cp.*'
      #9#9'FROM ControlPersonParams cp'
      #9#9'WHERE [Ctrl_UserNo] = @UserNo and (ActivateTime is not NULL)'
      #9#9') T1'
      'left join ControlParamsTree cpt on cpt.ID=T1.CtrlPrm_ID'
      ') T2'
      'WHERE (T2.NewTime > @Now) and (T2.ActionID is not NULL)')
    Left = 616
    Top = 629
    ParamData = <
      item
        DataType = ftInteger
        Name = 'UserNo'
        Value = 149
      end
      item
        DataType = ftDateTime
        Name = 'Now'
        Value = nil
      end>
  end
  object quScriptData: TMSQuery
    Connection = DB
    SQL.Strings = (
      'select * from ScriptData order by ID')
    Left = 653
    Top = 624
  end
  object quPropertyList: TMSQuery
    Connection = DB
    SQL.Strings = (
      'DECLARE'
      '   @OwnerName varchar(64),'
      '   @ObjName varchar(64),'
      '   @PropName varchar(64),'
      '   @UserNo   int'
      ''
      'set @UserNo = :UserNo'
      'set @OwnerName = :OwnerName'
      'set @ObjName = :ObjName'
      'set @PropName = :PropName'
      ''
      'SELECT * FROM PropertyList'
      
        'where (UserNo = ISNULL(@UserNo, UserNo)) and (OwnerName=ISNULL(@' +
        'OwnerName, OwnerName)) and '
      
        '      (ObjName=ISNULL(@ObjName, ObjName)) and (ISNULL(ObjName, '#39 +
        #39')=ISNULL(@ObjName, '#39#39'))')
    Left = 701
    Top = 624
    ParamData = <
      item
        DataType = ftInteger
        Name = 'UserNo'
        Value = nil
      end
      item
        DataType = ftString
        Name = 'OwnerName'
        Value = nil
      end
      item
        DataType = ftString
        Name = 'ObjName'
        Value = nil
      end
      item
        DataType = ftString
        Name = 'PropName'
        Value = nil
      end>
  end
  object dsOurCommercialNetwork: TMSDataSource
    DataSet = quOurCommercialNetwork
    Left = 904
    Top = 72
  end
  object quOurCommercialNetwork: TMSQuery
    Connection = DB
    SQL.Strings = (
      'select *'
      ' from OurCommercialNetwork ocn'
      
        '  where (ocn.NameCommercialNetwork is not null or ocn.NameCommer' +
        'cialNetwork <> '#39' '#39') &_where'
      'order by &_order')
    CachedUpdates = True
    UpdateObject = UpdateOurCommercialNetwork
    AfterOpen = quOurCommercialNetworkAfterOpen
    BeforeClose = quOurCommercialNetworkBeforeClose
    BeforePost = quOurCommercialNetworkBeforePost
    BeforeDelete = quOurCommercialNetworkBeforeDelete
    Left = 872
    Top = 72
    MacroData = <
      item
        Name = '_where'
      end
      item
        Name = '_order'
        Value = 'ocn.NameCommercialNetwork'
      end>
    object quOurCommercialNetworkCommercialNetworkNo: TIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'CommercialNetworkNo'
    end
    object quOurCommercialNetworkNameCommercialNetwork: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1089#1077#1090#1080
      DisplayWidth = 30
      FieldName = 'NameCommercialNetwork'
      Size = 50
    end
    object quOurCommercialNetworkVisible: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'V'
      DisplayWidth = 3
      FieldName = 'Visible'
    end
    object quOurCommercialNetworkTrash: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'D'
      DisplayWidth = 3
      FieldName = 'Trash'
    end
  end
  object UpdateOurCommercialNetwork: TMSUpdateSQL
    InsertSQL.Strings = (
      'insert into OurCommercialNetwork '
      '  (CommercialNetworkNo,NameCommercialNetwork,Visible,Trash)'
      'values'
      '  (:CommercialNetworkNo,:NameCommercialNetwork,1,0)'
      ''
      
        '--select *,CommercialNetworkNo,NameCommercialNetwork,Visible,Tre' +
        'sh from OurCommercialNetwork')
    DeleteSQL.Strings = (
      'update OurCommercialNetwork'
      ' set  NameCommercialNetwork = :NameCommercialNetwork'
      '    , Visible = :Visible '
      '    , Trash = 1'
      'where CommercialNetworkNo = :CommercialNetworkNo')
    ModifySQL.Strings = (
      'update OurCommercialNetwork'
      ' set  NameCommercialNetwork = :NameCommercialNetwork'
      '    , Visible = :Visible '
      '    , Trash = :Trash'
      'where CommercialNetworkNo = :CommercialNetworkNo')
    Left = 936
    Top = 72
  end
  object dsDebtsUnderDocuments: TMSDataSource
    DataSet = quDebtsUnderDocuments
    Left = 888
    Top = 136
  end
  object quDebtsUnderDocuments: TMSQuery
    Connection = DB
    SQL.Strings = (
      'select * '
      ' from DebtsUnderDocuments'
      ' '
      '&_where'
      'order by &_order')
    Left = 864
    Top = 136
    MacroData = <
      item
        Name = '_where'
      end
      item
        Name = '_order'
        Value = 'DebtsUnderDocumentsReason'
      end>
    object quDebtsUnderDocumentsid: TSmallintField
      FieldName = 'id'
      ReadOnly = True
    end
    object quDebtsUnderDocumentsDebtsUnderDocumentsReason: TStringField
      DisplayWidth = 30
      FieldName = 'DebtsUnderDocumentsReason'
      Size = 50
    end
    object quDebtsUnderDocumentsVisible: TBooleanField
      DisplayLabel = 'V'
      DisplayWidth = 3
      FieldName = 'Visible'
    end
  end
  object UpdateDebtsUnderDocuments: TMSUpdateSQL
    InsertSQL.Strings = (
      
        'insert into DebtsUnderDocuments (DebtsUnderDocumentsReason,Visib' +
        'le)'
      ' values (:DebtsUnderDocumentsReason,1)')
    DeleteSQL.Strings = (
      'update DebtsUnderDocuments'
      ' set Visible = 0'
      'where id = :id')
    ModifySQL.Strings = (
      'update DebtsUnderDocuments'
      ' set  DebtsUnderDocumentsReason = :DebtsUnderDocumentsReason'
      '    , Visible = :Visible'
      'where id = :id')
    Left = 912
    Top = 136
  end
  object quWealth: TMSQuery
    Connection = DB
    SQL.Strings = (
      'select * ,'
      
        '       (select OtdelName from VidOtdel where OtdelNo = w.OtdelNo' +
        ') as OtdelName,'
      
        '       (select VidName from VidTov where VidNo = w.VidNo) as Vid' +
        'Name'
      ' from Wealth w'
      '  where 1 = 1'
      '&_where'
      'order by &_order')
    Left = 888
    Top = 216
    MacroData = <
      item
        Name = '_where'
      end
      item
        Name = '_order'
        Value = 'Name'
      end>
    object quWealthId: TIntegerField
      DisplayLabel = #1050#1086#1076
      DisplayWidth = 5
      FieldName = 'Id'
      ReadOnly = True
    end
    object quWealthName: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 30
      FieldName = 'Name'
      Size = 50
    end
    object quWealthOtdelNo: TIntegerField
      DisplayLabel = #1050#1086#1076' '#1086#1090#1076#1077#1083#1072
      FieldName = 'OtdelNo'
    end
    object quWealthVidNo: TIntegerField
      DisplayLabel = #1050#1086#1076' '#1074#1080#1076#1072' '#1090#1086#1074#1072#1088#1072
      FieldName = 'VidNo'
    end
    object quWealthIsVisible: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'V'
      DisplayWidth = 3
      FieldName = 'IsVisible'
    end
    object quWealthIsDelete: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'D'
      DisplayWidth = 3
      FieldName = 'IsDelete'
    end
    object quWealthOtdelName: TStringField
      DisplayLabel = #1054#1090#1076#1077#1083
      FieldName = 'OtdelName'
      Size = 30
    end
    object quWealthVidName: TStringField
      DisplayLabel = #1042#1080#1076' '#1090#1086#1074#1072#1088#1072
      FieldName = 'VidName'
      Size = 30
    end
  end
  object dsWealth: TMSDataSource
    DataSet = quWealth
    Left = 920
    Top = 216
  end
  object MSUpdateWealth: TMSUpdateSQL
    InsertSQL.Strings = (
      'insert into Wealth (Name , OtdelNo , VidNo, IsVisible, IsDelete)'
      ' values (:Name , :OtdelNo , :VidNo, 1, 0)')
    DeleteSQL.Strings = (
      'update Wealth '
      ' set IsDelete = 1'
      'where id = :id')
    ModifySQL.Strings = (
      'update Wealth '
      ' set Name = :Name'
      '   , OtdelNo = :OtdelNo'
      '   , VidNo = :VidNo'
      '   , IsVisible = :IsVisible'
      '   , IsDelete = :IsDelete'
      'where id = :id')
    Left = 952
    Top = 216
  end
  object quReasonDiscrepancy: TMSQuery
    SQLDelete.Strings = (
      '/*'
      'update CarCompany'
      ' set IsTrash = 1'
      'where IdCarCompany = :IdCarCompany'
      '*/')
    Connection = DB
    SQL.Strings = (
      'select * '
      ' from ReasonDiscrepancy'
      '  where &_where')
    UpdateObject = UpdateReasonDiscrepancy
    Left = 192
    Top = 584
    MacroData = <
      item
        Name = '_where'
        Value = '1=1'
      end>
    object quReasonDiscrepancyIdReasonDiscrepancy: TIntegerField
      DisplayLabel = #1050#1086#1076' '
      DisplayWidth = 5
      FieldName = 'IdReasonDiscrepancy'
      ReadOnly = True
    end
    object quReasonDiscrepancyNameReasonDiscrepancy: TStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072' '#1072#1082#1090#1072' '#1088#1072#1089#1093#1086#1078#1076#1077#1085#1080#1103
      DisplayWidth = 60
      FieldName = 'NameReasonDiscrepancy'
      Size = 30
    end
    object quReasonDiscrepancyIsVisible: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'V'
      DisplayWidth = 3
      FieldName = 'IsVisible'
    end
    object quReasonDiscrepancyIsTrash: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'D'
      DisplayWidth = 3
      FieldName = 'IsTrash'
    end
  end
  object dsReasonDiscrepancy: TMSDataSource
    DataSet = quReasonDiscrepancy
    Left = 224
    Top = 584
  end
  object UpdateReasonDiscrepancy: TMSUpdateSQL
    InsertSQL.Strings = (
      
        'insert into ReasonDiscrepancy(NameReasonDiscrepancy, IsVisible, ' +
        'IsTrash)'
      ' values (:NameReasonDiscrepancy, 1, 0)')
    DeleteSQL.Strings = (
      'update ReasonDiscrepancy'
      ' set IsTrash = 1'
      'where IdReasonDiscrepancy = :IdReasonDiscrepancy')
    ModifySQL.Strings = (
      'update ReasonDiscrepancy'
      ' set NameReasonDiscrepancy = :NameReasonDiscrepancy'
      '   , isVisible = :isVisible'
      'where IdReasonDiscrepancy = :IdReasonDiscrepancy')
    Left = 256
    Top = 584
  end
  object quWhatDone: TMSQuery
    SQLDelete.Strings = (
      '/*'
      'update CarCompany'
      ' set IsTrash = 1'
      'where IdCarCompany = :IdCarCompany'
      '*/')
    Connection = DB
    SQL.Strings = (
      'select * '
      ' from WhatDone'
      '  where &_where')
    UpdateObject = UpdateWhatDone
    Left = 304
    Top = 584
    MacroData = <
      item
        Name = '_where'
        Value = '1=1'
      end>
    object quWhatDoneIdWhatDone: TIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'IdWhatDone'
      ReadOnly = True
    end
    object quWhatDoneNameWhatDone: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'NameWhatDone'
      Size = 60
    end
    object quWhatDoneIsVisible: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'V'
      DisplayWidth = 3
      FieldName = 'IsVisible'
    end
    object quWhatDoneIsTrash: TBooleanField
      DisplayLabel = 'D'
      DisplayWidth = 3
      FieldName = 'IsTrash'
    end
  end
  object dsWhatDone: TMSDataSource
    DataSet = quWhatDone
    Left = 336
    Top = 584
  end
  object UpdateWhatDone: TMSUpdateSQL
    InsertSQL.Strings = (
      'insert into WhatDone(NameWhatDone, IsVisible, IsTrash)'
      ' values (:NameWhatDone, 1, 0)')
    DeleteSQL.Strings = (
      'update WhatDone'
      ' set IsTrash = 1'
      'where IdWhatDone = :IdWhatDone')
    ModifySQL.Strings = (
      'update WhatDone'
      ' set NameWhatDone = :NameWhatDone'
      '   , isVisible = :isVisible'
      'where IdWhatDone = :IdWhatDone')
    Left = 368
    Top = 584
  end
  object quPrintBlankToNaklR: TMSQuery
    SQLDelete.Strings = (
      '/*'
      'update CarCompany'
      ' set IsTrash = 1'
      'where IdCarCompany = :IdCarCompany'
      '*/')
    Connection = DB
    SQL.Strings = (
      'select * '
      ' from PrintBlankToNaklR'
      '  where &_where')
    UpdateObject = UpdatePrintBlankToNaklR
    Left = 416
    Top = 584
    MacroData = <
      item
        Name = '_where'
        Value = '1=1'
      end>
    object quPrintBlankToNaklRIdPrintBlankToNaklR: TIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'IdPrintBlankToNaklR'
      ReadOnly = True
    end
    object quPrintBlankToNaklRNamePrintBlankToNaklR: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1073#1083#1072#1085#1082#1072
      DisplayWidth = 30
      FieldName = 'NamePrintBlankToNaklR'
      Size = 120
    end
    object quPrintBlankToNaklRIsVisible: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'V'
      DisplayWidth = 3
      FieldName = 'IsVisible'
    end
    object quPrintBlankToNaklRIsTrash: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'D'
      DisplayWidth = 3
      FieldName = 'IsTrash'
    end
    object quPrintBlankToNaklRDescription: TStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077
      DisplayWidth = 30
      FieldName = 'Description'
      Size = 250
    end
  end
  object dsPrintBlankToNaklR: TMSDataSource
    DataSet = quPrintBlankToNaklR
    Left = 448
    Top = 584
  end
  object UpdatePrintBlankToNaklR: TMSUpdateSQL
    InsertSQL.Strings = (
      
        'insert into PrintBlankToNaklR(NamePrintBlankToNaklR, IsVisible, ' +
        'IsTrash, Description)'
      ' values (:NamePrintBlankToNaklR, 1, 0, :Description)')
    DeleteSQL.Strings = (
      'update PrintBlankToNaklR'
      ' set IsTrash = 1'
      'where IdPrintBlankToNaklR = :IdPrintBlankToNaklR')
    ModifySQL.Strings = (
      'update PrintBlankToNaklR'
      ' set NamePrintBlankToNaklR = :NamePrintBlankToNaklR'
      '   , isVisible = :isVisible'
      '   , Description = :Description'
      'where IdPrintBlankToNaklR = :IdPrintBlankToNaklR')
    Left = 480
    Top = 584
  end
  object dsActOfDiscrepancy: TMSDataSource
    DataSet = quActOfDiscrepancy
    Left = 16
    Top = 712
  end
  object quActOfDiscrepancy: TMSQuery
    SQLInsert.Strings = (
      
        'insert into ActOfDiscrepancy (NaklPkey, TovarNo, QtyFirst, Qty, ' +
        'IdReasonDiscrepancy, IdWhatDone, Guilty, Original, Description)'
      
        '             values (:NaklPkey, :TovarNo, :QtyFirst, :Qty, :IdRe' +
        'asonDiscrepancy, :IdWhatDone, :Guilty, :Original, :Description)')
    SQLDelete.Strings = (
      'delete ActOfDiscrepancy'
      'where id = : id')
    SQLUpdate.Strings = (
      'update ActOfDiscrepancy'
      ' set  TovarNo'
      '    , QtyFirst'
      '    , Qty'
      '    , IdReasonDiscrepancy'
      '    , IdWhatDone'
      '    , Guilty'
      '    , Original'
      '    , Description'
      'where id = :id')
    Connection = DB
    SQL.Strings = (
      'select  a.Id'
      '      , nr.Nom'
      '      , a.TovarNo'
      '      , t.NameTovar'
      '      , a.QtyFirst'
      '      , a.Qty'
      '      , a.IdReasonDiscrepancy'
      '      , r.NameReasonDiscrepancy'
      '      , a.IdWhatDone'
      '      , w.NameWhatDone'
      '      , a.Guilty'
      '      , a.Original'
      '      , a.Description'
      '      , a.NaklPkey'
      '      , a.Entity_Type'
      '      , a.UserNo'
      ' from ActOfDiscrepancy a left join'
      
        '      ReasonDiscrepancy r on r.IdReasonDiscrepancy = a.IdReasonD' +
        'iscrepancy left join'
      '      WhatDone w on w.IdWhatDone = a.IdWhatDone left join'
      '      NaklR nr on nr.pkey = a.NaklPkey left join'
      '      Tovar t on t.TovarNo = a.TovarNo'
      '  where a.NaklPkey = :NaklPkey'
      '&_where'
      'order by t.NameTovar')
    UpdateObject = UpdateActOfDiscrepancy
    Left = 56
    Top = 712
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'NaklPkey'
        Value = nil
      end>
    MacroData = <
      item
        Name = '_where'
      end>
    object quActOfDiscrepancyId: TLargeintField
      DisplayLabel = #1050#1086#1076' '#1072#1082#1090#1072
      DisplayWidth = 10
      FieldName = 'Id'
    end
    object quActOfDiscrepancyNom: TIntegerField
      DisplayLabel = #8470' '#1053#1072#1082#1083#1072#1076#1085#1086#1081
      DisplayWidth = 12
      FieldName = 'Nom'
    end
    object quActOfDiscrepancyNameTovar: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
      DisplayWidth = 30
      FieldName = 'NameTovar'
      Size = 128
    end
    object quActOfDiscrepancyQtyFirst: TFloatField
      DisplayLabel = #1050#1086#1083'. '#1073#1099#1083#1086
      FieldName = 'QtyFirst'
    end
    object quActOfDiscrepancyQty: TFloatField
      DisplayLabel = #1050#1086#1083'. '#1089#1090#1072#1083#1086
      FieldName = 'Qty'
    end
    object quActOfDiscrepancyIdReasonDiscrepancy: TIntegerField
      FieldName = 'IdReasonDiscrepancy'
      Visible = False
    end
    object quActOfDiscrepancyNameReasonDiscrepancy: TStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072
      DisplayWidth = 30
      FieldName = 'NameReasonDiscrepancy'
      Size = 60
    end
    object quActOfDiscrepancyIdWhatDone: TIntegerField
      FieldName = 'IdWhatDone'
      Visible = False
    end
    object quActOfDiscrepancyNameWhatDone: TStringField
      DisplayLabel = #1063#1090#1086' '#1089#1076#1077#1083#1072#1085#1086
      DisplayWidth = 30
      FieldName = 'NameWhatDone'
      Size = 60
    end
    object quActOfDiscrepancyGuilty: TStringField
      DisplayLabel = #1042#1080#1085#1086#1074#1085#1099#1081
      DisplayWidth = 30
      FieldName = 'Guilty'
      Size = 50
    end
    object quActOfDiscrepancyOriginal: TStringField
      DisplayLabel = #1054#1088#1080#1075#1080#1085#1072#1083
      DisplayWidth = 30
      FieldName = 'Original'
      Size = 50
    end
    object quActOfDiscrepancyDescription: TStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077
      DisplayWidth = 30
      FieldName = 'Description'
      Size = 250
    end
    object quActOfDiscrepancyNaklPkey: TLargeintField
      FieldName = 'NaklPkey'
    end
    object quActOfDiscrepancyTovarNo: TLargeintField
      FieldName = 'TovarNo'
    end
    object quActOfDiscrepancyEntity_Type: TStringField
      FieldName = 'Entity_Type'
      Size = 30
    end
    object quActOfDiscrepancyUserNo: TIntegerField
      FieldName = 'UserNo'
    end
  end
  object UpdateActOfDiscrepancy: TMSUpdateSQL
    InsertSQL.Strings = (
      'declare @NotSignatureOtdel varchar(256)'
      '      , @OtdelName varchar(50)'
      ''
      '  declare CS cursor scroll local for   '
      '  select distinct OtdelName'
      '   from ListUserForVidDoc l left join'
      '        VidOtdel vo on vo.OtdelNo = l.OtdelNo'
      '    where IdVidDoc = 7'
      ''
      '  open CS;'
      '  while 1= 1 '
      '   begin'
      '     fetch next from CS '
      '      into  @OtdelName'
      '      '
      '      if @@FETCH_STATUS <> 0 break'
      '       begin'
      
        '         set @NotSignatureOtdel = isnull(@NotSignatureOtdel,'#39#39') ' +
        '+ rtrim(ltrim(@OtdelName)) + '#39', '#39
      '       end'
      '     '
      '  end'
      '  close CS;'
      '  deallocate CS;'
      ''
      
        'set @NotSignatureOtdel = substring(@NotSignatureOtdel,1,LEN(@Not' +
        'SignatureOtdel)-1)'
      ''
      'INSERT INTO ActOfDiscrepancy'
      
        '  (NaklPkey, TovarNo, QtyFirst, Qty, IdReasonDiscrepancy, IdWhat' +
        'Done, Guilty, Original, Description, Entity_Type, UserNo, NotSig' +
        'natureOtdel)'
      'VALUES'
      
        '  (:NaklPkey, :TovarNo, :QtyFirst, :Qty, :IdReasonDiscrepancy, :' +
        'IdWhatDone, :Guilty, :Original, :Description, :Entity_Type, :Use' +
        'rNo, @NotSignatureOtdel)'
      'SET :id = SCOPE_IDENTITY()')
    DeleteSQL.Strings = (
      'DELETE FROM ActOfDiscrepancy'
      'WHERE'
      '  id = :Old_id')
    ModifySQL.Strings = (
      'declare @NotSignatureOtdel varchar(256)'
      '      , @OtdelName varchar(50)'
      ''
      '  declare CS cursor scroll local for   '
      '  select distinct OtdelName'
      '   from ListUserForVidDoc l left join'
      '        VidOtdel vo on vo.OtdelNo = l.OtdelNo'
      '    where IdVidDoc = 7'
      ''
      '  open CS;'
      '  while 1= 1 '
      '   begin'
      '     fetch next from CS '
      '      into  @OtdelName'
      '      '
      '      if @@FETCH_STATUS <> 0 break'
      '       begin'
      
        '         set @NotSignatureOtdel = isnull(@NotSignatureOtdel,'#39#39') ' +
        '+ rtrim(ltrim(@OtdelName)) + '#39', '#39
      '       end'
      '     '
      '  end'
      '  close CS;'
      '  deallocate CS;'
      ''
      
        'set @NotSignatureOtdel = substring(@NotSignatureOtdel,1,LEN(@Not' +
        'SignatureOtdel)-1)'
      ''
      'UPDATE ActOfDiscrepancy'
      'SET NaklPkey = :NaklPkey'
      '  , TovarNo = :TovarNo'
      '  , QtyFirst = :QtyFirst'
      '  , Qty = :Qty'
      '  , IdReasonDiscrepancy = :IdReasonDiscrepancy'
      '  , IdWhatDone = :IdWhatDone'
      '  , Guilty = :Guilty'
      '  , Original = :Original'
      '  , Description = :Description'
      '  , Entity_Type = :Entity_Type'
      '  , UserNo = :UserNo'
      '  , NotSignatureOtdel = @NotSignatureOtdel'
      'WHERE'
      '  id = :Old_id')
    RefreshSQL.Strings = (
      
        'SELECT ActOfDiscrepancy.NaklPkey, ActOfDiscrepancy.TovarNo, ActO' +
        'fDiscrepancy.QtyFirst, ActOfDiscrepancy.Qty, ActOfDiscrepancy.Id' +
        'ReasonDiscrepancy, ActOfDiscrepancy.IdWhatDone, ActOfDiscrepancy' +
        '.Guilty, ActOfDiscrepancy.Original, ActOfDiscrepancy.Description' +
        ', ActOfDiscrepancy.Entity_Type, ActOfDiscrepancy.UserNo FROM Act' +
        'OfDiscrepancy'
      'WHERE'
      '  id = :id')
    Left = 104
    Top = 712
  end
  object quSetupForWealth: TMSQuery
    Connection = DB
    SQL.Strings = (
      'SELECT *'
      'FROM SetupForWealth')
    UpdateObject = UpdateSetupForWealth
    BeforePost = quSetupForWealthBeforePost
    Left = 208
    Top = 720
    object quSetupForWealthDateBlock: TDateTimeField
      FieldName = 'DateBlock'
    end
  end
  object dsSetupForWealth: TMSDataSource
    DataSet = quSetupForWealth
    Left = 254
    Top = 721
  end
  object UpdateSetupForWealth: TMSUpdateSQL
    InsertSQL.Strings = (
      'insert into SetupForWealth'
      '  (DateBlock)'
      'values'
      '  (:DateBlock)')
    DeleteSQL.Strings = (
      'delete from SetupForWealth'
      'where'
      '  DateBlock = :OLD_DateBlock')
    ModifySQL.Strings = (
      'update SetupForWealth'
      'set'
      '  DateBlock = :DateBlock'
      'where'
      '  DateBlock = :OLD_DateBlock')
    Left = 301
    Top = 721
  end
end
