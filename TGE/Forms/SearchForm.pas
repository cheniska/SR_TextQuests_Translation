unit SearchForm;

interface

uses
  StdCtrls, Controls, ExtCtrls, Classes, Forms, Menus;

type
  TSearchResultItem = record
    LocationIndex:integer;
    PathIndex:integer;
  end;

  PSearchResultItem = ^TSearchResultItem;

  TFormLPSearch = class(TForm)
    SEdit: TEdit;
    SearchTypeRG: TRadioGroup;
    Label1: TLabel;
    ListBox1: TListBox;
    CheckBox1: TCheckBox;
    Button1: TButton;

    procedure FormCreate(Sender: TObject);
    procedure SearchButtonClick(Sender: TObject);
    procedure OpenButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure SEditKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    function SeekCoords(var x,y:integer):boolean;
    procedure ClearSearchResult;
    procedure SearchByLocationNum;
    procedure SearchByPathNum;
    procedure SearchByParamNum;
    procedure SearchByTextFragment;
    procedure SearchByResource;
  public
    { Public declarations }
    ResultsList:TList;
    ResultsExtendedList:TList;
    SearchType:integer;

    LocationHighlightedIndex:integer;
    PathHighlightedIndex:integer;
    HighlightAll:boolean;

    FMenu:TPopupMenu;

    procedure Search;
  end;

var
  FormLPSearch: TFormLPSearch;

implementation

{$R *.dfm}

uses Dialogs, Windows, Messages, ClipboardFixer,
     MainForm, MessageText,
     LocationClass, PathClass, ParameterClass, ParameterDeltaClass, EC_Str;

procedure TFormLPSearch.FormCreate(Sender: TObject);
begin
  CreateOwnClipboard(self,FMenu);

  ResultsList:=TList.Create;
  ResultsExtendedList:=TList.Create;
  SearchType:=0;
  HighlightAll:=false;

  LocationHighlightedIndex:=0;
  PathHighlightedIndex:=0;

  Caption:=QuestMessages.ParPath_Get('FormSearch.Caption');

  SearchTypeRG.Caption:=QuestMessages.ParPath_Get('FormSearch.SearchType');
  SearchTypeRG.Items[0]:=QuestMessages.ParPath_Get('FormSearch.SearchLoc');
  SearchTypeRG.Items[1]:=QuestMessages.ParPath_Get('FormSearch.SearchPath');
  SearchTypeRG.Items[2]:=QuestMessages.ParPath_Get('FormSearch.SearchPar');
  SearchTypeRG.Items[3]:=QuestMessages.ParPath_Get('FormSearch.SearchText');
  SearchTypeRG.Items[4]:=QuestMessages.ParPath_Get('FormSearch.SearchMedia');

  CheckBox1.Caption:=QuestMessages.ParPath_Get('FormSearch.HighlightAll');

  Label1.Caption:=QuestMessages.ParPath_Get('FormSearch.Results');
  Button1.Caption:=QuestMessages.ParPath_Get('FormSearch.StartSearch');

end;

procedure TFormLPSearch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClearSearchResult;
  FormMain.NavigateToolButton.Down:=false;
  FormMain.NiceRepaint;
end;

function TFormLPSearch.SeekCoords(var x,y:integer):boolean;
var
  tstr,tstr1:WideString;
	typesearch,i,c,number:integer;
begin
  Result:=false;
  typesearch:=0;
	tstr:=trimEX(SEdit.Text);
  if tstr='' then exit;
  if (tstr[1]='P') or (tstr[1]='p') then typesearch:=2;
  if (tstr[1]='L') or (tstr[1]='l') then typesearch:=1;
  tstr1:='';
  for i:=1 to length(tstr) do if (tstr[i]>='0') and (tstr[i]<='9') then tstr1:=tstr1+tstr[i];

  if tstr1='' then exit;
  number:=StrToIntEC(tstr1);

  if typesearch=0 then typesearch:=SearchTypeRG.itemindex+1;

	with FormMain.Game do
  begin
    if typesearch=1 then
    begin
      i:=-1;
      for c:=1 to LocationsValue do if Locations[c].LocationNumber=number then i:=c;

      if i>0 then
      begin
        x:=Locations[i].screenx;
        y:=Locations[i].screeny;
        Result:=true;
        LocationHighlightedIndex:=i;
        PathHighlightedIndex:=0;
        exit;
      end;

    end else begin
      i:=-1;
      for c:=1 to PathesValue do if Pathes[c].PathNumber=number then i:=c;

      if i>0 then
      begin
        x:=Pathes[i].PathXCoords[10];
        y:=Pathes[i].PathYCoords[10];
        Result:=true;
        LocationHighlightedIndex:=0;
        PathHighlightedIndex:=i;
        exit;
      end;

    end;
  end;
end;

procedure TFormLPSearch.SearchButtonClick(Sender: TObject);
var x,y:integer;
begin
  x:=0;y:=0;
  if SeekCoords(x,y) then FormMain.NavigateTo(x,y,true);
end;

procedure TFormLPSearch.OpenButtonClick(Sender: TObject);
var x,y:integer;
begin
  x:=0;y:=0;
  if SeekCoords(x,y) then FormMain.ProcessRightClickXY(x,y);
end;


procedure TFormLPSearch.ClearSearchResult;
begin
  while ResultsList.Count>0 do
  begin
    Dispose(ResultsList.Items[ResultsList.Count-1]);
    ResultsList.Delete(ResultsList.Count-1);
  end;
  while ResultsExtendedList.Count>0 do
  begin
    Dispose(ResultsExtendedList.Items[ResultsExtendedList.Count-1]);
    ResultsExtendedList.Delete(ResultsExtendedList.Count-1);
  end;
  ListBox1.Clear;
  LocationHighlightedIndex:=0;
  PathHighlightedIndex:=0;
end;


procedure TFormLPSearch.SearchByLocationNum;
var
  tstr,tstr1:WideString;
  i,no,ind:integer;
  sri:PSearchResultItem;
begin
  tstr:=trimEX(SEdit.Text);
  if tstr='' then exit;
  tstr1:='';
  for i:=1 to length(tstr) do if (tstr[i]>='0') and (tstr[i]<='9') then tstr1:=tstr1+tstr[i];

  no:=StrToIntEC(tstr1);

  ind:=0;
  for i:=1 to FormMain.Game.LocationsValue do
    if FormMain.Game.Locations[i].LocationNumber = no then begin ind:=i; break; end;

  if ind<=0 then exit;



  new(sri);
  sri.LocationIndex := ind;
  sri.PathIndex := 0;
  ResultsList.Add(sri);

  new(sri);
  sri.LocationIndex := ind;
  sri.PathIndex := 0;
  ResultsExtendedList.Add(sri);

  tstr:='L'+IntToStrEC(no);
  ListBox1.AddItem(tstr,nil);
end;

procedure TFormLPSearch.SearchByPathNum;
var
  tstr,tstr1:WideString;
  i,no,ind:integer;
  sri:PSearchResultItem;
begin
  tstr:=trimEX(SEdit.Text);
  if tstr='' then exit;
  tstr1:='';
  for i:=1 to length(tstr) do if (tstr[i]>='0') and (tstr[i]<='9') then tstr1:=tstr1+tstr[i];

  no:=StrToIntEC(tstr1);

  ind:=0;
  for i:=1 to FormMain.Game.PathesValue do
    if FormMain.Game.Pathes[i].PathNumber = no then begin ind:=i; break; end;

  if ind<=0 then exit;

  new(sri);
  sri.LocationIndex := 0;
  sri.PathIndex := ind;
  ResultsList.Add(sri);

  new(sri);
  sri.LocationIndex := 0;
  sri.PathIndex := ind;
  ResultsExtendedList.Add(sri);

  tstr := 'P'+IntToStrEC(no);
  ListBox1.AddItem(tstr,nil);
end;

procedure TFormLPSearch.SearchByParamNum;
var
  tstr,tstr1:WideString;
  i,j,no:integer;
  sri:PSearchResultItem;
  loc:TLocation;
  path:TPath;
  delta:TParameterDelta;
  found:boolean;
begin
  tstr:=trimEX(SEdit.Text);
  if tstr='' then exit;
  tstr1:='';
  for i:=1 to length(tstr) do if (tstr[i]>='0') and (tstr[i]<='9') then tstr1:=tstr1+tstr[i];

  no:=StrToIntEC(tstr1);

  for i:=1 to FormMain.Game.LocationsValue do
  begin
    loc:=FormMain.Game.Locations[i];
    delta:=loc.FindDeltaForParNum(no);
    found:=false;

    if (delta<>nil) and not delta.DeltaHasNoEffect(FormMain.Game.ParsList) then
    begin
      found:=true;
      new(sri);
      sri.LocationIndex := i;
      sri.PathIndex := 0;
      ResultsExtendedList.Add(sri);

      tstr := 'L'+IntToStrEC(loc.LocationNumber)+' (change';
      if delta.DeltaExprFlag then
      begin
        if (trimEX(delta.Expression.text) <> '') then tstr:=tstr + ' =' + trimEX(delta.Expression.text);
      end
      else if delta.DeltaApprFlag then tstr:=tstr + ' =' + IntToStrEC(delta.delta)
      else if delta.delta<>0 then
      begin
        if delta.DeltaPercentFlag then
        begin
          if delta.delta>=0 then tstr:=tstr + ' +' + IntToStrEC(delta.delta) + '%'
          else tstr:=tstr + ' ' + IntToStrEC(delta.delta) + '%';
        end else begin
          if delta.delta>=0 then tstr:=tstr + ' +' + IntToStrEC(delta.delta)
          else tstr:=tstr + ' ' + IntToStrEC(delta.delta);
        end;
      end;

      if delta.ParameterViewAction = 1 then tstr:=tstr + ' show'
      else if delta.ParameterViewAction = 2 then tstr:=tstr + ' hide';

      tstr:=tstr+')';


      ListBox1.AddItem(tstr,nil);
    end;

    if Pos('[p'+IntToStrEC(no)+']',trimEX(loc.LocDescrExprOrder.Text))>0 then
    begin
      found:=true;
      new(sri);
      sri.LocationIndex := i;
      sri.PathIndex := 0;
      ResultsExtendedList.Add(sri);

      tstr := 'L'+IntToStrEC(loc.LocationNumber)+' (expr)';
      ListBox1.AddItem(tstr,nil);
    end;

    for j:=1 to loc.DParsValue do
    begin
      delta:=loc.DPars[j];
      if not delta.DeltaExprFlag then continue;
      if Pos('[p'+IntToStrEC(no)+']',trimEX(delta.Expression.Text))>0 then
      begin
        found:=true;
        new(sri);
        sri.LocationIndex := i;
        sri.PathIndex := 0;
        ResultsExtendedList.Add(sri);

        tstr := 'L'+IntToStrEC(loc.LocationNumber)+' (expr for p'+IntToStrEC(delta.ParNum)+')';
        ListBox1.AddItem(tstr,nil);
      end;
    end;

    if found then
    begin
      new(sri);
      sri.LocationIndex := i;
      sri.PathIndex := 0;
      ResultsList.Add(sri);
    end;

  end;

  for i:=1 to FormMain.Game.PathesValue do
  begin
    path:=FormMain.Game.Pathes[i];
    delta:=path.FindDeltaForParNum(no);
    found:=false;

    if (delta<>nil) and not delta.DeltaHasNoEffect(FormMain.Game.ParsList) then
    begin
      found:=true;
      new(sri);
      sri.LocationIndex := 0;
      sri.PathIndex := i;
      ResultsExtendedList.Add(sri);

      tstr := 'P'+IntToStrEC(path.PathNumber)+' (change';
      if delta.DeltaExprFlag then
      begin
        if (trimEX(delta.Expression.text) <> '') then tstr:=tstr + ' =' + trimEX(delta.Expression.text);
      end
      else if delta.DeltaApprFlag then tstr:=tstr + ' =' + IntToStrEC(delta.delta)
      else if delta.delta<>0 then
      begin
        if delta.DeltaPercentFlag then tstr:=tstr + ' +' + IntToStrEC(delta.delta) + '%'
        else tstr:=tstr + ' +' + IntToStrEC(delta.delta);
      end;

      if delta.ParameterViewAction = 1 then tstr:=tstr + ' show'
      else if delta.ParameterViewAction = 2 then tstr:=tstr + ' hide';

      tstr:=tstr+')';

      ListBox1.AddItem(tstr,nil);
    end;

    if (delta<>nil) and not delta.GateHasNoEffect(FormMain.Game.ParsList) then
    begin
      found:=true;
      new(sri);
      sri.LocationIndex := 0;
      sri.PathIndex := i;
      ResultsExtendedList.Add(sri);

      tstr := 'P'+IntToStrEC(path.PathNumber)+' (cond)';
      ListBox1.AddItem(tstr,nil);
    end;

    if Pos('[p'+IntToStrEC(no)+']',trimEX(path.LogicExpression.Text))>0 then
    begin
      found:=true;
      new(sri);
      sri.LocationIndex := 0;
      sri.PathIndex := i;
      ResultsExtendedList.Add(sri);

      tstr := 'P'+IntToStrEC(path.PathNumber)+' (expr)';
      ListBox1.AddItem(tstr,nil);
    end;

    for j:=1 to path.DParsValue do
    begin
      delta:=path.DPars[j];
      if not delta.DeltaExprFlag then continue;
      if Pos('[p'+IntToStrEC(no)+']',trimEX(delta.Expression.Text))>0 then
      begin
        found:=true;
        new(sri);
        sri.LocationIndex := 0;
        sri.PathIndex := i;
        ResultsExtendedList.Add(sri);

        tstr := 'P'+IntToStrEC(path.PathNumber)+' (expr for p'+IntToStrEC(delta.ParNum)+')';
        ListBox1.AddItem(tstr,nil);
      end;
    end;

    if found then
    begin
      new(sri);
      sri.LocationIndex := 0;
      sri.PathIndex := i;
      ResultsList.Add(sri);
    end;

  end;
end;

procedure TFormLPSearch.SearchByTextFragment;
var
  tstr,tstr1:WideString;
  i,j:integer;
  sri:PSearchResultItem;
  loc:TLocation;
  path:TPath;
  delta:TParameterDelta;
  found:boolean;
begin
  tstr:=trimEX(SEdit.Text);
  if tstr='' then exit;

  for i:=1 to FormMain.Game.LocationsValue do
  begin
    found:=false;
    loc:=FormMain.Game.Locations[i];
    for j:=1 to loc.CntDescriptions do
      if Pos(tstr,trimEX(loc.LocationDescriptions[j].Text.Text))>0 then
      begin
        found:=true;

        new(sri);
        sri.LocationIndex := i;
        sri.PathIndex := 0;
        ResultsExtendedList.Add(sri);

        tstr1 := 'L'+IntToStrEC(loc.LocationNumber)+' (description '+IntToStrEC(j)+')';
        ListBox1.AddItem(tstr1,nil);
      end;

    for j:=1 to loc.DParsValue do
    begin
      delta:=loc.DPars[j];
      if FormMain.Game.Pars[delta.ParNum].ParType = NoCriticalParType then continue;
      if (delta.CustomCriticalEvent) = nil then continue;
      if Pos(tstr,trimEX(delta.CustomCriticalEvent.Text.Text))>0 then
      begin
        found:=true;

        new(sri);
        sri.LocationIndex := i;
        sri.PathIndex := 0;
        ResultsExtendedList.Add(sri);

        tstr1 := 'L'+IntToStrEC(loc.LocationNumber)+' (critical message for p'+IntToStrEC(delta.ParNum)+')';
        ListBox1.AddItem(tstr1,nil);
      end;
    end;

    if found then
    begin
      new(sri);
      sri.LocationIndex := i;
      sri.PathIndex := 0;
      ResultsList.Add(sri);
    end;
  end;

  for i:=1 to FormMain.Game.PathesValue do
  begin
    found:=false;
    path:=FormMain.Game.Pathes[i];

    if Pos(tstr,trimEX(path.StartPathMessage.Text))>0 then
    begin
      found:=true;

      new(sri);
      sri.LocationIndex := 0;
      sri.PathIndex := i;
      ResultsExtendedList.Add(sri);

      tstr1 := 'P'+IntToStrEC(path.PathNumber)+' (start path text)';
      ListBox1.AddItem(tstr1,nil);
    end;

    if Pos(tstr,trimEX(path.EndPathEvent.Text.Text))>0 then
    begin
      found:=true;

      new(sri);
      sri.LocationIndex := 0;
      sri.PathIndex := i;
      ResultsExtendedList.Add(sri);

      tstr1 := 'P'+IntToStrEC(path.PathNumber)+' (end path text)';
      ListBox1.AddItem(tstr1,nil);
    end;

    for j:=1 to path.DParsValue do
    begin
      delta:=path.DPars[j];
      if FormMain.Game.Pars[delta.ParNum].ParType = NoCriticalParType then continue;
      if (delta.CustomCriticalEvent) = nil then continue;
      if Pos(tstr,trimEX(delta.CustomCriticalEvent.Text.Text))>0 then
      begin
        found:=true;

        new(sri);
        sri.LocationIndex := 0;
        sri.PathIndex := i;
        ResultsExtendedList.Add(sri);

        tstr1 := 'P'+IntToStrEC(path.PathNumber)+' (critical message for p'+IntToStrEC(delta.ParNum)+')';
        ListBox1.AddItem(tstr1,nil);
      end;
    end;

    if found then
    begin
      new(sri);
      sri.LocationIndex := 0;
      sri.PathIndex := i;
      ResultsList.Add(sri);
    end;
  end;

  {for i:=1 to FormMain.Game.ParsValue do
  begin
    for j:= 1 to FormMain.Game.Pars[i].ValueOfViewStrings do
    begin
      if Pos(tstr,trimEX(FormMain.Game.Pars[i].ViewFormatStrings[j].str.Text))>0 then
        ShowMessage('p'+inttostrEC(i)+':'+FormMain.Game.Pars[i].ViewFormatStrings[j].str.Text);
    end;
  end;}


end;

procedure TFormLPSearch.SearchByResource;
var
  tstr,tstr1:WideString;
  i,j:integer;
  sri:PSearchResultItem;
  loc:TLocation;
  path:TPath;
  delta:TParameterDelta;
  found:boolean;
begin
  tstr:=trimEX(SEdit.Text);
  //if tstr='' then exit;

  for i:=1 to FormMain.Game.LocationsValue do
  begin
    found:=false;
    loc:=FormMain.Game.Locations[i];
    for j:=1 to loc.CntDescriptions do
    begin
      tstr1:=trimEX(loc.LocationDescriptions[j].Image.Text);
      if (tstr1<>'') and ((tstr='') or (Pos(tstr,tstr1)>0)) then
      begin
        found:=true;

        new(sri);
        sri.LocationIndex := i;
        sri.PathIndex := 0;
        ResultsExtendedList.Add(sri);

        tstr1 := 'L'+IntToStrEC(loc.LocationNumber)+' (image '+tstr1+')';
        ListBox1.AddItem(tstr1,nil);
      end;

      tstr1:=trimEX(loc.LocationDescriptions[j].Sound.Text);
      if (tstr1<>'') and ((tstr='') or (Pos(tstr,tstr1)>0)) then
      begin
        found:=true;

        new(sri);
        sri.LocationIndex := i;
        sri.PathIndex := 0;
        ResultsExtendedList.Add(sri);

        tstr1 := 'L'+IntToStrEC(loc.LocationNumber)+' (sound '+tstr1+')';
        ListBox1.AddItem(tstr1,nil);
      end;

      tstr1:=trimEX(loc.LocationDescriptions[j].BGM.Text);
      if (tstr1<>'') and ((tstr='') or (Pos(tstr,tstr1)>0)) then
      begin
        found:=true;

        new(sri);
        sri.LocationIndex := i;
        sri.PathIndex := 0;
        ResultsExtendedList.Add(sri);

        tstr1 := 'L'+IntToStrEC(loc.LocationNumber)+' (bgm '+tstr1+')';
        ListBox1.AddItem(tstr1,nil);
      end;
    end;

    for j:=1 to loc.DParsValue do
    begin
      delta:=loc.DPars[j];
      if FormMain.Game.Pars[delta.ParNum].ParType = NoCriticalParType then continue;
      if (delta.CustomCriticalEvent) = nil then continue;

      tstr1:=trimEX(delta.CustomCriticalEvent.Image.Text);
      if (tstr1<>'') and ((tstr='') or (Pos(tstr,tstr1)>0)) then
      begin
        found:=true;

        new(sri);
        sri.LocationIndex := i;
        sri.PathIndex := 0;
        ResultsExtendedList.Add(sri);

        tstr1 := 'L'+IntToStrEC(loc.LocationNumber)+' (image '+ tstr1 +' in critical message for p'+IntToStrEC(delta.ParNum)+')';
        ListBox1.AddItem(tstr1,nil);
      end;

      tstr1:=trimEX(delta.CustomCriticalEvent.Sound.Text);
      if (tstr1<>'') and ((tstr='') or (Pos(tstr,tstr1)>0)) then
      begin
        found:=true;

        new(sri);
        sri.LocationIndex := i;
        sri.PathIndex := 0;
        ResultsExtendedList.Add(sri);

        tstr1 := 'L'+IntToStrEC(loc.LocationNumber)+' (sound '+ tstr1 +' in critical message for p'+IntToStrEC(delta.ParNum)+')';
        ListBox1.AddItem(tstr1,nil);
      end;

      tstr1:=trimEX(delta.CustomCriticalEvent.BGM.Text);
      if (tstr1<>'') and ((tstr='') or (Pos(tstr,tstr1)>0)) then
      begin
        found:=true;

        new(sri);
        sri.LocationIndex := i;
        sri.PathIndex := 0;
        ResultsExtendedList.Add(sri);

        tstr1 := 'L'+IntToStrEC(loc.LocationNumber)+' (bgm '+ tstr1 +' in critical message for p'+IntToStrEC(delta.ParNum)+')';
        ListBox1.AddItem(tstr1,nil);
      end;


    end;

    if found then
    begin
      new(sri);
      sri.LocationIndex := i;
      sri.PathIndex := 0;
      ResultsList.Add(sri);
    end;
  end;

  for i:=1 to FormMain.Game.PathesValue do
  begin
    found:=false;
    path:=FormMain.Game.Pathes[i];

    tstr1:=trimEX(path.EndPathEvent.Image.Text);
    if (tstr1<>'') and ((tstr='') or (Pos(tstr,tstr1)>0)) then
    begin
      found:=true;

      new(sri);
      sri.LocationIndex := 0;
      sri.PathIndex := i;
      ResultsExtendedList.Add(sri);

      tstr1 := 'P'+IntToStrEC(path.PathNumber)+' (end path image '+tstr1+')';
      ListBox1.AddItem(tstr1,nil);
    end;

    tstr1:=trimEX(path.EndPathEvent.Sound.Text);
    if (tstr1<>'') and ((tstr='') or (Pos(tstr,tstr1)>0)) then
    begin
      found:=true;

      new(sri);
      sri.LocationIndex := 0;
      sri.PathIndex := i;
      ResultsExtendedList.Add(sri);

      tstr1 := 'P'+IntToStrEC(path.PathNumber)+' (end path sound '+tstr1+')';
      ListBox1.AddItem(tstr1,nil);
    end;

    tstr1:=trimEX(path.EndPathEvent.BGM.Text);
    if (tstr1<>'') and ((tstr='') or (Pos(tstr,tstr1)>0)) then
    begin
      found:=true;

      new(sri);
      sri.LocationIndex := 0;
      sri.PathIndex := i;
      ResultsExtendedList.Add(sri);

      tstr1 := 'P'+IntToStrEC(path.PathNumber)+' (end path bgm '+tstr1+')';
      ListBox1.AddItem(tstr1,nil);
    end;



    for j:=1 to path.DParsValue do
    begin
      delta:=path.DPars[j];
      if FormMain.Game.Pars[delta.ParNum].ParType = NoCriticalParType then continue;
      if (delta.CustomCriticalEvent) = nil then continue;

      tstr1:=trimEX(delta.CustomCriticalEvent.Image.Text);
      if (tstr1<>'') and ((tstr='') or (Pos(tstr,tstr1)>0)) then
      begin
        found:=true;

        new(sri);
        sri.LocationIndex := i;
        sri.PathIndex := 0;
        ResultsExtendedList.Add(sri);

        tstr1 := 'P'+IntToStrEC(path.PathNumber)+' (image '+ tstr1 +' in critical message for p'+IntToStrEC(delta.ParNum)+')';
        ListBox1.AddItem(tstr1,nil);
      end;

      tstr1:=trimEX(delta.CustomCriticalEvent.Sound.Text);
      if (tstr1<>'') and ((tstr='') or (Pos(tstr,tstr1)>0)) then
      begin
        found:=true;

        new(sri);
        sri.LocationIndex := i;
        sri.PathIndex := 0;
        ResultsExtendedList.Add(sri);

        tstr1 := 'P'+IntToStrEC(path.PathNumber)+' (sound '+ tstr1 +' in critical message for p'+IntToStrEC(delta.ParNum)+')';
        ListBox1.AddItem(tstr1,nil);
      end;

      tstr1:=trimEX(delta.CustomCriticalEvent.BGM.Text);
      if (tstr1<>'') and ((tstr='') or (Pos(tstr,tstr1)>0)) then
      begin
        found:=true;

        new(sri);
        sri.LocationIndex := i;
        sri.PathIndex := 0;
        ResultsExtendedList.Add(sri);

        tstr1 := 'P'+IntToStrEC(path.PathNumber)+' (bgm '+ tstr1 +' in critical message for p'+IntToStrEC(delta.ParNum)+')';
        ListBox1.AddItem(tstr1,nil);
      end;
    end;

    if found then
    begin
      new(sri);
      sri.LocationIndex := 0;
      sri.PathIndex := i;
      ResultsList.Add(sri);
    end;
  end;


end;


procedure TFormLPSearch.Search;
begin
  ClearSearchResult;
  case SearchType of
    0: SearchByLocationNum;
    1: SearchByPathNum;
    2: SearchByParamNum;
    3: SearchByTextFragment;
    4: SearchByResource;
  end;
end;

procedure TFormLPSearch.ListBox1Click(Sender: TObject);
var pt:TPoint;
    ind:integer;
    sri:PSearchResultItem;
    x,y:integer;
begin
  GetCursorPos(pt);
  pt := ScreenToClient(pt);
  pt.X:=pt.X-ListBox1.Left;
  pt.Y:=pt.Y-ListBox1.Top;
  ind := ListBox1.ItemAtPos(pt, True);
  if ind < 0 then exit;
  sri:=ResultsExtendedList.Items[ind];

  if LocationHighlightedIndex<>sri.LocationIndex then LocationHighlightedIndex:=sri.LocationIndex
  else LocationHighlightedIndex:=0;

  if PathHighlightedIndex<>sri.PathIndex then PathHighlightedIndex:=sri.PathIndex
  else PathHighlightedIndex:=0;

  if LocationHighlightedIndex>0 then
  begin
    x:=FormMain.Game.Locations[LocationHighlightedIndex].screenx;
    y:=FormMain.Game.Locations[LocationHighlightedIndex].screeny;
    FormMain.NavigateTo(x,y,false);
  end
  else if PathHighlightedIndex>0 then
  begin
    x:=FormMain.Game.Pathes[PathHighlightedIndex].PathXCoords[10];
    y:=FormMain.Game.Pathes[PathHighlightedIndex].PathYCoords[10];
    FormMain.NavigateTo(x,y,false);
  end;
  FormMain.NiceRepaint;
end;

procedure TFormLPSearch.ListBox1DblClick(Sender: TObject);
var pt:TPoint;
    ind:integer;
    sri:PSearchResultItem;
begin
  GetCursorPos(pt);
  pt := ScreenToClient(pt);
  pt.X:=pt.X-ListBox1.Left;
  pt.Y:=pt.Y-ListBox1.Top;
  ind := ListBox1.ItemAtPos(pt, True);
  if ind < 0 then exit;
  sri:=ResultsExtendedList.Items[ind];

  if sri.LocationIndex>0 then FormMain.OpenLocationEdit(sri.LocationIndex)
  else if sri.PathIndex>0 then FormMain.OpenPathEdit(sri.PathIndex);
  //Search;
end;

procedure TFormLPSearch.SEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SearchType:=SearchTypeRG.itemindex;
    if ListBox1.Items.Count>0 then ListBox1.Selected[0]:=true;
    Search;
    FormMain.NiceRepaint;
  end;
end;

procedure TFormLPSearch.CheckBox1Click(Sender: TObject);
begin
  HighlightAll:=CheckBox1.Checked;
  FormMain.NiceRepaint;
end;

procedure TFormLPSearch.Button1Click(Sender: TObject);
begin
  SearchType:=SearchTypeRG.itemindex;
  if ListBox1.Items.Count>0 then ListBox1.Selected[0]:=true;
  Search;
  FormMain.NiceRepaint;
end;

procedure TFormLPSearch.EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var s:string;
begin
   with TCustomEdit(Sender) do
   begin
     //if not ReadOnly then
     if ((Key = ord('V'))  and (ssCtrl  in Shift)) or
        ((Key = VK_INSERT) and (ssShift in Shift)) then
     begin
       s:=ClipboardPaste;
       SendMessage (Handle, EM_REPLACESEL, 1, LongInt (@s [1]));
     end;

     if ((Key = ord('C'))   and (ssCtrl  in Shift)) or
        ((Key = VK_INSERT)  and (ssCtrl  in Shift)) or
        ((Key = ord('X'))   and (ssCtrl  in Shift)) or
        ((Key = VK_DELETE)  and (ssShift in Shift)) then ClipboardCopy(SelText);
     begin

     end;

     if ((Key = ord('A'))   and (ssCtrl  in Shift)) then begin SelectAll; Key:=0; end;
   end;
end;

end.
