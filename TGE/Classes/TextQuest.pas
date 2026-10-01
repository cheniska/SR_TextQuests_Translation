unit TextQuest;

interface

uses  Classes, ParameterClass, ParameterDeltaClass, LocationClass, PathClass, TextFieldClass, EventClass, TextQuestInterface, EC_Struct, EC_Buf;

const
  //Версии редактора, не отраженные в списке версий файла, поддерживают формат
  //максимально новой версии, но не больше версии самого редактора.
  FileVersion_Older_than_3_8_5=1111111111;
  FileVersion_3_8_5=1111111112;
  FileVersion_3_9_0=1111111113;
  FileVersion_3_9_1=1111111114;
  FileVersion_3_9_2=1111111115;
  FileVersion_3_9_3=1111111116;
  FileVersion_3_9_4=1111111117;
  FileVersion_3_9_5=1111111118;
  FileVersion_3_9_6=1111111119;   //в названии редактора - 40alpha
  FileVersion_4_0_0=1111111120;
  FileVersion_4_0_1=1111111121;
  FileVersion_4_0_2=1111111122;
  FileVersion_4_2_0=1111111123;
  FileVersion_4_3_0=1111111124;
  FileVersion_5_0_0=1111111125;
  FileVersion_5_0_1=1111111126;
  FileVersion_5_0_2=1111111127;

  FileVersion_Current=FileVersion_5_0_2;

  scrxmaxvalue=10; // Размер поля редактирования в экранах по ширине
  scrymaxvalue=10; // Размер поля редактирования в экранах по высоте

  MinDistConst=15; // минимальное расстояние до объекта

  BXG1=30;
  BYG1=24;

  BXG2=22;
  BYG2=18;

  BXG3=15;
  BYG3=12;

  BXG4=10;
  BYG4=8;


type
  TQOwner=(QMaloc,QPeleng,QPeople,QFei,QGaal,QKling,QNone);// владелец чего-либо раса, клинг, Нет
  TQOwnerSet = set of TQOwner;// владелец чего-либо раса, клинг, Нет
  TQStatus = (QTrader,QPirate,QWarrior); //Статус рейнджера
  TQStatusSet = set of TQStatus;

TTextQuest=class(TObjectEx)
private
    LocationsList:TList;
    PathesList:TList;

    function CntLocations:integer;
    function CntPathes:integer;
    function GetLocation(ind:integer):TLocation;
    function GetPath(ind:integer):TPath;
    function CntPars:integer;
    function GetPar(ind:integer):TParameter;

  public
    FileVersion:integer;
    
    QuestMajorVersion:integer;
    QuestMinorVersion:integer;
    QuestComment:TTextField;

    XScreenResolution:integer;
    YScreenResolution:integer;

    BlockXgradient:integer;//=15;
    BlockYgradient:integer;//=12;

    Difficulty:integer;

    NeedNotToReturn:boolean; // Нужно ли возвращаться на планету, дающую квест для полного прохождения

    //Race:integer; // Какой расе принадлежит квест
    // 0 -Малоки, 1 - Пеленги, 2 - Люди, 3 - Фэй, 4 - Гаальцы
    SRace:TQOwnerSet; // Какой расе принадлежит квест (новая)


    //TargetRace:integer; // Раса к которой летим
    // -1 - Незаселенная,0-малоки,1-пеленги,2-люди,3-фэяне,4-гаальцы
    STargetRace:TQOwnerSet; // Раса к которой летим (новая)

    //RangerStatus:integer; // Необходимый статус рейнджера
    // -1 - всем, 0-торговцам, 1-пиратам, 2-военным
    SRangerStatus:TQStatusSet; // новое поле

    //RangerRace:integer; // Необходимая раса рейнджера
    // -1 - любая, 0 - малок, 1 - пеленг, 2 - люди, 3 - фэй, 4 - гаал
    SRangerRace:TQOwnerSet; // новое поле

    PlanetReaction:integer; // Отношение планеты после выполнения квеста
    // -1 - хуже, 0 - также, 1-лучше

    DefPathGoTimesValue:integer;//проходимость перехода по умолчанию

    QuestDescription:TTextField; // Описание задания
    QuestSuccessGovMessage:TTextField; //Текст правительства по выполнении задания

    //Поля, используемые сугубо в редакторе
    RToStar:TTextField;
    RToPlanet:TTextField;
    RDate:TTextField;
    RMoney:TTextField;
    RFromPLanet:TTextField;
    RFromStar:TTextField;
    RRanger:TTextField;

    TQInterface:TTextQuestInterface;
    QTextWasChanged:boolean;
    LastEvent:TEvent;
    CriticalEvent:TEvent;
    CriticalEventType:integer;

    ParsList:TList;

    CurTextSource:WideString;

    property ParsValue:integer read CntPars;
    property Pars[ind:integer]:TParameter read GetPar;

    property LocationsValue:integer read CntLocations;
    property PathesValue:integer read CntPathes;

    property Locations[ind:integer]:TLocation read GetLocation;
    property Pathes[ind:integer]:TPath read GetPath;

    constructor Create();
    destructor Destroy; override;

    procedure Clear;
    procedure CopyDataFrom(var source:TTextQuest);

    procedure Save_4_3_0(Buf:TBufEC); overload;
    procedure Save_4_3_0(filename:PAnsiChar); overload;
    procedure Save_5_0_2(Buf:TBufEC); overload;
    procedure Save_5_0_2(filename:PAnsiChar); overload;
    procedure Load(Buf:TBufEC;headerOnly:boolean=false); overload;
    procedure Load(filename:PAnsiChar;headerOnly:boolean=false); overload;

    procedure ExportText(filename:PAnsiChar);
    procedure ImportText(filename:PAnsiChar);
    procedure ExportScheme(filename:PAnsiChar);

    procedure SaveState(Buf:TBufEC);
    procedure LoadState(Buf:TBufEC);

    function  CompatibleWithOldFormat(showErrMsg:boolean=false):boolean;
    function  HasLinkedResources:boolean;

    function  AddLocation(var NewLocation:TLocation):integer;
    procedure DeleteLocation(LocationNumber:integer);
    function  AddPath(var NewPath:TPath):integer;
    procedure DeletePath(PathNumber:integer);

    procedure RecalculatePathes;
    procedure RecalculatePathCoords(Pathindex,LocIndex1,LocIndex2,DrawPathNumber:integer);
    procedure RecalculatePathCoordsCycle(Pathindex,LocIndex1,DrawPathNumber,DrawPathCnt:integer);

    function GetPathDistance(pathindex,mousex,mousey:integer):double;

    function CanAddStartLocation:boolean;

    function WeNearerToPathEnd(pathindex,x,y:integer):boolean;

    function GetOutcomePathesValue(LocationIndex:integer):integer;

    function GetLocationIndex(LocationNumber:integer):integer;
    function GetPathIndex(PathNumber:integer):integer;

    function GetClosestLocation(x,y:integer):integer;
    function GetClosestPath(x,y:integer):integer;

    procedure SeekOneQuestionPathes;
    procedure ClearLocationDescriptionOrders;

    procedure FindOneWaySequences;
    procedure ClearSequences;
    procedure CalcLocationsPassability;

    function  FixStringValueParameters(txt:wideString;useClr:boolean):Widestring;
    function  CheckExpressions(txt:wideString):Widestring;

    function  CheckCriticals:boolean;

    procedure StartQuest(startMoney:integer = -1;useExtParams:boolean = false);
    procedure EnterLocation(locNum:integer);
    procedure SelectPath(pathNum:integer);
    procedure ProcessEvent(event:TEvent);
    procedure ProcessCriticalEvent;
    procedure ShowParams;

end;

implementation

uses Dialogs, Math, MessageText, CalcParseClass, SequenceClass, EC_File, EC_Str;


constructor TTextQuest.Create();
begin
  TQInterface:=nil;
  QTextWasChanged:=false;
  CriticalEvent:=TEvent.Create;
  CriticalEventType:=NoCriticalParType;
  LastEvent:=nil;

  QuestMajorVersion:=1;
  QuestMinorVersion:=0;
  QuestComment:=TTextField.Create;

  QuestSuccessGovMessage:=TTextField.Create;
  QuestDescription:=TTextField.Create;


  RToStar:=TTextField.Create;
  RToPlanet:=TTextField.Create;
  RDate:=TTextField.Create;
  RMoney:=TTextField.Create;
  RFromPLanet:=TTextField.Create;
  RFromStar:=TTextField.Create;
  RRanger:=TTextField.Create;

  LocationsList:=TList.Create;
  PathesList:=TList.Create;
  ParsList:=TList.Create;

  Clear;
  ParsList.Add(TParameter.Create(1));
end;

destructor TTextQuest.Destroy;
begin
  Clear;

  if QuestComment<>nil then begin QuestComment.Free; QuestComment:=nil; end;

  if QuestSuccessGovMessage<>nil then begin QuestSuccessGovMessage.Free; QuestSuccessGovMessage:=nil; end;
  if QuestDescription<>nil then begin QuestDescription.Free; QuestDescription:=nil; end;
  if CriticalEvent<>nil then begin CriticalEvent.Free; CriticalEvent:=nil; end;

  if RToStar<>nil then begin RToStar.Free; RToStar:=nil; end;
  if RToPlanet<>nil then begin RToPlanet.Free; RToPlanet:=nil; end;
  if RDate<>nil then begin RDate.Free; RDate:=nil; end;
  if RMoney<>nil then begin RMoney.Free; RMoney:=nil; end;
  if RFromPLanet<>nil then begin RFromPLanet.Free; RFromPLanet:=nil; end;
  if RFromStar<>nil then begin RFromStar.Free; RFromStar:=nil; end;
  if RRanger<>nil then begin RRanger.Free; RRanger:=nil; end;

  LocationsList.Free;
  LocationsList:=nil;
  PathesList.Free;
  PathesList:=nil;
  ParsList.Free;
  ParsList:=nil;

  inherited Destroy;
end;


procedure TTextQuest.Clear;
var
  i:integer;
begin
  FileVersion:=FileVersion_Current;

  QuestMajorVersion:=1;
  QuestMinorVersion:=0;
  QuestComment.Clear;


  NeedNotToReturn:=true;
  SRace:=[QMaloc, QPeleng, QPeople, QFei, QGaal];
  STargetRace:=[QNone];
  SRangerRace:=[QMaloc, QPeleng, QPeople, QFei, QGaal];
  SRangerStatus:=[QTrader, QPirate, QWarrior];
  XScreenResolution:=0;
  YScreenResolution:=0;
  DefPathGoTimesValue:=0;
  Difficulty:=50;
  PlanetReaction:=0;

  BlockXgradient:=BXG4;
  BlockYgradient:=BYG4;

  QuestSuccessGovMessage.Text:=QuestMessages.ParPath_Get('GameContent.QuestSuccessGovMessage');

  QuestDescription.Text:=QuestMessages.ParPath_Get('GameContent.QuestDecription');

  RToStar.Text:=QuestMessages.ParPath_Get('GameContent.RToStar');
  RToPlanet.Text:=QuestMessages.ParPath_Get('GameContent.RToPlanet');
  RDate.Text:=QuestMessages.ParPath_Get('GameContent.RDate');
  RMoney.Text:=QuestMessages.ParPath_Get('GameContent.RMoney');
  RFromPLanet.Text:=QuestMessages.ParPath_Get('GameContent.RFromPLanet');
  RFromStar.Text:=QuestMessages.ParPath_Get('GameContent.RFromStar');
  RRanger.Text:=QuestMessages.ParPath_Get('GameContent.RRanger');

  for i:=LocationsValue downto 1 do Locations[i].Free;
  LocationsList.Clear;

  for i:=PathesValue downto 1 do Pathes[i].Free;
  PathesList.Clear;

  for i:=ParsValue downto 1 do Pars[i].Free;
  ParsList.Clear;

  CriticalEvent.Clear;
  CriticalEventType:=NoCriticalParType;
  LastEvent:=nil;
end;

procedure TTextQuest.CopyDataFrom(var source:TTextQuest);
var
  i:integer;
  loc:TLocation;
  path:TPath;
  par:TParameter;
begin
  Clear;

  FileVersion:=source.FileVersion;

  QuestMajorVersion:=source.QuestMajorVersion;
  QuestMinorVersion:=source.QuestMinorVersion;
  QuestComment.Text:=source.QuestComment.Text;

  NeedNotToReturn:=source.NeedNotToReturn;

  SRace:=source.SRace;
  Difficulty:=source.Difficulty;
  STargetRace:=source.STargetRace;
  SRangerRace:=source.SRangerRace;
  SRangerStatus:=source.SRangerStatus;
  PlanetReaction:=source.PlanetReaction;

  QuestDescription.Clear;
  QuestDescription.Text:=source.QuestDescription.Text;

  QuestSuccessGovMessage.Clear;
  QuestSuccessGovMessage.Text:=source.QuestSuccessGovMessage.Text;

  XScreenResolution:=source.XScreenResolution;
  YScreenResolution:=source.YScreenResolution;

  DefPathGoTimesValue:=source.DefPathGoTimesValue;

  BlockXgradient:=source.BlockXgradient;
  BlockYgradient:=source.BlockYgradient;

  for i:=1 to source.ParsValue do
  begin
    par:=TParameter.Create(0);
    par.CopyDataFrom(source.Pars[i]);
    ParsList.Add(par);
  end;

  RToStar.Text:=source.RToStar.Text;
  RToPlanet.Text:=source.RToPlanet.Text;
  RDate.Text:=source.RDate.Text;
  RMoney.Text:=source.RMoney.Text;
  RFromPLanet.Text:=source.RFromPLanet.Text;
  RFromStar.Text:=source.RFromStar.Text;
  RRanger.Text:=source.RRanger.Text;

  for i:=1 to source.LocationsValue do
  begin
    loc:=TLocation.Create();
    loc.CopyDataFrom(source.Locations[i]);
    LocationsList.Add(loc);
  end;

  for i:=1 to source.PathesValue do
  begin
    path:=TPath.Create();
    path.CopyDataFrom(source.Pathes[i]);
    PathesList.Add(path);
  end;

end;

function TTextQuest.CntLocations:integer;
begin
  Result:=LocationsList.Count;
end;

function TTextQuest.CntPathes:integer;
begin
  Result:=PathesList.Count;
end;

function TTextQuest.GetLocation(ind:integer):TLocation;
begin
  Result:=LocationsList.Items[ind-1];
end;

function TTextQuest.GetPath(ind:integer):TPath;
begin
  Result:=PathesList.Items[ind-1];
end;

function TTextQuest.CntPars:integer;
begin
  Result:=ParsList.Count;
end;

function TTextQuest.GetPar(ind:integer):TParameter;
begin
  Result:=ParsList.Items[ind-1];
end;

procedure TTextQuest.Save_4_3_0(filename:PAnsiChar);
var
  Buf:TBufEC;
  fi:TFileEC;
begin
  Buf:=TBufEC.Create;
  Save_4_3_0(Buf);

  fi:=TFileEC.Create;
  fi.Init(filename);
  fi.CreateNew;
  Buf.SaveInFile(fi);
  fi.Free;

  Buf.Free;
end;

procedure TTextQuest.Save_4_3_0(Buf:TBufEC);
var
  i:integer;
  par:TParameter;
begin
  Buf.AddInteger(FileVersion_4_3_0);

  Buf.AddInteger(0);//race
  Buf.Add(@SRace,sizeof(SRace));
  Buf.AddBoolean(NeedNotToReturn);
  Buf.AddInteger(0); //target race
  Buf.Add(@STargetRace,sizeof(STargetRace));
  Buf.AddInteger(0); //status
  Buf.Add(@SRangerStatus,sizeof(SRangerStatus));
  Buf.AddInteger(0); //ranger race
  Buf.Add(@SRangerRace,sizeof(SRangerRace));
  Buf.AddInteger(PlanetReaction);
  Buf.AddInteger(XScreenResolution);
  Buf.AddInteger(YScreenResolution);
  Buf.AddInteger(BlockXgradient);
  Buf.AddInteger(BlockYgradient);
  Buf.AddInteger(1);//ArtifactSize
  Buf.AddInteger(DefPathGoTimesValue);
  Buf.AddInteger(Difficulty);

  for i:=1 to min(96,ParsValue) do Pars[i].Save_4_0_1(Buf);
  for i:=ParsValue+1 to 96 do
  begin
    par:=TParameter.Create(i);
    par.Save_4_0_1(Buf);
    par.Free;
  end;

  RToStar.Save(Buf);

  Buf.AddInteger(0);//RParsec, 0 means empty string
  Buf.AddInteger(0);//RArtefact, 0 means empty string
  RToPlanet.Save(Buf);
  RDate.Save(Buf);
  RMoney.Save(Buf);
  RFromPLanet.Save(Buf);
  RFromStar.Save(Buf);
  RRanger.Save(Buf);
  Buf.AddInteger(LocationsValue);
  Buf.AddInteger(PathesValue);
  QuestSuccessGovMessage.Save(Buf);
  QuestDescription.Save(Buf);
  Buf.AddInteger(0);//QuestTargetName, 0 means empty string
  for i:=1 to LocationsValue do Locations[i].Save_v4_3_0(Buf);
  for i:=1 to PathesValue do Pathes[i].Save_v4_3_0(Buf,ParsList);
end;

procedure TTextQuest.Save_5_0_2(filename:PAnsiChar);
var
  Buf:TBufEC;
  fi:TFileEC;
begin
  Buf:=TBufEC.Create;
  Save_5_0_2(Buf);

  fi:=TFileEC.Create;
  fi.Init(filename);
  fi.CreateNew;
  Buf.SaveInFile(fi);
  fi.Free;

  Buf.Free;
end;

procedure TTextQuest.Save_5_0_2(Buf:TBufEC);
var
  i:integer;
  li:TList;
begin
  Buf.AddInteger(FileVersion_5_0_2);
  Buf.AddInteger(QuestMajorVersion);
  Buf.AddInteger(QuestMinorVersion);
  QuestComment.Save(Buf);

  Buf.Add(@SRace,sizeof(Srace));
  Buf.AddBoolean(NeedNotToReturn);
  Buf.Add(@STargetRace,sizeof(STargetRace));
  Buf.Add(@SRangerStatus,sizeof(SRangerStatus));
  Buf.Add(@SRangerRace,sizeof(SRangerRace));
  Buf.AddInteger(PlanetReaction);
  Buf.AddInteger(XScreenResolution);
  Buf.AddInteger(YScreenResolution);
  Buf.AddInteger(BlockXgradient);
  Buf.AddInteger(BlockYgradient);
  Buf.AddInteger(DefPathGoTimesValue);
  Buf.AddInteger(Difficulty);

  //cnt pars <<<<<<

  li:=TList.Create;

  for i:=ParsValue downto 1 do
  begin
    if Pars[i].Enabled then break;
    li.Add(Pars[i]);
    ParsList.Delete(i-1);
  end;

  Buf.AddInteger(ParsValue);
  for i:=1 to ParsValue do Pars[i].Save_5_0_0(Buf);

  RToStar.Save(Buf);
  RToPlanet.Save(Buf);
  RDate.Save(Buf);
  RMoney.Save(Buf);
  RFromPLanet.Save(Buf);
  RFromStar.Save(Buf);
  RRanger.Save(Buf);
  Buf.AddInteger(LocationsValue);
  Buf.AddInteger(PathesValue);
  QuestSuccessGovMessage.Save(Buf);
  QuestDescription.Save(Buf);

  for i:=1 to LocationsValue do Locations[i].Save_v5_0_1(Buf,ParsList);
  for i:=1 to PathesValue do Pathes[i].Save_v5_0_0(Buf,ParsList);

  for i:=li.Count-1 downto 0 do
  begin
    ParsList.Add(li[i]);
    li.Delete(i);
  end;
end;


procedure TTextQuest.Load(filename:PAnsiChar;headerOnly:boolean);
var
  Buf:TBufEC;
begin
  Buf:=TBufEC.Create;
  Buf.LoadFromFile(filename);
  Load(Buf,headerOnly);
  Buf.Free;
end;

procedure TTextQuest.Load(Buf:TBufEC;headerOnly:boolean);
var
  i,cnt,cntL,cntP:integer;
  dummy:TTextField;
begin
  Clear;

  FileVersion:=Buf.GetInteger;

  if FileVersion>=FileVersion_5_0_2 then
  begin
    QuestMajorVersion:=Buf.GetInteger;
    QuestMinorVersion:=Buf.GetInteger;
    QuestComment.Load(Buf);
  end else begin
    QuestMajorVersion:=1;
    QuestMinorVersion:=0;
    QuestComment.Clear;
  end;

  i:=0;
  if FileVersion<=FileVersion_Older_than_3_8_5 then
  begin
    i:=FileVersion;//race
    FileVersion:=FileVersion_Older_than_3_8_5;
  end
  else if FileVersion < FileVersion_5_0_0 then i:=Buf.GetInteger;//race

  if FileVersion>=FileVersion_3_9_6 then Buf.Get(@SRace,sizeof(Srace))
  else
  begin
    case i of
      -1:SRace:=[qnone];
      0: SRace:=[qmaloc];
      1: SRace:=[qpeleng];
      2: SRace:=[qpeople];
      3: SRace:=[qfei];
      4: SRace:=[qgaal];
      else SRace:=[];
    end;
  end;


  if FileVersion>=FileVersion_3_8_5 then NeedNotToReturn:=Buf.GetBoolean;

  if FileVersion < FileVersion_5_0_0 then i:=Buf.GetInteger; //target race

  if FileVersion >=FileVersion_3_9_6 then Buf.Get(@STargetRace,sizeof(STargetRace))
  else
  begin
    case i of
      -1:STargetRace:=[qnone];
      0: STargetRace:=[qmaloc];
      1: STargetRace:=[qpeleng];
      2: STargetRace:=[qpeople];
      3: STargetRace:=[qfei];
      4: STargetRace:=[qgaal];
      else STargetRace:=[];
    end;
  end;


  if FileVersion < FileVersion_5_0_0 then i:=Buf.GetInteger; //status
  if FileVersion >=FileVersion_4_0_0 then Buf.Get(@SRangerStatus,sizeof(SRangerStatus))
  else
  begin
    case i of
      -1:SRangerStatus:=[qtrader,qpirate,qwarrior];
      0: SRangerStatus:=[qtrader];
      1: SRangerStatus:=[qpirate];
      2: SRangerStatus:=[qwarrior];
      else SRangerStatus:=[];
    end;
  end;


  if FileVersion < FileVersion_5_0_0 then i:=Buf.GetInteger; //ranger race
  if FileVersion >=FileVersion_4_0_0 then Buf.Get(@SRangerRace,sizeof(SRangerRace))
  else
  begin
    case i of
      -1:SRangerRace:=[qmaloc,qpeleng,qpeople,qfei,qgaal];
      0: SRangerRace:=[qmaloc];
      1: SRangerRace:=[qpeleng];
      2: SRangerRace:=[qpeople];
      3: SRangerRace:=[qfei];
      4: SRangerRace:=[qgaal];
      else SRangerRace:=[];
    end;
  end;


  PlanetReaction:=Buf.GetInteger;
  XScreenResolution:=Buf.GetInteger;
  YScreenResolution:=Buf.GetInteger;
  BlockXgradient:=Buf.GetInteger;
  BlockYgradient:=Buf.GetInteger;
  if FileVersion < FileVersion_5_0_0 then Buf.GetInteger; //ArtifactSize

  if FileVersion>=FileVersion_4_0_0 then DefPathGoTimesValue:=Buf.GetInteger;
  if FileVersion>=FileVersion_4_0_1 then Difficulty:=Buf.GetInteger;


  if      FileVersion>=FileVersion_5_0_0 then cnt:=Buf.GetInteger
  else if FileVersion>=FileVersion_4_3_0 then cnt:=96
  else if FileVersion>=FileVersion_4_2_0 then cnt:=48
  else if FileVersion>=FileVersion_4_0_1 then cnt:=24
  else if FileVersion>=FileVersion_3_9_6 then cnt:=24
  else if FileVersion>=FileVersion_3_9_5 then cnt:=12
  else if FileVersion>=FileVersion_3_9_2 then cnt:=12
  else if FileVersion>=FileVersion_3_9_0 then cnt:=9
  else cnt:=9;

  for i:=1 to cnt do ParsList.Add(TParameter.Create(i));

  if      FileVersion>=FileVersion_5_0_0 then for i:=1 to cnt do Pars[i].Load_5_0_0(Buf)
  else if FileVersion>=FileVersion_4_3_0 then for i:=1 to cnt do Pars[i].Load_4_0_1(Buf)
  else if FileVersion>=FileVersion_4_2_0 then for i:=1 to cnt do Pars[i].Load_4_0_1(Buf)
  else if FileVersion>=FileVersion_4_0_1 then for i:=1 to cnt do Pars[i].Load_4_0_1(Buf)
  else if FileVersion>=FileVersion_3_9_6 then for i:=1 to cnt do Pars[i].Load_3_9_6(Buf)
  else if FileVersion>=FileVersion_3_9_5 then for i:=1 to cnt do Pars[i].Load_3_9_5(Buf)
  else if FileVersion>=FileVersion_3_9_2 then for i:=1 to cnt do Pars[i].Load_3_9_0(Buf)
  else if FileVersion>=FileVersion_3_9_0 then for i:=1 to cnt do Pars[i].Load_3_9_0(Buf)
  else for i:=1 to cnt do Pars[i].Load_Old(Buf);

  ParsList.Add(TParameter.Create(cnt+1));

  RToStar.Load(Buf);
  if FileVersion < FileVersion_5_0_0 then
  begin
    dummy:=TTextField.Create;
    dummy.Load(Buf); //RParsec
    dummy.Clear;
    dummy.Load(Buf); //RArtefact
    dummy.Free;
  end;

  RToPlanet.Load(Buf);
  RDate.Load(Buf);
  RMoney.Load(Buf);
  RFromPLanet.Load(Buf);
  RFromStar.Load(Buf);
  RRanger.Load(Buf);


  cntL:=Buf.GetInteger;
  cntP:=Buf.GetInteger;
  QuestSuccessGovMessage.Load(Buf);
  QuestDescription.Load(Buf);

  if headerOnly then exit;

  if FileVersion < FileVersion_5_0_0 then
  begin
    dummy:=TTextField.Create;
    dummy.Load(Buf); //QuestTargetName
    dummy.Free;
  end;

  for i:=1 to cntP do PathesList.Add(TPath.Create());

  for i:=1 to cntL do LocationsList.Add(TLocation.Create());

  if      FileVersion>=FileVersion_5_0_1 then for i:=1 to LocationsValue do Locations[i].Load_v5_0_1(Buf)
  else if FileVersion>=FileVersion_5_0_0 then for i:=1 to LocationsValue do Locations[i].Load_v5_0_0(Buf)
  else if FileVersion>=FileVersion_4_3_0 then for i:=1 to LocationsValue do Locations[i].Load_v4_3_0(Buf)
  else if FileVersion>=FileVersion_4_2_0 then for i:=1 to LocationsValue do Locations[i].Load_v4_2_0(Buf)
  else if FileVersion>=FileVersion_4_0_1 then for i:=1 to LocationsValue do Locations[i].Load_v4_0_1(Buf)
  else if FileVersion>=FileVersion_3_9_6 then for i:=1 to LocationsValue do Locations[i].Load_v3_9_6(Buf)
  else if FileVersion>=FileVersion_3_9_4 then for i:=1 to LocationsValue do Locations[i].Load_v3_9_4(Buf)
  else if FileVersion>=FileVersion_3_9_3 then for i:=1 to LocationsValue do Locations[i].Load_v3_9_3(Buf)
  else if FileVersion>=FileVersion_3_9_2 then for i:=1 to LocationsValue do Locations[i].Load_v3_9_2(Buf)
  else for i:=1 to LocationsValue do Locations[i].Load_Old(Buf);


  if      FileVersion>=FileVersion_5_0_0 then for i:=1 to PathesValue do Pathes[i].Load_v5_0_0(Buf,ParsList)
  else if FileVersion>=FileVersion_4_3_0 then for i:=1 to PathesValue do Pathes[i].Load_v4_3_0(Buf)
  else if FileVersion>=FileVersion_4_2_0 then for i:=1 to PathesValue do Pathes[i].Load_v4_2_0(Buf)
  else if FileVersion>=FileVersion_4_0_2 then for i:=1 to PathesValue do Pathes[i].Load_v4_0_2(Buf)
  else if FileVersion>=FileVersion_3_9_6 then for i:=1 to PathesValue do Pathes[i].Load_v3_9_6(Buf)
  else if FileVersion>=FileVersion_3_9_4 then for i:=1 to PathesValue do Pathes[i].Load_v3_9_4(Buf)
  else if FileVersion>=FileVersion_3_9_3 then for i:=1 to PathesValue do Pathes[i].Load_v3_9_3(Buf)
  else if FileVersion>=FileVersion_3_9_2 then for i:=1 to PathesValue do Pathes[i].Load_v3_9_2(Buf)
  else if FileVersion>=FileVersion_3_9_1 then for i:=1 to PathesValue do Pathes[i].Load_v3_9_1(Buf)
  else if FileVersion>=FileVersion_3_8_5 then for i:=1 to PathesValue do Pathes[i].Load_v3_8_5(Buf)
  else for i:=1 to PathesValue do Pathes[i].Load_Old(Buf);

  for i:=1 to PathesValue do Pathes[i].DeleteNoEffectDeltas(ParsList);
  for i:=1 to LocationsValue do Locations[i].DeleteNoEffectDeltas(ParsList);


  if FileVersion<FileVersion_5_0_1 then
  begin
    FindOneWaySequences;
    CalcLocationsPassability;
    ClearSequences;
  end;
  //FileVersion:=FileVersion_Current;
end;


procedure TTextQuest.ExportText(filename:PAnsiChar);
var f:file of byte;
    ff,fe:char;
    i,j:integer;
    par:TParameter;
    loc:TLocation;
    path,path2:TPath;
    flag:boolean;

    procedure WriteText(stype,text:WideString);
    var tstr,tstr1,ttype:WideString;
        i,j,len:integer;
    begin
      tstr:=text;
      ttype:=stype;
      j:=PosEx(#13#10,tstr);
      while (j>0) do
      begin
        tstr1:=ttype+#9+CopyEC(tstr,1,j-1)+#13#10; ttype:='*';
        tstr:=CopyEC(tstr,j+2,Length(tstr)-j-1);
        j:=PosEx(#13#10,tstr);
        len:=Length(tstr1);
        for i:=1 to len do BlockWrite(f,tstr1[i],sizeof(tstr1[i]));
      end;
      tstr1:=ttype+#9+tstr+#13#10;
      len:=Length(tstr1);
      for i:=1 to len do BlockWrite(f,tstr1[i],sizeof(tstr1[i]));
    end;
begin
  assign(f,filename);
  rewrite(f);
  ff:=char($FF);BlockWrite(f,ff,sizeof(ff));
  fe:=char($FE);BlockWrite(f,fe,sizeof(fe));

  if trimEX(QuestDescription.Text)<>'' then WriteText('QuestDescription',QuestDescription.Text);
  if trimEX(QuestSuccessGovMessage.Text)<>'' then WriteText('QuestSuccessGovMessage',QuestSuccessGovMessage.Text);
  {if trimEX(RRanger.Text)<>'' then WriteText('Ranger',RRanger.Text);
  if trimEX(RToPlanet.Text)<>'' then WriteText('ToPlanet',RToPlanet.Text);
  if trimEX(RToStar.Text)<>'' then WriteText('ToStar',RToStar.Text);
  if trimEX(RFromPlanet.Text)<>'' then WriteText('FromPlanet',RFromPlanet.Text);
  if trimEX(RFromStar.Text)<>'' then WriteText('FromStar',RFromStar.Text);}

  for i:=1 to ParsValue do
  begin
    par:=Pars[i];
    if not par.Enabled then continue;

    for j:=1 to par.ValueOfViewStrings do
      if trimEX(par.ViewFormatStrings[j].str.Text)<>'' then
        WriteText('Par'+inttostrEC(i)+'-'+inttostrEC(j),par.ViewFormatStrings[j].str.Text);

    if par.ParType<>NoCriticalParType then
      if trimEX(par.CriticalEvent.Text.Text)<>'' then
        WriteText('Par'+inttostrEC(i)+'-crit',par.CriticalEvent.Text.Text);
  end;

  for i:=1 to LocationsValue do
  begin
    loc:=Locations[i];

    for j:=1 to loc.CntDescriptions do
     if trimEX(loc.LocationDescriptions[j].Text.Text)<>'' then
       WriteText('Loc'+inttostrEC(loc.LocationNumber)+'-'+inttostrEC(j),loc.LocationDescriptions[j].Text.Text);

    for j:=1 to loc.DParsValue do
      if trimEX(loc.DPars[j].CustomCriticalEvent.Text.Text)<>'' then
        WriteText('Loc'+inttostrEC(loc.LocationNumber)+'-par'+inttostrEC(loc.DPars[j].ParNum)+'-crit',loc.DPars[j].CustomCriticalEvent.Text.Text);
  end;

  for i:=1 to PathesValue do
  begin
    path:=Pathes[i];

    if trimEX(path.StartPathMessage.Text)<>'' then
    begin
      flag:=false;
      for j:=1 to i-1 do
      begin
        path2:=Pathes[j];
        if path2.FromLocation<>path.FromLocation then continue;
        if trimEX(path.StartPathMessage.Text)<>trimEX(path2.StartPathMessage.Text) then continue;
        flag:=true;
        break;
      end;
      if not flag then
        WriteText('Path'+inttostrEC(path.PathNumber),path.StartPathMessage.Text);
    end;


    if trimEX(path.EndPathEvent.Text.Text)<>'' then WriteText('Path'+inttostrEC(path.PathNumber)+'b',path.EndPathEvent.Text.Text);

    for  j:=1 to path.DParsValue do
      if trimEX(path.DPars[j].CustomCriticalEvent.Text.Text)<>'' then
        WriteText('Path'+inttostrEC(path.PathNumber)+'-par'+inttostrEC(path.DPars[j].ParNum)+'-crit',path.DPars[j].CustomCriticalEvent.Text.Text);
  end;


  close(f);
end;

procedure TTextQuest.ImportText(filename:PAnsiChar);
var f:file of byte;
    ff,fe,t:char;
    i,j:integer;
    par:TParameter;
    loc:TLocation;
    path,path2,pathOld:TPath;
    flag:boolean;
    curType:WideString;
    questCopy:TTextQuest;

  procedure GetType;
  var wc:WideChar;
  begin
    curType:='';
    while not Eof(f) do
    begin
      BlockRead(f,wc,sizeof(wc));
      if wc=#9 then break;
      curType:=curType+wc;
    end;
  end;

  function GetText(stype:WideString; var text:WideString):boolean;
  var tstr:WideString;
      wc:WideChar;
  begin
    Result:=false;
    if stype<>curType then begin ShowMessage('Got <'+curType+'> while expecting '+stype); exit; end;
    text:='';
    curType:='*';
    while curType='*' do
    begin
      tstr:='';
      while not Eof(f) do
      begin
        BlockRead(f,wc,sizeof(wc));
        tstr:=tstr+wc;
        if PosEx(#13#10,tstr)>0 then
        begin
          tstr:=CopyEC(tstr,1,Length(tstr)-2);
          break;
        end;
      end;
      if text<>'' then text:=text+#13#10+tstr else text:=tstr;
      GetType;
    end;
    Result:=true;
  end;

  procedure OnError;
  begin
    CopyDataFrom(questCopy);
    questCopy.Free;
    close(f);
    ShowMessage('Error on importing text, operation aborted');
  end;
  
begin
  assign(f,filename);
  reset(f);
  ff:=char($FF);
  fe:=char($FE);

  BlockRead(f,t,sizeof(t));
  if t<>ff then
  begin
    ShowMessage('Error. This is not a Unicode Text Document');
    exit;
  end;

  BlockRead(f,t,sizeof(t));
  if t<>fe then
  begin
    ShowMessage('Error. This is not a Unicode Text Document');
    exit;
  end;

  questCopy:=TTextQuest.Create;
  questCopy.CopyDataFrom(self);
  GetType;

  if trimEX(QuestDescription.Text)<>'' then
    if not GetText('QuestDescription',QuestDescription.Text) then begin OnError; exit; end;

  if trimEX(QuestSuccessGovMessage.Text)<>'' then
    if not GetText('QuestSuccessGovMessage',QuestSuccessGovMessage.Text) then begin OnError; exit; end;

  {if trimEX(RRanger.Text)<>'' then
    if not GetText('Ranger',RRanger.Text) then begin OnError; exit; end;

  if trimEX(RToPlanet.Text)<>'' then
    if not GetText('ToPlanet',RToPlanet.Text) then begin OnError; exit; end;

  if trimEX(RToStar.Text)<>'' then
    if not GetText('ToStar',RToStar.Text) then begin OnError; exit; end;

  if trimEX(RFromPlanet.Text)<>'' then
    if not GetText('FromPlanet',RFromPlanet.Text) then begin OnError; exit; end;

  if trimEX(RFromStar.Text)<>'' then
    if not GetText('FromStar',RFromStar.Text) then begin OnError; exit; end;}


  for i:=1 to ParsValue do
  begin
    par:=Pars[i];
    if not par.Enabled then continue;

    for j:=1 to par.ValueOfViewStrings do
      if trimEX(par.ViewFormatStrings[j].str.Text)<>'' then
        if not GetText('Par'+inttostrEC(i)+'-'+inttostrEC(j),par.ViewFormatStrings[j].str.Text) then begin OnError; exit; end;

    if par.ParType<>NoCriticalParType then
      if trimEX(par.CriticalEvent.Text.Text)<>'' then
        if not GetText('Par'+inttostrEC(i)+'-crit',par.CriticalEvent.Text.Text) then begin OnError; exit; end;
  end;


  for i:=1 to LocationsValue do
  begin
    loc:=Locations[i];

    for j:=1 to loc.CntDescriptions do
     if trimEX(loc.LocationDescriptions[j].Text.Text)<>'' then
       if not GetText('Loc'+inttostrEC(loc.LocationNumber)+'-'+inttostrEC(j),loc.LocationDescriptions[j].Text.Text) then begin OnError; exit; end;

    for j:=1 to loc.DParsValue do
      if trimEX(loc.DPars[j].CustomCriticalEvent.Text.Text)<>'' then
        if not GetText('Loc'+inttostrEC(loc.LocationNumber)+'-par'+inttostrEC(loc.DPars[j].ParNum)+'-crit',loc.DPars[j].CustomCriticalEvent.Text.Text) then begin OnError; exit; end;
  end;


  for i:=1 to PathesValue do
  begin
    path:=Pathes[i];

    if trimEX(path.StartPathMessage.Text)<>'' then
    begin
      flag:=false;
      pathOld:=questCopy.Pathes[i];
      for j:=1 to i-1 do
      begin
        path2:=questCopy.Pathes[j];
        if path2.FromLocation<>path.FromLocation then continue;
        if trimEX(pathOld.StartPathMessage.Text)<>trimEX(path2.StartPathMessage.Text) then continue;
        flag:=true;
        break;
      end;
      if not flag then
      begin
        if not GetText('Path'+inttostrEC(path.PathNumber),path.StartPathMessage.Text) then begin OnError; exit; end;
        for j:=i+1 to PathesValue do
        begin
          path2:=Pathes[j];
          if path2.FromLocation<>path.FromLocation then continue;
          if trimEX(pathOld.StartPathMessage.Text)<>trimEX(path2.StartPathMessage.Text) then continue;
          path2.StartPathMessage.Text:=path.StartPathMessage.Text;
        end;
      end;
    end;


    if trimEX(path.EndPathEvent.Text.Text)<>'' then
      if not GetText('Path'+inttostrEC(path.PathNumber)+'b',path.EndPathEvent.Text.Text) then begin OnError; exit; end;

    for  j:=1 to path.DParsValue do
      if trimEX(path.DPars[j].CustomCriticalEvent.Text.Text)<>'' then
        if not GetText('Path'+inttostrEC(path.PathNumber)+'-par'+inttostrEC(path.DPars[j].ParNum)+'-crit',path.DPars[j].CustomCriticalEvent.Text.Text) then begin OnError; exit; end;
  end;

  questCopy.Free;
  close(f);

end;



procedure TTextQuest.ExportScheme(filename:PAnsiChar);
var f:file of byte;
    ff,fe:char;
    i,j,k,cntStr,cntPath,pathInd:integer;
    loc:TLocation;
    path:TPath;
    delta:TParameterDelta;
    tstr,tstr1,temp:WideString;
    len:integer;


    function ReplaceCR(text:WideString):WideString;
    var tstr,tstr1:WideString;
        j:integer;
    begin
      Result:='';
      tstr:=trimEX(text);
      j:=PosEx(#13#10,tstr);
      while (j>0) do
      begin
        tstr1:=CopyEC(tstr,1,j-1)+'<br>';
        tstr:=CopyEC(tstr,j+2,Length(tstr)-j-1);
        j:=PosEx(#13#10,tstr);
        Result:=Result+tstr1;
      end;
      Result:=Result+tstr;
    end;
begin
  assign(f,filename);
  rewrite(f);
  ff:=char($FF);BlockWrite(f,ff,sizeof(ff));
  fe:=char($FE);BlockWrite(f,fe,sizeof(fe));

  tstr:='Location'#9'ParamChanges'#9'DescrSelector'#9'Descriptions'#9'Pathes'#9'PathText'#9'Condition'#9'ParamChanges'#13#10;
  len:=Length(tstr);
  for k:=1 to len do BlockWrite(f,tstr[k],sizeof(tstr[k]));

  for i:=1 to LocationsValue do
  begin
    loc:=Locations[i];
    cntStr:=max(1,loc.CntDescriptions);

    cntPath:=0;
    for j:=1 to PathesValue do
    begin
      path:=Pathes[j];
      if path.FromLocation = loc.LocationNumber then inc(cntPath);
    end;

    cntStr:=max(cntStr,cntPath);

    pathInd:=1;
    for j:=1 to cntStr do
    begin
      if j=1 then
      begin
        tstr:='Loc'+inttostrEC(loc.LocationNumber)+#9;
        tstr1:='';
        for k:=1 to loc.DParsValue do
        begin
          delta:=loc.DPars[k];
          with delta do
          begin
            temp:='';
            if DeltaExprFlag then
            begin
              temp:=trimEX(Expression.Text);
              if temp<>'' then temp:='[p' + inttostrEC(ParNum) + '] = ' + temp;
            end else begin
              if (delta <> 0) or DeltaApprFlag then
              begin
                temp:='[p' + inttostrEC(ParNum) + ']';
                if DeltaApprFlag then temp:=temp + '=';
                if (delta > 0) and (not DeltaApprFlag) then temp:=temp + '+';
                temp:=temp + IntToStrEC(delta);
                if DeltaPercentFlag then temp:=temp + '%';
              end;
            end;
            if (temp <> '') then
            begin
              if tstr1<>'' then tstr1:=tstr1+'; '+temp
              else tstr1:=temp;
            end;
            {case ParameterViewAction of
              ShowParameter: tstr:=tstr + ' ' + QuestMessages.Par_Get('ParameterShow');
              HideParameter: tstr:=tstr + ' ' + QuestMessages.Par_Get('ParameterHide');
            end;}
          end;
        end;

        tstr:=tstr+tstr1+#9;
        if (loc.CntDescriptions>1) and loc.RandomShowLocationDescriptions and (trimEX(loc.LocDescrExprOrder.Text)<>'') then tstr:=tstr+trimEX(loc.LocDescrExprOrder.Text)+#9
        else tstr:=tstr+' '#9;

      end else begin
        tstr:=#9#9#9;
      end;

      if loc.CntDescriptions>=j then tstr:=tstr+ReplaceCR(loc.LocationDescriptions[j].Text.Text)+#9
      else tstr:=tstr+' '#9;

      if j<=cntPath then
      begin
        while Pathes[pathInd].FromLocation<>loc.LocationNumber do inc(pathInd);
        path:=Pathes[pathInd];
        tstr:=tstr+'Path'+inttostrEC(path.PathNumber)+'->Loc'+inttostrEC(path.ToLocation)+#9;
        if path.VoidPathFlag then tstr:=tstr+' '#9
        else tstr:=tstr+trimEX(path.StartPathMessage.Text)+#9;

        tstr1:=trimEX(path.LogicExpression.Text);
        for k:=1 to path.DParsValue do
        begin
          delta:=path.DPars[k];
          with delta do
          begin
            if (min = Pars[ParNum].min) and (max = Pars[ParNum].max) then temp:=''
            else temp:=':[' + IntToStrEC(Min) + '..' + IntToStrEC(Max) + ']';

            if(ValuesGate.Count <> 0) then
            begin
              if temp<>'' then temp:=temp+',';
              if ValuesGate.Negation then temp:=temp + '=' else temp:=temp + '<>';
              temp:=temp + ValuesGate.GetString;
            end;

            if ModZeroesGate.Count<>0 then
            begin
              if temp<>'' then temp:=temp+',';
              if ModZeroesGate.Negation then temp:=temp + '/' else temp:=temp + 'X';
              temp:=temp + ModZeroesGate.GetString;
            end;

            if temp <> '' then
            begin
              temp:='[p'+inttostrEC(ParNum)+']'+temp;
              if tstr1<>'' then tstr1:=tstr1+'; '+temp
              else tstr1:=temp;
            end;
          end;
        end;
        if tstr1='' then tstr1:=' ';
        tstr:=tstr+tstr1+#9;

        tstr1:='';
        for k:=1 to path.DParsValue do
        begin
          delta:=path.DPars[k];
          with delta do
          begin
            temp:='';

            if DeltaExprFlag then
            begin
              temp:=trimEX(Expression.Text);
              if temp<>'' then temp:='[p' + inttostrEC(ParNum) + '] = ' + temp;
            end else begin
              if (delta <> 0) or DeltaApprFlag then
              begin
                temp:='[p' + inttostrEC(ParNum) + ']';
                if DeltaApprFlag then temp:=temp + '=';
                if (delta > 0) and (not DeltaApprFlag) then temp:=temp + '+';
                temp:=temp + IntToStrEC(delta);
                if DeltaPercentFlag then temp:=temp + '%';
              end;
            end;
            if (temp <> '') then
            begin
              if tstr1<>'' then tstr1:=tstr1+'; '+temp
              else tstr1:=temp;
            end;
            {case ParameterViewAction of
              ShowParameter: tstr:=tstr + ' ' + QuestMessages.Par_Get('ParameterShow');
              HideParameter: tstr:=tstr + ' ' + QuestMessages.Par_Get('ParameterHide');
            end;}
          end;
        end;
        if tstr1='' then tstr1:=' ';
        tstr:=tstr+tstr1+#9+' ';

        inc(pathInd);
      end else begin
        tstr:=tstr+' ';
      end;

      tstr:=tstr+#13#10;
      len:=Length(tstr);
      for k:=1 to len do BlockWrite(f,tstr[k],sizeof(tstr[k]));
    end;
  end;

  close(f);
end;


procedure TTextQuest.SaveState(Buf:TBufEC);
var path:TPath;
    loc:Tlocation;
    par:TParameter;
    i:integer;
begin
  for i:=1 to ParsValue do
  begin
    par:=Pars[i];
    if not par.Enabled then continue;
    Buf.AddInteger(par.value);
  end;
  for i:=1 to LocationsValue do
  begin
    loc:=Locations[i];
    Buf.AddInteger(loc.LocDescrOrder);
    Buf.AddInteger(loc.VisitsMade);
  end;
  for i:=1 to PathesValue do
  begin
    path:=Pathes[i];
    Buf.AddInteger(path.PassesMade);
  end;

  CriticalEvent.Text.Save(Buf);
  CriticalEvent.Image.Save(Buf);
  CriticalEvent.BGM.Save(Buf);
  CriticalEvent.Sound.Save(Buf);
  Buf.AddInteger(CriticalEventType);
  Buf.AddBoolean(QTextWasChanged);

  for i:=1 to ParsValue do
  begin
    par:=Pars[i];
    if not par.Enabled then continue;
    Buf.AddBoolean(par.Hidden);
  end;

end;

procedure TTextQuest.LoadState(Buf:TBufEC);
var path:TPath;
    loc:Tlocation;
    par:TParameter;
    i:integer;
begin
  for i:=1 to ParsValue do
  begin
    par:=Pars[i];
    if not par.Enabled then continue;
    par.value:=Buf.GetInteger;
  end;
  for i:=1 to LocationsValue do
  begin
    loc:=Locations[i];
    loc.LocDescrOrder:=Buf.GetInteger;
    loc.VisitsMade:=Buf.GetInteger;
  end;
  for i:=1 to PathesValue do
  begin
    path:=Pathes[i];
    path.PassesMade:=Buf.GetInteger;
  end;

  CriticalEvent.Text.Load(Buf);
  CriticalEvent.Image.Load(Buf);
  CriticalEvent.BGM.Load(Buf);
  CriticalEvent.Sound.Load(Buf);
  CriticalEventType:=Buf.GetInteger;
  QTextWasChanged:=Buf.GetBoolean;

  for i:=1 to ParsValue do
  begin
    par:=Pars[i];
    if not par.Enabled then continue;
    par.Hidden:=Buf.GetBoolean;
  end;
end;

procedure TTextQuest.ClearLocationDescriptionOrders;
var
  i:integer;
begin
  for i:=1 to LocationsValue do Locations[i].LocDescrOrder:=1;
end;

procedure TTextQuest.RecalculatePathes;
var
  i,j,cnt,cnt2:integer;
begin
  for i:=1 to PathesValue do
  begin
    cnt:=1;
    for j:=1 to i-1 do
    begin
      if ((Pathes[i].FromLocation = Pathes[j].FromLocation) and (Pathes[i].ToLocation = Pathes[j].ToLocation)) or
         ((Pathes[i].FromLocation = Pathes[j].ToLocation) and (Pathes[i].ToLocation = Pathes[j].FromLocation)) then inc(cnt);
    end;
    if Pathes[i].FromLocation<>Pathes[i].ToLocation then
    begin
      RecalculatePathCoords(i, GetLocationIndex(Pathes[i].FromLocation), GetLocationIndex(Pathes[i].ToLocation), cnt);
    end else begin
      cnt2:=cnt;
      for j:=i+1 to PathesValue do
      begin
        if ((Pathes[j].FromLocation = Pathes[i].FromLocation) and (Pathes[j].ToLocation = Pathes[i].ToLocation)) then inc(cnt2);
      end;
      RecalculatePathCoordsCycle(i, GetLocationIndex(Pathes[i].FromLocation), cnt,cnt2);
    end;
  end;
end;

procedure TTextQuest.RecalculatePathCoordsCycle(Pathindex,LocIndex1,DrawPathNumber,DrawPathCnt:integer);
var ang,r,phi,p,rx,ry:extended;
    lx,ly:extended;
    x,y:extended;
    i:integer;
begin
  lx:=Locations[LocIndex1].screenx;
  ly:=Locations[LocIndex1].screeny;

  p:=1/(maxpathcoords);

  ang:=pi/2+2*pi*DrawPathNumber/DrawPathCnt;
  r:=1+0.5*ln(1+0.125*DrawPathCnt);

  //procedure TFormMain.DrawPath(path_index:integer); pointersize = 15
  rx:=max(25,0.35*r*(XScreenResolution div BlockXGradient));
  ry:=max(25,0.35*r*(YScreenResolution div BlockYGradient));

  for i:=0 to maxpathcoords do
  begin
    phi:=2*Pi*p*i;
    x:=2.0*r/3.0-r/3.0*cos(phi)*(2.0+phi*phi/pi/pi-2.0*phi/pi);
    y:=0.2*r/3.0*sin(phi)*(2.0+phi*phi/pi/pi-2.0*phi/pi);

    Pathes[PathIndex].PathXCoords[i]:=trunc(lx+rx*(x*cos(ang)+y*sin(ang)));
    Pathes[PathIndex].PathYCoords[i]:=trunc(ly+ry*(x*sin(ang)-y*cos(ang)));
  end;


end;

procedure TTextQuest.RecalculatePathCoords(PathIndex,LocIndex1,LocIndex2,DrawPathNumber:integer);
var
  i,n:integer;
  p,ax,bx,ay,by:extended;
  l,a,m,w,z,x0,y0,x1,y1,r:extended;
begin

  ax:=Locations[LocIndex1].screenx;
  ay:=Locations[LocIndex1].screeny;
  bx:=Locations[LocIndex2].screenx;
  by:=Locations[LocIndex2].screeny;

  p:=1/(maxpathcoords);
  if DrawPathNumber=1 then a:=0 else a:=15;
  if (DrawPathNumber mod 2 <> 0) then n:=-1 else n:=1;

  if LocIndex1>LocIndex2 then n:=n*(-1);

  for i:=0 to maxpathcoords do
  begin
    x0:=ax + i*(p)*(bx-ax);
    y0:=ay + i*(p)*(by-ay);

    r:=sqrt((ax-bx)*(ax-bx) + (ay-by)*(ay-by));
    l:=sqrt((ax-x0)*(ax-x0) + (ay-y0)*(ay-y0));
    if by<ay then w:=arccos((ax-bx)/r) else w:=pi+arccos((bx-ax)/r);

    m:=w+n*pi/2;

    z:=a*(DrawPathNumber div 2)*sin( (pi)*(1 - l/r) );

    x1:=z*cos(m)+ x0;
    y1:=z*sin(m)+ y0;

    Pathes[PathIndex].PathXCoords[i]:=trunc(x1);
    Pathes[PathIndex].PathYCoords[i]:=trunc(y1);
  end;
end;

function TTextQuest.CompatibleWithOldFormat(showErrMsg:boolean):boolean;
var i,j,cnt,cnt2:integer;
    errStr:WideString;
    loc,loc2:TLocation;
    path:TPath;
    unlimEx:boolean;
begin
  Result:=true;
  errStr:=QuestMessages.Par_Get('NotCompatible');

  j:=0;
  for i:=ParsValue downto 1 do
    if Pars[i].Enabled then
    begin
      j:=i;
      break;
    end;

  if j>96 then errStr := errStr + #10#13 + QuestMessages.Par_Get('NotCompatibleParCnt');

  cnt:=0;
  for i:=1 to j do
  begin
    if Pars[i].ValueOfViewStrings>10 then
    begin
      Result:=false;
      inc(cnt);
      if cnt=1 then errStr := errStr + #10#13 + QuestMessages.Par_Get('NotCompatibleParDescriptions')  +' p' + IntToStrEC(i)
      else if cnt>5 then begin errStr := errStr + ',...'; break; end
      else errStr := errStr + ', p' + IntToStrEC(i);
    end;
  end;

  cnt:=0;
  for i:=1 to LocationsValue do
  begin
    loc:=Locations[i];
    for j:=loc.CntDescriptions downto 10 do
    begin
      if trimEX(loc.LocationDescriptions[j].Text.Text)<>'' then break;
    end;
    if j>10 then
    begin
      Result:=false;
      inc(cnt);
      if cnt=1 then errStr := errStr + #10#13 + QuestMessages.Par_Get('NotCompatibleLocDescriptions')  +' L' + IntToStrEC(loc.LocationNumber)
      else if cnt>5 then begin errStr := errStr + ',...'; break; end
      else errStr := errStr + ', L' + IntToStrEC(loc.LocationNumber);
    end;
  end;

  cnt:=0;
  for i:=1 to LocationsValue do
  begin
    loc:=Locations[i];
    if loc.OneWaySequence<>nil then continue;
    if loc.VisitsAllowed <= 0 then continue;
    cnt2:=0;
    unlimEx:=false;
    for j:=1 to PathesValue do
    begin
      path:=Pathes[j];
      if path.FromLocation <> loc.LocationNumber then continue;
      if path.PassesAllowed <= 0 then
      begin
        loc2:=Locations[GetLocationIndex(path.ToLocation)];
        if loc2.EndLocationFlag or loc2.FailLocationFlag then cnt2:=cnt2+1
        else begin
          unlimEx:=true;
          break;
        end;
      end;
      cnt2:=cnt2+path.PassesAllowed;
    end;
    if unlimEx or (cnt2>loc.VisitsAllowed) then
    begin
      Result:=false;
      inc(cnt);
      if cnt=1 then errStr := errStr + #10#13 + QuestMessages.Par_Get('NotCompatibleLocPasses')  +' L' + IntToStrEC(loc.LocationNumber)
      else if cnt>5 then begin errStr := errStr + ',...'; break; end
      else errStr := errStr + ', L' + IntToStrEC(loc.LocationNumber);
    end;
  end;

  cnt:=0;
  for i:=1 to PathesValue do
  begin
    path:=Pathes[i];
    if path.ToLocation <> path.FromLocation then continue;
    Result:=false;
    inc(cnt);
    if cnt=1 then errStr := errStr + #10#13 + QuestMessages.Par_Get('NotCompatibleCyclePathes')  +' P' + IntToStrEC(path.PathNumber)
    else if cnt>5 then begin errStr := errStr + ',...'; break; end
    else errStr := errStr + ', P' + IntToStrEC(path.PathNumber);
  end;

  if showErrMsg and not Result then ShowMessage(errStr);
end;

function  TTextQuest.HasLinkedResources:boolean;
var i,j:integer;
    ev:TEvent;
    delta:TParameterDelta;
begin
  Result:=true;

  for i:=1 to ParsValue do
  begin
    if not Pars[i].Enabled then continue;
    ev:=Pars[i].CriticalEvent;
    if ev=nil then continue;
    if trimEX(ev.Image.Text)<>'' then exit;
    if trimEX(ev.Sound.Text)<>'' then exit;
    if trimEX(ev.BGM.Text)<>'' then exit;
  end;

  for i:=1 to LocationsValue do
  begin
    for j:=1 to Locations[i].CntDescriptions do
    begin
      ev:=Locations[i].LocationDescriptions[j];
      if ev=nil then continue;
      if trimEX(ev.Image.Text)<>'' then exit;
      if trimEX(ev.Sound.Text)<>'' then exit;
      if trimEX(ev.BGM.Text)<>'' then exit;
    end;

    for j:=1 to Locations[i].DParsValue do
    begin
      delta:=Locations[i].DPars[j];
      if not Pars[delta.ParNum].Enabled then continue;
      ev:=delta.CustomCriticalEvent;
      if ev=nil then continue;
      if trimEX(ev.Image.Text)<>'' then exit;
      if trimEX(ev.Sound.Text)<>'' then exit;
      if trimEX(ev.BGM.Text)<>'' then exit;
    end;
  end;

  for i:=1 to PathesValue do
  begin
    for j:=1 to Pathes[i].DParsValue do
    begin
      delta:=Pathes[i].DPars[j];
      if not Pars[delta.ParNum].Enabled then continue;
      ev:=delta.CustomCriticalEvent;
      if ev=nil then continue;
      if trimEX(ev.Image.Text)<>'' then exit;
      if trimEX(ev.Sound.Text)<>'' then exit;
      if trimEX(ev.BGM.Text)<>'' then exit;
    end;

    ev:=Pathes[i].EndPathEvent;
    if ev=nil then continue;
    if trimEX(ev.Image.Text)<>'' then exit;
    if trimEX(ev.Sound.Text)<>'' then exit;
    if trimEX(ev.BGM.Text)<>'' then exit;
  end;

  Result:=false;
end;


function TTextQuest.GetOutcomePathesValue(LocationIndex:integer):integer;
var i:integer;
begin
  Result:=0;
  for i:=1 to PathesValue do
    if Pathes[i].FromLocation=Locations[LocationIndex].LocationNumber then inc(Result);
end;


function TTextQuest.WeNearerToPathEnd(pathindex,x,y:integer):boolean;
var
  ax,ay,bx,by:extended;
begin
  ax:=Locations[GetLocationIndex(Pathes[Pathindex].FromLocation)].screenx;
  ay:=Locations[GetLocationIndex(Pathes[Pathindex].FromLocation)].screeny;
  bx:=Locations[GetLocationIndex(Pathes[Pathindex].ToLocation)].screenx;
  by:=Locations[GetLocationIndex(Pathes[Pathindex].ToLocation)].screeny;

  Result := (sqrt((ax-x)*(ax-x)+(ay-y)*(ay-y)) > sqrt ((bx-x)*(bx-x)+(by-y)*(by-y)));
end;

function TTextQuest.CanAddStartLocation:boolean;
var
  i:integer;
begin
  Result:=false;
  for i:=1 to LocationsValue do
    if Locations[i].StartLocationFlag then exit;

  Result:=true;
end;


function TTextQuest.AddLocation(var NewLocation:TLocation):integer;
var
  i, NewLocationNumber:integer;
begin
  NewLocationNumber:=0;
  for i:=1 to LocationsValue do
    if Locations[i].LocationNumber>NewLocationNumber then NewLocationNumber:=Locations[i].LocationNumber;

  inc(NewLocationNumber);

  NewLocation.LocationNumber:=NewLocationNumber;
  LocationsList.Add(NewLocation);

  Result:=NewLocationNumber;

end;

procedure TTextQuest.DeleteLocation(LocationNumber:integer);
var
  i, found_index:integer;
begin
  found_index:=0;
  for i:=1 to LocationsValue do
    if Locations[i].LocationNumber=LocationNumber then found_index:=i;

  if found_index>0 then
  begin
    if Locations[found_index].OneWaySequence<>nil then Locations[found_index].OneWaySequence.Free;
    LocationsList.Delete(found_index-1);
  end else ShowMessage('Cannot delete location - No Location with current LocationNumber found');
end;


function TTextQuest.AddPath(var NewPath:TPath):integer;
var
  i, NewPathNumber:integer;
begin
  NewPathNumber:=1;

  for i:=1 to PathesValue do
    if Pathes[i].PathNumber>NewPathNumber then NewPathNumber:=Pathes[i].PathNumber;
      
  inc(NewPathNumber);

  NewPath.PathNumber:=NewPathNumber;
  PathesList.Add(NewPath);

  i:=GetLocationIndex(NewPath.ToLocation);
  if Locations[i].OneWaySequence<>nil then Locations[i].OneWaySequence.Free;
  i:=GetLocationIndex(NewPath.FromLocation);
  if Locations[i].OneWaySequence<>nil then Locations[i].OneWaySequence.Free;

  Result:=NewPathNumber;
end;


procedure TTextQuest.DeletePath(PathNumber:integer);
var
  i, found_index:integer;
begin
  found_index:=0;
  for i:=1 to PathesValue do
    if Pathes[i].PathNumber=PathNumber then found_index:=i;

  if found_index>0 then
  begin
    if Pathes[found_index].OneWaySequence<>nil then Pathes[found_index].OneWaySequence.Free;
    PathesList.Delete(found_index-1);
  end else ShowMessage('Cannot delete Path - No Path with' + ' current PathNumber found');
end;

function TTextQuest.GetLocationIndex(LocationNumber:integer):integer;
var
  i:integer;
begin
  Result:=0;

  for i:=1 to LocationsValue do
    if Locations[i].LocationNumber=LocationNumber then Result:=i;

  if Result=0 then ShowMessage('Cannot find Location with Location Number '+IntToStrEC(LocationNumber));

end;

function TTextQuest.GetPathIndex(PathNumber:integer):integer;
var
  i:integer;
begin
  Result:=0;

  for i:=1 to PathesValue do
    if Pathes[i].PathNumber=PathNumber then Result:=i;

  if Result=0 then ShowMessage('Cannot find Path by' + ' Path Number - error');

end;


function TTextQuest.GetClosestLocation(x,y:integer):integer;
var
  closest_location_index:integer;
  i:integer;
  closest_radius, current_radius:extended;
begin
  closest_location_index:=-1;
  closest_radius:=9000000;
  for i:=1 to LocationsValue do
  begin
    current_radius:=sqrt(sqr(abs(Locations[i].screenx - x)) + sqr(abs(Locations[i].screeny - y)) );
    if current_radius<closest_radius then
    begin
      closest_radius:=current_radius;
      closest_location_index:=i;
    end;
  end;

  if closest_radius>MinDistConst then closest_location_index:=-1;

  GetClosestLocation:=closest_location_index;
end;

function TTextQuest.GetPathDistance(pathindex,mousex,mousey:integer):double;
label alldone;
var
  tx,ty,a,b:integer;
  x1,y1,x2,y2:integer;
  t_distance:double;
  c:integer;
begin
  Result:=1000000;

  if pathindex<=0 then exit;

  a:=GetLocationIndex(pathes[Pathindex].Fromlocation);
  b:=GetLocationIndex(pathes[Pathindex].Tolocation);

  x1:=Locations[a].screenx;
  y1:=Locations[a].screeny;
  x2:=Locations[b].screenx;
  y2:=Locations[b].screeny;

  for c:=0 to maxpathcoords do
  begin
    tx:=Pathes[Pathindex].pathXCoords[c];
    ty:=Pathes[Pathindex].pathYCoords[c];

    t_distance:=sqrt(0.1+(tx - mousex)*(tx  - mousex) + (ty - mousey)*(ty - mousey));

    if (t_distance<Result) and
       ((sqrt((tx-x1)*(tx-x1)+(ty-y1)*(ty-y1))>10) and
        (sqrt((tx-x2)*(tx-x2)+(ty-y2)*(ty-y2))>10)) then Result:=t_distance;
  end;

end;


function TTextQuest.GetClosestPath(x,y:integer):integer;
var
  i:integer;
  closest_radius, current_radius:real;
begin
  Result:=-1;
  closest_radius:=1000000;
  for i:=1 to PathesValue do
  begin
    current_radius:=GetPathDistance(i,x,y);

    if current_radius<closest_radius then
    begin
      closest_radius:=current_radius;
      Result:=i;
    end;
  end;

  if closest_radius>MinDistConst then Result:=-1;

end;

procedure TTextQuest.SeekOneQuestionPathes;
var i,c,xx,yy:integer;
    lpathindexes: TList;
    path1,path2:TPath;
begin
  lpathindexes:=TList.Create;
  for i:=1 to PathesValue do Pathes[i].IsPathVariant:=false;
  for i:=1 to LocationsValue do
  begin
    for c:=1 to PathesValue do
      if Pathes[c].FromLocation=Locations[i].LocationNumber then lpathindexes.Add(Pathes[c]);

    for xx:=0 to lpathindexes.Count-2 do
      for yy:=xx+1 to lpathindexes.Count-1 do
      begin
        path1:=lpathindexes.Items[xx];
        path2:=lpathindexes.Items[yy];
        if trimEX(path1.StartPathMessage.text) = trimEX(path2.StartPathMessage.text) then
        begin
          path1.IsPathVariant:=true;
          path2.IsPathVariant:=true;
        end;
      end;
    lpathindexes.Clear;
  end;
  lpathindexes.Free;
end;


procedure TTextQuest.FindOneWaySequences;
var i,cntEnt,cntEx:integer;
    loc:TLocation;
    pathEnt,pathEx:TPath;
    seq:TSequence;

    procedure CheckLocation(loc:TLocation; var cntEnt,cntEx:integer; var pathEnt,pathEx:TPath);
    var i:integer;
        path:TPath;
    begin
      cntEnt:=0;
      cntEx:=0;
      pathEnt:=nil;
      pathEx:=nil;
      if loc.StartLocationFlag or loc.EndLocationFlag or loc.FailLocationFlag then exit;
      if loc.OneWaySequence<>nil then exit;
      for i:=1 to PathesValue do
      begin
        path:=Pathes[i];
        if path.ToLocation = loc.LocationNumber then begin pathEnt:=path; inc(cntEnt); end;
        if path.FromLocation = loc.LocationNumber then begin pathEx:=path; inc(cntEx); end;
        if (cntEnt>1) and (cntEx>1) then exit;
      end;
    end;

    procedure AddPathEnt(path:TPath);
    var cntEnt,cntEx:integer;
        loc:TLocation;
        pathEnt,pathEx:TPath;
    begin
      seq.InsertPath(path);
      loc:=Locations[GetLocationIndex(path.FromLocation)];
      CheckLocation(loc,cntEnt,cntEx,pathEnt,pathEx);
      if cntEx<>1 then exit;
      seq.AddLocation(loc);
      if cntEnt=1 then AddPathEnt(pathEnt);
    end;

    procedure AddPathEx(path:TPath);
    var cntEnt,cntEx:integer;
        loc:TLocation;
        pathEnt,pathEx:TPath;
    begin
      seq.AddPath(path);
      loc:=Locations[GetLocationIndex(path.ToLocation)];
      CheckLocation(loc,cntEnt,cntEx,pathEnt,pathEx);
      if cntEnt<>1 then exit;
      seq.AddLocation(loc);
      if cntEx=1 then AddPathEx(pathEx);
    end;
begin
  for i:=1 to LocationsValue do
  begin
    loc:=Locations[i];
    CheckLocation(loc,cntEnt,cntEx,pathEnt,pathEx);
    if (cntEnt<>1) and (cntEx<>1) then continue;
    seq:=TSequence.Create;
    seq.AddLocation(loc);
    if cntEnt=1 then AddPathEnt(pathEnt);
    if cntEx=1 then AddPathEx(pathEx);
    seq.CalcLimit;
  end;
end;

procedure TTextQuest.ClearSequences;
var i:integer;
    loc:TLocation;
begin
  for i:=1 to LocationsValue do
  begin
    loc:=Locations[i];
    if loc.OneWaySequence<>nil then loc.OneWaySequence.Free;
  end;
end;

procedure TTextQuest.CalcLocationsPassability;
var i,j,cntEx:integer;
    unlimEx,hasEnt:boolean;
    loc:TLocation;
    path:TPath;
begin
  for i:=1 to LocationsValue do
  begin
    loc:=Locations[i];
    if loc.EndLocationFlag or loc.PlayerDeath then continue;
    cntEx:=0;
    hasEnt:=false;
    unlimEx:=false;
    for j:=1 to PathesValue do
    begin
      path:=Pathes[j];
      if path.ToLocation=loc.LocationNumber then hasEnt:=true;
      if path.FromLocation<>loc.LocationNumber then continue;
      if path.PassesAllowed<=0 then
      begin
        unlimEx:=true;
        break;
      end else cntEx:=cntEx+path.PassesAllowed;
    end;
    if unlimEx then continue;
    if not hasEnt then continue;
    if loc.OneWaySequence = nil then loc.VisitsAllowed:=cntEx
    else if (loc.VisitsAllowed=0) or (loc.VisitsAllowed>cntEx) then loc.OneWaySequence.SetNewLimit(cntEx);
  end;
end;


function TTextQuest.FixStringValueParameters(txt:wideString;useClr:boolean):Widestring;
var
  i,j,k,l,m,c:integer;
  tstr,tstr1,tstr2:widestring;
  parse:TCalcParse;
  cle,cls:widestring;
begin
  if not useClr then
  begin
    cls:='';
    cle:='';
  end else begin
    cls:='<clr>';
    cle:='<clrEnd>';
  end;

  parse:=TCalcParse.Create;
  tstr:='';
  i:=1;
  c:=length(txt);
  while i<=c do
  begin
    if txt[i]<>'{' then
    begin
      tstr:=tstr+txt[i];
      inc(i);
    end else begin
      inc(i);
      tstr1:='';
      while (i<=c) and (txt[i]<>'}') do
      begin
        tstr1:=tstr1+txt[i];
        inc(i);
      end;
      if tstr1<>'' then
      begin
        parse.Clear;
        parse.AssignAndPreprocess(tstr1,0);
        if not (parse.error or parse.default_expression)then
        begin
          parse.Parse(ParsList);
          if not parse.error then tstr:=tstr+cls+IntToStrEC(parse.answer)+cle
          else tstr:=tstr+'{'+tstr1;
        end else tstr:=tstr+'{'+tstr1;
      end;
      inc(i);
    end;
  end;

  txt:=tstr;
  for i:=1 to ParsValue do
  begin
    txt:=StringReplaceEC(txt,'['+trimEX(Pars[i].Name.Text)+']','[p'+IntToStrEC(i)+']');
    txt:=StringReplaceEC(txt,'['+trimEX(Pars[i].Name.Text)+':','[d'+IntToStrEC(i)+':');
  end;

  for i:=1 to ParsValue do
  begin
    j:=Pos('[d'+IntToStrEC(i)+':',txt);
    while j>0 do
    begin
      k:=j+3+length(IntToStrEC(i));
      l:=0;
      m:=1;
      while (k+l)<length(txt) do
      begin
        if txt[k+l]=']' then dec(m);
        if txt[k+l]='[' then inc(m);
        if m=0 then break;
        inc(l);
      end;
      if k>=length(txt) then break;
      tstr1:=cls+'err'+cle;
      tstr2:=Copy(txt,k,l+1);
      if tstr2<>'' then
      begin
        parse.Clear;
        parse.AssignAndPreprocess(tstr2,1);
        if not (parse.error or parse.default_expression)then
        begin
          parse.Parse(ParsList);
          if not parse.error then
          begin
            tstr1:=Pars[i].GetVFStringByValue(parse.answer);
            tstr1:=StringReplaceEC(tstr1,'<>',IntToStrEC(parse.answer));
            tstr1:=FixStringValueParameters(tstr1,true);
          end;
        end;
      end;
      tstr2:=Copy(txt,j,k-j+l+1);
      txt:=StringReplaceEC(txt,tstr2,cls+tstr1+cle);
      j:=Pos('[d'+IntToStrEC(i)+':',txt);
    end;
  end;
  {for i:=1 to ParsValue do
  begin
    j:=Pos('['+trimEX(PlayGame.Pars[i].Name.Text)+':',txt);
    if j>0 then
    begin
      k:=j+2+length(trimEX(PlayGame.Pars[i].Name.Text));
      l:=0;
      while (k+l)<length(txt) do
      begin
        if txt[k+l]=']' then break;
        inc(l);
      end;
      if k>=length(txt) then continue;
      tstr2:=Copy(txt,k,l);
      if tstr2<>'' then
      begin
        parse.Clear;
        parse.AssignAndPreprocess(tstr2,1);
        if not (parse.error or parse.default_expression)then
        begin
          parse.Parse(GamePars);
          if not parse.error then
          begin
            tstr1:=PlayGame.Pars[i].GetVFStringByValue(parse.answer);
            tstr1:=StringReplaceEC(tstr1,'<>',IntToStrEC(parse.answer));
            tstr1:=FixStringValueParameters(tstr1,true);
            tstr2:=Copy(txt,j,k-j+l+1);
            txt:=StringReplaceEC(txt,tstr2,cls+tstr1+cle);
          end;
        end;
      end;
    end;
  end;}
  for i:=1 to ParsValue do
  begin
    txt:=StringReplaceEC(txt,'[p'+IntToStrEC(i)+']',cls+IntToStrEC(Pars[i].value)+cle);
    if Pos('[d'+IntToStrEC(i)+']',txt)>0 then
    begin
      tstr1:=Pars[i].GetVFStringByValue(Pars[i].value);
      tstr1:=StringReplaceEC(tstr1,'<>',IntToStrEC(Pars[i].value));
      tstr1:=FixStringValueParameters(tstr1,true);
      txt:=StringReplaceEC(txt,'[d'+IntToStrEC(i)+']',cls+tstr1+cle);
    end;
  end;

  parse.Free;

  FixStringValueParameters:=txt;
end;

function TTextQuest.CheckExpressions(txt:wideString):Widestring;
var
  i,c:integer;
  tstr:widestring;
  parse:TCalcParse;
begin
  Result:='';
  if txt='' then exit;
  parse:=TCalcParse.Create;
  i:=1;
  c:=length(txt);
  while i<=c do
  begin
    if txt[i]<>'{' then
    begin
      inc(i);
    end else begin
      inc(i);
      tstr:='';
      while (i<=c) and (txt[i]<>'}') do
      begin
        tstr:=tstr+txt[i];
        inc(i);
      end;
      if tstr<>'' then
      begin
        parse.Clear;
        parse.AssignAndPreprocess(tstr,0);
        if parse.error or parse.default_expression then
        begin
          Result:=tstr;
          parse.Free;
          exit;
        end else begin
          parse.Parse(ParsList);
          if parse.error then
          begin
            Result:=tstr;
            parse.Free;
            exit;
          end;
        end;
      end;
      inc(i);
    end;
  end;

  parse.Free;
end;


function TTextQuest.CheckCriticals:boolean;
var crits:array[1..3] of integer;
    i,ind:integer;
    par:TParameter;
    evntO:TEvent;
begin
  Result:=false;

  for i:=1 to 3 do crits[i]:=-1;

  for i:=1 to ParsValue do
  begin
    par := Pars[i];
    if not par.Enabled then continue;
    if par.ParType = NoCriticalParType then continue;
    if (par.LoLimit and (par.value>par.min)) or
       ((not par.LoLimit) and (par.value<par.max)) then continue;
    if crits[par.ParType]<0 then crits[par.ParType]:=i;
  end;

  if crits[DeathParType] >= 0 then ind := crits[DeathParType]
  else if crits[FailParType] >= 0 then ind := crits[FailParType]
  else if crits[SuccessParType] >= 0 then ind := crits[SuccessParType]
  else exit;

  Result:=true;

  CriticalEvent.CopyDataFrom(Pars[ind].CriticalEvent);
  CriticalEventType:=Pars[ind].ParType;

  evntO := Pars[ind].CriticalEventOverride;

  if evntO<>nil then
  begin
    if trimEX(evntO.Text.Text)<>'' then CriticalEvent.Text.Text:=evntO.Text.Text;
    if trimEX(evntO.Image.Text)<>'' then CriticalEvent.Image.Text:=evntO.Image.Text;
    if trimEX(evntO.Sound.Text)<>'' then CriticalEvent.Sound.Text:=evntO.Sound.Text;
    if trimEX(evntO.BGM.Text)<>'' then CriticalEvent.BGM.Text:=evntO.BGM.Text;
  end;

end;





procedure TTextQuest.StartQuest(startMoney:integer;useExtParams:boolean);
var
  i,no:integer;
begin
  if TQInterface = nil then exit;

  QTextWasChanged:=false;
  CriticalEvent.Clear;
  CriticalEventType:=NoCriticalParType;
  LastEvent:=nil;

  no:=-1;
  for i:=1 to LocationsValue do
    if Locations[i].StartLocationFlag then begin no:=Locations[i].LocationNumber; break; end;

  if no<0 then
  begin
    ShowMessage('Cant find starting location');
    exit;
  end;

  for i:=1 to ParsValue do
  begin
    if not Pars[i].Enabled then continue;
    Pars[i].Hidden:=false;
    Pars[i].CriticalEventOverride:=nil;
    if Pars[i].Money and (startMoney>=0) then Pars[i].value:=startMoney
    else if useExtParams and (PosEX('ext_',Pars[i].Name.Text)=1) then continue
    else if Pars[i].DiapStartValues.count>0 then Pars[i].value:=trunc(Pars[i].DiapStartValues.GetRandom);
  end;

  for i:=1 to LocationsValue do Locations[i].VisitsMade:=0;
  ClearLocationDescriptionOrders;

  for i:=1 to PathesValue do Pathes[i].PassesMade:=0;

  EnterLocation(no);

end;

procedure TTextQuest.EnterLocation(locNum:integer);
var loc,locTo:TLocation;
    temp,temp1:widestring;
    i,j,ind:integer;
    critical:boolean;
    allCandidates,sameCandidates,finalAnswers:TList;
    path,path2:TPath;
    locOpen:boolean;
    maxProbability,probabilitySum,roll:double;
    ev:TEvent;
begin
  if TQInterface = nil then exit;

  loc:=Locations[GetLocationIndex(locNum)];

  if QTextWasChanged and not loc.VoidLocation then
  begin
    QTextWasChanged:=false;
    TQInterface.AddAnswerContinueToLocation(locNum);
    exit;
  end;

  loc.ApplyDelta(ParsList);

  if loc.DaysCost>0 then TQInterface.TimePasses(loc.DaysCost);

  inc(loc.VisitsMade);

  temp1:='';

  ShowParams;

  critical := CheckCriticals();

  ev:=loc.FindLocationDescription(ParsList);

  if (ev<>nil) and not(QTextWasChanged and loc.VoidLocation) then
  begin
    ProcessEvent(ev);
    if (trimEX(ev.Text.Text)<>'') then CurTextSource:='Location '+inttostrEC(loc.LocationNumber);
  end;

  if critical then
  begin
    if QTextWasChanged then TQInterface.AddAnswerContinueCritical()
    else ProcessCriticalEvent();
    exit;
  end;

  if loc.EndLocationFlag then TQInterface.AddAnswerWin
  else if loc.PlayerDeath then TQInterface.AddAnswerDeath
  else if loc.FailLocationFlag then TQInterface.AddAnswerLose
  else
  begin
    allCandidates:=TList.Create;
    sameCandidates:=TList.Create;
    finalAnswers:=TList.Create;
    for i:=1 to PathesValue do
    begin
      path:=Pathes[i];
      if path.FromLocation <> loc.LocationNumber then continue;

      if (path.PassesAllowed>0) and (path.PassesMade>=path.PassesAllowed) then continue;

      locOpen:=false;
      for j:=1 to LocationsValue do
      begin
        locTo:=Locations[j];
        if path.ToLocation <> locTo.LocationNumber then continue;
        locOpen:=(locTo.VisitsAllowed=0) or (locTo.VisitsAllowed>locTo.VisitsMade);
        break;
      end;
      if not locOpen then continue;

      path.CheckIfOpen(ParsList);

      if (not path.IsOpen) and not(path.AlwaysShowWhenPlaying and (trimEX(path.StartPathMessage.Text)<>'')) then continue;
      allCandidates.Add(path);
    end;

    while allCandidates.Count>0 do
    begin
      path:=allCandidates.Items[0];
      temp1:=FixStringValueParameters(trimEX(path.StartPathMessage.Text),false);
      sameCandidates.Add(path);
      allCandidates.Delete(0);
      for i:=allCandidates.Count-1 downto 0 do
      begin
        path:=allCandidates.Items[i];
        if temp1 = FixStringValueParameters(trimEX(path.StartPathMessage.Text),false) then
        begin
          allCandidates.Delete(i);
          if (not path.IsOpen) and (sameCandidates.Count>0) then continue;
          sameCandidates.Add(path);
          if sameCandidates.Count<=1 then continue;
          path:=sameCandidates.Items[0];
          if not path.IsOpen then sameCandidates.Delete(0);
        end;
      end;

      maxProbability:=0;
      for i:=0 to sameCandidates.Count-1 do
      begin
        path:=sameCandidates.Items[i];
        if maxProbability < path.Probability then maxProbability:=path.Probability;
      end;

      if sameCandidates.Count = 1 then
      begin
        if maxProbability >= random then
          finalAnswers.Add(sameCandidates.Items[0]);
      end else begin
        for i:=sameCandidates.Count-1 downto 0 do
        begin
          path:=sameCandidates.Items[i];
          if path.Probability <= 0.01 * maxProbability then sameCandidates.Delete(i);
        end;
        probabilitySum:=0;
        for i:=0 to sameCandidates.Count-1 do
        begin
          path:=sameCandidates.Items[i];
          probabilitySum:=probabilitySum+path.Probability;
        end;
        roll:=probabilitySum*random;
        ind:=sameCandidates.Count-1;
        for i:=0 to sameCandidates.Count-1 do
        begin
          path:=sameCandidates.Items[i];
          if path.Probability > roll then
          begin
            ind:=i;
            break;
          end;
          roll:=roll-path.Probability;
        end;
        finalAnswers.Add(sameCandidates.Items[ind]);
      end;
      sameCandidates.Clear;
    end;

    if finalAnswers.Count = 0 then
    begin
      finalAnswers.Free;
      sameCandidates.Free;
      allCandidates.Free;
      ShowMessage('No available answers');
      exit;
    end;

    if (finalAnswers.Count = 1) then
    begin
      path:=finalAnswers.Items[0];
      if trimEX(path.StartPathMessage.Text) = '' then
      begin
        finalAnswers.Free;
        sameCandidates.Free;
        allCandidates.Free;
        SelectPath(path.PathNumber);
        exit;
      end;
    end;

    for i:=1 to 2*finalAnswers.Count do
    begin
      ind:=random(finalAnswers.Count);
      path:=finalAnswers.Items[ind];
      j:=random(finalAnswers.Count);
      finalAnswers.Items[ind]:=finalAnswers.Items[j];
      finalAnswers.Items[j]:=path;
    end;
    for i:=2 to finalAnswers.Count do
      for j:=0 to finalAnswers.Count-i do
      begin
        path:=finalAnswers.Items[j];
        path2:=finalAnswers.Items[j+1];
        if path.ShowOrder <= path2.ShowOrder then continue;
        finalAnswers.Items[j]:=path2;
        finalAnswers.Items[j+1]:=path;
      end;

    for i:=0 to finalAnswers.Count-1 do
    begin
      path:=finalAnswers.Items[i];
      temp:=trimEX(path.StartPathMessage.Text);
      if temp = '' then continue;
      temp := FixStringValueParameters(temp,true);
      if path.IsOpen then TQInterface.AddAnswer(temp, path.PathNumber)
      else TQInterface.AddAnswerDisabled(temp);
    end;
    finalAnswers.Free;
    sameCandidates.Free;
    allCandidates.Free;
    QTextWasChanged:=false;
  end;
end;

procedure TTextQuest.SelectPath(pathNum:integer);
var path:TPath;
    critical:boolean;
begin
  if TQInterface = nil then exit;

  path:=Pathes[GetPathIndex(pathNum)];

  if QTextWasChanged and (trimEX(path.EndPathEvent.Text.Text)<>'') then
  begin
    QTextWasChanged:=false;
    TQInterface.AddAnswerContinueToAnswer(pathNum);
    exit;
  end;

  path.ApplyDelta(ParsList);

  if path.dayscost > 0 then TQInterface.TimePasses(path.dayscost);

  inc(path.PassesMade);

  ShowParams;

  critical := CheckCriticals();

  ProcessEvent(path.EndPathEvent);
  CurTextSource:='Path '+inttostrEC(path.PathNumber);

  if critical then
  begin
    if QTextWasChanged then TQInterface.AddAnswerContinueCritical
    else ProcessCriticalEvent();
  end
  else EnterLocation(path.ToLocation);

end;

procedure TTextQuest.ProcessEvent(event:TEvent);
var tstr:WideString;
begin
  if TQInterface = nil then exit;

  if event=nil then exit;
  LastEvent:=event;

  tstr:=trimEX(event.Text.Text);

  if tstr<>'' then
  begin
    tstr:=FixStringValueParameters(tstr,true);
    TQInterface.SetText(tstr);
    QTextWasChanged:=true;
  end;

  if trimEX(event.Image.Text)<>'' then TQInterface.SetImage(trimEX(event.Image.Text));
  if trimEX(event.BGM.Text)<>'' then TQInterface.SetBGM(trimEX(event.BGM.Text));
  if trimEX(event.Sound.Text)<>'' then TQInterface.PlaySound(trimEX(event.Sound.Text));

end;


procedure TTextQuest.ProcessCriticalEvent;
begin
  if TQInterface = nil then exit;
  ProcessEvent(CriticalEvent);
  CurTextSource:='Critical param value';

  case CriticalEventType of
    //NoCriticalParType: exit;
    FailParType: TQInterface.AddAnswerLose;
    SuccessParType: TQInterface.AddAnswerWin;
    DeathParType: TQInterface.AddAnswerDeath;
  end;

end;


procedure TTextQuest.ShowParams;
var temp,temp1:WideString;
    i:integer;
begin
  if TQInterface = nil then exit;

  temp1:='';

  for i:=1 to ParsValue do
  begin
    if not Pars[i].Enabled then continue;
    if Pars[i].Hidden then continue;
    if (Pars[i].value=0) and not Pars[i].ShowIfZero then continue;
    temp:=Pars[i].GetVFStringByValue(Pars[i].value);
    temp:=StringReplaceEC(temp,'<>',IntToStrEC(Pars[i].value));
    temp1:=temp1+temp+#13#10;
  end;
  temp1:=FixStringValueParameters(temp1,true);
  TQInterface.SetParameters(temp1);
end;


end.
