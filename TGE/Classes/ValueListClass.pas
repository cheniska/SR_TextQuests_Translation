unit ValueListClass;

interface

uses EC_Struct,EC_Buf;

type TValuesList=class(TObjectEx)
  Negation:boolean;
  Values:array of integer;
  Count:integer;

  constructor Create;
  destructor Destroy; override;

  procedure Clear;
  procedure SetFromString(txt:WideString);
  function  GetString:WideString;

  function DelDeniedSymbols(txt:WideString):WideString;
       
  procedure CopyDataFrom(var source:TValuesList);
  function  IsEqualWith(var source:TValuesList):boolean;

  procedure Save(Buf:TBufEC);
  procedure Load(Buf:TBufEC);

  function  TestValue(parametervalue:integer):boolean;
  function  TestModZeroes(parametervalue:integer):boolean;
end;

implementation

uses EC_Str;

function TValuesList.DelDeniedSymbols(txt:WideString):WideString;
var
  i:integer;
  ttxt:WideString;
begin
  ttxt:='';
  for i:=1 to length(txt) do
    if ((txt[i]>='0') and (txt[i]<='9')) or (txt[i]=';') or (txt[i]=',') or (txt[i]='-') then ttxt:=ttxt+txt[i];


  Result:=ttxt;
  ttxt:='('+txt+')';
  repeat
    Result:=ttxt;
    ttxt:=StringReplaceEC(ttxt,',',';');
    ttxt:=StringReplaceEC(ttxt,';;',';');
    ttxt:=StringReplaceEC(ttxt,'-;',';');
    ttxt:=StringReplaceEC(ttxt,'--','');
    ttxt:=StringReplaceEC(ttxt,'(-;','(');
    ttxt:=StringReplaceEC(ttxt,'(-)','(');
    ttxt:=StringReplaceEC(ttxt,'(;','(');
    ttxt:=StringReplaceEC(ttxt,';-)',')');
    ttxt:=StringReplaceEC(ttxt,';)',')');
  until Result=ttxt;
  
  Result:=StringReplaceEC(Result,'(','');
  Result:=StringReplaceEC(Result,')','');
end;

constructor TValuesList.Create;
begin
  Inherited Create;
  Clear;
end;

destructor TValuesList.Destroy;
begin
    Values:=nil;
    inherited Destroy;
end;


procedure TValuesList.Save(Buf:TBufEC);
var
  i:integer;
begin
  Buf.AddInteger(count);
  Buf.AddBoolean(Negation);
  for i:=1 to count do Buf.AddInteger(values[i]);
end;

procedure TValuesList.Load(Buf:TBufEC);
var
  i:integer;
begin
  count:=Buf.GetInteger;
  Negation:=Buf.GetBoolean;
  SetLength(values,count+2);
  for i:=1 to count do values[i]:=Buf.GetInteger;
end;

function  TValuesList.IsEqualWith(var source:TValuesList):boolean;
var
  i:integer;
begin
  Result:=false;

  if count<>source.Count then exit;
  if Negation<>source.Negation then exit;

  for i:=1 to count do if values[i]<>source.Values[i] then exit;
  Result:=true;
end;

procedure TValuesList.CopyDataFrom(var source:TValuesList);
var
  i:integer;
begin
  count:=source.count;
  Negation:=source.Negation;
  SetLength(Values,count+2);
  for i:=1 to count do values[i]:=source.values[i];
end;

procedure TValuesList.Clear;
begin
  SetLength(values,1);
  Count:=0;
  Negation:=true;
end;

function TValuesList.GetString:WideString;
var
  i:integer;
begin
  Result:='';
  for i:=1 to count do
  begin
    if i<>count then Result:=Result+IntToStrEC(values[i])+';'
    else Result:=Result+IntToStrEC(values[i]);
  end;
end;

procedure TValuesList.SetFromString(txt:WideString);
var
  i:integer;
  tstr:WideString;
begin
  Clear;
  i:=1;
  count:=0;
  tstr:='';
  txt:=trimEX(DelDeniedSymbols(txt));
  if length(txt)=0 then exit;

  while(i<=length(txt)) do
  begin
    if (i=length(txt)) or (txt[i+1]=';') then inc(count);
    inc(i);
  end;
  setlength(values,count+2);

  count:=0;
  i:=0;
  while(i<=length(txt)) do
  begin
    if txt[i]<>';' then tstr:=tstr+txt[i];
    if (i=length(txt)) or (txt[i+1]=';') then
    begin
      inc(count);
      values[count]:=StrToIntFullEC(tstr);
      tstr:='';
    end;
    inc(i);
  end;
end;


function TValuesList.TestValue(parametervalue:integer):boolean;
var i:integer;
begin
  Result:=true;
  if Count=0 then exit;

  Result:=Negation;
  for i:=1 to Count do if Values[i]=parametervalue then exit;

  Result:=not Result;
end;

function TValuesList.TestModZeroes(parametervalue:integer):boolean;
var i:integer;
begin
  Result:=true;
  if Count=0 then exit;

  Result:=Negation;
  for i:=1 to Count do
    if (parametervalue mod Values[i])=0 then exit;

  Result:=not Result;
end;

end.

