object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 340
  Width = 500
  object ADOCheckersDBCnn: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Password="";Data Source=C:\User' +
      's\Joe\Documents\MyComputingProject\checkers.mdb;Persist Security' +
      ' Info=True'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 112
    Top = 48
  end
  object ADOQuery1: TADOQuery
    Connection = ADOCheckersDBCnn
    CursorType = ctStatic
    MaxRecords = 6
    Parameters = <>
    Left = 72
    Top = 104
  end
  object ADOtblCheckerUser: TADOTable
    Connection = ADOCheckersDBCnn
    CursorType = ctStatic
    TableName = 'CheckerUser'
    Left = 144
    Top = 104
  end
  object ADOCommand1: TADOCommand
    Connection = ADOCheckersDBCnn
    Parameters = <>
    Left = 112
    Top = 168
  end
  object ADOtblCheckerQuestions: TADOTable
    Connection = ADOCheckersDBCnn
    CursorType = ctStatic
    TableName = 'Question'
    Left = 240
    Top = 104
  end
end
