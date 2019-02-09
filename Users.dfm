object frmUsers: TfrmUsers
  Left = 0
  Top = 0
  Caption = 'User Administration'
  ClientHeight = 460
  ClientWidth = 707
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblUsers: TLabel
    Left = 32
    Top = 20
    Width = 199
    Height = 21
    Alignment = taCenter
    AutoSize = False
    Caption = 'Users'
    Color = clGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object pnlUserView: TPanel
    Left = 260
    Top = 27
    Width = 421
    Height = 252
    TabOrder = 3
    object vwEmail: TLabel
      Left = 140
      Top = 153
      Width = 230
      Height = 13
      AutoSize = False
      Caption = 'E-mail'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblHouse: TLabel
      Left = 56
      Top = 202
      Width = 70
      Height = -6
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'House'
    end
    object lblSurname: TLabel
      Left = 56
      Top = 124
      Width = 70
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Surname'
    end
    object lblEmail: TLabel
      Left = 56
      Top = 153
      Width = 70
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'E-mail'
    end
    object lblUsername: TLabel
      Left = 56
      Top = 70
      Width = 70
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Login Name'
    end
    object lblForename: TLabel
      Left = 56
      Top = 97
      Width = 70
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Forename'
    end
    object Label1: TLabel
      Left = 56
      Top = 46
      Width = 70
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'User Type'
    end
    object Label2: TLabel
      Left = 56
      Top = 183
      Width = 70
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'House'
    end
    object vwHouse: TLabel
      Left = 140
      Top = 183
      Width = 230
      Height = 13
      AutoSize = False
      Caption = 'House'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object vwUsername: TLabel
      Left = 140
      Top = 70
      Width = 230
      Height = 13
      AutoSize = False
      Caption = 'Username'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object vwSurname: TLabel
      Left = 140
      Top = 124
      Width = 230
      Height = 13
      AutoSize = False
      Caption = 'Surname'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object vwForename: TLabel
      Left = 140
      Top = 97
      Width = 230
      Height = 13
      AutoSize = False
      Caption = 'Forename'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object vwUserType: TLabel
      Left = 140
      Top = 45
      Width = 230
      Height = 19
      AutoSize = False
      Caption = 'User Type'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label9: TLabel
      Left = 18
      Top = 9
      Width = 122
      Height = 19
      AutoSize = False
      Caption = 'View user'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnEditUser: TButton
      Left = 323
      Top = 211
      Width = 75
      Height = 25
      Caption = 'Edit'
      TabOrder = 1
      OnClick = btnEditUserClick
    end
    object btnDeleteUser: TButton
      Left = 230
      Top = 211
      Width = 76
      Height = 25
      Caption = 'Delete'
      TabOrder = 0
      OnClick = btnDeleteUserClick
    end
  end
  object pnlUserAddEdit: TPanel
    Left = 260
    Top = 27
    Width = 421
    Height = 252
    TabOrder = 4
    Visible = False
    object Label10: TLabel
      Left = 56
      Top = 202
      Width = 70
      Height = -6
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'House'
    end
    object Label11: TLabel
      Left = 62
      Top = 115
      Width = 76
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Surname'
    end
    object Label12: TLabel
      Left = 62
      Top = 138
      Width = 76
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'E-mail'
    end
    object Label13: TLabel
      Left = 62
      Top = 69
      Width = 76
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Login Name'
    end
    object Label14: TLabel
      Left = 62
      Top = 92
      Width = 76
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Forename'
    end
    object Label15: TLabel
      Left = 62
      Top = 46
      Width = 76
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'User Type'
    end
    object Label16: TLabel
      Left = 62
      Top = 184
      Width = 76
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'House'
    end
    object Label23: TLabel
      Left = 18
      Top = 9
      Width = 122
      Height = 19
      AutoSize = False
      Caption = 'Edit user'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPassword: TLabel
      Left = 62
      Top = 161
      Width = 76
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Password'
    end
    object btnSaveEditUser: TButton
      Left = 230
      Top = 211
      Width = 75
      Height = 25
      Caption = 'Save'
      TabOrder = 7
      OnClick = btnSaveEditUserClick
    end
    object CBOHouse: TComboBox
      Left = 160
      Top = 180
      Width = 180
      Height = 21
      TabOrder = 6
      Items.Strings = (
        'Curnock'
        'Davis'
        'Evers'
        'Patterson')
    end
    object edtEmail: TEdit
      Left = 160
      Top = 134
      Width = 209
      Height = 21
      TabOrder = 4
    end
    object edtLoginName: TEdit
      Left = 160
      Top = 65
      Width = 105
      Height = 21
      TabOrder = 1
    end
    object edtSurname: TEdit
      Left = 160
      Top = 111
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object edtForename: TEdit
      Left = 160
      Top = 88
      Width = 145
      Height = 21
      TabOrder = 2
    end
    object cbAdmin: TCheckBox
      Left = 160
      Top = 42
      Width = 97
      Height = 18
      Caption = 'Admin'
      Color = clCream
      ParentColor = False
      TabOrder = 0
    end
    object edtPassword: TEdit
      Left = 160
      Top = 157
      Width = 121
      Height = 21
      TabOrder = 5
    end
    object btnCancel: TButton
      Left = 323
      Top = 211
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 8
      OnClick = btnCancelClick
    end
  end
  object pnlAddUser: TPanel
    Left = 260
    Top = 27
    Width = 421
    Height = 252
    TabOrder = 6
    Visible = False
    object Label8: TLabel
      Left = 56
      Top = 202
      Width = 70
      Height = -6
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'House'
    end
    object Label18: TLabel
      Left = 62
      Top = 115
      Width = 76
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Surname'
    end
    object Label19: TLabel
      Left = 62
      Top = 138
      Width = 76
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'E-mail'
    end
    object Label20: TLabel
      Left = 62
      Top = 69
      Width = 76
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Login Name'
    end
    object Label21: TLabel
      Left = 62
      Top = 92
      Width = 76
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Forename'
    end
    object Label22: TLabel
      Left = 62
      Top = 46
      Width = 76
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'User Type'
    end
    object Label24: TLabel
      Left = 62
      Top = 184
      Width = 76
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'House'
    end
    object Label25: TLabel
      Left = 18
      Top = 9
      Width = 122
      Height = 19
      AutoSize = False
      Caption = 'Add user'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label26: TLabel
      Left = 62
      Top = 161
      Width = 76
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Password'
    end
    object CBAddHouse: TComboBox
      Left = 160
      Top = 180
      Width = 193
      Height = 21
      TabOrder = 6
      Items.Strings = (
        'Curnock'
        'Davis'
        'Evers'
        'Patterson')
    end
    object edtAddEmail: TEdit
      Left = 160
      Top = 134
      Width = 209
      Height = 21
      TabOrder = 4
    end
    object edtAddUsername: TEdit
      Left = 160
      Top = 63
      Width = 105
      Height = 21
      TabOrder = 1
    end
    object edtAddSurname: TEdit
      Left = 160
      Top = 111
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object edtAddForename: TEdit
      Left = 160
      Top = 88
      Width = 145
      Height = 21
      TabOrder = 2
    end
    object CBAddUserType: TCheckBox
      Left = 160
      Top = 42
      Width = 97
      Height = 18
      Caption = 'Admin'
      Color = clCream
      ParentColor = False
      TabOrder = 0
    end
    object edtAddPassword: TEdit
      Left = 160
      Top = 157
      Width = 121
      Height = 21
      TabOrder = 5
    end
    object btnCancelAddUser: TButton
      Left = 323
      Top = 211
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 8
      OnClick = btnCancelAddUserClick
    end
    object btnAddUser: TButton
      Left = 230
      Top = 211
      Width = 75
      Height = 25
      Caption = 'Add'
      TabOrder = 7
      OnClick = btnAddUserClick
    end
  end
  object LBUsers: TListBox
    Left = 32
    Top = 40
    Width = 199
    Height = 400
    ItemHeight = 13
    TabOrder = 0
    OnClick = LBUsersClick
  end
  object btnNewUser: TButton
    Left = 250
    Top = 301
    Width = 75
    Height = 24
    Caption = 'New'
    TabOrder = 1
    OnClick = btnNewUserClick
  end
  object btnRefreshUserList: TButton
    Left = 250
    Top = 340
    Width = 75
    Height = 25
    Caption = 'Refresh'
    TabOrder = 2
    Visible = False
    OnClick = btnRefreshUserListClick
  end
  object pnlUserGameInfo: TPanel
    Left = 405
    Top = 301
    Width = 224
    Height = 81
    BevelOuter = bvNone
    TabOrder = 5
    object lblGamesPlayed: TLabel
      Left = 99
      Top = 50
      Width = 230
      Height = 13
      AutoSize = False
      Caption = 'Games Played'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 50
      Width = 70
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Games played'
    end
    object lblScore: TLabel
      Left = 99
      Top = 31
      Width = 230
      Height = 13
      AutoSize = False
      Caption = 'Score'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 31
      Width = 70
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Score'
    end
    object lblLastLogin: TLabel
      Left = 99
      Top = 14
      Width = 94
      Height = 19
      AutoSize = False
      Caption = 'Last Login Date'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label17: TLabel
      Left = 8
      Top = 14
      Width = 70
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Last Login'
    end
  end
  object btnClose: TButton
    Left = 606
    Top = 415
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 7
    OnClick = btnCloseClick
  end
  object btnClearUsers: TButton
    Left = 250
    Top = 413
    Width = 103
    Height = 25
    Hint = 'Clear all users and reset game scores'
    Caption = 'Clear Users'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = btnClearUsersClick
  end
end
