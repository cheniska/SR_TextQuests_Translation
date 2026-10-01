unit TextQuestInterface;

interface

uses EC_Struct;

type

TTextQuestInterface=class(TObjectEx)
public
  constructor Create();
  destructor Destroy; override;

  procedure SetText(txt:WideString); virtual;
  procedure SetImage(img:WideString); virtual;
  procedure SetBGM(bgm:WideString); virtual;
  procedure PlaySound(snd:WideString); virtual;

  procedure SetParameters(txt:WideString); virtual;

  procedure AddAnswerContinueCritical; virtual;
  procedure AddAnswerWin; virtual;
  procedure AddAnswerDeath; virtual;
  procedure AddAnswerLose; virtual;

  procedure AddAnswer(txt:WideString;num:integer); virtual;
  procedure AddAnswerDisabled(txt:WideString); virtual;
  procedure AddAnswerContinueToAnswer(num:integer); virtual;
  procedure AddAnswerContinueToLocation(num:integer); virtual;

  procedure TimePasses(days:integer); virtual;

end;


implementation

constructor TTextQuestInterface.Create();
begin
end;

destructor TTextQuestInterface.Destroy;
begin
end;

procedure TTextQuestInterface.SetText(txt:WideString);
begin
end;

procedure TTextQuestInterface.SetImage(img:WideString);
begin
end;

procedure TTextQuestInterface.SetBGM(bgm:WideString);
begin
end;

procedure TTextQuestInterface.PlaySound(snd:WideString);
begin
end;

procedure TTextQuestInterface.SetParameters(txt:WideString);
begin
end;

procedure TTextQuestInterface.AddAnswerContinueCritical;
begin
end;

procedure TTextQuestInterface.AddAnswerWin;
begin
end;

procedure TTextQuestInterface.AddAnswerDeath;
begin
end;

procedure TTextQuestInterface.AddAnswerLose;
begin
end;

procedure TTextQuestInterface.AddAnswer(txt:WideString;num:integer); 
begin
end;

procedure TTextQuestInterface.AddAnswerDisabled(txt:WideString);
begin
end;

procedure TTextQuestInterface.AddAnswerContinueToAnswer(num:integer);
begin
end;

procedure TTextQuestInterface.AddAnswerContinueToLocation(num:integer);
begin
end;

procedure TTextQuestInterface.TimePasses(days:integer);
begin
end;


end.
