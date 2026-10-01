unit ParViewStringClass;

interface

uses EC_Struct,TextFieldClass,EC_Buf;

type TParViewString=class(TObjectEx)
  public
    min,max:integer;
    str:TTextField;

    constructor Create(txt:Widestring);
    destructor Destroy; override;
    procedure CopyDataFrom(source:TParViewString);
    procedure Save(Buf:TBufEC);
    procedure Load(Buf:TBufEC);
end;

implementation

uses EC_Str;

constructor TParViewString.Create(txt:Widestring);
begin
  inherited Create;
  str:=TTextField.Create;
  str.text:=txt;
end;

destructor TParViewString.Destroy;
begin
  str.Free;
  str:=nil;
  inherited Destroy;
end;

procedure TParViewString.CopyDataFrom(source:TParViewString);
begin
  min:=source.min;
  max:=source.max;
  str.text:=trimEX(source.str.text);
end;


procedure TParViewString.Save(Buf:TBufEC);
begin
  Buf.AddInteger(min);
  Buf.AddInteger(max);
  str.Save(Buf);
end;


procedure TParViewString.Load(Buf:TBufEC);
begin
  min:=Buf.GetInteger;
  max:=Buf.GetInteger;
  str.Load(Buf);
end;


end.
 