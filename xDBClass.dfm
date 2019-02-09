object CheckersDb: TCheckersDb
  Left = 0
  Top = 0
  ClientHeight = 295
  ClientWidth = 482
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
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
    Left = 272
    Top = 184
  end
  object ADOtblCheckerUser: TADOTable
    Connection = ADOCheckersDBCnn
    CursorType = ctStatic
    TableName = 'CheckerUser'
    Left = 48
    Top = 120
  end
  object ADOCommand1: TADOCommand
    Connection = ADOCheckersDBCnn
    Parameters = <>
    Left = 160
    Top = 152
  end
  object ADOtblCheckerQuestions: TADOTable
    Connection = ADOCheckersDBCnn
    CursorType = ctStatic
    TableName = 'Question'
    Left = 56
    Top = 176
  end
  object ADOQuery2: TADOQuery
    Connection = ADOCheckersDBCnn
    LockType = ltReadOnly
    Parameters = <>
    Left = 360
    Top = 184
  end
end
