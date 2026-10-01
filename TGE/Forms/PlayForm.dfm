object FormPlay: TFormPlay
  Left = 238
  Top = 146
  Width = 1019
  Height = 667
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biMinimize, biMaximize]
  Caption = #1048#1075#1088#1072
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ProgressLabel: TLabel
    Left = 168
    Top = 687
    Width = 67
    Height = 13
    Caption = 'ProgressLabel'
  end
  object TextEditButton: TSpeedButton
    Left = 448
    Top = 680
    Width = 136
    Height = 25
    AllowAllUp = True
    GroupIndex = 1
    Caption = 'Edit mode'
    OnClick = TextEditButtonClick
  end
  object ParamEditButton: TSpeedButton
    Left = 824
    Top = 369
    Width = 105
    Height = 25
    Caption = 'ParamEdit'
    OnClick = ParamEditButtonClick
  end
  object ParLabel1: TRichEdit
    Left = 753
    Top = 5
    Width = 248
    Height = 349
    BorderStyle = bsNone
    Color = clBtnFace
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
  object CancelButton: TButton
    Left = 859
    Top = 681
    Width = 136
    Height = 24
    Caption = #1055#1088#1077#1082#1088#1072#1090#1080#1090#1100' '#1080#1075#1088#1091
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = CancelButtonClick
  end
  object MakeUndoButton: TButton
    Left = 13
    Top = 682
    Width = 136
    Height = 23
    Caption = #1064#1072#1075' '#1085#1072#1079#1072#1076
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = MakeUndoButtonClick
  end
  object AnswersScrollBox: TScrollBox
    Left = 5
    Top = 400
    Width = 996
    Height = 258
    VertScrollBar.ButtonSize = 10
    VertScrollBar.Size = 10
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object SDTRichEdit: TRichEdit
    Left = 5
    Top = 5
    Width = 740
    Height = 388
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    HideScrollBars = False
    Lines.Strings = (
      ''
      #1083#1103'-'#1083#1103'-'#1083#1103)
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    WantTabs = True
  end
  object Panel1: TPanel
    Left = 180
    Top = 242
    Width = 332
    Height = 84
    TabOrder = 1
    Visible = False
    object LabelWait: TLabel
      Left = 38
      Top = 32
      Width = 269
      Height = 13
      Caption = #1055#1086#1078#1072#1083#1091#1081#1089#1090#1072', '#1087#1086#1076#1086#1078#1076#1080#1090#1077'. '#1048#1076#1077#1090' '#1087#1086#1076#1075#1086#1090#1086#1074#1082#1072' '#1076#1072#1085#1085#1099#1093'.'
    end
  end
  object StartGameTimer: TTimer
    Enabled = False
    Interval = 1
    OnTimer = StartGameTimerTimer
    Left = 344
    Top = 679
  end
end
