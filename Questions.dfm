object frmQuestions: TfrmQuestions
  Left = 0
  Top = 0
  Caption = 'Question Administration'
  ClientHeight = 481
  ClientWidth = 851
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
    Left = 22
    Top = 20
    Width = 699
    Height = 29
    Alignment = taCenter
    AutoSize = False
    Caption = 'Questions'
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
  object PnlAddQuestion: TPanel
    Left = 22
    Top = 169
    Width = 716
    Height = 297
    TabOrder = 6
    Visible = False
    object Label3: TLabel
      Left = 56
      Top = 202
      Width = 70
      Height = -6
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'House'
    end
    object Label4: TLabel
      Left = 16
      Top = 39
      Width = 73
      Height = 19
      AutoSize = False
      Caption = 'Question'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 28
      Top = 126
      Width = 73
      Height = 19
      AutoSize = False
      Caption = 'Answers'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 16
      Top = 14
      Width = 73
      Height = 19
      AutoSize = False
      Caption = 'Add'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnSaveAddQuestion: TButton
      Left = 624
      Top = 255
      Width = 75
      Height = 25
      Caption = 'Save'
      TabOrder = 0
      OnClick = btnSaveAddQuestionClick
    end
    object btnCancelAdd: TButton
      Left = 532
      Top = 254
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelAddClick
    end
    object edtAddQ: TRichEdit
      Left = 95
      Top = 39
      Width = 505
      Height = 64
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'edtQ')
      ParentFont = False
      TabOrder = 2
    end
    object edtAddA1: TRichEdit
      Left = 107
      Top = 109
      Width = 483
      Height = 38
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'edtA1')
      ParentFont = False
      TabOrder = 3
    end
    object edtAddA2: TRichEdit
      Left = 107
      Top = 153
      Width = 483
      Height = 38
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'edtA1')
      ParentFont = False
      TabOrder = 4
    end
    object edtAddA3: TRichEdit
      Left = 107
      Top = 197
      Width = 483
      Height = 38
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'edtA1')
      ParentFont = False
      TabOrder = 5
    end
  end
  object pnlEditQuestion: TPanel
    Left = 22
    Top = 171
    Width = 716
    Height = 292
    TabOrder = 1
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
    object Label23: TLabel
      Left = 16
      Top = 39
      Width = 69
      Height = 18
      Caption = 'Question'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 30
      Top = 126
      Width = 65
      Height = 18
      Caption = 'Answers'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 14
      Width = 73
      Height = 19
      AutoSize = False
      Caption = 'Edit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnSaveEditQuestion: TButton
      Left = 624
      Top = 254
      Width = 75
      Height = 25
      Caption = 'Update'
      TabOrder = 0
      OnClick = btnSaveEditQuestionClick
    end
    object btnCancelEditUser: TButton
      Left = 532
      Top = 254
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelEditUserClick
    end
    object edtQ: TRichEdit
      Left = 95
      Top = 39
      Width = 538
      Height = 64
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'edtQ')
      ParentFont = False
      TabOrder = 2
    end
    object edtA1: TRichEdit
      Left = 109
      Top = 109
      Width = 506
      Height = 38
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'edtA1')
      ParentFont = False
      TabOrder = 3
    end
    object edtA2: TRichEdit
      Left = 109
      Top = 153
      Width = 506
      Height = 38
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'edtA1')
      ParentFont = False
      TabOrder = 4
    end
    object edtA3: TRichEdit
      Left = 109
      Top = 197
      Width = 506
      Height = 38
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'edtA1')
      ParentFont = False
      TabOrder = 5
    end
  end
  object btnCloseForm: TButton
    Left = 768
    Top = 448
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 0
    OnClick = btnCloseFormClick
  end
  object btnRefreshUserList: TButton
    Left = 744
    Top = 35
    Width = 75
    Height = 25
    Caption = 'Refresh'
    TabOrder = 2
    Visible = False
    OnClick = btnRefreshUserListClick
  end
  object btnNewUser: TButton
    Left = 744
    Top = 66
    Width = 75
    Height = 25
    Caption = 'New'
    TabOrder = 3
    OnClick = btnNewUserClick
  end
  object LBQuestions: TListBox
    Left = 22
    Top = 40
    Width = 699
    Height = 113
    ItemHeight = 13
    TabOrder = 4
    OnClick = LBQuestionsClick
  end
  object btnDeleteQuestion: TButton
    Left = 744
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Delete'
    TabOrder = 5
    Visible = False
    OnClick = btnDeleteQuestionClick
  end
end
