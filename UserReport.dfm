object frmUserReport: TfrmUserReport
  Left = 0
  Top = 0
  Caption = 'User Report'
  ClientHeight = 387
  ClientWidth = 899
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
  object Label2: TLabel
    Left = 19
    Top = 62
    Width = 3
    Height = 13
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 289
    Height = 25
    Caption = 'Individual Student Reports:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object DBNavigator1: TDBNavigator
    Left = 304
    Top = 295
    Width = 180
    Height = 25
    DataSource = DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 40
    Width = 875
    Height = 249
    DataSource = DataSource1
    FixedColor = clSkyBlue
    Options = [dgTitles, dgRowLines, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object RGOrderBy: TRadioGroup
    Left = 8
    Top = 287
    Width = 185
    Height = 80
    Caption = 'Order By (High - Low)'
    Items.Strings = (
      'Average Score Per Game'
      'Total Score'
      'Correct Answers (%)')
    TabOrder = 2
    OnClick = RGOrderByClick
  end
  object DataSource1: TDataSource
    DataSet = DataModule1.ADOQuery1
    Left = 72
    Top = 184
  end
end
