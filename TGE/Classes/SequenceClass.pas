unit SequenceClass;

interface

uses EC_Struct,Classes;

type

TSequence=class(TObjectEx)
  public
    StartsFromLocation:boolean;
    PassLimit:integer;
    Locations:TList;
    Pathes:TList;

    constructor Create();
    destructor Destroy(); override;

    procedure SetNewLimit(lim:integer);
    procedure CalcLimit;

    procedure AddLocation(obj:pointer);
    procedure AddPath(obj:pointer);
    procedure InsertPath(obj:pointer);

end;

implementation

uses PathClass,LocationClass;

constructor TSequence.Create();
begin
  inherited Create;
  Locations:=TList.Create;
  Pathes:=TList.Create;
  PassLimit:=0;
  StartsFromLocation:=false;
end;

destructor TSequence.Destroy();
var i:integer;
    loc:TLocation;
    path:TPath;
begin
  for i:=0 to Locations.Count-1 do
  begin
    loc:=Locations.Items[i];
    loc.OneWaySequence:=nil;
  end;
  for i:=0 to Pathes.Count-1 do
  begin
    path:=Pathes.Items[i];
    path.OneWaySequence:=nil;
  end;

  Locations.Clear; Locations.Free; Locations:=nil;
  Pathes.Clear; Pathes.Free; Pathes:=nil;

  inherited Destroy;
end;

procedure TSequence.SetNewLimit(lim:integer);
var i:integer;
    loc:TLocation;
    path:TPath;
begin
  PassLimit:=lim;
  for i:=0 to Locations.Count-1 do
  begin
    loc:=Locations.Items[i];
    loc.VisitsAllowed:=PassLimit;
  end;
  for i:=0 to Pathes.Count-1 do
  begin
    path:=Pathes.Items[i];
    path.PassesAllowed:=PassLimit;
  end;
end;

procedure TSequence.CalcLimit;
var i:integer;
    loc:TLocation;
    path:TPath;
begin
  PassLimit:=0;
  for i:=0 to Locations.Count-1 do
  begin
    loc:=Locations.Items[i];
    if loc.VisitsAllowed<=0 then continue;
    if (PassLimit=0) or (loc.VisitsAllowed<PassLimit) then PassLimit:=loc.VisitsAllowed;
  end;
  for i:=0 to Pathes.Count-1 do
  begin
    path:=Pathes.Items[i];
    if path.PassesAllowed<=0 then continue;
    if (PassLimit=0) or (path.PassesAllowed<PassLimit) then PassLimit:=path.PassesAllowed;
  end;
  SetNewLimit(PassLimit);
end;

procedure TSequence.AddLocation(obj:pointer);
var loc:TLocation;
begin
  loc:=obj;
  Locations.Add(obj);
  loc.OneWaySequence:=self;
end;

procedure TSequence.AddPath(obj:pointer);
var path:TPath;
begin
  path:=obj;
  Pathes.Add(obj);
  path.OneWaySequence:=self;
end;

procedure TSequence.InsertPath(obj:pointer);
var path:TPath;
begin
  path:=obj;
  Pathes.Insert(0,obj);
  path.OneWaySequence:=self;
end;

end.
