unit ParameterDeltaClass;

interface

uses Classes, EC_Struct, ValueListClass, TextFieldClass, EventClass, ParameterClass, EC_Buf;

const
  StayAsIs=0;
  HideParameter=2;
  ShowParameter=1;

type TParameterDelta=class(TObjectEx)
  public

  ParNum:integer;

  ValuesGate:TValuesList;
  ModZeroesGate:TValuesList;

  min:integer;
  max:integer;
  delta:integer;
  DeltaPercentFlag:boolean;
  DeltaApprFlag:boolean;
  DeltaExprFlag:boolean;
  Expression:TTextField;
  CustomCriticalEvent:TEvent;
  ParameterViewAction:integer;
  CriticalMessageVisible:boolean;

  constructor Create();
  destructor Destroy; override;
  procedure Clear;
  procedure ClearGate;
  procedure ClearDelta;

  procedure CopyDataFrom(const source:TParameterDelta);
  function  IsEqualWith(const source:TParameterDelta):boolean;

  function  GateHasNoEffect(const pars:TList):boolean;
  function  DeltaHasNoEffect(const pars:TList):boolean;

  procedure CalcDelta(var pars:TList);
  procedure ApplyDelta(var pars:TList);
  function  IsGateOpen(const pars:TList):boolean;

  procedure Load_Old(Buf:TBufEC);
  procedure Load_v3_9_3(Buf:TBufEC);
  procedure Load_v3_9_4(Buf:TBufEC);
  procedure Save_v3_9_6(Buf:TBufEC);
  procedure Load_v3_9_6(Buf:TBufEC);
  procedure SaveGate_v5_0_0(Buf:TBufEC);
  procedure LoadGate_v5_0_0(Buf:TBufEC);
  procedure SaveDelta_v5_0_0(Buf:TBufEC);
  procedure LoadDelta_v5_0_0(Buf:TBufEC);
end;

implementation

uses EC_Str, CalcParseClass;

constructor TParameterDelta.Create();
begin
  inherited Create;

  CustomCriticalEvent:=TEvent.Create;
  ValuesGate:=TValuesList.Create;
  ModZeroesGate:=TValuesList.Create;
  Expression:=TTextField.Create;
  Clear;
end;

destructor TParameterDelta.Destroy;
begin
  Clear;

  CustomCriticalEvent.Free;CustomCriticalEvent:=nil;
  ValuesGate.Free;ValuesGate:=nil;
  ModZeroesGate.Free;ModZeroesGate:=nil;
  Expression.Free;Expression:=nil;
  inherited Destroy;
end;

procedure TParameterDelta.Clear;
begin
  ParNum:=0;
  ClearGate;
  ClearDelta;
end;

procedure TParameterDelta.ClearGate;
begin
  Min:=0;
  Max:=1;
  ValuesGate.Clear;
  ModZeroesGate.Clear;
end;

procedure TParameterDelta.ClearDelta;
begin
  delta:=0;
  ParameterViewAction:=StayAsIs;
  CustomCriticalEvent.Clear;
  CriticalMessageVisible:=false;
  DeltaPercentFlag:=false;
  DeltaApprFlag:=false;
  DeltaExprFlag:=false;

  Expression.Text:='';
end;

function TParameterDelta.IsEqualWith(const source:TParameterDelta):boolean;
begin
  Result:=false;

  if ParNum<>source.ParNum then exit;

  if (not ValuesGate.IsEqualWith(source.ValuesGate)) or (not ModZeroesGate.IsEqualWith(source.ModZeroesGate)) then exit;

  if Min<>source.Min then exit;
  if Max<>source.Max then exit;
  if Delta<>source.Delta then exit;
  if ParameterViewAction<>source.ParameterViewAction then exit;
  if not CustomCriticalEvent.IsEqualWith(source.CustomCriticalEvent) then exit;
  if CriticalMessageVisible<>source.CriticalMessageVisible then exit;
  if DeltaPercentFlag<>source.DeltaPercentFlag then exit;
  if DeltaApprFlag<>source.DeltaApprFlag then exit;
  if DeltaExprFlag<>source.DeltaExprFlag then exit;
  if trimEX(Expression.Text)<>trimEX(source.Expression.Text) then exit;

  Result:=true;
end;

procedure TParameterDelta.CopyDataFrom(const source:TParameterDelta);
begin
  ParNum:=source.ParNum;

  Min:=source.Min;
  Max:=source.Max;
  Delta:=source.Delta;

  ParameterViewAction:=source.ParameterViewAction;

  CustomCriticalEvent.CopyDataFrom(source.CustomCriticalEvent);
  CriticalMessageVisible:=source.CriticalMessageVisible;

  DeltaPercentFlag:=source.DeltaPercentFlag;
  DeltaApprFlag:=source.DeltaApprFlag;
  DeltaExprFlag:=source.DeltaExprFlag;

  ValuesGate.CopyDataFrom(source.ValuesGate);
  ModZeroesGate.CopyDataFrom(source.ModZeroesGate);

  Expression.Text:=trimEX(source.Expression.Text);
end;

function TParameterDelta.GateHasNoEffect(const pars:TList):boolean;
var par:TParameter;
begin
  Result:=true;
  if (ParNum<=0) or (ParNum>pars.Count) then exit;
  par:=pars[ParNum-1];

  Result:=false;
  if Min>par.GetDefaultMinGate then exit;
  if Max<par.GetDefaultMaxGate then exit;

  if ValuesGate.Count>0 then exit;
  if ModZeroesGate.Count>0 then exit;

  Result:=true;

end;

function TParameterDelta.DeltaHasNoEffect(const pars:TList):boolean;
begin
  if (ParNum<=0) or (ParNum>pars.Count) then begin Result:=true; exit; end;

  Result:=false;

  if ParameterViewAction <> 0 then exit;

  if DeltaExprFlag then
  begin
    if (trimEX(Expression.text) <> '') then exit
  end else if DeltaApprFlag then exit
  else if delta <> 0 then exit;

  Result:=true;

end;

procedure TParameterDelta.CalcDelta(var pars:TList);
var tstr:WideString;
    parse:TCalcParse;
    par:TParameter;
begin
  if (ParNum<=0) or (ParNum>pars.Count) then exit;
  par:=pars[ParNum-1];

  if not par.Enabled then exit;

  if DeltaExprFlag then
  begin
    delta:=par.Value;
    tstr:=trimEX(Expression.Text);
    if (tstr<>'') then
    begin
      parse:=TCalcParse.Create;
      parse.internal_str:=parse.ConvertToInternal(tstr);
      parse.Parse(pars);
      if not parse.error then delta:=parse.answer;
      parse.Destroy;
    end;
  end;
end;


procedure TParameterDelta.ApplyDelta(var pars:TList);
var par:TParameter;
    newvalue:integer;
begin
  if (ParNum<=0) or (ParNum>pars.Count) then exit;
  par:=pars[ParNum-1];

  if not par.Enabled then exit;

  if DeltaExprFlag then
  begin
    newvalue:=delta;
  end else begin
    if DeltaApprFlag then
    begin
      newvalue:=delta;
    end else begin
      if DeltaPercentFlag then newvalue:=par.value + round(par.value*0.01*delta)
      else newvalue:=par.value + delta;
    end;
  end;

  par.Assign(newvalue);
  if par.ParType <> NoCriticalParType then
  begin
    if TrimEX(CustomCriticalEvent.Text.Text)<>'' then par.CriticalEventOverride:=CustomCriticalEvent
    else par.CriticalEventOverride:=nil;
  end;

  if ParameterViewAction = ShowParameter then par.Hidden:=false
  else if ParameterViewAction =  HideParameter then par.Hidden:=true;
end;

function TParameterDelta.IsGateOpen(const pars:TList):boolean;
var par:TParameter;
begin
  Result:=true;

  if (ParNum<=0) or (ParNum>pars.Count) then exit;
  par:=pars[ParNum-1];

  if not par.Enabled then exit;

  Result:=false;

  if (par.GetDefaultMaxGate>max) and (par.value>max) then exit;
  if (par.GetDefaultMinGate<min) and (par.value<min) then exit;
  if not ValuesGate.TestValue(par.value) then exit;
  if not ModZeroesGate.TestModZeroes(par.value) then exit;

  Result:=true;

end;

procedure TParameterDelta.Load_Old(Buf:TBufEC);
begin
  Clear;
  min:=Buf.GetInteger;
  max:=Buf.GetInteger;
  delta:=Buf.GetInteger;
  ParameterViewAction:=Buf.GetInteger;
  CriticalMessageVisible:=Buf.GetBoolean;
  DeltaPercentFlag:=Buf.GetBoolean;

  CustomCriticalEvent.Clear;
  CustomCriticalEvent.Text.Load(Buf);
end;


procedure TParameterDelta.Load_v3_9_3(Buf:TBufEC);
begin
  Clear;
  Buf.GetInteger;
  min:=Buf.GetInteger;
  max:=Buf.GetInteger;
  delta:=Buf.GetInteger;
  ParameterViewAction:=Buf.GetInteger;
  CriticalMessageVisible:=Buf.GetBoolean;
  DeltaPercentFlag:=Buf.GetBoolean;

  ValuesGate.Load(Buf);
  ModZeroesGate.Load(Buf);

  CustomCriticalEvent.Clear;
  CustomCriticalEvent.Text.Load(Buf);
end;


procedure TParameterDelta.Load_v3_9_4(Buf:TBufEC);
begin
  Clear;
  Buf.GetInteger;
  min:=Buf.GetInteger;
  max:=Buf.GetInteger;
  delta:=Buf.GetInteger;
  ParameterViewAction:=Buf.GetInteger;
  CriticalMessageVisible:=Buf.GetBoolean;
  DeltaPercentFlag:=Buf.GetBoolean;
  DeltaApprFlag:=Buf.GetBoolean;

  ValuesGate.Load(Buf);
  ModZeroesGate.Load(Buf);

  CustomCriticalEvent.Clear;
  CustomCriticalEvent.Text.Load(Buf);
end;


procedure TParameterDelta.Save_v3_9_6(Buf:TBufEC);
begin
  Buf.AddInteger(0);
  Buf.AddInteger(min);
  Buf.AddInteger(max);
  Buf.AddInteger(delta);
  Buf.AddInteger(ParameterViewAction);
  Buf.AddBoolean(CriticalMessageVisible);
  Buf.AddBoolean(DeltaPercentFlag);
  Buf.AddBoolean(DeltaApprFlag);
  Buf.AddBoolean(DeltaExprFlag);

  Expression.Save(Buf);
  ValuesGate.Save(Buf);
  ModZeroesGate.Save(Buf);

  CustomCriticalEvent.Text.Save(Buf);
end;


procedure TParameterDelta.Load_v3_9_6(Buf:TBufEC);
begin
  Clear;
  Buf.GetInteger;
  min:=Buf.GetInteger;
  max:=Buf.GetInteger;
  delta:=Buf.GetInteger;
  ParameterViewAction:=Buf.GetInteger;
  CriticalMessageVisible:=Buf.GetBoolean;
  DeltaPercentFlag:=Buf.GetBoolean;
  DeltaApprFlag:=Buf.GetBoolean;
  DeltaExprFlag:=Buf.GetBoolean;

  Expression.Load(Buf);
  ValuesGate.Load(Buf);
  ModZeroesGate.Load(Buf);

  CustomCriticalEvent.Clear;
  CustomCriticalEvent.Text.Load(Buf);
end;


procedure TParameterDelta.SaveGate_v5_0_0(Buf:TBufEC);
begin
  Buf.AddInteger(min);
  Buf.AddInteger(max);
  ValuesGate.Save(Buf);
  ModZeroesGate.Save(Buf);
end;


procedure TParameterDelta.LoadGate_v5_0_0(Buf:TBufEC);
begin
  ClearGate;
  min:=Buf.GetInteger;
  max:=Buf.GetInteger;
  ValuesGate.Load(Buf);
  ModZeroesGate.Load(Buf);
end;


procedure TParameterDelta.SaveDelta_v5_0_0(Buf:TBufEC);
var i:byte;
begin
  Buf.AddInteger(delta);

  Buf.AddByte(ParameterViewAction);

  if DeltaExprFlag then i:=3
  else if DeltaApprFlag then i:=0
  else if DeltaPercentFlag then i:=2
  else i:=1;
  Buf.AddByte(i);

  Expression.Save(Buf);

  CustomCriticalEvent.Text.Save(Buf);
  CustomCriticalEvent.Image.Save(Buf);
  CustomCriticalEvent.Sound.Save(Buf);
  CustomCriticalEvent.BGM.Save(Buf);
end;


procedure TParameterDelta.LoadDelta_v5_0_0(Buf:TBufEC);
var i:byte;
begin
  ClearDelta;

  delta:=Buf.GetInteger;

  ParameterViewAction:=Buf.GetByte;

  i:=Buf.GetByte;
  DeltaApprFlag := (i=0);
  DeltaPercentFlag := (i=2);
  DeltaExprFlag := (i=3);

  Expression.Load(Buf);

  CustomCriticalEvent.Text.Load(Buf);
  CustomCriticalEvent.Image.Load(Buf);
  CustomCriticalEvent.Sound.Load(Buf);
  CustomCriticalEvent.BGM.Load(Buf);
end;



end.
