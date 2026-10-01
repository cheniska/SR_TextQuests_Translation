unit LocationClass;

interface

Uses Classes, EC_Struct, TextFieldClass, ParameterClass, ParameterDeltaClass, EventClass, EC_Buf, SequenceClass;

type TLocation=class(TObjectEx)
  private
    DParsList:TList;

    function CntDPars:integer;
    function GetDPar(ind:integer):TParameterDelta;

  public
    screenx,screeny:integer; // Координаты локации на экране

    DaysCost:integer; // сколько дне прошло

    LocationNumber:integer;      //Номер локации
    //LocationDescriptionNum:integer;
    //LocationDescription:TTextField; //Длинное описание локации

    CntDescriptions:integer;
    LocationDescriptions: array of TEvent;
    RandomShowLocationDescriptions:boolean;
    LocDescrOrder:integer;
    LocDescrExprOrder:TTextField;

    PlayerDeath:boolean;
    VoidLocation:boolean;
    StartLocationFlag:boolean; //Флаг, говорящий о том, что локация является стартовой
    EndLocationFlag:boolean; //Флаг, говорящий о том, что локация является конечной
    FailLocationFlag:boolean; //Флаг, говорящий о том, что локация является провальной

    VisitsAllowed:integer;
    VisitsMade:integer;
    OneWaySequence:TSequence;

    property DParsValue:integer read CntDPars;
    property DPars[ind:integer]:TParameterDelta read GetDPar;
    function FindDeltaForParNum(num:integer):TParameterDelta;

    procedure AddDPar(dpar:TParameterDelta);

    procedure ApplyDelta(var pars:TList);

    procedure DeleteNoEffectDeltas(const pars:TList);


    constructor Create();
    destructor Destroy(); override;
    procedure Clear;
    procedure AddDescription;
    procedure DeleteLastDescription;

    procedure Load_Old(Buf:TBufEC);
    procedure Load_v3_9_2(Buf:TBufEC);
    procedure Load_v3_9_3(Buf:TBufEC);
    procedure Load_v3_9_4(Buf:TBufEC);
    procedure Load_v3_9_6(Buf:TBufEC);
    procedure Load_v4_0_1(Buf:TBufEC);
    procedure Load_v4_2_0(Buf:TBufEC);

    procedure Save_v4_3_0(Buf:TBufEC);
    procedure Load_v4_3_0(Buf:TBufEC);
    procedure Save_v5_0_1(Buf:TBufEC; const pars:TList);
    procedure Load_v5_0_0(Buf:TBufEC);
    procedure Load_v5_0_1(Buf:TBufEC);

    procedure CopyDataFrom(const source:TLocation);
    function  IsEqualWith(const source:TLocation; const pars:TList):boolean;

    function FindLocationDescription(var pars:TList):TEvent;

end;

implementation

Uses MessageText,CalcParseClass,Math, EC_Str;

constructor TLocation.Create();
begin
  inherited Create;
  CntDescriptions:=1;
  SetLength(LocationDescriptions,1+1);
  LocationDescriptions[1]:=TEvent.Create;
  OneWaySequence:=nil;

  //LocationDescription:=TTextField.Create;
  LocDescrExprOrder:=TTextField.Create;

  DParsList:=TList.Create;
  
  Clear;
end;

destructor TLocation.Destroy();
var
  i:integer;
begin
  Clear;

  for i:=1 to CntDescriptions do begin LocationDescriptions[1].Free; LocationDescriptions[1]:=nil; end;
  LocationDescriptions:=nil;

  //LocationDescription.Free;LocationDescription:=nil;
  LocDescrExprOrder.Free;LocDescrExprOrder:=nil;

  DParsList.Free;DParsList:=nil;

  inherited Destroy;
end;

procedure TLocation.Clear;
var
  i:integer;
begin
  screenx:=100;
  screeny:=100;
  DaysCost:=0;
  VisitsAllowed:=0;
  VisitsMade:=0;

  if OneWaySequence<>nil then OneWaySequence.Free;
  OneWaySequence:=nil;

  for i:=1 to DParsValue do DPars[i].Free;
  DParsList.Clear;

  for i:=2 to CntDescriptions do LocationDescriptions[i].Free;
  SetLength(LocationDescriptions,1+1);
  CntDescriptions:=1;

  LocationDescriptions[1].Clear;
  RandomShowLocationDescriptions:=false;
  LocDescrOrder:=1;
  LocDescrExprOrder.Clear;

  LocationNumber:=0;
  //LocationDescription.Clear;
  //LocationDescriptionNum:=1;
  //LocationDescription.Text:='';//QuestMessages.Par_Get('LocationDescription');

  StartLocationFlag:=false;
  EndLocationFlag:=false;
  FailLocationFlag:=False;
  PlayerDeath:=false;
  VoidLocation:=false;
end;

function TLocation.CntDPars:integer;
begin
  Result:=DParsList.Count;
end;

function TLocation.GetDPar(ind:integer):TParameterDelta;
begin
  Result:=DParsList.Items[ind-1];
end;

procedure TLocation.AddDPar(dpar:TParameterDelta);
begin
  DParsList.Add(dpar);
end;

procedure TLocation.ApplyDelta(var pars:TList);
var i:integer;
begin
  for i:=1 to DParsValue do DPars[i].CalcDelta(pars);
  for i:=1 to DParsValue do DPars[i].ApplyDelta(pars);
end;


procedure TLocation.DeleteNoEffectDeltas(const pars:TList);
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
    DParsList.Delete(i-1);
  end;
end;


function  TLocation.FindDeltaForParNum(num:integer):TParameterDelta;
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

procedure TLocation.AddDescription;
var tstr:WideString;
    flag:boolean;
    i:integer;
begin
  inc(CntDescriptions);
  SetLength(LocationDescriptions,CntDescriptions+1);
  LocationDescriptions[CntDescriptions]:=TEvent.Create;
  if CntDescriptions=1 then exit;

  tstr:=trimEX(LocationDescriptions[1].Image.Text);
  flag:=false;
  for i:=2 to CntDescriptions-1 do
    if trimEX(LocationDescriptions[i].Image.Text)<>tstr then
    begin
      flag:=true;
      break;
    end;
  if not flag then LocationDescriptions[CntDescriptions].Image.Text:=tstr;

  tstr:=trimEX(LocationDescriptions[1].Sound.Text);
  flag:=false;
  for i:=2 to CntDescriptions-1 do
    if trimEX(LocationDescriptions[i].Sound.Text)<>tstr then
    begin
      flag:=true;
      break;
    end;
  if not flag then LocationDescriptions[CntDescriptions].Sound.Text:=tstr;

  tstr:=trimEX(LocationDescriptions[1].BGM.Text);
  flag:=false;
  for i:=2 to CntDescriptions-1 do
    if trimEX(LocationDescriptions[i].BGM.Text)<>tstr then
    begin
      flag:=true;
      break;
    end;
  if not flag then LocationDescriptions[CntDescriptions].BGM.Text:=tstr;
end;

procedure TLocation.DeleteLastDescription;
begin
  if CntDescriptions<2 then exit;
  LocationDescriptions[CntDescriptions].Free;
  dec(CntDescriptions);
  SetLength(LocationDescriptions,CntDescriptions+1);
end;


function TLocation.IsEqualWith(const source:TLocation; const pars:TList):boolean;
var i:integer;
    cnt:integer;
begin
  Result:=false;

  if DParsValue>source.DParsValue then cnt:=source.DParsValue else cnt:=DParsValue;

  //if DParsValue<>source.DParsValue then exit;


  for i:=1 to cnt do
  begin
    if source.DPars[i].DeltaHasNoEffect(pars) and DPars[i].DeltaHasNoEffect(pars) then continue;
    if not DPars[i].IsEqualWith(source.DPars[i]) then exit;
  end;

  for i:=cnt+1 to source.DParsValue do
    if not source.DPars[i].DeltaHasNoEffect(pars) then exit;

  for i:=cnt+1 to DParsValue do
    if not DPars[i].DeltaHasNoEffect(pars) then exit;

  if CntDescriptions<>source.CntDescriptions then exit;


  for i:=1 to CntDescriptions do if not LocationDescriptions[i].IsEqualWith(source.LocationDescriptions[i]) then exit;
  if RandomShowLocationDescriptions <> source.RandomShowLocationDescriptions then exit;

  if LocDescrOrder<>source.LocDescrOrder then exit;
  if trimEX(LocDescrExprOrder.Text)<>trimEX(source.LocDescrExprOrder.Text) then exit;

  if dayscost<>source.dayscost then exit;
  if screenx<>source.screenx then exit;
  if screeny<>source.screeny then exit;
  if VisitsAllowed<>source.VisitsAllowed then exit;
  if PlayerDeath<>source.PlayerDeath then exit;
  if LocationNumber<>source.LocationNumber then exit;
  if StartLocationFlag<>source.StartLocationFlag then exit;
  if EndLocationFlag<>source.EndLocationFlag then exit;
  if FailLocationFlag<>source.FailLocationFlag then exit;
  if VoidLocation<>source.VoidLocation then exit;

  Result:=true;
end;

procedure TLocation.CopyDataFrom(const source:TLocation);
var
  i:integer;
  delta:TParameterDelta;
begin
  Clear;

  screenx:=source.screenx;
  screeny:=source.screeny;


  for i:=1 to source.DParsValue do
  begin
    delta:=TParameterDelta.Create;
    delta.CopyDataFrom(source.DPars[i]);
    AddDPar(delta);
  end;


  SetLength(LocationDescriptions,source.CntDescriptions+1);
  for i:=CntDescriptions+1 to source.CntDescriptions do LocationDescriptions[i]:=TEvent.Create;
  CntDescriptions:=source.CntDescriptions;
  for i:=1 to CntDescriptions do LocationDescriptions[i].CopyDataFrom(source.LocationDescriptions[i]);

  RandomShowLocationDescriptions:=source.RandomShowLocationDescriptions;
  LocDescrOrder:=source.LocDescrOrder;
  LocDescrExprOrder.CopyDataFrom(source.LocDescrExprOrder);

  dayscost:=source.DaysCost;
  VisitsAllowed:=source.VisitsAllowed;

  LocationNumber:=source.LocationNumber;
  //LocationDescription.CopyDataFrom(TTextField(source.LocationDescription));
  //LocationDescription.Text:='';

  StartLocationFlag:=source.StartLocationFlag;
  EndLocationFlag:=source.EndLocationFlag;
  FailLocationFlag:=source.FailLocationFlag;
  VoidLocation:=source.VoidLocation;
  PlayerDeath:=source.PlayerDeath;
end;


procedure TLocation.Save_v5_0_1(Buf:TBufEC; const pars:TList);
var
  i,j,cnt:integer;
  bt:byte;
begin
  Buf.AddInteger(dayscost);
  Buf.AddInteger(screenx);
  Buf.AddInteger(screeny);
  Buf.AddInteger(LocationNumber);
  Buf.AddInteger(VisitsAllowed);

  if StartLocationFlag then bt:=1
  else if VoidLocation then bt:=2
  else if EndLocationFlag then bt:=3
  else if PlayerDeath then bt:=5
  else if FailLocationFlag then bt:=4
  else bt:=0;
  Buf.AddBYTE(bt);

  cnt:=0;
  for i:=1 to DParsValue do
  begin
    j:=DPars[i].ParNum;
    if j>pars.Count then continue;
    if DPars[i].DeltaHasNoEffect(pars) then continue;
    inc(cnt);
  end;
  Buf.AddInteger(cnt);

  for i:=1 to DParsValue do
  begin
    j:=DPars[i].ParNum;
    if j>pars.Count then continue;
    if DPars[i].DeltaHasNoEffect(pars) then continue;
    Buf.AddInteger(j);
    DPars[i].SaveDelta_v5_0_0(Buf);
  end;

  for cnt:=CntDescriptions downto 1 do
  begin
    if (trimEX(LocationDescriptions[cnt].Text.Text)<>'') or
       (trimEX(LocationDescriptions[cnt].Image.Text)<>'') or
       (trimEX(LocationDescriptions[cnt].Sound.Text)<>'') or
       (trimEX(LocationDescriptions[cnt].BGM.Text)<>'') then break;
  end;

  Buf.AddInteger(cnt);
  for i:=1 to cnt do
  begin
    LocationDescriptions[i].Text.Save(Buf);
    LocationDescriptions[i].Image.Save(Buf);
    LocationDescriptions[i].Sound.Save(Buf);
    LocationDescriptions[i].BGM.Save(Buf);
  end;

  Buf.AddBoolean(RandomShowLocationDescriptions);
  LocDescrExprOrder.Save(Buf);
end;

procedure TLocation.Load_v5_0_1(Buf:TBufEC);
var
  i,no,cnt:integer;
  dpar:TParameterDelta;
  bt:byte;
begin
  Clear;
  dayscost:=Buf.GetInteger;
  screenx:=Buf.GetInteger;
  screeny:=Buf.GetInteger;
  LocationNumber:=Buf.GetInteger;
  VisitsAllowed:=Buf.GetInteger;

  bt:=Buf.GetBYTE;
  StartLocationFlag := (bt=1);
  VoidLocation := (bt=2);
  EndLocationFlag := (bt=3);
  FailLocationFlag := (bt=4) or (bt=5);
  PlayerDeath := (bt=5);

  cnt:=Buf.GetInteger;
  for i:=1 to cnt do
  begin
    no:=Buf.GetInteger;
    dpar:=FindDeltaForParNum(no);
    if dpar=nil then
    begin
      dpar:=TParameterDelta.Create;
      dpar.ParNum:=no;
      AddDPar(dpar);
    end;
    dpar.LoadDelta_v5_0_0(Buf);
  end;

  cnt:=Buf.GetInteger;

  while cnt>CntDescriptions do AddDescription;
  while (cnt<CntDescriptions) and (CntDescriptions>1) do DeleteLastDescription;

  for i:=1 to cnt do
  begin
    LocationDescriptions[i].Text.Load(Buf);
    LocationDescriptions[i].Image.Load(Buf);
    LocationDescriptions[i].Sound.Load(Buf);
    LocationDescriptions[i].BGM.Load(Buf);
  end;

  RandomShowLocationDescriptions:=Buf.GetBoolean;

  LocDescrExprOrder.Load(Buf);
  //LocationDescription.Text:='';
end;


procedure TLocation.Load_v5_0_0(Buf:TBufEC);
var
  i,no,cnt:integer;
  dpar:TParameterDelta;
  bt:byte;
begin
  Clear;
  dayscost:=Buf.GetInteger;
  screenx:=Buf.GetInteger;
  screeny:=Buf.GetInteger;
  LocationNumber:=Buf.GetInteger;
  VisitsAllowed:=0;

  bt:=Buf.GetBYTE;
  StartLocationFlag := (bt=1);
  VoidLocation := (bt=2);
  EndLocationFlag := (bt=3);
  FailLocationFlag := (bt=4) or (bt=5);
  PlayerDeath := (bt=5);

  cnt:=Buf.GetInteger;
  for i:=1 to cnt do
  begin
    no:=Buf.GetInteger;
    dpar:=FindDeltaForParNum(no);
    if dpar=nil then
    begin
      dpar:=TParameterDelta.Create;
      dpar.ParNum:=no;
      AddDPar(dpar);
    end;
    dpar.LoadDelta_v5_0_0(Buf);
  end;

  cnt:=Buf.GetInteger;

  while cnt>CntDescriptions do AddDescription;
  while (cnt<CntDescriptions) and (CntDescriptions>1) do DeleteLastDescription;

  for i:=1 to cnt do
  begin
    LocationDescriptions[i].Text.Load(Buf);
    LocationDescriptions[i].Image.Load(Buf);
    LocationDescriptions[i].Sound.Load(Buf);
    LocationDescriptions[i].BGM.Load(Buf);
  end;

  RandomShowLocationDescriptions:=Buf.GetBoolean;

  LocDescrExprOrder.Load(Buf);
  //LocationDescription.Text:='';
end;


procedure TLocation.Save_v4_3_0(Buf:TBufEC);
var
  i:integer;
  dummy:TTextField;
  dpar,dparDummy:TParameterDelta;
begin
  Buf.AddInteger(dayscost);
  Buf.AddInteger(screenx);
  Buf.AddInteger(screeny);
  Buf.AddInteger(LocationNumber);

  Buf.AddBoolean(StartLocationFlag);
  Buf.AddBoolean(EndLocationFlag);
  Buf.AddBoolean(FailLocationFlag);
  Buf.AddBoolean(PlayerDeath);
  Buf.AddBoolean(VoidLocation);

  dparDummy:=TParameterDelta.Create;
  for i:=1 to 96 do
  begin
    dpar:=FindDeltaForParNum(i);
    if dpar = nil then dpar:=dparDummy;
    dpar.Save_v3_9_6(Buf);
  end;
  dparDummy.Free;
  
  dummy:=TTextField.Create;
  dummy.Text:='';
  for i:=1 to CntDescriptions do LocationDescriptions[i].Text.Save(Buf);
  for i:=CntDescriptions+1 to 10 do dummy.Save(Buf);


  Buf.AddBoolean(RandomShowLocationDescriptions);
  Buf.AddInteger(LocDescrOrder);

  Buf.AddInteger(0);//LocationName
  dummy.Save(Buf);//LocationDescription
  dummy.Free;
  LocDescrExprOrder.Save(Buf);
end;


procedure TLocation.Load_v4_3_0(Buf:TBufEC);
var
  i:integer;
  dummy:TTextField;
begin
  Clear;
  dayscost:=Buf.GetInteger;
  screenx:=Buf.GetInteger;
  screeny:=Buf.GetInteger;
  LocationNumber:=Buf.GetInteger;
  VisitsAllowed:=0;

  StartLocationFlag := Buf.GetBoolean;
  EndLocationFlag := Buf.GetBoolean;
  FailLocationFlag := Buf.GetBoolean;
  PlayerDeath := Buf.GetBoolean;
  VoidLocation := Buf.GetBoolean;

  for i:=1 to 96 do
  begin
    AddDPar(TParameterDelta.Create);
    DPars[DParsValue].Load_v3_9_6(Buf);
    DPars[DParsValue].ParNum:=i;
  end;

  while 10>CntDescriptions do AddDescription;
  while 10<CntDescriptions do DeleteLastDescription;
  for i:=1 to 10 do begin LocationDescriptions[i].Clear; LocationDescriptions[i].Text.Load(Buf); end;

  RandomShowLocationDescriptions:=Buf.GetBoolean;
  LocDescrOrder:=Buf.GetInteger;

  dummy:=TTextField.Create;
  dummy.Load(Buf);//LocationName
  dummy.Clear;
  dummy.Load(Buf);//LocationDescription
  dummy.Free;
  LocDescrExprOrder.Load(Buf);
  //LocationDescription.Text:='';

end;


procedure TLocation.Load_v4_2_0(Buf:TBufEC);
var
  i:integer;
  dummy:TTextField;
begin
  Clear;
  dayscost:=Buf.GetInteger;
  screenx:=Buf.GetInteger;
  screeny:=Buf.GetInteger;
  LocationNumber:=Buf.GetInteger;
  VisitsAllowed:=0;

  StartLocationFlag := Buf.GetBoolean;
  EndLocationFlag := Buf.GetBoolean;
  FailLocationFlag := Buf.GetBoolean;
  PlayerDeath := Buf.GetBoolean;
  VoidLocation := Buf.GetBoolean;

  for i:=1 to 48 do
  begin
    AddDPar(TParameterDelta.Create);
    DPars[DParsValue].Load_v3_9_6(Buf);
    DPars[DParsValue].ParNum:=i;
  end;

  while 10>CntDescriptions do AddDescription;
  while 10<CntDescriptions do DeleteLastDescription;
  for i:=1 to 10 do begin LocationDescriptions[i].Clear; LocationDescriptions[i].Text.Load(Buf); end;

  RandomShowLocationDescriptions:=Buf.GetBoolean;
  LocDescrOrder:=Buf.GetInteger;

  dummy:=TTextField.Create;
  dummy.Load(Buf);//LocationName
  dummy.Clear;
  dummy.Load(Buf);//LocationDescription
  dummy.Free;
  LocDescrExprOrder.Load(Buf);
  //LocationDescription.Text:='';

end;


procedure TLocation.Load_v4_0_1(Buf:TBufEC);
var
  i:integer;
  dummy:TTextField;
begin
  Clear;
  dayscost:=Buf.GetInteger;
  screenx:=Buf.GetInteger;
  screeny:=Buf.GetInteger;
  LocationNumber:=Buf.GetInteger;
  VisitsAllowed:=0;

  StartLocationFlag := Buf.GetBoolean;
  EndLocationFlag := Buf.GetBoolean;
  FailLocationFlag := Buf.GetBoolean;
  PlayerDeath := Buf.GetBoolean;
  VoidLocation := Buf.GetBoolean;

  for i:=1 to 24 do
  begin
    AddDPar(TParameterDelta.Create);
    DPars[DParsValue].Load_v3_9_6(Buf);
    DPars[DParsValue].ParNum:=i;
  end;

  while 10>CntDescriptions do AddDescription;
  while 10<CntDescriptions do DeleteLastDescription;
  for i:=1 to 10 do begin LocationDescriptions[i].Clear; LocationDescriptions[i].Text.Load(Buf); end;

  RandomShowLocationDescriptions:=Buf.GetBoolean;
  LocDescrOrder:=Buf.GetInteger;

  dummy:=TTextField.Create;
  dummy.Load(Buf);//LocationName
  dummy.Clear;
  dummy.Load(Buf);//LocationDescription
  dummy.Free;
  LocDescrExprOrder.Load(Buf);
  //LocationDescription.Text:='';

end;


procedure TLocation.Load_v3_9_6(Buf:TBufEC);
var
  i:integer;
  dummy:TTextField;
begin
  Clear;
  dayscost:=Buf.GetInteger;
  screenx:=Buf.GetInteger;
  screeny:=Buf.GetInteger;
  LocationNumber:=Buf.GetInteger;
  VisitsAllowed:=0;

  StartLocationFlag := Buf.GetBoolean;
  EndLocationFlag := Buf.GetBoolean;
  FailLocationFlag := Buf.GetBoolean;
  PlayerDeath := Buf.GetBoolean;
  VoidLocation := Buf.GetBoolean;

  for i:=1 to 24 do
  begin
    AddDPar(TParameterDelta.Create);
    DPars[DParsValue].Load_v3_9_6(Buf);
    DPars[DParsValue].ParNum:=i;
  end;

  while 10>CntDescriptions do AddDescription;
  while 10<CntDescriptions do DeleteLastDescription;
  for i:=1 to 10 do begin LocationDescriptions[i].Clear; LocationDescriptions[i].Text.Load(Buf); end;

  RandomShowLocationDescriptions:=Buf.GetBoolean;
  LocDescrOrder:=Buf.GetInteger;

  dummy:=TTextField.Create;
  dummy.Load(Buf);//LocationName
  dummy.Clear;
  dummy.Load(Buf);//LocationDescription
  dummy.Free;
  //LocationDescription.Text:='';

end;


procedure TLocation.Load_v3_9_4(Buf:TBufEC);
var
  i:integer;
  dummy:TTextField;
begin
  Clear;
  dayscost:=Buf.GetInteger;
  screenx:=Buf.GetInteger;
  screeny:=Buf.GetInteger;
  LocationNumber:=Buf.GetInteger;
  VisitsAllowed:=0;

  StartLocationFlag := Buf.GetBoolean;
  EndLocationFlag := Buf.GetBoolean;
  FailLocationFlag := Buf.GetBoolean;
  PlayerDeath := Buf.GetBoolean;

  for i:=1 to 12 do
  begin
    AddDPar(TParameterDelta.Create);
    DPars[DParsValue].Load_v3_9_4(Buf);
    DPars[DParsValue].ParNum:=i;
  end;

  while 10>CntDescriptions do AddDescription;
  while 10<CntDescriptions do DeleteLastDescription;
  for i:=1 to 10 do begin LocationDescriptions[i].Clear; LocationDescriptions[i].Text.Load(Buf); end;

  RandomShowLocationDescriptions:=Buf.GetBoolean;
  LocDescrOrder:=Buf.GetInteger;

  dummy:=TTextField.Create;
  dummy.Load(Buf);//LocationName
  dummy.Clear;
  dummy.Load(Buf);//LocationDescription
  dummy.Free;
  //LocationDescription.Text:='';

end;


procedure TLocation.Load_v3_9_3(Buf:TBufEC);
var
  i:integer;
  dummy:TTextField;
begin
  Clear;
  dayscost:=Buf.GetInteger;
  screenx:=Buf.GetInteger;
  screeny:=Buf.GetInteger;
  LocationNumber:=Buf.GetInteger;
  VisitsAllowed:=0;

  StartLocationFlag := Buf.GetBoolean;
  EndLocationFlag := Buf.GetBoolean;
  FailLocationFlag := Buf.GetBoolean;
  PlayerDeath := Buf.GetBoolean;

  for i:=1 to 12 do
  begin
    AddDPar(TParameterDelta.Create);
    DPars[DParsValue].Load_v3_9_3(Buf);
    DPars[DParsValue].ParNum:=i;
  end;

  while 10>CntDescriptions do AddDescription;
  while 10<CntDescriptions do DeleteLastDescription;
  for i:=1 to 10 do begin LocationDescriptions[i].Clear; LocationDescriptions[i].Text.Load(Buf); end;

  RandomShowLocationDescriptions:=Buf.GetBoolean;
  LocDescrOrder:=Buf.GetInteger;

  dummy:=TTextField.Create;
  dummy.Load(Buf);//LocationName
  dummy.Clear;
  dummy.Load(Buf);//LocationDescription
  dummy.Free;
  //LocationDescription.Text:='';

end;


procedure TLocation.Load_v3_9_2(Buf:TBufEC);
var
  i:integer;
  dummy:TTextField;
begin
  Clear;

  screenx:=Buf.GetInteger;
  screeny:=Buf.GetInteger;
  LocationNumber:=Buf.GetInteger;
  VisitsAllowed:=0;

  StartLocationFlag := Buf.GetBoolean;
  EndLocationFlag := Buf.GetBoolean;
  FailLocationFlag := Buf.GetBoolean;
  PlayerDeath := Buf.GetBoolean;

  for i:=1 to 12 do
  begin
    AddDPar(TParameterDelta.Create);
    DPars[DParsValue].Load_Old(Buf);
    DPars[DParsValue].ParNum:=i;
  end;

  while 1<CntDescriptions do DeleteLastDescription;
  dummy:=TTextField.Create;
  dummy.Load(Buf);//LocationName
  dummy.Free;
  LocationDescriptions[1].Clear;
  LocationDescriptions[1].Text.Load(Buf);
  //LocationDescription.Text:='';

end;


procedure TLocation.Load_Old(Buf:TBufEC);
var
  i:integer;
  dummy:TTextField;
begin
  Clear;

  screenx:=Buf.GetInteger;
  screeny:=Buf.GetInteger;
  LocationNumber:=Buf.GetInteger;
  VisitsAllowed:=0;

  StartLocationFlag := Buf.GetBoolean;
  EndLocationFlag := Buf.GetBoolean;
  FailLocationFlag := Buf.GetBoolean;
  PlayerDeath := Buf.GetBoolean;

  for i:=1 to 9 do
  begin
    AddDPar(TParameterDelta.Create);
    DPars[DParsValue].Load_Old(Buf);
    DPars[DParsValue].ParNum:=i;
  end;

  while 1<CntDescriptions do DeleteLastDescription;
  dummy:=TTextField.Create;
  dummy.Load(Buf);//LocationName
  dummy.Free;
  LocationDescriptions[1].Clear;
  LocationDescriptions[1].Text.Load(Buf);
  //LocationDescription.Text:='';

end;

function TLocation.FindLocationDescription(var pars:TList):TEvent;
var
  i,j,c:integer;
  found:boolean;
  text:WideString;
  parse:TCalcParse;
  flag:boolean;
begin
  Result:=nil;
  found:=false;
  if RandomShowLocationDescriptions then //random or expression
  begin
    flag:=true;
    parse:=TCalcParse.Create;
    if trimEX(LocDescrExprOrder.Text)<>'' then
    begin
      parse.AssignAndPreprocess(LocDescrExprOrder.Text,1);
      if parse.error or parse.default_expression then flag:=false;
    end else flag:=false;
    if flag then
    begin
      parse.Parse(pars);
      if parse.calc_error then flag:=false;
    end;
    if flag then
    begin
      if (parse.answer<=CntDescriptions) and (parse.answer>=1) then Result:=LocationDescriptions[parse.answer];
    end else begin
      c:=0;
      while not found do
      begin
        i:=Random(CntDescriptions)+1;
        text:=trimEX(LocationDescriptions[i].Text.Text);
        if text<>'' then
        begin
          found:=true;
          Result:=LocationDescriptions[i];
        end else if c>max(20,CntDescriptions*2) then
        begin
          for j:=i+1 to i+CntDescriptions do
          begin
            text:=trimEX(LocationDescriptions[1+(j mod CntDescriptions)].Text.Text);
            if text<>'' then break;
          end;
          found:=true;
          Result:=LocationDescriptions[1+(j mod CntDescriptions)];
        end else inc(c);
      end;
    end;
    parse.Destroy;
  end else begin
    i:=locdescrorder;
    c:=0;
    while not found do
    begin
      text:=trimEX(LocationDescriptions[i].Text.Text);
      if (text<>'') or (c>CntDescriptions) then
      begin
        found:=true;
        Result:=LocationDescriptions[i];
        locdescrorder:=i+1;
        if locdescrorder>CntDescriptions then locdescrorder:=1;
      end else inc(c);
      inc(i);
      if i>CntDescriptions then i:=1;
    end;
  end;
end;


end.
