unit TextFieldClass;

interface

uses EC_Struct,EC_Buf;

type PText=^file;

type TTextField=class(TObjectEx)
  public
    Text:WideString;

    procedure Save(f:PText); overload;
    procedure Save(Buf:TBufEC); overload;
    procedure Load(f:PText); overload;
    procedure Load(Buf:TBufEC); overload;

    procedure Clear;
    procedure CopyDataFrom(var source:TTextField);
end;


implementation

uses EC_Str;

procedure TtextField.Clear;
begin
  Text:='';
end;

procedure TTextField.CopyDataFrom(var source:TTextField);
begin
  Text:=source.Text;
end;

procedure TTextField.Save(f:PText);
var
  c,t,l:integer;
  tempstr:widestring;
begin
  tempstr:=trimEX(Text);
  l:=length(tempstr);

  if (l<=0) then
  begin
    t:=0;
    BlockWrite(f^,t,sizeof(t));
    exit;
  end;

  t:=1;
  BlockWrite(f^,t,sizeof(t));

  tempstr:=trimEX(Text);
  l:=length(tempstr);

  BlockWrite(f^,l,sizeof(l));

  for c:=1 to l do BlockWrite(f^,tempstr[c],sizeof(tempstr[c]));
end;

procedure TTextField.Save(Buf:TBufEC);
var
  c,l:integer;
  tempstr:widestring;
begin
  tempstr:=trimEX(Text);
  l:=length(tempstr);

  if (l<=0) then
  begin
    Buf.AddInteger(0);
    exit;
  end;

  Buf.AddInteger(1);
  Buf.AddInteger(l);

  for c:=1 to l do Buf.Add(tempstr[c]);
end;

procedure TTextField.Load(f:PText);
var
  tempstr:widestring;
  c,q,m,t:integer;
begin
  Clear;
  BlockRead(f^,m,sizeof(m));
  for q:=1 to m do
  begin
    BlockRead(f^,t,sizeof(t));
    SetLength(tempstr,t);
    for c:=1 to t do BlockRead(f^,tempstr[c],sizeof(tempstr[c]));
    if Text<>'' then Text:=Text+#13#10+trimEX(tempstr) else Text:=trimEX(tempstr);
  end;
  Text:=trimEX(Text);
end;

procedure TTextField.Load(Buf:TBufEC);
var
  tempstr:widestring;
  c,q,m,t:integer;
begin
  Clear;
  m:=Buf.GetInteger;
  for q:=1 to m do
  begin
    t:=Buf.GetInteger;
    SetLength(tempstr,t);
    for c:=1 to t do tempstr[c]:=Buf.GetWideChar;
    if Text<>'' then Text:=Text+#13#10+trimEX(tempstr) else Text:=trimEX(tempstr);
  end;
  Text:=trimEX(Text);
end;

end.
