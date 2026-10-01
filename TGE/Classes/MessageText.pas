unit MessageText;

interface

uses EC_BlockPar,EC_Str;

type

TQuestMessages = class
public
  constructor Create();
  destructor Destroy(); override;

  procedure LoadFromFile(filename:PAnsiChar);
  function ParPath_Get(path:WideString):WideString;
  function Par_Get(path:WideString):WideString;
private
  M:TBlockParEC;
end;

var  QuestMessages:TQuestMessages;

implementation

constructor TQuestMessages.Create();
begin
  inherited Create;
  M:=TBlockParEC.Create;
end;

destructor TQuestMessages.Destroy();
begin
  if M<>nil then begin M.Free; M:=nil; end;
  inherited Destroy;
end;

procedure TQuestMessages.LoadFromFile(filename:PAnsiChar);
begin
  M.LoadFromFile(filename);
end;

function TQuestMessages.ParPath_Get(path:WideString):WideString;
var i,cnt:integer;
    tstr:WideString;
    bp:TBlockParEC;
begin
  Result:=path;
  cnt:=GetCountParEC(path,'.');
  bp:=M;
  for i:=0 to cnt-2 do
  begin
    tstr:=GetStrParEC(path,i,'.');
    if bp.Block_Count(tstr)>0 then bp:=bp.Block_Get(tstr)
    else exit;
  end;
  tstr:=GetStrParEC(path,cnt-1,'.');
  Result:=bp.Par_Get(tstr);
end;

function TQuestMessages.Par_Get(path:WideString):WideString;
begin
  if M.Par_Count(path)>0 then Result:=M.Par_Get(path) else Result:=path;
end;

end.
 