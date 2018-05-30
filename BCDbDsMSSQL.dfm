inherited BCDbDsMSSQLDm: TBCDbDsMSSQLDm
  Height = 353
  Width = 413
  object QuSaveProfile: TMSQuery
    SQL.Strings = (
      'declare'
      '  @Lrowid   varchar(256)'
      '  ,@Lowner   varchar(256)'
      '  ,@Lsection varchar(256)'
      '  ,@ldata    varchar(max)'
      'begin'
      '  set @Lowner   = USER_NAME()'
      '--  set @Lsection = :Section '
      '--  set @ldata = :Data '
      '/*'
      '  select max(rowid)'
      '    into Lrowid'
      '    from Sa.Profile'
      '   where Owner = @Lowner'
      '     and Section = @Lsection;'
      ''
      '  if Lrowid is null then'
      
        '    insert into Sa.Profile (Owner, Section, Data) values (@Lowne' +
        'r, @Lsection, @ldata);'
      '  else'
      '    update Sa.Profile'
      '       set Data = @ldata'
      '     where rowid=@Lrowid;'
      '  end if;*/'
      'end')
    Left = 32
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Section'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'Data'
        Value = nil
      end>
  end
  object QuLoadProfile: TMSQuery
    SQL.Strings = (
      'declare'
      '  @Lrowid   varchar(256)'
      '  ,@Lowner   varchar(256)'
      '  ,@Lsection varchar(256)'
      '  ,@ldata    varchar(max)'
      'begin'
      '  set @Lowner   = USER_NAME()'
      '--  set @Lsection = :Section '
      '--  set @ldata = :Data '
      '/*'
      '  select max(rowid)'
      '    into Lrowid'
      '    from Sa.Profile'
      '   where Owner = @Lowner'
      '     and Section = @Lsection;'
      ''
      '  if Lrowid is null then'
      
        '    insert into Sa.Profile (Owner, Section, Data) values (@Lowne' +
        'r, @Lsection, @ldata);'
      '  else'
      '    update Sa.Profile'
      '       set Data = @ldata'
      '     where rowid=@Lrowid;'
      '  end if;*/'
      'end')
    Left = 32
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Section'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'Data'
        Value = nil
      end>
  end
  object DBDev: TMSConnection
    Database = 'work'
    Options.KeepDesignConnected = False
    Username = 'sa'
    Server = 'ANDREY\ANDREY_2008'
    Left = 88
    Top = 8
  end
end
