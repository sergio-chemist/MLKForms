inherited BCDbMSSQLDm: TBCDbMSSQLDm
  OldCreateOrder = True
  Height = 196
  Width = 241
  object DB: TMSConnection
    Database = 'work'
    ConnectionTimeout = 3500
    Options.KeepDesignConnected = False
    Username = 'sa'
    Server = 'ANDREY\ANDREY_2008'
    LoginPrompt = False
    Left = 40
    Top = 18
    EncryptedPassword = '8AFF95FF97FF94FF95FF9BFF8DFF99FF'
  end
  object QFO: TMSQuery
    Connection = DB
    Options.EnableBCD = True
    Left = 112
    Top = 16
  end
end
