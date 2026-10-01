unit EC_Str;

interface

uses Windows, Classes, SysUtils, StrUtils;

function GetCountParEC(const str:WideString; const raz:WideString):integer;
function GetSmeParEC(const str:WideString; np:integer; const raz:WideString):integer; overload;
function GetSmeParEC(const str:WideString; np:integer; const raz:WideChar):integer; overload;
function GetSmeParNEEC(const str:WideString; np:integer; raz:WideChar):integer; overload;
function GetLenParEC(const str:WideString; smepar:integer; const raz:WideString):integer;
function GetStrParEC(const str:WideString; np:integer; const raz:WideString):WideString; overload;
function GetStrParEC(const str:WideString; nps,npe:integer; const raz:WideString):WideString; overload;
function ExtractStrParEC(var str:WideString; raz:WideChar):WideString; overload;

function GetComEC(const s:WideString):WideString;
function GetStrNoComEC(const s:WideString):WideString;

function IsIntEC(const str:WideString):boolean;
function StrToIntEC(const str:WideString):integer;
function StrToIntFullEC(const str:WideString):integer;
function StrToFloatEC(const str:WideString):single;
function StrToFloatExEC(const str:WideString):single;
function StrToFloatExtendedEC(const str:WideString):Extended;
function FloatToStrEC(zn:double):WideString;
function StringReplaceEC(const str:WideString; const sold:WideString; const snew:WideString):WideString;

function HexToStrEC(zn:DWORD):WideString;

function IntToStrEC(zn:integer):WideString;

function AddStrPar(const str,par:WideString):WideString;

function BooleanToStr(zn:boolean):WideString;

function StrToPoint(const tstr:WideString):TPoint;
function PointToStr(zn:TPoint):WideString;
function StrToRect(const tstr:WideString):TRect;
function RectToStr(zn:TRect):WideString;

function TrimEx(const tstr:WideString):WideString;

function TagSkipEC(tstr:PWideChar; tstrlen:integer):integer;
function TagIs(tstr:PWideChar; tstrlen:integer; const tagnamesmall:WideString; const tagnamelarge:WideString):boolean;
function TagDeleteEC(const tstr:WideString):WideString;
function TagDeleteByNameEC(tstr:WideString; const tagnamesmall:WideString; const tagnamelarge:WideString):WideString;

function ComparerStrEC(s1,s2:PWideChar):integer; cdecl;
function CmpStrFirstEC(const ssou,ssub:WideString):boolean;
function FindSubstring(const ssou,ssub:WideString; sme:integer=0):integer; // -1 not found
function PosEx(const Substr,Sour:WideString):integer; // 0 not found

function File_NameExt(const path:WideString):WideString;
function File_Name(const path:WideString):WideString;
function File_Ext(const path:WideString):WideString;
function File_Path(const path:WideString):WideString;
function File_IsExt(const tstr:WideString):boolean;

function CopyEC(Source : WideString; StartChar, Count : Integer):WideString;

procedure RegUser_SetFullString(pkey:HKEY; path:WideString; name:WideString; zn:WideString);

function FilePathWithoutExt(sPath: WideString):WideString;

type
TStringsElEC = class(TObject)
    FPrev:TStringsElEC;
    FNext:TStringsElEC;

    FStr:WideString;
    FData:DWORD;
end;

TStringsEC = class(TObject)
    protected
        FFirst:TStringsElEC;
        FLast:TStringsElEC;

        FPointer:TStringsElEC;
    public
        constructor Create;
        destructor Destroy; override;

        procedure CopyData(des:TStringsEC);

        procedure Clear;

    protected
        function El_Add: TStringsElEC; overload;
        procedure El_Add(el:TStringsElEC); overload;
        function El_Insert(perel:TStringsElEC): TStringsElEC; overload;
        procedure El_Insert(perel,el:TStringsElEC); overload;
        procedure El_Del(el:TStringsElEC);
        function El_Get(i:integer): TStringsElEC;
        function El_GetEx(i:integer): TStringsElEC;
    public
        function GetCount:integer;
        procedure SetCount(c:integer);
        property Count:integer read GetCount write SetCount;

        function GetItem(i:integer): WideString;
        procedure SetItem(i:integer; const zn:WideString);
        property Item[zn:integer]:WideString read GetItem write SetItem;
        property Strings[zn:integer]:WideString read GetItem write SetItem;

        function GetData(i:integer): DWORD; overload;
        procedure SetData(i:integer; zn:DWORD);
        property Data[zn:integer]:DWORD read GetData write SetData;

        function Find(const str:WideString):integer;

        procedure Add(const zn:WideString); overload;
        procedure Add(zn:PWideChar; len:integer); overload;
        procedure Insert(i:integer; const zn:WideString);
        procedure Delete(i:integer);

        function Get: WideString;
        function GetData: DWORD; overload;
        function GetInc: WideString;
        function GetDec: WideString;
        function TestEnd: boolean;
        function TestFirst: boolean;
        function TestLast: boolean;
        procedure PointerFirst;
        procedure PointerLast;
        procedure PointerNext;
        procedure PointerPrev;
        function PointerGet:integer;
        procedure PointerSet(i:integer);
        property Pointer:integer read PointerGet write PointerSet;

        function IsEmpty:boolean;

        procedure SetTextStr(const str:WideString);
        function GetTextStr:WideString;
        property Text:WideString read GetTextStr write SetTextStr;
end;

implementation

uses EC_Mem;

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
constructor TStringsEC.Create;
begin
    inherited Create;
end;

destructor TStringsEC.Destroy;
begin
    Clear;
    inherited Destroy;
end;

procedure TStringsEC.CopyData(des:TStringsEC);
var
    el:TStringsElEC;
begin
    des.Clear;
    el:=FFirst;
    while el<>nil do begin
        des.Add(el.FStr);
        el:=el.FNext;
    end;
end;

procedure TStringsEC.Clear;
begin
    while FFirst<>nil do El_Del(FLast);
    FPointer:=nil;
end;

function TStringsEC.El_Add: TStringsElEC;
var
    el:TStringsElEC;
begin
    el:=TStringsElEC.Create;
    El_Add(el);
    Result:=el;
end;

procedure TStringsEC.El_Add(el:TStringsElEC);
begin
    if FLast<>nil then FLast.FNext:=el;
	el.FPrev:=FLast;
	el.FNext:=nil;
	FLast:=el;
	if FFirst=nil then FFirst:=el;
end;

function TStringsEC.El_Insert(perel:TStringsElEC): TStringsElEC;
var
    el:TStringsElEC;
begin
    el:=TStringsElEC.Create;

    El_Insert(perel,el);

    Result:=el;
end;

procedure TStringsEC.El_Insert(perel,el:TStringsElEC);
begin
    if perel=nil then begin
        El_Add(el);
    end else begin
		el.FPrev:=perel.FPrev;
		el.FNext:=perel;
		if perel.FPrev<>nil then perel.FPrev.FNext:=el;
		perel.FPrev:=el;
		if perel=FFirst then FFirst:=el;
    end;
end;

procedure TStringsEC.El_Del(el:TStringsElEC);
begin
	if el.FPrev<>nil then el.FPrev.FNext:=el.FNext;
	if el.FNext<>nil then el.FNext.FPrev:=el.FPrev;
	if FLast=el then FLast:=el.FPrev;
	if FFirst=el then FFirst:=el.FNext;

    el.Free;
end;

function TStringsEC.El_Get(i:integer): TStringsElEC;
var
    el:TStringsElEC;
begin
    el:=FFirst;
    while el<>nil do begin
        if i=0 then begin
            Result:=el;
            Exit;
        end;
        Dec(i);
        el:=el.FNext;
    end;
    raise Exception.Create('TStringsEC.El_Get. i=' + IntToStr(i));
end;


function TStringsEC.El_GetEx(i:integer): TStringsElEC;
var
    el:TStringsElEC;
begin
    if i<0 then raise Exception.Create('TStringsEC.El_GetEx. i=' + IntToStr(i));
    el:=FFirst;
    while el<>nil do begin
        if i=0 then begin
            Result:=el;
            Exit;
        end;
        Dec(i);
        el:=el.FNext;
    end;
    while i>=0 do begin
        El_Add;
        Dec(i);
    end;
    Result:=FLast;
end;

function TStringsEC.GetCount:integer;
var
    el:TStringsElEC;
begin
    el:=FFirst;
    Result:=0;
    while el<>nil do begin
        Inc(Result);
        el:=el.FNext;
    end;
end;

procedure TStringsEC.SetCount(c:integer);
var
    cc,i:integer;
begin
    if c<=0 then begin
        Clear;
        Exit;
    end;
    cc:=c-Count;
    if cc>0 then begin
        for i:=0 to cc-1 do El_Add;
    end else begin
        for i:=0 to cc-1 do begin
            if FLast=FPointer then FPointer:=FPointer.FPrev;
            El_Del(FLast);
        end;
    end;
end;

function TStringsEC.GetItem(i:integer): WideString;
begin
    Result:=El_GetEx(i).FStr;
end;

procedure TStringsEC.SetItem(i:integer; const zn:WideString);
begin
    El_GetEx(i).FStr:=zn;
end;

function TStringsEC.GetData(i:integer): DWORD;
begin
    Result:=El_GetEx(i).FData;
end;

procedure TStringsEC.SetData(i:integer; zn:DWORD);
begin
    El_GetEx(i).FData:=zn;
end;

function TStringsEC.Find(const str:WideString):integer;
var
    el:TStringsElEC;
    i:integer;
begin
    el:=FFirst;
    i:=0;
    while el<>nil do begin
        if el.FStr=str then begin Result:=i; Exit; end;
        inc(i);
        el:=el.FNext;
    end;
    Result:=-1;
end;

procedure TStringsEC.Add(const zn:WideString);
begin
    El_Add.FStr:=zn;
end;

procedure TStringsEC.Add(zn:PWideChar; len:integer);
var
    el:TStringsElEC;
begin
    el:=El_Add;
    if len>0 then begin
        SetLength(el.FStr,len);
        CopyMemory(PWideChar(el.FStr),zn,len*2);
//        el.FStr[len+1]:=#0;
    end;
end;

procedure TStringsEC.Insert(i:integer; const zn:WideString);
begin
    if (i<0) or (i>=Count) then begin
        Add(zn);
    end else begin
        El_Insert(El_Get(i)).FStr:=zn;
    end;
end;

procedure TStringsEC.Delete(i:integer);
var
    el:TStringsElEC;
begin
    el:=El_Get(i);
    if el=FPointer then begin
        FPointer:=el.FNext;
        if FPointer=nil then FPointer:=el.FPrev;
    end;
    El_Del(el);
end;

function TStringsEC.Get: WideString;
begin
    if FPointer=nil then raise Exception.Create('TStringsEC.Get.');

    Result:=FPointer.FStr;
end;

function TStringsEC.GetData: DWORD;
begin
    if FPointer=nil then raise Exception.Create('TStringsEC.GetData.');

    Result:=FPointer.FData;
end;

function TStringsEC.GetInc: WideString;
begin
    if FPointer=nil then raise Exception.Create('TStringsEC.Get.');

    Result:=FPointer.FStr;

    FPointer:=FPointer.FNext;
end;

function TStringsEC.GetDec: WideString;
begin
    if FPointer=nil then raise Exception.Create('TStringsEC.Get.');

    Result:=FPointer.FStr;

    FPointer:=FPointer.FPrev;
end;

function TStringsEC.TestEnd: boolean;
begin
    if FPointer<>nil then Result:=false else Result:=true;
end;

function TStringsEC.TestFirst: boolean;
begin
    if FPointer.FPrev<>nil then Result:=false else Result:=true;
end;

function TStringsEC.TestLast: boolean;
begin
    if FPointer.FNext<>nil then Result:=false else Result:=true;
end;

procedure TStringsEC.PointerFirst;
begin
    FPointer:=FFirst;
end;

procedure TStringsEC.PointerLast;
begin
    FPointer:=FLast;
end;

procedure TStringsEC.PointerNext;
begin
    FPointer:=FPointer.FNext;
end;

procedure TStringsEC.PointerPrev;
begin
    FPointer:=FPointer.FPrev;
end;

function TStringsEC.PointerGet:integer;
var
    el:TStringsElEC;
begin
    el:=FPointer;
    Result:=-1;
    while el<>nil do begin
        Inc(Result);
        FPointer:=el.FPrev;
    end;
end;

procedure TStringsEC.PointerSet(i:integer);
begin
    if i<0 then FPointer:=nil else FPointer:=El_Get(i);
end;

function TStringsEC.IsEmpty:boolean;
begin
	Result:=FFirst=nil;
end;

procedure TStringsEC.SetTextStr(const str:WideString);
var
    P,Start:PWideChar;
begin
    Clear;
    P := PWideChar(str);
    if P <> nil then
      while P^ <> #0 do
      begin
        Start := P;
        while not ((P^=#0) or (P^=#10) or (P^=#13)) do Inc(P);
        Add(Start,P-Start);
        if P^ = #13 then Inc(P);
        if P^ = #10 then Inc(P);
      end;
end;

function TStringsEC.GetTextStr:WideString;
var
    el:TStringsElEC;
begin
    el:=FFirst;
    Result:='';
    while el<>nil do begin
    	if el.FNext=nil then Result:=Result+el.FStr
        else Result:=Result+el.FStr+#13+#10;
        el:=el.FNext;
    end;
end;

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
function GetCountParEC(const str:WideString; const raz:WideString):integer;
var
    len,lenraz:DWORD;
    i,u,count:integer;
begin
    count:=1;
    len:=Length(str);
    lenraz:=Length(raz);
    if len<1 then begin
        Result:=0;
        Exit;
    end;
    for i:=1 to len do begin
        for u:=1 to lenraz do begin
           if str[i]=raz[u] then begin
               Inc(count);
               break;
           end;
        end;
    end;
    Result:=count;
end;

function GetSmeParEC(const str:WideString; np:integer; const raz:WideString):integer;
var
    len,lenraz:DWORD;
    i,u:integer;
begin
    if np>0 then begin
        len:=Length(str);
        lenraz:=Length(raz);
        for i:=1 to len do begin
            for u:=1 to lenraz do begin
               if str[i]=raz[u] then begin
                   Dec(np);
                   if np=0 then begin
                       Result:=i+1;
                       Exit;
                   end;
                   break;
               end;
            end;
        end;
        raise Exception.Create('GetSmeParEC. Str=' + str + ' np=' + IntToStr(np) + ' raz=' + raz);
    end;
    Result:=1;
end;

function GetSmeParEC(const str:WideString; np:integer; const raz:WideChar):integer;
var
    len:DWORD;
    i:integer;
begin
    if np>0 then begin
        len:=Length(str);
        for i:=1 to len do begin
        	if str[i]=raz then begin
               Dec(np);
               if np=0 then begin
                    Result:=i+1;
                	Exit;
                end;
				break;
            end;
        end;
        raise Exception.Create('GetSmeParEC. Str=' + str + ' np=' + IntToStr(np) + ' raz=' + raz);
    end;
    Result:=1;
end;

function GetSmeParNEEC(const str:WideString; np:integer; raz:WideChar):integer;
var
    len:DWORD;
    i:integer;
begin
    if np>0 then begin
        len:=Length(str);
        for i:=1 to len do begin
        	if str[i]=raz then begin
               Dec(np);
               if np=0 then begin
                    Result:=i+1;
                	Exit;
                end;
				break;
            end;
        end;
        Result:=-1;
        Exit;
    end;
    Result:=1;
end;

function GetLenParEC(const str:WideString; smepar:integer; const raz:WideString):integer;
var
    len,lenraz:DWORD;
    i,u:integer;
begin
    len:=Length(str);
    lenraz:=Length(raz);
    for i:=smepar to len do begin
        for u:=1 to lenraz do begin
            if str[i]=raz[u] then begin
                Result:=i-smepar;
                Exit;
            end;
        end;
    end;
    Result:=integer(len)-smepar+1;
end;

function GetStrParEC(const str:WideString; np:integer; const raz:WideString):WideString;
var
    sme:integer;
begin
    sme:=GetSmeParEC(str,np,raz);
    Result:=CopyEC(str,sme,GetLenParEC(str,sme,raz));
end;

function GetStrParEC(const str:WideString; nps,npe:integer; const raz:WideString):WideString;
var
    sme1,sme2:integer;
begin
	sme1:=GetSmeParEC(str,nps,raz);
	sme2:=GetSmeParEC(str,npe,raz);
	sme2:=sme2+GetLenParEC(str,sme2,raz);
    Result:=CopyEC(str,sme1,sme2-sme1);
end;

function ExtractStrParEC(var str:WideString; raz:WideChar):WideString;
var
	sme,i,len:integer;
begin
	sme:=GetSmeParNEEC(str,1,raz);
    if sme<0 then begin
    	Result:=str;
        str:='';
	end else begin
	    if sme>=3 then Result:=CopyEC(str,1,sme-2)
    	else Result:='';
	    len:=Length(str);
    	for i:=sme to len do str[i-(sme-1)]:=str[i];
	    SetLength(str,len-(sme-1));
    end;
end;

function GetComEC(const s:WideString):WideString;
var
    compos,i:integer;
begin
    compos:=Pos('//',s);
    if compos<1 then begin
        Result:='';
        Exit;
    end;
    i:=compos-1;
    while i>=1 do begin
        if (s[i]<>WideChar(32)) and (s[i]<>WideChar(9)) and (s[i]<>WideChar($0d)) and (s[i]<>WideChar($0a)) then break;
        Dec(i);
    end;
    Result:=CopyEC(s,i+1,Length(s)-(i));
end;

function GetStrNoComEC(const s:WideString):WideString;
var
    compos:integer;
begin
    compos:=Pos('//',s);
    if compos<1 then begin
        Result:=s;
        Exit;
    end else if compos=1 then begin
        Result:='';
        Exit;
    end;
    Result:=TrimRight(CopyEC(s,1,compos-1));
end;

function IsIntEC(const str:WideString):boolean;
var
    len,i:integer;
begin
    len:=Length(str);
    if len<1 then begin
        Result:=false;
        Exit;
    end;
    for i:=1 to len do begin
        if ((str[i]<'0') or (str[i]>'9')) and (str[i]<>'-') then begin
            Result:=false;
            Exit;
        end;
    end;
    Result:=true;
end;

function StrToIntEC(const str:WideString):integer;
var
    len,i:integer;
begin
    Result:=0;
    len:=Length(str);
    for i:=1 to len do begin
        if (integer(str[i])>=integer('0')) and (integer(str[i])<=integer('9')) then begin
            Result:=Result*10+ord(str[i])-ord('0');
        end;
    end;
end;

function StrToIntFullEC(const str:WideString):integer;
var
    len,i:integer;
    fm:boolean;
begin
    Result:=0;
    len:=Length(str);
    fm:=false;
    for i:=1 to len do begin
        if (integer(str[i])>=integer('0')) and (integer(str[i])<=integer('9')) then begin
            Result:=Result*10+ord(str[i])-ord('0');
        end else if (integer(str[i])=integer('-')) and (Result=0) then begin
			fm:=true;
        end;
    end;
    if fm then Result:=-Result;
end;

function StrToFloatEC(const str:WideString):single;
var
    i,len:integer;
    zn,tra:single;
    ch:integer;
begin
	len:=Length(str);
	if(len<1) then begin Result:=0; Exit; End;

	zn:=0.0;

    for i:=0 to len-1 do begin
		ch:=integer(str[i+1]);
		if (ch>=integer('0')) and (ch<=integer('9')) then zn:=zn*10.0+(ch-integer('0'))
		else if (ch=integer('.')) or (ch=integer(',')) then break;
	end;
	inc(i);
	tra:=10.0;
    while i<len do begin
		ch:=integer(str[i+1]);
		if (ch>=integer('0')) and (ch<=integer('9')) then begin
			zn:=zn+((ch-integer('0')))/tra;
			tra:=tra*10.0;
		end;
        inc(i);
	end;
    for i:=0 to len-1 do if integer(str[i+1])=integer('-') then begin zn:=-zn; break; end;

    Result:=zn;
end;

function StrToFloatExEC(const str:WideString):single;
var
    i,len:integer;
    zn,tra:single;
    ch:integer;
begin
	len:=Length(str);
	if(len<1) then begin Result:=0; Exit; End;

	zn:=0.0;

    for i:=0 to len-1 do begin
		ch:=integer(str[i+1]);
		if (ch>=integer('0')) and (ch<=integer('9')) then zn:=zn*10.0+(ch-integer('0'))
		else if (ch=integer('.')) or (ch=integer(',')) then break;
	end;
	inc(i);
	tra:=10.0;
    while i<len do begin
		ch:=integer(str[i+1]);
		if (ch>=integer('0')) and (ch<=integer('9')) then begin
			zn:=zn+((ch-integer('0')))/tra;
			tra:=tra*10.0;
		end;
        inc(i);
	end;
    for i:=0 to len-1 do if integer(str[i+1])=integer('-') then begin zn:=-zn; break; end;

    Result:=zn;
end;

function StrToFloatExtendedEC(const str:WideString):Extended;
var
    i,len:integer;
    zn,tra,a:Extended;
    ch:integer;
begin
	len:=Length(str);
	if(len<1) then begin Result:=0; Exit; End;

	zn:=0.0;

    for i:=0 to len-1 do begin
		ch:=integer(str[i+1]);
		if (ch>=integer('0')) and (ch<=integer('9')) then begin
        	a:=ch-integer('0');
        	zn:=zn*10.0;
            zn:=zn+a;
        end
		else if (ch=integer('.')) or (ch=integer(',')) then break;
	end;
	inc(i);
	tra:=10.0;
    while i<len do begin
		ch:=integer(str[i+1]);
		if (ch>=integer('0')) and (ch<=integer('9')) then begin
			zn:=zn+((ch-integer('0')))/tra;
			tra:=tra*10.0;
		end;
        inc(i);
	end;
    for i:=0 to len-1 do if integer(str[i+1])=integer('-') then begin zn:=-zn; break; end;

    Result:=zn;
end;

function FloatToStrEC(zn:double):WideString;
var
    oldch:char;
begin
    oldch:=DecimalSeparator;
    DecimalSeparator:='.';
    Result:=FloatToStr(zn);
    DecimalSeparator:=oldch;
end;

function StringReplaceEC(const str:WideString; const sold:WideString; const snew:WideString):WideString;
var
    strlen,soldlen,i,u:integer;
begin
    Result:='';
    strlen:=Length(str);
    soldlen:=Length(sold);
    if (strlen<soldlen) or (strlen<1) or (soldlen<1) then begin Result:=str; Exit; end;

    i:=0;
    while i<=strlen-soldlen do begin
        u:=0;
        while u<soldlen do begin
            if str[i+u+1]<>sold[u+1] then break;
            inc(u);
        end;

        if u>=soldlen then begin
            Result:=Result+snew;
            i:=i+soldlen;
        end else begin
            Result:=Result+str[i+1];
            inc(i);
        end;
    end;

    if i<strlen then begin
        Result:=Result+CopyEC(str,i+1,strlen-i);
    end;
end;

function HexToStrEC(zn:DWORD):WideString;
const
    ar:array [0..15] of WideChar=('0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f');
begin
    Result:='';
    while(zn<>0) do begin
        Result:=ar[zn-(zn div 16)*16]+Result;
        zn:=zn div 16;
    end;
    if Result='' then Result:='0';
end;

function IntToStrEC(zn:integer):WideString;
var
    sim:integer;
begin
    Result:='';
    sim:=abs(zn);
    while sim>0 do begin
        Result:=Chr((sim mod 10)+integer('0'))+Result;
        sim:=sim div 10;
    end;
    if Result='' then Result:='0';
    if zn<0 then Result:='-'+Result;
end;

function AddStrPar(const str,par:WideString):WideString;
begin
    if GetCountParEC(str,'?')<2 then begin
        Result:=str + '?' + par;
    end else begin
        Result:=str + '&' + par;
    end;
end;

function BooleanToStr(zn:boolean):WideString;
begin
    if zn=false then Result:='False' else Result:='True';
end;

function StrToPoint(const tstr:WideString):TPoint;
begin
    if GetCountParEC(tstr,',')<2 then raise Exception.Create('StrToPoint. str=' + tstr);
    Result:=Point(StrToInt(GetStrParEC(tstr,0,',')),StrToInt(GetStrParEC(tstr,1,',')));
end;

function PointToStr(zn:TPoint):WideString;
begin
    Result:=IntToStr(zn.x)+','+IntToStr(zn.y);
end;

function StrToRect(const tstr:WideString):TRect;
begin
    if GetCountParEC(tstr,',')<4 then raise Exception.Create('StrToRect. str=' + tstr);
    Result.Left:=StrToInt(GetStrParEC(tstr,0,','));
    Result.Top:=StrToInt(GetStrParEC(tstr,1,','));
    Result.Right:=StrToInt(GetStrParEC(tstr,2,','));
    Result.Bottom:=StrToInt(GetStrParEC(tstr,3,','));
end;

function RectToStr(zn:TRect):WideString;
begin
    Result:=IntToStr(zn.Left)+','+IntToStr(zn.Top)+','+IntToStr(zn.Right)+','+IntToStr(zn.Bottom);
end;

function TrimEx(const tstr:WideString):WideString;
var
    zn,lensou,tstart,tend:integer;
begin
    lensou:=Length(tstr);

    tstart:=0;
    while tstart<lensou do begin
        zn:=Ord(tstr[tstart+1]);
        if (zn<>$20) and (zn<>$09) and (zn<>$0d) and (zn<>$0a) and (zn<>$0) then break;
        inc(tstart);
    end;
    if tstart>=lensou then begin Result:=''; Exit; end;

    tend:=lensou-1;
    while tend>=0 do begin
        zn:=Ord(tstr[tend+1]);
        if (zn<>$20) and (zn<>$09) and (zn<>$0d) and (zn<>$0a) and (zn<>$0) then break;
        dec(tend);
    end;
    if tend<tstart then begin Result:=''; Exit; end;

    SetLength(Result,tend-tstart+1);
    CopyMemory(PWideChar(Result),PAdd(PWideChar(tstr),tstart*2),(tend-tstart+1)*2);
end;

function TagSkipEC(tstr:PWideChar; tstrlen:integer):integer;
var
    i:integer;
begin
    Result:=0;
    if (tstrlen<2) or (tstr[0]<>'<') then Exit;
    if tstr[1]='<' then begin Result:=1; Exit; end;
    i:=1;
    while i<tstrlen do if tstr[i]='>' then break else inc(i);
    if i>=tstrlen then Exit;
    Result:=i+1;
end;

function TagIs(tstr:PWideChar; tstrlen:integer; const tagnamesmall:WideString; const tagnamelarge:WideString):boolean;
var
	i,taglen:integer;
begin
	Result:=false;
	taglen:=Length(tagnamesmall);
    if taglen<>Length(tagnamelarge) then Exit;
    if (taglen+1)>tstrlen then Exit;
    if tstr[0]<>'<' then Exit;

    for i:=0 to taglen-1 do begin
    	if (tstr[1+i]<>tagnamesmall[1+i]) and (tstr[1+i]<>tagnamelarge[1+i]) then Exit;
    end;
    Result:=true;
end;

function TagDeleteEC(const tstr:WideString):WideString;
var
    i,skipi:integer;
begin
    Result:='';
    i:=0;
    while i<Length(tstr) do begin
        skipi:=TagSkipEC(PWideChar(tstr)+i,Length(tstr)-i);
        if skipi>0 then begin
            i:=i+skipi;
        end else begin
            Result:=Result+tstr[i+1];
            i:=i+1;
        end;
    end;
end;

function TagDeleteByNameEC(tstr:WideString; const tagnamesmall:WideString; const tagnamelarge:WideString):WideString;
var
    i,skipi:integer;
begin
    Result:='';
    i:=0;
    while i<Length(tstr) do begin
        skipi:=TagSkipEC(PWideChar(tstr)+i,Length(tstr)-i);
        if skipi>0 then begin
        	if TagIs(PWideChar(tstr)+i,Length(tstr)-i,tagnamesmall,tagnamelarge) then begin
	            i:=i+skipi;
            end else begin
            	Result:=Result+CopyEC(tstr,i+1,skipi);
	            i:=i+skipi;
            end;
        end else begin
            Result:=Result+tstr[i+1];
            i:=i+1;
        end;
    end;
end;

function ComparerStrEC(s1,s2:PWideChar):integer;
asm
		push    esi
		push    edi
		push    ebx
		push    edx

		mov     esi,s1
		mov     edi,s2
		test    esi,esi
		jnz     @@l1
		mov     eax,-1
		test    edi,edi
		jnz     @@lend
		xor     eax,eax
		jmp     @@lend

@@l1:	test    edi,edi
		jnz     @@l2
		mov     eax,1
		jmp     @@lend

@@l2:	mov     bx,[esi]
		mov     dx,[edi]
		add     esi,2
		add     edi,2
		cmp     bx,dx
		jnz     @@l3
		xor     eax,eax
		test    dx,dx
		jnz     @@l2
		jmp     @@lend

@@l3:	mov     eax,1
		ja      @@l4
		mov     eax,-1
@@l4:
//    test    bx,bx
//    jz      lend
//    test    dx,dx
//    jz      lend
//    jmp     l2

@@lend:
		pop    edx
		pop    ebx
		pop    edi
		pop    esi
//		mov     Result,eax
end;

function CmpStrFirstEC(const ssou,ssub:WideString):boolean;
var
    lssou,lssub:integer;
begin
    lssou:=Length(ssou);
    lssub:=Length(ssub);
    if lssou<lssub then begin Result:=false; Exit; end;
    if (lssou<1) and (lssub<1) then begin Result:=true; Exit; end;

    result:=CompareMem(PWideChar(ssou),PWideChar(ssub),lssub*2);
end;

function FindSubstring(const ssou,ssub:WideString; sme:integer=0):integer; // -1 not found
var
    lssou,lssub:integer;
    sssou,sssub:DWORD;
begin
    lssou:=Length(ssou);
    lssub:=Length(ssub);
    if (lssou-sme)<lssub then begin Result:=-1; Exit; end;
    if (lssou<1) and (lssub<1) then begin Result:=-1; Exit; end;

    sssou:=DWORD(PWideChar(ssou));
    sssub:=DWORD(PWideChar(ssub));

    if lssub=1 then begin
	    while sme<=(lssou-lssub) do begin
    		if PWideChar(sssou+DWORD(sme shl 1))^=PWideChar(sssub)^ then begin
        		Result:=sme;
	            Exit;
    	    end;
	    	inc(sme);
    	end;
    end else begin
	    while sme<=(lssou-lssub) do begin
    		if CompareMem(PWideChar(sssou+DWORD(sme shl 1)),PWideChar(sssub),lssub*2) then begin
        		Result:=sme;
	            Exit;
    	    end;
	    	inc(sme);
    	end;
    end;
    Result:=-1;
{var
    lssou,lssub:integer;
begin
    lssou:=Length(ssou);
    lssub:=Length(ssub);
    if (lssou-sme)<lssub then begin Result:=-1; Exit; end;
    if (lssou<1) and (lssub<1) then begin Result:=-1; Exit; end;

    while sme<=(lssou-lssub) do begin
    	if CompareMem(PWideChar(DWORD(ssou)+DWORD(sme shl 1)),PWideChar(ssub),lssub*2) then begin
        	Result:=sme;
            Exit;
        end;
    	inc(sme);
    end;
    Result:=-1;}
end;

function PosEx(const Substr,Sour:WideString):integer; // 0 not found
begin
	Result:=FindSubstring(Sour,Substr)+1;
end;

function File_NameExt(const path:WideString):WideString;
var
    cnt:integer;
begin
    cnt:=GetCountParEC(path,'\/');
    Result:=GetStrParEC(path,cnt-1,'\/');
end;

function File_Name(const path:WideString):WideString;
var
    cnt:integer;
begin
    cnt:=GetCountParEC(path,'\/');
    Result:=GetStrParEC(path,cnt-1,'\/');
    cnt:=GetCountParEC(Result,'.');
    if cnt>1 then begin
        Result:=GetStrParEC(Result,0,cnt-2,'.');
    end;
end;

function File_Ext(const path:WideString):WideString;
var
    cnt:integer;
begin
    cnt:=GetCountParEC(path,'\/');
    Result:=GetStrParEC(path,cnt-1,'\/');
    cnt:=GetCountParEC(Result,'.');
    if cnt>1 then begin
        Result:=GetStrParEC(Result,cnt-1,'.');
    end else Result:='';
end;

function File_Path(const path:WideString):WideString;
var
    cnt:integer;
begin
    cnt:=GetCountParEC(path,'\/');
    if cnt<=1 then begin Result:=''; Exit; End;
    Result:=GetStrParEC(path,0,cnt-2,'\/');
end;

function File_IsExt(const tstr:WideString):boolean;
begin
	Result:=false;
	if Length(tstr)<2 then Exit;
    if tstr[1]<>'.' then Exit;
    if (tstr[2]=' ') or (tstr[2]=#9) then Exit;
    if GetCountParEC(tstr,'\/')>1 then Exit;
    Result:=true;
end;

procedure RegUser_SetFullString(pkey:HKEY; path:WideString; name:WideString; zn:WideString);
var
    kkey:HKEY;
    dv:DWORD;
    tstr:AnsiString;
begin
    if RegCreateKeyExA(pkey,PChar(AnsiString(path)),0,nil,0,KEY_WRITE,nil,kkey,@dv)<>ERROR_SUCCESS then begin
        Exit;
    end;
    tstr:=zn;
    if RegSetValueExA(kkey,PChar(AnsiString(name)),0,REG_SZ,PChar(tstr),Length(tstr)+1)<>ERROR_SUCCESS then begin
        RegCloseKey(kkey);
        Exit;
    end;
    RegCloseKey(kkey);
end;

function FilePathWithoutExt(sPath: WideString):WideString;
var
	ext:WideString;
begin
	ext:=ExtractFileExt(sPath);
	Result:=LeftStr(sPath, Length(sPath)-Length(ext));
end;


function CopyEC(Source : WideString; StartChar, Count : Integer):WideString;
begin
  SetLength(Result,Count);
  CopyMemory(PWideChar(Result),PAdd(PWideChar(Source),StartChar*2-2),Count*2);
end;

end.
