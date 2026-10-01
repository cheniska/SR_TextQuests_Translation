unit LocationEditForm;

interface

uses
  ExtCtrls, Controls, StdCtrls, CheckLst, Graphics, ComCtrls, Forms, Classes,
  LocationClass, ParameterClass, ParameterDeltaClass, Menus;


type PRB=^TRadioButton;

type
  TFormLocationEdit = class(TForm)
    LocationDescriptionEdit: TMemo;
    OkButton: TButton;
    CancelButton: TButton;
    ParCustomizePanel: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    ParDeltaTrackBar: TTrackBar;
    DeltaTypeGroupBox: TGroupBox;
    DeltaValueRadioBtn: TRadioButton;
    DeltaPercentRadioBtn: TRadioButton;
    ParViewActionRG: TRadioGroup;
    StatisticsLabel: TLabel;
    ParCriticalMessageMemo: TMemo;
    CostOneDayCheckBox: TCheckBox;
    LocationDescriptionViewOrderRG: TRadioGroup;
    LDV_RG: TGroupBox;
    DeltaApprRadioBtn: TRadioButton;
    DeltaNonExprPanel: TPanel;
    TrackBarGroundShape: TShape;
    TrackBarRightImage: TImage;
    TrackBarLeftImage: TImage;
    ParMinLabel: TLabel;
    ParValueLabel: TLabel;
    ParMaxLabel: TLabel;
    TrackBarButtonShape: TShape;
    DeltaExprPanel: TPanel;
    ExpressionEdit: TEdit;
    DeltaExprRadioBtn: TRadioButton;
    SymWarnLabel: TLabel;
    ParenthesErrorLabel: TLabel;
    DiapErrorLabel: TLabel;
    ParameterErrorLabel: TLabel;
    ValueErrorLabel: TLabel;
    ParseOkLabel: TLabel;
    LOrdPanel: TPanel;
    LOrdExprEdit: TEdit;
    LOrdSymWarnLabel: TLabel;
    LOrdParenthesesErrorLabel: TLabel;
    LOrdDiapErrorLabel: TLabel;
    LOrdParameterErrorLabel: TLabel;
    LOrdValueErrorLabel: TLabel;
    LOrdParseOkLabel: TLabel;
    ParList: TCheckListBox;
    ImageEdit: TLabeledEdit;
    BGMEdit: TLabeledEdit;
    SoundEdit: TLabeledEdit;
    DeltaImageEdit: TLabeledEdit;
    DeltaBGMEdit: TLabeledEdit;
    DeltaSoundEdit: TLabeledEdit;
    ComboBoxLocationType: TComboBox;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    Label3: TLabel;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);

    procedure process_enabled_controls;

    procedure OnShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure LocationNameEditKeyPress(Sender: TObject; var Key: Char);
    procedure LocationDescriptionEditChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ParDeltaTrackBarChange(Sender: TObject);
    procedure ParViewActionRGClick(Sender: TObject);
    procedure DeltaValueRadioBtnClick(Sender: TObject);
    procedure DeltaPercentRadioBtnClick(Sender: TObject);
    procedure ParCriticalMessageMemoChange(Sender: TObject);

    procedure RedrawParTrackBar;
    procedure TrackBarGroundShapeMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TrackBarGroundShapeMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure TrackBarLeftImageMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TrackBarRightImageMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure CostOneDayCheckBoxClick(Sender: TObject);
    procedure LocationDescriptionViewOrderRGClick(Sender: TObject);

    procedure ChooseLocationDescription(Sender: TObject);
    procedure AddLocationDescription(Sender: TObject);
    procedure DeleteLocationDescription(Sender: TObject);

    procedure DeltaApprRadioBtnClick(Sender: TObject);
    procedure ExpressionEditChange(Sender: TObject);
    procedure DeltaExprRadioBtnClick(Sender: TObject);

    function GetSelectedParameter:integer;
    procedure LOrdExprEditChange(Sender: TObject);

    procedure ParListClick(Sender: TObject);
    function ParListGetItem(i: integer): string;
    procedure ParListSetItem(i: integer; s: string);
    procedure ParListClickCheck(Sender: TObject);
    procedure BGMEditChange(Sender: TObject);
    procedure SoundEditChange(Sender: TObject);
    procedure ImageEditChange(Sender: TObject);
    procedure DeltaImageEditChange(Sender: TObject);
    procedure DeltaBGMEditChange(Sender: TObject);
    procedure DeltaSoundEditChange(Sender: TObject);
    procedure ComboBoxLocationTypeChange(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure MemoKeyDown(Sender: TObject;var Key: Word; Shift: TShiftState);
    procedure EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    { Private declarations }
  public

    { Public declarations }
    is_ok_pressed:boolean;
    FormLocation: TLocation;
    CanCheckStartLocation:boolean;

    OldLocation:TLocation;

    SelectedParameter:integer;

    WeMakingANewLocation: boolean;

    QuestLocationIndex:integer;

    OpeningForm: boolean;

    FMenu:TPopupMenu;
end;

var
  FormLocationEdit: TFormLocationEdit;
  FormDummyDelta:TParameterDelta;


implementation
{$R *.DFM}

uses Windows, Messages, Dialogs, Math, MainForm, CalcParseClass, MessageText, EC_Str,
     SearchForm,ClipboardFixer;


procedure TFormLocationEdit.RedrawParTrackBar;
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


function TFormLocationEdit.GetSelectedParameter:integer;
var
  i: integer;
  formDelta:TParameterDelta;
begin
  i:=ParList.ItemIndex + 1;
  if i <> 0 then ParCustomizePanel.Visible:=ParList.ItemEnabled[i-1];

  SelectedParameter:=i;
  with FormDummyDelta do
  begin
    formDelta:=FormLocation.FindDeltaForParNum(i);
    if formDelta<>nil then CopyDataFrom(formDelta)
    else
    begin
      Clear;
      ParNum:=i;
    end;
  end;
  Result:=i;
end;

procedure TFormLocationEdit.OnShow(Sender:TObject);
var
  i,j:integer;
begin
	ActiveControl:=ComboBox1;//CancelButton;
  OpeningForm:=true;

  FormDummyDelta.Clear;

  ParList.Clear;
  for i:=1 to FormMain.Game.ParsValue do
  begin
    ParList.AddItem(IntToStrEC(i), Sender);
    ParList.ItemEnabled[i-1]:=FormMain.Game.Pars[i].Enabled;
    ParList.Checked[i-1]:=FormMain.Game.Pars[i].Enabled;
    ParListSetItem(i, trimEX(FormMain.Game.Pars[i].Name.Text));
  end;
  //ParList.ItemIndex:=0;
  if (SelectedParameter>FormMain.Game.ParsValue) or (SelectedParameter<1) then SelectedParameter:=1;
  ParList.ItemIndex:=SelectedParameter-1;

  FormLocation.CopyDataFrom(FormMain.Game.Locations[QuestLocationIndex]);
  OldLocation.CopyDataFrom(FormLocation);
  //StatisticsLabel.Caption:=QuestMessages.ParPath_Get('FormLocationEdit.DescriptionsCaption')+'       L'+inttostrEC(FormLocation.LocationNumber);
  StatisticsLabel.Caption:='L'+inttostrEC(FormLocation.LocationNumber);

  ComboBox1.Items.Clear;
  for i:=1 to FormLocation.CntDescriptions do ComboBox1.AddItem(IntToStrEC(i),nil);
  ComboBox1.ItemIndex:=0;

  LocationDescriptionEdit.Text:=trimEX(FormLocation.LocationDescriptions[1].Text.text);

  ImageEdit.Text:=trimEX(FormLocation.LocationDescriptions[1].Image.text);
  BGMEdit.Text:=trimEX(FormLocation.LocationDescriptions[1].BGM.text);
  SoundEdit.Text:=trimEX(FormLocation.LocationDescriptions[1].Sound.text);

  if FormLocation.RandomShowLocationDescriptions then i:=1 else i:=0;
  LocationDescriptionViewOrderRG.ItemIndex:=i;
  Button2.Enabled:=false;

  is_ok_pressed:=false;


  
  if      FormLocation.StartLocationFlag then ComboBoxLocationType.ItemIndex:=1
  else if FormLocation.VoidLocation then ComboBoxLocationType.ItemIndex:=2
  else if FormLocation.EndLocationFlag then ComboBoxLocationType.ItemIndex:=3
  else if FormLocation.PlayerDeath then ComboBoxLocationType.ItemIndex:=5
  else if FormLocation.FailLocationFlag then ComboBoxLocationType.ItemIndex:=4
  else ComboBoxLocationType.ItemIndex:=0;


  CheckBox1.Checked:=(FormLocation.VisitsAllowed=0);
  Edit1.Text:=IntToStrEC(FormLocation.VisitsAllowed);
  
  process_enabled_controls;
  if SelectedParameter>0 then ExpressionEdit.Text:=trimEX(FormDummyDelta.Expression.Text);
  LOrdPanel.Visible:=(LocationDescriptionViewOrderRG.ItemIndex=1);
  LOrdExprEdit.Text:=trimEX(FormLocation.LocDescrExprOrder.Text);

  if FormLPSearch.Visible and (FormLPSearch.SearchTypeRG.itemindex=3) and (trimEX(FormLPSearch.SEdit.Text)<>'') then
  begin
    for i:=1 to FormLocation.CntDescriptions do
    begin
      j:=PosEX(trimEX(FormLPSearch.SEdit.Text),trimEX(FormLocation.LocationDescriptions[i].Text.text));
      if j>0 then
      begin
        ComboBox1.ItemIndex:=i-1;
        LocationDescriptionEdit.Text:=trimEX(FormLocation.LocationDescriptions[i].Text.text);
        LocationDescriptionEdit.SetFocus;
        LocationDescriptionEdit.SelStart := j-1;
        LocationDescriptionEdit.SelLength:=length(trimEX(FormLPSearch.SEdit.Text));
        break;
      end;
    end;
  end;


  OpeningForm:=false;
end;

procedure TFormLocationEdit.process_enabled_controls;
label jump,jump1;
var
  i,cmin,cmax,value: integer;
  tstr: WideString;
  parse: TCalcParse;
  temp: WideString;
  flag:boolean;
  delta:TParameterDelta;
  prevParIndex:integer;
begin

  CostOneDayCheckBox.checked:=(FormLocation.DaysCost=1);

  delta:=FormLocation.FindDeltaForParNum(FormDummyDelta.ParNum);
  if delta<>nil then delta.CopyDataFrom(FormDummyDelta)
  else if FormDummyDelta.ParNum>0 then
  begin
    delta:=TParameterDelta.Create;
    delta.CopyDataFrom(FormDummyDelta);
    FormLocation.AddDPar(delta);
  end;

  prevParIndex:=SelectedParameter;
  GetSelectedParameter();

  if (SelectedParameter<>0) and (SelectedParameter<>prevParIndex) then ExpressionEdit.Text:=FormDummyDelta.Expression.Text;

  for i:=1 to ParList.Count do
  begin
    if i = SelectedParameter then delta:=FormDummyDelta
    else delta:=FormLocation.FindDeltaForParNum(i);
    tstr:=trimEX(FormMain.Game.Pars[i].Name.Text);

    if delta<>nil then
    with delta do
    begin

      if DeltaExprFlag then
      begin
        temp:=trimEX(Expression.Text);
        if temp<>'' then tstr:=tstr + '  = ' + temp;

      end else begin
        if(delta <> 0) or (DeltaApprFlag) then
        begin

          temp:='  ';
          if DeltaApprFlag then temp:=temp + '=';

          if(delta > 0) and (not DeltaApprFlag) then temp:=temp + '+';
          temp:=temp + IntToStrEC(delta);
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

  if SelectedParameter<>0 then
  begin
    parse:=TCalcParse.Create;
    tstr:=trimEX(FormDummyDelta.Expression.Text);
    parse.AssignAndPreprocess(trimEX(ExpressionEdit.Text),SelectedParameter);
    //if (tstr<>parse.ConvertToExternal(parse.internal_str)) and not parse.default_expression then ExpressionEdit.Text:=FormDummyDelta.Expression.Text;
    parse.Destroy;


    with FormDummyDelta do
    begin
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

      ParCriticalMessageMemo.Font.Color:=clBlack;

      flag:=(FormMain.Game.Pars[SelectedParameter].ParType<>NoCriticalParType);
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
  end;

  OkButton.Enabled:=WeMakingANewLocation or not OldLocation.IsEqualWith(FormLocation,FormMain.Game.ParsList);
end;

procedure TFormLocationEdit.FormCreate(Sender: TObject);
begin
  CreateOwnClipboard(self,FMenu);

  OldLocation:=TLocation.Create();
  FormLocation:=TLocation.Create();
  FormDummyDelta:=TParameterDelta.Create;

  Caption:=QuestMessages.ParPath_Get('FormLocationEdit.Caption');

  LocationDescriptionEdit.Hint:=QuestMessages.ParPath_Get('FormLocationEdit.LocationDescriptionEdit');

  OkButton.Caption:=QuestMessages.ParPath_Get('FormLocationEdit.OkButtonCaption');
  CancelButton.Caption:=QuestMessages.ParPath_Get('FormLocationEdit.CancelButtonCaption');

  OkButton.Hint:=QuestMessages.ParPath_Get('FormLocationEdit.OkButtonCaptionHint');
  CancelButton.Hint:=QuestMessages.ParPath_Get('FormLocationEdit.CancelButtonCaptionHint');

  Label2.Caption:=QuestMessages.ParPath_Get('FormLocationEdit.Passability');
  CheckBox1.Caption:=QuestMessages.ParPath_Get('FormLocationEdit.Unrestricted');

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

  ComboBoxLocationType.AddItem(QuestMessages.ParPath_Get('FormLocationEdit.LocationNormal'),nil);
  ComboBoxLocationType.AddItem(QuestMessages.ParPath_Get('FormLocationEdit.LocationStart'),nil);
  ComboBoxLocationType.AddItem(QuestMessages.ParPath_Get('FormLocationEdit.LocationVoid'),nil);
  ComboBoxLocationType.AddItem(QuestMessages.ParPath_Get('FormLocationEdit.LocationWin'),nil);
  ComboBoxLocationType.AddItem(QuestMessages.ParPath_Get('FormLocationEdit.LocationFail'),nil);
  ComboBoxLocationType.AddItem(QuestMessages.ParPath_Get('FormLocationEdit.LocationDeath'),nil);
  ComboBoxLocationType.ItemIndex := 0;

  StatisticsLabel.Caption:=QuestMessages.ParPath_Get('FormLocationEdit.DescriptionsCaption');
  Label1.Caption:=QuestMessages.ParPath_Get('FormLocationEdit.LocationType');

  Label2.Caption:=QuestMessages.ParPath_Get('FormLocationEdit.LocationDescriptionVariant');
  Button1.Caption:=QuestMessages.ParPath_Get('FormLocationEdit.LocationAdd');
  Button2.Caption:=QuestMessages.ParPath_Get('FormLocationEdit.LocationDelete');

  Label9.Caption:=QuestMessages.Par_Get('ParamFrom');
  Label10.Caption:=QuestMessages.Par_Get('ParamTo');
  Label11.Caption:=QuestMessages.Par_Get('ParamMustBeInDiapason');
  Label12.Caption:=QuestMessages.Par_Get('ParamFrom');
  Label13.Caption:=QuestMessages.Par_Get('ParamTo');
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

  LocationDescriptionViewOrderRG.Items[0]:=QuestMessages.ParPath_Get('FormLocationEdit.LocationDescriptionSelectByOrder');
  LocationDescriptionViewOrderRG.Items[1]:=QuestMessages.ParPath_Get('FormLocationEdit.LocationDescriptionSelectByExpression'); 

  LOrdSymWarnLabel.Hint:=QuestMessages.Par_Get('ExpressionErrorSym');
  LOrdParenthesesErrorLabel.Hint:=QuestMessages.Par_Get('ExpressionErrorBrackets');
  LOrdDiapErrorLabel.Hint:=QuestMessages.Par_Get('ExpressionErrorDiapason');
  LOrdParameterErrorLabel.Hint:=QuestMessages.Par_Get('ExpressionErrorPar');
  LOrdValueErrorLabel.Hint:=QuestMessages.Par_Get('ExpressionErrorVal');
  LOrdParseOkLabel.Hint:=QuestMessages.Par_Get('ExpressionOk');

  CostOneDayCheckBox.Caption:=QuestMessages.ParPath_Get('FormLocationEdit.DayPassed');

end;

procedure TFormLocationEdit.CancelButtonClick(Sender: TObject);
var
  formDelta:TParameterDelta;
begin
  formDelta:=FormLocation.FindDeltaForParNum(FormDummyDelta.ParNum);
  if formDelta<>nil then formDelta.CopyDataFrom(FormDummyDelta)
  else if FormDummyDelta.ParNum>0 then
  begin
    formDelta:=TParameterDelta.Create;
    formDelta.CopyDataFrom(FormDummyDelta);
    FormLocation.AddDPar(formDelta);
  end;
  FormLocation.DeleteNoEffectDeltas(FormMain.Game.ParsList);
  Close;
end;

procedure TFormLocationEdit.OkButtonClick(Sender: TObject);
var
  formDelta:TParameterDelta;
begin
  is_ok_pressed:=true;

  formDelta:=FormLocation.FindDeltaForParNum(FormDummyDelta.ParNum);
  if formDelta<>nil then formDelta.CopyDataFrom(FormDummyDelta)
  else if FormDummyDelta.ParNum>0 then
  begin
    formDelta:=TParameterDelta.Create;
    formDelta.CopyDataFrom(FormDummyDelta);
    FormLocation.AddDPar(formDelta);
  end;
  FormLocation.DeleteNoEffectDeltas(FormMain.Game.ParsList);

  FormLocation.LocDescrOrder:=1;
  //FormLocation.LocationDescription.text:=trimEX(FormLocation.LocationDescriptions[1].Text.text);

  FormMain.Game.Locations[QuestLocationIndex].CopyDataFrom(FormLocation);

  if (OldLocation.VisitsAllowed<>FormLocation.VisitsAllowed) and (FormMain.Game.Locations[QuestLocationIndex].OneWaySequence<>nil) then
    FormMain.Game.Locations[QuestLocationIndex].OneWaySequence.SetNewLimit(FormLocation.VisitsAllowed);

  Close;
end;

procedure TFormLocationEdit.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key=VK_ESCAPE then CancelButton.Click;
end;

procedure TFormLocationEdit.LocationNameEditKeyPress(Sender: TObject; var Key: Char);
begin
  process_enabled_controls;
end;

procedure TFormLocationEdit.LocationDescriptionEditChange(Sender: TObject);
begin
  FormLocation.LocationDescriptions[ComboBox1.ItemIndex+1].Text.Text:=trimEX(LocationDescriptionEdit.text);
  process_enabled_controls;
end;


procedure TFormLocationEdit.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:=true;
  ComboBox1.ItemIndex:=0;
  if not is_ok_pressed then
  begin
    CanClose:=false;

    if OldLocation.IsEqualWith(FormLocation,FormMain.Game.ParsList) then
    begin
      is_ok_pressed:=false;
      CanClose:=true;
      exit;
    end;

    if MessageDlg(QuestMessages.Par_Get('CancelChanges'),mtConfirmation, [mbYes, mbNo],0)=mrYes then
    begin
      is_ok_pressed:=false;
      CanClose:=true;
      ComboBox1.ItemIndex:=0;
    end;
  end;
end;

procedure TFormLocationEdit.ParDeltaTrackBarChange(Sender: TObject);
begin
  FormDummyDelta.delta:=ParDeltaTrackBar.Position;
  ParValueLabel.Caption:=IntToStrEC(ParDeltaTrackBar.Position);

  RedrawParTrackBar;

  Process_Enabled_Controls;
end;

procedure TFormLocationEdit.ParViewActionRGClick(Sender: TObject);
begin
  FormDummyDelta.ParameterViewAction:=ParViewActionRG.ItemIndex;
  Process_Enabled_Controls;
end;

procedure TFormLocationEdit.DeltaValueRadioBtnClick(Sender: TObject);
begin
  FormDummyDelta.DeltaPercentFlag:=false;
  FormDummyDelta.DeltaApprFlag:=false;
  FormDummyDelta.DeltaExprFlag:=false;

  RedrawParTrackBar;
  Process_Enabled_Controls;
end;

procedure TFormLocationEdit.DeltaPercentRadioBtnClick(Sender: TObject);
begin
  FormDummyDelta.DeltaPercentFlag:=true;
  FormDummyDelta.DeltaApprFlag:=false;
  FormDummyDelta.DeltaExprFlag:=false;

  RedrawParTrackBar;
  Process_Enabled_Controls;
end;

procedure TFormLocationEdit.ParCriticalMessageMemoChange(Sender: TObject);
begin
  if trimEX(ParCriticalMessageMemo.text) <> trimEX(FormMain.Game.Pars[SelectedParameter].CriticalEvent.Text.Text) then
  begin
    FormDummyDelta.CustomCriticalEvent.Text.Text:=(ParCriticalMessageMemo.text);
    Process_Enabled_Controls;
  end;
end;


procedure TFormLocationEdit.TrackBarGroundShapeMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TrackBarGroundShape.OnMouseMove(Sender,Shift,x,y);
end;

procedure TFormLocationEdit.TrackBarGroundShapeMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
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
      currentposition:=round(range*(X)/TrackBarGroundShape.Width) - abs(dmax);
      ParDeltaTrackBar.Position:=currentposition;
    end;
  end;
end;

procedure TFormLocationEdit.TrackBarLeftImageMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  dmin: integer;
begin
  if FormDummyDelta.DeltaApprFlag then
  begin
    dmin:=FormMain.Game.Pars[SelectedParameter].min;
    if (FormDummyDelta.delta>dmin) then
    begin
      dec(FormDummyDelta.delta);
      Process_Enabled_Controls;
    end;
  end else begin
    if FormDummyDelta.DeltaPercentFlag then dmin:=100
    else dmin:=Math.max(abs(FormMain.Game.Pars[SelectedParameter].min),abs(FormMain.Game.Pars[SelectedParameter].max));

    if (abs(FormDummyDelta.delta)<dmin) then
    begin
      dec(FormDummyDelta.delta);
      Process_Enabled_Controls;
    end;
  end;
end;

procedure TFormLocationEdit.TrackBarRightImageMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  dmax:integer;
begin
  if FormDummyDelta.DeltaApprFlag then
  begin
    dmax:=FormMain.Game.Pars[SelectedParameter].max;
    if (FormDummyDelta.delta<dmax) then
    begin
      inc(FormDummyDelta.delta);
      Process_Enabled_Controls;
    end;
  end else begin
    if FormDummyDelta.DeltaPercentFlag then dmax:=100
    else dmax:=Math.max(abs(FormMain.Game.Pars[SelectedParameter].min),abs(FormMain.Game.Pars[SelectedParameter].max));
    if (FormDummyDelta.delta<dmax) then
    begin
      inc(FormDummyDelta.delta);
      Process_Enabled_Controls;
    end;
  end;
end;

procedure TFormLocationEdit.CostOneDayCheckBoxClick(Sender: TObject);
var
  i:integer;
begin
  i:=0;
  if CostOneDayCheckBox.checked then i:=1;
  FormLocation.DaysCost:=i;
  process_enabled_controls;
end;


procedure TFormLocationEdit.LocationDescriptionViewOrderRGClick(Sender: TObject);
var
  flag:boolean;
begin
  flag:=(LocationDescriptionViewOrderRG.ItemIndex=1);

  LOrdPanel.Visible:=flag;
  if not OpeningForm then
  begin
    FormLocation.RandomShowLocationDescriptions:=flag;
    process_enabled_controls;
  end;
end;

procedure TFormLocationEdit.ChooseLocationDescription(Sender: TObject);
begin
  LocationDescriptionEdit.Text:=trimEX(FormLocation.LocationDescriptions[ComboBox1.itemindex+1].Text.text);
  ImageEdit.Text:=trimEX(FormLocation.LocationDescriptions[ComboBox1.itemindex+1].Image.text);
  BGMEdit.Text:=trimEX(FormLocation.LocationDescriptions[ComboBox1.itemindex+1].BGM.text);
  SoundEdit.Text:=trimEX(FormLocation.LocationDescriptions[ComboBox1.itemindex+1].Sound.text);

  Button2.Enabled:=((ComboBox1.ItemIndex+1) = FormLocation.CntDescriptions) and (FormLocation.CntDescriptions>1);
end;

procedure TFormLocationEdit.AddLocationDescription(Sender: TObject);
begin
  FormLocation.AddDescription;
  ComboBox1.AddItem(IntToStrEC(FormLocation.CntDescriptions),nil);
  ComboBox1.itemindex:=FormLocation.CntDescriptions-1;
  LocationDescriptionEdit.Text:='';
  ImageEdit.Text:=FormLocation.LocationDescriptions[FormLocation.CntDescriptions].Image.Text;
  BGMEdit.Text:=FormLocation.LocationDescriptions[FormLocation.CntDescriptions].BGM.Text;
  SoundEdit.Text:=FormLocation.LocationDescriptions[FormLocation.CntDescriptions].Sound.Text;

  Button2.Enabled:=true;
  process_enabled_controls;
end;

procedure TFormLocationEdit.DeleteLocationDescription(Sender: TObject);
var i:integer;
begin
  FormLocation.DeleteLastDescription;

  ComboBox1.Items.Clear;
  for i:=1 to FormLocation.CntDescriptions do ComboBox1.AddItem(IntToStrEC(i),nil);
  ComboBox1.ItemIndex:=0;

  ComboBox1.itemindex:=FormLocation.CntDescriptions-1;

  LocationDescriptionEdit.Text:=trimEX(FormLocation.LocationDescriptions[FormLocation.CntDescriptions].Text.text);
  ImageEdit.Text:=trimEX(FormLocation.LocationDescriptions[FormLocation.CntDescriptions].Image.text);
  BGMEdit.Text:=trimEX(FormLocation.LocationDescriptions[FormLocation.CntDescriptions].BGM.text);
  SoundEdit.Text:=trimEX(FormLocation.LocationDescriptions[FormLocation.CntDescriptions].Sound.text);


  Button2.Enabled:=((ComboBox1.ItemIndex+1) = FormLocation.CntDescriptions) and (FormLocation.CntDescriptions>1);
  process_enabled_controls;
end;


procedure TFormLocationEdit.DeltaApprRadioBtnClick(Sender: TObject);
begin
  FormDummyDelta.DeltaPercentFlag:=false;
  FormDummyDelta.DeltaApprFlag:=true;
  FormDummyDelta.DeltaExprFlag:=false;
  ParDeltaTrackBar.Position:=trunc((FormMain.Game.Pars[SelectedParameter].min+FormMain.Game.Pars[SelectedParameter].max)/2);
  RedrawParTrackBar;
  Process_Enabled_Controls;
end;

procedure TFormLocationEdit.ExpressionEditChange(Sender: TObject);
var
  ltstr,tstr: string;
  parse: TCalcParse;
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

procedure TFormLocationEdit.DeltaExprRadioBtnClick(Sender: TObject);
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

procedure TFormLocationEdit.LOrdExprEditChange(Sender: TObject);
var
  ltstr,tstr: string;
  parse: TCalcParse;
begin
  parse:=TCalcParse.Create;
  tstr:=trimEX(LOrdExprEdit.Text);
  ltstr:=FormLocation.LocDescrExprOrder.Text;
  parse.AssignAndPreprocess(tstr,1);

  LOrdSymWarnLabel.Visible:=parse.sym_warning;
  LOrdParenthesesErrorLabel.Visible:=parse.parentheses_error;
  LOrdParameterErrorLabel.Visible:=parse.parameters_error;
  LOrdValueErrorLabel.Visible:=parse.num_error;
  LOrdDiapErrorLabel.Visible:=parse.diapazone_error;
  LOrdParseOkLabel.Visible:=not parse.error;
  if not parse.error then
  begin
    FormLocation.LocDescrExprOrder.Text:=parse.ConvertToExternal(parse.internal_str);
    if parse.default_expression then FormLocation.LocDescrExprOrder.Text:='';
    process_enabled_controls;
  end;
  parse.Destroy;
end;

procedure TFormLocationEdit.ParListClick(Sender: TObject);
begin
  Process_enabled_controls;
end;

procedure TFormLocationEdit.ParListClickCheck(Sender: TObject);
var
  i: integer;
begin
  for i:=1 to ParList.Count do if(ParList.ItemEnabled[i-1]) then ParList.Checked[i-1]:=true;
end;

function TFormLocationEdit.ParListGetItem(i: integer): string;
begin
  result:=ParList.Items[i - 1];
end;

procedure TFormLocationEdit.ParListSetItem(i: integer; s: string);
begin
  s:='[p' + IntToStrEC(i) + '] ' + s;
  if(ParList.Items[i-1] <> s) then ParList.Items[i-1]:=s;
end;

procedure TFormLocationEdit.ImageEditChange(Sender: TObject);
begin
  FormLocation.LocationDescriptions[ComboBox1.ItemIndex+1].Image.Text:=trimEX(ImageEdit.text);
  process_enabled_controls;
end;

procedure TFormLocationEdit.BGMEditChange(Sender: TObject);
begin
  FormLocation.LocationDescriptions[ComboBox1.ItemIndex+1].BGM.Text:=trimEX(BGMEdit.text);
  process_enabled_controls;
end;

procedure TFormLocationEdit.SoundEditChange(Sender: TObject);
begin
  FormLocation.LocationDescriptions[ComboBox1.ItemIndex+1].Sound.Text:=trimEX(SoundEdit.text);
  process_enabled_controls;
end;

procedure TFormLocationEdit.DeltaImageEditChange(Sender: TObject);
begin
  if trimEX(DeltaImageEdit.text) <> trimEX(FormMain.Game.Pars[SelectedParameter].CriticalEvent.Image.Text) then
    FormDummyDelta.CustomCriticalEvent.Image.Text:=DeltaImageEdit.text
  else FormDummyDelta.CustomCriticalEvent.Image.Text:='';

  Process_Enabled_Controls;
end;

procedure TFormLocationEdit.DeltaBGMEditChange(Sender: TObject);
begin
  if trimEX(DeltaBGMEdit.text) <> trimEX(FormMain.Game.Pars[SelectedParameter].CriticalEvent.BGM.Text) then
    FormDummyDelta.CustomCriticalEvent.BGM.Text:=DeltaBGMEdit.text
  else FormDummyDelta.CustomCriticalEvent.BGM.Text:='';

  Process_Enabled_Controls;
end;

procedure TFormLocationEdit.DeltaSoundEditChange(Sender: TObject);
begin
  if trimEX(DeltaSoundEdit.text) <> trimEX(FormMain.Game.Pars[SelectedParameter].CriticalEvent.Sound.Text) then
    FormDummyDelta.CustomCriticalEvent.Sound.Text:=DeltaSoundEdit.text
  else FormDummyDelta.CustomCriticalEvent.Sound.Text:='';

  Process_Enabled_Controls;
end;

procedure TFormLocationEdit.ComboBoxLocationTypeChange(Sender: TObject);
var i,j:integer;
    flag:boolean;
begin
  //
  i:=ComboBoxLocationType.ItemIndex;
  if (i>=0) and (i<=5) then
  begin
    flag:=true;
    if (i=1) and not FormLocation.StartLocationFlag then
      for j:=1 to FormMain.Game.LocationsValue do
        if FormMain.Game.Locations[j].StartLocationFlag and
           (FormMain.Game.Locations[j].LocationNumber<>FormLocation.LocationNumber) then
        begin
          ShowMessage(QuestMessages.ParPath_Get('FormLocationEdit.StartLocationAlreadyExists')+' (L'+IntToStrEC(FormMain.Game.Locations[j].LocationNumber)+')');
          flag:=false;
          break;
        end;
    if flag then
    begin
      FormLocation.StartLocationFlag:=(i=1);
      FormLocation.VoidLocation:=(i=2);
      FormLocation.EndLocationFlag:=(i=3);
      FormLocation.PlayerDeath:=(i=5);
      FormLocation.FailLocationFlag:=(i=4) or (i=5);
      process_enabled_controls;
      exit;
    end;
  end;

  if      FormLocation.StartLocationFlag then i:=1
  else if FormLocation.VoidLocation then i:=2
  else if FormLocation.EndLocationFlag then i:=3
  else if FormLocation.PlayerDeath then i:=5
  else if FormLocation.FailLocationFlag then i:=4
  else i:=0;
  ComboBoxLocationType.ItemIndex:=i;
  process_enabled_controls;
end;

procedure TFormLocationEdit.Edit1Change(Sender: TObject);
begin
  if trimEX(Edit1.text)='' then
  Edit1.text:='0';

  if StrToIntFullEC(Edit1.text)<0 then
  Edit1.text:='0';

  Edit1.Font.Color:=clBlack;

  FormLocation.VisitsAllowed:=StrToIntFullEC(Edit1.text);
  process_enabled_controls;
end;

procedure TFormLocationEdit.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    Edit1.Visible:=false;
    Edit1.Text:='0';
    CheckBox1.Caption:=QuestMessages.ParPath_Get('FormLocationEdit.UnrestrictedPassability');
    CheckBox1.Width:=199;
    Label3.Visible:=false;
  end else begin
    Edit1.Visible:=true;
    Edit1.Text:=IntToStrEC(OldLocation.VisitsAllowed);
    CheckBox1.Caption:=QuestMessages.ParPath_Get('FormLocationEdit.Unrestricted');
    CheckBox1.Width:=103;
    Label3.Visible:=true;
  end;
end;

procedure TFormLocationEdit.MemoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TFormLocationEdit.EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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



