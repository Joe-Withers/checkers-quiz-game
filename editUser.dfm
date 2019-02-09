object frmEditUser: TfrmEditUser
  Left = 0
  Top = 0
  Caption = 'Edit User'
  ClientHeight = 394
  ClientWidth = 526
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 17
  object lblForename: TLabel
    Left = 73
    Top = 92
    Width = 54
    Height = 17
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Forname'
  end
  object lblPassword: TLabel
    Left = 73
    Top = 229
    Width = 58
    Height = 17
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Password'
  end
  object lblUsername: TLabel
    Left = 73
    Top = 160
    Width = 61
    Height = 17
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Username'
  end
  object lblEmail: TLabel
    Left = 73
    Top = 194
    Width = 36
    Height = 17
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'E-mail'
  end
  object lblSurname: TLabel
    Left = 73
    Top = 126
    Width = 55
    Height = 17
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Surname'
  end
  object lblHouse: TLabel
    Left = 73
    Top = 264
    Width = 38
    Height = 17
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'House'
  end
  object edtForename: TEdit
    Left = 146
    Top = 88
    Width = 159
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 0
  end
  object edtSurname: TEdit
    Left = 146
    Top = 122
    Width = 159
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 1
  end
  object edtLoginName: TEdit
    Left = 146
    Top = 156
    Width = 159
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 2
  end
  object edtEmail: TEdit
    Left = 146
    Top = 190
    Width = 159
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 3
  end
  object edtPassword: TEdit
    Left = 146
    Top = 225
    Width = 159
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 4
  end
  object cbAdmin: TCheckBox
    Left = 146
    Top = 54
    Width = 127
    Height = 22
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Admin'
    TabOrder = 5
  end
  object CBOHouse: TComboBox
    Left = 146
    Top = 260
    Width = 159
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 6
    Items.Strings = (
      'Curnock'
      'Davis'
      'Evers'
      'Patterson')
  end
  object btnEdit: TButton
    Left = 335
    Top = 258
    Width = 98
    Height = 32
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Edit'
    TabOrder = 7
    OnClick = btnEditClick
  end
  object btnCancel: TButton
    Left = 335
    Top = 298
    Width = 98
    Height = 33
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Cancel'
    TabOrder = 8
  end
end
