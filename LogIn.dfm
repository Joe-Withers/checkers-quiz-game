object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  Caption = 'Loggin in'
  ClientHeight = 170
  ClientWidth = 347
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlforgoten: TPanel
    Left = 0
    Top = 0
    Width = 353
    Height = 172
    TabOrder = 1
    Visible = False
    object lblEmail: TLabel
      Left = 13
      Top = 64
      Width = 74
      Height = 13
      Caption = 'E-mail Address:'
    end
    object Label1: TLabel
      Left = 30
      Top = 15
      Width = 297
      Height = 26
      Caption = 
        'Enter your E-mail Address and click send to be have an E-mail se' +
        'nt  to your E-mail Address containing your Log in Details.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object btnSendEmail: TButton
      Left = 252
      Top = 94
      Width = 75
      Height = 25
      Caption = 'Send'
      TabOrder = 0
      OnClick = btnSendEmailClick
    end
    object edtEmail: TEdit
      Left = 93
      Top = 64
      Width = 221
      Height = 21
      TabOrder = 1
    end
    object Button2: TButton
      Left = 252
      Top = 138
      Width = 75
      Height = 25
      Caption = 'cancel'
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object pnlEmailSent: TPanel
    Left = 0
    Top = 0
    Width = 356
    Height = 172
    TabOrder = 2
    Visible = False
    object lblEmailSent: TLabel
      Left = 117
      Top = 16
      Width = 111
      Height = 25
      Caption = 'E-mail sent.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object lblM1: TLabel
      Left = 34
      Top = 72
      Width = 168
      Height = 13
      Caption = 'If you have not recieved the Email '
    end
    object lblClick: TLabel
      Left = 202
      Top = 72
      Width = 47
      Height = 13
      Caption = 'Click Here'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = lblClickClick
    end
    object lblM2: TLabel
      Left = 252
      Top = 72
      Width = 54
      Height = 13
      Caption = 'to re-send.'
    end
    object btnLoginPanel: TButton
      Left = 136
      Top = 120
      Width = 75
      Height = 25
      Caption = 'Log In'
      TabOrder = 0
      OnClick = btnLoginPanelClick
    end
  end
  object pnlLogIn: TPanel
    Left = 0
    Top = 0
    Width = 354
    Height = 172
    TabOrder = 0
    object lblForgottenLogin: TLabel
      Left = 158
      Top = 91
      Width = 76
      Height = 13
      Caption = 'Forgotten Login'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentColor = False
      ParentFont = False
      OnClick = lblForgottenLoginClick
    end
    object lblPassword: TLabel
      Left = 53
      Top = 70
      Width = 50
      Height = 13
      Caption = 'Password:'
    end
    object lblUsername: TLabel
      Left = 53
      Top = 32
      Width = 52
      Height = 13
      Caption = 'Username:'
    end
    object edtUsername: TEdit
      Left = 114
      Top = 29
      Width = 138
      Height = 21
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 239
      Top = 123
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object edtPassword: TEdit
      Left = 114
      Top = 67
      Width = 138
      Height = 21
      PasswordChar = '*'
      TabOrder = 2
    end
    object btnLogin: TButton
      Left = 147
      Top = 123
      Width = 75
      Height = 25
      Caption = 'Login'
      TabOrder = 3
      OnClick = btnLoginClick
    end
  end
  object Email: TIdSMTP
    SASLMechanisms = <>
    Left = 104
    Top = 112
  end
end
