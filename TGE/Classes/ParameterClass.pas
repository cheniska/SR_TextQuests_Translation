unit ParameterClass;

interface

uses EC_Struct, TextFieldClass, ParViewStringClass, ValueListClass, CPDiapClass, EventClass, EC_Buf;

const
  NoCriticalParType=0;
  FailParType=1;
  SuccessParType=2;
  DeathParType=3;
  
type TParameter=class(TObjectEx)
  public
    min:integer;
    max:integer;
    value:integer;
    Name:TTextField;

    CriticalEvent:TEvent;
    CriticalEventOverride:TEvent;
    ParType:integer;
    Hidden:boolean;  //Не видно сейчас
    ShowIfZero:boolean;
    LoLimit:boolean;
    Enabled:boolean;//Используется ли
    Money:boolean;

    DefaultFormatString:TTextField;
    ViewFormatStrings: array of TParViewString;
    ValueOfViewStrings:integer;
    ReservedViewStrings:integer;

    DiapStartValues:TCPDiapazone;

    constructor Create(parameternumber:integer);
    destructor Destroy; override;
    
    function GetDefaultMinGate:integer;
    function GetDefaultMaxGate:integer;

    procedure Assign(newvalue:integer);

    function GetVFStringByValue(value:integer):WideString;

    procedure Clear(parameternumber:integer);
    procedure ReserveFormatStrings(cnt:integer;parameternumber:integer=0);

    procedure CopyDataFrom(const source:TParameter);

    procedure Load_Old(Buf:TBufEC);
    procedure Load_3_9_0(Buf:TBufEC);
    procedure Load_3_9_5(Buf:TBufEC);
    procedure Load_3_9_6(Buf:TBufEC);
    procedure Save_4_0_1(Buf:TBufEC);
    procedure Load_4_0_1(Buf:TBufEC);
    procedure Save_5_0_0(Buf:TBufEC);
    procedure Load_5_0_0(Buf:TBufEC);
end;

implementation

uses MessageText,EC_Str;

constructor TParameter.Create(parameternumber:integer);
begin
  inherited Create;

  ValueOfViewStrings:=0;
  ReservedViewStrings:=0;
  SetLength(ViewFormatStrings,0);

  Name:=TTextField.Create;
  DefaultFormatString:=TTextField.Create;
  CriticalEvent:=TEvent.Create;
  CriticalEventOverride:=nil;
  DiapStartValues:=TCPDiapazone.Create;
  Clear(parameternumber);
end;

destructor TParameter.Destroy;
var
  i:integer;
begin
  for i:=1 to ReservedViewStrings do
  begin
    ViewFormatStrings[i].Free;
    ViewFormatStrings[i]:=nil;
  end;
  SetLength(ViewFormatStrings,0);

  Name.Free; Name:=nil;
  DefaultFormatString.Free; DefaultFormatString:=nil;
  CriticalEvent.Free; CriticalEvent:=nil;
  DiapStartValues.Free; DiapStartValues:=nil;

  inherited Destroy;
end;

procedure TParameter.Clear(parameternumber:integer);
begin
  Money:=false;
  Enabled:=false;
  Hidden:=false;
  ShowIfZero:=true;
  LoLimit:=true;
  Min:=0;
  Max:=1;

  DiapStartValues.Clear;

  ValueOfViewStrings:=1;
  ReserveFormatStrings(1,parameternumber);
  ViewFormatStrings[1].min:=Min;
  ViewFormatStrings[1].max:=Max;

  Value:=0;
  ParType:=NoCriticalParType;
  Name.Text:=QuestMessages.Par_Get('ParameterDefaultName')+' '+IntToStrEC(parameternumber);
  DefaultFormatString.Text:=QuestMessages.Par_Get('ParameterDefaultName')+' '+IntToStrEC(parameternumber)+': <>';
  ViewFormatStrings[1].str.Text:=DefaultFormatString.Text;
  CriticalEvent.Clear;
  CriticalEventOverride:=nil;
  CriticalEvent.Text.text:=QuestMessages.Par_Get('ParameterDefaultCriticalMessage')+' ' +IntToStrEC(parameternumber);
end;

procedure TParameter.ReserveFormatStrings(cnt:integer;parameternumber:integer=0);
begin
  while cnt>ReservedViewStrings do
  begin
    inc(ReservedViewStrings);
    SetLength(ViewFormatStrings,ReservedViewStrings+1);
    ViewFormatStrings[ReservedViewStrings]:=TParViewString.Create(QuestMessages.Par_Get('ParameterDefaultName')+' '+IntToStrEC(parameternumber)+': <>');
  end;
end;

procedure TParameter.CopyDataFrom(const source:TParameter);
var
  i:integer;
begin
  ValueOfViewStrings:=source.ValueOfViewStrings;
  ReserveFormatStrings(ValueOfViewStrings);

  for i:=1 to ValueOfViewStrings do
    ViewFormatStrings[i].CopyDataFrom(source.ViewFormatStrings[i]);

  Money:=source.Money; 
  Enabled:=source.Enabled;
  Hidden:=source.Hidden;
  ShowIfZero:=Source.ShowIfZero;
  LoLimit:=source.LoLimit;
  Min:=source.Min;
  Max:=source.Max;
  Value:=source.Value;
  ParType:=source.ParType;
  Name.Text:=trimEX(source.Name.text);
  DefaultFormatString.Text:=source.DefaultFormatString.text;
  CriticalEvent.CopyDataFrom(source.CriticalEvent);
  DiapStartValues.CopyDataFrom(source.DiapStartValues);
end;

function TParameter.GetVFStringByValue(value:integer):WideString;
var
  i:integer;
begin


  for i:=1 to ValueOfViewStrings do
    if (value>=ViewFormatStrings[i].min) and (value<=ViewFormatStrings[i].max) then
    begin
      Result:=trimEX(ViewFormatStrings[i].str.Text);
      exit;
    end;

  if value>ViewFormatStrings[ValueOfViewStrings].max then Result:=ViewFormatStrings[ValueOfViewStrings].str.text
  else Result:=ViewFormatStrings[1].str.text;

  //Result:='Can not GetVFString - Out of range';
end;

function TParameter.GetDefaultMinGate:integer;
begin
  Result:=Min;
  if(ParType<>NoCriticalParType) and (ParType<>SuccessParType) and LoLimit then Result:=Result+1;
end;

function TParameter.GetDefaultMaxGate:integer;
begin
  Result:=Max;
  if (ParType<>NoCriticalParType) and (ParType<>SuccessParType) and not LoLimit then Result:=Result-1;
end;

procedure TParameter.Assign(newvalue:integer);
begin
  if Money then
  begin
    if newvalue<0 then value:=0 else value:=newvalue;
  end else begin
    if newvalue>max then value:=max
    else if newvalue<min then value:=min
    else value:=newvalue;
  end;
end;


procedure TParameter.Load_5_0_0(Buf:TBufEC);
var
  i:integer;
begin
  min:=Buf.GetInteger;
  max:=Buf.GetInteger;
  ParType:=Buf.GetInteger;
  Hidden:=false;
  ShowIfZero:=Buf.GetBoolean;
  LoLimit:=Buf.GetBoolean;
  Enabled:=Buf.GetBoolean;
  ValueOfViewStrings:=Buf.GetInteger;
  Money:=Buf.GetBoolean;

  Name.Load(Buf);

  ReserveFormatStrings(ValueOfViewStrings);

  for i:=1 to ValueOfViewStrings do ViewFormatStrings[i].Load(Buf);

  if ValueOfViewStrings<=0 then
  begin
    ValueOfViewStrings:=1;
    ReserveFormatStrings(1);
    ViewFormatStrings[1].min:=Min;
    ViewFormatStrings[1].max:=Max;
  end;

  CriticalEvent.Text.Load(Buf);
  CriticalEvent.Image.Load(Buf);
  CriticalEvent.Sound.Load(Buf);
  CriticalEvent.BGM.Load(Buf);

  DiapStartValues.Load(Buf);
end;

procedure TParameter.Save_5_0_0(Buf:TBufEC);
var
  i:integer;
begin
  Buf.AddInteger(min);
  Buf.AddInteger(max);
  Buf.AddInteger(ParType);
  Buf.AddBoolean(ShowIfZero);
  Buf.AddBoolean(LoLimit);
  Buf.AddBoolean(Enabled);
  Buf.AddInteger(ValueOfViewStrings);
  Buf.AddBoolean(Money);

  Name.Save(Buf);

  for i:=1 to ValueOfViewStrings do ViewFormatStrings[i].Save(Buf);

  CriticalEvent.Text.Save(Buf);
  CriticalEvent.Image.Save(Buf);
  CriticalEvent.Sound.Save(Buf);
  CriticalEvent.BGM.Save(Buf);

  DiapStartValues.SaveExt(Buf);
end;


procedure TParameter.Load_4_0_1(Buf:TBufEC);
var
  i:integer;
begin
  min:=Buf.GetInteger;
  max:=Buf.GetInteger;
  value:=Buf.GetInteger;
  ParType:=Buf.GetInteger;
  Hidden:=Buf.GetBoolean;
  ShowIfZero:=Buf.GetBoolean;
  LoLimit:=Buf.GetBoolean;
  Enabled:=Buf.GetBoolean;
  ValueOfViewStrings:=Buf.GetInteger;
  Money:=Buf.GetBoolean;

  Name.Load(Buf);

  ReserveFormatStrings(ValueOfViewStrings);

  for i:=1 to ValueOfViewStrings do ViewFormatStrings[i].Load(Buf);

  if ValueOfViewStrings<=0 then
  begin
    ValueOfViewStrings:=1;
    ReserveFormatStrings(1);
    ViewFormatStrings[1].min:=Min;
    ViewFormatStrings[1].max:=Max;
  end;

  CriticalEvent.Clear;
  CriticalEvent.Text.Load(Buf);

  DiapStartValues.Load(Buf);
end;


procedure TParameter.Save_4_0_1(Buf:TBufEC);
var
  i:integer;
begin
  Buf.AddInteger(min);
  Buf.AddInteger(max);
  Buf.AddInteger(value);
  Buf.AddInteger(ParType);
  Buf.AddBoolean(Hidden);
  Buf.AddBoolean(ShowIfZero);
  Buf.AddBoolean(LoLimit);
  Buf.AddBoolean(Enabled);
  Buf.AddInteger(ValueOfViewStrings);
  Buf.AddBoolean(Money);

  Name.Save(Buf);

  for i:=1 to ValueOfViewStrings do ViewFormatStrings[i].Save(Buf);

  CriticalEvent.Text.Save(Buf);
  DiapStartValues.Save(Buf);
end;


procedure TParameter.Load_3_9_6(Buf:TBufEC);
var
  i:integer;
  startValues:TValuesList;
begin
  min:=Buf.GetInteger;
  max:=Buf.GetInteger;
  value:=Buf.GetInteger;
  ParType:=Buf.GetInteger;
  Hidden:=Buf.GetBoolean;
  ShowIfZero:=Buf.GetBoolean;
  LoLimit:=Buf.GetBoolean;
  Enabled:=Buf.GetBoolean;
  ValueOfViewStrings:=Buf.GetInteger;
  Money:=Buf.GetBoolean;

  Name.Load(Buf);

  ReserveFormatStrings(ValueOfViewStrings);

  for i:=1 to ValueOfViewStrings do ViewFormatStrings[i].Load(Buf);

  if ValueOfViewStrings<=0 then
  begin
    ValueOfViewStrings:=1;
    ReserveFormatStrings(1);
    ViewFormatStrings[1].min:=Min;
    ViewFormatStrings[1].max:=Max;
  end;

  CriticalEvent.Clear;
  CriticalEvent.Text.Load(Buf);

  startValues:=TValuesList.Create;
  startValues.Load(Buf);
  DiapStartValues.CopyDataFrom(startValues);
  startValues.Clear;
  startValues.Free;
end;


procedure TParameter.Load_3_9_5(Buf:TBufEC);
var
  i:integer;
begin
  min:=Buf.GetInteger;
  max:=Buf.GetInteger;
  value:=Buf.GetInteger;
  ParType:=Buf.GetInteger;
  Hidden:=Buf.GetBoolean;
  ShowIfZero:=Buf.GetBoolean;
  LoLimit:=Buf.GetBoolean;
  Enabled:=Buf.GetBoolean;
  ValueOfViewStrings:=Buf.GetInteger;
  Money:=Buf.GetBoolean;

  Name.Load(Buf);

  ReserveFormatStrings(ValueOfViewStrings);

  for i:=1 to ValueOfViewStrings do ViewFormatStrings[i].Load(Buf);

  if ValueOfViewStrings<=0 then
  begin
    ValueOfViewStrings:=1;
    ReserveFormatStrings(1);
    ViewFormatStrings[1].min:=Min;
    ViewFormatStrings[1].max:=Max;
  end;

  CriticalEvent.Clear;
  CriticalEvent.Text.Load(Buf);

  DiapStartValues.Clear;
  DiapStartValues.Add(value,value);
end;


procedure TParameter.Load_3_9_0(Buf:TBufEC);
var
  i:integer;
begin
  min:=Buf.GetInteger;
  max:=Buf.GetInteger;
  value:=Buf.GetInteger;
  ParType:=Buf.GetInteger;
  Hidden:=Buf.GetBoolean;
  ShowIfZero:=Buf.GetBoolean;
  LoLimit:=Buf.GetBoolean;
  Enabled:=Buf.GetBoolean;
  ValueOfViewStrings:=Buf.GetInteger;
  Money:=false;

  Name.Load(Buf);

  ReserveFormatStrings(ValueOfViewStrings);

  for i:=1 to ValueOfViewStrings do ViewFormatStrings[i].Load(Buf);

  if ValueOfViewStrings<=0 then
  begin
    ValueOfViewStrings:=1;
    ReserveFormatStrings(1);
    ViewFormatStrings[1].min:=Min;
    ViewFormatStrings[1].max:=Max;
  end;

  CriticalEvent.Clear;
  CriticalEvent.Text.Load(Buf);

  DiapStartValues.Clear;
  DiapStartValues.Add(value,value);
end;


procedure TParameter.Load_Old(Buf:TBufEC);
begin
  min:=Buf.GetInteger;
  max:=Buf.GetInteger;
  value:=Buf.GetInteger;
  ParType:=Buf.GetInteger;
  Hidden:=Buf.GetBoolean;
  ShowIfZero:=Buf.GetBoolean;
  LoLimit:=Buf.GetBoolean;
  Enabled:=Buf.GetBoolean;
  ValueOfViewStrings:=1;
  Money:=false;

  Name.Load(Buf);
  DefaultFormatString.Load(Buf);

  ReserveFormatStrings(ValueOfViewStrings);
  ViewFormatStrings[1].max:=max;
  ViewFormatStrings[1].min:=min;
  ViewFormatStrings[1].str.text:=trimEX(DefaultFormatString.text);

  CriticalEvent.Clear;
  CriticalEvent.Text.Load(Buf);

  DiapStartValues.Clear;
  DiapStartValues.Add(value,value);
end;


end.
