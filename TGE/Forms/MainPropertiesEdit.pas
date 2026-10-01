unit MainPropertiesEdit;

interface

uses
  Controls, StdCtrls, CheckLst, ExtCtrls, Graphics, ComCtrls, Menus,
  Gauges, Classes, Forms, TextQuest, ParameterClass;

type
  TFormPropertiesEdit = class(TForm)
    CancelButton: TButton;
    OkButton: TButton;     
    PageControl1: TPageControl;
    PageControl2: TPageControl;
    PageControl3: TPageControl;
    
    Edit1: TEdit;
    Edit2: TEdit;
    
    ToStarEdit: TEdit;
    ToPlanetEdit: TEdit;
    FromPlanetEdit: TEdit;
    FromStarEdit: TEdit;
    RangerEdit: TEdit;

    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    X1RB: TRadioButton;
    X2RB: TRadioButton;
    X3RB: TRadioButton;
    X4RB: TRadioButton;
    Y1RB: TRadioButton;
    Y2RB: TRadioButton;
    Y3RB: TRadioButton;
    Y4RB: TRadioButton;

    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;

    Label20: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;

    QuestDescriptionEdit: TMemo;

    PlanetReactionGroupBox: TGroupBox;
    PlanetReactionTrackBar: TTrackBar;
    PlanetReactionLabel1: TLabel;
    PlanetReactionLabel2: TLabel;
    PlanetReactionLabel3: TLabel;

    PlanetReactionGauge: TGauge;    

    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    TabSheet14: TTabSheet;

    ParCustomizePanel: TPanel;

    QuestSuccessGovMessageEdit: TMemo;
    
    NeedToReturnGroupBox: TGroupBox;
    NeedToReturnNoRadioButton: TRadioButton;
    NeedToReturnYesRadioButton: TRadioButton;

    ParValueLabel: TLabel;

    ParViewActionRG: TRadioGroup;
    RadioGroup1: TRadioGroup;
    ParNameEdit: TEdit;
    RadioGroup2: TRadioGroup;
    ShowIfZeroRadioGroup: TRadioGroup;
    ParCriticalMessageMemo: TMemo;
    TrackBarGroundShape: TShape;
    TrackBarButtonShape: TShape;

    IsPlayerMoneyParCheckBox: TCheckBox;

    RaceGroupBox: TGroupBox;
    TargetRaceGroupBox: TGroupBox;
    RMaloc: TCheckBox;
    RPeleng: TCheckBox;
    RPeople: TCheckBox;
    RFei: TCheckBox;
    RGaal: TCheckBox;
    TPeleng: TCheckBox;
    TMaloc: TCheckBox;
    TPeople: TCheckBox;
    TFei: TCheckBox;
    TGaal: TCheckBox;
    TNone: TCheckBox;
    DefUnlPathGoTimesCheck: TCheckBox;
    DefPathGoTimesEdit: TEdit;
    RSGroupBox: TGroupBox;
    RRGroupBox: TGroupBox;
    RSWarrior: TCheckBox;
    RSTrader: TCheckBox;
    RSPirate: TCheckBox;
    RRMaloc: TCheckBox;
    RRPeople: TCheckBox;
    RRGaal: TCheckBox;
    RRFei: TCheckBox;
    RRPeleng: TCheckBox;
    QuestDifficultyGroupBox: TGroupBox;
    QuestDifficultyGauge: TGauge;
    QuestDifficultyTrackBar: TTrackBar;

    MinGateEdit: TEdit;
    MaxGateEdit: TEdit;
    AltStartValuesEdit: TEdit;
    ParList: TCheckListBox;
    Label13: TLabel;
    ImageEdit: TLabeledEdit;
    BGMEdit: TLabeledEdit;
    SoundEdit: TLabeledEdit;

    ParamDescriptions: TScrollBox;
    Edit3: TEdit;
    UpDown1: TUpDown;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure ProcessEnabledControls;
    procedure AParActiveCheckClick(Sender: TObject);
    procedure BParActiveCheckClick(Sender: TObject);
    procedure CParActiveCheckClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure X1RBClick(Sender: TObject);
    procedure X2RBClick(Sender: TObject);
    procedure X3RBClick(Sender: TObject);
    procedure X4RBClick(Sender: TObject);

    procedure ResizeToNewGradient(new_xg,new_yg:integer);
    procedure CorrectPathThingParameters;
    procedure DParActiveCheckClick(Sender: TObject);
    procedure EParActiveCheckClick(Sender: TObject);
    procedure FParActiveCheckClick(Sender: TObject);
    procedure PlanetReactionTrackBarChange(Sender: TObject);

    procedure ParNameEditChange(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure ParViewActionRGClick(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure ParCriticalMessageMemoChange(Sender: TObject);
    procedure MinGateEditChange(Sender: TObject);
    procedure MaxGateEditChange(Sender: TObject);
    procedure RangerEditChange(Sender: TObject);
    procedure ToPlanetEditChange(Sender: TObject);
    procedure ToStarEditChange(Sender: TObject);
    procedure FromPlanetEditChange(Sender: TObject);
    procedure FromStarEditChange(Sender: TObject);

    procedure ProcessRightParameterClick(parnum:integer);

    procedure ParGameNameEditChange(Sender: TObject);
    procedure ShowIfZeroRadioGroupClick(Sender: TObject);
    procedure NeedToReturnNoRadioButtonClick(Sender: TObject);
    procedure NeedToReturnYesRadioButtonClick(Sender: TObject);
    procedure ShowParVF;
    function  GetAvailDiapasones:integer;
    procedure SetDefaultDiapasones;
    procedure ResetDiapasones(StartVF,VolOfVF,mincust,maxcust:integer; part:boolean);
    procedure CntParamsChange(Sender: TObject);
    //procedure ProcessOnDiapasoneEnter(VFNum,VFValueExternal:integer; minedit:boolean);

    procedure VFEditChange(Sender: TObject);
    //procedure VFGateMinEditClick(Sender: TObject);
    //procedure VFGateMaxEditClick(Sender: TObject);
    procedure VFGateMinFocusLost(Sender: TObject);
    procedure VFGateMaxFocusLost(Sender: TObject);
    procedure VFGateMinPress(Sender: TObject; var Key: Char);
    procedure VFGateMaxPress(Sender: TObject; var Key: Char);

    procedure PageControl3Change(Sender: TObject);

    procedure IsPlayerMoneyParCheckBoxClick(Sender: TObject);

    procedure AltStartValuesEditChange(Sender: TObject);

    procedure FixStringsForRightClickParameters(secondparameter:integer);
    procedure DefUnlPathGoTimesCheckClick(Sender: TObject);
    procedure DefPathGoTimesEditChange(Sender: TObject);
    procedure QuestDifficultyTrackBarChange(Sender: TObject);
    procedure ParListClick(Sender: TObject);
    procedure ParListClickCheck(Sender: TObject);
    procedure ImageEditChange(Sender: TObject);
    procedure BGMEditChange(Sender: TObject);
    procedure SoundEditChange(Sender: TObject);

    procedure ParamSwitch(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure MemoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    { Private declarations }
  public
     is_ok_pressed:boolean;
     FormGame:TTextQuest;

     SelectedParameter: integer;

     OldPars: array of TParameter;

     VFGateMinEdits, VFGateMaxEdits, VFEdits: array of TEdit;
     VFReserved:integer;

     VFShowMode: boolean;
     RightClickedParameter: integer;

     FMenu :TPopupMenu;
     FDummyMenu :TPopupMenu;
    { Public declarations }

    //function  VFDiapasonesAreValid(var quest:TTextQuest):boolean; overload;
    function  VFDiapasonesAreValid(param:TParameter):boolean; //overload;
  end;

var
  FormPropertiesEdit: TFormPropertiesEdit;

implementation

uses Windows, Dialogs, Messages, CalcParseClass, ParameterDeltaClass, MessageText,
     CPDiapClass, Math, EC_Str, ClipboardFixer;

{$R *.DFM}
{
function  TFormPropertiesEdit.VFDiapasonesAreValid(var quest:TTextQuest):boolean;
var i,d,c:integer;
begin
  Result:=false;

  for i:=1 to quest.Pars[SelectedParameter].ValueOfViewStrings-1 do
    if (quest.Pars[SelectedParameter].ViewFormatStrings[i].max > quest.Pars[SelectedParameter].ViewFormatStrings[i+1].min) then exit;

  for i:=1 to quest.Pars[SelectedParameter].ValueOfViewStrings do
    if (quest.Pars[SelectedParameter].ViewFormatStrings[i].max < quest.Pars[SelectedParameter].ViewFormatStrings[i].min) then exit;


  for i:=1 to quest.Pars[SelectedParameter].ValueOfViewStrings-1 do
    if (abs(abs(quest.Pars[SelectedParameter].ViewFormatStrings[i].max) -
            abs(quest.Pars[SelectedParameter].ViewFormatStrings[i+1].min))<>1) then exit;


  d:=0;
  for i:=1 to quest.Pars[SelectedParameter].ValueOfViewStrings do
    d:=d+quest.Pars[SelectedParameter].ViewFormatStrings[i].max-quest.Pars[SelectedParameter].ViewFormatStrings[i].min;

  c:=quest.Pars[SelectedParameter].ValueOfViewStrings - 1;
  if (abs(d)+c) <> abs(quest.Pars[SelectedParameter].max-quest.Pars[SelectedParameter].min) then exit;


  if (quest.Pars[SelectedParameter].min <> quest.Pars[SelectedParameter].ViewFormatStrings[1].min) or
     (quest.Pars[SelectedParameter].max <> quest.Pars[SelectedParameter].ViewFormatStrings[quest.Pars[SelectedParameter].ValueOfViewStrings].max) then
     exit;

   Result:=true;
end;
}
function  TFormPropertiesEdit.VFDiapasonesAreValid(param:TParameter):boolean;
var i,d,c:integer;
begin
  Result:=false;

  for i:=1 to param.ValueOfViewStrings-1 do
    if (param.ViewFormatStrings[i].max+1) <> param.ViewFormatStrings[i+1].min then exit;

  for i:=1 to param.ValueOfViewStrings do
    if param.ViewFormatStrings[i].max < param.ViewFormatStrings[i].min then exit;


  //for i:=1 to param.ValueOfViewStrings-1 do
  //  if (abs(abs(param.ViewFormatStrings[i].max) - abs(param.ViewFormatStrings[i+1].min))<>1) then exit;


  d:=0;
  for i:=1 to param.ValueOfViewStrings do
    d:=d+param.ViewFormatStrings[i].max-param.ViewFormatStrings[i].min;

  c:=param.ValueOfViewStrings - 1;
  if (abs(d)+c) <> abs(param.max-param.min) then exit;

  if (param.min <> param.ViewFormatStrings[1].min) or
     (param.max <> param.ViewFormatStrings[param.ValueOfViewStrings].max) then exit;

  Result:=true;
end;


procedure TFormPropertiesEdit.SetDefaultDiapasones;
begin
	with FormGame.Pars[SelectedParameter] do ResetDiapasones(1,ValueOfViewStrings,min,max,false);
end;

procedure TFormPropertiesEdit.ResetDiapasones(StartVF,VolOfVF,mincust,maxcust:integer; part:boolean);
var c,d:int64;
	t:int64;
	i:integer;
begin
	t:=int64(maxcust)-int64(mincust)+1;
  if t<0 then t:=t*(-1);
  c:=t div volofVF;
  d:=t mod volofVF;

  with FormGame.Pars[SelectedParameter] do
  begin
    ReserveFormatStrings(StartVF+volofVF-1,SelectedParameter);

    for i:=0 to volofVF-2 do
    begin
      ViewFormatStrings[i+StartVF].min:=mincust + c*(i);
      ViewFormatStrings[i+StartVF].max:=mincust + c*(i+1) - 1 ;
    end;

    ViewFormatStrings[StartVF+volofVF-1].min:=mincust + c*(volofVF-1);
		ViewFormatStrings[StartVF+volofVF-1].max:=mincust + c*(volofVF) + d -1;
	end;

	if not part then
  begin
		FormGame.Pars[SelectedParameter].ValueOfViewStrings:=volofVF;
    VFShowMode:=true;
    Edit3.Text:=IntToStrEC(volofVF);
    VFShowMode:=false;
	end;
end;

function TFormPropertiesEdit.GetAvailDiapasones:integer;
var i:integer;
begin
  with FormGame.Pars[SelectedParameter] do i:=trunc(abs(max-min)+1);

  {if i >= maxformatviewstrings then Result:=maxformatviewstrings
  else} Result:=i;
  
end;

procedure TFormPropertiesEdit.ShowParVF;
var i:integer;
begin
  if ParCustomizePanel.Visible=false then exit;

  VFShowMode:=true;

  with FormGame.Pars[SelectedParameter] do
  begin

    for i:=ValueOfViewStrings+1 to VFReserved do
    begin
      VFGateMinEdits[i].Visible:=false;
      VFGateMaxEdits[i].Visible:=false;
      VFEdits[i].visible:=false;
      VFGateMinEdits[i].Enabled:=false;
      VFGateMaxEdits[i].Enabled:=false;
      VFEdits[i].Enabled:=false;
    end;

    for i:=(VFReserved+1) to ValueOfViewStrings do
    begin
      inc(VFReserved);
      SetLength(VFGateMinEdits,VFReserved+1);
      SetLength(VFGateMaxEdits,VFReserved+1);
      SetLength(VFEdits,VFReserved+1);

      VFGateMinEdits[i]:=TEdit.Create(ParamDescriptions);
      with VFGateMinEdits[i] do
      begin
        Parent:=ParamDescriptions;
        Left := 2;
        Top := -20 + 24 * i;
        Width := 69;
        Height := 21;
        Tag:=i;
        //OnClick := VFGateMinEditClick;
        OnKeyPress := VFGateMinPress;
        OnKeyDown:= EditKeyDown;
        OnExit := VFGateMinFocusLost;
        PopupMenu:=FDummyMenu;
      end;

      VFGateMaxEdits[i]:=TEdit.Create(ParamDescriptions);
      with VFGateMaxEdits[i] do
      begin
        Parent:=ParamDescriptions;
        Left := 74;
        Top := -20 + 24 * i;
        Width := 69;
        Height := 21;
        Tag:=i;
        //OnClick := VFGateMaxEditClick;
        OnKeyPress := VFGateMaxPress;
        OnKeyDown:= EditKeyDown;
        OnExit := VFGateMaxFocusLost;
        PopupMenu:=FDummyMenu;
      end;

      VFEdits[i]:=TEdit.Create(ParamDescriptions);
      with VFEdits[i] do
      begin
        Parent:=ParamDescriptions;
        Left := 146;
        Top := -20 + 24 * i;
        Width := 233;
        Height := 21;
        Tag:=i;
        OnChange := VFEditChange;
        OnKeyDown:= EditKeyDown;
        PopupMenu:=FMenu;
      end;
      ProcessControl(VFEdits[i]);
    end;

    for i:=1 to ValueOfViewStrings do
    begin
      VFGateMinEdits[i].Text:=IntToStrEC(ViewFormatStrings[i].min);
      VFGateMaxEdits[i].Text:=IntToStrEC(ViewFormatStrings[i].max);
      VFEdits[i].Text:=ViewFormatStrings[i].str.Text;

      VFGateMinEdits[i].Enabled:=true;
      VFGateMaxEdits[i].Enabled:=true;
      VFEdits[i].Enabled:=true;

      VFGateMinEdits[i].Visible:=true;
      VFGateMaxEdits[i].Visible:=true;
      VFEdits[i].visible:=true;
    end; 

    VFGateMinEdits[1].Enabled:=false;
    VFGateMaxEdits[ValueOfViewStrings].Enabled:=false;

    Edit3.Text:=IntToStrEC(ValueOfViewStrings);
  end;

  VFShowMode:=false;
end;


procedure TFormPropertiesEdit.FixStringsForRightClickParameters(secondparameter:integer);
var i,c,s,f:integer;
	  maskstr,fstr,sstr:WideString;
begin
  f:=RightClickedParameter;
	s:=secondparameter;

  fstr:='[p'+IntToStrEC(f)+']';
  sstr:='[p'+IntToStrEC(s)+']';
  maskstr:='[!@#$$%^]';
	with FormGame do
  begin
    for i:=1 to LocationsValue do
    begin
      with Locations[i] do
      begin
        for c:=1 to DParsValue do
        begin
          DPars[c].Expression.Text:=StringReplaceEC(DPars[c].Expression.Text,fstr,maskstr);
          DPars[c].Expression.Text:=StringReplaceEC(DPars[c].Expression.Text,sstr,fstr);
          DPars[c].Expression.Text:=StringReplaceEC(DPars[c].Expression.Text,maskstr,sstr);

					DPars[c].CustomCriticalEvent.Text.Text:=StringReplaceEC(DPars[c].CustomCriticalEvent.Text.Text,fstr,maskstr);
          DPars[c].CustomCriticalEvent.Text.Text:=StringReplaceEC(DPars[c].CustomCriticalEvent.Text.Text,sstr,fstr);
          DPars[c].CustomCriticalEvent.Text.Text:=StringReplaceEC(DPars[c].CustomCriticalEvent.Text.Text,maskstr,sstr);
        end;
        for c:=1 to CntDescriptions do
        begin
          LocationDescriptions[c].Text.Text:=StringReplaceEC(LocationDescriptions[c].Text.Text,fstr,maskstr);
          LocationDescriptions[c].Text.Text:=StringReplaceEC(LocationDescriptions[c].Text.Text,sstr,fstr);
          LocationDescriptions[c].Text.Text:=StringReplaceEC(LocationDescriptions[c].Text.Text,maskstr,sstr);
        end;
				LocDescrExprOrder.Text:=StringReplaceEC(LocDescrExprOrder.Text,fstr,maskstr);
        LocDescrExprOrder.Text:=StringReplaceEC(LocDescrExprOrder.Text,sstr,fstr);
        LocDescrExprOrder.Text:=StringReplaceEC(LocDescrExprOrder.Text,maskstr,sstr);
      end;
    end;

    with FormGame do
    begin
      for c:=1 to FormGame.ParsValue do
      begin
        Pars[c].CriticalEvent.Text.Text:=StringReplaceEC(Pars[c].CriticalEvent.Text.Text,fstr,maskstr);
        Pars[c].CriticalEvent.Text.Text:=StringReplaceEC(Pars[c].CriticalEvent.Text.Text,sstr,fstr);
        Pars[c].CriticalEvent.Text.Text:=StringReplaceEC(Pars[c].CriticalEvent.Text.Text,maskstr,sstr);
        for i:=1 to Pars[c].ValueOfViewStrings do
        begin
          with Pars[c].ViewFormatStrings[i] do
          begin
            str.Text:=StringReplaceEC(str.Text,fstr,maskstr);
            str.Text:=StringReplaceEC(str.Text,sstr,fstr);
            str.Text:=StringReplaceEC(str.Text,maskstr,sstr);
          end;
        end;
      end;
    end;

    for i:=1 to PathesValue do
    begin
      with Pathes[i] do
      begin
        for c:=1 to DParsValue do
        begin
          DPars[c].Expression.Text:=StringReplaceEC(DPars[c].Expression.Text,fstr,maskstr);
          DPars[c].Expression.Text:=StringReplaceEC(DPars[c].Expression.Text,sstr,fstr);
          DPars[c].Expression.Text:=StringReplaceEC(DPars[c].Expression.Text,maskstr,sstr);

					DPars[c].CustomCriticalEvent.Text.Text:=StringReplaceEC(DPars[c].CustomCriticalEvent.Text.Text,fstr,maskstr);
          DPars[c].CustomCriticalEvent.Text.Text:=StringReplaceEC(DPars[c].CustomCriticalEvent.Text.Text,sstr,fstr);
          DPars[c].CustomCriticalEvent.Text.Text:=StringReplaceEC(DPars[c].CustomCriticalEvent.Text.Text,maskstr,sstr);
        end;
        LogicExpression.Text:=StringReplaceEC(LogicExpression.Text,fstr,maskstr);
        LogicExpression.Text:=StringReplaceEC(LogicExpression.Text,sstr,fstr);
        LogicExpression.Text:=StringReplaceEC(LogicExpression.Text,maskstr,sstr);
				StartPathMessage.Text:=StringReplaceEC(StartPathMessage.Text,fstr,maskstr);
        StartPathMessage.Text:=StringReplaceEC(StartPathMessage.Text,sstr,fstr);
        StartPathMessage.Text:=StringReplaceEC(StartPathMessage.Text,maskstr,sstr);
        EndPathEvent.Text.Text:=StringReplaceEC(EndPathEvent.Text.Text,fstr,maskstr);
        EndPathEvent.Text.Text:=StringReplaceEC(EndPathEvent.Text.Text,sstr,fstr);
        EndPathEvent.Text.Text:=StringReplaceEC(EndPathEvent.Text.Text,maskstr,sstr);
      end;
    end;
  end;

  fstr:='[d'+IntToStrEC(f)+']';
  sstr:='[d'+IntToStrEC(s)+']';
  maskstr:='[!@#$$%^]';
	with FormGame do
  begin
    for i:=1 to LocationsValue do
    begin
      with Locations[i] do
      begin
        for c:=1 to DParsValue do
        begin
          DPars[c].Expression.Text:=StringReplaceEC(DPars[c].Expression.Text,fstr,maskstr);
          DPars[c].Expression.Text:=StringReplaceEC(DPars[c].Expression.Text,sstr,fstr);
          DPars[c].Expression.Text:=StringReplaceEC(DPars[c].Expression.Text,maskstr,sstr);

					DPars[c].CustomCriticalEvent.Text.Text:=StringReplaceEC(DPars[c].CustomCriticalEvent.Text.Text,fstr,maskstr);
          DPars[c].CustomCriticalEvent.Text.Text:=StringReplaceEC(DPars[c].CustomCriticalEvent.Text.Text,sstr,fstr);
          DPars[c].CustomCriticalEvent.Text.Text:=StringReplaceEC(DPars[c].CustomCriticalEvent.Text.Text,maskstr,sstr);
        end;
        for c:=1 to CntDescriptions do
        begin
          LocationDescriptions[c].Text.Text:=StringReplaceEC(LocationDescriptions[c].Text.Text,fstr,maskstr);
          LocationDescriptions[c].Text.Text:=StringReplaceEC(LocationDescriptions[c].Text.Text,sstr,fstr);
          LocationDescriptions[c].Text.Text:=StringReplaceEC(LocationDescriptions[c].Text.Text,maskstr,sstr);
        end;
				LocDescrExprOrder.Text:=StringReplaceEC(LocDescrExprOrder.Text,fstr,maskstr);
        LocDescrExprOrder.Text:=StringReplaceEC(LocDescrExprOrder.Text,sstr,fstr);
        LocDescrExprOrder.Text:=StringReplaceEC(LocDescrExprOrder.Text,maskstr,sstr);
      end;
    end;

    with FormGame do
    begin
      for c:=1 to FormGame.ParsValue do
      begin
        Pars[c].CriticalEvent.Text.Text:=StringReplaceEC(Pars[c].CriticalEvent.Text.Text,fstr,maskstr);
        Pars[c].CriticalEvent.Text.Text:=StringReplaceEC(Pars[c].CriticalEvent.Text.Text,sstr,fstr);
        Pars[c].CriticalEvent.Text.Text:=StringReplaceEC(Pars[c].CriticalEvent.Text.Text,maskstr,sstr);
        for i:=1 to Pars[c].ValueOfViewStrings do
        begin
          with Pars[c].ViewFormatStrings[i] do
          begin
            str.Text:=StringReplaceEC(str.Text,fstr,maskstr);
            str.Text:=StringReplaceEC(str.Text,sstr,fstr);
            str.Text:=StringReplaceEC(str.Text,maskstr,sstr);
          end;
        end;
      end;
    end;

    for i:=1 to PathesValue do
    begin
      with Pathes[i] do
      begin
        for c:=1 to DParsValue do
        begin
          DPars[c].Expression.Text:=StringReplaceEC(DPars[c].Expression.Text,fstr,maskstr);
          DPars[c].Expression.Text:=StringReplaceEC(DPars[c].Expression.Text,sstr,fstr);
          DPars[c].Expression.Text:=StringReplaceEC(DPars[c].Expression.Text,maskstr,sstr);

					DPars[c].CustomCriticalEvent.Text.Text:=StringReplaceEC(DPars[c].CustomCriticalEvent.Text.Text,fstr,maskstr);
          DPars[c].CustomCriticalEvent.Text.Text:=StringReplaceEC(DPars[c].CustomCriticalEvent.Text.Text,sstr,fstr);
          DPars[c].CustomCriticalEvent.Text.Text:=StringReplaceEC(DPars[c].CustomCriticalEvent.Text.Text,maskstr,sstr);
        end;
        LogicExpression.Text:=StringReplaceEC(LogicExpression.Text,fstr,maskstr);
        LogicExpression.Text:=StringReplaceEC(LogicExpression.Text,sstr,fstr);
        LogicExpression.Text:=StringReplaceEC(LogicExpression.Text,maskstr,sstr);
				StartPathMessage.Text:=StringReplaceEC(StartPathMessage.Text,fstr,maskstr);
        StartPathMessage.Text:=StringReplaceEC(StartPathMessage.Text,sstr,fstr);
        StartPathMessage.Text:=StringReplaceEC(StartPathMessage.Text,maskstr,sstr);
        EndPathEvent.Text.Text:=StringReplaceEC(EndPathEvent.Text.Text,fstr,maskstr);
        EndPathEvent.Text.Text:=StringReplaceEC(EndPathEvent.Text.Text,sstr,fstr);
        EndPathEvent.Text.Text:=StringReplaceEC(EndPathEvent.Text.Text,maskstr,sstr);
      end;
    end;
  end;

  fstr:='[d'+IntToStrEC(f)+':';
  sstr:='[d'+IntToStrEC(s)+':';
  maskstr:='[!@#$$%^]';
	with FormGame do
  begin
    for i:=1 to LocationsValue do
    begin
      with Locations[i] do
      begin
        for c:=1 to DParsValue do
        begin
          DPars[c].Expression.Text:=StringReplaceEC(DPars[c].Expression.Text,fstr,maskstr);
          DPars[c].Expression.Text:=StringReplaceEC(DPars[c].Expression.Text,sstr,fstr);
          DPars[c].Expression.Text:=StringReplaceEC(DPars[c].Expression.Text,maskstr,sstr);

					DPars[c].CustomCriticalEvent.Text.Text:=StringReplaceEC(DPars[c].CustomCriticalEvent.Text.Text,fstr,maskstr);
          DPars[c].CustomCriticalEvent.Text.Text:=StringReplaceEC(DPars[c].CustomCriticalEvent.Text.Text,sstr,fstr);
          DPars[c].CustomCriticalEvent.Text.Text:=StringReplaceEC(DPars[c].CustomCriticalEvent.Text.Text,maskstr,sstr);
        end;
        for c:=1 to CntDescriptions do
        begin
          LocationDescriptions[c].Text.Text:=StringReplaceEC(LocationDescriptions[c].Text.Text,fstr,maskstr);
          LocationDescriptions[c].Text.Text:=StringReplaceEC(LocationDescriptions[c].Text.Text,sstr,fstr);
          LocationDescriptions[c].Text.Text:=StringReplaceEC(LocationDescriptions[c].Text.Text,maskstr,sstr);
        end;
				LocDescrExprOrder.Text:=StringReplaceEC(LocDescrExprOrder.Text,fstr,maskstr);
        LocDescrExprOrder.Text:=StringReplaceEC(LocDescrExprOrder.Text,sstr,fstr);
        LocDescrExprOrder.Text:=StringReplaceEC(LocDescrExprOrder.Text,maskstr,sstr);
      end;
    end;

    with FormGame do
    begin
      for c:=1 to FormGame.ParsValue do
      begin
        Pars[c].CriticalEvent.Text.Text:=StringReplaceEC(Pars[c].CriticalEvent.Text.Text,fstr,maskstr);
        Pars[c].CriticalEvent.Text.Text:=StringReplaceEC(Pars[c].CriticalEvent.Text.Text,sstr,fstr);
        Pars[c].CriticalEvent.Text.Text:=StringReplaceEC(Pars[c].CriticalEvent.Text.Text,maskstr,sstr);
        for i:=1 to Pars[c].ValueOfViewStrings do
        begin
          with Pars[c].ViewFormatStrings[i] do
          begin
            str.Text:=StringReplaceEC(str.Text,fstr,maskstr);
            str.Text:=StringReplaceEC(str.Text,sstr,fstr);
            str.Text:=StringReplaceEC(str.Text,maskstr,sstr);
          end;
        end;
      end;
    end;

    for i:=1 to PathesValue do
    begin
      with Pathes[i] do
      begin
        for c:=1 to DParsValue do
        begin
          DPars[c].Expression.Text:=StringReplaceEC(DPars[c].Expression.Text,fstr,maskstr);
          DPars[c].Expression.Text:=StringReplaceEC(DPars[c].Expression.Text,sstr,fstr);
          DPars[c].Expression.Text:=StringReplaceEC(DPars[c].Expression.Text,maskstr,sstr);

					DPars[c].CustomCriticalEvent.Text.Text:=StringReplaceEC(DPars[c].CustomCriticalEvent.Text.Text,fstr,maskstr);
          DPars[c].CustomCriticalEvent.Text.Text:=StringReplaceEC(DPars[c].CustomCriticalEvent.Text.Text,sstr,fstr);
          DPars[c].CustomCriticalEvent.Text.Text:=StringReplaceEC(DPars[c].CustomCriticalEvent.Text.Text,maskstr,sstr);
        end;
        LogicExpression.Text:=StringReplaceEC(LogicExpression.Text,fstr,maskstr);
        LogicExpression.Text:=StringReplaceEC(LogicExpression.Text,sstr,fstr);
        LogicExpression.Text:=StringReplaceEC(LogicExpression.Text,maskstr,sstr);
				StartPathMessage.Text:=StringReplaceEC(StartPathMessage.Text,fstr,maskstr);
        StartPathMessage.Text:=StringReplaceEC(StartPathMessage.Text,sstr,fstr);
        StartPathMessage.Text:=StringReplaceEC(StartPathMessage.Text,maskstr,sstr);
        EndPathEvent.Text.Text:=StringReplaceEC(EndPathEvent.Text.Text,fstr,maskstr);
        EndPathEvent.Text.Text:=StringReplaceEC(EndPathEvent.Text.Text,sstr,fstr);
        EndPathEvent.Text.Text:=StringReplaceEC(EndPathEvent.Text.Text,maskstr,sstr);
      end;
    end;
  end;
end;

procedure TFormPropertiesEdit.ProcessRightParameterClick(parnum:integer);
var tempParameter:TParameter;
    delta1,delta2:TParameterDelta;
    i:integer;
begin
  tempParameter:=TParameter.Create(0);

  if RightClickedParameter=parnum then RightClickedParameter:=0;

  if RightClickedParameter=0 then RightClickedParameter:=parnum
  else begin
    FixStringsForRightClickParameters(parnum);
    with FormGame do
    begin
      tempParameter.CopyDataFrom(Pars[parnum]);
      Pars[parnum].CopyDataFrom(Pars[RightClickedParameter]);
      Pars[RightClickedParameter].CopyDataFrom(tempParameter);

      tempParameter.CopyDataFrom(OldPars[parnum]);
      OldPars[parnum].CopyDataFrom(OldPars[RightClickedParameter]);
      OldPars[RightClickedParameter].CopyDataFrom(tempParameter);

      for i:=1 to FormGame.LocationsValue do
      begin
        delta1:=Locations[i].FindDeltaForParNum(parnum);
        delta2:=Locations[i].FindDeltaForParNum(RightClickedParameter);
        if delta1<>nil then delta1.ParNum:=RightClickedParameter;
        if delta2<>nil then delta2.ParNum:=parnum;
      end;

      for i:=1 to FormGame.PathesValue do
      begin
        delta1:=Pathes[i].FindDeltaForParNum(parnum);
        delta2:=Pathes[i].FindDeltaForParNum(RightClickedParameter);
        if delta1<>nil then delta1.ParNum:=RightClickedParameter;
        if delta2<>nil then delta2.ParNum:=parnum;
      end;
    end;
    RightClickedParameter:=0;
    ProcessEnabledControls;
  end;

  tempParameter.Destroy;
end;


procedure TFormPropertiesEdit.FormCreate(Sender: TObject);
{var
  i:integer;}
begin
  CreateOwnClipboard(self,FMenu);
  FDummyMenu:=TPopupMenu.Create(self);

  is_ok_pressed:=false;
  FormGame:=TTextQuest.Create();

  //for i:=1 to maxparameters do ParList.AddItem(IntToStrEC(i), Sender); // added by Koc
  //ParList.ItemIndex:=0;

  //SetLength(OldPars,maxparameters+1);
  //for i:=1 to maxparameters do OldPars[i]:=TParameter.Create(i);
  SetLength(OldPars,1);


  Edit1.Text:=QuestMessages.ParPath_Get('FormProperties.ParametersHelpString');
  Edit2.Text:=QuestMessages.ParPath_Get('FormProperties.ParametersHelpString1');

  VFReserved:=0;
  SetLength(VFGateMinEdits,VFReserved+1);
  SetLength(VFGateMaxEdits,VFReserved+1);
  SetLength(VFEdits,VFReserved+1);

  {VFGateMinEdits[1]:=@VFGateMin1Edit;
  VFGateMinEdits[2]:=@VFGateMin2Edit;
  VFGateMinEdits[3]:=@VFGateMin3Edit;
  VFGateMinEdits[4]:=@VFGateMin4Edit;
  VFGateMinEdits[5]:=@VFGateMin5Edit;
  VFGateMinEdits[6]:=@VFGateMin6Edit;
  VFGateMinEdits[7]:=@VFGateMin7Edit;
  VFGateMinEdits[8]:=@VFGateMin8Edit;
  VFGateMinEdits[9]:=@VFGateMin9Edit;
  VFGateMinEdits[10]:=@VFGateMin10Edit;

  VFGateMaxEdits[1]:=@VFGateMax1Edit;
  VFGateMaxEdits[2]:=@VFGateMax2Edit;
  VFGateMaxEdits[3]:=@VFGateMax3Edit;
  VFGateMaxEdits[4]:=@VFGateMax4Edit;
  VFGateMaxEdits[5]:=@VFGateMax5Edit;
  VFGateMaxEdits[6]:=@VFGateMax6Edit;
  VFGateMaxEdits[7]:=@VFGateMax7Edit;
  VFGateMaxEdits[8]:=@VFGateMax8Edit;
  VFGateMaxEdits[9]:=@VFGateMax9Edit;
  VFGateMaxEdits[10]:=@VFGateMax10Edit;

  VFEdits[1]:=@VF1Edit;
  VFEdits[2]:=@VF2Edit;
  VFEdits[3]:=@VF3Edit;
  VFEdits[4]:=@VF4Edit;
  VFEdits[5]:=@VF5Edit;
  VFEdits[6]:=@VF6Edit;
  VFEdits[7]:=@VF7Edit;
  VFEdits[8]:=@VF8Edit;
  VFEdits[9]:=@VF9Edit;
  VFEdits[10]:=@VF10Edit;}

  ImageEdit.Text:='';
  ImageEdit.EditLabel.Caption:=QuestMessages.Par_Get('Picture');
  BGMEdit.Text:='';
  BGMEdit.EditLabel.Caption:=QuestMessages.Par_Get('BGM');
  SoundEdit.Text:='';
  SoundEdit.EditLabel.Caption:=QuestMessages.Par_Get('Sound');

  Caption:=QuestMessages.ParPath_Get('FormProperties.Caption');
  CancelButton.Hint:=QuestMessages.ParPath_Get('FormProperties.CancelHint');
  CancelButton.Caption:=QuestMessages.ParPath_Get('FormProperties.Cancel');
  OkButton.Hint:=QuestMessages.ParPath_Get('FormProperties.OkHint');
  OkButton.Caption:=QuestMessages.ParPath_Get('FormProperties.Ok');
  Label1.Caption:=QuestMessages.ParPath_Get('FormProperties.ParamGov');
  Label2.Caption:=QuestMessages.ParPath_Get('FormProperties.ParamGovObligate');
  Label11.Caption:=QuestMessages.ParPath_Get('FormProperties.ParamGovOptional');
  TabSheet8.Caption:=QuestMessages.ParPath_Get('FormProperties.MissionText');
  QuestDescriptionEdit.Hint:=QuestMessages.ParPath_Get('FormProperties.MissionTextHint');
  TabSheet9.Caption:=QuestMessages.ParPath_Get('FormProperties.CongratText');
  QuestSuccessGovMessageEdit.Hint:=QuestMessages.ParPath_Get('FormProperties.CongratTextHint');
  PlanetReactionGroupBox.Caption:=QuestMessages.ParPath_Get('FormProperties.RelationChange');
  NeedToReturnGroupBox.Caption:=QuestMessages.ParPath_Get('FormProperties.IsNeedToReturn');
  NeedToReturnNoRadioButton.Caption:=QuestMessages.ParPath_Get('FormProperties.IsNeedToReturnNo');
  NeedToReturnYesRadioButton.Caption:=QuestMessages.ParPath_Get('FormProperties.IsNeedToReturnYes');
  RaceGroupBox.Caption:=QuestMessages.ParPath_Get('FormProperties.PlanetRace');
  RMaloc.Caption:=QuestMessages.ParPath_Get('FormProperties.RaceMaloc');
  RPeleng.Caption:=QuestMessages.ParPath_Get('FormProperties.RacePeleng');
  RPeople.Caption:=QuestMessages.ParPath_Get('FormProperties.RacePeople');
  RFei.Caption:=QuestMessages.ParPath_Get('FormProperties.RaceFei');
  RGaal.Caption:=QuestMessages.ParPath_Get('FormProperties.RaceGaal');
  TargetRaceGroupBox.Caption:=QuestMessages.ParPath_Get('FormProperties.TargetRace');
  TMaloc.Caption:=QuestMessages.ParPath_Get('FormProperties.RaceMaloc');
  TPeleng.Caption:=QuestMessages.ParPath_Get('FormProperties.RacePeleng');
  TPeople.Caption:=QuestMessages.ParPath_Get('FormProperties.RacePeople');
  TFei.Caption:=QuestMessages.ParPath_Get('FormProperties.RaceFei');
  TGaal.Caption:=QuestMessages.ParPath_Get('FormProperties.RaceGaal');
  TNone.Caption:=QuestMessages.ParPath_Get('FormProperties.RaceNone');
  RSGroupBox.Caption:=QuestMessages.ParPath_Get('FormProperties.PlayerStatus');
  RSWarrior.Caption:=QuestMessages.ParPath_Get('FormProperties.StatusWarrior');
  RSTrader.Caption:=QuestMessages.ParPath_Get('FormProperties.StatusTrader');
  RSPirate.Caption:=QuestMessages.ParPath_Get('FormProperties.StatusPirate');
  RRGroupBox.Caption:=QuestMessages.ParPath_Get('FormProperties.PlayerRace');
  RRMaloc.Caption:=QuestMessages.ParPath_Get('FormProperties.PlayerRaceMaloc');
  RRPeleng.Caption:=QuestMessages.ParPath_Get('FormProperties.PlayerRacePeleng');
  RRPeople.Caption:=QuestMessages.ParPath_Get('FormProperties.PlayerRacePeople');
  RRFei.Caption:=QuestMessages.ParPath_Get('FormProperties.PlayerRaceFei');
  RRGaal.Caption:=QuestMessages.ParPath_Get('FormProperties.PlayerRaceGaal');
  QuestDifficultyGroupBox.Caption:=QuestMessages.ParPath_Get('FormProperties.QuestDiff');
  TabSheet14.Caption:=QuestMessages.ParPath_Get('FormProperties.Parameters');
  Label13.Caption:=QuestMessages.ParPath_Get('FormProperties.SelectParam');
  TabSheet2.Caption:=QuestMessages.ParPath_Get('FormProperties.ParamProperties');
  Label20.Caption:=QuestMessages.ParPath_Get('FormProperties.SysName');
  RadioGroup1.Caption:=QuestMessages.ParPath_Get('FormProperties.ParamType');
  RadioGroup1.Items[0]:=QuestMessages.ParPath_Get('FormProperties.ParamTypeNorm');
  RadioGroup1.Items[1]:=QuestMessages.ParPath_Get('FormProperties.ParamTypeFail');
  RadioGroup1.Items[2]:=QuestMessages.ParPath_Get('FormProperties.ParamTypeWin');
  RadioGroup1.Items[3]:=QuestMessages.ParPath_Get('FormProperties.ParamTypeDeath');
  RadioGroup2.Caption:=QuestMessages.ParPath_Get('FormProperties.CriticalType');
  RadioGroup2.Items[0]:=QuestMessages.ParPath_Get('FormProperties.CriticalTypeMin');
  RadioGroup2.Items[1]:=QuestMessages.ParPath_Get('FormProperties.CriticalTypeMax');
  ShowIfZeroRadioGroup.Caption:=QuestMessages.ParPath_Get('FormProperties.ShowZero');
  ShowIfZeroRadioGroup.Items[0]:=QuestMessages.ParPath_Get('FormProperties.ShowZeroYes');
  ShowIfZeroRadioGroup.Items[1]:=QuestMessages.ParPath_Get('FormProperties.ShowZeroNo');
  IsPlayerMoneyParCheckBox.Caption:=QuestMessages.ParPath_Get('FormProperties.IsMoney');
  GroupBox4.Caption:=QuestMessages.ParPath_Get('FormProperties.InitialValue');
  TabSheet4.Caption:=QuestMessages.ParPath_Get('FormProperties.ShowFormat');
  Label3.Caption:=QuestMessages.Par_Get('ParamFrom');
  Label6.Caption:=QuestMessages.Par_Get('ParamTo');
  Label9.Caption:=QuestMessages.ParPath_Get('FormProperties.CntDiapason');
  Label8.Caption:=QuestMessages.ParPath_Get('FormProperties.Diapason');
  Label7.Caption:=QuestMessages.ParPath_Get('FormProperties.ViewString');
  TabSheet1.Caption:=QuestMessages.ParPath_Get('FormProperties.PropMain');
  TabSheet3.Caption:=QuestMessages.ParPath_Get('FormProperties.StringSubs');
  TabSheet7.Caption:=QuestMessages.ParPath_Get('FormProperties.GridSize');
  GroupBox1.Caption:=QuestMessages.ParPath_Get('FormProperties.GridWidth');
  X1RB.Caption:=QuestMessages.ParPath_Get('FormProperties.GridSmall');
  X2RB.Caption:=QuestMessages.ParPath_Get('FormProperties.GridAverage');
  X3RB.Caption:=QuestMessages.ParPath_Get('FormProperties.GridLarge');
  X4RB.Caption:=QuestMessages.ParPath_Get('FormProperties.GridVeryLarge');
  GroupBox2.Caption:=QuestMessages.ParPath_Get('FormProperties.GridHeight');
  Y1RB.Caption:=QuestMessages.ParPath_Get('FormProperties.GridSmall');
  Y2RB.Caption:=QuestMessages.ParPath_Get('FormProperties.GridAverage');
  Y3RB.Caption:=QuestMessages.ParPath_Get('FormProperties.GridLarge');
  Y4RB.Caption:=QuestMessages.ParPath_Get('FormProperties.GridVeryLarge');
  TabSheet5.Caption:=QuestMessages.ParPath_Get('FormProperties.Pathes');
  GroupBox3.Caption:=QuestMessages.ParPath_Get('FormProperties.PathesPassability');
  DefUnlPathGoTimesCheck.Caption:=QuestMessages.ParPath_Get('FormProperties.PathesUnrestricted');

end;

procedure TFormPropertiesEdit.ResizeToNewGradient(new_xg,new_yg:integer);
var xc,yc:extended;
    c:integer;
begin
  xc:=FormGame.BlockXGradient/new_xg;
  yc:=FormGame.BlockYGradient/new_yg;

  for c:= 1 to FormGame.LocationsValue do
  begin
    FormGame.Locations[c].screenx:=round(FormGame.Locations[c].screenx * xc);
    FormGame.Locations[c].screeny:=round(FormGame.Locations[c].screeny * yc);
  end;

  FormGame.BlockXgradient:=new_xg;
  FormGame.BlockYgradient:=new_yg;
end;

procedure TFormPropertiesEdit.CorrectPathThingParameters;
var
  i,c:integer;
  gate:TParameterDelta;
begin
  for i:=1 to FormGame.PathesValue do
  begin
    for c:=1 to FormGame.Pathes[i].DParsValue do
    begin
      gate:=FormGame.Pathes[i].DPars[c];
      if gate.min<=OldPars[gate.ParNum].GetDefaultMinGate then gate.min:=FormGame.Pars[gate.ParNum].Min;
      if gate.max>=OldPars[gate.ParNum].GetDefaultMaxGate then gate.max:=FormGame.Pars[gate.ParNum].Max;
      if gate.max>FormGame.Pars[gate.ParNum].max then gate.max:=FormGame.Pars[gate.ParNum].max;
      if gate.min<FormGame.Pars[gate.ParNum].min then gate.min:=FormGame.Pars[gate.ParNum].min;
    end;
  end;
end;

procedure TFormPropertiesEdit.ProcessEnabledControls();
var
  i: integer;
  j: Integer;
  tempstr: widestring;
  tstr: string;
  tvg: TCPDiapazone;
begin
  {X4RB.Enabled:=X4RB.Checked;
  X3RB.Enabled:=X4RB.Enabled or X3RB.Checked;
  X2RB.Enabled:=X3RB.Enabled or X2RB.Checked;
  X1RB.Enabled:=X2RB.Enabled or X1RB.Checked;

  Y4RB.Enabled:=Y4RB.Checked;
  Y3RB.Enabled:=Y4RB.Enabled or Y3RB.Checked;
  Y2RB.Enabled:=Y3RB.Enabled or Y2RB.Checked;
  Y1RB.Enabled:=Y2RB.Enabled or Y1RB.Checked;}

  j:=ParList.ItemIndex + 1;
  SelectedParameter:=0;
  for i:=1 to ParList.Count do if ParList.Checked[i-1] and (i = j) then SelectedParameter:=i;
  for i:=1 to ParList.Count do
  begin
    tempstr:=IntToStrEC(i) + ': ' + trimEX(FormGame.Pars[i].Name.Text);
    if ParList.Items[i-1]<>tempstr then ParList.Items[i-1]:=tempstr;
  end;
  
  ParCustomizePanel.Visible:=(SelectedParameter <> 0);

  if SelectedParameter<>0 then
  begin
    with FormGame.Pars[SelectedParameter] do
    begin
      IsPlayerMoneyParCheckBox.Checked:=Money;
      tempstr:=Name.text;

      if trimEX(ParNameEdit.text)='' then
      begin
        ParNameEdit.text:='';
        tempstr:=trimEX(tempstr);
      end;

      ParNameEdit.Text:=(tempstr);

      tempstr:=trimEX(DefaultFormatString.text);

      VFShowMode:=true;

      MaxGateEdit.Text:=IntToStrEC(Max);
      MinGateEdit.Text:=IntToStrEC(Min);

      Edit3.Text:=IntToStrEC(ValueOfViewStrings);

      VFShowMode:=false;

      ShowParVF;
      ParCriticalMessageMemo.Text:=trimEX(CriticalEvent.Text.Text);
      RadioGroup1.ItemIndex:=ParType;

      ImageEdit.Text:=trimEX(CriticalEvent.Image.Text);
      BGMEdit.Text:=trimEX(CriticalEvent.BGM.Text);
      SoundEdit.Text:=trimEX(CriticalEvent.Sound.Text);

      if not hidden then ParViewActionRG.ItemIndex:=0
      else ParViewActionRG.ItemIndex:=1;

      if LoLimit then RadioGroup2.ItemIndex:=0
      else Radiogroup2.ItemIndex:=1;

      if ShowIfZero then ShowIfZeroRadioGroup.ItemIndex:=0
      else ShowIfZeroRadioGroup.ItemIndex:=1;

      tvg:=TCPDiapazone.Create;
      tvg.Clear;
      if DiapStartValues.count=0 then DiapStartValues.Add(value);
      tstr:=tvg.Preprocess(trimEX(AltStartValuesEdit.Text));

      if (tstr<>';') then tvg.Assign(tstr+']')
      else tvg.Clear;

      if (not DiapStartValues.IsEqualWith(tvg)) or (trimEX(AltStartValuesEdit.Text)='') then AltStartValuesEdit.Text:=DiapStartValues.GetExtString;
      tvg.Destroy;
    end;
  end
  else ShowParVF;
end;

procedure TFormPropertiesEdit.FormShow(Sender: TObject);
var
  i,cnt:integer;
begin
  is_ok_pressed:=false;
  VFShowMode:=true;

  QuestDifficultyTrackBar.Position:=FormGame.Difficulty;
  SelectedParameter:=0;
  RightClickedParameter:=0;

  DefPathGoTimesEdit.Text:=IntToStrEC(FormGame.DefPathGoTimesValue);
  DefUnlPathGoTimesCheck.Checked:=(FormGame.DefPathGoTimesValue=0);

  ParList.Clear;
  for i:=1 to FormGame.ParsValue do
  begin
    ParList.AddItem(IntToStrEC(i), Sender);
    ParList.Checked[i-1]:=FormGame.Pars[i].Enabled;
  end;
  ParList.ItemIndex:=0;

  cnt:=High(OldPars);
  for i:=ParList.Count+1 to High(OldPars) do OldPars[i].Free;
  SetLength(OldPars,ParList.Count+1);
  for i:=cnt+1 to ParList.Count do OldPars[i]:=TParameter.Create(i);

  for i:=1 to High(OldPars) do
  begin
    OldPars[i].CopyDataFrom(FormGame.Pars[i]);
  end;

  RSTrader.Checked:=QTrader in FormGame.SRangerStatus;
  RSPirate.Checked:=QPirate in FormGame.SRangerStatus;
  RSWarrior.Checked:=QWarrior in FormGame.SRangerStatus;

  RRMaloc.Checked:=QMaloc in FormGame.SRangerRace;
  RRPeleng.Checked:=QPeleng in FormGame.SRangerRace;
  RRPeople.Checked:=QPeople in FormGame.SRangerRace;
  RRFei.Checked:=QFei in FormGame.SRangerRace;
  RRGaal.Checked:=QGaal in FormGame.SRangerRace;

  RMaloc.Checked:=QMaloc in FormGame.SRace;
  RPeleng.Checked:=QPeleng in FormGame.SRace;
  RPeople.Checked:=QPeople in FormGame.SRace;
  RFei.Checked:=QFei in FormGame.SRace;
  RGaal.Checked:=QGaal in FormGame.SRace;

  TNone.Checked:=QNone in FormGame.STargetRace;
  TMaloc.Checked:=QMaloc in FormGame.STargetRace;
  TPeleng.Checked:=QPeleng in FormGame.STargetRace;
  TPeople.Checked:=QPeople in FormGame.STargetRace;
  TFei.Checked:=QFei in FormGame.STargetRace;
  TGaal.Checked:=QGaal in FormGame.STargetRace;

  PlanetReactionTrackBar.Position:=(FormGame.PlanetReaction+100) div 5;

  if FormGame.BlockXgradient=BXG4 then X4RB.Checked:=true;
  if FormGame.BlockXgradient=BXG3 then X3RB.Checked:=true;
  if FormGame.BlockXgradient=BXG2 then X2RB.Checked:=true;
  if FormGame.BlockXgradient=BXG1 then X1RB.Checked:=true;

  if FormGame.BlockYgradient=BYG4 then Y4RB.Checked:=true;
  if FormGame.BlockYgradient=BYG3 then Y3RB.Checked:=true;
  if FormGame.BlockYgradient=BYG2 then Y2RB.Checked:=true;
  if FormGame.BlockYgradient=BYG1 then Y1RB.Checked:=true;

  RangerEdit.text:=trimEX(FormGame.RRanger.text);
  ToPlanetEdit.text:=trimEX(FormGame.RToPlanet.text);
  ToStarEdit.text:=trimEX(FormGame.RToStar.text);
  FromPlanetEdit.text:=trimEX(FormGame.RFromPlanet.text);
  FromStarEdit.text:=trimEX(FormGame.RFromStar.text);

  QuestSuccessGovMessageEdit.Clear;
  QuestSuccessGovMessageEdit.Text:=trimEX(FormGame.QuestSuccessGovMessage.Text);

  QuestDescriptionEdit.Clear;
  QuestDescriptionEdit.Text:=trimEX(FormGame.QuestDescription.Text);

  if FormGame.NeedNotToReturn then NeedToReturnNoRadioButton.Checked:=true
  else NeedToReturnYesRadioButton.Checked:=true;

  RightClickedParameter:=ParList.ItemIndex+1;

  ProcessEnabledControls;
end;

procedure TFormPropertiesEdit.CancelButtonClick(Sender: TObject);
begin
  is_ok_pressed:=false;
  Close;
end;

procedure TFormPropertiesEdit.OkButtonClick(Sender: TObject);
var
  new_xg,new_yg:integer;
	i,c:integer;
begin
  is_ok_pressed:=true;
  FormGame.DefPathGoTimesValue:=StrToIntEC(DefPathGoTimesEdit.Text);

  with FormGame do
  begin
    for i:=1 to ParsValue do
    begin
      for c:=0 to Pars[i].DiapStartValues.Count-1 do
      begin
        with Pars[i].DiapStartValues do
        begin
          if low[c]<Pars[i].min then low[c]:=Pars[i].min;
          if low[c]>Pars[i].max then low[c]:=Pars[i].max;
          if hi[c]<Pars[i].min then hi[c]:=Pars[i].min;
          if hi[c]>Pars[i].max then hi[c]:=Pars[i].max;
        end;
      end;
    end;
  end;

  FormGame.PlanetReaction:=PlanetReactionTrackBar.Position*5-100;
  new_xg:=BXG4;
  new_yg:=BYG4;
  if X1RB.Checked then new_xg:=BXG1;
  if X2RB.Checked then new_xg:=BXG2;
  if X3RB.Checked then new_xg:=BXG3;
  if X4RB.Checked then new_xg:=BXG4;
  if Y1RB.Checked then new_yg:=BYG1;
  if Y2RB.Checked then new_yg:=BYG2;
  if Y3RB.Checked then new_yg:=BYG3;
  if Y4RB.Checked then new_yg:=BYG4;
  ResizeToNewGradient(new_xg,new_yg);
  CorrectPathThingParameters;

  with FormGame do
  begin
    SRangerStatus:=[];
    if RSTrader.Checked then SRangerStatus:=SRangerStatus+[QTrader];
    if RSPirate.Checked then SRangerStatus:=SRangerStatus+[QPirate];
    if RSWarrior.Checked then SRangerStatus:=SRangerStatus+[QWarrior];
    if SRangerStatus=[] then SRangerStatus:=[QTrader,QPirate,QWarrior];

    SRangerRace:=[];
    if RRMaloc.Checked then  SRangerRace:= SRangerRace+[QMaloc];
    if RRPeleng.Checked then  SRangerRace:= SRangerRace+[QPeleng];
    if RRPeople.Checked then  SRangerRace:= SRangerRace+[QPeople];
    if RRFei.Checked then  SRangerRace:= SRangerRace+[QFei];
    if RRGaal.Checked then  SRangerRace:= SRangerRace+[QGaal];

    SRace:=[];
    if RMaloc.Checked then  SRace:= SRace+[QMaloc];
    if RPeleng.Checked then  SRace:= SRace+[QPeleng];
    if RPeople.Checked then  SRace:= SRace+[QPeople];
    if RFei.Checked then  SRace:= SRace+[QFei];
    if RGaal.Checked then  SRace:= SRace+[QGaal];
    if SRace=[] then SRace:=[QMaloc];

    STargetRace:=[];
    if TNone.Checked then  STargetRace:= STargetRace+[QNone];
    if TMaloc.Checked then  STargetRace:= STargetRace+[QMaloc];
    if TPeleng.Checked then  STargetRace:= STargetRace+[QPeleng];
    if TPeople.Checked then  STargetRace:= STargetRace+[QPeople];
    if TFei.Checked then  STargetRace:= STargetRace+[QFei];
    if TGaal.Checked then  STargetRace:= STargetRace+[QGaal];
  end;

  FormGame.QuestSuccessGovMessage.Clear;
  FormGame.QuestSuccessGovMessage.Text:=trimEX(QuestSuccessGovMessageEdit.Text);
  FormGame.QuestDescription.Clear;
  FormGame.QuestDescription.Text:=trimEX(QuestDescriptionEdit.Text);
  Close;
end;


procedure TFormPropertiesEdit.AParActiveCheckClick(Sender: TObject);
begin
  ProcessEnabledControls;
end;

procedure TFormPropertiesEdit.BParActiveCheckClick(Sender: TObject);
begin
  ProcessEnabledControls;
end;

procedure TFormPropertiesEdit.CParActiveCheckClick(Sender: TObject);
begin
  ProcessEnabledControls;
end;

procedure TFormPropertiesEdit.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key=VK_ESCAPE then
  begin
    is_ok_pressed:=false;
    close;
  end;
end;

procedure TFormPropertiesEdit.X1RBClick(Sender: TObject);
begin
  ProcessEnabledControls;
end;

procedure TFormPropertiesEdit.X2RBClick(Sender: TObject);
begin
  ProcessEnabledControls;
end;

procedure TFormPropertiesEdit.X3RBClick(Sender: TObject);
begin
  ProcessEnabledControls;
end;

procedure TFormPropertiesEdit.X4RBClick(Sender: TObject);
begin
  ProcessEnabledControls;
end;

procedure TFormPropertiesEdit.DParActiveCheckClick(Sender: TObject);
begin
  ProcessEnabledControls;
end;

procedure TFormPropertiesEdit.EParActiveCheckClick(Sender: TObject);
begin
  ProcessEnabledControls;
end;

procedure TFormPropertiesEdit.FParActiveCheckClick(Sender: TObject);
begin
  ProcessEnabledControls; 
end;

procedure TFormPropertiesEdit.PlanetReactionTrackBarChange(Sender: TObject);
var k:integer;
begin
  k:=PlanetReactionTrackBar.Position*5;
  case k of
    0..99:
    begin
      PlanetReactionLabel3.Caption:=QuestMessages.ParPath_Get('FormProperties.RelationChangeWorse');
      PlanetReactionGauge.ForeColor:=clRed;
      PlanetReactionGauge.Progress:=100-k;
    end;
    100:
    begin
      PlanetReactionLabel3.Caption:=QuestMessages.ParPath_Get('FormProperties.RelationChangeNone');
      PlanetReactionGauge.ForeColor:=clBlack;
      PlanetReactionGauge.Progress:=0;
    end;
    101..200:
    begin
      PlanetReactionLabel3.Caption:=QuestMessages.ParPath_Get('FormProperties.RelationChangeBetter');
      PlanetReactionGauge.ForeColor:=clBlue;
      PlanetReactionGauge.Progress:=k-100;
    end;
  end;
end;

procedure TFormPropertiesEdit.ParNameEditChange(Sender: TObject);
begin
  FormGame.Pars[SelectedParameter].Name.Text:=ParNameEdit.text;
  ProcessEnabledControls;
end;

procedure TFormPropertiesEdit.RadioGroup1Click(Sender: TObject);
var
  flag:boolean;
  i:integer;
  delta:TParameterDelta;
begin
  FormGame.Pars[SelectedParameter].ParType:=RadioGroup1.ItemIndex;
  if RadioGroup1.ItemIndex=0 then flag:=false
  else flag:=true;

  RadioGroup2.Visible:=flag;
  ParCriticalMessageMemo.Visible:=flag;
  ImageEdit.Visible:=flag;
  BGMEdit.Visible:=flag;
  SoundEdit.Visible:=flag;

  for i:=1 to FormGame.LocationsValue do
  begin
    delta:=FormGame.Locations[i].FindDeltaForParNum(i);
    if delta<>nil then delta.CriticalMessageVisible:=flag;
  end;

  for i:=1 to FormGame.PathesValue do
  begin
    delta:=FormGame.Pathes[i].FindDeltaForParNum(i);
    if delta<>nil then delta.CriticalMessageVisible:=flag;
  end;
end;

procedure TFormPropertiesEdit.ParViewActionRGClick(Sender: TObject);
begin
  FormGame.Pars[SelectedParameter].Hidden:= ParViewActionRG.ItemIndex=1;
end;

procedure TFormPropertiesEdit.RadioGroup2Click(Sender: TObject);
begin
  FormGame.Pars[SelectedParameter].LoLimit:=RadioGroup2.ItemIndex=0;
end;

procedure TFormPropertiesEdit.ParCriticalMessageMemoChange(Sender: TObject);
begin
  FormGame.Pars[SelectedParameter].CriticalEvent.Text.Text:=trimEX(ParCriticalMessageMemo.text);
end;

procedure TFormPropertiesEdit.MinGateEditChange(Sender: TObject);
var
  min,max:integer;
begin
  if VFShowMode then exit;

  if MinGateEdit.text='' then
  begin
    MinGateEdit.text:='0';
    exit;
  end;

  min:=StrToIntFullEC(MinGateEdit.text);
  max:=StrToIntFullEC(MaxGateEdit.text);

  if min>=max then
  begin
    min:=max-1;
    MinGateEdit.Text:=IntToStrEC(min);
    MinGateEdit.SelStart := high(Integer);
    exit;
  end;

  if min<-100000000 then
  begin
    min:=-100000000;
    MinGateEdit.Text:=IntToStrEC(min);
    MinGateEdit.SelStart := high(Integer);
    exit;
  end;

  if FormGame.Pars[SelectedParameter].min=min then exit;

  FormGame.Pars[SelectedParameter].min:=min;

  if (VFShowMode=false) then
  begin
    Edit3.Text:=IntToStrEC(FormGame.Pars[SelectedParameter].ValueOfViewStrings);
  end;

  if (FormGame.Pars[SelectedParameter].ViewFormatStrings[1].min <> FormGame.Pars[SelectedParameter].min) or
     (FormGame.Pars[SelectedParameter].ViewFormatStrings[FormGame.Pars[SelectedParameter].ValueOfViewStrings].max <> FormGame.Pars[SelectedParameter].max) then
  begin
    SetDefaultDiapasones;
    ShowParVF;
  end;
end;

procedure TFormPropertiesEdit.MaxGateEditChange(Sender: TObject);
var
  min,max:integer;
begin
  if VFShowMode then exit;

  if MaxGateEdit.text='' then
  begin
    MaxGateEdit.text:='1';
    exit;
  end;

  min:=StrToIntFullEC(MinGateEdit.text);
  max:=StrToIntFullEC(MaxGateEdit.text);

  if min>=max then
  begin
    max:=min+1;
    MaxGateEdit.Text:=IntToStrEC(max);
    MaxGateEdit.SelStart := high(Integer);
    exit;
  end;

  if max>100000000 then
  begin
    max:=100000000;
    MaxGateEdit.Text:=IntToStrEC(max);
    MaxGateEdit.SelStart := high(Integer);
    exit;
  end;

  if FormGame.Pars[SelectedParameter].max=max then exit;

  FormGame.Pars[SelectedParameter].max:=max;

  if VFShowMode=false then
  begin
    Edit3.Text:=IntToStrEC(FormGame.Pars[SelectedParameter].ValueOfViewStrings);
  end;

  if (FormGame.Pars[SelectedParameter].ViewFormatStrings[1].min <> FormGame.Pars[SelectedParameter].min) or
     (FormGame.Pars[SelectedParameter].ViewFormatStrings[FormGame.Pars[SelectedParameter].ValueOfViewStrings].max <> FormGame.Pars[SelectedParameter].max) then
  begin
    SetDefaultDiapasones;
    ShowParVF;
  end;
end;

procedure TFormPropertiesEdit.RangerEditChange(Sender: TObject);
begin
  FormGame.RRanger.text:=trimEX(RangerEdit.text);
end;

procedure TFormPropertiesEdit.ToPlanetEditChange(Sender: TObject);
begin
  FormGame.RToPlanet.text:=trimEX(ToPlanetEdit.text);
end;

procedure TFormPropertiesEdit.ToStarEditChange(Sender: TObject);
begin
  FormGame.RToStar.text:=trimEX(ToStarEdit.text);
end;

procedure TFormPropertiesEdit.FromPlanetEditChange(Sender: TObject);
begin
  FormGame.RFromPlanet.text:=trimEX(FromPlanetEdit.text);
end;

procedure TFormPropertiesEdit.FromStarEditChange(Sender: TObject);
begin
  FormGame.RFromStar.text:=trimEX(FromStarEdit.text);
end;

procedure TFormPropertiesEdit.ParGameNameEditChange(Sender: TObject);
begin
  ProcessEnabledControls;
end;

procedure TFormPropertiesEdit.ShowIfZeroRadioGroupClick(Sender: TObject);
var flag:boolean;
begin
  flag := (ShowIfZeroRadioGroup.ItemIndex=0);
  FormGame.Pars[SelectedParameter].ShowIfZero:=flag;
  ProcessEnabledControls;
end;

procedure TFormPropertiesEdit.NeedToReturnNoRadioButtonClick(Sender: TObject);
begin
  FormGame.NeedNotToReturn:=true;
end;

procedure TFormPropertiesEdit.NeedToReturnYesRadioButtonClick(Sender: TObject);
begin
  FormGame.NeedNotToReturn:=false;
end;

procedure TFormPropertiesEdit.CntParamsChange(Sender: TObject);
var cnt:integer;
begin
  if {VFShowMode or} (SelectedParameter<1) then
  begin
    Edit3.Text:='';
    exit;
  end;

  if VFShowMode or (PageControl3.ActivePageIndex=0) then exit;

  try
    cnt:=StrToIntFullEC(Edit3.Text);
    cnt:=max(1,min(cnt,GetAvailDiapasones));
    if cnt<>FormGame.Pars[SelectedParameter].ValueOfViewStrings  then
      ResetDiapasones(1,cnt,FormGame.Pars[SelectedParameter].min,FormGame.Pars[SelectedParameter].max,false);

  finally
  end;

  ShowParVF;

end;

procedure TFormPropertiesEdit.VFEditChange(Sender: TObject);
begin
  FormGame.Pars[SelectedParameter].ViewFormatStrings[TEdit(Sender).Tag].str.text:=TEdit(Sender).text;
end;

{procedure TFormPropertiesEdit.VFGateMinEditClick(Sender: TObject);
begin
  ProcessOnDiapasoneEnter(TEdit(Sender).Tag,0, true);
end;

procedure TFormPropertiesEdit.VFGateMaxEditClick(Sender: TObject);
begin
  ProcessOnDiapasoneEnter(TEdit(Sender).Tag,0, false);
end;}

procedure TFormPropertiesEdit.VFGateMinFocusLost(Sender: TObject);
var tstr:WideString;
    VFValue,VFNum:integer;
    temp:TParameter;
    posScr:integer;

  procedure resetText;
  begin
    TEdit(Sender).Text:=IntToStrEC(FormGame.Pars[SelectedParameter].ViewFormatStrings[TEdit(Sender).Tag].Max);
  end;
begin
  if VFShowMode then begin resetText; exit; end;

  tstr:=TEdit(Sender).Text;
  if tstr='' then begin resetText; exit; end;
  VFValue:=StrToIntFullEC(tstr);

  VFNum:=TEdit(Sender).Tag;

  if VFValue=FormGame.Pars[SelectedParameter].ViewFormatStrings[VFNum].min then exit;

  temp:=TParameter.Create(0);
  temp.CopyDataFrom(FormGame.Pars[SelectedParameter]);

  with FormGame.Pars[SelectedParameter] do
  begin
    if ViewFormatStrings[VFNum].min>VFValue then
    begin
      ResetDiapasones(1,VFNum-1,min,VFValue-1,true);
      ViewFormatStrings[VFNum].min:=VFValue;
    end;
    if ViewFormatStrings[VFNum].min<VFValue then
    begin
      if ViewFormatStrings[VFNum].max<VFValue then ResetDiapasones(VFNum,ValueOfViewStrings-VFNum+1,VFValue,max,true)
      else ViewFormatStrings[VFNum].min:=VFValue;
      ViewFormatStrings[VFNum-1].max:=VFValue-1;
    end;
  end;

  if not VFDiapasonesAreValid(FormGame.Pars[SelectedParameter]) then
  begin
		FormGame.Pars[SelectedParameter].CopyDataFrom(temp);
		ShowMessage(QuestMessages.ParPath_Get('FormProperties.InvalidValue'));
    resetText;
	end;

  posScr:=ParamDescriptions.VertScrollBar.Position;
  ShowParVF;
  ParamDescriptions.VertScrollBar.Position:=posScr;
	temp.Destroy;
end;

procedure TFormPropertiesEdit.VFGateMaxFocusLost(Sender: TObject);
var tstr:WideString;
    VFValue,VFNum:integer;
    temp:TParameter;
    posScr:integer;

  procedure resetText;
  begin
    TEdit(Sender).Text:=IntToStrEC(FormGame.Pars[SelectedParameter].ViewFormatStrings[TEdit(Sender).Tag].Max);
  end;
begin
  if VFShowMode then begin resetText; exit; end;

  tstr:=TEdit(Sender).Text;
  if tstr='' then begin resetText; exit; end;
  VFValue:=StrToIntFullEC(tstr);

  VFNum:=TEdit(Sender).Tag;

  if VFValue=FormGame.Pars[SelectedParameter].ViewFormatStrings[VFNum].max then exit;

  temp:=TParameter.Create(0);
  temp.CopyDataFrom(FormGame.Pars[SelectedParameter]);

  with FormGame.Pars[SelectedParameter] do
  begin
    if ViewFormatStrings[VFNum].max>VFValue then
    begin
      if ViewFormatStrings[VFNum].min>VFValue then ResetDiapasones(1,VFNum,min,VFValue,true)
      else ViewFormatStrings[VFNum].max:=VFValue;
      ViewFormatStrings[VFNum+1].min:=VFValue+1;
    end;
    if ViewFormatStrings[VFNum].max<VFValue then
    begin
      ResetDiapasones(VFNum+1,ValueOfViewStrings-VFNum,VFValue+1,max,true);
      ViewFormatStrings[VFNum].max:=VFValue;
    end;
  end;

  if not VFDiapasonesAreValid(FormGame.Pars[SelectedParameter]) then
  begin
		FormGame.Pars[SelectedParameter].CopyDataFrom(temp);
		ShowMessage(QuestMessages.ParPath_Get('FormProperties.InvalidValue'));
    resetText;
	end;

  posScr:=ParamDescriptions.VertScrollBar.Position;
  ShowParVF;
  ParamDescriptions.VertScrollBar.Position:=posScr;
	temp.Destroy;
end;

procedure TFormPropertiesEdit.VFGateMinPress(Sender: TObject; var Key: Char);
var tstr:WideString;
    VFValue,VFNum:integer;
    temp:TParameter;
    posScr:integer;

  procedure resetText;
  begin
    TEdit(Sender).Text:=IntToStrEC(FormGame.Pars[SelectedParameter].ViewFormatStrings[TEdit(Sender).Tag].Max);
  end;
begin
  if VFShowMode then begin resetText; exit; end;
  if Key <> #13 then exit;
  Key := #0;

  tstr:=TEdit(Sender).Text;
  if tstr='' then begin resetText; exit; end;
  VFValue:=StrToIntFullEC(tstr);

  VFNum:=TEdit(Sender).Tag;

  if VFValue=FormGame.Pars[SelectedParameter].ViewFormatStrings[VFNum].min then exit;

  temp:=TParameter.Create(0);
  temp.CopyDataFrom(FormGame.Pars[SelectedParameter]);

  with FormGame.Pars[SelectedParameter] do
  begin
    if ViewFormatStrings[VFNum].min>VFValue then
    begin
      ResetDiapasones(1,VFNum-1,min,VFValue-1,true);
      ViewFormatStrings[VFNum].min:=VFValue;
    end;
    if ViewFormatStrings[VFNum].min<VFValue then
    begin
      if ViewFormatStrings[VFNum].max<VFValue then ResetDiapasones(VFNum,ValueOfViewStrings-VFNum+1,VFValue,max,true)
      else ViewFormatStrings[VFNum].min:=VFValue;
      ViewFormatStrings[VFNum-1].max:=VFValue-1;
    end;
  end;

  if not VFDiapasonesAreValid(FormGame.Pars[SelectedParameter]) then
  begin
		FormGame.Pars[SelectedParameter].CopyDataFrom(temp);
		ShowMessage(QuestMessages.ParPath_Get('FormProperties.InvalidValue'));
    resetText;
	end;

  posScr:=ParamDescriptions.VertScrollBar.Position;
  ShowParVF;
  ParamDescriptions.VertScrollBar.Position:=posScr;
	temp.Destroy;
end;

procedure TFormPropertiesEdit.VFGateMaxPress(Sender: TObject; var Key: Char);
var tstr:WideString;
    VFValue,VFNum:integer;
    temp:TParameter;
    posScr:integer;

  procedure resetText;
  begin
    TEdit(Sender).Text:=IntToStrEC(FormGame.Pars[SelectedParameter].ViewFormatStrings[TEdit(Sender).Tag].Max);
  end;
begin
  if VFShowMode then begin resetText; exit; end;
  if Key <> #13 then exit;
  Key := #0;

  tstr:=TEdit(Sender).Text;
  if tstr='' then begin resetText; exit; end;
  VFValue:=StrToIntFullEC(tstr);

  VFNum:=TEdit(Sender).Tag;

  if VFValue=FormGame.Pars[SelectedParameter].ViewFormatStrings[VFNum].max then exit;

  temp:=TParameter.Create(0);
  temp.CopyDataFrom(FormGame.Pars[SelectedParameter]);

  with FormGame.Pars[SelectedParameter] do
  begin
    if ViewFormatStrings[VFNum].max>VFValue then
    begin
      if ViewFormatStrings[VFNum].min>VFValue then ResetDiapasones(1,VFNum,min,VFValue,true)
      else ViewFormatStrings[VFNum].max:=VFValue;
      ViewFormatStrings[VFNum+1].min:=VFValue+1;
    end;
    if ViewFormatStrings[VFNum].max<VFValue then
    begin
      ResetDiapasones(VFNum+1,ValueOfViewStrings-VFNum,VFValue+1,max,true);
      ViewFormatStrings[VFNum].max:=VFValue;
    end;
  end;

  if not VFDiapasonesAreValid(FormGame.Pars[SelectedParameter]) then
  begin
		FormGame.Pars[SelectedParameter].CopyDataFrom(temp);
		ShowMessage(QuestMessages.ParPath_Get('FormProperties.InvalidValue'));
    resetText;
	end;

  posScr:=ParamDescriptions.VertScrollBar.Position;
  ShowParVF;
  ParamDescriptions.VertScrollBar.Position:=posScr;
	temp.Destroy;
end;


procedure TFormPropertiesEdit.PageControl3Change(Sender: TObject);
begin
  Edit3.Text:=IntToStrEC(FormGame.Pars[SelectedParameter].ValueOfViewStrings);
end;

procedure TFormPropertiesEdit.IsPlayerMoneyParCheckBoxClick(Sender: TObject);
var i:integer;
begin
  if IsPlayerMoneyParCheckBox.Checked then
    for i:=1 to FormGame.ParsValue do
      FormGame.Pars[i].Money:=false;

  FormGame.Pars[SelectedParameter].Money:=IsPlayerMoneyParCheckBox.Checked;
end;

procedure TFormPropertiesEdit.AltStartValuesEditChange(Sender: TObject);
var
  tvg:TCPDiapazone;
  tstr:WideString;
begin
  if SelectedParameter<=0 then exit;
  tvg:=TCPDiapazone.Create;
  tvg.Clear;
  tstr:=tvg.Preprocess(AltStartValuesEdit.Text);

  if tstr<>';' then tvg.Assign(tstr+']')
  else tvg.Clear;

  if not FormGame.Pars[SelectedParameter].DiapStartValues.IsEqualWith(tvg) then
  begin
    FormGame.Pars[SelectedParameter].DiapStartValues.CopyDataFrom(tvg);
    ProcessEnabledControls;
  end;
  tvg.Destroy;
end;

procedure TFormPropertiesEdit.DefUnlPathGoTimesCheckClick(Sender: TObject);
begin
  if DefUnlPathGoTimesCheck.Checked then
  begin
    DefPathGoTimesEdit.Visible:=false;
    DefPathGoTimesEdit.Text:='0';
  end else DefPathGoTimesEdit.Visible:=true;
end;

procedure TFormPropertiesEdit.DefPathGoTimesEditChange(Sender: TObject);
begin
  try
    StrToIntEC('0'+DefPathGoTimesEdit.Text);
  except
  {else} DefPathGoTimesEdit.Text:=IntToStrEC(FormGame.DefPathGoTimesValue);
  end;
end;

procedure TFormPropertiesEdit.QuestDifficultyTrackBarChange(Sender: TObject);
begin
  QuestDifficultyGauge.Progress:=QuestDifficultyTrackBar.position;
  FormGame.Difficulty:=QuestDifficultyTrackBar.position;
end;

procedure TFormPropertiesEdit.ParListClick(Sender: TObject);
begin
  ProcessEnabledControls();
end;

procedure TFormPropertiesEdit.ParListClickCheck(Sender: TObject);
var
  i: integer;
begin
  for i:=1 to ParList.Count do FormGame.Pars[i].Enabled:=ParList.Checked[i-1];
  i:=ParList.Count;
  if ParList.Checked[i-1] then
  begin
    SetLength(OldPars,i+2);
    OldPars[i+1]:=TParameter.Create(i+1);
    FormGame.ParsList.Add(TParameter.Create(i+1));
    ParList.AddItem(IntToStrEC(i+1), Sender);
    ParList.Checked[i]:=false;
  end;
  ProcessEnabledControls();
end;

procedure TFormPropertiesEdit.ImageEditChange(Sender: TObject);
begin
  FormGame.Pars[SelectedParameter].CriticalEvent.Image.Text:=trimEX(ImageEdit.text);
end;

procedure TFormPropertiesEdit.BGMEditChange(Sender: TObject);
begin
  FormGame.Pars[SelectedParameter].CriticalEvent.BGM.Text:=trimEX(BGMEdit.text);
end;

procedure TFormPropertiesEdit.SoundEditChange(Sender: TObject);
begin
  FormGame.Pars[SelectedParameter].CriticalEvent.Sound.Text:=trimEX(SoundEdit.text);
end;


procedure TFormPropertiesEdit.ParamSwitch(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var flag:boolean;
begin
  if (ssShift in Shift) and (RightClickedParameter<>(ParList.ItemIndex+1)) then
  begin
    flag:=ParList.Checked[ParList.ItemIndex];
    ParList.Checked[ParList.ItemIndex]:=ParList.Checked[RightClickedParameter-1];
    ParList.Checked[RightClickedParameter-1]:=flag;
    ProcessRightParameterClick(ParList.ItemIndex+1);
    ParListClickCheck(Sender);
    //ProcessEnabledControls;
  end
  else if (ssCtrl in Shift) and (RightClickedParameter<>(ParList.ItemIndex+1)) then
  begin
    if (not FormGame.Pars[ParList.ItemIndex+1].Enabled) or
       (MessageDlg(QuestMessages.ParPath_Get('FormProperties.OverwriteParamConfirm') +
                      ' [p' + IntToStrEC(ParList.ItemIndex+1)+']' +
                      ' ('+FormGame.Pars[ParList.ItemIndex+1].Name.Text+')', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
    begin
      ParList.Checked[ParList.ItemIndex]:=ParList.Checked[RightClickedParameter-1];
      FormGame.Pars[ParList.ItemIndex+1].CopyDataFrom(FormGame.Pars[RightClickedParameter]);
      FormGame.Pars[ParList.ItemIndex+1].Name.Text:='Copy of '+FormGame.Pars[ParList.ItemIndex+1].Name.Text;
      ShowParVF;
      ParList.Items[ParList.ItemIndex]:=IntToStrEC(ParList.ItemIndex+1)+': '+FormGame.Pars[ParList.ItemIndex+1].Name.Text;
    end;
    ParListClickCheck(Sender);
    //ProcessEnabledControls;
  end
  else if (ssAlt in Shift) then
  begin
    if (not FormGame.Pars[ParList.ItemIndex+1].Enabled) or
       (MessageDlg(QuestMessages.ParPath_Get('FormProperties.DeleteParamConfirm') +
                      ' [p' + IntToStrEC(ParList.ItemIndex+1)+']' +
                      ' ('+FormGame.Pars[ParList.ItemIndex+1].Name.Text+')', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
    begin
      ParList.Checked[ParList.ItemIndex]:=false;
      FormGame.Pars[ParList.ItemIndex+1].Clear(ParList.ItemIndex+1);

      ParList.Items[ParList.ItemIndex]:=IntToStrEC(ParList.ItemIndex+1)+': '+FormGame.Pars[ParList.ItemIndex+1].Name.Text;
      ShowParVF;
      ParListClickCheck(Sender);
      //ProcessEnabledControls;
    end;
  end;

  RightClickedParameter:=ParList.ItemIndex+1;
end;

procedure TFormPropertiesEdit.MemoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TFormPropertiesEdit.EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

