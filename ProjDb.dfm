object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 353
  Width = 647
  object ADOCheckersDBCnn: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\Joe\Docume' +
      'nts\checkers\checkers.mdb;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 176
    Top = 24
  end
  object ADOQuery1: TADOQuery
    Connection = ADOCheckersDBCnn
    CursorType = ctStatic
    MaxRecords = 6
    Parameters = <>
    Left = 24
    Top = 80
  end
  object ADOtblCheckerUser: TADOTable
    Connection = ADOCheckersDBCnn
    CursorType = ctStatic
    TableName = 'CheckerUser'
    Left = 312
    Top = 80
  end
  object ADOCommand1: TADOCommand
    Connection = ADOCheckersDBCnn
    Parameters = <>
    Left = 96
    Top = 80
  end
  object ADOtblCheckerQuestions: TADOTable
    Connection = ADOCheckersDBCnn
    CursorType = ctStatic
    TableName = 'Question'
    Left = 200
    Top = 80
  end
  object ADOConnectionExcel: TADOConnection
    Left = 544
    Top = 152
  end
  object ADOTableUserReport: TADOTable
    Connection = ADOConnectionExcel
    Left = 544
    Top = 208
  end
  object ADOQuery2: TADOQuery
    Connection = ADOCheckersDBCnn
    CursorType = ctStatic
    MaxRecords = 6
    Parameters = <>
    Left = 392
    Top = 80
  end
end
