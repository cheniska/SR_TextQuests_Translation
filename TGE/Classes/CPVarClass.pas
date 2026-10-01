unit CPVarClass;

interface

uses EC_Struct,CPDiapClass;

type TCPVType=(diap,ext,int);

type TCPVariant=class(TObjectEx)
	  vd:TCPDiapazone;
    vf:extended;
    vi:integer;
    vtype:TCPVType;

    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    procedure CopyDataFrom(source:TCPVariant; freesou:boolean = false);
    function Assign(str:WideString):boolean;
    function GetValue:extended;
    function GetIntValue:integer;
    function StrIsValue(var s:WideString; len:integer):boolean;
    function StrIsIntValue(var s:WideString; len:integer):boolean;

end;

implementation

uses EC_Str;

constructor TCPVariant.Create;
begin
  inherited Create;
 	vd:=TCPDiapazone.Create;
  Clear;
end;

destructor TCPVariant.Destroy;
begin
 	Clear;
  vd.Free;vd:=nil;
  inherited Destroy;
end;

procedure TCPVariant.Clear;
begin
  vf:=0;
  vi:=0;
  vd.Clear;
  vtype:=int;
end;

procedure TCPVariant.CopyDataFrom(source:TCPVariant; freesou:boolean);
begin
	vd.CopyDataFrom(source.vd);
  vf:=source.vf;
  vi:=source.vi;
  vtype:=source.vtype;

  if freesou then source.Free;
end;

function TCPVariant.Assign(str:WideString):boolean;
var i,l:integer;
begin
	Result:=false;
  l:=length(str);
  if l=0 then str:='0';
	if StrIsValue(str,l) then
  begin
    if StrIsIntValue(str,l) then
    begin
      vtype:=int;
      vd.Clear;
      vi:=strtointEC(str);
      vf:=0;
      Result:=true;
      exit;
    end;
    vtype:=ext;
    vd.Clear;
    vf:=strtofloatEC(str);
    vi:=0;
    Result:=true;
    exit;
  end;

  if (l>1) and (str[1]='[') and (str[l]=']') then
  begin
    for i:=1 to l do
    begin
      case str[i] of
        'h':;
        ';':;
        '[':;
        ']':;
        '0'..'9':;
        '-':;
        else exit;
      end
    end;
    vtype:=diap;
    vd.Assign(str);
    vf:=0;
    vi:=0;
    Result:=true;
  end;
end;

function TCPVariant.StrIsValue(var s:WideString; len:integer):boolean;
var i:integer;
begin
  Result:=false;
	for i:=1 to len do
    if not(((s[i]>='0') and (s[i]<='9')) or (s[i]=',') or (s[i]='E')) then exit;
  Result:=true;
end;

function TCPVariant.StrIsIntValue(var s:WideString; len:integer):boolean;
var i:integer;
begin
  Result:=false;
	for i:=1 to len do
    if not(((s[i]>='0') and (s[i]<='9')) or (s[i]='E')) then exit;
  Result:=true;
end;

function TCPVariant.GetValue:extended;
begin
  Result:=0;
	if vtype=diap then Result:=vd.GetRandom
	else if vtype=ext then Result:=vf
  else if vtype=int then Result:=vi;
end;

function TCPVariant.GetIntValue:integer;
begin
  Result:=0;
	if vtype=diap then Result:=vd.GetRandom
	else if vtype=ext then
  begin
    if (vf<-2000000000) then Result:=-2000000000
    else if (vf>2000000000) then Result:=2000000000
    else Result:=round(vf+0.00000000001);
  end
  else if vtype=int then Result:=vi;
end;


end.
