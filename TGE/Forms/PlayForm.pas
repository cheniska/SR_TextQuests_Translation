unit PlayForm;

interface

uses
  ExtCtrls, Classes, ActnList, StdActns, ExtActns,
  XPStyleActnCtrls, ActnMan, StdCtrls, ComCtrls, Forms, Controls, Buttons,
  TextQuest, ParameterClass, ParameterDeltaClass, ValueListClass, TextFieldClass, Menus;

const
  AnswerToNone = 0;
  AnswerToLocation = 1;
  AnswerToPath = 2;
  AnswerToCritical = 3;
  AnswerToWin = 4;
  AnswerToLose = 5;

type TAnswerState=record
  AnswerType:integer;
  AnswerData:integer;
  AnswerText:WideString;
end;

type PAnswerState = ^TAnswerState;


type
  TFormPlay = class(TForm)

    CancelButton: TButton;
    MakeUndoButton: TButton;

    SDTRichEdit: TRichEdit;
    ParLabel1: TRichEdit;

    AnswersScrollBox: TScrollBox;

    ProgressLabel: TLabel;
    StartGameTimer: TTimer;
    Panel1: TPanel;
    LabelWait: TLabel;
    TextEditButton: TSpeedButton;
    ParamEditButton: TSpeedButton;

    procedure CancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure MakeLocationText(txt:widestring);
    procedure MakeParamsText(txt:widestring);
    function  FixStringParameters(txt:wideString):Widestring;

    procedure MakeUndoButtonClick(Sender: TObject);


    procedure StartGame;

    function  AddAnswer(txt:widestring; ansType:integer; ansData:integer):TLabel;
    procedure ClearAnswers;
    procedure ProcessCheckAnswer;

    function GetDayPassedStr:WideString;

    procedure LabelClick(Sender: TObject);
    procedure LabelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);

    procedure AnswerPath(Sender: TObject);
    procedure AnswerLoc(Sender: TObject);
    procedure AnswerCrit(Sender: TObject);
    procedure AnswerExit(Sender: TObject);

    procedure StartGameTimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    //procedure SDTRichEditChange(Sender: TObject);
    procedure TextEditButtonClick(Sender: TObject);
    procedure ParamEditButtonClick(Sender: TObject);

    procedure SaveState;
    procedure UnDoState;
    procedure ReDoState;

  private

    { Private declarations }
  public
    { Public declarations }
    PlayGame:TTextQuest;

    CheckedAnswer:TLabel;
    oldcheckanswer:TLabel;
    dayspassed:integer;

    ProgressString:WideString; 
    ProgressCount:integer;

    LocationText:widestring;
    ParamsText:widestring;

    AnswerStates:TList;
    AnswerLabels:TList;

    QuestStates:TList;
    PrevQuestState:integer;

    FMenu:TPopupMenu;
  end;

var
  FormPlay: TFormPlay;


implementation

{$R *.DFM}

uses Dialogs, Graphics, CalcParseClass, LocationClass, PathClass,
     EC_Str, EC_Buf, MessageText, ParamEdit, Windows, MainForm, TextQuestInterface, ClipboardFixer;

var
  QuestInterface:TTextQuestInterface;

type

TTextQuestPlayerInterface = class (TTextQuestInterface)
public
  procedure SetText(txt:WideString); override;
  procedure SetParameters(txt:WideString); override;

  procedure AddAnswerContinueCritical; override;
  procedure AddAnswerWin; override;
  procedure AddAnswerDeath; override;
  procedure AddAnswerLose; override;

  procedure AddAnswer(txt:WideString;num:integer); override;
  procedure AddAnswerDisabled(txt:WideString); override;
  procedure AddAnswerContinueToAnswer(num:integer); override;
  procedure AddAnswerContinueToLocation(num:integer); override;

  procedure TimePasses(days:integer); override;

end;


type ColoredTextRegion=record
  text_start:integer;
  text_end  :integer;
  colR:integer;
  colG:integer;
  colB:integer;
end;

type FixedWidthTextRegion=record
  text_start:integer;
  text_end  :integer;
end;

type PColoredTextRegion = ^ColoredTextRegion;
type PFixedWidthTextRegion = ^FixedWidthTextRegion;

procedure SetTextToRichEdit(txt:widestring; redit:TRichEdit);
var
  tstr,tag1,tstr1,tstr2:widestring;
  i,i1,j1,len:integer;
  clrList,openClrList:TList;
  fixList,openFixList:TList;
  clrR:PColoredTextRegion;
  fixR:PFixedWidthTextRegion;
begin
  tstr:=txt;
  clrList:=TList.Create;
  openClrList:=TList.Create;
  fixList:=TList.Create;
  openFixList:=TList.Create;

  len:=Length(tstr);
  i1:=1;

  while i1<len do
  begin
    if tstr[i1] <> '<' then begin inc(i1); continue; end;
    j1:=i1+1;
    while (j1<=len) and (tstr[j1] <> '>') do inc(j1);
    if (i1+1=j1) or (j1>len) then begin i1:=j1; continue; end;
    tag1:=CopyEC(tstr,i1+1,j1-i1-1);
    
    if (tag1='/color') or (tag1='clrEnd') then
    begin
      tstr1:=CopyEC(tstr,1,i1-1);
      tstr2:=CopyEC(tstr,j1+1,len-j1);
      tstr:=tstr1+tstr2;
      len:=Length(tstr);
      if openClrList.Count > 0 then
      begin
        (PColoredTextRegion(openClrList.Items[openClrList.Count-1]))^.text_end:=i1;
        openClrList.Delete(openClrList.Count-1);
      end;
      continue;
    end;

    if (tag1='/fix') then
    begin
      tstr1:=CopyEC(tstr,1,i1-1);
      tstr2:=CopyEC(tstr,j1+1,len-j1);
      tstr:=tstr1+tstr2;
      len:=Length(tstr);
      if openFixList.Count > 0 then
      begin
        (PFixedWidthTextRegion(openFixList.Items[openFixList.Count-1]))^.text_end:=i1;
        openFixList.Delete(openFixList.Count-1);
      end;
      continue;
    end;

    if (tag1='clr') then
    begin
      tstr1:=CopyEC(tstr,1,i1-1);
      tstr2:=CopyEC(tstr,j1+1,len-j1);
      tstr:=tstr1+tstr2;
      len:=Length(tstr);
      new(clrR);
      clrList.Add(clrR);
      openClrList.Add(clrR);
      clrR.text_start:=i1;
      clrR.colR:=0;
      clrR.colG:=0;
      clrR.colB:=255;
      continue;
    end;

    if (tag1='fix') then
    begin
      tstr1:=CopyEC(tstr,1,i1-1);
      tstr2:=CopyEC(tstr,j1+1,len-j1);
      tstr:=tstr1+tstr2;
      len:=Length(tstr);
      new(fixR);
      fixList.Add(fixR);
      openFixList.Add(fixR);
      fixR.text_start:=i1;
      continue;
    end;

    if GetCountParEC(tag1,'=')<=1 then begin i1:=j1; continue; end;
    if (GetStrParEC(tag1,0,'=')='color') then
    begin
      tag1:=GetStrParEC(tag1,1,'=');
      if GetCountParEC(tag1,',')<3 then begin i1:=j1; continue; end;
      tstr1:=CopyEC(tstr,1,i1-1);
      tstr2:=CopyEC(tstr,j1+1,len-j1);
      tstr:=tstr1+tstr2;
      len:=Length(tstr);
      new(clrR);
      clrList.Add(clrR);
      openClrList.Add(clrR);
      clrR.text_start:=i1;
      clrR.colR:=StrToIntEC(GetStrParEC(tag1,0,','));
      clrR.colG:=StrToIntEC(GetStrParEC(tag1,1,','));
      clrR.colB:=StrToIntEC(GetStrParEC(tag1,2,','));
      continue;
    end;

    inc(i1);
  end;

  if trimEX(redit.Text)<>trimEX(tstr) then redit.Text:=tstr;


  redit.SelStart:=0;
  redit.SelLength:=length(tstr);
  redit.SelAttributes.Color:=clBlack;
  redit.SelAttributes.Name:='Tahoma';

  for i:=0 to fixList.Count-1 do
  begin
    fixR:=fixList.Items[i];
    redit.SelStart:=fixR.text_start-1;
    redit.SelLength:=fixR.text_end - fixR.text_start;
    redit.SelAttributes.Name:='Courier';
    dispose(fixR);
  end;

  for i:=0 to clrList.Count-1 do
  begin
    clrR:=clrList.Items[i];
    redit.SelStart:=clrR.text_start-1;
    redit.SelLength:=clrR.text_end - clrR.text_start;
    redit.SelAttributes.Color:=RGB(clrR.colR, clrR.colG, clrR.colB);
    dispose(clrR);
  end;
  clrList.Clear;
  clrList.Free;
  openClrList.Clear;
  openClrList.Free;
  fixList.Clear;
  fixList.Free;
  openFixList.Clear;
  openFixList.Free;

  redit.SelStart:=-1;
  redit.SelLength:=0;
  redit.SelAttributes.Color:=clBlack;
  redit.SelAttributes.Name:='Tahoma';
end;


procedure TFormPlay.MakeLocationText(txt:widestring);
begin
  LocationText:=trimEX(txt);

  if TextEditButton.Down then
  begin
    SDTRichEdit.Text:=LocationText;
    SDTRichEdit.SelStart:=0;
    SDTRichEdit.SelLength:=length(LocationText);
    SDTRichEdit.SelAttributes.Color:=clBlack;
    SDTRichEdit.SelStart:=-1;
    SDTRichEdit.SelLength:=0;
    SDTRichEdit.ReadOnly:=false;
    exit;
  end;
  SDTRichEdit.ReadOnly:=true;
  SetTextToRichEdit(LocationText,SDTRichEdit);
  SDTRichEdit.ReadOnly:=true;
end;


procedure TFormPlay.MakeParamsText(txt:widestring);
begin
  ParamsText:=trimEX(txt);
  SetTextToRichEdit(ParamsText,ParLabel1);
end;

function TFormPlay.FixStringParameters(txt:wideString):Widestring;
var
  ttxt:WideString;
  cle,cls:widestring;
  sr,notag:widestring;
  i1,j1,i2,j2,k,len,len2,formatSize:integer;
  tag1,tag2,inText,tstr1,tstr2:WideString;
  alignType:integer;
  delayTag:boolean;
begin
  cls:='<clr>';
  cle:='<clrEnd>';

  tTxt:=txt;

  repeat
    delayTag:=false;
    len:=Length(tTxt);
    i1:=1;
    while i1<=len do
    begin
      if tTxt[i1]<>'<' then begin inc(i1); continue; end;
      j1:=i1+1;
      while (j1<=len) and (tTxt[j1]<>'>') do inc(j1);
      if (i1=j1+1) or (j1>len) then begin i1:=j1; continue; end;
      tag1:=CopyEC(tTxt,i1+1,j1-i1-1);
      if tag1<>'rnd' then begin i1:=j1; continue; end;

      for i2:=j1+1 to len do
      begin
        if tTxt[i2]<>'<' then continue;
        j2:=i2+1;
        while (j2<=len) and (tTxt[j2]<>'>') do inc(j2);
        if (i2=j2+1) or (j2>len) then continue;
        tag2:=CopyEC(tTxt,i2+1,j2-i2-1);
        if tag2='rnd' then begin delayTag:=true; break; end;
        if tag2<>'/rnd' then continue;

        inText:=CopyEC(tTxt,j1+1,i2-j1-1);
        tstr1:=CopyEC(tTxt,1,i1-1);
        tstr2:=CopyEC(tTxt,j2+1,len-j2);

        tTxt:=tstr1 + GetStrParEC(inText,Random(GetCountParEC(inText,'|')),'|') + tstr2;
        len:=Length(tTxt);
        dec(i1);
        break;
      end;
      inc(i1);
    end;

  until not delayTag;




  sr:=trimEX(PlayGame.RToStar.Text);
  tTxt:=StringReplaceEC(tTxt,'<ToStar>',cls+sr+cle);
  sr:=trimEX(PlayGame.RToPlanet.Text);
  tTxt:=StringReplaceEC(tTxt,'<ToPlanet>',cls+sr+cle);
  sr:=trimEX(PlayGame.RDate.Text);
  tTxt:=StringReplaceEC(tTxt,'<Date>',cls+sr+cle);
  sr:=trimEX(PlayGame.RMoney.Text);
  tTxt:=StringReplaceEC(tTxt,'<Money>',cls+sr+cle);
  sr:=trimEX(PlayGame.RFromPLanet.Text);
  tTxt:=StringReplaceEC(tTxt,'<FromPlanet>',cls+sr+cle);
  sr:=trimEX(PlayGame.RFromStar.Text);
  tTxt:=StringReplaceEC(tTxt,'<FromStar>',cls+sr+cle);
  sr:=trimEX(PlayGame.RRanger.Text);
  tTxt:=StringReplaceEC(tTxt,'<Ranger>',cls+sr+cle);
  sr:=trimEX(QuestMessages.ParPath_Get('FormPlay.Date')); /////////////////////
  tTxt:=StringReplaceEC(tTxt,'<CurDate>',cls+sr+cle);
  sr:='30'; /////////////////////
  tTxt:=StringReplaceEC(tTxt,'<Day>',cls+sr+cle);

  len:=Length(tTxt);
  alignType:=0;
  i1:=1;
  while i1<=len do
  begin
    if tTxt[i1]<>'<' then begin inc(i1); continue; end;
    j1:=i1+1;
    while (j1<=len) and (tTxt[j1]<>'>') do inc(j1);
    if (i1=j1+1) or (j1>len) then begin i1:=j1; continue; end;
    tag1:=CopyEC(tTxt,i1+1,j1-i1-1);
    if GetCountParEC(tag1,'=')<=1 then begin i1:=j1; continue; end;
    if GetStrParEC(tag1,0,'=')<>'format' then begin i1:=j1; continue; end;
    tag1:=GetStrParEC(tag1,1,'=');
    if GetCountParEC(tag1,',')<=1 then begin i1:=j1; continue; end;
    if GetStrParEC(tag1,0,',') = 'left' then alignType:=0
    else if GetStrParEC(tag1,0,',') = 'center' then alignType:=1
    else if GetStrParEC(tag1,0,',') = 'right' then alignType:=2
    else begin i1:=j1; continue; end;
    formatSize:=strtointEC(GetStrParEC(tag1,1,','));

    for i2:=j1+1 to len do
    begin
      if tTxt[i2]<>'<' then continue;
      j2:=i2+1;
      while (j2<=len) and (tTxt[j2]<>'>') do inc(j2);
      if (i2=j2+1) or (j2>len) then continue;
      tag2:=CopyEC(tTxt,i2+1,j2-i2-1);
      if tag2<>'/format' then continue;

      inText:=CopyEC(tTxt,j1+1,i2-j1-1);
      //len2:=i2-j1-1;
      notag:=TagDeleteEC(inText);
      len2:=Length(notag);
      if len2<formatSize then
        for k:=1 to formatSize-len2 do
        begin
          if (alignType=0) or ((alignType=1) and ((k mod 2) = 0)) then inText:=inText+' '
          else inText:=' '+inText;
        end;
      tstr1:=CopyEC(tTxt,1,i1-1);
      tstr2:=CopyEC(tTxt,j2+1,len-j2);
      //ShowMessage(tstr1);
      tTxt:=tstr1+inText+tstr2;
      len:=Length(tTxt);

      break;
    end;
    inc(i1);
  end;

  sr:=#13#10;
  tTxt:=StringReplaceEC(tTxt,'<br>',sr);

  FixStringParameters:=ttxt;
end;


procedure TFormPlay.TextEditButtonClick(Sender: TObject);
var flag:boolean;
begin
  SDTRichEdit.ReadOnly:=true;

  if TextEditButton.Down then
  begin
    SDTRichEdit.PopupMenu:=FMenu;
    CancelButton.Enabled:=false;
    MakeUndoButton.Enabled:=false;
    ParamEditButton.Enabled:=false;
    SDTRichEdit.Text:=trimEX(PlayGame.LastEvent.Text.Text);
    SDTRichEdit.SelStart:=0;
    SDTRichEdit.SelLength:=length(SDTRichEdit.Text);
    SDTRichEdit.SelAttributes.Color:=clBlack;
    SDTRichEdit.SelAttributes.Name:='Tahoma';
    SDTRichEdit.SelStart:=-1;
    SDTRichEdit.SelLength:=0;
  end else begin
    SDTRichEdit.PopupMenu:=nil;
    if (GetAsyncKeyState(VK_CONTROL) and $8000) = $8000 then
    begin
      SDTRichEdit.Text:=LocationText;
    end else begin
      LocationText:=SDTRichEdit.Text;
      flag:=PlayGame.QTextWasChanged;
      PlayGame.LastEvent.Text.Text:=trimEX(SDTRichEdit.Text);
      PlayGame.QTextWasChanged:=false;
      PlayGame.ProcessEvent(PlayGame.LastEvent);
      PlayGame.QTextWasChanged:=flag;
    end;
    CancelButton.Enabled:=true;
    MakeUndoButton.Enabled:=(PrevQuestState>=0);
    ParamEditButton.Enabled:=true;
  end;

  SDTRichEdit.ReadOnly:=not TextEditButton.Down;

  if TextEditButton.Down then Caption:=QuestMessages.ParPath_Get('FormPlay.Caption2')+' '+PlayGame.CurTextSource
  else Caption:=QuestMessages.ParPath_Get('FormPlay.Caption');
end;


function TFormPlay.GetDayPassedStr:WideString;
begin
  Result:=#13#10+QuestMessages.ParPath_Get('FormPlay.DaysSpentOnQuest')+' ' + IntToStrEC(dayspassed);
  if dayspassed >=10 then Result:=Result + #13#10 + QuestMessages.ParPath_Get('FormPlay.DurationRecomendation1')+'  ' + QuestMessages.ParPath_Get('FormPlay.DurationRecomendation2');
end;


procedure TFormPlay.ProcessCheckAnswer;
var
  i:integer;
  lb:TLabel;
begin
  if(checkedanswer <> oldcheckanswer) then
  begin
    for i:=0 to AnswerLabels.Count-1 do
    begin
      lb:=AnswerLabels.Items[i];
      if not lb.Visible then continue;
      if lb = CheckedAnswer then
      begin
        lb.Font.Color:=clNavy;
        lb.Font.Style:=[fsUnderline];
      end else begin
        lb.Font.Color:=clBlack;
        lb.Font.Style:=[];
      end;
    end;
  end;
  oldcheckanswer:=checkedanswer;
end;

procedure TFormPlay.ClearAnswers;
var
  i:integer;
  ans:PAnswerState;
  lb:TLabel;
begin
  CheckedAnswer:=nil;
  oldcheckanswer:=nil;
  for i:=0 to AnswerStates.Count-1 do
  begin
    ans:=AnswerStates.Items[i];
    dispose(ans);
  end;
  AnswerStates.Clear;

  for i:=AnswerLabels.Count-1 downto 0 do
  begin
    lb:=AnswerLabels.Items[i];
    if lb.Visible then lb.Visible:=false
    else begin
      lb.Free;
      AnswerLabels.Delete(i);
    end;
  end;
end;

function TFormPlay.AddAnswer(txt:widestring; ansType:integer; ansData:integer):TLabel;
var anss:PAnswerState;
    lb:TLabel;
    i,nextTop:integer;
    text:WideString;
begin
  new(anss);
  AnswerStates.Add(anss);
  anss.AnswerText:=txt;
  anss.AnswerType:=ansType;
  anss.AnswerData:=ansData;

  lb:=TLabel.Create(AnswersScrollBox);
  lb.Parent:=AnswersScrollBox;
  AnswerLabels.Add(lb);
  text:=FixStringParameters(txt);

  with lb do
  begin
    OnMouseMove:=LabelMouseMove;
    AutoSize:=false;
    Caption:=text;
    Cursor:=crHandPoint;
    Tag:=ansData;
    Top:=5;
    Width:=950;
    WordWrap:=true;
    Left:=0;
    Height:=13;
    Font.Color:=clBlack;
    Font.Style:=[];
    Enabled:=(ansType<>AnswerToNone);
    Visible:=true;
  end;
  Result:=lb;

  case ansType of
    AnswerToLocation: lb.OnClick:=AnswerLoc;
    AnswerToPath:     lb.OnClick:=AnswerPath;
    AnswerToWin:      lb.OnClick:=AnswerExit;
    AnswerToLose:     lb.OnClick:=AnswerExit;
    AnswerToCritical: lb.OnClick:=AnswerCrit;
  end;

  nextTop:=5;
  for i:=0 to FormPlay.AnswerLabels.Count-1 do
  begin
    lb:=FormPlay.AnswerLabels.Items[i];
    if not lb.Visible then continue;
    lb.AutoSize:=true;
    lb.Caption:=lb.Caption;
    lb.AutoSize:=false;
    lb.Width:=950;
    lb.Top:=nextTop;
    nextTop:=lb.Top + lb.Height + 2;
  end;
end;


procedure TFormPlay.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TFormPlay.FormCreate(Sender: TObject);
begin
  CreateOwnClipboard(self,FMenu);

  ParLabel1.PopupMenu:=nil;
  SDTRichEdit.PopupMenu:=nil;

  PlayGame:=nil;//TTextQuest.Create();
  QuestInterface:=TTextQuestPlayerInterface.Create;

  AnswerStates:=TList.Create;
  AnswerLabels:=TList.Create;

  QuestStates:=TList.Create;
  PrevQuestState:=-1;

  CheckedAnswer:=nil;
  oldcheckanswer:=nil;

  Caption:=QuestMessages.ParPath_Get('FormPlay.Caption');
  LabelWait.Caption:=QuestMessages.ParPath_Get('FormPlay.PleaseWait');
  //ParamEditButton.Hint:=QuestMessages.ParPath_Get('FormPlay.Undo');
  MakeUndoButton.Caption:=QuestMessages.ParPath_Get('FormPlay.Undo');
  //SpeedButton2.Hint:=QuestMessages.ParPath_Get('FormPlay.Exit');
  CancelButton.Caption:=QuestMessages.ParPath_Get('FormPlay.Exit');
  TextEditButton.Caption:=QuestMessages.ParPath_Get('FormPlay.EditMode');
end;


procedure TFormPlay.StartGame;
begin
  ProgressString:=QuestMessages.ParPath_Get('FormPlay.TimerStart')+' ';
  ProgressCount:=0;

  PlayGame.TQInterface:=QuestInterface;
  MakeUndoButton.Enabled:=false;

  CheckedAnswer:=nil;
  oldcheckanswer:=nil;

  Panel1.Visible:=true;
  Panel1.Repaint;

  PlayGame.StartQuest;

	Panel1.Visible:=false;
	Panel1.Update;
end;

procedure TFormPlay.MakeUndoButtonClick(Sender: TObject);
begin
  if TextEditButton.Down then exit;
  UnDoState;
end;

procedure TFormPlay.LabelClick(Sender: TObject);
begin
	CheckedAnswer:=(Sender as TLabel);
	ProcessCheckAnswer;
end;

procedure TFormPlay.LabelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  CheckedAnswer:=(Sender as TLabel);
  ProcessCheckAnswer;
end;

procedure TFormPlay.StartGameTimerTimer(Sender: TObject);
begin
  StartGameTimer.Enabled:=false;
  StartGame;
end;

procedure TFormPlay.FormShow(Sender: TObject);
var i:integer;
    buf:TBufEC;
begin
  Caption:=QuestMessages.ParPath_Get('FormPlay.Caption');

  for i:=QuestStates.Count-1 downto 0 do
  begin
    buf:=QuestStates.Items[i];
    buf.Free;
  end;
  QuestStates.Clear;
  PrevQuestState:=-1;

  TextEditButton.Down:=false;
  SDTRichEdit.Text:='';
  ClearAnswers;
  ParLabel1.Text:='';
  ProgressLabel.Caption:='';
  StartGameTimer.Enabled:=true;

  FormResize(Sender);
end;

procedure TFormPlay.FormResize(Sender: TObject);
var
  w, h: integer;
begin
  w:=Width;
  h:=Height;
  if (w < 1021) then w:=1021;
  if (h < 749) then h:=749;

  ParLabel1.Left:=w - 268;
  ParLabel1.Height:=h - 381;

  //SpeedButton2.Left:=w - 117;
  //SpeedButton2.Top:=h - 68;

  MakeUndoButton.Top:=h - 68;
  TextEditButton.Top:=h - 68;
  CancelButton.Top  :=h - 68;



  //1018
  //6 425 852  (136)

  //MakeUndoButton.Left:=6;
  TextEditButton.Left:=(w div 2) - 68;
  CancelButton.Left  :=w - 166;

  ProgressLabel.Top:=h - 62;

  AnswersScrollBox.Width:=w - 25;
  AnswersScrollBox.Top:=h - 341;

  ParamEditButton.Top:= h - 341 - ParamEditButton.Height - 5;

  SDTRichEdit.Width:=w - 281;
  SDTRichEdit.Height:=h - 361;

  ParamEditButton.Left:=ParLabel1.Left + (ParLabel1.Width div 2) - (ParamEditButton.Width div 2);

  Width:=w;
  Height:=h;
end;

procedure TFormPlay.ParamEditButtonClick(Sender: TObject);
var flag:boolean;
begin
  flag:=PlayGame.QTextWasChanged;
  FormParamEdit.ShowModal;
  PlayGame.ShowParams;
  PlayGame.QTextWasChanged:=false;
  PlayGame.ProcessEvent(PlayGame.LastEvent);
  PlayGame.QTextWasChanged:=flag;
end;


procedure TFormPlay.AnswerPath(Sender: TObject);
var num:integer;
begin
  if TextEditButton.Down then exit;
  SaveState;
  num:=(Sender as TLabel).Tag;
  FormPlay.ClearAnswers;
  PlayGame.SelectPath(num);
end;

procedure TFormPlay.AnswerLoc(Sender: TObject);
var num:integer;
begin
  if TextEditButton.Down then exit;
  SaveState;
  num:=(Sender as TLabel).Tag;
  FormPlay.ClearAnswers;
  PlayGame.EnterLocation(num);
end;

procedure TFormPlay.AnswerCrit(Sender: TObject);
begin
  if TextEditButton.Down then exit;
  SaveState;
  FormPlay.ClearAnswers;
  PlayGame.ProcessCriticalEvent;
end;

procedure TFormPlay.AnswerExit(Sender: TObject);
begin
  if TextEditButton.Down then exit;
  FormPlay.ClearAnswers;
  FormPlay.Close;
end;


procedure TFormPlay.SaveState;
var i:integer;
    buf:TBufEC;
    txt:TTextField;
    ans:PAnswerState;
    ptr:pointer;
begin
  for i:=QuestStates.Count-1 downto PrevQuestState+1 do
  begin
    buf:=QuestStates.Items[i];
    buf.free;
    QuestStates.Delete(i);
  end;
  buf:=TBufEC.Create;
  inc(PrevQuestState);
  QuestStates.Add(buf);

  txt:=TTextField.Create;
  txt.Text:=LocationText;
  txt.Save(buf);
  txt.Text:=ParamsText;
  txt.Save(buf);

  buf.AddInteger(dayspassed);

  buf.AddInteger(AnswerStates.Count);
  for i:=0 to AnswerStates.Count-1 do
  begin
    ans:=AnswerStates.Items[i];
    buf.AddInteger(ans.AnswerType);
    buf.AddInteger(ans.AnswerData);
    txt.Text:=ans.AnswerText;
    txt.Save(buf);
  end;

  PlayGame.SaveState(buf);
  ptr:=PlayGame.LastEvent;
  buf.AddDWORD(Cardinal(ptr));
  txt.Free;
  MakeUndoButton.Enabled:=true;
end;

procedure TFormPlay.UnDoState;
var i,cnt:integer;
    atype,adata:integer;
    buf:TBufEC;
    txt:TTextField;
    text:WideString;
    ptr:pointer;
begin
  if PrevQuestState<0 then exit;
  buf:=QuestStates.Items[PrevQuestState];
  dec(PrevQuestState);
  buf.m_Sme:=0;
  txt:=TTextField.Create;
  ClearAnswers;
  txt.Load(buf);
  text:=FixStringParameters(txt.Text);
  MakeLocationText(text);
  txt.Load(buf);
  text:=FixStringParameters(txt.Text);
  MakeParamsText(text);
  dayspassed:=buf.GetInteger;
  cnt:=buf.GetInteger;
  for i:=1 to cnt do
  begin
    atype:=buf.GetInteger;
    adata:=buf.GetInteger;
    txt.Load(buf);
    AddAnswer(txt.Text,atype,adata);
  end;
  PlayGame.LoadState(buf);
  ptr:=pointer(buf.GetDWORD);
  PlayGame.LastEvent:=ptr;
  txt.Free;
  if PrevQuestState<0 then MakeUndoButton.Enabled:=false;
end;

procedure TFormPlay.ReDoState;
var i,cnt:integer;
    atype,adata:integer;
    buf:TBufEC;
    txt:TTextField;
begin
  if PrevQuestState>=QuestStates.Count-1 then exit;
  buf:=QuestStates.Items[PrevQuestState+1];
  inc(PrevQuestState);
  buf.m_Sme:=0;
  txt:=TTextField.Create;
  ClearAnswers;
  txt.Load(buf);
  MakeLocationText(txt.Text);
  txt.Load(buf);
  MakeParamsText(txt.Text);
  dayspassed:=buf.GetInteger;
  cnt:=buf.GetInteger;
  for i:=1 to cnt do
  begin
    atype:=buf.GetInteger;
    adata:=buf.GetInteger;
    txt.Load(buf);
    AddAnswer(txt.Text,atype,adata);
  end;
  PlayGame.LoadState(buf);
  txt.Free;
end;



procedure TTextQuestPlayerInterface.SetText(txt:WideString);
var text:WideString;
begin
  text:=FormPlay.FixStringParameters(txt);
  FormPlay.MakeLocationText(text);
end;

procedure TTextQuestPlayerInterface.SetParameters(txt:WideString);
var text:WideString;
begin
  text:=FormPlay.FixStringParameters(txt);
  FormPlay.MakeParamsText(text);
end;

procedure TTextQuestPlayerInterface.AddAnswerContinueCritical;
begin
  FormPlay.AddAnswer(QuestMessages.ParPath_Get('FormPlay.Continue'),AnswerToCritical,0);
end;

procedure TTextQuestPlayerInterface.AddAnswerWin;
begin
  FormPlay.AddAnswer(QuestMessages.ParPath_Get('FormPlay.QuestWin')+FormPlay.GetDayPassedStr,AnswerToWin,0);
end;

procedure TTextQuestPlayerInterface.AddAnswerDeath;
begin
  FormPlay.AddAnswer(QuestMessages.ParPath_Get('FormPlay.QuestFail')+FormPlay.GetDayPassedStr,AnswerToLose,0);
end;

procedure TTextQuestPlayerInterface.AddAnswerLose;
begin
  FormPlay.AddAnswer(QuestMessages.ParPath_Get('FormPlay.QuestFail')+FormPlay.GetDayPassedStr,AnswerToLose,0);
end;

procedure TTextQuestPlayerInterface.AddAnswer(txt:WideString;num:integer);
begin
  FormPlay.AddAnswer('- '+txt,AnswerToPath,num);
end;

procedure TTextQuestPlayerInterface.AddAnswerDisabled(txt:WideString);
begin
  FormPlay.AddAnswer('- '+txt,AnswerToNone,0);
end;

procedure TTextQuestPlayerInterface.AddAnswerContinueToAnswer(num:integer);
begin
  FormPlay.AddAnswer(QuestMessages.ParPath_Get('FormPlay.Continue'),AnswerToPath,num);
end;

procedure TTextQuestPlayerInterface.AddAnswerContinueToLocation(num:integer);
begin
  FormPlay.AddAnswer(QuestMessages.ParPath_Get('FormPlay.Continue'),AnswerToLocation,num);
end;

procedure TTextQuestPlayerInterface.TimePasses(days:integer);
begin
  FormPlay.dayspassed:=FormPlay.dayspassed+days;
end;


end.



