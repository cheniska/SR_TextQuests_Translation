unit CalcParseClass;

interface

uses Classes,EC_Struct,ParameterClass,CPVarClass;

Type TCalcParse=class(TObjectEx)
public
	  orig_str:WideString;
    internal_str:WideString;
    answer:integer;
    currparnum:integer;
    default_expression:boolean;
    sym_warning:boolean;
    parentheses_error:boolean;
    num_error:boolean;
    parameters_error:boolean;
    diapazone_error:boolean;
    calc_error:boolean;
    error:boolean;

    Constructor Create();
    procedure Clear();
    function  InsertParValues(const values:TList):WideString;
    procedure AssignAndPreprocess(str:WideString; currparnum:integer);
    procedure Parse(const values:TList);
    function  Calc(expr:WideString):TCPVariant;

    function CheckParentheses(const s:WideString; startpos,endpos:integer):boolean; overload;
    function CheckSParentheses(const s:WideString; startpos,endpos:integer):boolean;
    function CheckParentheses(const s:WideString):boolean; overload;
    function FindOperation(const s:WideString; len:integer):integer;
    function GetOperationOrder(op:WideChar):integer;

    function FixOp(const str:WideString):WideString;
    function FixSeparate(const str:WideString):WideString;
    function FixLitNorm(str:WideString):WideString;
    function FixLitDP(str:WideString):WideString;
    function FixLitD(str:WideString):WideString;
    function FixLitP(str:WideString):WideString;
    function FixNum(str:WideString):WideString;
    function FixFinal(str:WideString):WideString;

    procedure OpPower(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpAdd(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpSub(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpMul(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpPercentInc(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpDiv(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpDivTrunc(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpMod(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpIn(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpTo(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpLo(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpHi(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpLoEq(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpHiEq(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpEq(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpNotEq(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpAnd(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpOr(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);

    function ConvertToInternal(var str:WideString):WideString;
    function ConvertToExternal(var str:WideString):WideString;
end;

implementation

uses SysUtils, CPDiapClass, EC_Str, Math{, Dialogs};

procedure TCalcParse.OpPower(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
var l,r:integer;
    le,re:extended;
begin
	result.Clear;
  result.vtype:=ext;
  if (left.vtype = ext) and (right.vtype = ext) then result.vf:=sign(left.GetValue)*power(abs(left.GetValue),right.GetValue)
  else if left.vtype = ext then                      result.vf:=sign(left.GetValue)*IntPower(abs(left.GetValue),right.GetIntValue)
  else if right.vtype = ext then                     begin l:=left.GetIntValue; result.vf:=sign(l)*power(abs(l),right.GetValue); end
  else begin
    result.vtype:=int;
    l:=left.GetIntValue;
    r:=right.GetIntValue;
    le:=l;re:=r;
    if power(abs(le),re) > 2000000000 then result.vi:=sign(l)*2000000000
    else result.vi:=sign(l)*round(IntPower(abs(l),r));
  end;
end;

procedure TCalcParse.OpAdd(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
var l,r:integer;
    le,re:extended;
begin
	result.Clear;
  result.vtype:=ext;
  if (left.vtype = ext) and (right.vtype = ext) then result.vf:=left.GetValue + right.GetValue
  else if left.vtype = ext then                      result.vf:=left.GetValue + right.GetIntValue
  else if right.vtype = ext then                     result.vf:=left.GetIntValue + right.GetValue
  else begin
    result.vtype:=int;
    l:=left.GetIntValue;
    r:=right.GetIntValue;
    le:=l;re:=r;
    if (le + re) > 2000000000 then result.vi:=2000000000
    else if (le + re) < -2000000000 then result.vi:=-2000000000
    else result.vi:=l + r;
  end;
end;

procedure TCalcParse.OpSub(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
var l,r:integer;
    le,re:extended;
begin
	result.Clear;
  result.vtype:=ext;
  if (left.vtype = ext) and (right.vtype = ext) then result.vf:=left.GetValue - right.GetValue
  else if left.vtype = ext then                      result.vf:=left.GetValue - right.GetIntValue
  else if right.vtype = ext then                     result.vf:=left.GetIntValue - right.GetValue
  else begin
    result.vtype:=int;
    l:=left.GetIntValue;
    r:=right.GetIntValue;
    le:=l;re:=r;
    if (le - re) > 2000000000 then result.vi:=2000000000
    else if (le - re) < -2000000000 then result.vi:=-2000000000
    else result.vi:=l - r;
  end;
end;

procedure TCalcParse.OpMul(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
var l,r:integer;
    le,re:extended;
begin
	result.Clear;
  result.vtype:=ext;
  if (left.vtype = ext) and (right.vtype = ext) then result.vf:=left.GetValue * right.GetValue
  else if left.vtype = ext then                      result.vf:=left.GetValue * right.GetIntValue
  else if right.vtype = ext then                     result.vf:=left.GetIntValue * right.GetValue
  else begin
    result.vtype:=int;
    l:=left.GetIntValue;
    r:=right.GetIntValue;
    le:=l;re:=r;
    if (le * re) > 2000000000 then result.vi:=2000000000
    else if (le * re) < -2000000000 then result.vi:=-2000000000
    else result.vi:=l * r;
  end;
end;

procedure TCalcParse.OpPercentInc(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
begin
	result.Clear;
  result.vtype:=ext;
  result.vf:=left.GetValue * (1 + 0.01 * right.GetValue);
end;

procedure TCalcParse.OpDiv(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
var li,ri:integer;
    l,r:extended;
begin
	result.Clear;

  if (left.vtype <> ext) and (right.vtype <> ext) then
  begin
    li:=left.GetIntValue;
    ri:=right.GetIntValue;
    if ri = 0 then
    begin
      result.vtype:=int;
      if (li<0) then result.vi:=-2000000000 else result.vi:=2000000000;
    end
    else if (li mod ri) = 0 then
    begin
      result.vtype:=int;
      result.vi:=li div ri;
    end
    else
    begin
      try
    		result.vtype:=ext;
        result.vf:=li/ri;
    	except
        	on EDivByZero do begin
//        	calc_error:=true;
        	end;
    	end;
    end;
    exit;
  end;


  l:=left.GetValue;
  r:=right.GetValue;
    if r=0 then
    begin
    	if (l<0) then  result.vf:=-2000000000 else result.vf:=2000000000;
    end else begin
    	try
    		result.vtype:=ext;
        result.vf:=l/r;
    	except
        	on EDivByZero do begin
//        	calc_error:=true;
        	end;
    	end;
    end;
end;

procedure TCalcParse.OpDivTrunc(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
var li,ri:integer;
    l,r:extended;
begin
  result.Clear;
  result.vtype:=int;

  if (left.vtype <> ext) and (right.vtype <> ext) then
  begin
    li:=left.GetIntValue;
    ri:=right.GetIntValue;
    if ri = 0 then
    begin
      if (li<0) then result.vi:=-2000000000 else result.vi:=2000000000;
    end
    else
    begin
      result.vi:=li div ri;
    end;
    exit;
  end;


  l:=left.GetValue;
  r:=right.GetValue;
    if r=0 then
    begin
    	if (l<0) then  result.vf:=-2000000000 else result.vf:=2000000000;
    end else begin
    	try
        result.vi:=trunc(l/r);
    	except
        	on EDivByZero do begin
//        	calc_error:=true;
        	end;
    	end;
    end;
end;


procedure TCalcParse.OpMod(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
var l,r:extended;
  li,ri:integer;
	lisdegreezero:boolean;
begin
  result.Clear;
  lisdegreezero:=false;

  if (left.vtype <> ext) and (right.vtype <> ext) then
  begin
    li:=left.GetIntValue;
    ri:=right.GetIntValue;
    result.vtype:=int;
    lisdegreezero:=(li<0);
    if ri = 0 then
    begin
      if lisdegreezero then result.vi:=-2000000000 else result.vi:=2000000000;
    end
    else
    begin
      result.vi:=abs(li) mod abs(ri);
      if lisdegreezero then result.vi:=result.vi*(-1);
    end;
    exit;
  end;

  l:=left.GetValue;
  r:=trunc(right.GetValue);
    if r=0 then
    begin
    	if (l<0) then  result.vf:=-2000000000 else result.vf:=2000000000;
    end else begin
    	try
        if r<0 then r:=(-1)*r;
        if l<0 then begin l:=(-1)*l; lisdegreezero:=true; end;
        result.vtype:=ext;
        result.vf:=trunc(l - r*trunc(l/r));
        if lisdegreezero then result.vf:=result.vf*(-1);
    	except
        	on EDivByZero do begin
//        	calc_error:=true;
        	end;
    	end;
    end;
end;

procedure TCalcParse.OpTo(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
var min,max:int64;
begin
	result.Clear;
    max:=0; min:=0;
    if left.vtype=ext then min:=round(left.vf)
    else if left.vtype=int then min:=left.vi
    else if left.vtype=diap then min:=left.vd.GetMinimum;

    if right.vtype=ext then max:=round(right.vf)
    else if right.vtype=int then max:=right.vi
    else if right.vtype=diap then max:=right.vd.GetMaximum;

    result.vtype:=diap;
    result.vd.Add(min,max);
end;

procedure TCalcParse.OpIn(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
begin
	result.Clear;
  result.vtype:=int;

    if (left.vtype<>diap)and(right.vtype<>diap) then
    begin
    	if left.GetValue=right.GetValue then result.vi:=1 else result.vi:=0;
      exit;
    end;

    if ((left.vtype=diap)and(right.vtype<>diap)) then
    begin
 		  if left.vd.Have(right.GetValue) then result.vi:=1 else result.vi:=0;
      exit;
    end;

    if ((left.vtype<>diap)and(right.vtype=diap)) then
    begin
 		  if right.vd.Have(left.GetValue) then result.vi:=1 else result.vi:=0;
      exit;
    end;

    if ((left.vtype=diap)and(right.vtype=diap)) then
    begin
      if right.vd.Have(left.GetIntValue) then result.vi:=1 else result.vi:=0;
      exit;
    end;
end;

procedure TCalcParse.OpLo(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
begin
	result.Clear;
  result.vtype:=int;

  if left.GetValue<right.GetValue then result.vi:=1 else result.vi:=0;

end;

procedure TCalcParse.OpHi(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
begin
	result.Clear;
  result.vtype:=int;

  if left.GetValue>right.GetValue then result.vi:=1 else result.vi:=0;
end;

procedure TCalcParse.OpLoEq(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
begin
	result.Clear;
  result.vtype:=int;

  if left.GetValue<=right.GetValue then result.vi:=1 else result.vi:=0;
end;

procedure TCalcParse.OpHiEq(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
begin
	result.Clear;
  result.vtype:=int;

  if left.GetValue>=right.GetValue then result.vi:=1 else result.vi:=0;
end;


procedure TCalcParse.OpEq(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
begin
	result.Clear;
  result.vtype:=int;

  if left.GetValue=right.GetValue then result.vi:=1 else result.vi:=0;
end;

procedure TCalcParse.OpNotEq(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
begin
	result.Clear;
  result.vtype:=int;

  if left.GetValue<>right.GetValue then result.vi:=1 else result.vi:=0;
end;

procedure TCalcParse.OpAnd(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
begin
	result.Clear;

  if (left.vtype<>diap) and (right.vtype>diap) then
  begin
		result.vtype:=int;
    if (left.GetValue<>0) and (right.GetValue<>0) then result.vi:=1 else result.vi:=0;
  end
  else if (left.vtype=diap) and (right.vtype=diap) then
  begin
		result.CopyDataFrom(left);
    result.vd.Add(right.vd);
  end
  else if (left.vtype<>diap)and(right.vtype=diap) then
  begin
		result.CopyDataFrom(right);
    if left.vtype = int then result.vd.Add(left.vi,left.vi)
    else result.vd.Add(left.vf);
  end
  else if (left.vtype=diap)and(right.vtype<>diap) then
  begin
		result.CopyDataFrom(left);
    if right.vtype = int then result.vd.Add(right.vi,right.vi)
    else result.vd.Add(right.vf);
  end;

end;

procedure TCalcParse.OpOr(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
begin
  if (left.vtype<>diap) and (right.vtype>diap) then
  begin
		result.vtype:=int;
    if (left.GetValue<>0) or (right.GetValue<>0) then result.vi:=1 else result.vi:=0;
  end
  else if (left.vtype=diap) and (right.vtype=diap) then
  begin
		result.CopyDataFrom(left);
    result.vd.Add(right.vd);
  end
  else if (left.vtype<>diap)and(right.vtype=diap) then
  begin
		result.CopyDataFrom(right);
    if left.vtype = int then result.vd.Add(left.vi,left.vi)
    else result.vd.Add(left.vf);
  end
  else if (left.vtype=diap)and(right.vtype<>diap) then
  begin
		result.CopyDataFrom(left);
    if right.vtype = int then result.vd.Add(right.vi,right.vi)
    else result.vd.Add(right.vf);
  end;
end;


//Перевести строку во внутренний формат
function TCalcParse.ConvertToInternal(var str:WideString):WideString;
var answer,tstr:WideString;
    i:integer;
begin
	tstr:=LowerCase(TrimEx(str));
    repeat
    	answer:=tstr;

   		tstr:=StringReplaceEC(tstr,'pct','%');
      tstr:=StringReplaceEC(tstr,'div','f');
   		tstr:=StringReplaceEC(tstr,'mod','g');
   		tstr:=StringReplaceEC(tstr,'in','#');
   		tstr:=StringReplaceEC(tstr,'to','$');
      tstr:=StringReplaceEC(tstr,'or','|');
      tstr:=StringReplaceEC(tstr,'and','&');
      tstr:=StringReplaceEC(tstr,'<>','e');
      tstr:=StringReplaceEC(tstr,'>=','c');
      tstr:=StringReplaceEC(tstr,'<=','b');
      tstr:=StringReplaceEC(tstr,'..','h');
      tstr:=StringReplaceEC(tstr,'.',',');
      //tstr:=StringReplaceEC(tstr,' ','');
		  tstr:=StringReplaceEC(tstr,'  ',' ');

   		tstr:=StringReplaceEC(tstr,'d','');
   		tstr:=StringReplaceEC(tstr,'m','');
   		tstr:=StringReplaceEC(tstr,'o','');
   		tstr:=StringReplaceEC(tstr,'t','');
   		tstr:=StringReplaceEC(tstr,'i','');
		  tstr:=StringReplaceEC(tstr,'a','');
		  tstr:=StringReplaceEC(tstr,'n','');

    until tstr=answer;

    repeat
    	answer:=tstr;

      i:=FindSubstring(tstr,' ', 0);
      while i>0 do
      begin
        if (FindSubstring('%fg#$|&ecbh*+/-()><=[]{}',tstr[i],0)<0) and (FindSubstring('%fg#$|&ecbh*+/-()><=[]{}',tstr[i+2],0)<0) then
        begin
          i:=FindSubstring(tstr,' ', i+1);
          continue;
        end;
        tstr:=CopyEC(tstr,1,i)+CopyEC(tstr,i+2,Length(tstr)-i-1);
        i:=FindSubstring(tstr,' ', i);
      end;

      
    until tstr=answer;

    ConvertToInternal:='('+answer+')';
end;

//Перевести строку в формат пользователя
function TCalcParse.ConvertToExternal(var str:WideString):WideString;
var answer,tstr,t:WideString;
    l,i:integer;
begin
	tstr:=LowerCase(str);
//    showmessage(tstr);


   		tstr:=StringReplaceEC(tstr,'$',' to ');
   		tstr:=StringReplaceEC(tstr,'#',' in ');
        tstr:=StringReplaceEC(tstr,'|',' or ');
        tstr:=StringReplaceEC(tstr,'&',' and ');
        tstr:=StringReplaceEC(tstr,'e','<>');
        tstr:=StringReplaceEC(tstr,'c','>=');
        tstr:=StringReplaceEC(tstr,'b','<=');
        tstr:=StringReplaceEC(tstr,'f',' div ');
        tstr:=StringReplaceEC(tstr,'g',' mod ');
        tstr:=StringReplaceEC(tstr,'h','..');
        tstr:=StringReplaceEC(tstr,'%',' pct ');

    repeat
    	answer:=tstr;
      tstr:=StringReplaceEC(tstr,'  ',' ');
      tstr:=StringReplaceEC(tstr,'(0-','(-');
    until tstr=answer;

    l:=length(tstr);
    t:='';
    if (l>=2) and (tstr[1]='(') and (tstr[l]=')') then begin
          for i:=2 to l-1 do t:=t+tstr[i];
          if CheckParentheses(tstr,2,l-1) then answer:=t;
    end;
    ConvertToExternal:=answer;
end;

//Вычислить приоритет операции
function TCalcParse.GetOperationOrder(op:WideChar):integer;
var answer:integer;
begin
	answer:=-1;
    case op of
      '^' : begin answer:=1; end;
    	'/' : begin answer:=1; end;
    	'f' : begin answer:=1; end;
    	'g' : begin answer:=1; end;
    	'*' : begin answer:=2; end;
      '%' : begin answer:=2; end;
    	'-' : begin answer:=3; end;
    	'+' : begin answer:=4; end;
    	'$' : begin answer:=5; end;
    	'#' : begin answer:=6; end;
    	'c' : begin answer:=7; end;
    	'b' : begin answer:=7; end;
    	'e' : begin answer:=7; end;
    	'>' : begin answer:=7; end;
    	'<' : begin answer:=7; end;
    	'=' : begin answer:=7; end;
    	'&' : begin answer:=8; end;
    	'|' : begin answer:=9; end;
    end;
	GetOperationOrder:=answer;
end;

//Находит в строке справа налево самый старшую по приоритету операцию
//и оставляет ее. Перед этим преобразованием проводится упрощение комбинации
//знаков + и -
function TCalcParse.FixOp(const str:WideString):WideString;
var i,c,q,l:integer;
	tstr:WideString;
begin
	l:=length(str);
    c:=0;
    q:=0;
    for i:=1 to l do begin
    	if str[i]='-' then inc(c);
    	if str[i]='+' then inc(q);
    end;
    tstr:=StringReplaceEC(str,'-','');
	tstr:=StringReplaceEC(tstr,'+','');
    if c mod 2 = 1 then begin
    	tstr:=tstr+'-';
    end else begin
    	if (q>0) or (c>0) then tstr:=tstr+'+';
    end;
    l:=length(tstr);
    c:=0;
    q:=0;
    for i:=l downto 1 do begin
    	if c<=GetOperationOrder(tstr[i]) then begin
        	q:=i;
            c:=GetOperationOrder(tstr[i]);
        end;
    end;
    FixOp:=tstr[q];
end;

// Вся строка делится на строки в [ ] и вне них
// для строк без [] вызывается FixLitNorm, а в [] FixLitDP
function TCalcParse.FixSeparate(const str:WideString):WideString;
var c,l:integer;
	tstr,answer:WideString;
    normalscan:boolean;
begin
	answer:='';
    c:=1;
    l:=length(str);
    tstr:='';
    normalscan:=true;
    while c<=l do begin
    	if normalscan then begin
    		if str[c]='[' then begin
            	answer:=answer+FixLitNorm(tstr);
                tstr:='[';
                normalscan:=false;
                inc(c);
                continue;
			end;
            if str[c]<>'[' then begin
            	tstr:=tstr+str[c];
                inc(c);
                if c>l then answer:=answer+FixLitNorm(tstr);
                continue;
            end;
        end;
        if not normalscan then begin
            if (c>l)or(str[c]=']') then begin
            	answer:=answer+FixLitDP(tstr+']');
                tstr:='';
                normalscan:=true;
            end else begin
                tstr:=tstr+str[c];
            end;
            inc(c);
        end;
    end;
  //  showmessage(answer);
    FixSeparate:=answer;
end;

//упрощаем конструкции, стоящие за скобками []
function TCalcParse.FixLitNorm(str:WideString):WideString;
var gstr,tstr, answer:WideString;
	c,l:integer;
begin
//Убираем заведомо ненужные символы

  gstr:='';
    l:=length(str);
    for c:=1 to l do begin
    	case str[c] of
            '^': ;
        	  '+': ;
            '-': ;
            '*': ;
            '/': ;
            '#': ;
            '%': ;
            '$': ;
            'c': ;
            'b': ;
            'e': ;
            'f': ;
            'g': ;
            '=': ;
            '>': ;
            '<': ;
            '&': ;
            '|': ;
            '0'..'9': ;
            ',': ;
            '(': ;
            ')': ;
            ' ': ;//////////////////////////
			else continue;
        end;
        gstr:=gstr+str[c];
    end;
    str:=gstr;

//Начинаем преобразование конструкций
    repeat
    	gstr:=str;
		tstr:=str;
	    repeat   //Скобки поглощают некоторые рядом стоящие символы
	    	str:=tstr;
	        tstr:=StringReplaceEC(tstr,')(',')*(');
	        //tstr:=StringReplaceEC(tstr,'()','');
	        tstr:=StringReplaceEC(tstr,'.',',');
	        tstr:=StringReplaceEC(tstr,',,',',');
	        tstr:=StringReplaceEC(tstr,'(,','(0,');
	        tstr:=StringReplaceEC(tstr,'),',')*0,');
	        tstr:=StringReplaceEC(tstr,')0',')*0');
	        tstr:=StringReplaceEC(tstr,')1',')*1');
	        tstr:=StringReplaceEC(tstr,')2',')*2');
	        tstr:=StringReplaceEC(tstr,')3',')*3');
	        tstr:=StringReplaceEC(tstr,')4',')*4');
	        tstr:=StringReplaceEC(tstr,')5',')*5');
	        tstr:=StringReplaceEC(tstr,')6',')*6');
	        tstr:=StringReplaceEC(tstr,')7',')*7');
	        tstr:=StringReplaceEC(tstr,')8',')*8');
	        tstr:=StringReplaceEC(tstr,')9',')*9');
	        tstr:=StringReplaceEC(tstr,',(',',*(');
	        tstr:=StringReplaceEC(tstr,'0(','0*(');
	        tstr:=StringReplaceEC(tstr,'1(','1*(');
	        tstr:=StringReplaceEC(tstr,'2(','2*(');
	        tstr:=StringReplaceEC(tstr,'3(','3*(');
	        tstr:=StringReplaceEC(tstr,'4(','4*(');
	        tstr:=StringReplaceEC(tstr,'5(','5*(');
	        tstr:=StringReplaceEC(tstr,'6(','6*(');
	        tstr:=StringReplaceEC(tstr,'7(','7*(');
			tstr:=StringReplaceEC(tstr,'8(','8*(');
	        tstr:=StringReplaceEC(tstr,'9(','9*(');
	    until str=tstr;

        //Упрощаем конструкции из рядом стоящих операций
		l:=length(str);
        tstr:='';
        answer:='';
        c:=1;
        while c<=l do begin
            if (GetOperationOrder(str[c])>0)and(c<=l) then begin
                tstr:='';
                while (GetOperationOrder(str[c])>0)and(c<=l) do begin
                    tstr:=tstr+str[c];
                    inc(c);
                end;
                answer:=answer+FixOp(tstr);
            end;
            if GetOperationOrder(str[c])<0 then begin
                tstr:='';
                while (GetOperationOrder(str[c])<0)and(c<=l) do begin
                    tstr:=tstr+str[c];
                    inc(c);
                end;
                answer:=answer+tstr;
            end;
        end;

 		str:=answer;
    	tstr:=str;
    	repeat   //Cнова скобки вносят преобразования
    		str:=tstr;
    		tstr:=StringReplaceEC(tstr,'(+','(');
    		tstr:=StringReplaceEC(tstr,'(*','(');
    		tstr:=StringReplaceEC(tstr,'(/','(');
    		tstr:=StringReplaceEC(tstr,'(&','(');
    		tstr:=StringReplaceEC(tstr,'(|','(');
    		tstr:=StringReplaceEC(tstr,'(#','(');
    		tstr:=StringReplaceEC(tstr,'($','(');
        tstr:=StringReplaceEC(tstr,'(%','(');
    		tstr:=StringReplaceEC(tstr,'(c','(');
    		tstr:=StringReplaceEC(tstr,'(b','(');
    		tstr:=StringReplaceEC(tstr,'(e','(');
    		tstr:=StringReplaceEC(tstr,'(f','(');
    		tstr:=StringReplaceEC(tstr,'(g','(');
    		tstr:=StringReplaceEC(tstr,'(<','(');
    		tstr:=StringReplaceEC(tstr,'(>','(');
    		tstr:=StringReplaceEC(tstr,'(=','(');
    		tstr:=StringReplaceEC(tstr,'-)',')');
    		tstr:=StringReplaceEC(tstr,'+)',')');
    		tstr:=StringReplaceEC(tstr,'*)',')');
    		tstr:=StringReplaceEC(tstr,'/)',')');
    		tstr:=StringReplaceEC(tstr,'&)',')');
        tstr:=StringReplaceEC(tstr,'%)',')');
    		tstr:=StringReplaceEC(tstr,'|)',')');
    		tstr:=StringReplaceEC(tstr,'$)',')');
    		tstr:=StringReplaceEC(tstr,'#)',')');
    		tstr:=StringReplaceEC(tstr,'c)',')');
    		tstr:=StringReplaceEC(tstr,'b)',')');
    		tstr:=StringReplaceEC(tstr,'e)',')');
    		tstr:=StringReplaceEC(tstr,'f)',')');
    		tstr:=StringReplaceEC(tstr,'g)',')');
    		tstr:=StringReplaceEC(tstr,'>)',')');
    		tstr:=StringReplaceEC(tstr,'<)',')');
    		tstr:=StringReplaceEC(tstr,'=)',')');
    		//tstr:=StringReplaceEC(tstr,'()','');
    		tstr:=StringReplaceEC(tstr,')(',')*(');
    	until str=tstr;
    until gstr=str; //если поменять больше нечего - получаем ответ
	FixLitNorm:=str;
end;

//упрощает и распознает диапазон или параметр
function TCalcParse.FixLitDP(str:WideString):WideString;
begin
   if StringReplaceEC(str,'p','')<>str then FixLitDP:=FixLitP(str)
   else FixLitDP:=FixLitD(str);
end;

//упрощает и распознает параметр
function TCalcParse.FixLitP(str:WideString):WideString;
var l,i:integer;
	tstr:WideString;
begin
    l:=length(str);
	tstr:='';
    for i:=1 to l do begin
    	if length(tstr)>2 then break;
		if (str[i]>='0')and(str[i]<='9') then begin
            tstr:=tstr+str[i];
        end;
    end;
    i:=StrToIntEC('0'+tstr);
    if i>0 then begin
        FixLitP:='[p'+IntToStrEC(i)+']';
    end else begin
    	FixLitP:='[err]';
		parameters_error:=true;
        error:=true;
    end;
end;

//упрощает и распознает диапазон
function TCalcParse.FixLitD(str:WideString):WideString;
var i,l:integer;
	tstr:WideString;
    d:TCPDiapazone;
begin
	tstr:='';
  l:=length(str);

	for i:=1 to l do
  begin
        case str[i] of
        	'0'..'9': ;
            '-': ;
            ';': ;
            'h': ;
            '[': continue;
            ']': continue;
        	  else //continue;
            begin
    	        FixLitD:='[err]';
		          diapazone_error:=true;
              error:=true;
              exit;
            end;
         end;
         tstr:=tstr+str[i];
  end;

    str:=';'+tstr+';';
    tstr:=str;
    repeat
    	str:=tstr;
        tstr:=StringReplaceEC(tstr,'--','');
        tstr:=StringReplaceEC(tstr,';;',';');
        tstr:=StringReplaceEC(tstr,'h;',';');
        tstr:=StringReplaceEC(tstr,';h',';');
        tstr:=StringReplaceEC(tstr,'-;',';');
        tstr:=StringReplaceEC(tstr,'-h','h');
        tstr:=StringReplaceEC(tstr,'hh','h');
    until str=tstr;

    if (tstr<>';')and(length(str)>0) then begin
        str[1]:='[';
        str[length(str)]:=']';
        d:=TCPDiapazone.Create;
		    d.Assign(str);
        str:=d.GetString;
        d.Destroy;
        FixLitD:=str;
    end else begin
    	FixLitD:='[err]';
		  diapazone_error:=true;
      error:=true;
    end;
end;

function TCalcParse.FixFinal(str:WideString):WideString;
	var tstr:WideString;
begin
	tstr:=str;
    repeat
    	str:=tstr;
		tstr:=StringReplaceEC(tstr,'-,','-0,');

    	tstr:=StringReplaceEC(tstr,')[',')*[');
		tstr:=StringReplaceEC(tstr,'](',']*(');
    	tstr:=StringReplaceEC(tstr,')(',')*(');
		tstr:=StringReplaceEC(tstr,'][',']*[');

		tstr:=StringReplaceEC(tstr,'],',']*0,');
		tstr:=StringReplaceEC(tstr,']0',']*0');
		tstr:=StringReplaceEC(tstr,']1',']*1');
		tstr:=StringReplaceEC(tstr,']2',']*2');
		tstr:=StringReplaceEC(tstr,']3',']*3');
		tstr:=StringReplaceEC(tstr,']4',']*4');
		tstr:=StringReplaceEC(tstr,']5',']*5');
		tstr:=StringReplaceEC(tstr,']6',']*6');
		tstr:=StringReplaceEC(tstr,']7',']*7');
		tstr:=StringReplaceEC(tstr,']8',']*8');
		tstr:=StringReplaceEC(tstr,']9',']*9');
   		tstr:=StringReplaceEC(tstr,',[',',*[');
   		tstr:=StringReplaceEC(tstr,'0[','0*[');
   		tstr:=StringReplaceEC(tstr,'1[','1*[');
   		tstr:=StringReplaceEC(tstr,'2[','2*[');
   		tstr:=StringReplaceEC(tstr,'3[','3*[');
   		tstr:=StringReplaceEC(tstr,'4[','4*[');
   		tstr:=StringReplaceEC(tstr,'5[','5*[');
   		tstr:=StringReplaceEC(tstr,'6[','6*[');
   		tstr:=StringReplaceEC(tstr,'7[','7*[');
   		tstr:=StringReplaceEC(tstr,'8[','8*[');
   		tstr:=StringReplaceEC(tstr,'9[','9*[');
    until str=tstr;
    FixFinal:=str;
end;

//Находит в строке самую младшую по приоритету операцию, стоящую вне скобок
function TCalcParse.FindOperation(const s:WideString; len:integer):integer;
var newoporder,oporder,pos,i:integer;
	spcount,pcount:integer;
begin
	//!! Проверено: 100/10/10 - вычисляется правильно 100/10=10, 10/10=1
    //!! КАК и договаривались с Димой
	oporder:=0;
    pos:=0;
    spcount:=0;
    pcount:=0;
	for	i:=1 to len do begin
    	if s[i]='(' then inc(pcount);
    	if s[i]='[' then inc(spcount);
    	if s[i]=')' then dec(pcount);
    	if s[i]=']' then dec(spcount);
        if (pcount=0) and (spcount=0) then begin
            newoporder:=GetOperationOrder(s[i]);
			if (oporder<=newoporder) then begin
				oporder:=newoporder;
            	pos:=i;
            end;
        end
    end;
    FindOperation:=pos;
end;

function TCalcParse.Calc(expr:WideString):TCPVariant;
label finalize;
var lenexpr:integer;
	t,left,right:WideString;
    i,c:integer;
    lf,rf,af:TCPVariant;
begin

  af:=TCPVariant.Create;
	lf:=TCPVariant.Create;
	rf:=TCPVariant.Create;
	if not calc_error then
  begin
      lenexpr:=length(expr);
    	if af.Assign(expr) then goto finalize;

      if (((expr[1]='(')and(expr[lenexpr]=')'))and(CheckParentheses(expr,2,lenexpr-1))) then
      begin
        t:='';
        for i:=2 to lenexpr-1 do t:=t+expr[i];
        if length(t)=0 then
        begin
          error:=true;
          goto finalize;
        end;
        af.CopyDataFrom(Calc(t));

      end else begin
        c:=FindOperation(expr,lenexpr);
        if c<1 then begin calc_error:=true; goto finalize; end;
        left:='';
        for i:=1 to c-1 do left:=left+expr[i];
        right:='';
        for i:=c+1 to lenexpr do right:=right+expr[i];

        rf.CopyDataFrom(Calc(right));
        if calc_error then goto finalize;

        lf.CopyDataFrom(Calc(left));
        if calc_error then goto finalize;

                try
                	if expr[c]='^' then begin OpPower(lf,rf,af); end else
                  if expr[c]='+' then begin OpAdd(lf,rf,af); end else
                  if expr[c]='-' then begin OpSub(lf,rf,af); end else
                	if expr[c]='*' then begin OpMul(lf,rf,af); end else
                	if expr[c]='/' then begin OpDiv(lf,rf,af); end else
                	if expr[c]='f' then begin OpDivTrunc(lf,rf,af); end else
                	if expr[c]='g' then begin OpMod(lf,rf,af); end else
                  if expr[c]='%' then begin OpPercentInc(lf,rf,af); end else
                	if expr[c]='$' then begin OpTo(lf,rf,af); end else
                	if expr[c]='#' then begin OpIn(lf,rf,af); end else
                	if expr[c]='>' then begin OpHi(lf,rf,af); end else
                	if expr[c]='<' then begin OpLo(lf,rf,af); end else
                	if expr[c]='c' then begin OpHiEq(lf,rf,af); end else
                	if expr[c]='b' then begin OpLoEq(lf,rf,af); end else
                	if expr[c]='e' then begin OpNotEq(lf,rf,af); end else
                	if expr[c]='=' then begin OpEq(lf,rf,af); end else
                	if expr[c]='&' then begin OpAnd(lf,rf,af); end else
                	if expr[c]='|' then begin OpOr(lf,rf,af); end;
                except
              	  	on EMathError do
                    begin
                	    calc_error:=true;
                      error:=true;
                    end;
               	  	on EInvalidOp do
                    begin
                    	calc_error:=true;
                      error:=true;
                    end;
               	  	on EOverflow do
                    begin
                    	calc_error:=true;
                      error:=true;
                    end;
               	  	on EZeroDivide do
                    begin
                    	calc_error:=true;
                      error:=true;
                    end;
                end;
            end;
    end;

finalize:
    Calc:=TCPVariant.Create;
    Calc.CopyDataFrom(af);
    af.Destroy;
    rf.Destroy;
    lf.Destroy;
end;


procedure TCalcParse.Parse(const values:TList);
var af:TCPVariant;
begin
	af:=TCPVariant.Create;
    if error then exit;
   	af.CopyDataFrom(Calc('('+InsertParValues(values)+')'));

    try
      answer:=af.GetIntValue;
    except
    	on EInvalidOp do
      begin
        	calc_error:=true;
          error:=true;
          answer:=0;
      end;
    end;

    if calc_error then error:=true;
end;

procedure TCalcParse.AssignAndPreprocess(str:WideString; currparnum:integer);
var i,c:integer;
	tempstr:WideString;
begin
	Clear;
    orig_str:=str;
	  str:=ConvertToInternal(str);
    str:=FixSeparate(str);
    str:=FixFinal(str);
    str:=FixNum(str);
    parentheses_error:=not CheckParentheses(str);
    if parentheses_error then error:=true;

    tempstr:=str;
	if not error then begin
	    i:=length(str);
	    if ((i>=2)and(str[1]='(')and(str[i]=')')and CheckParentheses(str,2,i-1))then begin
			tempstr:='';
			for c:=2 to i-1 do tempstr:=tempstr+str[c];
        end;
    end;
    if orig_str<>ConvertToExternal(tempstr) then sym_warning:=true;

    if (str='') or (str='[p'+IntToStrEC(currparnum)+']') then begin
        default_expression:=true;
        str:='[p'+IntToStrEC(currparnum)+']';
    end;

    internal_str:=str;
end;

constructor TCalcParse.Create();
begin
  Clear();
end;

procedure TCalcParse.Clear();
begin
	orig_str:='';
    internal_str:='';
    answer:=0;
    currparnum:=0;
    sym_warning:=false;
    parentheses_error:=false;
    num_error:=false;
    parameters_error:=false;
	diapazone_error:=false;
    calc_error:=false;
	default_expression:=false;
    error:=false;
end;

//возвращает true если скобки расставлены верно
function TCalcParse.CheckParentheses(const s:WideString; startpos,endpos:integer):boolean;
var i,c:integer;
    answer:boolean;
begin
	i:=0;
    answer:=true;
    for c:=startpos to endpos do begin
        if s[c]='(' then inc(i);
        if s[c]=')' then dec(i);
        if i<0 then begin answer:=false; break; end;
    end;
    if i<>0 then answer:=false;
    CheckParentheses:=answer;
end;

function TCalcParse.CheckSParentheses(const s:WideString; startpos,endpos:integer):boolean;
var i,c:integer;
    answer:boolean;
begin
	i:=0;
    answer:=true;
    for c:=startpos to endpos do begin
        if s[c]='[' then inc(i);
        if s[c]=']' then dec(i);
        if i<0 then begin answer:=false; break; end;
    end;
    if i<>0 then answer:=false;
    CheckSParentheses:=answer;
end;

function TCalcParse.InsertParValues(const values:TList):WideString;
var i:integer;
	  tstr:WideString;
    par:TParameter;
begin
	tstr:=internal_str;
	for i:=1 to values.Count do
  begin
    par:=values[i-1];
    if par.value<0 then
    begin
			tstr:=StringReplaceEC(tstr,'[p'+IntToStrEC(i)+']','(0'+IntToStrEC(par.value)+')');
    end else begin
			tstr:=StringReplaceEC(tstr,'[p'+IntToStrEC(i)+']',IntToStrEC(par.value));
    end;
  end;
  InsertParValues:=tstr;
end;

function TCalcParse.CheckParentheses(const s:WideString):boolean;
var f:boolean;
begin
	f:=CheckParentheses(s,1,length(s));
//	if  f then showmessage(s+'  !! no error')
//	else showmessage(s+'  !!  error');
    CheckParentheses:=f;
end;


function TCalcParse.FixNum(str:WideString):WideString;
var i,c:integer;
	f:extended;
    s1:WideString;
    s,ss:string;
    oldDS:char;
begin
	i:=1;
  c:=length(str);
  s:='';
  s1:='';
  f:=0;
  while i<=c do
  begin
    if (((str[i]>='0') and (str[i]<='9')) or (str[i]=',')) then
    begin
      s:=s+str[i];
    end else begin
      if (s<>'') then
      begin
        oldDS:=DecimalSeparator;
        try
          DecimalSeparator:=',';
          f:=strtofloat(s);
          DecimalSeparator:=oldDS;
        except
          on EConvertError do
          begin
            error:=true;
            num_error:=true;
            DecimalSeparator:=oldDS;
            exit;
          end;
        end;
        if (f>999999999) then ss:='999999999'
        else if ((f<0.0001)and(f<>0)) then ss:='0.0001'
        else ss:=s;
        s1:=s1+ss+str[i];
        s:='';
      end
      else begin
				s1:=s1+str[i];
      end;
    end;
  inc(i);
  end;
  FixNum:=s1;
end;

end.

