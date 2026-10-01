unit EventClass;

interface

uses EC_Struct,TextFieldClass;

type TEvent=class(TObjectEx)
  public
    Text :TTextField;
    Image:TTextField;
    BGM  :TTextField;
    Sound:TTextField;


    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    procedure CopyDataFrom(source:TEvent);
    function IsEqualWith(var source:TEvent):boolean;

end;

implementation

uses EC_Str;

constructor TEvent.Create;
begin
  inherited Create;

  Text:=TTextField.Create; Text.Clear;
  Image:=TTextField.Create; Image.Clear;
  BGM:=TTextField.Create; BGM.Clear;
  Sound:=TTextField.Create; Sound.Clear;

end;

destructor TEvent.Destroy;
begin
  Text.Free;Text:=nil;
  Image.Free;Image:=nil;
  BGM.Free;BGM:=nil;
  Sound.Free;Sound:=nil;

  inherited Destroy;
end;

procedure TEvent.Clear;
begin
  Text.text:='';
  Image.text:='';
  BGM.text:='';
  Sound.text:='';
end;

procedure TEvent.CopyDataFrom(source:TEvent);
begin
  Text.text:=trimEX(source.Text.text);
  Image.text:=trimEX(source.Image.text);
  BGM.text:=trimEX(source.BGM.text);
  Sound.text:=trimEX(source.Sound.text);
end;


function TEvent.IsEqualWith(var source:TEvent):boolean;
begin
  Result:=false;

  if trimEX(Text.text) <> trimEX(source.Text.text) then exit;
  if trimEX(Image.text) <> trimEX(source.Image.text) then exit;
  if trimEX(BGM.text) <> trimEX(source.BGM.text) then exit;
  if trimEX(Sound.text) <> trimEX(source.Sound.text) then exit;

  Result:=true;
end;

end.
