unit CPDiapClass;

interface

uses EC_Struct,EC_Buf,ValueListClass;

type TCPDiapazone=class(TObjectEx)
  low:array of int64;
  hi:array of int64;
  count:integer;

  constructor Create;
  destructor Destroy; override;
  procedure Clear;
  procedure Assign(str:WideString);
  function Preprocess(str:WideString):WideString;
  procedure Add(l:int64;h:int64); overload;
  procedure Add(f:extended); overload;
  procedure Add(var other:TCPDiapazone); overload;
  procedure CopyDataFrom(var source:TCPDiapazone); overload;
  procedure CopyDataFrom(var source:TValuesList); overload;
  function GetString:WideString;
  function GetExtString:WideString;
  function Have(f:extended):boolean;
  function GetRandom:integer;
  function GetMaximum:int64;
  function GetMinimum:int64;
  function IsEqualWith(var source:TCPDiapazone):boolean;
  procedure Load(Buf:TBufEC);
  procedure Save(Buf:TBufEC);
  procedure SaveExt(Buf:TBufEC);
end;

implementation

uses SysUtils,TextFieldClass, EC_Str;

constructor TCPDiapazone.Create;
begin
  inherited Create;
  Clear;
end;

destructor TCPDiapazone.Destroy;
begin
  Clear;
  inherited Destroy;
end;

procedure TCPDiapazone.Clear;
begin
  count:=0;
  SetLength(low,count);
  SetLength(hi,count);
end;

function TCPDiapazone.Preprocess(str:WideString):WideString;
var i,l:integer;
	  tstr:WideString;
begin
	tstr:='';
  l:=length(str);
	for i:=1 to l do
  begin
    case str[i] of
      '0'..'9': ;
      '-': ;
      ';': ;
      '.': ;
      else continue;
    end;
    tstr:=tstr+str[i];
  end;

  str:=';'+tstr+';';
  tstr:=str;
  repeat
    str:=tstr;
    tstr:=StringReplaceEC(tstr,'..','h');
    tstr:=StringReplaceEC(tstr,'--','');
    tstr:=StringReplaceEC(tstr,';;',';');
    tstr:=StringReplaceEC(tstr,'h;',';');
    tstr:=StringReplaceEC(tstr,';h',';');
    tstr:=StringReplaceEC(tstr,'-;',';');
    tstr:=StringReplaceEC(tstr,'-h','h');
    tstr:=StringReplaceEC(tstr,'hh','h');
  until str=tstr;

  if length(str)>=2 then
  begin
    if str[1]=';' then str[1]:=' ';
    if str[length(str)]=';' then str[length(str)]:=' ';
  end;
  Result:=trimEX(str);
end;


procedure TCPDiapazone.Load(Buf:TBufEC);
var txt:TTextField;
begin
	txt:=TTextField.Create;
  txt.Load(Buf);
 	Assign(txt.Text);
  txt.Destroy;
end;


procedure TCPDiapazone.Save(Buf:TBufEC);
var txt:TTextField;
begin
	txt:=TTextField.Create;
  txt.Text:=GetString;
  txt.Save(Buf);
  txt.Destroy;
end;

procedure TCPDiapazone.SaveExt(Buf:TBufEC);
var txt:TTextField;
begin
	txt:=TTextField.Create;
  txt.Text:=GetExtString;
  if Length(txt.Text)>0 then txt.Text:='['+txt.Text+']';
  txt.Save(Buf);
  txt.Destroy;
end;

function TCPDiapazone.GetMinimum:int64;
var i:integer;
begin
	Result:=low[0];
	for i:=0 to count-1 do if low[i]<=Result then Result:=low[i];
end;

function TCPDiapazone.GetMaximum:int64;
var i:integer;
begin
	Result:=hi[0];
	for i:=0 to count-1 do if hi[i]>=Result then Result:=hi[i];
end;

function TCPDiapazone.GetRandom:integer;
var i,c:integer;
    mh,ml:array of int64;
begin
  Result:=0;
  if count>0 then
  begin
		SetLength(mh,count);
		SetLength(ml,count);
    c:=0;
    for i:=0 to count-1 do
    begin
      ml[i]:=c;
      mh[i]:=ml[i]+(hi[i]-low[i]);
      c:=c+hi[i]-low[i]+1;
    end;
    c:=random(c);

    for i:=0 to count do
    begin
      if (c>=ml[i])and(c<=mh[i]) then
      begin
        Result:=random(hi[i]-low[i]+1)+low[i];
        exit;
      end;
    end;
  end;
end;

function TCPDiapazone.Have(f:extended):boolean;
var i:integer;
	  c:int64;
begin
	c:=round(f);
  Result:=true;
  for i:=0 to count-1 do
    if (low[i]<=c)and(hi[i]>=c) then exit;

  Result:=false;
end;

function TCPDiapazone.GetString:WideString;
var i:integer;
begin
	Result:='[';
  for i:=0 to count-1 do
  begin
    if low[i]=hi[i] then Result:=Result+IntToStrEC(low[i])
    else Result:=Result+IntToStrEC(low[i])+'h'+IntToStrEC(hi[i]);

    if i<count-1 then Result:=Result + ';'
    else Result:=Result+']';
  end;
end;

function TCPDiapazone.GetExtString:WideString;
var i:integer;
begin
	Result:='';
  for i:=0 to count-1 do
  begin
    if low[i]=hi[i] then Result:=Result+IntToStrEC(low[i])
    else Result:=Result+IntToStrEC(low[i])+'..'+IntToStrEC(hi[i]);

    if i<count-1 then Result:=Result+';'
    else Result:=Result+'';
  end;
end;


procedure TCPDiapazone.CopyDataFrom(var source:TValuesList);
var i:integer;
begin
  count:=source.count;
  SetLength(low,count);
  SetLength(hi,count);
  for i:=0 to count-1 do
  begin
    low[i]:=source.values[i+1];
    hi[i]:=source.values[i+1];
  end;
end;

function TCPDiapazone.IsEqualWith(var source:TCPDiapazone):boolean;
var i:integer;
begin
	Result:=false;
  if count<>source.count then exit;

  for i:=0 to count-1 do
    if (low[i]<>source.low[i]) or (hi[i]<>source.Hi[i]) then exit;

  Result:=true;
end;

procedure TCPDiapazone.CopyDataFrom(var source:TCPDiapazone);
var i:integer;
begin
  count:=source.count;
  SetLength(low,count);
  SetLength(hi,count);
  for i:=0 to count-1 do
  begin
    low[i]:=source.low[i];
    hi[i]:=source.hi[i];
  end;
end;

procedure TCPDiapazone.Add(var other:TCPDiapazone);
var i:integer;
begin
	if other.count>0 then
  begin
    SetLength(low,count+other.count);
    SetLength(hi,count+other.count);
    for i:=0 to other.count-1 do
    begin
      low[count+i]:=other.low[i];
      hi[count+i]:=other.hi[i];
    end;
    count:=count+other.count;
  end;
end;

procedure TCPDiapazone.Add(l:int64;h:int64);
var t:int64;
begin
	inc(count);
  SetLength(low,count);
  SetLength(hi,count);
  if l>h then
  begin
    t:=l;
    l:=h;
    h:=t
  end;
  low[count-1]:=l;
  hi[count-1]:=h;
end;

procedure TCPDiapazone.Add(f:extended);
var c:int64;
	  err:boolean;
begin
	c:=0;
  err:=false;
  
  try
    c:=trunc(f);
  except
    on EMathError do err:=true;
  end;

  if err then exit;
	inc(count);
  SetLength(low,count);
  SetLength(hi,count);
  low[count-1]:=c;
  hi[count-1]:=c;
end;

procedure TCPDiapazone.Assign(str:WideString);
var i,l:integer;
    c,slow,shi:int64;
    tstr,str0:WideString;
    ecjump:boolean;
begin
	Clear;
	l:=length(str);
  if str=';' then exit;
  str0:=StringReplaceEC(str,'..','h');
	i:=1;
  tstr:='';
  slow:=200000000;
  shi:=-200000000;
  ecjump:=false;
  while i<=l do
  begin
    if ((str0[i]>='0') and (str0[i]<='9')) or (str0[i]='-') then
    begin
      tstr:=tstr+str0[i];
      inc(i);
    end else begin
      if (str0[i]='h') or (str0[i]=';') or (str0[i]=']') then
      begin
        c:=0;
        try
          c:=StrToIntFullEC(tstr);
        except
          on EMathError do ecjump:=true;
          on EConvertError do ecjump:=true;
        end;

        if not ecjump then
        begin
          if slow>c then slow:=c;
          if shi<c then shi:=c;
        end;
				ecjump:=false;
        tstr:='';
        if ((str0[i]=';') or (str0[i]=']')) then
        begin
          Add(slow,shi);
					slow:=200000000;
					shi:=-200000000;
          tstr:='';
        end;
        inc(i);
        
      end else begin
        inc(i);
      end;

    end;
  end;
end;

end.
