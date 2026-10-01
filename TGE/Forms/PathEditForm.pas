unit PathEditForm;


interface

uses ExtCtrls, Controls, StdCtrls, CheckLst, Gauges, ComCtrls, Forms, Menus,
  Graphics, Classes, PathClass, ParameterClass, ParameterDeltaClass;

type
  TFormPathEdit = class(TForm)
    CancelButton: TButton;
    OKButton: TButton;
    Label4: TLabel;
    EndMessageEdit: TMemo;
    Label3: TLabel;
    StartMessageEdit: TMemo;
    ParCustomizePanel: TPanel;
    ParMinLabel: TLabel;
    ParValueLabel: TLabel;
    ParMaxLabel: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    ParDeltaTrackBar: TTrackBar;
    DeltaTypeGroupBox: TGroupBox;
    DeltaValueRadioBtn: TRadioButton;
    DeltaPercentRadioBtn: TRadioButton;
    MinGateEdit: TEdit;
    MaxGateEdit: TEdit;
    ParViewActionRG: TRadioGroup;
    StatisticsLabel: TLabel;
    TrackBarGroundShape: TShape;
    TrackBarButtonShape: TShape;
    ParCriticalMessageMemo: TMemo;
    TrackBarLeftImage: TImage;
    TrackBarRightImage: TImage;
    AlwaysShowWhenPlayCheckBox: TCheckBox;
    CostOneDayCheckBox: TCheckBox;
    ValueGateEdit: TEdit;
    ValueGateNegationLabel: TLabel;
    ModZeroeGateEdit: TEdit;
    ModZeroeGateNegationLabel: TLabel;
    ChangeValueGateNegationImg: TImage;
    ChangeModZeroeGateNegationImg: TImage;
    Label10: TLabel;
    ProbabilityEdit: TEdit;
    DeltaApprRadioBtn: TRadioButton;

    DeltaExprPanel: TPanel;
    SymWarnLabel: TLabel;
    ParenthesErrorLabel: TLabel;
    ParameterErrorLabel: TLabel;
    ValueErrorLabel: TLabel;
    ParseOkLabel: TLabel;
    ExpressionEdit: TEdit;
    DeltaExprRadioBtn: TRadioButton;
    LogicExpressionEdit: TEdit;
    Label2: TLabel;
    LSymWarnLabel: TLabel;
    LParenthesErrorLabel: TLabel;
    LParameterErrorLabel: TLabel;
    LValueErrorLabel: TLabel;
    LParseOkLabel: TLabel;
    
    NextOQPButton: TButton;
    DiapErrorLabel: TLabel;
    LDiapErrorLabel: TLabel;
    PassTimesValueEdit: TEdit;
    DefUnlPathGoTimesCheck: TCheckBox;
    PTLabel: TLabel;
    QuestDifficultyGroupBox: TGroupBox;
    ShowOrderGauge: TGauge;
    ShowOrderTrackBar: TTrackBar;
    ShowOrderLabel: TLabel;
    ParList: TCheckListBox;
    ImageEdit: TLabeledEdit;
    BGMEdit: TLabeledEdit;
    SoundEdit: TLabeledEdit;
    DeltaImageEdit: TLabeledEdit;
    DeltaBGMEdit: TLabeledEdit;
    DeltaSoundEdit: TLabeledEdit;

    procedure process_enabled_controls;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);

    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);

    procedure StartMessageEditChange(Sender: TObject);
    procedure EndMessageEditChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ParDeltaTrackBarChange(Sender: TObject);
    procedure ParViewActionRGClick(Sender: TObject);
    procedure DeltaValueRadioBtnClick(Sender: TObject);
    procedure DeltaPercentRadioBtnClick(Sender: TObject);
    procedure ParCriticalMessageMemoChange(Sender: TObject);
    procedure MinGateEditChange(Sender: TObject);
    procedure MaxGateEditChange(Sender: TObject);

    procedure RedrawParTrackBar;
    procedure TrackBarGroundShapeMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure TrackBarGroundShapeMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TrackBarLeftImageMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TrackBarRightImageMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    function GetSelectedParameter:integer;

    procedure AlwaysShowWhenPlayCheckBoxClick(Sender: TObject);
    procedure PassTimesValueEditChange(Sender: TObject);
    procedure CostOneDayCheckBoxClick(Sender: TObject);
    procedure ChangeValueGateNegationImgClick(Sender: TObject);
    procedure ChangeModZeroeGateNegationImgClick(Sender: TObject);
    procedure ValueGateEditChange(Sender: TObject);
    procedure ModZeroeGateEditChange(Sender: TObject);
    procedure ProbabilityEditChange(Sender: TObject);
    procedure DeltaApprRadioBtnClick(Sender: TObject);
    procedure DeltaExprRadioBtnClick(Sender: TObject);
    procedure ExpressionEditChange(Sender: TObject);
    procedure LogicExpressionEditChange(Sender: TObject);

    procedure ProcessFormShow;

    procedure InitSameQuestionInfo;
    procedure NextOQPButtonClick(Sender: TObject);
    procedure DefUnlPathGoTimesCheckClick(Sender: TObject);
    procedure ShowOrderTrackBarChange(Sender: TObject);

    procedure ParListClick(Sender: TObject);
    function  ParListGetItem(i: integer): string;
    procedure ParListSetItem(i: integer; s: string);
    procedure ParListClickCheck(Sender: TObject);
    procedure ImageEditChange(Sender: TObject);
    procedure BGMEditChange(Sender: TObject);
    procedure SoundEditChange(Sender: TObject);
    procedure DeltaImageEditChange(Sender: TObject);
    procedure DeltaBGMEditChange(Sender: TObject);
    procedure DeltaSoundEditChange(Sender: TObject);
    procedure MemoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);


  private
    { Private declarations }
  public
    { Public declarations }
    FormPath,OldPath: TPath;
    is_ok_pressed:boolean;
    is_next_pressed:boolean;

    SameQuestionPathIndexes: array of integer;
    SameQuestionPathCount:integer;
    SameQuestionCurPos:integer;

    SelectedParameter:integer;

    WeMakingANewPath: boolean;
    FormJustOpened: boolean;

    QuestPathIndex: integer;

    FormShowFlag: boolean;

    FMenu:TPopupMenu;
end;

var
  FormPathEdit: TFormPathEdit;
  FormDummyDelta:TParameterDelta;

implementation


uses Windows, Dialogs, Messages, Math, MainForm, ValueListClass, MessageText, CalcParseClass, EC_Str,
     SearchForm, ClipboardFixer;


{$R *.DFM}


procedure TFormPathEdit.InitSameQuestionInfo;
var i:integer;
begin
  SameQuestionPathCount:=0;
  SameQuestionCurPos:=0;
  for i:=1 to FormMain.Game.PathesValue do
  begin
    if (FormMain.Game.Pathes[i].FromLocation=FormMain.Game.Pathes[QuestPathIndex].FromLocation) and
       (trimEX(FormMain.Game.Pathes[i].StartPathMessage.Text)=trimEX(FormMain.Game.Pathes[QuestPathIndex].StartPathMessage.Text)) then
    begin
      inc(SameQuestionPathCount);
      SetLength(SameQuestionPathIndexes,SameQuestionPathCount+1);
      SameQuestionPathIndexes[SameQuestionPathCount]:=i;
    end;
  end;
  for i:=1 to SameQuestionPathCount do
    if SameQuestionPathIndexes[i]=QuestPathIndex then SameQuestionCurPos:=i;

  NextOQPButton.Visible:=(SameQuestionPathCount>1);

end;

var processFlag:boolean = false;

procedure TFormPathEdit.ProcessFormShow;
var
  i:integer;
begin
  processFlag:=true;

  FormDummyDelta.Clear;

  for i:=1 to ParList.Count do
  begin
    ParList.ItemEnabled[i-1]:=FormMain.Game.Pars[i].Enabled;
    ParList.Checked[i-1]:=FormMain.Game.Pars[i].Enabled;
    ParListSetItem(i, trimEX(FormMain.Game.Pars[i].Name.Text));
  end;

  FormPath.CopyDataFrom(FormMain.Game.Pathes[QuestPathIndex]);
  is_ok_pressed:=false;

  FormShowFlag:=true;
  ProbabilityEdit.Text:=FloatToStrEC(FormPath.Probability);
  ModZeroeGateEdit.Text:='';
  ValueGateEdit.Text:='';

  OldPath.CopyDataFrom(FormPath);

  DefUnlPathGoTimesCheck.Checked:=(FormPath.PassesAllowed=0);
  SelectedParameter:=0;
  
  StartMessageEdit.Text:=trimEX(FormPath.StartPathMessage.Text);
  EndMessageEdit.Text:=trimEX(FormPath.EndPathEvent.Text.Text);
  ImageEdit.Text:=trimEX(FormPath.EndPathEvent.Image.Text);
  BGMEdit.Text:=trimEX(FormPath.EndPathEvent.BGM.Text);
  SoundEdit.Text:=trimEX(FormPath.EndPathEvent.Sound.Text);
  FormJustOpened:=true;

  AlwaysShowWhenPlayCheckBox.Checked:=FormPath.AlwaysShowWhenPlaying;

  processFlag:=false;
  process_enabled_controls;

  LogicExpressionEdit.Text:=trimEX(FormPath.LogicExpression.Text);
  if SelectedParameter>0 then ExpressionEdit.Text:=trimEX(FormDummyDelta.Expression.Text);

  ShowOrderTrackBar.Position:=FormPath.ShowOrder;
  ShowOrderGauge.Progress:=FormPath.ShowOrder;
  ShowOrderLabel.Caption:=IntToStrEC(FormPath.ShowOrder);
  ActiveControl:=CancelButton;

  if FormLPSearch.Visible and (FormLPSearch.SearchTypeRG.itemindex=3) then
  begin
    i:=PosEX(trimEX(FormLPSearch.SEdit.Text),StartMessageEdit.Text);
    if i>0 then
    begin
      StartMessageEdit.SetFocus;
      StartMessageEdit.SelStart := i-1;
      StartMessageEdit.SelLength:=length(trimEX(FormLPSearch.SEdit.Text));
    end else begin
      i:=PosEX(trimEX(FormLPSearch.SEdit.Text),EndMessageEdit.Text);
      if i>0 then
      begin
        EndMessageEdit.SetFocus;
        EndMessageEdit.SelStart := i-1;
        EndMessageEdit.SelLength:=length(trimEX(FormLPSearch.SEdit.Text));
      end;
    end;
  end;

  FormShowFlag:=false;
end;


function TFormPathEdit.GetSelectedParameter(): integer;
var
  i: integer;
  formDelta:TParameterDelta;
begin
  i:=ParList.ItemIndex + 1;
  if (i <> 0) then ParCustomizePanel.Visible:=ParList.ItemEnabled[i-1];

  SelectedParameter:=i;
  with FormDummyDelta do
  begin
    formDelta:=FormPath.FindDeltaForParNum(i);
    if formDelta<>nil then CopyDataFrom(formDelta)
    else
    begin
      Clear;
      ParNum:=i;
      min:=FormMain.Game.Pars[i].min;
      max:=FormMain.Game.Pars[i].max;
    end;
  end;
  Result:=i;
end;

procedure TFormPathEdit.RedrawParTrackBar;
var
  range:integer;
  currentposition:integer;
  dmax:integer;
  dmin:integer;
begin
  if FormDummyDelta.DeltaApprFlag then
  begin

	  dmax:=FormMain.Game.Pars[SelectedParameter].max;
	  dmin:=FormMain.Game.Pars[SelectedParameter].min;
 	  range:=dmax-dmin;

    currentposition:=trunc(((ParDeltaTrackBar.Position-dmin)/Range)*TrackBarGroundShape.Width)+TrackBarGroundShape.Left;

    TrackBarButtonShape.Left:=currentposition - TrackBarButtonShape.Width div 2;

  end else begin

	  if FormDummyDelta.DeltaPercentFlag then dmax:=100
	  else dmax:=Math.max(abs(FormMain.Game.Pars[SelectedParameter].min),abs(FormMain.Game.Pars[SelectedParameter].max));
    range:=abs(dmax);

    currentposition:=trunc(((ParDeltaTrackBar.Position+range)/(2*Range))*TrackBarGroundShape.Width)+TrackBarGroundShape.Left;

    TrackBarButtonShape.Left:=currentposition - TrackBarButtonShape.Width div 2;

  end;

end;


procedure TFormPathEdit.FormCreate(Sender: TObject);
begin
  CreateOwnClipboard(self,FMenu);

  FormPath:=TPath.Create();
  OldPath:=TPath.Create();
  FormDummyDelta:=TParameterDelta.Create;

  Caption:=QuestMessages.ParPath_Get('FormPathEdit.Caption');

  OkButton.Caption:=QuestMessages.ParPath_Get('FormPathEdit.OkButtonCaption');
  CancelButton.Caption:=QuestMessages.ParPath_Get('FormPathEdit.CancelButtonCaption');
  OkButton.Hint:=QuestMessages.ParPath_Get('FormPathEdit.OkButtonCaptionHint');
  CancelButton.Hint:=QuestMessages.ParPath_Get('FormPathEdit.CancelButtonCaptionHint');

  Label3.Caption:=QuestMessages.ParPath_Get('FormPathEdit.StartPathMessage');
  Label4.Caption:=QuestMessages.ParPath_Get('FormPathEdit.EndPathMessageLabel');

  StartMessageEdit.Hint:=QuestMessages.ParPath_Get('FormPathEdit.StartMessageEditHint');
  EndMessageEdit.Hint:=QuestMessages.ParPath_Get('FormPathEdit.EndMessageEditHint');

  ImageEdit.Text:='';
  ImageEdit.EditLabel.Caption:=QuestMessages.Par_Get('Picture');
  BGMEdit.Text:='';
  BGMEdit.EditLabel.Caption:=QuestMessages.Par_Get('BGM');
  SoundEdit.Text:='';
  SoundEdit.EditLabel.Caption:=QuestMessages.Par_Get('Sound');

  DeltaImageEdit.Text:='';
  DeltaImageEdit.EditLabel.Caption:=QuestMessages.Par_Get('Picture');
  DeltaBGMEdit.Text:='';
  DeltaBGMEdit.EditLabel.Caption:=QuestMessages.Par_Get('BGM');
  DeltaSoundEdit.Text:='';
  DeltaSoundEdit.EditLabel.Caption:=QuestMessages.Par_Get('Sound');

  Label10.Caption:=QuestMessages.ParPath_Get('FormPathEdit.Priority');
  PTLabel.Caption:=QuestMessages.ParPath_Get('FormPathEdit.Passability');
  DefUnlPathGoTimesCheck.Caption:=QuestMessages.ParPath_Get('FormPathEdit.Unrestricted');

  Label2.Caption:=QuestMessages.ParPath_Get('FormPathEdit.LogicCondition');

  LSymWarnLabel.Hint:=QuestMessages.Par_Get('ExpressionErrorSym');
  LParenthesErrorLabel.Hint:=QuestMessages.Par_Get('ExpressionErrorBrackets');
  LDiapErrorLabel.Hint:=QuestMessages.Par_Get('ExpressionErrorDiapason');
  LParameterErrorLabel.Hint:=QuestMessages.Par_Get('ExpressionErrorPar');
  LValueErrorLabel.Hint:=QuestMessages.Par_Get('ExpressionErrorVal');
  LParseOkLabel.Hint:=QuestMessages.Par_Get('ExpressionOk');

  Label9.Caption:=QuestMessages.Par_Get('ParamFrom');
  Label12.Caption:=QuestMessages.Par_Get('ParamFrom');
  Label13.Caption:=QuestMessages.Par_Get('ParamTo');
  Label11.Caption:=QuestMessages.Par_Get('ParamMustBeInDiapason');

  DeltaValueRadioBtn.Caption:=QuestMessages.Par_Get('ParamUnits');
  DeltaPercentRadioBtn.Caption:=QuestMessages.Par_Get('ParamPercents');
  DeltaApprRadioBtn.Caption:=QuestMessages.Par_Get('ParamValue');
  DeltaExprRadioBtn.Caption:=QuestMessages.Par_Get('ParamExpression');

  ParViewActionRG.Items[0]:=QuestMessages.Par_Get('ParamNoChange');
  ParViewActionRG.Items[1]:=QuestMessages.Par_Get('ParamShow');
  ParViewActionRG.Items[2]:=QuestMessages.Par_Get('ParamHide');

  SymWarnLabel.Hint:=QuestMessages.Par_Get('ExpressionErrorSym');
  ParenthesErrorLabel.Hint:=QuestMessages.Par_Get('ExpressionErrorBrackets');
  DiapErrorLabel.Hint:=QuestMessages.Par_Get('ExpressionErrorDiapason');
  ParameterErrorLabel.Hint:=QuestMessages.Par_Get('ExpressionErrorPar');
  ValueErrorLabel.Hint:=QuestMessages.Par_Get('ExpressionErrorVal');
  ParseOkLabel.Hint:=QuestMessages.Par_Get('ExpressionOk');

  AlwaysShowWhenPlayCheckBox.Caption:=QuestMessages.ParPath_Get('FormPathEdit.AlwaysShow');
  CostOneDayCheckBox.Caption:=QuestMessages.ParPath_Get('FormPathEdit.DayPassed');
  NextOQPButton.Caption:=QuestMessages.ParPath_Get('FormPathEdit.NextPath');
  QuestDifficultyGroupBox.Caption:=QuestMessages.ParPath_Get('FormPathEdit.ShowOrder');

end;

procedure TFormPathEdit.process_enabled_controls;
var
  flag: boolean;
  tstr, temp: string;
  tvl: TValuesList;
  parse: TCalcParse;
  i,t,cmin,cmax,value: integer;
  delta:TParameterDelta;
  prevParIndex:integer;
begin
  if processFlag then exit;
  processFlag:=true;
  tvl:=TValuesList.Create;

  if (trimEX(ProbabilityEdit.Text)='') or (FormPath.Probability<>StrToFloatEC(trimEX(ProbabilityEdit.Text))) then ProbabilityEdit.Text:=FloatToStrEC(FormPath.Probability);
  CostOneDayCheckBox.checked:=(FormPath.DaysCost=1);

  delta:=FormPath.FindDeltaForParNum(FormDummyDelta.ParNum);
  if delta<>nil then delta.CopyDataFrom(FormDummyDelta)
  else if FormDummyDelta.ParNum>0 then
  begin
    delta:=TParameterDelta.Create;
    delta.CopyDataFrom(FormDummyDelta);
    FormPath.AddDPar(delta);
  end;

  Statisticslabel.Caption:='P '+IntToStrEC(FormPath.PathNumber);

  prevParIndex:=SelectedParameter;
  SelectedParameter:=GetSelectedParameter();
  //ShowMessage(Inttostrec(FormDummyDelta.ValuesGate.Count));

  if (SelectedParameter<>0) and (SelectedParameter<>prevParIndex) then
  begin
    ExpressionEdit.Text:=FormDummyDelta.Expression.Text;
  end;

  PassTimesValueEdit.text:=IntToStrEC(FormPath.PassesAllowed);
  if trimEX(PassTimesValueEdit.text)=IntToStrEC(FormMain.Game.DefPathGoTimesValue) then PassTimesValueEdit.Font.Color:=clGray else PassTimesValueEdit.Font.Color:=clBlack;

	for i:=1 to ParList.Count do
  begin
    if i = SelectedParameter then delta:=FormDummyDelta
    else delta:=FormPath.FindDeltaForParNum(i);
    tstr:=trimEX(FormMain.Game.Pars[i].Name.Text);

    if delta<>nil then
    with delta do
    begin
      if(min = FormMain.Game.Pars[ParNum].min) and (max = FormMain.Game.Pars[ParNum].max) then temp:=''
      else temp:='  [ ' + IntToStrEC(Min) + ' .. ' + IntToStrEC(Max) + ' ]';

      if(ValuesGate.Count <> 0) then
      begin
        if ValuesGate.Negation then temp:=temp + ' ='
        else temp:=temp + ' <>';

        temp:=temp + ValuesGate.GetString;
      end;

      if ModZeroesGate.Count<>0 then
      begin
        if ModZeroesGate.Negation then temp:=temp + ' /'
        else temp:=temp + ' X';

        temp:=temp + ModZeroesGate.GetString;
      end;

      if(temp <> '') then tstr:=tstr + temp;

      if DeltaExprFlag then
      begin
        temp:=trimEX(Expression.Text);
        if temp<>'' then tstr:=tstr + '  = ' + temp;
      end else begin
        if(delta <> 0) or (DeltaApprFlag) then
        begin
          t:=delta;
          if DeltaPercentFlag then
          begin
            if(t > 100) then t:=100;
            if(t <-100) then t:=-100;
          end;
          
          temp:='  ';
          if DeltaApprFlag then temp:=temp + '=';

          if(t > 0) and (not DeltaApprFlag) then temp:=temp + '+';
          temp:=temp + IntToStrEC(t);
          if DeltaPercentFlag then temp:=temp + '%';

          if(temp <> '') then tstr:=tstr + temp;
        end;
      end;
    
      case ParameterViewAction of
        ShowParameter: tstr:=tstr + ' ' + QuestMessages.Par_Get('ParameterShow');
        HideParameter: tstr:=tstr + ' ' + QuestMessages.Par_Get('ParameterHide');
      end;

      ParListSetItem(i, tstr);

    end;
	end;

  parse:=TCalcParse.Create;
  tstr:=trimEX(FormPath.LogicExpression.Text);
  parse.AssignAndPreprocess(trimEX(LogicExpressionEdit.Text),1);
  //if (tstr<>parse.ConvertToExternal(parse.internal_str)) and not parse.default_expression then LogicExpressionEdit.Text:=trimEX(FormPath.LogicExpression.Text);
  parse.Destroy;


  if SelectedParameter<>0 then
  begin
    FormShowFlag:=true;
    parse:=TCalcParse.Create;
    tstr:=trimEX(FormDummyDelta.Expression.Text);
    parse.AssignAndPreprocess(trimEX(ExpressionEdit.Text),SelectedParameter);
    //if (tstr<>parse.ConvertToExternal(parse.internal_str)) and not parse.default_expression then ExpressionEdit.Text:=FormDummyDelta.Expression.Text;
    parse.Destroy;

    tvl.SetFromString(trimEX(ValueGateEdit.Text));
    if not tvl.IsEqualWith(FormDummyDelta.ValuesGate) then ValueGateEdit.Text:=FormDummyDelta.ValuesGate.GetString;

    if tvl.Count=0 then ValueGateNegationLabel.Font.Color:=clGray
    else ValueGateNegationLabel.Font.Color:=clBlack;

    tvl.SetFromString(trimEX(ModZeroeGateEdit.Text));
    if not tvl.IsEqualWith(FormDummyDelta.ModZeroesGate) then ModZeroeGateEdit.Text:=FormDummyDelta.ModZeroesGate.GetString;

    if tvl.Count=0 then ModZeroeGateNegationLabel.Font.Color:=clGray
    else ModZeroeGateNegationLabel.Font.Color:=clBlack;

    if FormDummyDelta.ValuesGate.Negation then ValueGateNegationLabel.Caption:=QuestMessages.ParPath_Get('FormPathEdit.ParValues')
    else ValueGateNegationLabel.Caption:=QuestMessages.ParPath_Get('FormPathEdit.ParNotValues');

    if FormDummyDelta.ModZeroesGate.Negation then ModZeroeGateNegationLabel.Caption:=QuestMessages.ParPath_Get('FormPathEdit.ParModZeroes')
    else ModZeroeGateNegationLabel.Caption:=QuestMessages.ParPath_Get('FormPathEdit.ParNotModZeroes');

    with FormDummyDelta do
    begin
      if FormJustOpened or (SelectedParameter<>prevParIndex) then
      begin
        MinGateEdit.text:=IntToStrEC(min);
        MaxGateEdit.Text:=IntToStrEC(max);
        FormJustOpened:=false;
      end;

      if (MinGateEdit.text=IntToStrEC(FormMain.Game.Pars[SelectedParameter].GetDefaultMinGate)) or
         (MinGateEdit.text=IntToStrEC(FormMain.Game.Pars[SelectedParameter].Min)) then MinGateEdit.Font.Color:=clGray
      else MinGateEdit.Font.Color:=clBlack;

      if (MaxGateEdit.text=IntToStrEC(FormMain.Game.Pars[SelectedParameter].GetDefaultMaxGate)) or
         (MaxGateEdit.text=IntToStrEC(FormMain.Game.Pars[SelectedParameter].Max)) then MaxGateEdit.Font.Color:=clGray
      else MaxGateEdit.Font.Color:=clBlack;

      if (MaxGateEdit.Font.Color=clGray)and(MinGateEdit.Font.Color=clGray) then Label11.Font.Color:=clGray
      else Label11.Font.Color:=clBlack;

      flag:=false;
      tstr:=CustomCriticalEvent.Text.Text;
      if trimEX(tstr)='' then begin tstr:=trimEX(FormMain.Game.Pars[SelectedParameter].CriticalEvent.Text.Text); flag:=true; end;
      ParCriticalMessageMemo.Text:=tstr;
      if flag then ParCriticalMessageMemo.Font.Color:=clGray else ParCriticalMessageMemo.Font.Color:=clBlack;

      flag:=false;
      tstr:=CustomCriticalEvent.Image.Text;
      if trimEX(tstr)='' then begin tstr:=trimEX(FormMain.Game.Pars[SelectedParameter].CriticalEvent.Image.Text); flag:=true; end;
      DeltaImageEdit.Text:=tstr;
      if flag then DeltaImageEdit.Font.Color:=clGray else DeltaImageEdit.Font.Color:=clBlack;

      flag:=false;
      tstr:=CustomCriticalEvent.BGM.Text;
      if trimEX(tstr)='' then begin tstr:=trimEX(FormMain.Game.Pars[SelectedParameter].CriticalEvent.BGM.Text); flag:=true; end;
      DeltaBGMEdit.Text:=tstr;
      if flag then DeltaBGMEdit.Font.Color:=clGray else DeltaBGMEdit.Font.Color:=clBlack;

      flag:=false;
      tstr:=CustomCriticalEvent.Sound.Text;
      if trimEX(tstr)='' then begin tstr:=trimEX(FormMain.Game.Pars[SelectedParameter].CriticalEvent.Sound.Text); flag:=true; end;
      DeltaSoundEdit.Text:=tstr;
      if flag then DeltaSoundEdit.Font.Color:=clGray else DeltaSoundEdit.Font.Color:=clBlack;

      flag:=(FormMain.Game.Pars[SelectedParameter].ParType<>NoCriticalParType);

      ParCriticalMessageMemo.Font.Color:=clBlack;

      ParCriticalMessageMemo.Visible:=flag;
      DeltaImageEdit.Visible:=flag;
      DeltaBGMEdit.Visible:=flag;
      DeltaSoundEdit.Visible:=flag;

      ParViewActionRG.ItemIndex:=ParameterViewAction;
      value:=delta;

      if DeltaApprFlag then
      begin
        DeltaExprPanel.Visible:=false;
        DeltaApprRadioBtn.Checked:=true;
        ParDeltaTrackBar.min:=FormMain.Game.Pars[SelectedParameter].min;
        ParDeltaTrackBar.max:=FormMain.Game.Pars[SelectedParameter].max;
        ParMinLabel.Caption:=IntToStrEC(FormMain.Game.Pars[SelectedParameter].min);
        ParMaxLabel.Caption:=IntToStrEC(FormMain.Game.Pars[SelectedParameter].max);
        delta:=value;
        ParDeltaTrackBar.Position:=delta;
      end else begin
        if DeltaExprFlag then
        begin
          DeltaExprPanel.Visible:=true;
          DeltaExprRadioBtn.Checked:=true;
        end else begin
          DeltaExprPanel.Visible:=false;
          if DeltaPercentFlag then
          begin
            DeltaPercentRadioBtn.Checked:=true;
            ParDeltaTrackBar.min:=-100;
            ParDeltaTrackBar.max:=100;
            ParMinLabel.Caption:='-100%';
            ParMaxLabel.Caption:='+100%';
            delta:=value;
            ParDeltaTrackBar.Position:=delta;
          end else begin
            cmax:=Math.max(abs(FormMain.Game.Pars[SelectedParameter].min),abs(FormMain.Game.Pars[SelectedParameter].max));
            cmin:=-cmax;
            DeltaValueRadioBtn.Checked:=true;
            ParDeltaTrackBar.min:=cmin;
            ParDeltaTrackBar.max:=cmax;
            ParMinLabel.Caption:=IntToStrEC(cmin);
            ParMaxLabel.Caption:='+'+IntToStrEC(cmax);
            delta:=value;
            ParDeltaTrackBar.Position:=delta;
          end;
        end;
      end;
    end;
    FormShowFlag:=false;
  end;

  delta:=FormPath.FindDeltaForParNum(FormDummyDelta.ParNum);
  if delta<>nil then delta.CopyDataFrom(FormDummyDelta)
  else if FormDummyDelta.ParNum>0 then
  begin
    delta:=TParameterDelta.Create;
    delta.CopyDataFrom(FormDummyDelta);
    FormPath.AddDPar(delta);
  end;

  OkButton.Enabled:=WeMakingANewPath or not OldPath.IsEqualWith(FormPath,FormMain.Game.ParsList);

  tvl.Destroy;
  processFlag:=false;
end;


procedure TFormPathEdit.FormShow(Sender: TObject);
var i:integer;
begin
  is_next_pressed:=false;
  ParList.Clear;
  for i:=1 to FormMain.Game.ParsValue do ParList.AddItem(IntToStrEC(i), Sender);
  //ParList.ItemIndex:=0;
  if (SelectedParameter>FormMain.Game.ParsValue) or (SelectedParameter<1) then SelectedParameter:=1;
  ParList.ItemIndex:=SelectedParameter-1;
  InitSameQuestionInfo;
  ProcessFormShow;
end;


procedure TFormPathEdit.CancelButtonClick(Sender: TObject);
var
  formDelta:TParameterDelta;
begin
  formDelta:=FormPath.FindDeltaForParNum(FormDummyDelta.ParNum);
  if formDelta<>nil then formDelta.CopyDataFrom(FormDummyDelta)
  else if FormDummyDelta.ParNum>0 then
  begin
    formDelta:=TParameterDelta.Create;
    formDelta.CopyDataFrom(FormDummyDelta);
    FormPath.AddDPar(formDelta);
  end;
  FormPath.DeleteNoEffectDeltas(FormMain.Game.ParsList);
  Close;
end;

procedure TFormPathEdit.OKButtonClick(Sender: TObject);
var
  i:integer;
  formDelta:TParameterDelta;
begin
  is_ok_pressed:=true;

  formDelta:=FormPath.FindDeltaForParNum(FormDummyDelta.ParNum);
  if formDelta<>nil then formDelta.CopyDataFrom(FormDummyDelta)
  else if FormDummyDelta.ParNum>0 then
  begin
    formDelta:=TParameterDelta.Create;
    formDelta.CopyDataFrom(FormDummyDelta);
    FormPath.AddDPar(formDelta);
  end;
  FormPath.DeleteNoEffectDeltas(FormMain.Game.ParsList);

  for i:=1 to FormPath.DParsValue do
  begin
    if FormPath.Dpars[i].min>FormPath.Dpars[i].max then
    begin
      FormPath.Dpars[i].min:=FormMain.Game.Pars[FormPath.Dpars[i].ParNum].Min;
      FormPath.Dpars[i].max:=FormMain.Game.Pars[FormPath.Dpars[i].ParNum].Max;
    end;
  end;
  FormMain.Game.Pathes[QuestPathIndex].CopyDataFrom(FormPath);

  if (OldPath.PassesAllowed<>FormPath.PassesAllowed) and (FormMain.Game.Pathes[QuestPathIndex].OneWaySequence<>nil) then
    FormMain.Game.Pathes[QuestPathIndex].OneWaySequence.SetNewLimit(FormPath.PassesAllowed);

  Close;
end;


procedure TFormPathEdit.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key=VK_ESCAPE then CancelButton.OnClick(sender);
end;


procedure TFormPathEdit.StartMessageEditChange(Sender: TObject);
begin
  FormPath.StartPathMessage.Text:=trimEX(StartMessageEdit.Text);

  if trimEX(FormPath.StartPathMessage.Text)='' then FormPath.VoidPathFlag:=true
  else FormPath.VoidPathFlag:=false;

  process_enabled_controls;
end;

procedure TFormPathEdit.EndMessageEditChange(Sender: TObject);
begin
  FormPath.EndPathEvent.Text.Text:=trimEX(EndMessageEdit.Text);

  process_enabled_controls;
end;

procedure TFormPathEdit.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:=true;
  if not is_ok_pressed then
  begin
    CanClose:=false;
    if OldPath.IsEqualWith(FormPath,FormMain.Game.ParsList) then
    begin
      is_ok_pressed:=false;
      CanClose:=true;
      exit;
    end;
    if MessageDlg(QuestMessages.Par_Get('CancelChanges'),mtConfirmation,[mbYes, mbNo],0)=mrYes then
    begin
      is_ok_pressed:=false;
      CanClose:=true;
    end;
  end;
end;

procedure TFormPathEdit.ParDeltaTrackBarChange(Sender: TObject);
begin
  FormDummyDelta.delta:=ParDeltaTrackBar.Position;
  ParValueLabel.Caption:=IntToStrEC(ParDeltaTrackBar.Position);

  RedrawParTrackBar;

  Process_Enabled_Controls;
end;

procedure TFormPathEdit.ParViewActionRGClick(Sender: TObject);
begin
  FormDummyDelta.ParameterViewAction:=ParViewActionRG.ItemIndex;
  Process_Enabled_Controls;
end;

procedure TFormPathEdit.DeltaValueRadioBtnClick(Sender: TObject);
begin
  FormDummyDelta.DeltaPercentFlag:=false;
  FormDummyDelta.DeltaApprFlag:=false;
  FormDummyDelta.DeltaExprFlag:=false;

  RedrawParTrackBar;
  Process_Enabled_Controls;
end;

procedure TFormPathEdit.DeltaPercentRadioBtnClick(Sender: TObject);
begin
  FormDummyDelta.DeltaPercentFlag:=true;
  FormDummyDelta.DeltaApprFlag:=false;
  FormDummyDelta.DeltaExprFlag:=false;

  RedrawParTrackBar;
  Process_Enabled_Controls;
end;

procedure TFormPathEdit.ParCriticalMessageMemoChange(Sender: TObject);
begin
  if trimEX(ParCriticalMessageMemo.text) <> trimEX(FormMain.Game.Pars[SelectedParameter].CriticalEvent.Text.Text) then
  begin
    FormDummyDelta.CustomCriticalEvent.Text.Text:=(ParCriticalMessageMemo.text);
    Process_Enabled_Controls;
  end;
end;

procedure TFormPathEdit.MinGateEditChange(Sender: TObject);
begin
  if MinGateEdit.text='' then FormDummyDelta.min:=FormMain.Game.Pars[SelectedParameter].Min
  else FormDummyDelta.min:=StrToIntFullEC(MinGateEdit.text);

  if (MinGateEdit.text=IntToStrEC(FormMain.Game.Pars[SelectedParameter].GetDefaultMinGate)) or
     (MinGateEdit.text=IntToStrEC(FormMain.Game.Pars[SelectedParameter].Min)) then MinGateEdit.Font.Color:=clGray
  else MinGateEdit.Font.Color:=clBlack;

  Process_Enabled_Controls;
end;

procedure TFormPathEdit.MaxGateEditChange(Sender: TObject);
begin
  if MaxGateEdit.text='' then FormDummyDelta.max:=FormMain.Game.Pars[SelectedParameter].Max
  else FormDummyDelta.max:=StrToIntFullEC(MaxGateEdit.text);

  if (MaxGateEdit.text=IntToStrEC(FormMain.Game.Pars[SelectedParameter].GetDefaultMaxGate)) or
     (MaxGateEdit.text=IntToStrEC(FormMain.Game.Pars[SelectedParameter].Max)) then MaxGateEdit.Font.Color:=clGray
  else MaxGateEdit.Font.Color:=clBlack;

  Process_Enabled_Controls;
end;


procedure TFormPathEdit.TrackBarGroundShapeMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  range:integer;
  currentposition:integer;
  dmax:integer;
begin
  if ssLeft in Shift then
  begin
    if FormDummyDelta.DeltaApprFlag then
    begin
      range:=FormMain.Game.Pars[SelectedParameter].max-FormMain.Game.Pars[SelectedParameter].min;
      currentposition:=round(range*(X)/TrackBarGroundShape.Width);
      ParDeltaTrackBar.Position:=FormMain.Game.Pars[SelectedParameter].min+currentposition;
    end else begin
      if FormDummyDelta.DeltaPercentFlag then dmax:=100
      else dmax:=Math.max(abs(FormMain.Game.Pars[SelectedParameter].min),abs(FormMain.Game.Pars[SelectedParameter].max));

      range:=2*abs(dmax);
      currentposition:= round(range*X/TrackBarGroundShape.Width)-abs(dmax);
      ParDeltaTrackBar.Position:=currentposition;
    end;
  end;
end;

procedure TFormPathEdit.TrackBarGroundShapeMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TrackBarGroundShape.OnMouseMove(Sender,Shift,x,y);
end;

procedure TFormPathEdit.TrackBarLeftImageMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var dmin:integer;
begin
  if FormDummyDelta.DeltaApprFlag then
  begin
    dmin:=FormMain.Game.Pars[SelectedParameter].min;

    if(FormDummyDelta.delta>dmin) then
    begin
      dec(FormDummyDelta.delta);
      Process_Enabled_Controls;
    end;
  end else begin
    if FormDummyDelta.DeltaPercentFlag then dmin:=100
    else dmin:=Math.max(abs(FormMain.Game.Pars[SelectedParameter].min),abs(FormMain.Game.Pars[SelectedParameter].max));

    if(abs(FormDummyDelta.delta)<dmin) then
    begin
      dec(FormDummyDelta.delta);
      Process_Enabled_Controls;
    end;
  end;
end;

procedure TFormPathEdit.TrackBarRightImageMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  dmax:integer;
begin
  if FormDummyDelta.DeltaApprFlag then
  begin
    dmax:=FormMain.Game.Pars[SelectedParameter].max;

    if(FormDummyDelta.delta<dmax) then
    begin
      inc(FormDummyDelta.delta);
      Process_Enabled_Controls;
    end;
  end else begin
    if FormDummyDelta.DeltaPercentFlag then dmax:=100
    else dmax:=Math.max(abs(FormMain.Game.Pars[SelectedParameter].min),abs(FormMain.Game.Pars[SelectedParameter].max));

    if(FormDummyDelta.delta<dmax) then
    begin
      inc(FormDummyDelta.delta);
      Process_Enabled_Controls;
    end;
  end;
end;

procedure TFormPathEdit.AlwaysShowWhenPlayCheckBoxClick(Sender: TObject);
begin
  FormPath.AlwaysShowWhenPlaying:=AlwaysShowWhenPlayCheckBox.Checked;
  process_enabled_controls;
end;

procedure TFormPathEdit.PassTimesValueEditChange(Sender: TObject);
begin
  if trimEX(PassTimesValueEdit.text)='' then
  PassTimesValueEdit.text:='0';

  if StrToIntFullEC(PassTimesValueEdit.text)<0 then
  PassTimesValueEdit.text:='0';

  if trimEX(PassTimesValueEdit.text)='1' then PassTimesValueEdit.Font.Color:=clGray
  else PassTimesValueEdit.Font.Color:=clBlack;

  FormPath.PassesAllowed:=StrToIntFullEC(PassTimesValueEdit.text);
  process_enabled_controls;
end;

procedure TFormPathEdit.CostOneDayCheckBoxClick(Sender: TObject);
var
  i:integer;
begin
  i:=0;
  if CostOneDayCheckBox.checked then i:=1;
  FormPath.DaysCost:=i;
  process_enabled_controls;
end;

procedure TFormPathEdit.ChangeValueGateNegationImgClick(Sender: TObject);
begin
  if not FormShowFlag then
  begin
    FormDummyDelta.ValuesGate.Negation:=FormDummyDelta.ValuesGate.Negation xor true;
    Process_Enabled_Controls;
  end;
end;

procedure TFormPathEdit.ChangeModZeroeGateNegationImgClick(Sender: TObject);
begin
  if not FormShowFlag then
  begin
    FormDummyDelta.ModZeroesGate.Negation:=FormDummyDelta.ModZeroesGate.Negation xor true;
    Process_Enabled_Controls;
  end;
end;

procedure TFormPathEdit.ValueGateEditChange(Sender: TObject);
var
  tvg:TValuesList;
begin
  tvg:=TValuesList.Create;
  tvg.CopyDataFrom(FormDummyDelta.ValuesGate);

  if not FormShowFlag then
  begin
    tvg.SetFromString(trimEX(ValueGateEdit.Text));
    if not FormDummyDelta.ValuesGate.IsEqualWith(tvg) then
    begin
      FormDummyDelta.ValuesGate.CopyDataFrom(tvg);
      Process_Enabled_Controls;
    end;
  end;

  tvg.Destroy;
end;

procedure TFormPathEdit.ModZeroeGateEditChange(Sender: TObject);
var
  tvm:TValuesList;
begin
  tvm:=TValuesList.Create;
  tvm.CopyDataFrom(FormDummyDelta.ModZeroesGate);

  if not FormShowFlag then
  begin
    tvm.SetFromString(trimEX(ModZeroeGateEdit.Text));
    if not FormDummyDelta.ModZeroesGate.IsEqualWith(tvm) then
    begin
      FormDummyDelta.ModZeroesGate.CopyDataFrom(tvm);
      Process_Enabled_Controls;
    end;
  end;

  tvm.Destroy;
end;

procedure TFormPathEdit.ProbabilityEditChange(Sender: TObject);
var i:double;
begin
  if trimEX(probabilityedit.text)='' then exit;

  i:=StrToFloatEC(trimEX(probabilityedit.text));

  FormPath.Probability:=i;

  if(trimEX(probabilityedit.text)='0') or (trimEX(probabilityedit.text)='0,') or
    (trimEX(probabilityedit.text)='0,0') or (trimEX(probabilityedit.text)='0,00') or
    (trimEX(probabilityedit.text)='') then exit;

  if i<0.001 then
  begin
    probabilityedit.text:='0,001';
    exit;
  end;

  if i<>1 then probabilityedit.Font.Color:=clBlack
  else probabilityedit.Font.Color:=clGray;

  Process_Enabled_Controls;
end;

procedure TFormPathEdit.DeltaApprRadioBtnClick(Sender: TObject);
begin
  FormDummyDelta.DeltaPercentFlag:=false;
  FormDummyDelta.DeltaApprFlag:=true;
  FormDummyDelta.DeltaExprFlag:=false;

  ParDeltaTrackBar.Position:=trunc((FormMain.Game.Pars[SelectedParameter].min+FormMain.Game.Pars[SelectedParameter].max)/2);
  RedrawParTrackBar;
  Process_Enabled_Controls;
end;

procedure TFormPathEdit.DeltaExprRadioBtnClick(Sender: TObject);
begin
  ExpressionEdit.Text:=FormDummyDelta.Expression.Text;
  FormDummyDelta.DeltaPercentFlag:=false;
  FormDummyDelta.DeltaApprFlag:=false;
  FormDummyDelta.DeltaExprFlag:=true;
  SymWarnLabel.Visible:=false;
  ParenthesErrorLabel.Visible:=false;
  ParameterErrorLabel.Visible:=false;
  ValueErrorLabel.Visible:=false;
  ParseOkLabel.Visible:=false;
  RedrawParTrackBar;
  Process_Enabled_Controls;
end;

procedure TFormPathEdit.ExpressionEditChange(Sender: TObject);
var
  ltstr,tstr:WideString;
  parse:TCalcParse;
begin
  if FormDummyDelta.DeltaExprFlag then
  begin
    parse:=TCalcParse.Create;
    tstr:=trimEX(ExpressionEdit.Text);
    ltstr:=FormDummyDelta.Expression.Text;
    parse.AssignAndPreprocess(tstr,SelectedParameter);

    SymWarnLabel.Visible:=parse.sym_warning;
    ParenthesErrorLabel.Visible:=parse.parentheses_error;
    ParameterErrorLabel.Visible:=parse.parameters_error;
    ValueErrorLabel.Visible:=parse.num_error;
    DiapErrorLabel.Visible:=parse.diapazone_error;
    ParseOkLabel.Visible:=not parse.error;
    if not parse.error then
    begin
      FormDummyDelta.Expression.Text:=parse.ConvertToExternal(parse.internal_str);
      if parse.default_expression then FormDummyDelta.Expression.Text:='';
    end;
    parse.Destroy;
  end;
  process_enabled_controls;
end;

procedure TFormPathEdit.LogicExpressionEditChange(Sender: TObject);
var
  ltstr,tstr:WideString;
  parse:TCalcParse;
begin
  parse:=TCalcParse.Create;
  tstr:=trimEX(LogicExpressionEdit.Text);
  ltstr:=FormPath.LogicExpression.Text;
  parse.AssignAndPreprocess(tstr,1);

  LSymWarnLabel.Visible:=parse.sym_warning;
  LParenthesErrorLabel.Visible:=parse.parentheses_error;
  LParameterErrorLabel.Visible:=parse.parameters_error;
  LValueErrorLabel.Visible:=parse.num_error;
  LDiapErrorLabel.Visible:=parse.diapazone_error;
  LParseOkLabel.Visible:=not parse.error;
  if not parse.error then
  begin
    FormPath.LogicExpression.Text:=parse.ConvertToExternal(parse.internal_str);
    if parse.default_expression then FormPath.LogicExpression.Text:='';
  end;
  parse.Destroy;
  process_enabled_controls;
end;

procedure TFormPathEdit.NextOQPButtonClick(Sender: TObject);
var
  i:integer;
  savechanges:boolean;
  formDelta:TParameterDelta;
begin
  savechanges:=true;
  if (not OldPath.IsEqualWith(FormPath,FormMain.Game.ParsList)) or WeMakingANewPath then
    if MessageDlg(QuestMessages.ParPath_Get('FormPathEdit.SaveChanges'),mtConfirmation,[mbYes, mbNo],0)=mrNo then savechanges:=false;

  formDelta:=FormPath.FindDeltaForParNum(FormDummyDelta.ParNum);
  if formDelta<>nil then formDelta.CopyDataFrom(FormDummyDelta)
  else if FormDummyDelta.ParNum>0 then
  begin
    formDelta:=TParameterDelta.Create;
    formDelta.CopyDataFrom(FormDummyDelta);
    FormPath.AddDPar(formDelta);
  end;
  FormPath.DeleteNoEffectDeltas(FormMain.Game.ParsList);

  is_next_pressed:=true;
  WeMakingANewPath:=false;
  for i:=1 to FormPath.DParsValue do
  begin
    if FormPath.Dpars[i].min>FormPath.Dpars[i].max then
    begin
      FormPath.Dpars[i].min:=FormMain.Game.Pars[FormPath.Dpars[i].ParNum].Min;
      FormPath.Dpars[i].max:=FormMain.Game.Pars[FormPath.Dpars[i].ParNum].Max;
    end;
  end;
  if savechanges then FormMain.Game.Pathes[QuestPathIndex].CopyDataFrom(FormPath);
  inc(SameQuestionCurPos);
  if SameQuestionCurPos>SameQuestionPathCount then SameQuestionCurPos:=1;
  QuestPathIndex:=SameQuestionPathIndexes[SameQuestionCurPos];
  ProcessFormShow;
end;

procedure TFormPathEdit.DefUnlPathGoTimesCheckClick(Sender: TObject);
begin
  if DefUnlPathGoTimesCheck.Checked then
  begin
    PassTimesValueEdit.Visible:=false;
    PassTimesValueEdit.Text:='0';
    DefUnlPathGoTimesCheck.Caption:=QuestMessages.ParPath_Get('FormPathEdit.UnrestrictedPassability');
    DefUnlPathGoTimesCheck.Width:=199;
    PTLabel.Visible:=false;
  end else begin
    PassTimesValueEdit.Visible:=true;
    PassTimesValueEdit.Text:=IntToStrEC(OldPath.PassesAllowed);
    DefUnlPathGoTimesCheck.Caption:=QuestMessages.ParPath_Get('FormPathEdit.Unrestricted');
    DefUnlPathGoTimesCheck.Width:=103;
    PTLabel.Visible:=true;
  end;
end;

procedure TFormPathEdit.ShowOrderTrackBarChange(Sender: TObject);
begin
  FormPath.ShowOrder:=ShowOrderTrackBar.Position;
  ShowOrderGauge.Progress:=FormPath.ShowOrder;
  ShowOrderLabel.Caption:=IntToStrEC(FormPath.ShowOrder);

  if FormPath.ShowOrder>4 then ShowOrderLabel.Font.Color:=clWhite
  else ShowOrderLabel.Font.Color:=clBlack;

  Process_Enabled_Controls;
end;

procedure TFormPathEdit.ParListClick(Sender: TObject);
begin
  {SelectedParameter:=GetSelectedParameter;
  if SelectedParameter<>0 then
  begin
    MinGateEdit.text:=IntToStrEC(FormDummyDelta.Min);
    MaxGateEdit.text:=IntToStrEC(FormDummyDelta.Max);
  end;
  if SelectedParameter<>0 then ExpressionEdit.Text:=FormDummyDelta.Expression.Text;}
  Process_enabled_controls;
end;

procedure TFormPathEdit.ParListClickCheck(Sender: TObject);
var
  i: integer;
begin
  for i:=1 to ParList.Count do if ParList.ItemEnabled[i-1] then ParList.Checked[i-1]:=true;
end;

function TFormPathEdit.ParListGetItem(i: integer): string;
begin
  Result:=ParList.Items[i - 1];
end;

procedure TFormPathEdit.ParListSetItem(i: integer; s: string);
begin
  s:='[p' + IntToStrEC(i) + '] ' + s;
  if ParList.Items[i-1] <> s then ParList.Items[i-1]:=s;
end;


procedure TFormPathEdit.ImageEditChange(Sender: TObject);
begin
  FormPath.EndPathEvent.Image.Text:=trimEX(ImageEdit.Text);

  process_enabled_controls;
end;

procedure TFormPathEdit.BGMEditChange(Sender: TObject);
begin
  FormPath.EndPathEvent.BGM.Text:=trimEX(BGMEdit.Text);

  process_enabled_controls;
end;

procedure TFormPathEdit.SoundEditChange(Sender: TObject);
begin
  FormPath.EndPathEvent.Sound.Text:=trimEX(SoundEdit.Text);

  process_enabled_controls;
end;

procedure TFormPathEdit.DeltaImageEditChange(Sender: TObject);
begin
  if trimEX(DeltaImageEdit.text) <> trimEX(FormMain.Game.Pars[SelectedParameter].CriticalEvent.Image.Text) then
    FormDummyDelta.CustomCriticalEvent.Image.Text:=DeltaImageEdit.text
  else FormDummyDelta.CustomCriticalEvent.Image.Text:='';

  Process_Enabled_Controls;
end;

procedure TFormPathEdit.DeltaBGMEditChange(Sender: TObject);
begin
  if trimEX(DeltaBGMEdit.text) <> trimEX(FormMain.Game.Pars[SelectedParameter].CriticalEvent.BGM.Text) then
    FormDummyDelta.CustomCriticalEvent.BGM.Text:=DeltaBGMEdit.text
  else FormDummyDelta.CustomCriticalEvent.BGM.Text:='';

  Process_Enabled_Controls;
end;

procedure TFormPathEdit.DeltaSoundEditChange(Sender: TObject);
begin
  if trimEX(DeltaSoundEdit.text) <> trimEX(FormMain.Game.Pars[SelectedParameter].CriticalEvent.Sound.Text) then
    FormDummyDelta.CustomCriticalEvent.Sound.Text:=DeltaSoundEdit.text
  else FormDummyDelta.CustomCriticalEvent.Sound.Text:='';

  Process_Enabled_Controls;
end;

procedure TFormPathEdit.MemoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var s:string;
begin
   with TMemo(Sender) do
   begin
     if not ReadOnly then
     if ((Key = ord('V'))  and (ssCtrl  in Shift)) or
        ((Key = VK_INSERT) and (ssShift in Shift)) then
     begin
       s:=ClipboardPaste;
       SendMessage (Handle, EM_REPLACESEL, 1, LongInt (@s [1]));
     end;

     if ((Key = ord('C'))   and (ssCtrl  in Shift)) or
        ((Key = VK_INSERT)  and (ssCtrl  in Shift)) or
        ((Key = ord('X'))   and (ssCtrl  in Shift)) or
        ((Key = VK_DELETE)  and (ssShift in Shift)) then ClipboardCopy(SelText);

     if ((Key = ord('A'))   and (ssCtrl  in Shift)) then begin SelectAll; Key:=0; end;
   end;
end;

procedure TFormPathEdit.EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var s:string;
begin
   with TCustomEdit(Sender) do
   begin
     //if not ReadOnly then
     if ((Key = ord('V'))  and (ssCtrl  in Shift)) or
        ((Key = VK_INSERT) and (ssShift in Shift)) then
     begin
       s:=ClipboardPaste;
       SendMessage (Handle, EM_REPLACESEL, 1, LongInt (@s [1]));
     end;

     if ((Key = ord('C'))   and (ssCtrl  in Shift)) or
        ((Key = VK_INSERT)  and (ssCtrl  in Shift)) or
        ((Key = ord('X'))   and (ssCtrl  in Shift)) or
        ((Key = VK_DELETE)  and (ssShift in Shift)) then ClipboardCopy(SelText);
     begin

     end;

     if ((Key = ord('A'))   and (ssCtrl  in Shift)) then begin SelectAll; Key:=0; end;
   end;
end;

end.
