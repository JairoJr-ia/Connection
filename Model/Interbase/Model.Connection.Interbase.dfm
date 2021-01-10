object dm: Tdm
  OldCreateOrder = False
  Height = 276
  Width = 298
  object IBDatabase1: TIBDatabase
    DatabaseName = 'E:\Software\Desenvolvimento\Database\ERP.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    ServerType = 'IBServer'
    Left = 80
    Top = 56
  end
  object IBQuery1: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 192
    Top = 96
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDatabase1
    Left = 72
    Top = 136
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 200
  end
end
