object frmHouseReport: TfrmHouseReport
  Left = 0
  Top = 0
  Caption = 'House Report'
  ClientHeight = 222
  ClientWidth = 677
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
  object ImgPieChart: TImage
    Left = 362
    Top = 24
    Width = 271
    Height = 175
  end
  object DBGridHouseReport: TDBGrid
    AlignWithMargins = True
    Left = 56
    Top = 64
    Width = 217
    Height = 97
    BorderStyle = bsNone
    Ctl3D = False
    DataSource = DataSource1
    FixedColor = clSkyBlue
    Options = [dgTitles]
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = DataModule1.ADOQuery1
    Left = 80
    Top = 104
  end
end
