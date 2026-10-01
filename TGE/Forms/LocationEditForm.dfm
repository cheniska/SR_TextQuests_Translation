object FormLocationEdit: TFormLocationEdit
  Left = 418
  Top = 121
  ActiveControl = CancelButton
  BorderStyle = bsDialog
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1083#1086#1082#1072#1094#1080#1080
  ClientHeight = 559
  ClientWidth = 770
  Color = clBtnFace
  ParentFont = True
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Scaled = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnShow = OnShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 128
    Top = 537
    Width = 77
    Height = 13
    Caption = #1055#1088#1086#1093#1086#1076#1080#1084#1086#1089#1090#1100':'
  end
  object VoidFlagPanel: TPanel
    Left = 2
    Top = 0
    Width = 767
    Height = 528
    TabOrder = 2
    object StatisticsLabel: TLabel
      Left = 10
      Top = 10
      Width = 343
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = #1058#1077#1082#1089#1090#1086#1074#1086#1077' '#1086#1087#1080#1089#1072#1085#1080#1077' '#1083#1086#1082#1072#1094#1080#1080' '#1087#1086' '#1074#1072#1088#1080#1072#1085#1090#1072#1084
      Color = clSilver
      ParentColor = False
    end
    object Label1: TLabel
      Left = 8
      Top = 500
      Width = 70
      Height = 13
      Alignment = taCenter
      Caption = #1058#1080#1087' '#1083#1086#1082#1072#1094#1080#1080' :'
    end
    object LDV_RG: TGroupBox
      Left = 9
      Top = 24
      Width = 344
      Height = 33
      TabOrder = 0
      object Label2: TLabel
        Left = 8
        Top = 12
        Width = 42
        Height = 13
        Caption = 'Descr N:'
      end
      object ComboBox1: TComboBox
        Left = 88
        Top = 8
        Width = 49
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Text = 'ComboBox1'
        OnChange = ChooseLocationDescription
      end
      object Button1: TButton
        Left = 144
        Top = 10
        Width = 90
        Height = 17
        Caption = 'Add'
        TabOrder = 1
        OnClick = AddLocationDescription
      end
      object Button2: TButton
        Left = 248
        Top = 10
        Width = 90
        Height = 17
        Caption = 'Del'
        TabOrder = 2
        OnClick = DeleteLocationDescription
      end
    end
    object LocationDescriptionEdit: TMemo
      Left = 9
      Top = 62
      Width = 748
      Height = 128
      Hint = #1042#1074#1077#1076#1080#1090#1077' '#1086#1087#1080#1089#1072#1085#1080#1077' '#1083#1086#1082#1072#1094#1080#1080
      Lines.Strings = (
        'LocationDescriptionEdit')
      ParentShowHint = False
      ScrollBars = ssVertical
      ShowHint = True
      TabOrder = 2
      OnChange = LocationDescriptionEditChange
      OnKeyDown = MemoKeyDown
    end
    object ParCustomizePanel: TPanel
      Left = 360
      Top = 235
      Width = 399
      Height = 286
      TabOrder = 3
      object Shape21: TShape
        Left = 209
        Top = 11
        Width = 181
        Height = 50
        Brush.Color = clBtnFace
        Visible = False
      end
      object Shape19: TShape
        Left = 209
        Top = 10
        Width = 181
        Height = 16
        Brush.Color = clBtnFace
        Visible = False
      end
      object Label9: TLabel
        Left = 223
        Top = 38
        Width = 14
        Height = 13
        Caption = #1086#1090':'
        Visible = False
      end
      object Label10: TLabel
        Left = 304
        Top = 39
        Width = 15
        Height = 13
        Caption = #1076#1086':'
        Visible = False
      end
      object Shape22: TShape
        Left = 209
        Top = 10
        Width = 181
        Height = 16
        Brush.Color = clBtnFace
        Visible = False
      end
      object Label11: TLabel
        Left = 213
        Top = 11
        Width = 174
        Height = 12
        Alignment = taCenter
        AutoSize = False
        Caption = #1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1080#1084#1077#1090#1100' '#1074' '#1076#1080#1072#1087#1072#1079#1086#1085#1077
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label12: TLabel
        Left = 223
        Top = 38
        Width = 14
        Height = 13
        Caption = #1086#1090':'
        Visible = False
      end
      object Label13: TLabel
        Left = 304
        Top = 39
        Width = 15
        Height = 13
        Caption = #1076#1086':'
        Visible = False
      end
      object ParCriticalMessageMemo: TMemo
        Left = 11
        Top = 122
        Width = 378
        Height = 111
        Lines.Strings = (
          'Memo1')
        ScrollBars = ssVertical
        TabOrder = 7
        OnChange = ParCriticalMessageMemoChange
        OnKeyDown = MemoKeyDown
      end
      object ParDeltaTrackBar: TTrackBar
        Left = -179
        Top = -8
        Width = 195
        Height = 24
        Max = 100
        Min = -100
        PageSize = 1
        TabOrder = 0
        TickStyle = tsNone
        Visible = False
        OnChange = ParDeltaTrackBarChange
      end
      object DeltaTypeGroupBox: TGroupBox
        Left = 10
        Top = 61
        Width = 192
        Height = 55
        TabOrder = 5
        object DeltaValueRadioBtn: TRadioButton
          Left = 10
          Top = 15
          Width = 69
          Height = 13
          Caption = #1045#1076#1080#1085#1080#1094#1099
          TabOrder = 0
          OnClick = DeltaValueRadioBtnClick
        end
        object DeltaPercentRadioBtn: TRadioButton
          Left = 100
          Top = 15
          Width = 74
          Height = 14
          Caption = #1055#1088#1086#1094#1077#1085#1090#1099
          TabOrder = 1
          OnClick = DeltaPercentRadioBtnClick
        end
        object DeltaApprRadioBtn: TRadioButton
          Left = 10
          Top = 30
          Width = 79
          Height = 17
          Caption = #1047#1085#1072#1095#1077#1085#1080#1077
          TabOrder = 2
          OnClick = DeltaApprRadioBtnClick
        end
        object DeltaExprRadioBtn: TRadioButton
          Left = 100
          Top = 30
          Width = 83
          Height = 17
          Caption = #1042#1099#1088#1072#1078#1077#1085#1080#1077
          TabOrder = 3
          OnClick = DeltaExprRadioBtnClick
        end
      end
      object MinGateEdit: TEdit
        Left = 242
        Top = 32
        Width = 48
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Text = '0'
        Visible = False
        OnKeyDown = EditKeyDown
      end
      object MaxGateEdit: TEdit
        Left = 325
        Top = 33
        Width = 51
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Text = '1'
        Visible = False
        OnKeyDown = EditKeyDown
      end
      object ParViewActionRG: TRadioGroup
        Left = 208
        Top = 61
        Width = 182
        Height = 55
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          #1053#1077' '#1090#1088#1086#1075#1072#1090#1100
          #1055#1086#1082#1072#1079#1072#1090#1100' '
          #1057#1082#1088#1099#1090#1100)
        TabOrder = 6
        OnClick = ParViewActionRGClick
      end
      object DeltaNonExprPanel: TPanel
        Left = 11
        Top = 10
        Width = 190
        Height = 51
        TabOrder = 1
        DesignSize = (
          190
          51)
        object Shape3: TShape
          Left = 0
          Top = 0
          Width = 190
          Height = 51
          Brush.Color = clBtnFace
        end
        object TrackBarGroundShape: TShape
          Left = 20
          Top = 6
          Width = 150
          Height = 18
          OnMouseDown = TrackBarGroundShapeMouseDown
          OnMouseMove = TrackBarGroundShapeMouseMove
        end
        object TrackBarRightImage: TImage
          Left = 170
          Top = 6
          Width = 15
          Height = 18
          Picture.Data = {
            07544269746D617056050000424D560500000000000036040000280000000F00
            000012000000010008000000000020010000C40E0000C40E0000000100000000
            0000000000004000000080000000FF000000002000004020000080200000FF20
            0000004000004040000080400000FF400000006000004060000080600000FF60
            0000008000004080000080800000FF80000000A0000040A0000080A00000FFA0
            000000C0000040C0000080C00000FFC0000000FF000040FF000080FF0000FFFF
            0000000020004000200080002000FF002000002020004020200080202000FF20
            2000004020004040200080402000FF402000006020004060200080602000FF60
            2000008020004080200080802000FF80200000A0200040A0200080A02000FFA0
            200000C0200040C0200080C02000FFC0200000FF200040FF200080FF2000FFFF
            2000000040004000400080004000FF004000002040004020400080204000FF20
            4000004040004040400080404000FF404000006040004060400080604000FF60
            4000008040004080400080804000FF80400000A0400040A0400080A04000FFA0
            400000C0400040C0400080C04000FFC0400000FF400040FF400080FF4000FFFF
            4000000060004000600080006000FF006000002060004020600080206000FF20
            6000004060004040600080406000FF406000006060004060600080606000FF60
            6000008060004080600080806000FF80600000A0600040A0600080A06000FFA0
            600000C0600040C0600080C06000FFC0600000FF600040FF600080FF6000FFFF
            6000000080004000800080008000FF008000002080004020800080208000FF20
            8000004080004040800080408000FF408000006080004060800080608000FF60
            8000008080004080800080808000FF80800000A0800040A0800080A08000FFA0
            800000C0800040C0800080C08000FFC0800000FF800040FF800080FF8000FFFF
            80000000A0004000A0008000A000FF00A0000020A0004020A0008020A000FF20
            A0000040A0004040A0008040A000FF40A0000060A0004060A0008060A000FF60
            A0000080A0004080A0008080A000FF80A00000A0A00040A0A00080A0A000FFA0
            A00000C0A00040C0A00080C0A000FFC0A00000FFA00040FFA00080FFA000FFFF
            A0000000C0004000C0008000C000FF00C0000020C0004020C0008020C000FF20
            C0000040C0004040C0008040C000FF40C0000060C0004060C0008060C000FF60
            C0000080C0004080C0008080C000FF80C00000A0C00040A0C00080A0C000FFA0
            C00000C0C00040C0C00080C0C000FFC0C00000FFC00040FFC00080FFC000FFFF
            C0000000FF004000FF008000FF00FF00FF000020FF004020FF008020FF00FF20
            FF000040FF004040FF008040FF00FF40FF000060FF004060FF008060FF00FF60
            FF000080FF004080FF008080FF00FF80FF0000A0FF0040A0FF0080A0FF00FFA0
            FF0000C0FF0040C0FF0080C0FF00FFC0FF0000FFFF0040FFFF0080FFFF00FFFF
            FF0000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFF00FFFFFFFFFFFFFFFFFF
            0000FFFFFFFF0000FFFFFFFFFFFFFFFF0000FFFFFFFF00FF00FFFFFFFFFFFFFF
            0000FFFFFFFF00FFFF00FFFFFFFFFFFF0000FFFFFFFF00FFFFFF00FFFFFFFFFF
            0000FFFFFFFF00FFFFFFFF00FFFFFFFF0000FFFFFFFF00FFFFFFFFFF00FFFFFF
            0000FFFFFFFF00FFFFFFFF00FFFFFFFF0000FFFFFFFF00FFFFFF00FFFFFFFFFF
            0000FFFFFFFF00FFFF00FFFFFFFFFFFF0000FFFFFFFF00FF00FFFFFFFFFFFFFF
            0000FFFFFFFF0000FFFFFFFFFFFFFFFF0000FFFFFFFF00FFFFFFFFFFFFFFFFFF
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
            0000}
          OnMouseDown = TrackBarRightImageMouseDown
        end
        object TrackBarLeftImage: TImage
          Left = 5
          Top = 6
          Width = 15
          Height = 18
          Picture.Data = {
            07544269746D617056050000424D560500000000000036040000280000000F00
            000012000000010008000000000020010000C40E0000C40E0000000100000000
            0000000000004000000080000000FF000000002000004020000080200000FF20
            0000004000004040000080400000FF400000006000004060000080600000FF60
            0000008000004080000080800000FF80000000A0000040A0000080A00000FFA0
            000000C0000040C0000080C00000FFC0000000FF000040FF000080FF0000FFFF
            0000000020004000200080002000FF002000002020004020200080202000FF20
            2000004020004040200080402000FF402000006020004060200080602000FF60
            2000008020004080200080802000FF80200000A0200040A0200080A02000FFA0
            200000C0200040C0200080C02000FFC0200000FF200040FF200080FF2000FFFF
            2000000040004000400080004000FF004000002040004020400080204000FF20
            4000004040004040400080404000FF404000006040004060400080604000FF60
            4000008040004080400080804000FF80400000A0400040A0400080A04000FFA0
            400000C0400040C0400080C04000FFC0400000FF400040FF400080FF4000FFFF
            4000000060004000600080006000FF006000002060004020600080206000FF20
            6000004060004040600080406000FF406000006060004060600080606000FF60
            6000008060004080600080806000FF80600000A0600040A0600080A06000FFA0
            600000C0600040C0600080C06000FFC0600000FF600040FF600080FF6000FFFF
            6000000080004000800080008000FF008000002080004020800080208000FF20
            8000004080004040800080408000FF408000006080004060800080608000FF60
            8000008080004080800080808000FF80800000A0800040A0800080A08000FFA0
            800000C0800040C0800080C08000FFC0800000FF800040FF800080FF8000FFFF
            80000000A0004000A0008000A000FF00A0000020A0004020A0008020A000FF20
            A0000040A0004040A0008040A000FF40A0000060A0004060A0008060A000FF60
            A0000080A0004080A0008080A000FF80A00000A0A00040A0A00080A0A000FFA0
            A00000C0A00040C0A00080C0A000FFC0A00000FFA00040FFA00080FFA000FFFF
            A0000000C0004000C0008000C000FF00C0000020C0004020C0008020C000FF20
            C0000040C0004040C0008040C000FF40C0000060C0004060C0008060C000FF60
            C0000080C0004080C0008080C000FF80C00000A0C00040A0C00080A0C000FFA0
            C00000C0C00040C0C00080C0C000FFC0C00000FFC00040FFC00080FFC000FFFF
            C0000000FF004000FF008000FF00FF00FF000020FF004020FF008020FF00FF20
            FF000040FF004040FF008040FF00FF40FF000060FF004060FF008060FF00FF60
            FF000080FF004080FF008080FF00FF80FF0000A0FF0040A0FF0080A0FF00FFA0
            FF0000C0FF0040C0FF0080C0FF00FFC0FF0000FFFF0040FFFF0080FFFF00FFFF
            FF000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFF
            FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFF00FFFFFF
            FF0000FFFFFFFFFFFFFFFF0000FFFFFFFF0000FFFFFFFFFFFFFF00FF00FFFFFF
            FF0000FFFFFFFFFFFF00FFFF00FFFFFFFF0000FFFFFFFFFF00FFFFFF00FFFFFF
            FF0000FFFFFFFF00FFFFFFFF00FFFFFFFF0000FFFFFF00FFFFFFFFFF00FFFFFF
            FF0000FFFFFFFF00FFFFFFFF00FFFFFFFF0000FFFFFFFFFF00FFFFFF00FFFFFF
            FF0000FFFFFFFFFFFF00FFFF00FFFFFFFF0000FFFFFFFFFFFFFF00FF00FFFFFF
            FF0000FFFFFFFFFFFFFFFF0000FFFFFFFF0000FFFFFFFFFFFFFFFFFF00FFFFFF
            FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000
            0000}
          OnMouseDown = TrackBarLeftImageMouseDown
        end
        object ParMinLabel: TLabel
          Left = 5
          Top = 30
          Width = 29
          Height = 13
          Caption = '-100%'
        end
        object ParMaxLabel: TLabel
          Left = 157
          Top = 30
          Width = 26
          Height = 13
          Alignment = taRightJustify
          Caption = '100%'
        end
        object TrackBarButtonShape: TShape
          Left = 93
          Top = 6
          Width = 2
          Height = 18
          Brush.Color = clInfoBk
        end
        object ParValueLabel: TLabel
          Left = 61
          Top = 30
          Width = 66
          Height = 13
          Alignment = taCenter
          Anchors = []
          AutoSize = False
          Caption = '0'
        end
      end
      object DeltaExprPanel: TPanel
        Left = 11
        Top = 10
        Width = 190
        Height = 51
        Caption = 'DeltaExprPanel'
        TabOrder = 2
        object Shape6: TShape
          Left = 0
          Top = 0
          Width = 190
          Height = 51
          Brush.Color = clBtnFace
        end
        object SymWarnLabel: TLabel
          Left = 10
          Top = 8
          Width = 20
          Height = 13
          Hint = #1042#1085#1080#1084#1072#1085#1080#1077': '#1083#1080#1096#1085#1080#1077' '#1089#1080#1084#1074#1086#1083#1099' '#1083#1080#1073#1086' '#1085#1077#1086#1095#1077#1074#1080#1076#1085#1099#1077' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1080
          Caption = 'SYM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object ParenthesErrorLabel: TLabel
          Left = 52
          Top = 7
          Width = 14
          Height = 13
          Hint = #1054#1096#1080#1073#1082#1072': '#1085#1077#1082#1086#1088#1088#1077#1082#1090#1085#1072#1103' '#1088#1072#1089#1089#1090#1072#1085#1086#1074#1082#1072' '#1089#1082#1086#1073#1086#1082
          Caption = '(  )'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object DiapErrorLabel: TLabel
          Left = 74
          Top = 8
          Width = 7
          Height = 13
          Hint = #1054#1096#1080#1073#1082#1072': '#1085#1077#1087#1088#1072#1074#1080#1083#1100#1085#1072#1103' '#1079#1072#1087#1080#1089#1100' '#1076#1080#1072#1087#1072#1079#1086#1085#1072
          Caption = 'D'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Visible = False
        end
        object ParameterErrorLabel: TLabel
          Left = 89
          Top = 8
          Width = 20
          Height = 13
          Hint = #1054#1096#1080#1073#1082#1072': '#1085#1077#1082#1086#1088#1088#1077#1082#1090#1085#1072#1103' '#1079#1072#1087#1080#1089#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1072
          Caption = 'PAR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object ValueErrorLabel: TLabel
          Left = 121
          Top = 8
          Width = 18
          Height = 13
          Hint = #1054#1096#1080#1073#1082#1072': '#1085#1077#1082#1086#1088#1088#1077#1082#1090#1085#1072#1103' '#1079#1072#1087#1080#1089#1100' '#1095#1080#1089#1083#1086#1074#1086#1081' '#1082#1086#1085#1089#1090#1072#1085#1090#1099
          Caption = 'VAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object ParseOkLabel: TLabel
          Left = 163
          Top = 8
          Width = 14
          Height = 13
          Hint = #1042#1099#1088#1072#1078#1077#1085#1080#1077' '#1087#1088#1080#1075#1086#1076#1085#1086' '#1076#1083#1103' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1103
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object ExpressionEdit: TEdit
          Left = 4
          Top = 26
          Width = 183
          Height = 21
          TabOrder = 0
          OnChange = ExpressionEditChange
          OnKeyDown = EditKeyDown
        end
      end
      object DeltaImageEdit: TLabeledEdit
        Left = 8
        Top = 256
        Width = 121
        Height = 21
        EditLabel.Width = 62
        EditLabel.Height = 13
        EditLabel.Caption = 'LabeledEdit1'
        TabOrder = 8
        OnChange = DeltaImageEditChange
        OnKeyDown = EditKeyDown
      end
      object DeltaBGMEdit: TLabeledEdit
        Left = 136
        Top = 256
        Width = 121
        Height = 21
        EditLabel.Width = 62
        EditLabel.Height = 13
        EditLabel.Caption = 'LabeledEdit2'
        TabOrder = 9
        OnChange = DeltaBGMEditChange
        OnKeyDown = EditKeyDown
      end
      object DeltaSoundEdit: TLabeledEdit
        Left = 264
        Top = 256
        Width = 121
        Height = 21
        EditLabel.Width = 62
        EditLabel.Height = 13
        EditLabel.Caption = 'LabeledEdit3'
        TabOrder = 10
        OnChange = DeltaSoundEditChange
        OnKeyDown = EditKeyDown
      end
    end
    object LocationDescriptionViewOrderRG: TRadioGroup
      Left = 358
      Top = 5
      Width = 400
      Height = 52
      ItemIndex = 0
      Items.Strings = (
        #1042#1099#1073#1080#1088#1072#1090#1100'  '#1087#1086' '#1087#1086#1088#1103#1076#1082#1091
        #1042#1099#1073#1080#1088#1072#1090#1100' '#1087#1086' '#1092#1086#1088#1084#1091#1083#1077)
      TabOrder = 1
      OnClick = LocationDescriptionViewOrderRGClick
    end
    object LOrdPanel: TPanel
      Left = 511
      Top = 15
      Width = 243
      Height = 40
      BevelOuter = bvNone
      TabOrder = 4
      object LOrdSymWarnLabel: TLabel
        Left = 4
        Top = 0
        Width = 20
        Height = 13
        Hint = #1042#1085#1080#1084#1072#1085#1080#1077': '#1083#1080#1096#1085#1080#1077' '#1089#1080#1084#1074#1086#1083#1099' '#1083#1080#1073#1086' '#1085#1077#1086#1095#1077#1074#1080#1076#1085#1099#1077' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1080
        Caption = 'SYM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object LOrdParenthesesErrorLabel: TLabel
        Left = 52
        Top = -1
        Width = 14
        Height = 13
        Hint = #1054#1096#1080#1073#1082#1072': '#1085#1077#1082#1086#1088#1088#1077#1082#1090#1085#1072#1103' '#1088#1072#1089#1089#1090#1072#1085#1086#1074#1082#1072' '#1089#1082#1086#1073#1086#1082
        Caption = '(  )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object LOrdDiapErrorLabel: TLabel
        Left = 82
        Top = 0
        Width = 7
        Height = 13
        Hint = #1054#1096#1080#1073#1082#1072': '#1085#1077#1087#1088#1072#1074#1080#1083#1100#1085#1072#1103' '#1079#1072#1087#1080#1089#1100' '#1076#1080#1072#1087#1072#1079#1086#1085#1072
        Caption = 'D'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Visible = False
      end
      object LOrdParameterErrorLabel: TLabel
        Left = 105
        Top = 0
        Width = 20
        Height = 13
        Hint = #1054#1096#1080#1073#1082#1072': '#1085#1077#1082#1086#1088#1088#1077#1082#1090#1085#1072#1103' '#1079#1072#1087#1080#1089#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1072
        Caption = 'PAR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object LOrdValueErrorLabel: TLabel
        Left = 137
        Top = 0
        Width = 18
        Height = 13
        Hint = #1054#1096#1080#1073#1082#1072': '#1085#1077#1082#1086#1088#1088#1077#1082#1090#1085#1072#1103' '#1079#1072#1087#1080#1089#1100' '#1095#1080#1089#1083#1086#1074#1086#1081' '#1082#1086#1085#1089#1090#1072#1085#1090#1099
        Caption = 'VAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object LOrdParseOkLabel: TLabel
        Left = 222
        Top = 0
        Width = 14
        Height = 13
        Hint = #1042#1099#1088#1072#1078#1077#1085#1080#1077' '#1087#1088#1080#1075#1086#1076#1085#1086' '#1076#1083#1103' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1103
        Caption = 'OK'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object LOrdExprEdit: TEdit
        Left = 5
        Top = 15
        Width = 235
        Height = 21
        TabOrder = 0
        Text = '~'
        OnChange = LOrdExprEditChange
        OnKeyDown = EditKeyDown
      end
    end
    object ImageEdit: TLabeledEdit
      Left = 8
      Top = 208
      Width = 240
      Height = 21
      EditLabel.Width = 62
      EditLabel.Height = 13
      EditLabel.Caption = 'LabeledEdit1'
      TabOrder = 5
      OnChange = ImageEditChange
      OnKeyDown = EditKeyDown
    end
    object BGMEdit: TLabeledEdit
      Left = 265
      Top = 208
      Width = 240
      Height = 21
      EditLabel.Width = 62
      EditLabel.Height = 13
      EditLabel.Caption = 'LabeledEdit2'
      TabOrder = 6
      OnChange = BGMEditChange
      OnKeyDown = EditKeyDown
    end
    object SoundEdit: TLabeledEdit
      Left = 519
      Top = 208
      Width = 240
      Height = 21
      EditLabel.Width = 62
      EditLabel.Height = 13
      EditLabel.Caption = 'LabeledEdit3'
      TabOrder = 7
      OnChange = SoundEditChange
      OnKeyDown = EditKeyDown
    end
  end
  object OkButton: TButton
    Left = 561
    Top = 531
    Width = 90
    Height = 27
    Hint = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100' '#1074#1074#1086#1076' '#1076#1072#1085#1085#1099#1093
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object CancelButton: TButton
    Left = 673
    Top = 531
    Width = 95
    Height = 27
    Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1074#1074#1086#1076' '#1076#1072#1085#1085#1099#1093
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    Default = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object CostOneDayCheckBox: TCheckBox
    Left = 231
    Top = 498
    Width = 124
    Height = 17
    Caption = #1055#1088#1086#1096#1077#1083' '#1086#1076#1080#1085' '#1076#1077#1085#1100
    TabOrder = 3
    OnClick = CostOneDayCheckBoxClick
  end
  object ParList: TCheckListBox
    Left = 10
    Top = 236
    Width = 346
    Height = 253
    OnClickCheck = ParListClickCheck
    ItemHeight = 13
    TabOrder = 4
    OnClick = ParListClick
  end
  object ComboBoxLocationType: TComboBox
    Left = 88
    Top = 496
    Width = 137
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    OnChange = ComboBoxLocationTypeChange
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 536
    Width = 113
    Height = 17
    Caption = #1053#1077#1086#1075#1088#1072#1085#1080#1095#1077#1085#1085#1072#1103
    TabOrder = 6
    OnClick = CheckBox1Click
  end
  object Edit1: TEdit
    Left = 216
    Top = 534
    Width = 49
    Height = 21
    TabOrder = 7
    OnChange = Edit1Change
    OnKeyDown = EditKeyDown
  end
end
