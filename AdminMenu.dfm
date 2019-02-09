object frmAdminMenu: TfrmAdminMenu
  Left = 0
  Top = 0
  Caption = 'Admin Menu'
  ClientHeight = 522
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 17
  object btnUsers: TButton
    Left = 94
    Top = 63
    Width = 98
    Height = 32
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Users'
    TabOrder = 0
    OnClick = btnUsersClick
  end
  object btnQuestions: TButton
    Left = 94
    Top = 136
    Width = 98
    Height = 33
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Questions'
    TabOrder = 1
  end
end
