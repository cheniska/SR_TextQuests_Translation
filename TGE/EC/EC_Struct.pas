unit EC_Struct;

interface

uses syncobjs;

type

TObjectExUnit = class(TObject)
    public
        FPrev:TObjectExUnit;
        FNext:TObjectExUnit;

        FCount:integer;
        FName:WideString;
        FNameParent:WideString;
        FMaxCount:integer;
        FAllCount:integer;
        FSize:integer;
    public
end;

TObjectExList = class(TObject)
    public
        FCS:TCriticalSection;
        FFirst:TObjectExUnit;
        FLast:TObjectExUnit;
    public
        constructor Create;
        destructor Destroy; override;

        function AddUnit:TObjectExUnit;
        procedure DelUnit(el:TObjectExUnit);
        function Add(classref:TClass):TObjectExUnit;

        function Find(const str:WideString):TObjectExUnit;

        procedure ExInc(classref:TClass);
        procedure ExDec(classref:TClass);

        procedure PrintToFile(const filename:WideString);
end;

TObjectEx = class(TObject)
    public
        {destructor }constructor Create;
        destructor Destroy; override;

        procedure ExInc;
        procedure ExDec;
end;

var
GObjectExList:TObjectExList;

implementation

uses EC_Mem,SysUtils;

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
constructor TObjectExList.Create;
begin
    inherited Create;
    FCS:=TCriticalSection.Create;
end;

destructor TObjectExList.Destroy;
begin
    while FFirst<>nil do DelUnit(FLast);
    FCS.Free;
    inherited Destroy;
end;

function TObjectExList.AddUnit:TObjectExUnit;
var
    el:TObjectExUnit;
begin
    el:=TObjectExUnit.Create;

    if FLast<>nil then FLast.FNext:=el;
    el.FPrev:=FLast;
    el.FNext:=nil;
    FLast:=el;
    if FFirst=nil then FFirst:=el;

    Result:=el;
end;

procedure TObjectExList.DelUnit(el:TObjectExUnit);
begin
	if el.FPrev<>nil then el.FPrev.FNext:=el.FNext;
	if el.FNext<>nil then el.FNext.FPrev:=el.FPrev;
	if FLast=el then FLast:=el.FPrev;
	if FFirst=el then FFirst:=el.FNext;

    el.Free;
end;

function TObjectExList.Add(classref:TClass):TObjectExUnit;
var
    el:TObjectExUnit;
begin
    el:=AddUnit;
    el.FName:=classref.ClassName;
    el.FCount:=0;
    el.FMaxCount:=0;
    el.FAllCount:=0;

    el.FNameParent:='';
    classref:=classref.ClassParent;
    while classref<>nil do begin
        if el.FNameParent<>'' then el.FNameParent:='.'+el.FNameParent;
        el.FNameParent:=classref.ClassName+el.FNameParent;
        classref:=classref.ClassParent;
    end;

    Result:=el;
end;

function TObjectExList.Find(const str:WideString):TObjectExUnit;
var
    el:TObjectExUnit;
begin
    el:=FFirst;
    while el<>nil do begin
        if el.FName=str then begin
            Result:=el;
            Exit;
        end;
        el:=el.FNext;
    end;
    Result:=nil;
end;

procedure TObjectExList.ExInc(classref:TClass);
var
    el:TObjectExUnit;
begin
    FCS.Enter;
    el:=Find(classref.ClassName);
    if el=nil then el:=Add(classref);
    inc(el.FCount);
    inc(el.FAllCount);
    if el.FCount>el.FMaxCount then
    begin
      el.FMaxCount:=el.FCount;
      //SFT(classref.ClassName+' new maximum: '+inttostr(el.FMaxCount));
    end;
    FCS.Leave;
end;

procedure TObjectExList.ExDec(classref:TClass);
var
    el:TObjectExUnit;
begin
    FCS.Enter;
    el:=Find(classref.ClassName);
    if el=nil then el:=Add(classref);
    //if el.FCount>el.FMaxCount then el.FMaxCount:=el.FCount;
    dec(el.FCount);
    FCS.Leave;
end;

procedure TObjectExList.PrintToFile(const filename:WideString);
var
    tf: TextFile;
    el:TObjectExUnit;
begin
    FCS.Enter;
    AssignFile(tf, filename);
    Rewrite(tf);

    Writeln(tf,'ClassParent' + #9 + 'Class' + #9 + 'Count' + #9 + 'MaxCount' + #9 + 'AllCount');

    el:=FFirst;
    while el<>nil do begin
        if el.FCount<>0 then Writeln(tf,Format('%s' + #9 + '%s' + #9 + '%d' + #9 + '%d' + #9 + '%d',[el.FNameParent,el.FName,el.FCount,el.FMaxCount,el.FAllCount]));
        el:=el.FNext;
    end;

    CloseFile(tf);
    FCS.Leave;
end;

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
var
  counterChecks: integer = 0;
const
  checkPeriod = 20;

constructor TObjectEx.Create;
begin
    inherited Create;

    inc(counterChecks);
    if counterChecks>=checkPeriod then
    begin
      //PrintMemWarning;
      counterChecks:=0;
    end;
    //ExInc;
end;

destructor TObjectEx.Destroy;
begin
    //ExDec;
    inherited Destroy;
end;

procedure TObjectEx.ExInc;
begin
    if GObjectExList=nil then GObjectExList:=TObjectExList.Create;
    GObjectExList.ExInc(ClassType);
end;

procedure TObjectEx.ExDec;
begin
    if GObjectExList=nil then GObjectExList:=TObjectExList.Create;
    GObjectExList.ExDec(ClassType);
end;

end.
