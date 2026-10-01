unit PathClass;

interface

uses Classes, EC_Struct, TextFieldClass, ParameterDeltaClass, ParameterClass, EventClass, EC_Buf, SequenceClass;

const
  maxpathcoords=20;

type TPath=class(TObjectEx)
  private
    DParsList:TList;

    function CntDPars:integer;
    function GetDPar(ind:integer):TParameterDelta;

  public
    Probability:double;

    VoidPathFlag:boolean; // Флаг пустого пути
    IsPathVariant:boolean;

    AlwaysShowWhenPlaying:boolean; // Показывать путь при игре, даже если он не подходит по диапазонам

    IsOpen:boolean;

    dayscost:integer;

    ShowOrder:integer;//Порядок показа

    PathNumber:integer; // Номер перехода

    PassesAllowed:integer; // Сколько раз при игре можно пройти данный переход;
    PassesMade:integer;

    FromLocation:integer; // Номер локации из которой совершается переход
    ToLocation:integer; // Номер локации в которую совершается переход

    StartPathMessage:TTextField; // Сообщение вопроса перехода
    EndPathEvent:TEvent; // Cooбщение в конце перехода

    LogicExpression:TTextField; //Логическое условие возможности совершения перехода

    //Изображение пути в редакторе
    PathXCoords,PathYCoords: array [0..MaxPathCoords] of integer;
    OneWaySequence:TSequence;

    property DParsValue:integer read CntDPars;
    property DPars[ind:integer]:TParameterDelta read GetDPar;
    function FindDeltaForParNum(num:integer):TParameterDelta;

    constructor Create();
    destructor Destroy();override;

    procedure Clear;

    procedure CopyDataFrom(const source:TPath);

    function IsEqualWith(const source:TPath; const pars:TList):boolean;

    procedure AddDPar(dpar:TParameterDelta);

    procedure DeleteNoEffectDeltas(const pars:TList);

    procedure ApplyDelta(var pars:TList);
    function CheckIfOpen(const pars:TList):boolean;

    procedure Load_Old(Buf:TBufEC);
    procedure Load_v3_8_5(Buf:TBufEC);
    procedure Load_v3_9_1(Buf:TBufEC);
    procedure Load_v3_9_2(Buf:TBufEC);
    procedure Load_v3_9_3(Buf:TBufEC);
    procedure Load_v3_9_4(Buf:TBufEC);
    procedure Load_v3_9_6(Buf:TBufEC);
    procedure Load_v4_0_2(Buf:TBufEC);
    procedure Load_v4_2_0(Buf:TBufEC);

    procedure Save_v4_3_0(Buf:TBufEC; const pars:TList);
    procedure Load_v4_3_0(Buf:TBufEC);
    procedure Save_v5_0_0(Buf:TBufEC; const pars:TList);
    procedure Load_v5_0_0(Buf:TBufEC; const pars:TList);


end;


implementation

uses Dialogs, CalcParseClass, EC_Str;

constructor TPath.Create();
begin
  inherited Create;
  StartPathMessage:=TTextField.Create;
  EndPathEvent:=TEvent.Create;
  LogicExpression:=TTextField.Create;
  DParsList:=TList.Create;
  OneWaySequence:=nil;

  Clear;

  PathNumber:=0;
  ToLocation:=0;
  FromLocation:=0;
end;

destructor TPath.Destroy();
begin
  if OneWaySequence<>nil then OneWaySequence.Free;
  StartPathMessage.Free;StartPathMessage:=nil;
  EndPathEvent.Free;EndPathEvent:=nil;
  LogicExpression.Free;LogicExpression:=nil;
  DParsList.Free;DParsList:=nil;
  inherited Destroy;
end;

procedure TPath.Clear;
var
  i:integer;
begin
  dayscost:=0;
  ShowOrder:=5;
  Probability:=1;
  PassesAllowed:=0;
  PassesMade:=0;
  PathNumber:=0;
  FromLocation:=0;
  ToLocation:=0;
  StartPathMessage.Text:='';

  EndPathEvent.Text.Text:='';
  EndPathEvent.Image.Text:='';
  EndPathEvent.Sound.Text:='';
  EndPathEvent.BGM.Text:='';
  LogicExpression.Text:='';

  for i:=1 to DParsValue do DPars[i].Free;
  DParsList.Clear;

  VoidPathFlag:=true;
  IsPathVariant:=false;

  AlwaysShowWhenPlaying:=false;
end;

function TPath.CntDPars:integer;
begin
  Result:=DParsList.Count;
end;

function TPath.GetDPar(ind:integer):TParameterDelta;
begin
  Result:=DParsList.Items[ind-1];
end;

procedure TPath.AddDPar(dpar:TParameterDelta);
begin
  DParsList.Add(dpar);
end;

procedure TPath.ApplyDelta(var pars:TList);
var i:integer;
begin
  for i:=1 to DParsValue do DPars[i].CalcDelta(pars);
  for i:=1 to DParsValue do DPars[i].ApplyDelta(pars);
end;


procedure TPath.DeleteNoEffectDeltas(const pars:TList);
var i:integer;
begin
  for i:=DParsValue downto 1 do
  begin
    if (DPars[i].ParNum<1) or (DPars[i].ParNum>pars.Count) then
    begin
      DParsList.Delete(i-1);
      continue;
    end;
    if not DPars[i].DeltaHasNoEffect(pars) then continue;
    if not DPars[i].GateHasNoEffect(pars) then continue;
    DParsList.Delete(i-1);
  end;
end;

function TPath.CheckIfOpen(const pars:TList):boolean;
var parse:TCalcParse;
    i:integer;
begin
  IsOpen:=false;
  Result:=false;

  //if (PassesAllowed>0) and (PassesMade>=PassesAllowed) then exit;

  if trimEX(LogicExpression.Text)<>'' then
  begin
    parse:=TCalcParse.Create;
    parse.Clear;
    parse.AssignAndPreprocess(trimEX(LogicExpression.Text),0);
    if not (parse.error or parse.default_expression) then
    begin
      parse.Parse(pars);
      if (not parse.error) and (parse.answer=0) then
      begin
        parse.Destroy;
        exit;
      end;
      parse.Destroy;
    end;
  end;

  for i:=1 to DParsValue do
    if not DPars[i].IsGateOpen(pars) then exit;

  IsOpen:=true;
  Result:=true;
end;


function  TPath.FindDeltaForParNum(num:integer):TParameterDelta;
var i:integer;
begin
  for i:=1 to DParsValue do
  begin
    if DPars[i].ParNum<>num then continue;
    Result:=DPars[i];
    exit;
  end;
  Result:=nil;
end;


function TPath.IsEqualWith(const source:TPath; const pars:TList):boolean;
var i:integer;
    cnt:integer;
begin
  Result:=false;

  for i:=0 to maxpathcoords  do
  begin
    if PathXCoords[i]<>source.PathXCoords[i] then exit;
    if PathYCoords[i]<>source.PathYCoords[i] then exit;
  end;

  if DParsValue>source.DParsValue then cnt:=source.DParsValue else cnt:=DParsValue;

  for i:=1 to cnt do
  begin
    if source.DPars[i].DeltaHasNoEffect(pars) and source.DPars[i].GateHasNoEffect(pars) and
       DPars[i].DeltaHasNoEffect(pars) and DPars[i].GateHasNoEffect(pars) then continue;
    if not DPars[i].IsEqualWith(source.DPars[i]) then exit;
  end;

  for i:=cnt+1 to source.DParsValue do
  begin
    if not source.DPars[i].DeltaHasNoEffect(pars) then exit;
    if not source.DPars[i].GateHasNoEffect(pars) then exit;
  end;

  for i:=cnt+1 to DParsValue do
  begin
    if not DPars[i].DeltaHasNoEffect(pars) then exit;
    if not DPars[i].GateHasNoEffect(pars) then exit;
  end;


  if ShowOrder<>source.ShowOrder then exit;
  if Probability<>source.Probability then exit;
  if dayscost<>source.dayscost then exit;
  if PathNumber<>source.PathNumber then exit;
  if FromLocation<>source.FromLocation then exit;
  if ToLocation<>source.ToLocation then exit;
  if VoidPathFlag<>source.VoidPathFlag then exit;
  if trimEX(StartPathMessage.Text)<>trimEX(source.StartPathMessage.text) then exit;
  if not EndPathEvent.IsEqualWith(source.EndPathEvent) then exit;
  if trimEX(LogicExpression.Text)<>trimEX(source.LogicExpression.Text) then exit;
  if AlwaysShowWhenPlaying<>source.AlwaysShowWhenPlaying then exit;
  if PassesAllowed<>source.PassesAllowed then exit;

  Result:=true;

end;


procedure TPath.CopyDataFrom(const source:TPath);
var
  i:integer;
  delta:TParameterDelta;
begin
  Clear;

  for i:=0 to maxpathcoords  do begin
    PathXCoords[i]:=source.PathXCoords[i];
    PathYCoords[i]:=source.PathYCoords[i];
  end;

  dayscost:=source.dayscost;

  ShowOrder:=source.ShowOrder;
  Probability:=source.Probability;
  PathNumber:=source.PathNumber;
  FromLocation:=source.FromLocation;
  ToLocation:=source.ToLocation;

  PassesAllowed:=source.PassesAllowed;
  LogicExpression.Text:=source.LogicExpression.Text;
  StartPathMessage.Text:=source.StartPathMessage.text;
  EndPathEvent.CopyDataFrom(source.EndPathEvent);

  for i:=1 to source.DParsValue do
  begin
    delta:=TParameterDelta.Create;
    delta.CopyDataFrom(source.DPars[i]);
    AddDPar(delta);
  end;

  VoidPathFlag:=source.VoidPathFlag;

  AlwaysShowWhenPlaying:=source.AlwaysShowWhenPlaying;
end;


procedure TPath.Save_v5_0_0(Buf:TBufEC; const pars:TList);
var
  i,cnt:integer;
begin
  Buf.AddDouble(probability);
  Buf.AddInteger(dayscost);
  Buf.AddInteger(PathNumber);
  Buf.AddInteger(FromLocation);
  Buf.AddInteger(ToLocation);
  Buf.AddBoolean(AlwaysShowWhenPlaying);
  Buf.AddInteger(PassesAllowed);
  Buf.AddInteger(ShowOrder);

  cnt:=0;
  for i:=1 to DParsValue do
  begin
    if DPars[i].GateHasNoEffect(pars) then continue;
    inc(cnt);
  end;
  Buf.AddInteger(cnt);

  for i:=1 to DParsValue do
  begin
    if DPars[i].GateHasNoEffect(pars) then continue;
    Buf.AddInteger(DPars[i].ParNum);
    DPars[i].SaveGate_v5_0_0(Buf);
  end;

  cnt:=0;
  for i:=1 to DParsValue do
  begin
    if DPars[i].DeltaHasNoEffect(pars) then continue;
    inc(cnt);
  end;
  Buf.AddInteger(cnt);

  for i:=1 to DParsValue do
  begin
    if DPars[i].DeltaHasNoEffect(pars) then continue;
    Buf.AddInteger(DPars[i].ParNum);
    DPars[i].SaveDelta_v5_0_0(Buf);
  end;

  LogicExpression.Save(Buf);
  StartPathMessage.Save(Buf);

  EndPathEvent.Text.Save(Buf);
  EndPathEvent.Image.Save(Buf);
  EndPathEvent.Sound.Save(Buf);
  EndPathEvent.BGM.Save(Buf);
end;

procedure TPath.Load_v5_0_0(Buf:TBufEC; const pars:TList);
var
  i,no,cnt:integer;
  dpar:TParameterDelta;
  par:TParameter;
begin
  Clear;
  probability:=Buf.GetDouble;
  dayscost:=Buf.GetInteger;
  PathNumber:=Buf.GetInteger;
  FromLocation:=Buf.GetInteger;
  ToLocation:=Buf.GetInteger;
  AlwaysShowWhenPlaying:=Buf.GetBoolean;
  PassesAllowed:=Buf.GetInteger;
  ShowOrder:=Buf.GetInteger;

  cnt:=Buf.GetInteger;
  for i:=1 to cnt do
  begin
    no:=Buf.GetInteger;
    dpar:=FindDeltaForParNum(no);
    if dpar=nil then
    begin
      dpar:=TParameterDelta.Create;
      dpar.ParNum:=no;
      par:=pars[no-1];
      dpar.Min:=par.Min;
      dpar.Max:=par.Max;
      AddDPar(dpar);
    end;
    dpar.LoadGate_v5_0_0(Buf);
  end;

  cnt:=Buf.GetInteger;
  for i:=1 to cnt do
  begin
    no:=Buf.GetInteger;
    dpar:=FindDeltaForParNum(no);
    if dpar=nil then
    begin
      dpar:=TParameterDelta.Create;
      dpar.ParNum:=no;
      par:=pars[no-1];
      dpar.Min:=par.Min;
      dpar.Max:=par.Max;
      AddDPar(dpar);
    end;
    dpar.LoadDelta_v5_0_0(Buf);
  end;

  LogicExpression.Load(Buf);
  StartPathMessage.Load(Buf);
  
  EndPathEvent.Text.Load(Buf);
  EndPathEvent.Image.Load(Buf);
  EndPathEvent.Sound.Load(Buf);
  EndPathEvent.BGM.Load(Buf);

  VoidPathFlag := (trimEX(StartPathMessage.text)='');
end;


procedure TPath.Save_v4_3_0(Buf:TBufEC; const pars:TList);
var
  i:integer;
  dpar,dparDummy:TParameterDelta;
  par:TParameter;
begin
  Buf.AddDouble(probability);
  Buf.AddInteger(dayscost);
  Buf.AddInteger(PathNumber);
  Buf.AddInteger(FromLocation);
  Buf.AddInteger(ToLocation);
  Buf.AddBoolean(VoidPathFlag);
  Buf.AddBoolean(AlwaysShowWhenPlaying);

  if (OneWaySequence = nil) or (OneWaySequence.Pathes.Items[0]=self) then i:=PassesAllowed
  else i:=0;
  Buf.AddInteger(i);

  Buf.AddInteger(ShowOrder);

  dparDummy:=TParameterDelta.Create;
  for i:=1 to 96 do
  begin
    dpar:=FindDeltaForParNum(i);
    if dpar = nil then
    begin
      dpar:=dparDummy;
      if i<=pars.Count then
      begin
        par:=pars[i-1];
        dpar.max:=par.max;
        dpar.min:=par.min;
      end else begin
        dpar.max:=1;
        dpar.min:=0;
      end;
    end;
    dpar.Save_v3_9_6(Buf);
  end;
  dparDummy.Free;
  
  LogicExpression.Save(Buf);
  StartPathMessage.Save(Buf);
  EndPathEvent.Text.Save(Buf);
end;


procedure TPath.Load_v4_3_0(Buf:TBufEC);
var
  i:integer;
begin
  Clear;
  probability:=Buf.GetDouble;
  dayscost:=Buf.GetInteger;
  PathNumber:=Buf.GetInteger;
  FromLocation:=Buf.GetInteger;
  ToLocation:=Buf.GetInteger;
  VoidPathFlag:=Buf.GetBoolean;
  AlwaysShowWhenPlaying:=Buf.GetBoolean;
  PassesAllowed:=Buf.GetInteger;
  ShowOrder:=Buf.GetInteger;

  for i:=1 to 96 do
  begin
    AddDPar(TParameterDelta.Create);
    DPars[DParsValue].Load_v3_9_6(Buf);
    DPars[DParsValue].ParNum:=i;
  end;

  LogicExpression.Load(Buf);
  StartPathMessage.Load(Buf);
  EndPathEvent.Clear;
  EndPathEvent.Text.Load(Buf);
  VoidPathFlag := (trimEX(StartPathMessage.text)='');
end;


procedure TPath.Load_v4_2_0(Buf:TBufEC);
var
  i:integer;
begin
  Clear;
  probability:=Buf.GetDouble;
  dayscost:=Buf.GetInteger;
  PathNumber:=Buf.GetInteger;
  FromLocation:=Buf.GetInteger;
  ToLocation:=Buf.GetInteger;
  VoidPathFlag:=Buf.GetBoolean;
  AlwaysShowWhenPlaying:=Buf.GetBoolean;
  PassesAllowed:=Buf.GetInteger;
  ShowOrder:=Buf.GetInteger;

  for i:=1 to 48 do
  begin
    AddDPar(TParameterDelta.Create);
    DPars[DParsValue].Load_v3_9_6(Buf);
    DPars[DParsValue].ParNum:=i;
  end;

  LogicExpression.Load(Buf);
  StartPathMessage.Load(Buf);
  EndPathEvent.Clear;
  EndPathEvent.Text.Load(Buf);
  VoidPathFlag := (trimEX(StartPathMessage.text)='');
end;


procedure TPath.Load_v4_0_2(Buf:TBufEC);
var
  i:integer;
begin
  Clear;
  probability:=Buf.GetDouble;
  dayscost:=Buf.GetInteger;
  PathNumber:=Buf.GetInteger;
  FromLocation:=Buf.GetInteger;
  ToLocation:=Buf.GetInteger;
  VoidPathFlag:=Buf.GetBoolean;
  AlwaysShowWhenPlaying:=Buf.GetBoolean;
  PassesAllowed:=Buf.GetInteger;
  ShowOrder:=Buf.GetInteger;

  for i:=1 to 24 do
  begin
    AddDPar(TParameterDelta.Create);
    DPars[DParsValue].Load_v3_9_6(Buf);
    DPars[DParsValue].ParNum:=i;
  end;

  LogicExpression.Load(Buf);
  StartPathMessage.Load(Buf);
  EndPathEvent.Clear;
  EndPathEvent.Text.Load(Buf);
  VoidPathFlag := (trimEX(StartPathMessage.text)='');
end;


procedure TPath.Load_v3_9_6(Buf:TBufEC);
var
  i:integer;
begin
  Clear;
  probability:=Buf.GetDouble;
  dayscost:=Buf.GetInteger;
  PathNumber:=Buf.GetInteger;
  FromLocation:=Buf.GetInteger;
  ToLocation:=Buf.GetInteger;
  VoidPathFlag:=Buf.GetBoolean;
  AlwaysShowWhenPlaying:=Buf.GetBoolean;
  PassesAllowed:=Buf.GetInteger;

  for i:=1 to 24 do
  begin
    AddDPar(TParameterDelta.Create);
    DPars[DParsValue].Load_v3_9_6(Buf);
    DPars[DParsValue].ParNum:=i;
  end;

  LogicExpression.Load(Buf);
  StartPathMessage.Load(Buf);
  EndPathEvent.Clear;
  EndPathEvent.Text.Load(Buf);
  VoidPathFlag := (trimEX(StartPathMessage.text)='');
end;


procedure TPath.Load_v3_9_4(Buf:TBufEC);
var
  i:integer;
begin
  Clear;
  probability:=Buf.GetDouble;
  dayscost:=Buf.GetInteger;
  PathNumber:=Buf.GetInteger;
  FromLocation:=Buf.GetInteger;
  ToLocation:=Buf.GetInteger;
  VoidPathFlag:=Buf.GetBoolean;
  AlwaysShowWhenPlaying:=Buf.GetBoolean;
  PassesAllowed:=Buf.GetInteger;

  for i:=1 to 12 do
  begin
    AddDPar(TParameterDelta.Create);
    DPars[DParsValue].Load_v3_9_4(Buf);
    DPars[DParsValue].ParNum:=i;
  end;

  StartPathMessage.Load(Buf);
  EndPathEvent.Clear;
  EndPathEvent.Text.Load(Buf);
  VoidPathFlag := (trimEX(StartPathMessage.text)='');
end;


procedure TPath.Load_v3_9_3(Buf:TBufEC);
var
  i:integer;
begin
  Clear;
  probability:=Buf.GetDouble;
  dayscost:=Buf.GetInteger;
  PathNumber:=Buf.GetInteger;
  FromLocation:=Buf.GetInteger;
  ToLocation:=Buf.GetInteger;
  VoidPathFlag:=Buf.GetBoolean;
  AlwaysShowWhenPlaying:=Buf.GetBoolean;
  PassesAllowed:=Buf.GetInteger;

  for i:=1 to 12 do
  begin
    AddDPar(TParameterDelta.Create);
    DPars[DParsValue].Load_v3_9_3(Buf);
    DPars[DParsValue].ParNum:=i;
  end;

  StartPathMessage.Load(Buf);
  EndPathEvent.Clear;
  EndPathEvent.Text.Load(Buf);
  VoidPathFlag := (trimEX(StartPathMessage.text)='');
end;


procedure TPath.Load_v3_9_2(Buf:TBufEC);
var
  i:integer;
begin
  Clear;
  PathNumber:=Buf.GetInteger;
  FromLocation:=Buf.GetInteger;
  ToLocation:=Buf.GetInteger;
  VoidPathFlag:=Buf.GetBoolean;
  AlwaysShowWhenPlaying:=Buf.GetBoolean;
  PassesAllowed:=Buf.GetInteger;

  for i:=1 to 12 do
  begin
    AddDPar(TParameterDelta.Create);
    DPars[DParsValue].Load_Old(Buf);
    DPars[DParsValue].ParNum:=i;
  end;

  StartPathMessage.Load(Buf);
  EndPathEvent.Clear;
  EndPathEvent.Text.Load(Buf);
  VoidPathFlag := (trimEX(StartPathMessage.text)='');
end;


procedure TPath.Load_v3_9_1(Buf:TBufEC);
var
  i:integer;
begin
  Clear;
  PathNumber:=Buf.GetInteger;
  FromLocation:=Buf.GetInteger;
  ToLocation:=Buf.GetInteger;
  VoidPathFlag:=Buf.GetBoolean;
  AlwaysShowWhenPlaying:=Buf.GetBoolean;
  PassesAllowed:=Buf.GetInteger;

  for i:=1 to 9 do
  begin
    AddDPar(TParameterDelta.Create);
    DPars[DParsValue].Load_Old(Buf);
    DPars[DParsValue].ParNum:=i;
  end;

  StartPathMessage.Load(Buf);
  EndPathEvent.Clear;
  EndPathEvent.Text.Load(Buf);
  VoidPathFlag := (trimEX(StartPathMessage.text)='');
end;


procedure TPath.Load_v3_8_5(Buf:TBufEC);
var
  i:integer;
begin
  Clear;
  PathNumber:=Buf.GetInteger;
  FromLocation:=Buf.GetInteger;
  ToLocation:=Buf.GetInteger;
  VoidPathFlag:=Buf.GetBoolean;
  AlwaysShowWhenPlaying:=Buf.GetBoolean;

  for i:=1 to 9 do
  begin
    AddDPar(TParameterDelta.Create);
    DPars[DParsValue].Load_Old(Buf);
    DPars[DParsValue].ParNum:=i;
  end;

  StartPathMessage.Load(Buf);
  EndPathEvent.Clear;
  EndPathEvent.Text.Load(Buf);
  VoidPathFlag := (trimEX(StartPathMessage.text)='');
end;


procedure TPath.Load_Old(Buf:TBufEC);
var
  i:integer;
begin
  Clear;
  PathNumber:=Buf.GetInteger;
  FromLocation:=Buf.GetInteger;
  ToLocation:=Buf.GetInteger;
  VoidPathFlag:=Buf.GetBoolean;

  for i:=1 to 9 do
  begin
    AddDPar(TParameterDelta.Create);
    DPars[DParsValue].Load_Old(Buf);
    DPars[DParsValue].ParNum:=i;
  end;

  StartPathMessage.Load(Buf);
  EndPathEvent.Clear;
  EndPathEvent.Text.Load(Buf);
  VoidPathFlag := (trimEX(StartPathMessage.text)='');
end;

end.
