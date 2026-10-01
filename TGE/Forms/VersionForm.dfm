object FormVersion: TFormVersion
  Left = 313
  Top = 112
  Width = 389
  Height = 352
  BorderIcons = []
  Caption = 'Version'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 18
    Width = 64
    Height = 13
    Caption = 'Major Version'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 200
    Top = 18
    Width = 64
    Height = 13
    Caption = 'Minor Version'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 32
    Top = 48
    Width = 44
    Height = 13
    Caption = 'Comment'
  end
  object UpDown1: TUpDown
    Left = 161
    Top = 16
    Width = 15
    Height = 21
    Associate = Edit1
    Min = 1
    Max = 10000
    Position = 1
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 104
    Top = 16
    Width = 57
    Height = 21
    TabOrder = 1
    Text = '1'
  end
  object Edit2: TEdit
    Left = 280
    Top = 16
    Width = 57
    Height = 21
    TabOrder = 2
    Text = '0'
  end
  object UpDown2: TUpDown
    Left = 337
    Top = 16
    Width = 15
    Height = 21
    Associate = Edit2
    Max = 10000
    TabOrder = 3
  end
  object Button1: TButton
    Left = 24
    Top = 280
    Width = 105
    Height = 25
    Caption = 'Ok'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 240
    Top = 280
    Width = 113
    Height = 25
    Caption = 'Cancel'
    TabOrder = 5
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 24
    Top = 64
    Width = 329
    Height = 193
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    TabOrder = 6
  end
end
