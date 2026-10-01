unit MainForm;

interface

uses
  Windows, StdCtrls, ExtCtrls, Dialogs, ImgList, Controls, ComCtrls, Classes, Forms, Graphics, ToolWin,
  TextQuest,PathClass;

const
  BuildVersion='5.2.10';
  EditorConfFile='conf.bin';

  EM_Undefined=0;
  EM_NewLocation=1;
  EM_NewPath=3;
  EM_MoveLocation=5;
  EM_DeleteLocationOrPath=6;

  UndoMax=20;

  LineDrawGradient=13;
  StatusPanelD=100;
  MinDistToForm=20;
  maxstatuspanellabels=100;

type
  TFormMain = class(TForm)
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    ToolBar1: TToolBar;
    NewGameButton: TToolButton;
    ButtonsImageList: TImageList;
    LoadGameButton: TToolButton;
    SaveGameButton: TToolButton;
    ToolButton3: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    ToolButton5: TToolButton;
    ToolButton9: TToolButton;
    PlayButton: TToolButton;
    ToolButton13: TToolButton;
    ToolButton1: TToolButton;
    UndoButton: TToolButton;
    RedoButton: TToolButton;
    ToolButton11: TToolButton;
    ColorOptionsButton: TToolButton;
    ToolButton14: TToolButton;
    FreeScrollButton: TToolButton;
    FontDialog1: TFontDialog;
    ToolButton8: TToolButton;
    StatusPanel: TPanel;
    ScrollTimer: TTimer;
    ToolButton7: TToolButton;
    NavigateToolButton: TToolButton;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    OpenTextDialog: TOpenDialog;
    SaveTextDialog: TSaveDialog;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    SaveDialog1: TSaveDialog;

    procedure FormCreate(Sender: TObject);
    procedure NewGameButtonClick(Sender: TObject);
    procedure LoadFromFile(path:string);
    procedure LoadGameButtonClick(Sender: TObject);
    procedure SaveGameButtonClick(Sender: TObject);
    function  SaveGame:boolean;
    procedure SaveGameNoDialog;
    procedure UpdateCaption;
    procedure FormPaint(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure CheckCoordsDist(var x,y:integer; i:integer);
    procedure FindFreeLocationPlace(var x,y,i:integer);


    procedure DrawLine(out path:tpath; selected,void,oneQuestion,invert:boolean);
    procedure DrawPath(path_index:integer);
    procedure DrawLocation(loc_index:integer);

    procedure ToolButton9Click(Sender: TObject);

    procedure ProcessRightClick;
    procedure ProcessRightClickXY(x,y:integer);
    procedure OpenLocationEdit(loc_index:integer);
    procedure OpenPathEdit(path_index:integer);

    procedure ProcessEnabledControls;
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure PlayButtonClick(Sender: TObject);

    procedure ClearDo;
    procedure MakeDo;
    procedure MakeUndo;
    procedure MakeRedo;
    procedure UndoButtonClick(Sender: TObject);
    procedure RedoButtonClick(Sender: TObject);

    procedure SaveEditorOptions(s:WideString);
    procedure LoadEditorOptions;
    procedure SetDefaultEditorOptions;
    procedure ColorOptionsButtonClick(Sender: TObject);
    procedure FormResize(Sender: TObject);

    procedure NiceRepaint;
    procedure FormShow(Sender: TObject);
    procedure FinePositionLocations;

    procedure PositionLocationsAfterLOad;

    function ThereAlreadyIsLocation(x,y:integer):boolean;

    procedure ClearStatusPanel;
    procedure AddDoubleStroke (strl,strr:Widestring; lcolor:Tcolor);
    procedure AddSingleStroke (str:Widestring; lcolor:Tcolor);
    procedure SetStatusPanelPosition(x,y:integer);
    procedure AddSeparator;

    procedure PrintLocationStatistics(LocationIndex:integer);
    procedure PrintPathStatistics(PathIndex:integer);

    procedure NavigateTo(x:integer;y:integer;moveCursor:boolean=true);

    function GetDMousex(mx:integer):integer; //получить x-координату мыши со смещением
    function GetDMousey(my:integer):integer; //получить y-координату мыши со смещением
    function GetMaxNDX:integer;// получить максимальное количество колонок
    function GetMaxNDY:integer;// получить максимальное количество рядов
    function GetMaxEDX:integer;// получить максимальное количество колонок несвободного скроллинга
    function GetMaxEDY:integer;// получить максимальное количество колонок несвободного скроллинга

    function InScreen(x,y:integer):boolean; // находится ли точка квеста в рабочей области

    procedure ChooseFont;

    procedure StatusPanelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ScrollTimerTimer(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GenericMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FreeScrollButtonClick(Sender: TObject);
    procedure NavigateToolButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure ToolButton15Click(Sender: TObject);
    procedure ToolButton16Click(Sender: TObject);
    procedure ToolButton17Click(Sender: TObject);
    procedure ToolButton18Click(Sender: TObject);
    procedure ToolButton20Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    DrawBuffer:TBitmap;

    JustLoaded:boolean;

    ConfigFilePath:WideString;
    TgeDir:WideString;

    LocationSelectedIndex:integer;
    PathSelectedIndex:integer;

    LineFromColor:TColor;
    LineToColor:TColor;
    VoidLineFromColor:TColor;
    VoidLineToColor:TColor;
    PointerColor:TColor;
    StartLocationColor:Tcolor;
    EndLocationColor:TColor;
    FailLocationColor:TColor;
    DefaultLocationColor:TColor;
    BackGroundColor:TColor;
    HighlightExt:TColor;
    HighlightInt:TColor;
    PathHelpPanelColor:TColor;
    LocationHelpPanelColor:TColor;
    AbsPathColor:TColor;
    NotAbsPathColor:TColor;
    SameQNoDescrStartColor:TColor;
    SameQNoDescrEndColor:TColor;
    SameQDescrStartColor:TColor;
    SameQDescrEndColor:TColor;
    VoidObjectColor:TColor;
    VoidObjectStartColor:TColor;

    DrawPathType:integer;

    PassabilityAutocorrection:boolean;
    MinorVersionAutoIncrement:boolean;



    ParNameHelpPanelType:integer;

    StatusPanelSflag:boolean;
    SPN:integer;

    Game: TTextQuest;// Данные квеста

    UndoArray:array [0..UndoMax-1] of TTextQuest;
    UndoStart:integer;
    UndoPos:integer;
    UndoEnd:integer;

    EditMode:integer;
    MouseDownCoords:TPoint;
    MouseLeftPressed:boolean;
    MouseUpCoords:TPoint;

    //Панель подсказки
    ParentWidth:integer;
    ParentHeight:integer;

    TopPrint:integer;
    Border:integer;
    StdLabelWidth:integer;

    Labels:array [1..maxstatuspanellabels] of TLabel;

    LoadingData:boolean;
    ActiveLabelsValue:integer;

		ReSetPath:integer;
		NeedToSaveChanges:boolean;
		ShiftPressed:boolean;

    OnNiceRepaintFlag:boolean;
    ActiveChildsCount:integer;
    ClientMouseX,ClientMouseY:integer;
    ScrollDelay:integer; //Задержка сктроллинга

    ndx:integer; //смещение по х в колонках левого верхнего угла экрана
    ndy:integer; //смещение по у в рядах левого верхнего угла экрана
    maxedx:integer;
    maxedy:integer;

    LastFileDate:string;
  end;

var
  FormMain: TFormMain;
  ExePath:WideString;

implementation

uses Math, SysUtils, MessageText, FileCtrl,
     ColorOptionsForm, LocationEditForm, PathEditForm, MainPropertiesEdit, SearchForm, PlayForm, VersionForm,
     TextFieldClass, LocationClass, CalcParseClass, ParameterClass, ParameterDeltaClass,
     EC_Str;

{$R *.DFM}


procedure TFormMain.ChooseFont;
begin
	FontDialog1.Options := [fdLimitSize,fdEffects];
	FontDialog1.MaxFontSize := 8;
	FontDialog1.MinFontSize := 16;
  inc(ActiveChildsCount);
	if FontDialog1.Execute then
  begin
    FormLocationEdit.Font := FontDialog1.Font;
    FormMain.Font := FontDialog1.Font;
    FormPathEdit.Font := FontDialog1.Font;
    FormPropertiesEdit.Font := FontDialog1.Font;
    FormPlay.Font := FontDialog1.Font;
    FormColorOptions.Font := FontDialog1.Font;
  end;
  dec(ActiveChildsCount);
end;

procedure TFormMain.NavigateTo(x:integer;y:integer;moveCursor:boolean);
var new_ndx,new_ndy:integer;
	gx,gy:integer;
	ss:TShiftState;
  pt:TPoint;
begin
	new_ndx:=x div trunc(ClientWidth/Game.BlockXgradient)-Game.BlockXgradient div 2;
	new_ndy:=y div trunc(ClientHeight/Game.BlockYgradient)-Game.BlockYgradient div 2;
  if new_ndy<0 then new_ndy:=0;
  if new_ndx<0 then new_ndx:=0;
  if ((new_ndx<>ndx) or (new_ndy<>ndy)) and not InScreen(x,y) then
  begin
    ndx:=new_ndx;
    ndy:=new_ndy;
  end;
  ss:=[];
	x:=x-trunc(ClientWidth/Game.BlockXgradient)*ndx;
 	y:=y-trunc(ClientHeight/Game.BlockYgradient)*ndy;

  gx:=x+3+FormMain.Left;
  gy:=y+22+FormMain.Top;
  if moveCursor then SetCursorPos(gx,gy);

  if (gx>FormLPSearch.Left) and (gx<FormLPSearch.Left+FormLPSearch.Width) and (gy>FormLPSearch.Top) and (gy<FormLPSearch.Top+FormLPSearch.Height) then
  begin
    if ((gx-FormLPSearch.Width-20)>FormMain.Left) then FormLPSearch.Left:=FormLPSearch.Left-FormLPSearch.Width-20
    else FormLPSearch.Left:=FormLPSearch.Left+FormLPSearch.Width+20;
    //if ((gy-FormLPSearch.Height-20)>FormMain.Top) then FormLPSearch.Top:=FormLPSearch.Top-FormLPSearch.Height-20
    //else FormLPSearch.Top:=FormLPSearch.Top+FormLPSearch.Height+20;
  end;

  if moveCursor then FormMain.MouseMove(ss,x,y)
  else begin
    GetCursorPos(pt);
    FormMain.MouseMove(ss,pt.x,pt.y);
  end;
end;

function TFormMain.InScreen(x,y:integer):boolean; // находится ли точка квеста в рабочей области
var zx,zy:integer;
begin
	zx:=x-ndx*(ClientWidth div Game.BlockXGradient);
	zy:=y-ndy*(ClientHeight div Game.BlockYGradient);
	InScreen := (zx<ClientWidth) and (zx>=0) and (zy<ClientHeight) and (zy>=0);
end;

function TFormMain.GetDMousex(mx:integer):integer; //получить x-координату мыши со смещением
begin
	GetDMousex:=(ClientWidth div Game.BlockXgradient)*ndx+mx;
end;

function TFormMain.GetDMousey(my:integer):integer; //получить y-координату мыши со смещением
begin
	GetDMousey:=(ClientHeight div Game.BlockYgradient)*ndy+my;
end;

function TFormMain.GetMaxNDX:integer;// получить максимальное количество колонок
begin
	GetMaxNDX:=Game.BlockXgradient*scrxmaxvalue;
end;

function TFormMain.GetMaxNDY:integer;// получить максимальное количество рядов
begin
	GetMaxNDY:=Game.BlockYgradient*scrymaxvalue;
end;

function TFormMain.GetMaxEDX:integer;// получить максимальное количество колонок несвободного скроллинга
var found,i:integer;
begin
	found:=0;
  with Game do
  begin
    for i:=1 to LocationsValue do
      if Locations[i].screenx>found then found:=Locations[i].screenx;

    GetMaxEDX:=found div (ClientWidth div BlockXGradient)+1;
  end;
end;

function TFormMain.GetMaxEDY:integer;// получить максимальное количество колонок несвободного скроллинга
var found,i:integer;
begin
	found:=0;
  with Game do
  begin
    for i:=1 to LocationsValue do
      if Locations[i].screeny>found then found:=Locations[i].screeny;

    GetMaxEDY:=found div (ClientHeight div BlockYGradient)+1;
  end;
end;

procedure TFormMain.AddSeparator;
begin
  AddSingleStroke('------------------------------------------------------------------------',clTeal);
end;

procedure TFormMain.ClearStatusPanel;
var i:integer;
begin
  StatusPanel.Visible:=false;
  StdLabelWidth:=215;
  Border:=7;
  topprint:=border;
  for i:=1 to maxstatuspanellabels do
  begin
    Labels[i].Visible:=false;
    Labels[i].transparent:=true;
    Labels[i].Caption:='';
    Labels[i].WordWrap:=true;
    Labels[i].Autosize:=false;
    Labels[i].Left:=border;
    Labels[i].width:=StdLabelWidth;
  end;
  ActiveLabelsValue:=0;

  StatusPanel.Height:=topprint+border;
  StatusPanel.Width:=230;
end;

Procedure TFormMain.SetStatusPanelPosition(x,y:integer);

	Procedure FloatPosition;
	begin
		if (x+StatusPanel.Width+StatusPanelD)>ClientWidth then StatusPanel.left:=x-StatusPanel.Width-StatusPanelD
		else StatusPanel.left:=x+StatusPanelD;

    if (y+StatusPanel.Height+ToolBar1.Height+StatusPanelD)>ClientHeight then StatusPanel.top:=y-StatusPanel.Height-StatusPanelD
		else StatusPanel.top:=y+StatusPanelD;

    if StatusPanel.top<0 then StatusPanel.top:=MinDistToForm;

    if StatusPanel.top+StatusPanel.Height>ClientHeight then StatusPanel.top:=ClientHeight-MinDistToForm-StatusPanel.Height;
	end;

begin
	if StatusPanelSflag then
  begin
    case SPN of
      0: begin
        StatusPanel.left:=MinDistToForm;
        StatusPanel.top:=MinDistToForm;
      end;
      1: begin
        StatusPanel.left:=MinDistToForm;
        StatusPanel.top:=ClientHeight div 2 - StatusPanel.Height div 2;
      end;
      2: begin
        StatusPanel.left:=MinDistToForm;
        StatusPanel.top:=ClientHeight-StatusPanel.Height-MinDistToForm;
      end;
      3: begin
        StatusPanel.left:=ClientWidth div 2 - StatusPanel.Width div 2;
        StatusPanel.top:=MinDistToForm;
      end;
      4: begin
        StatusPanel.left:=ClientWidth div 2 - StatusPanel.Width div 2;
        StatusPanel.top:=ClientHeight div 2 - StatusPanel.Height div 2;
      end;
      5: begin
        StatusPanel.left:=ClientWidth div 2 - StatusPanel.Width div 2;
        StatusPanel.top:=ClientHeight-StatusPanel.Height-MinDistToForm;
      end;
      6: begin
        StatusPanel.left:=ClientWidth-StatusPanel.Width-MinDistToForm;
        StatusPanel.top:=MinDistToForm;
      end;
      7: begin
        StatusPanel.left:=ClientWidth-StatusPanel.Width-MinDistToForm;
        StatusPanel.top:=ClientHeight div 2 - StatusPanel.Height div 2;
      end;
      8: begin
        StatusPanel.left:=ClientWidth-StatusPanel.Width-MinDistToForm;
        StatusPanel.top:=ClientHeight-StatusPanel.Height-MinDistToForm;
      end;
    end;
  end else begin
    case SPN of
      0: begin
        StatusPanel.left:=x-StatusPanel.Width-StatusPanelD;
        StatusPanel.top:=y-StatusPanel.Height-StatusPanelD;
      end;
      1: begin
        StatusPanel.left:=x-StatusPanel.Width-StatusPanelD;
        StatusPanel.top:=y - StatusPanel.Height div 2;
      end;
      2: begin
        StatusPanel.left:=x-StatusPanel.Width-StatusPanelD;
        StatusPanel.top:=y + StatusPanel.Height div 2;
      end;
      3: begin
        StatusPanel.left:=x- StatusPanel.Width div 2;
        StatusPanel.top:=y-StatusPanel.Height-StatusPanelD;
      end;
      4: begin
        StatusPanel.left:=x - StatusPanel.Width div 2;
        StatusPanel.top:=y - StatusPanel.Height div 2;
      end;
      5: begin
        StatusPanel.left:=x- StatusPanel.Width div 2;
        StatusPanel.top:=y + StatusPanel.Height div 2;
      end;
      6: begin
        StatusPanel.left:=x + StatusPanel.Width div 2;
        StatusPanel.top:=y-StatusPanel.Height-StatusPanelD;
      end;
      7: begin
        StatusPanel.left:=x + StatusPanel.Width div 2;
        StatusPanel.top:=y - StatusPanel.Height div 2;
      end;
      8: begin
        StatusPanel.left:=x + StatusPanel.Width div 2;
        StatusPanel.top:=y + StatusPanel.Height div 2;
      end;
    end;
  end;

  if (x>=StatusPanel.left) and (x<=StatusPanel.left+StatusPanel.Width) and (y>=StatusPanel.top) and (y<=StatusPanel.top+StatusPanel.Height) then FloatPosition;
  if (StatusPanel.left<0) or (StatusPanel.left+StatusPanel.Width>ClientWidth) or (StatusPanel.top<0) or (StatusPanel.top+StatusPanel.Height>ClientHeight) then FloatPosition;
end;

procedure TFormMain.AddDoubleStroke (strl,strr:Widestring; lcolor:Tcolor);
var tstrr:WideString;
	  tstrl:WideString;
    i,c:integer;
begin
  inc(ActiveLabelsValue);
  Labels[ActiveLabelsValue].WordWrap:=false;
  Labels[ActiveLabelsValue].top:=Topprint;
  Labels[ActiveLabelsValue].Alignment:=tarightjustify;
  Labels[ActiveLabelsValue].font.color:=lcolor;

  inc(ActiveLabelsValue);
  Labels[ActiveLabelsValue].WordWrap:=false;
  Labels[ActiveLabelsValue].top:=Topprint;
  Labels[ActiveLabelsValue].Alignment:=taleftjustify;
  Labels[ActiveLabelsValue].font.color:=lcolor;

  tstrl:='';
  i:=1;
  while (i<6) and (i<=length(strl)) do
  begin
    tstrl:=tstrl+strl[i];
    inc(i);
  end;

  tstrr:='';
  c:=length(strr);
  while (c>0) and (StdLabelWidth > (10 + Labels[ActiveLabelsValue].Canvas.TextExtent(tstrr).cx + Labels[ActiveLabelsValue-1].Canvas.TextExtent(tstrl).cx)) do
  begin
    tstrr:=strr[c]+tstrr;
    dec(c);
  end;

  c:=6;
  while (c<=length(strl)) and (StdLabelWidth > (10 + Labels[ActiveLabelsValue].Canvas.TextExtent(tstrr).cx + Labels[ActiveLabelsValue-1].Canvas.TextExtent(tstrl).cx)) do
  begin
    tstrl:=tstrl+strl[c];
    inc(c);
  end;

  Labels[ActiveLabelsValue-1].caption:=tstrr;
  Labels[ActiveLabelsValue].caption:=tstrl;

  Labels[ActiveLabelsValue-1].Visible:=true;
  Labels[ActiveLabelsValue].Visible:=true;

  topprint:=topprint+Labels[ActiveLabelsValue].Height+4;
  StatusPanel.height:=topprint;
end;

procedure TFormMain.AddSingleStroke (str:Widestring; lcolor:Tcolor);
begin
  inc(ActiveLabelsValue);

  Labels[ActiveLabelsValue].caption:=trimEX(str);

  Labels[ActiveLabelsValue].top:=Topprint;
  Labels[ActiveLabelsValue].Alignment:=taleftjustify;
  Labels[ActiveLabelsValue].wordwrap:=true;
  Labels[ActiveLabelsValue].Autosize:=true;

  Labels[ActiveLabelsValue].caption:=Labels[ActiveLabelsValue].caption;

  Labels[ActiveLabelsValue].Autosize:=false;
  Labels[ActiveLabelsValue].width:=stdlabelwidth;

  Labels[ActiveLabelsValue].font.color:=lcolor;
  Labels[ActiveLabelsValue].Alignment:=tacenter;

  Labels[ActiveLabelsValue].Visible:=true;

  topprint:=topprint+Labels[ActiveLabelsValue].Height+4;

  StatusPanel.Height:=topprint;
end;


function TFormMain.ThereAlreadyIsLocation(x,y:integer):boolean;
var i:integer;
    xd,yd:integer;
    xc,yc:integer;
begin
  Result:=true;

  xd:=ClientWidth div Game.BlockXGradient;
  yd:=ClientHeight div Game.BlockYGradient;

  for i:=1 to Game.LocationsValue do
  begin
    with Game.Locations[i] do
    begin
      xc:=round(screenx/xd);
      if xc*xd>screenx then dec(xc);
      yc:=round(screeny/yd);
      if yc*yd>screeny then dec(yc);
    end;
    if (x >= xc*xd) and (x < xc*xd + xd) and (y >= yc*yd) and (y  < yc*yd + yd) then exit;
  end;

  Result:=false;
end;


procedure TFormMain.FinePositionLocations;
var i:integer;
    xd,yd:integer;
    xc,yc:integer;
    miny,exy:integer;
begin
	miny:=100000000;
	xd:=ClientWidth div Game.BlockXGradient;
	yd:=ClientHeight div Game.BlockYGradient;
  for i:=1 to Game.LocationsValue do
  begin
    with Game.Locations[i] do
    begin
      xc:=round(screenx/xd);
      if xc*xd>screenx then dec(xc);
      yc:=round(screeny/yd);
      if yc*yd>screeny then dec(yc);

      screenx:=xc*xd + xd div 2;
      screeny:=yc*yd + yd div 2;
      if screeny<miny then miny:=screeny;
    end;
  end;

  if miny<35 then
  begin
    exy:=round(35/yd);
    if exy<35 then exy:=exy+yd;
		for i:=1 to Game.LocationsValue do
			Game.Locations[i].screeny:=Game.Locations[i].screeny+exy;//yd div 2;
    FinePositionLocations;
  end;
end;

procedure TFormMain.FindFreeLocationPlace(var x,y,i:integer);
var c:integer;
    gxd,gyd:integer;
    xc,yc:integer;
    xa,ya:integer;
    found:boolean;
begin
  gxd:=Game.XScreenResolution div Game.BlockXGradient;
  gyd:=Game.YScreenResolution div Game.BlockYGradient;
  for xc:=1 to GetMaxNDX-1 do
  begin
    for yc:=1 to GetMaxNDY-1 do
    begin
      xa:=xc*gxd + gxd div 2;
      ya:=yc*gyd + gyd div 2;
      found:=true;
      for c:=1 to i do
      begin
        if (c<>i) and (Game.Locations[c].screenx >= xc*gxd) and
           (Game.Locations[c].screenx < xc*gxd + gxd ) and
           (Game.Locations[c].screeny >= yc*gyd) and
           (Game.Locations[c].screeny < yc*gyd + gyd ) then
        begin
          found:=false;
          break;
        end;
      end;
      if found then
      begin
        x:=xa;
        y:=ya;
        exit;
      end;
    end;
  end;
end;

procedure TFormMain.CheckCoordsDist(var x,y:integer; i:integer);
var c:integer;
begin
  for c:=1 to Game.LocationsValue do
  begin
    if i=c then continue;
    if ((x>Game.XScreenResolution*scrxmaxvalue) or (y>Game.YScreenResolution*scrymaxvalue) or (x<0) or (y<0) or
        ((1>abs(x-Game.Locations[c].screenx)) and (1>abs(y-Game.Locations[c].screeny)))) then FindFreeLocationPlace(x,y,i);
  end;
end;

procedure TFormMain.PositionLocationsAfterLoad;
var i:integer;
    xd,yd:integer;
    gxd,gyd:integer;
    xc,yc:integer;
    xa,ya: integer;
begin
  xd:=ClientWidth div Game.BlockXGradient;
  yd:=ClientHeight div Game.BlockYGradient;
  gxd:=Game.XScreenResolution div Game.BlockXGradient;
  gyd:=Game.YScreenResolution div Game.BlockYGradient;

  for i:=1 to Game.LocationsValue do
    with Game do
    begin
      if Locations[i].screenx>XScreenResolution*scrxmaxvalue then Locations[i].screenx:=XScreenResolution*scrxmaxvalue;
      if Locations[i].screeny>YScreenResolution*scrymaxvalue then Locations[i].screeny:=YScreenResolution*scrymaxvalue;
    end;

  Game.XScreenResolution:=ClientWidth;
  Game.YScreenResolution:=ClientHeight;

  for i:=1 to Game.LocationsValue do
    with Game.Locations[i] do
    begin
      xc:=round(screenx/gxd);
      if xc*gxd>screenx then dec(xc);
      yc:=round(screeny/gyd);
      if yc*gyd>screeny then dec(yc);
      xa:=xc*xd + xd div 2;
      ya:=yc*yd + yd div 2;
      screenx:=xa;
      screeny:=ya;
      CheckCoordsDist(xa,ya,i);
      screenx:=xa;
      screeny:=ya;
    end;
end;


procedure TFormMain.SaveEditorOptions(s:WideString);
var f:file;
	  flag:boolean;
begin
  AssignFile(f,s);
  rewrite(f,1);

  ConfigFilePath:=s;

  BlockWrite(f,LineFromColor, sizeof(LineFromColor));
  BlockWrite(f,LineToColor, sizeof(LineToColor));
  BlockWrite(f,VoidLineFromColor, sizeof(VoidLineFromColor));
  BlockWrite(f,VoidLineToColor, sizeof(VoidLineToColor));
  BlockWrite(f,PointerColor, sizeof(PointerColor));
  BlockWrite(f,StartLocationColor, sizeof(StartLocationColor));
  BlockWrite(f,EndLocationColor, sizeof(EndLocationColor));
  BlockWrite(f,FailLocationColor, sizeof(FailLocationColor));
  BlockWrite(f,DefaultLocationColor, sizeof(DefaultLocationColor));
  BlockWrite(f,BackGroundColor, sizeof(BackGroundColor));
  BlockWrite(f,HighlightExt, sizeof(HighlightExt));
  BlockWrite(f,HighlightInt, sizeof(HighlightInt));
  BlockWrite(f,PathHelpPanelColor, sizeof(PathHelpPanelColor));
  BlockWrite(f,LocationHelpPanelColor, sizeof(LocationHelpPanelColor));
  BlockWrite(f,AbsPathColor, sizeof(AbsPathColor));
  BlockWrite(f,NotAbsPathColor, sizeof(NotAbsPathColor));
  BlockWrite(f,DrawPathType, sizeof(DrawPathType));
  BlockWrite(f,ParNameHelpPanelType, sizeof(ParNameHelpPanelType));
  BlockWrite(f,SameQNoDescrStartColor, sizeof(SameQNoDescrStartColor));
  BlockWrite(f,SameQNoDescrEndColor, sizeof(SameQNoDescrEndColor));
  BlockWrite(f,SameQDescrStartColor, sizeof(SameQDescrStartColor));
  BlockWrite(f,SameQDescrEndColor, sizeof(SameQDescrEndColor));
  BlockWrite(f,VoidObjectColor, sizeof(VoidObjectColor));
  BlockWrite(f,VoidObjectStartColor, sizeof(VoidObjectStartColor));
  BlockWrite(f,SPN, sizeof(SPN));
  BlockWrite(f,StatusPanelSflag, sizeof(StatusPanelSflag));
  flag:=FreeScrollButton.Down;
  BlockWrite(f,flag, sizeof(flag));
  BlockWrite(f,PassabilityAutocorrection, sizeof(PassabilityAutocorrection));
  BlockWrite(f,MinorVersionAutoIncrement, sizeof(MinorVersionAutoIncrement));

  CloseFile(f);
end;

procedure TFormMain.LoadEditorOptions;
var f:file;
	  flag:boolean;
begin
  AssignFile(f,ConfigFilePath);
  reset(f,1);


  BlockRead(f,LineFromColor, sizeof(LineFromColor));
  BlockRead(f,LineToColor, sizeof(LineToColor));
  BlockRead(f,VoidLineFromColor, sizeof(VoidLineFromColor));
  BlockRead(f,VoidLineToColor, sizeof(VoidLineToColor));
  BlockRead(f,PointerColor, sizeof(PointerColor));
  BlockRead(f,StartLocationColor, sizeof(StartLocationColor));
  BlockRead(f,EndLocationColor, sizeof(EndLocationColor));
  BlockRead(f,FailLocationColor, sizeof(FailLocationColor));
  BlockRead(f,DefaultLocationColor, sizeof(DefaultLocationColor));
  BlockRead(f,BackGroundColor, sizeof(BackGroundColor));
  BlockRead(f,HighlightExt, sizeof(HighlightExt));
  BlockRead(f,HighlightInt, sizeof(HighlightInt));
  BlockRead(f,PathHelpPanelColor, sizeof(PathHelpPanelColor));
  BlockRead(f,LocationHelpPanelColor, sizeof(LocationHelpPanelColor));
  BlockRead(f,AbsPathColor, sizeof(AbsPathColor));
  BlockRead(f,NotAbsPathColor, sizeof(NotAbsPathColor));
  BlockRead(f,DrawPathType, sizeof(DrawPathType));
  BlockRead(f,ParNameHelpPanelType, sizeof(ParNameHelpPanelType));
  BlockRead(f,SameQNoDescrStartColor, sizeof(SameQNoDescrStartColor));
  BlockRead(f,SameQNoDescrEndColor, sizeof(SameQNoDescrEndColor));
  BlockRead(f,SameQDescrStartColor, sizeof(SameQDescrStartColor));
  BlockRead(f,SameQDescrEndColor, sizeof(SameQDescrEndColor));

  BlockRead(f,VoidObjectColor, sizeof(VoidObjectColor));
  BlockRead(f,VoidObjectStartColor, sizeof(VoidObjectStartColor));

  BlockRead(f,SPN, sizeof(SPN));
  BlockRead(f,StatusPanelSflag, sizeof(StatusPanelSflag));

  BlockRead(f,flag, sizeof(flag));
  FreeScrollButton.Down:=flag;

  BlockRead(f,PassabilityAutocorrection, sizeof(PassabilityAutocorrection));
  BlockRead(f,MinorVersionAutoIncrement, sizeof(MinorVersionAutoIncrement));

  CloseFile(f);
  NiceRepaint;
end;

procedure TFormMain.SetDefaultEditorOptions;
begin
  LineFromColor:=TColor($00FFFFFF);
  LineToColor:=TColor($00FF0000);
  VoidLineFromColor:=TColor($00FFdd00);
  VoidLineToColor:=TColor($00AAAA00);
  PointerColor:=TColor($00FF0000);
  StartLocationColor:=TColor($00FF5555);
  EndLocationColor:=TColor($0000FF00);
  FailLocationColor:=TColor($000000AA);
  DefaultLocationColor:=TColor($00FFFFFF);
  BackGroundColor:=TColor($00AAAAAA);
  HighlightExt:=TColor($00000000);//TColor($00EB57FB);
  HighlightInt:=TColor($004080FF);
  PathHelpPanelColor:=TColor($0098E2E7);//TColor($00B8F1F0);
  LocationHelpPanelColor:=TColor($0098E2E7);
  AbsPathColor:=TColor($00ff0000);
  NotAbsPathColor:=TColor($000000ff);
  SameQNoDescrStartColor:=TColor($0096c8f5);
  SameQNoDescrEndColor:=TColor($00000080);
  SameQDescrStartColor:=TColor($00ffffff);
  SameQDescrEndColor:=TColor($00000080);

  VoidObjectColor:=TColor($00004000);
  VoidObjectStartColor:=TColor($00FFFFFF);
  DrawPathType:=0;
  ParNameHelpPanelType:=2;
    
  SPN:=5;
  StatusPanelSflag:=false;

  PassabilityAutocorrection:=false;
  MinorVersionAutoIncrement:=false;
  
end;

procedure TFormMain.FormCreate(Sender: TObject);
var i:integer;
begin
  ExePath:= ExtractFilePath(Application.ExeName);

	ndx:=0;
	ndy:=0;
	OnNiceRepaintFlag:=false;
	ActiveChildsCount:=0;
	ScrollDelay:=0;
	ReSetPath:=0;
	Randomize;
	for i:=1 to maxstatuspanellabels do Labels[i]:=TLabel.Create(StatusPanel);

  LocationSelectedIndex:=0;
  PathSelectedIndex:=0;

	LoadingData:=false;
	DrawBuffer:=TBitmap.Create;
	DrawBuffer.Height:=Height;
	DrawBuffer.Width:=Width;
	Game:=TTextQuest.Create();
	for i:=0 to UndoMax-1 do UndoArray[i]:=TTextQuest.Create();
	ClearDo;
	EditMode:=EM_Undefined;
	ConfigFilePath:=ExePath + EditorConfFile;
  TgeDir:=GetCurrentDir;

	if FileExists(ConfigFilePath) then LoadEditorOptions
  else begin
		SetDefaultEditorOptions;
    SaveEditorOptions(ConfigFilePath);
  end;

	NeedToSaveChanges:=false;

  UpdateCaption;

  NewGameButton.Hint:=QuestMessages.ParPath_Get('FormMain.NewQuest');
  LoadGameButton.Hint:=QuestMessages.ParPath_Get('FormMain.LoadQuest');
  SaveGameButton.Hint:=QuestMessages.ParPath_Get('FormMain.SaveQuest');
  UndoButton.Hint:=QuestMessages.ParPath_Get('FormMain.Undo');
  RedoButton.Hint:=QuestMessages.ParPath_Get('FormMain.Redo');
  ToolButton2.Hint:=QuestMessages.ParPath_Get('FormMain.NewLocation');
  ToolButton6.Hint:=QuestMessages.ParPath_Get('FormMain.NewPath');
  ToolButton4.Hint:=QuestMessages.ParPath_Get('FormMain.DeleteLocationOrPath');
  ToolButton5.Hint:=QuestMessages.ParPath_Get('FormMain.MoveLocationOrPath');
  ToolButton9.Hint:=QuestMessages.ParPath_Get('FormMain.QuestProperties');
  ToolButton10.Hint:=QuestMessages.ParPath_Get('FormMain.CheckErrors');
  ToolButton12.Hint:=QuestMessages.ParPath_Get('FormMain.QuestVersion');
  PlayButton.Hint:=QuestMessages.ParPath_Get('FormMain.StartGame');
  ColorOptionsButton.Hint:=QuestMessages.ParPath_Get('FormMain.TuneColors');
  FreeScrollButton.Hint:=QuestMessages.ParPath_Get('FormMain.FreeScroll');
  NavigateToolButton.Hint:=QuestMessages.ParPath_Get('FormMain.Search');

  ToolButton15.Hint:=QuestMessages.ParPath_Get('FormMain.ExportQuestTexts');
  ToolButton16.Hint:=QuestMessages.ParPath_Get('FormMain.MassExportTexts');
  ToolButton17.Hint:=QuestMessages.ParPath_Get('FormMain.ImportQuestTexts');
  ToolButton18.Hint:=QuestMessages.ParPath_Get('FormMain.MassImportTexts');

  OpenDialog.Title:=QuestMessages.ParPath_Get('FormMain.LoadDialog');
  SaveDialog.Title:=QuestMessages.ParPath_Get('FormMain.SaveDialog');
end;

procedure TFormMain.ProcessEnabledControls;
begin
  UndoButton.Enabled:=(UndoPos>UndoStart);
  RedoButton.Enabled:=(UndoPos<UndoEnd);
  NiceRepaint;
end;

procedure TFormMain.ClearDo;
var i:integer;
begin
  for i:=0 to UndoMax-1 do UndoArray[i].Clear;
  UndoStart:=0;
  UndoEnd:=0;
  UndoPos:=0;
  UndoArray[0].CopyDataFrom(Game);
  maxedx:=GetMaxEDX;
  maxedy:=GetMaxEDY;
  ProcessEnabledControls;
  Game.RecalculatePathes;
  Game.ClearSequences;
  if PassabilityAutocorrection then Game.FindOneWaySequences;
  Game.SeekOneQuestionPathes;
end;


procedure TFormMain.MakeDo;
begin
  if (UndoEnd-UndoStart)>=UndoMax-1 then inc(UndoStart);
  inc(UndoPos);
  UndoEnd:=UndoPos;
  UndoArray[UndoPos mod UndoMax].CopyDataFrom(Game);
  maxedx:=GetMaxEDX;
  maxedy:=GetMaxEDY;
  ProcessEnabledControls;
end;

procedure TFormMain.MakeUndo;
begin
  if UndoPos>UndoStart then
  begin
    dec(UndoPos);
    Game.CopyDataFrom(UndoArray[UndoPos mod UndoMax]);
  end;
  maxedx:=GetMaxEDX;
  maxedy:=GetMaxEDY;
  Game.ClearSequences;
  if PassabilityAutocorrection then Game.FindOneWaySequences;
  Game.SeekOneQuestionPathes;
  if FormLPSearch.Visible then FormLPSearch.Search;
  ProcessEnabledControls;
end;

procedure TFormMain.MakeRedo;
begin
  if UndoPos<UndoEnd then
  begin
    inc(UndoPos);
    Game.CopyDataFrom(UndoArray[UndoPos mod UndoMax]);
  end;
  Game.ClearSequences;
  if PassabilityAutocorrection then Game.FindOneWaySequences;
  Game.SeekOneQuestionPathes;
  if FormLPSearch.Visible then FormLPSearch.Search;
  ProcessEnabledControls;
end;

procedure TFormMain.NewGameButtonClick(Sender: TObject);
begin
  SaveDialog.FileName:='';
  OpenDialog.FileName:='';
  FormPropertiesEdit.FormGame.Clear;
  FormPropertiesEdit.FormGame.ParsList.Add(TParameter.Create(1));
  FormPropertiesEdit.FormGame.XScreenResolution:=ClientWidth;
  FormPropertiesEdit.FormGame.YScreenResolution:=ClientHeight;
  inc(ActiveChildsCount);
  FormPropertiesEdit.ShowModal;
  dec(ActiveChildsCount);
  if FormPropertiesEdit.is_ok_pressed then
  begin
    Game.Clear;
    Game.CopyDataFrom(FormPropertiesEdit.FormGame);
    ndx:=0;
    ndy:=0;
    LastFileDate:='';
    UpdateCaption;
    ClearDo;
    NeedToSaveChanges:=true;
  end;

  if FormLPSearch.Visible then FormLPSearch.Search;
  NiceRepaint;
end;

procedure TFormMain.LoadFromFile(path:string);
var astr:AnsiString;
begin
    astr:=path;
    LoadingData:=true;
    Game.Clear;

    JustLoaded:=true;
    Game.Load(PChar(astr));
    if PassabilityAutocorrection then Game.FindOneWaySequences;
    ndx:=0;
    ndy:=0;
    PositionLocationsAfterLoad;
    LoadingData:=false;
    Game.RecalculatePathes;
    Game.SeekOneQuestionPathes;
    ClearDo;
    //MakeDo;
    SaveDialog.FileName:=path;//OpenDialog.FileName;
    OpenDialog.FileName:=path;
    LastFileDate:=DateToStr(FileDateToDateTime(FileAge(path)));
    UpdateCaption;
    NeedToSaveChanges:=false;
    JustLoaded:=false;
    if FormLPSearch.Visible then FormLPSearch.Search;
end;

procedure TFormMain.LoadGameButtonClick(Sender: TObject);
var s,s1:WideString;
	  cfgfilename:WideString;
    Path:TTextField;
    f:file;
    i:integer;
begin
	inc(ActiveChildsCount);
  Path:=TTextField.Create;
  cfgfilename:=TgeDir+'\'+'path.cfg';
	if FileExists(cfgfilename) then
  begin
    AssignFile(f,cfgfilename);
    Reset(f,1);
    path.Load(@f);
    closefile(f);
    OpenDialog.InitialDir:=trimEX(path.Text);
    SaveDialog.InitialDir:=trimEX(path.Text);
  end;

  if OpenDialog.Execute then //LoadFromFile;
  begin
    s:=OpenDialog.filename;
    s1:=s;
    for i:=length(s) downto 1 do
    begin
      if s[i]<>'\' then SetLength(s1,i-1)
      else break;
    end;
    Path.Text:=s1;
    AssignFile(f,cfgfilename);
    Rewrite(f,1);
    path.Save(@f);
    closefile(f);
    SaveDialog.InitialDir:=trimEX(path.Text);

    LoadFromFile(s);

  end;

	dec(ActiveChildsCount);
	Path.Destroy;
end;

function TFormMain.SaveGame:boolean;
var s,s1:WideString;
	  cfgfilename,ext:WideString;
    Path:TTextField;
    f:file;
    i:integer;
    astr:ansistring;
    compatible:boolean;
begin
  Result:=false;
	inc(ActiveChildsCount);
  Path:=TTextField.Create;
  cfgfilename:=TgeDir+'\'+'path.cfg';
	if FileExists(cfgfilename) then
  begin
    AssignFile(f,cfgfilename);
    Reset(f,1);
    path.Load(@f);
    closefile(f);
    OpenDialog.InitialDir:=trimEX(path.Text);
    SaveDialog.InitialDir:=trimEX(Path.Text);
  end;

  compatible:=false;
  SaveDialog.FilterIndex:=1;
  if trimEX(SaveDialog.FileName) <>'' then
  begin
    s:=SaveDialog.filename;
    ext:=GetStrParEC(s,GetCountParEC(s,'.')-1,'.');
    if (ext = 'qm') or (ext = 'QM') then
    begin
      if not PassabilityAutocorrection then
      begin
        Game.ClearSequences;
        Game.FindOneWaySequences;
      end;
      if Game.CompatibleWithOldFormat then begin compatible:=true; SaveDialog.FilterIndex:=2; end;
      if not PassabilityAutocorrection then Game.ClearSequences;
    end
    else if (ext = 'qmm') or (ext = 'QMM') then SaveDialog.FilterIndex:=1
    else SaveDialog.FilterIndex:=3;
  end;

  if SaveDialog.Execute then
  begin
    s:=SaveDialog.filename;
    s1:=s;
    for i:=length(s) downto 1 do
    begin
      if s[i]<>'\' then SetLength(s1,i-1)
      else break;
    end;
    Path.Text:=s1;
    ext:=GetStrParEC(s,GetCountParEC(s,'.')-1,'.');

    AssignFile(f,cfgfilename);
    Rewrite(f,1);
    path.Save(@f);
    closefile(f);
    OpenDialog.InitialDir:=trimEX(path.Text);

    Game.XScreenResolution:=ClientWidth;
    Game.YScreenResolution:=ClientHeight;

    if (ext = 'qm') or (ext = 'QM') then
    begin
      if not compatible then
      begin
        if not PassabilityAutocorrection then
        begin
          Game.ClearSequences;
          Game.FindOneWaySequences;
        end;
        compatible:=Game.CompatibleWithOldFormat(true);
        if not PassabilityAutocorrection then Game.ClearSequences;
      end;

      if compatible then
      begin
        if Game.HasLinkedResources and (MessageDlg(QuestMessages.Par_Get('LinkedResourcesWarning'),mtConfirmation, [mbYes, mbNo],0)=mrNo) then
        else begin
          astr:=s;
          if MinorVersionAutoIncrement then inc(Game.QuestMinorVersion);
          Game.Save_4_3_0(PAnsiChar(astr));
          LastFileDate:=DateToStr(FileDateToDateTime(FileAge(s)));
          Result:=true;
          UpdateCaption;
        end;
      end;

    end else begin
      astr:=s;
      if MinorVersionAutoIncrement then inc(Game.QuestMinorVersion);
      Game.Save_5_0_2(PAnsiChar(astr));
      LastFileDate:=DateToStr(FileDateToDateTime(FileAge(s)));
      Result:=true;
      UpdateCaption;
    end;


    ClearDo;
    NeedToSaveChanges:=false;
  end;
  dec(ActiveChildsCount);
	Path.Destroy;
end;

procedure TFormMain.SaveGameButtonClick(Sender: TObject);
begin
	SaveGame;
end;

procedure TFormMain.SaveGameNoDialog;
var s,ext:WideString;
    astr:ansistring;
begin
  s:=SaveDialog.filename;
  if trimEX(s) ='' then
  begin
    SaveGameButtonClick(nil);
    exit;
  end;

  ext:=GetStrParEC(s,GetCountParEC(s,'.')-1,'.');
  if (ext = 'qm') and not Game.CompatibleWithOldFormat then
  begin
    SaveGameButtonClick(nil);
    exit;
  end;

  Game.XScreenResolution:=ClientWidth;
  Game.YScreenResolution:=ClientHeight;

  astr:=s;

  if ext='qm' then
  begin
    if Game.HasLinkedResources and (MessageDlg(QuestMessages.Par_Get('LinkedResourcesWarning'),mtConfirmation, [mbYes, mbNo],0)=mrNo) then exit
    else begin
      if MinorVersionAutoIncrement then inc(Game.QuestMinorVersion);
      Game.Save_4_3_0(PAnsiChar(astr));
      LastFileDate:=DateToStr(FileDateToDateTime(FileAge(s)));
    end;
  end
  else begin
    if MinorVersionAutoIncrement then inc(Game.QuestMinorVersion);
    Game.Save_5_0_2(PAnsiChar(astr));
    LastFileDate:=DateToStr(FileDateToDateTime(FileAge(s)));
  end;

  UpdateCaption;
  ClearDo;
  NeedToSaveChanges:=false;

end;

procedure TFormMain.UpdateCaption;
var s:WideString;
begin
  s:=SaveDialog.filename;
  if (s<>'') and (Game<>nil) then
  begin
    s:=s+' (v' + inttostrEC(Game.QuestMajorVersion) + '.' + inttostrEC(Game.QuestMinorVersion);
    if LastFileDate<>'' then s:=s + ', ' + LastFileDate;
    s:=s+') ';
  end;
  s:=s + StringReplaceEC(QuestMessages.ParPath_Get('FormMain.Caption'),'<Version>',BuildVersion);
  Caption:=s;
end;

procedure TFormMain.DrawLine(out path:TPath; selected,void,oneQuestion,invert:boolean);
var q:integer;
    dR,dG,dB:integer;
    t:extended;
    ltc,lfc:TColor;
    tx,ty,tx1,ty1,zx,zy:integer;
begin
  if not void then
  begin
    ltc:=LineToColor;
    lfc:=LineFromColor;
  end else begin
    ltc:=VoidLineToColor;
    lfc:=VoidLineFromColor;
  end;

  if oneQuestion then
  begin
    if trimEX(Path.EndPathEvent.Text.Text)='' then
    begin
      ltc:=SameQNoDescrEndColor;
      lfc:=SameQNoDescrStartColor;
    end else begin
      ltc:=SameQDescrEndColor;
      lfc:=SameQDescrStartColor;
    end;
  end;

  if (trimEX(Path.EndPathEvent.Text.Text)='') and (trimEX(Path.StartPathMessage.Text)='') then
  begin
    ltc:=VoidObjectColor;
    lfc:=VoidObjectStartColor;
  end;

  if DrawPathType=1 then
  begin
    if Path.PassesAllowed=0 then
    begin
      ltc:=AbsPathColor;
      lfc:=LineFromColor;
    end else begin
      ltc:=NotAbsPathColor;
      lfc:=LineFromColor;
    end;
  end;

  if selected then
  begin
    ltc:=HighlightInt;
    lfc:=HighlightInt;
  end;

  dB:=integer(ltc and $00FF0000) shr 16-integer(lfc and $00FF0000) shr 16;
  dG:=integer(ltc and $0000FF00) shr 8-integer(lfc and $0000FF00) shr 8;
  dR:=integer(ltc and $000000FF)-integer(lfc and $000000FF);

  with path do
  begin
    zx:=(ClientWidth div Game.BlockXgradient)*ndx;
    zy:=(ClientHeight div Game.BlockYgradient)*ndy;
    for q:=0 to maxpathcoords-1 do
    begin
      tx:=PathXCoords[q]-zx;
      ty:=PathYCoords[q]-zy;
      tx1:=PathXCoords[q+1]-zx;
      ty1:=PathYCoords[q+1]-zy;
      if ((tx>=0) and (tx<ClientWidth) and (ty>=0) and (ty<ClientHeight)) or
         ((tx1>=0) and (tx1<ClientWidth) and (ty1>=0) and (ty1<ClientHeight)) then
      begin
        t:=q/(maxpathcoords+1);
        with DrawBuffer.Canvas do
        begin
          if invert then pen.color:=TColor(ltc-integer(trunc(dB*t))*65536-integer(trunc(dG*t))*256-integer(trunc(dR*t)))
          else pen.color:=TColor(lfc+integer(trunc(dB*t))*65536+integer(trunc(dG*t))*256+integer(trunc(dR*t)));
          MoveTo(tx,ty);
          LineTo(tx1,ty1);
        end;
      end;
    end;
  end;
  DrawBuffer.Canvas.pen.color:=TColor($00000000);
end;

procedure TFormMain.DrawPath(path_index:integer);
var  ax,ay,bx,by,zx,zy,i:integer;
     a1x,a1y,a2x,a2y :integer;
     r,w,m,z:extended;
     //tnmc2:Tcolor;
     onequestionpath:bool;
     c:integer;
     path:TPath;
     selected,search1,searchAll:boolean;
     sri:PSearchResultItem;
begin
  path:=Game.Pathes[path_index];
  selected:=(path_index=PathSelectedIndex);
  search1:=false;
  searchAll:=false;

  if FormLPSearch.Visible then
  begin
    search1:=(path_index = FormLPSearch.PathHighlightedIndex);

    if FormLPSearch.HighlightAll then
      for i:=0 to FormLPSearch.ResultsList.Count-1 do
      begin
        sri:=FormLPSearch.ResultsList.Items[i];
        if sri.PathIndex<>path_index then continue;
        searchAll:=true;
        break;
      end;
  end;

  //arc
  if search1 then
  begin
    DrawBuffer.Canvas.pen.Width:=6;
    DrawLine(path,true,false,true,true);
  end
  else if searchAll then
  begin
    DrawBuffer.Canvas.pen.Width:=4;
    DrawLine(path,true,false,true,true);
  end;

  onequestionpath := path.IsPathVariant;

  DrawBuffer.Canvas.pen.Width:=1;
  if search1 then DrawBuffer.Canvas.pen.Width:=3
  else if searchAll then DrawBuffer.Canvas.pen.Width:=2
  else if selected then DrawBuffer.Canvas.pen.Width:=2;

	with path do
  begin
    DrawLine(path,false,VoidPathFlag,onequestionpath,false);
		c:=Game.GetLocationIndex(ToLocation);

		zx:=(ClientWidth div Game.BlockXgradient)*ndx;
    zy:=(ClientHeight div Game.BlockYgradient)*ndy;

		ax:=PathXCoords[maxpathcoords-5]-zx;
		ay:=PathYCoords[maxpathcoords-5]-zy;
		bx:=Game.Locations[c].screenx-zx;
		by:=Game.Locations[c].screeny-zy;
	end;


  //arrow
  r:=sqrt(sqr(ax-bx) + sqr(ay-by));
  if r=0 then r:=1;
  if by<ay then w:=arccos((ax-bx)/r) else w:=pi+arccos((bx-ax)/r);

  z:=15;
  m:=w+pi/10;
  a1x:=trunc(z*cos(m)+ bx);
  a1y:=trunc(z*sin(m)+ by);

  m:=w-pi/10;
  a2x:=trunc(z*cos(m)+ bx);
  a2y:=trunc(z*sin(m)+ by);

  with DrawBuffer.Canvas do
  begin
		Pen.Color:=PointerColor;
		if DrawPathType=1 then
    begin
      if path.PassesAllowed=0 then Pen.Color:=AbsPathColor
      else Pen.Color:=NotAbsPathColor;
		end;
		if path.IsPathVariant then
    begin
      if trimEX(path.EndPathEvent.Text.Text)='' then
      begin
        Pen.Color:=SameQNoDescrEndColor;
        if trimEX(path.StartPathMessage.Text)='' then Pen.Color:=VoidObjectColor;
      end else Pen.Color:=SameQDescrEndColor;
    end;

    MoveTo(a1x,a1y); DrawBuffer.Canvas.LineTo(bx,by);
		MoveTo(a2x,a2y); DrawBuffer.Canvas.LineTo(bx,by);
		pen.Width:=1;
  end;
end;


procedure TFormMain.DrawLocation(loc_index:integer);
var size:integer;
    x,y,i:integer;
    tpen, tbrush:TColor;
    loc:TLocation;
    selected:boolean;
    sri:PSearchResultItem;
begin
  loc:=Game.Locations[loc_index];
  selected:=(loc_index=LocationSelectedIndex);

  DrawBuffer.Canvas.Pen.Color:=DefaultLocationColor;
  DrawBuffer.Canvas.Brush.color:=DefaultLocationColor;

  if loc.StartLocationFlag then
  begin
    DrawBuffer.Canvas.Brush.Color:=StartLocationColor;
    DrawBuffer.Canvas.Pen.Color:=StartLocationColor;
  end
  else if loc.EndLocationFlag then
  begin
    DrawBuffer.Canvas.Brush.Color:=EndLocationColor;
    DrawBuffer.Canvas.Pen.Color:=EndLocationColor;
  end
  else if loc.FailLocationFlag then
  begin
    DrawBuffer.Canvas.Brush.Color:=FailLocationColor;
    DrawBuffer.Canvas.Pen.Color:=FailLocationColor;
  end;

  x:=loc.screenx;
  y:=loc.screeny;
  if not InScreen(x,y) then exit;

  x:=x-(ClientWidth div Game.BlockXgradient)*ndx;
  y:=y-(ClientHeight div Game.BlockYgradient)*ndy;

  tpen:=DrawBuffer.Canvas.Pen.Color;
  tbrush:=DrawBuffer.Canvas.Brush.Color;

  size:=5;
  if selected then size:=7;

  if FormLPSearch.Visible then
  begin
    if loc_index = FormLPSearch.LocationHighlightedIndex then
    begin
      DrawBuffer.Canvas.Pen.Color:=HighlightExt;
      DrawBuffer.Canvas.Brush.Color:=HighlightInt;
      DrawBuffer.Canvas.ellipse(x - size-5, y - size-5, x + size+5, y + size+5);
    end;

    if FormLPSearch.HighlightAll then
      for i:=0 to FormLPSearch.ResultsList.Count-1 do
      begin
        sri:=FormLPSearch.ResultsList.Items[i];
        if sri.LocationIndex<>loc_index then continue;
        DrawBuffer.Canvas.Pen.Color:=HighlightExt;
        DrawBuffer.Canvas.Brush.Color:=HighlightInt;
        DrawBuffer.Canvas.ellipse(x - size-3, y - size-3, x + size+3, y + size+3);
        break;
      end;
  end;



  DrawBuffer.Canvas.Pen.Color:=tpen;
  DrawBuffer.Canvas.Brush.Color:=tbrush;

  if loc.VoidLocation then
  begin
    DrawBuffer.Canvas.Pen.Color:=VoidObjectColor;
    DrawBuffer.Canvas.Brush.Color:=VoidObjectColor;
  end;

  DrawBuffer.Canvas.Ellipse(x - size,y - size,x + size,y + size);

end;

procedure TFormMain.FormPaint(Sender: TObject);
begin
  Canvas.CopyRect(Rect(0,0,Width,Height), DrawBuffer.Canvas, Rect(0,0,Width,Height));
end;

procedure TFormMain.NiceRepaint;
var i:integer;
begin
  OnNiceRepaintFlag:=true;
  //Order locations on the screen
  FinePositionLocations;

  //Begin Paint Locations
  DrawBuffer.Canvas.Pen.Color:=BackGroundColor;
  DrawBuffer.Canvas.Brush.Color:=BackGroundColor;
  DrawBuffer.Canvas.Rectangle(Rect(0,0,Width,Height));

  for i:=1 to Game.LocationsValue do DrawLocation(i);
  //EndPaintLocations

  //Begin Paint Pathes
  for i:=1 to Game.PathesValue do DrawPath(i);
  //End Paint Pathes

  Canvas.CopyRect(Rect(0,0,Width,Height), DrawBuffer.Canvas, Rect(0,0,Width,Height));

  OnNiceRepaintFlag:=false;
end;

procedure TFormMain.ProcessRightClick;
begin
  ProcessRightClickXY(MouseDownCoords.x,MouseDownCoords.y);
end;

procedure TFormMain.ProcessRightClickXY(x,y:integer);
var
  lx,ly:integer;
  i,c:integer;
begin
  i:=Game.GetClosestLocation(x,y);
  if i>0 then
  begin
    lx:=Game.Locations[i].screenx;
    ly:=Game.Locations[i].screeny;
  end else begin
    lx:=maxint;
    ly:=maxint;
  end;
  c:=Game.GetClosestPath(x,y);
       
  if (i<=0) and (c<=0) then showmessage(QuestMessages.ParPath_Get('FormMain.NothingToEditError'))
  else if (c<=0) or ((i>0) and (sqr(lx-x)+sqr(ly-y) < sqr(Game.GetPathDistance(c,x,y)))) then OpenLocationEdit(i)
  else OpenPathEdit(c);

end;

procedure TFormMain.OpenLocationEdit(loc_index:integer);
var
  tempLocation:TLocation;
begin
  tempLocation:=TLocation.Create;

  FormLocationEdit.QuestLocationIndex:=loc_index;
  tempLocation.CopyDataFrom(Game.Locations[loc_index]);
  FormLocationEdit.CanCheckStartLocation:=game.CanAddStartLocation or game.Locations[loc_index].StartLocationFlag;

  FormLocationEdit.WeMakingANewLocation:=false;
  FormLocationEdit.ShowModal;

  if FormLocationEdit.is_ok_pressed then
  begin
    Game.SeekOneQuestionPathes;
    if FormLPSearch.Visible then FormLPSearch.Search;
    NiceRepaint;
    MakeDo;
    NeedToSaveChanges:=true;
  end else begin
    Game.Locations[loc_index].CopyDataFrom(TempLocation);
    Game.SeekOneQuestionPathes;
    NiceRepaint;
  end;
  tempLocation.Destroy;
end;

procedure TFormMain.OpenPathEdit(path_index:integer);
var
  tempPath:TPath;
begin
  tempPath:=TPath.Create();
  tempPath.CopyDataFrom(Game.Pathes[path_index]);

  FormPathEdit.WeMakingANewPath:=false;
  FormPathEdit.FormPath.CopyDataFrom(Game.Pathes[path_index]);
  FormPathEdit.QuestPathIndex:=path_index;
  FormPathEdit.ShowModal;

  if FormPathEdit.is_ok_pressed or FormPathEdit.is_next_pressed then
  begin
    Game.SeekOneQuestionPathes;
    if FormLPSearch.Visible then FormLPSearch.Search;
    NiceRepaint;
    MakeDo;
    NeedToSaveChanges:=true;
  end else begin
    Game.Pathes[path_index].CopyDataFrom(tempPath);
    Game.SeekOneQuestionPathes;
    NiceRepaint;
  end;

  tempPath.Destroy;
end;

procedure TFormMain.FormClick(Sender: TObject);
var i,j,c,q,n,nl1,nl2,no:integer;
    TempLocation:TLocation;
    TempPath:TPath;
    delloc,delpath,clearloc,clearpath:boolean;
    lx,ly:integer;

    function CutStringIfNeed(txt:widestring;len:integer):widestring;
    begin
      Result:=txt;
      if len<length(Result) then
      begin
        setlength(Result,len);
        Result:=Result+'...';
      end;
    end;

    function GetOldPathStartMessage(startlocation,endlocation:integer):widestring;
    var
      answer:integer;
      i:integer;
    begin
      answer:=0;
      for i:=1 to Game.PathesValue do
        if (Game.Pathes[i].FromLocation=startlocation) and (Game.Pathes[i].ToLocation=endlocation) then answer:=i;

      if answer=0 then Result:=''
      else Result:=trimEX(Game.Pathes[answer].StartPathMessage.text);
    end;

    function GetNewPathStartMessage(startlocation,endlocation:integer):widestring;
    var
      i,j:integer;
      loc1,loc2:TLocation;
    begin
      loc1:=Game.Locations[Game.GetLocationIndex(startlocation)];
      for i:=1 to loc1.CntDescriptions do
        if trimEX(loc1.LocationDescriptions[i].Text.Text)<>'' then break;
      if i>loc1.CntDescriptions then i:=1;

      loc2:=Game.Locations[Game.GetLocationIndex(endlocation)];
      for j:=1 to loc2.CntDescriptions do
        if trimEX(loc2.LocationDescriptions[j].Text.Text)<>'' then break;
      if j>loc2.CntDescriptions then j:=1;

      Result:='  ' + CutStringIfNeed(trimEX(loc1.LocationDescriptions[i].Text.Text),100) + ' -> ' +
            CutStringIfNeed(trimEX(loc2.LocationDescriptions[j].Text.Text),100);
    end;

    function AddPath(FromLocation, ToLocation:integer):boolean;
    var
      NewPath:TPath;
      {temp,}temp1:WideString;
      NewPathNumber:integer;
      //flag:boolean;
    begin
      AddPath:=false;
      NewPath:=TPath.Create();
      NewPath.FromLocation:=FromLocation;
      NewPath.ToLocation:=ToLocation;
      NewPath.PassesAllowed:=Game.DefPathGoTimesValue;

      temp1:=GetOldPathStartMessage(FromLocation,ToLocation);

      //todo
      //temp:='  ' + CutStringIfNeed(trimEX(Game.Locations[Game.GetLocationIndex(FromLocation)].LocationDescription.Text),100) + ' -> ' +
      //      CutStringIfNeed(trimEX(Game.Locations[Game.GetLocationIndex(ToLocation)].LocationDescription.Text),100);

      if temp1<>'' then NewPath.StartPathMessage.Text:=temp1
      else NewPath.StartPathMessage.Text:=GetNewPathStartMessage(FromLocation,ToLocation);

      NewPathNumber:=Game.AddPath(NewPath);
      if PassabilityAutocorrection then Game.FindOneWaySequences;

      FormPathEdit.QuestPathIndex:=Game.GetPathIndex(NewPathNumber);
      FormPathEdit.WeMakingANewPath:=true;

      if newpathnumber=0 then exit;

      FormPathEdit.ShowModal;

      If FormPathEdit.is_ok_pressed or FormPathEdit.is_next_pressed then AddPath:=true
      else begin
        Game.DeletePath(NewPathNumber);
        AddPath:=false;
      end;

      //NewPath.Destroy;
    end;


    function AddLocation( x,y :integer):boolean;
    var
      NewLocation:TLocation;
      NewLocationNumber:integer;
      temp:WideString;
      //flag:boolean;
    begin
      NewLocation:=TLocation.Create({0});
      NewLocation.screenx:=x;
      NewLocation.screeny:=y;

      if Game.LocationsValue=0 then NewLocation.StartLocationFlag:=true;

      NewLocationNumber:=Game.AddLocation(NewLocation);

      temp:=trimEX(QuestMessages.ParPath_Get('FormMain.Location'))+' ';

      //Game.Locations[Game.GetLocationIndex(NewLocationNumber)].LocationDescription.text:=temp+IntToStrEC(NewLocationNumber);
      //Game.Locations[Game.GetLocationIndex(NewLocationNumber)].LocationDescriptionNum:=1;

      FormLocationEdit.CanCheckStartLocation:=Game.CanAddStartLocation;

      FormLocationEdit.WeMakingANewLocation:=true;
      FormLocationEdit.QuestLocationIndex:=Game.GetLocationIndex(NewLocationNumber);

      FormLocationEdit.ShowModal;

      if FormLocationEdit.is_ok_pressed then AddLocation:=true
      else begin
        AddLocation:=false;
        Game.DeleteLocation(NewLocationNumber);
      end;
      //NewLocation.Destroy;
    end;



begin
	MouseUpCoords.x:=GetDMouseX(Mouse.CursorPos.x) - ClientOrigin.x;
	MouseUpCoords.y:=GetDMouseY(Mouse.CursorPos.y) - ClientOrigin.y;

	i:=Game.GetClosestLocation(MouseDownCoords.x,MouseDownCoords.y);
  if i>0 then
  begin
    lx:=Game.Locations[i].screenx;
    ly:=Game.Locations[i].screeny;
  end else begin
    lx:=maxint;
    ly:=maxint;
  end;
  c:=Game.GetClosestPath(MouseUpCoords.x,MouseUpCoords.y);
  if (sqrt(sqr(lx-MouseUpCoords.x)+sqr(ly-MouseUpCoords.y)) < Game.GetPathDistance(c,MouseUpCoords.X,MouseUpCoords.Y)) then c:=-1;

  clearloc:=false;
  clearpath:=false;
  delloc:=false;
  delpath:=false;

  if EditMode=EM_DeleteLocationOrPath then
  begin
    if c>0 then
    begin
      if (GetAsyncKeyState(VK_CONTROL) and $8000) = $8000 then clearpath:=true
      else delpath:=true;
    end else begin
      if (GetAsyncKeyState(VK_CONTROL) and $8000) = $8000 then clearloc:=true
      else delloc:=true;
    end;
  end;

  if MouseLeftPressed then
  begin
    if EditMode=EM_NewLocation then
    begin

      if not ThereAlreadyIsLocation(MouseDownCoords.x,MouseDownCoords.y) then
      begin
        inc(ActiveChildsCount);

        if AddLocation(MouseDownCoords.x,MouseDownCoords.y) then Game.SeekOneQuestionPathes;

        if FormLPSearch.Visible then FormLPSearch.Search;
        FinePositionLocations;
        NiceRepaint;
        MakeDo;
        NeedToSaveChanges:=true;
        dec(ActiveChildsCount);
      end else begin
        inc(ActiveChildsCount);
        ShowMessage(QuestMessages.ParPath_Get('FormMain.LocationAlreadyExists'));
        dec(ActiveChildsCount);
      end;
    end;

    if delloc then
    begin
      i:=Game.GetClosestLocation(MouseDownCoords.x,MouseDownCoords.y);
      if i>0 then
      begin
        inc(ActiveChildsCount);
        if MessageDlg(QuestMessages.ParPath_Get('FormMain.DeleteLocationConfirm') + ' ' +
                      QuestMessages.ParPath_Get('FormMain.Location') + ' ' +
                      IntToStrEC(Game.Locations[i].LocationNumber), mtConfirmation, [mbYes, mbNo],0) = mrYes then
        begin
       		dec(ActiveChildsCount);

          //Now we need to delete all connected pathes
			    repeat
            q:=-1;
            for c:=1 to Game.PathesValue do
              if (Game.Pathes[c].FromLocation=Game.Locations[i].LocationNumber) or
                 (Game.Pathes[c].ToLocation=Game.Locations[i].LocationNumber) then q:=c;

            if q<>-1 then Game.DeletePath(Game.Pathes[q].PathNumber);
          until q=-1;

       		//And now we can delete location
       		Game.DeleteLocation(Game.Locations[i].LocationNumber);
  			  Game.RecalculatePathes;
          if PassabilityAutocorrection then Game.FindOneWaySequences;
			    Game.SeekOneQuestionPathes;
          if FormLPSearch.Visible then FormLPSearch.Search;
       		NiceRepaint;
  			  MakeDo;

			    NeedToSaveChanges:=true;
        end
        else dec(ActiveChildsCount);

      end else begin
        inc(ActiveChildsCount);
        ShowMessage(QuestMessages.ParPath_Get('FormMain.DeleteNothingError'));
        dec(ActiveChildsCount);
      end;
    end;

    if clearloc then
    begin
      i:=Game.GetClosestLocation(MouseDownCoords.x,MouseDownCoords.y);
      if i>0 then
      begin
        inc(ActiveChildsCount);
        if MessageDlg(QuestMessages.ParPath_Get('FormMain.ClearLocationConfirm') + ' ' +
                      QuestMessages.ParPath_Get('FormMain.Location') + ' ' +
                      IntToStrEC(Game.Locations[i].LocationNumber), mtConfirmation, [mbYes, mbNo],0) = mrYes then
        begin
       		dec(ActiveChildsCount);

          with Game.Locations[i] do
          begin
            n:=LocationNumber;
            lx:=screenx;
            ly:=screeny;
            Clear;
            LocationNumber:=n;
            screenx:=lx;
            screeny:=ly;
            if OneWaySequence<>nil then OneWaySequence.CalcLimit;
          end;

          if FormLPSearch.Visible then FormLPSearch.Search;

       		NiceRepaint;
  			  MakeDo;

			    NeedToSaveChanges:=true;
        end
        else dec(ActiveChildsCount);

      end else begin
        inc(ActiveChildsCount);
        ShowMessage(QuestMessages.ParPath_Get('FormMain.ClearNothingError'));
        dec(ActiveChildsCount);
      end;
    end;

    if delpath then
    begin
			i:=Game.GetClosestPath(MouseDownCoords.x,MouseDownCoords.y);
			if i>0 then
      begin
        inc(ActiveChildsCount);
				if MessageDlg(trimEX(QuestMessages.ParPath_Get('FormMain.DeletePathConfirm'))+' '+ trimEX(QuestMessages.ParPath_Get('FormMain.Location')+' '+
                      IntToStrEC(Game.Locations[Game.GetLocationIndex(Game.Pathes[i].FromLocation)].LocationNumber)) + '  ->  ' +
                      trimEX(QuestMessages.ParPath_Get('FormMain.Location')+' '+
                      IntToStrEC(Game.Locations[Game.GetLocationIndex(Game.Pathes[i].ToLocation)].LocationNumber)),
                      mtConfirmation, [mbYes, mbNo],0) = mrYes then
        begin
          Game.DeletePath(Game.Pathes[i].PathNumber);
          Game.RecalculatePathes;
          if PassabilityAutocorrection then Game.FindOneWaySequences;
          Game.SeekOneQuestionPathes;
          if FormLPSearch.Visible then FormLPSearch.Search;
          NiceRepaint;
          MakeDo;
          NeedToSaveChanges:=true;
        end;
        dec(ActiveChildsCount);
      end else begin
        inc(ActiveChildsCount);
        ShowMessage(QuestMessages.ParPath_Get('FormMain.DeleteNothingError'));
        dec(ActiveChildsCount);
      end;
    end;

    if clearpath then
    begin
			i:=Game.GetClosestPath(MouseDownCoords.x,MouseDownCoords.y);
			if i>0 then
      begin
        inc(ActiveChildsCount);
				if MessageDlg(trimEX(QuestMessages.ParPath_Get('FormMain.ClearPathConfirm'))+' '+ trimEX(QuestMessages.ParPath_Get('FormMain.Location')+' '+
                      IntToStrEC(Game.Locations[Game.GetLocationIndex(Game.Pathes[i].FromLocation)].LocationNumber)) + '  ->  ' +
                      trimEX(QuestMessages.ParPath_Get('FormMain.Location')+' '+
                      IntToStrEC(Game.Locations[Game.GetLocationIndex(Game.Pathes[i].ToLocation)].LocationNumber)),
                      mtConfirmation, [mbYes, mbNo],0) = mrYes then
        begin
          with Game.Pathes[i] do
          begin
            n:=PathNumber;
            nl1:=FromLocation;
            nl2:=ToLocation;
            Clear;
            PathNumber:=n;
            FromLocation:=nl1;
            ToLocation:=nl2;
            for j:=1 to DParsValue do
            begin
              DPars[j].min:=Game.Pars[DPars[j].ParNum].min;
              DPars[j].max:=Game.Pars[DPars[j].ParNum].max;
            end;
            if OneWaySequence<>nil then OneWaySequence.CalcLimit;
          end;
          if FormLPSearch.Visible then FormLPSearch.Search;

          NiceRepaint;
          MakeDo;
          NeedToSaveChanges:=true;
        end;
        dec(ActiveChildsCount);
      end else begin
        inc(ActiveChildsCount);
        ShowMessage(QuestMessages.ParPath_Get('FormMain.ClearNothingError'));
        dec(ActiveChildsCount);
      end;
    end;

    if EditMode=EM_MoveLocation then
    begin
      i:=Game.GetClosestLocation(MouseDownCoords.x,MouseDownCoords.y);

      if ReSetPath=0 then
      begin

        if i>0 then
        begin

          if ThereAlreadyIsLocation(MouseUpCoords.x,MouseUpCoords.y) then
          begin
            inc(ActiveChildsCount);
            ShowMessage(QuestMessages.ParPath_Get('FormMain.LocationAlreadyExists'));
            dec(ActiveChildsCount);
          end else begin
            if not ShiftPressed then
            begin
              Game.Locations[i].screenx:=MouseUpCoords.x;
              Game.Locations[i].screeny:=MouseUpCoords.y;
            end
          else begin
            TempLocation:=Tlocation.Create({0});
            TempLocation.CopyDataFrom(Game.Locations[i]);
            TempLocation.screenx:=MouseUpCoords.x;
            TempLocation.screeny:=MouseUpCoords.y;
            Game.AddLocation(TempLocation);
            //TempLocation.Destroy;
          end;
            FinePositionLocations;
            Game.RecalculatePathes;
            MakeDo;
            NeedToSaveChanges:=true;
          end;
        end else begin
          inc(ActiveChildsCount);
          ShowMessage(QuestMessages.ParPath_Get('FormMain.MoveNothingError'));
          dec(ActiveChildsCount);
        end;
      end else begin
        if LocationSelectedIndex>0 then
        begin
          if Game.WeNearerToPathEnd(ReSetPath, MouseDownCoords.x, MouseDownCoords.y) then
          begin
            {if Game.Pathes[ReSetPath].FromLocation<>Game.Locations[LocationSelectedIndex].LocationNumber then
            begin}
              if Game.Pathes[ReSetPath].OneWaySequence<>nil then Game.Pathes[ReSetPath].OneWaySequence.Free;
              no:=Game.GetLocationIndex(Game.Pathes[ReSetPath].ToLocation);
              if Game.Locations[no].OneWaySequence<>nil then Game.Locations[no].OneWaySequence.Free;
              no:=Game.GetLocationIndex(Game.Pathes[ReSetPath].FromLocation);
              if Game.Locations[no].OneWaySequence<>nil then Game.Locations[no].OneWaySequence.Free;
              if Game.Locations[LocationSelectedIndex].OneWaySequence<>nil then Game.Locations[LocationSelectedIndex].OneWaySequence.Free;

              if not ShiftPressed then Game.Pathes[ReSetPath].ToLocation:=Game.Locations[LocationSelectedIndex].LocationNumber
              else begin
                TempPath:=TPath.Create();
                TempPath.CopyDataFrom(Game.Pathes[ReSetPath]);
                TempPath.ToLocation:=Game.Locations[LocationSelectedIndex].LocationNumber;
                Game.AddPath(TempPath);
                if PassabilityAutocorrection then Game.FindOneWaySequences;
                //TempPath.Destroy;
              end;

              ReSetPath:=0;
              Game.RecalculatePathes;
              if PassabilityAutocorrection then Game.FindOneWaySequences;
              Game.SeekOneQuestionPathes;
              if FormLPSearch.Visible then FormLPSearch.Search;
              NiceRepaint;
              MakeDo;
              NeedToSaveChanges:=true;

            {end else begin
             	inc(ActiveChildsCount);
             	ShowMessage(QuestMessages.ParPath_Get('FormMain.PathRedirectionCreatesCycle'));
              ReSetPath:=0;
              dec(ActiveChildsCount);
            end;}

          end else begin

            {if Game.GetOutcomePathesValue(LocationSelectedIndex)<maxpathesfromonelocation then
            begin}
              {if Game.Locations[LocationSelectedIndex].LocationNumber<>Game.Pathes[ReSetPath].ToLocation then
              begin}

                if Game.Pathes[ReSetPath].OneWaySequence<>nil then Game.Pathes[ReSetPath].OneWaySequence.Free;
                no:=Game.GetLocationIndex(Game.Pathes[ReSetPath].ToLocation);
                if Game.Locations[no].OneWaySequence<>nil then Game.Locations[no].OneWaySequence.Free;
                no:=Game.GetLocationIndex(Game.Pathes[ReSetPath].FromLocation);
                if Game.Locations[no].OneWaySequence<>nil then Game.Locations[no].OneWaySequence.Free;
                if Game.Locations[LocationSelectedIndex].OneWaySequence<>nil then Game.Locations[LocationSelectedIndex].OneWaySequence.Free;

                if not ShiftPressed then Game.Pathes[ReSetPath].FromLocation:=Game.Locations[LocationSelectedIndex].LocationNumber
                else begin
                  TempPath:=TPath.Create();
                  TempPath.CopyDataFrom(Game.Pathes[ReSetPath]);
                  TempPath.FromLocation:=Game.Locations[LocationSelectedIndex].LocationNumber;
                  Game.AddPath(TempPath);
                  if PassabilityAutocorrection then Game.FindOneWaySequences;
                  //TempPath.Destroy;
                end;

                ReSetPath:=0;
                Game.RecalculatePathes;
                if PassabilityAutocorrection then Game.FindOneWaySequences;
                Game.SeekOneQuestionPathes;
                if FormLPSearch.Visible then FormLPSearch.Search;
                NiceRepaint;
                MakeDo;
                NeedToSaveChanges:=true;

              {end else begin
             	  inc(ActiveChildsCount);
             	  ShowMessage(QuestMessages.ParPath_Get('FormMain.PathRedirectionCreatesCycle'));
                ReSetPath:=0;
                dec(ActiveChildsCount);
              end;}
            {end else begin
             	inc(ActiveChildsCount);
             	ShowMessage(QuestMessages.ParPath_Get('FormMain.TooManyPathesFromLocation'));
              ReSetPath:=0;
             	dec(ActiveChildsCount);
            end;}

           end;

        end else begin
          inc(ActiveChildsCount);
          ShowMessage(QuestMessages.ParPath_Get('FormMain.NowhereToRedirect'));
          ReSetPath:=0;
          dec(ActiveChildsCount);
        end;

      end;

    end;

    if EditMode=EM_NewPath then
    begin
      if Game.LocationsValue>0 then
      begin
        i:=Game.GetClosestLocation(MouseDownCoords.x,MouseDownCoords.y);
        c:=Game.GetClosestLocation(MouseUpCoords.x,MouseUpCoords.y);
        if (i<=0) or (c<=0) then
        begin
          inc(ActiveChildsCount);
          ShowMessage(QuestMessages.ParPath_Get('FormMain.PathEndsNotSelected'));
          dec(ActiveChildsCount);
        end else begin
          {if Game.Locations[i].LocationNumber<>Game.locations[c].LocationNumber then
          begin}
         		inc(ActiveChildsCount);


				    if {Game.}AddPath(Game.Locations[i].LocationNumber,Game.Locations[c].LocationNumber) then
            begin
              Game.RecalculatePathes;
              Game.SeekOneQuestionPathes;
              if FormLPSearch.Visible then FormLPSearch.Search;
              NiceRepaint;
              MakeDo;
              NeedToSaveChanges:=true;
            end;



            dec(ActiveChildsCount);
          {end else begin
         	  inc(ActiveChildsCount);
         	  ShowMessage(QuestMessages.ParPath_Get('FormMain.NewPathCreatesCycle'));
            dec(ActiveChildsCount);
          end;}
        end;
      end else begin
        inc(ActiveChildsCount);
        ShowMessage(QuestMessages.ParPath_Get('FormMain.TooFewLocationsError'));
        dec(ActiveChildsCount);
      end;
    end;
  end; //Mouse left pressed
end;


procedure TFormMain.ToolButton2Click(Sender: TObject);
begin
  EditMode:=EM_NewLocation;
end;

procedure TFormMain.ToolButton4Click(Sender: TObject);
begin
  EditMode:=EM_DeleteLocationorPath;
end;

procedure TFormMain.ToolButton6Click(Sender: TObject);
begin
  EditMode:=EM_NewPath;
end;

procedure TFormMain.ToolButton5Click(Sender: TObject);
begin
  EditMode:=EM_MoveLocation;
end;

procedure TFormMain.FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  MouseDownCoords.x:=GetDMousex(x);
  MouseDownCoords.y:=GetDMousey(y);
  x:=GetDMousex(x);
  y:=GetDMousey(y);
  ShiftPressed:=false;
  if ssShift in Shift then ShiftPressed:=true;

  MouseLeftPressed:=(Button=mbLeft);
  if not MouseLeftPressed then ProcessRightClick;

  if LocationSelectedIndex<=0 then
  begin
    ReSetPath:=Game.GetClosestPath(X,Y);
    If ReSetPath<0 then ReSetPath:=0;
  end
end;

procedure TFormMain.FormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  MouseUpCoords.x:=GetDMousex(x);
  MouseUpCoords.y:=GetDMousey(y);
end;

procedure TFormMain.ToolButton9Click(Sender: TObject);
begin
  inc(ActiveChildsCount);
  FormPropertiesEdit.FormGame.CopyDataFrom(Game);
  FormPropertiesEdit.ShowModal;
  dec(ActiveChildsCount);
  if FormPropertiesEdit.is_ok_pressed then
  begin
    Game.CopyDataFrom(FormPropertiesEdit.FormGame);
    FinePositionLocations;
    Game.RecalculatePathes;
    Game.SeekOneQuestionPathes;
    NiceRepaint;
    MakeDo;
    NeedToSaveChanges:=false;
  end;
end;

procedure TFormMain.PrintPathStatistics(PathIndex:integer);
var i,no,lastPar,q,t,cnt:integer;
    temp,temp1,temp2,temp3,temp4,temp5,a,b,c,descr:widestring;
    NeedSeparator:boolean;
    mcolor:TColor;
begin
  ClearStatusPanel;
  StatusPanel.Color:=PathHelpPanelColor;

  AddDoubleStroke('','P '+IntToStrEC(Game.Pathes[PathIndex].PathNumber),clBlack);

  temp:='';
  if Game.Pathes[Pathindex].IsPathVariant then temp:=temp+QuestMessages.ParPath_Get('FormMain.PathVariant')+' ';
  if Game.Pathes[PathIndex].VoidPathFlag then temp:=temp+QuestMessages.ParPath_Get('FormMain.PathVoid')+' ';
  if Game.Pathes[Pathindex].IsPathVariant and Game.Pathes[PathIndex].VoidPathFlag then
  begin
    AddSingleStroke(temp,clBlack);
    temp:='';
  end;

  with Game.Pathes[PathIndex] do
  begin
    if not (Game.Pathes[Pathindex].IsPathVariant or Game.Pathes[PathIndex].VoidPathFlag) then
    begin
      if Probability>=1 then
      begin
        if trimEX(EndPathEvent.Text.Text)='' then temp:=QuestMessages.ParPath_Get('FormMain.PathWithoutDescription')
        else temp:=QuestMessages.ParPath_Get('FormMain.PathWithDescription');
      end else temp:=temp+QuestMessages.ParPath_Get('FormMain.PathWithProbablity') + ' '+floattostr(Game.Pathes[PathIndex].Probability);
      AddSingleStroke(temp,clBlack);
    end else begin
      temp:=temp+QuestMessages.ParPath_Get('FormMain.PathWithPriority') + ' '+floattostr(Game.Pathes[PathIndex].Probability);
      AddSingleStroke(temp,clBlack);
    end;
    AddSeparator;
  end;

  if not (trimEX(Game.Pathes[PathIndex].StartPathMessage.Text)='') then
  begin
    AddSingleStroke (trimEX(Game.Pathes[PathIndex].StartPathMessage.Text),clBlue);
    descr:=trimEX(Game.Pathes[PathIndex].EndPathEvent.Text.Text);
    if descr <> '' then
    begin
      if length(descr)>=255 then
      begin
        SetLength(descr,255);
        descr:=descr+' ...';
      end;
      AddSingleStroke ('-->',clBlue);
      AddSingleStroke (descr,clBlue);
    end;
    AddSeparator;
  end else begin
    descr:=trimEX(Game.Pathes[PathIndex].EndPathEvent.Text.Text);
    if descr <> '' then
    begin
      if length(descr)>=255 then
      begin
        SetLength(descr,255);
        descr:=descr+' ...';
      end;
      AddSingleStroke ('-->',clBlue);
      AddSingleStroke (descr,clBlue);
      AddSeparator;
    end;
  end;

  if trimEX(Game.Pathes[PathIndex].LogicExpression.Text)<>'' then
  begin
    AddSingleStroke(StringReplaceEC(trimEX(Game.Pathes[PathIndex].LogicExpression.Text),'&','&&'),clBlack);
    AddSeparator;
  end;

  NeedSeparator:=false;
  cnt:=0;

  lastPar:=0;
  for i:=1 to game.Pathes[PathIndex].DParsValue do
  begin
    no:=0;
    for q:=1 to game.Pathes[PathIndex].DParsValue do
    begin
      if game.Pathes[PathIndex].DPars[q].ParNum<=lastPar then continue;
      if (no=0) or (game.Pathes[PathIndex].DPars[q].ParNum<game.Pathes[PathIndex].DPars[no].ParNum) then no:=q;
    end;
    q:=no;
    lastPar:=game.Pathes[PathIndex].DPars[no].ParNum;

    if not Game.Pars[game.Pathes[PathIndex].DPars[q].ParNum].Enabled then continue;

    mcolor:=clblack;

    temp1:=trimEX(game.Pars[q].Name.text);
    if      ParNameHelpPanelType=0 then temp1:=trimEX(game.Pars[q].Name.text)
    else if ParNameHelpPanelType=1 then temp1:='[p'+IntToStrEC(game.Pathes[PathIndex].DPars[q].ParNum)+'] '
    else if ParNameHelpPanelType=2 then temp1:='[p'+IntToStrEC(game.Pathes[PathIndex].DPars[q].ParNum)+'] ('+trimEX(game.Pars[game.Pathes[PathIndex].DPars[q].ParNum].Name.text)+')';


    if (game.pathes[PathIndex].DPars[q].Min>game.pars[game.Pathes[PathIndex].DPars[q].ParNum].GetDefaultMinGate) or
       (game.pathes[PathIndex].DPars[q].Max<game.pars[game.Pathes[PathIndex].DPars[q].ParNum].GetDefaultMaxGate) then
      temp2:= '['+IntToStrEC(game.pathes[PathIndex].DPars[q].Min)+'..' + IntToStrEC(game.pathes[PathIndex].DPars[q].Max) + '] '
    else temp2:='';

    temp:='';

    if game.Pathes[PathIndex].DPars[q].DeltaExprFlag then
    begin
      temp:=trimEX(game.Pathes[PathIndex].DPars[q].Expression.Text);
      if temp<>'' then temp:=':= '+temp;
    end else begin
      if game.pathes[PathIndex].DPars[q].DeltaApprFlag then temp:=':= ';
      if (game.pathes[PathIndex].DPars[q].delta>0) and not game.pathes[PathIndex].DPars[q].DeltaApprFlag then temp:=temp+'+';
      t:=game.pathes[PathIndex].DPars[q].delta;
      if game.Pathes[PathIndex].DPars[q].DeltaPercentFlag then
      begin
        if t>100 then t:=100;
        if t<-100 then t:=-100;
      end;
      if game.pathes[PathIndex].DPars[q].delta<>0 then temp:=temp+IntToStrEC(t) else temp:='';
      if (temp='') and game.pathes[PathIndex].DPars[q].DeltaApprFlag then temp:=':= 0';
      if (not game.Pathes[PathIndex].DPars[q].DeltaApprFlag) and game.Pathes[PathIndex].DPars[q].DeltaPercentFlag and (temp<>'') then temp:=temp + '%';
    end;

    temp3:='';
    if Game.Pathes[PathIndex].DPars[q].ParameterViewAction=1 then temp3:=' '+QuestMessages.Par_Get('ParameterShow')+' '
    else if Game.Pathes[PathIndex].DPars[q].ParameterViewAction=2 then temp3:=' '+QuestMessages.Par_Get('ParameterHide')+' ';

    temp4:='';
    if Game.Pathes[PathIndex].DPars[q].ValuesGate.Count<>0 then
    begin
      if Game.Pathes[PathIndex].DPars[q].ValuesGate.Negation then temp4:=temp4+' = '
      else  temp4:=temp4+' <> ';
      temp4:=temp4+Game.Pathes[PathIndex].DPars[q].ValuesGate.GetString;
    end;

    temp5:='';
    if Game.Pathes[PathIndex].DPars[q].ModZeroesGate.Count<>0 then
    begin
      if Game.Pathes[PathIndex].DPars[q].ModZeroesGate.Negation then temp5:=temp5+' / '
      else  temp5:=temp5+' X ';
      temp5:=temp5+Game.Pathes[PathIndex].DPars[q].ModZeroesGate.GetString;
    end;

    if (temp3<>'') or (temp2<>'') or (temp<>'') or (temp4<>'') or (temp5<>'') then
    begin
      inc(cnt);
      if cnt>25 then
      begin
        AddSingleStroke('...',clblack);
        NeedSeparator:=true;
        break;
      end;

      c:=temp1+temp3+': '+temp2;

      if length(c+temp5+temp4)>40 then
      begin
        AddDoubleStroke(c,temp,mcolor);
        AddSingleStroke('   '+temp4+temp5,mcolor);
        NeedSeparator:=true;
      end else begin
        AddDoubleStroke(c+temp4+temp5,temp,mcolor);
        NeedSeparator:=true;
      end;

    end;

  end;

  if NeedSeparator then AddSeparator;

  a:='';
  b:='';

  if Game.Pathes[PathIndex].dayscost=1 then a:=QuestMessages.ParPath_Get('FormMain.DayPassed');
  //if Game.Pathes[pathIndex].PassesAllowed<>1 then
  //begin
    if (Game.Pathes[pathIndex].PassesAllowed=0) then b:=QuestMessages.ParPath_Get('FormMain.UnrestrictedPassability')+' '
    else b:=QuestMessages.ParPath_Get('FormMain.Passability')+': '+IntToStrEC(Game.Pathes[pathIndex].PassesAllowed);
  //end;

  if (a<>'') then AddSingleStroke(a,clBlack);
  if (b<>'') then AddSingleStroke(b,clBlack);

  if Game.Pathes[PathIndex].AlwaysShowWhenPlaying then AddSingleStroke(QuestMessages.ParPath_Get('FormMain.AlwaysShow'),clBlack);

end;

procedure TFormMain.PrintLocationStatistics(LocationIndex:integer);
var i,no,lastPar,q,t,cnt:integer;
    temp0,temp,temp1,temp2,temp3,descr{,MiniStr}:widestring;
    NeedSeparator:boolean;
    mcolor:TColor;
begin
	ClearStatusPanel;
  StatusPanel.color:=LocationHelpPanelColor;

	with Game.Locations[LocationIndex] do
  begin
		if    StartLocationFlag  then temp:=QuestMessages.ParPath_Get('FormMain.LocationStart')
    else if EndLocationFlag  then temp:=QuestMessages.ParPath_Get('FormMain.LocationWin')
    else if FailLocationFlag then temp:=QuestMessages.ParPath_Get('FormMain.LocationFail')
    else begin
      if Game.Locations[LocationIndex].VoidLocation then temp:=QuestMessages.ParPath_Get('FormMain.LocationVoid')
			else temp:=QuestMessages.ParPath_Get('FormMain.LocationNormal');
    end;
  end;

  if Game.Locations[LocationIndex].CntDescriptions>1 then AddDoubleStroke('M','L '+IntToStrEC(Game.Locations[LocationIndex].LocationNumber),clBlack)
	else AddDoubleStroke('','L '+IntToStrEC(Game.Locations[LocationIndex].LocationNumber),clBlack);
	AddSingleStroke(temp, clBlack);
	AddSeparator;

  descr:='';
  with Game.Locations[LocationIndex] do
    for q:=1 to CntDescriptions do
    begin
      descr:=trimEX(LocationDescriptions[q].Text.Text);
      if descr = '' then continue;
      if length(descr)>=255 then
      begin
        SetLength(descr,255);
        descr:=descr+' ...';
      end;
      break;
    end;
  AddSingleStroke(descr, clBlue);

	{Game.Locations[LocationIndex].FindLocationDescription(true);

	if length(trimEX(Game.Locations[LocationIndex].LocationDescription.Text))<255 then
    AddSingleStroke(trimEX(Game.Locations[LocationIndex].LocationDescription.Text), clBlue)
  else begin
    MiniStr:=trimEX(Game.Locations[LocationIndex].LocationDescription.Text);
    SetLength(MiniStr,255);
    AddSingleStroke(MiniStr+' ...', clBlue);
  end;}


  AddSeparator;
  NeedSeparator:=false;

  cnt:=0;
  lastPar:=0;
  for i:=1 to game.Locations[LocationIndex].DParsValue do
  begin
    no:=0;
    for q:=1 to game.Locations[LocationIndex].DParsValue do
    begin
      if game.Locations[LocationIndex].DPars[q].ParNum<=lastPar then continue;
      if (no=0) or (game.Locations[LocationIndex].DPars[q].ParNum<game.Locations[LocationIndex].DPars[no].ParNum) then no:=q;
    end;
    q:=no;
    lastPar:=game.Locations[LocationIndex].DPars[no].ParNum;

    if not Game.Pars[game.Locations[LocationIndex].DPars[q].ParNum].Enabled then continue;


    mcolor:=clblack;

    if game.Locations[LocationIndex].DPars[q].DeltaExprFlag then
    begin
      temp2:=trimEX(game.Locations[LocationIndex].DPars[q].Expression.Text);
      if temp2<>'' then temp:=':= '+temp2;
    end else begin
      if (game.Locations[LocationIndex].DPars[q].delta>0) and not game.Locations[LocationIndex].DPars[q].DeltaApprFlag then temp2:='+'
      else temp2:='';

      t:=game.Locations[LocationIndex].DPars[q].delta;
      if game.Locations[LocationIndex].DPars[q].DeltaPercentFlag then
      begin
        if t>100 then t:=100;
        if t<-100 then t:=-100;
      end;
      temp2:=temp2+IntToStrEC(t);
      if not game.Locations[LocationIndex].DPars[q].DeltaApprFlag and game.Locations[LocationIndex].DPars[q].DeltaPercentFlag then temp2:=temp2 + '%';
      if game.Locations[LocationIndex].DPars[q].DeltaApprFlag then temp2:=':= '+temp2;
      if (game.Locations[LocationIndex].DPars[q].delta=0) and not game.Locations[LocationIndex].DPars[q].DeltaApprFlag then temp2:='';
    end;

    temp3:='';
    if Game.Locations[LocationIndex].DPars[q].ParameterViewAction=1 then temp3:=' '+QuestMessages.Par_Get('ParameterShow')+' '
    else if Game.Locations[LocationIndex].DPars[q].ParameterViewAction=2 then temp3:=' '+QuestMessages.Par_Get('ParameterHide')+' ';

    //temp1:=trimEX(game.Pars[game.Locations[LocationIndex].DPars[q].ParNum].Name.text);
    if      ParNameHelpPanelType=0 then temp1:=trimEX(game.Pars[game.Locations[LocationIndex].DPars[q].ParNum].Name.text)
    else if ParNameHelpPanelType=1 then temp1:='[p'+IntToStrEC(game.Locations[LocationIndex].DPars[q].ParNum)+'] '
    else if ParNameHelpPanelType=2 then temp1:='[p'+IntToStrEC(game.Locations[LocationIndex].DPars[q].ParNum)+'] ('+trimEX(game.Pars[game.Locations[LocationIndex].DPars[q].ParNum].Name.text)+')';

    if (temp3<>'') or (temp0<>'') or (temp2<>'') then
    begin
      inc(cnt);
      if cnt>25 then
      begin
        AddSingleStroke('...',clblack);
        NeedSeparator:=true;
        break;
      end;

      if temp2<>'' then AddDoubleStroke(temp1 + temp3 + ': ' + temp0,temp2,mcolor)
      else AddDoubleStroke(temp1 + temp3 + ': ' + temp0,'',mcolor);

      NeedSeparator:=true;
    end;
  end;


  if NeedSeparator then AddSeparator;
  if Game.Locations[LocationIndex].dayscost=1 then AddSingleStroke(QuestMessages.ParPath_Get('FormMain.DayPassed'),clBlack);
  //if Game.Locations[LocationIndex].VisitsAllowed<>1 then
  //begin
  if (Game.Locations[LocationIndex].VisitsAllowed=0) then AddSingleStroke(QuestMessages.ParPath_Get('FormMain.UnrestrictedPassability')+' ',clBlack)
  else AddSingleStroke(QuestMessages.ParPath_Get('FormMain.Passability')+': '+IntToStrEC(Game.Locations[LocationIndex].VisitsAllowed),clBlack);
  //end;

end;

procedure TFormMain.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var lx,ly:integer;
    i,c:integer;
    sx,sy:integer;
begin
	ClientMouseX:=x;
  ClientMouseY:=y;
  if LoadingData then exit;
  sx:=x;
  sy:=y;
  x:=GetDMousex(x);
  y:=GetDMousey(y);

  i:=Game.GetClosestLocation(x,y);
  if i>0 then
  begin
    lx:=Game.Locations[i].screenx;
    ly:=Game.Locations[i].screeny;
  end else begin
    lx:=maxint;
    ly:=maxint;
  end;

  c:=Game.GetClosestPath(x,y);

  if (i<=0) and (c<=0) then
  begin
    if not ((-1=LocationSelectedIndex) and (-1=PathSelectedIndex)) then
    begin
      LocationSelectedIndex:=-1;
      PathSelectedIndex:=-1;
      ClearStatusPanel;
      NiceRepaint;
    end;
  end else begin
    if (sqrt((lx-x)*(lx-x)+(ly-y)*(ly-y)) < Game.GetPathDistance(c,x,y)) then
    begin
      if i<>LocationSelectedIndex then
      begin
        LocationSelectedIndex:=i;
        PathSelectedIndex:=-1;
        NiceRepaint;
        PrintLocationStatistics(i);
        SetStatusPanelPosition(sx,sy);
        StatusPanel.Visible:=true;
      end;
    end else begin
      if c<>PathSelectedIndex then
      begin
        PathSelectedIndex:=c;
        LocationSelectedIndex:=-1;
        NiceRepaint;
        PrintPathStatistics(c);
        SetStatusPanelPosition(sx,sy);
        StatusPanel.Visible:=true;
      end;
    end;
  end;
end;

procedure TFormMain.PlayButtonClick(Sender: TObject);
var i,c,cln:integer;
begin
  // Ищем стартовую локацию (
  c:=0;
  cln:=0;

  for i:=1 to Game.LocationsValue do
    if Game.Locations[i].StartLocationFlag then
    begin
      cln:=Game.Locations[i].LocationNumber;
      inc(c);
    end;

  if c>1 then cln:=-1;

  // Если не нашли или стартовых локаций больше одной, то обработать ошибку
  if cln=0 then ShowMessage(QuestMessages.ParPath_Get('FormMain.NoStartLocations'))
  else if cln=-1 then ShowMessage(QuestMessages.ParPath_Get('FormMain.TooManyStartLocations'))
  else begin
    inc(ActiveChildsCount);
    FormPlay.PlayGame:=Game;//.CopyDataFrom(Game);
    FormPlay.dayspassed:=0;
    FormPlay.ShowModal;
    dec(ActiveChildsCount);
  end;
end;

procedure TFormMain.UndoButtonClick(Sender: TObject);
begin
  MakeUndo;

  Game.SeekOneQuestionPathes;
  NiceRepaint;
  NeedToSaveChanges:=true;
end;

procedure TFormMain.RedoButtonClick(Sender: TObject);
begin
  MakeRedo;
  Game.SeekOneQuestionPathes;
  NiceRepaint;
  NeedToSaveChanges:=true;
end;

procedure TFormMain.ColorOptionsButtonClick(Sender: TObject);
begin
  FormColorOptions.LineFromColor:=LineFromColor;
  FormColorOptions.LineToColor:=LineToColor;
  FormColorOptions.VoidLineFromColor:=VoidLineFromColor;
  FormColorOptions.VoidLineToColor:=VoidLineToColor;
  FormColorOptions.PointerColor:=PointerColor;
  FormColorOptions.StartLocationColor:=StartLocationColor;
  FormColorOptions.EndLocationColor:=EndLocationColor;
  FormColorOptions.FailLocationColor:=FailLocationColor;
  FormColorOptions.DefaultLocationColor:=DefaultLocationColor;
  FormColorOptions.BackGroundColor:=BackGroundColor;
  FormColorOptions.HighlightExt:=HighlightExt;
  FormColorOptions.HighlightInt:=HighlightInt;
  FormColorOptions.PathHelpPanelColor:=PathHelpPanelcolor;
  FormColorOptions.LocationHelpPanelColor:=LocationHelpPanelcolor;
  FormColorOptions.AbsPathColor:=AbsPathColor;
  FormColorOptions.NotAbsPathColor:=NotAbsPathColor;
  FormColorOptions.DrawPathType:=DrawPathType;
  FormColorOptions.ParNameHelpPanelRG.ItemIndex:=ParNameHelpPanelType;
  FormColorOptions.SameQNoDescrStartColor:=SameQNoDescrStartColor;
  FormColorOptions.SameQNoDescrEndColor:=SameQNoDescrEndColor;
  FormColorOptions.SameQDescrStartColor:=SameQDescrStartColor;
  FormColorOptions.SameQDescrEndColor:=SameQDescrEndColor;
  FormColorOptions.VoidObjectColor:=VoidObjectColor;
  FormColorOptions.VoidObjectStartColor:=VoidObjectStartColor;

  FormColorOptions.PassabilityAutocorrection:=PassabilityAutocorrection;
  FormColorOptions.MinorVersionAutoIncrement:=MinorVersionAutoIncrement;

  FormColorOptions.SPN:=SPN;

  inc(ActiveChildsCount);
  FormColorOptions.ShowModal;
  dec(ActiveChildsCount);

  if FormColorOptions.is_ok_pressed then
  begin
    LineFromColor:=FormColorOptions.LineFromColor;
    LineToColor:=FormColorOptions.LineToColor;
    VoidLineFromColor:=FormColorOptions.VoidLineFromColor;
    VoidLineToColor:=FormColorOptions.VoidLineToColor;
    PointerColor:=FormColorOptions.PointerColor;
    StartLocationColor:=FormColorOptions.StartLocationColor;
    EndLocationColor:=FormColorOptions.EndLocationColor;
    FailLocationColor:=FormColorOptions.FailLocationColor;
    DefaultLocationColor:=FormColorOptions.DefaultLocationColor;
    BackGroundColor:=FormColorOptions.BackGroundColor;
    HighlightExt:=FormColorOptions.HighlightExt;
    HighlightInt:=FormColorOptions.HighlightInt;
    PathHelpPanelColor:=FormColorOptions.PathHelpPanelcolor;
    LocationHelpPanelColor:=FormColorOptions.LocationHelpPanelcolor;

    AbsPathColor:=FormColorOptions.AbsPathColor;
    NotAbsPathColor:=FormColorOptions.NotAbsPathColor;
    DrawPathType:=FormColorOptions.DrawPathType;
    ParNameHelpPanelType:=FormColorOptions.ParNameHelpPanelRG.ItemIndex;
    SameQNoDescrStartColor:=FormColorOptions.SameQNoDescrStartColor;
    SameQNoDescrEndColor:=FormColorOptions.SameQNoDescrEndColor;
    SameQDescrStartColor:=FormColorOptions.SameQDescrStartColor;
    SameQDescrEndColor:=FormColorOptions.SameQDescrEndColor;
    VoidObjectColor:=FormColorOptions.VoidObjectColor;
    VoidObjectStartColor:=FormColorOptions.VoidObjectStartColor;


    if PassabilityAutocorrection <> FormColorOptions.PassabilityAutocorrection then
    begin
      if PassabilityAutocorrection then Game.FindOneWaySequences
      else Game.ClearSequences;
    end;
    PassabilityAutocorrection:=FormColorOptions.PassabilityAutocorrection;
    MinorVersionAutoIncrement:=FormColorOptions.MinorVersionAutoIncrement;
    

    SPN:=FormColorOptions.SPN;
    SaveEditorOptions(ConfigFilePath);
    NiceRepaint;
  end;
end;

procedure TFormMain.FormResize(Sender: TObject);
begin
  if LoadingData then exit;
  DrawBuffer.Height:=Height;
  DrawBuffer.Width:=Width;
  PositionLocationsAfterLoad;
  Game.RecalculatePathes;
  NiceRepaint;
end;

procedure TFormMain.FormShow(Sender: TObject);
var i:integer;
begin

  WindowState:=wsMaximized;
  JustLoaded:=false;

  for i:=1 to maxstatuspanellabels do Labels[i].parent:=StatusPanel;

  ClearStatusPanel;
  ShiftPressed:=false;

  maxedx:=GetMaxEDX;
  maxedy:=GetMaxEDY;

  UpdateCaption;
end;

procedure TFormMain.StatusPanelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  OnMouseMove(Sender,shift,x,y);
end;

procedure TFormMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var t:TModalResult;
begin
  if NeedToSaveChanges then
  begin
    CanClose:=false;
    t:= MessageDlg(QuestMessages.ParPath_Get('FormMain.SaveOnExit'), mtConfirmation, [mbYes, mbNo, mbCancel], 0);

    if t=mrYes then
    begin
      if SaveGame then CanClose:=not NeedToSaveChanges
      else CanClose:=false;
    end;

    if t=mrNo then CanClose:=true;
    if t=mrCancel then CanClose:=false;

  end else CanClose:=true;
end;

procedure TFormMain.ScrollTimerTimer(Sender: TObject);
var NeedRepaint:boolean;
	  //FreeScroll:boolean;
    maxndx:integer;
    maxndy:integer;
begin
	NeedRepaint:=false;
  //FreeScroll:=FreeScrollButton.Down;

  if not FreeScrollButton.Down then exit;

  with Game do
  begin
		{if FreeScroll then
    begin}
      maxndx:=maxedx-BlockXgradient+BlockXgradient div 3;
      maxndy:=maxedy-BlockYgradient+BlockYgradient div 3;
    {end else begin
      maxndx:=maxedx-BlockXgradient;
      maxndy:=maxedy-BlockYgradient;
    end;}
  end;

	if OnNiceRepaintFlag or LoadingData or (ActiveChildsCount>0) or (Game.LocationsValue=0) or not FormMain.Active then exit
  else begin
    if ClientMouseX<(ClientWidth div 30) then
    begin
      if ndx>0 then
      begin
        dec(ndx);
        NeedRepaint:=true;
      end;
    end;
    if (ClientMouseY<(ClientHeight div 24)*2.3) and (ClientMouseY>30) {and FreeScroll} then
    begin
      if ndy>0 then
      begin
        dec(ndy);
        NeedRepaint:=true;
      end;
    end;
    if ClientMouseX>(ClientWidth div 30)*(30-1) then
    begin
      if ndx div Game.BlockXgradient+1 < scrxmaxvalue then
      begin
        if maxndx>ndx then
        begin
          inc(ndx);
          NeedRepaint:=true;
 				end;
      end;
    end;
    if ClientMouseY>(ClientHeight div 24)*(24-1) then
    begin
      if ndy div Game.BlockYgradient+1 < scrymaxvalue then
      begin
				if maxndy>ndy then
        begin
          inc(ndy);
          NeedRepaint:=true;
 				end;
      end;
    end;
    if NeedRepaint then NiceRepaint;
  end;
end;

procedure TFormMain.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key=VK_F9 then PlayButton.OnClick(sender);
end;

procedure TFormMain.GenericMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  ClientMouseX:=ClientWidth div 2;
  ClientMouseY:=ClientHeight div 2;
end;
 
procedure TFormMain.FreeScrollButtonClick(Sender: TObject);
begin
	ConfigFilePath:=ExePath + EditorConfFile;
	SaveEditorOptions(ConfigFilePath);
end;

procedure TFormMain.NavigateToolButtonClick(Sender: TObject);
begin
	FormLPSearch.Show;
end;

procedure TFormMain.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ssCtrl in Shift then
  begin
    if (Char(Key) = 'n') or (Char(Key) = 'N')  then NewGameButtonClick(Sender);
    if (Char(Key) = 'o') or (Char(Key) = 'O')  then LoadGameButtonClick(Sender);
    if (Char(Key) = 's') or (Char(Key) = 'S')  then
    begin
      if ssShift in Shift then SaveGameButtonClick(Sender)
      else SaveGameNoDialog;
    end;
    if (Char(Key) = 'z') or (Char(Key) = 'Z')  then begin UndoButtonClick(Sender); ProcessEnabledControls; end;
    if (Char(Key) = 'y') or (Char(Key) = 'Y')  then begin RedoButtonClick(Sender); ProcessEnabledControls; end;
    if (Char(Key) = 'q') or (Char(Key) = 'Q')  then begin ToolButton2.Down:=true; ToolButton2.Click; end;
    if (Char(Key) = 'w') or (Char(Key) = 'W')  then begin ToolButton6.Down:=true; ToolButton6.Click; end;
    if (Char(Key) = 'e') or (Char(Key) = 'E')  then begin ToolButton4.Down:=true; ToolButton4.Click; end;
    if (Char(Key) = 'R') or (Char(Key) = 'R')  then begin ToolButton5.Down:=true; ToolButton5.Click; end;
    if (Char(Key) = 'f') or (Char(Key) = 'F')  then NavigateToolButtonClick(Sender);
    if (Char(Key) = 'i') or (Char(Key) = 'I')  then ToolButton9Click(Sender);
    if (Char(Key) = 't') or (Char(Key) = 'T')  then ColorOptionsButtonClick(Sender);
    if (Char(Key) = 'd') or (Char(Key) = 'D')  then begin FreeScrollButton.Down:=not FreeScrollButton.Down; FreeScrollButton.Click; end;//FreeScrollButtonClick(Sender);
  end;
end;

procedure TFormMain.ToolButton10Click(Sender: TObject);
var i,j:integer;
    par:TParameter;
    loc:TLocation;
    path:TPath;
    dpar:TParameterDelta;
    tstr,tstr1,errExpr:WideString;
begin
  tstr:='';

  for i:=1 to Game.ParsValue do
  begin
    par:=Game.Pars[i];
    if not par.Enabled then continue;
    if par.DiapStartValues.count>0 then par.value:=trunc(par.DiapStartValues.GetRandom) else par.value:=0;
  end;

  for i:=1 to Game.ParsValue do
  begin
    par:=Game.Pars[i];
    if not par.Enabled then continue;
    for j:=1 to par.ValueOfViewStrings do
    begin
      if not par.Enabled then continue;
      tstr1:=StringReplaceEC( par.ViewFormatStrings[j].str.Text ,'<>','[p'+inttostrEC(i)+']');
      errExpr:=Game.CheckExpressions(  tstr1 );
      if errExpr<>'' then tstr:=tstr + 'Error in view string ' + inttostrEC(j) + ' for p' + inttostrEC(i) + ': ' + errExpr + #10#13;
    end;
    if par.ParType <> NoCriticalParType then
    begin
      errExpr:=Game.CheckExpressions(  par.CriticalEvent.Text.Text );
      if errExpr<>'' then tstr:=tstr + 'Error in critical message for p' + inttostrEC(i) + ': ' + errExpr + #10#13;
    end;
  end;

  for i:=1 to Game.LocationsValue do
  begin
    loc:=Game.Locations[i];
    if loc.RandomShowLocationDescriptions then
    begin
      errExpr:=Game.CheckExpressions(  loc.LocDescrExprOrder.Text );
      if errExpr<>'' then tstr:=tstr + 'Error in description selector for location ' + inttostrEC(loc.LocationNumber) + ': ' + errExpr + #10#13;
    end;
    for j:=1 to loc.CntDescriptions do
    begin
      errExpr:=Game.CheckExpressions(  loc.LocationDescriptions[j].Text.Text );
      if errExpr<>'' then tstr:=tstr + 'Error in description ' + inttostrEC(j) + ' for location ' + inttostrEC(loc.LocationNumber) + ': ' + errExpr + #10#13;
    end;
    for j:=1 to loc.DParsValue do
    begin
      dpar:=loc.DPars[j];
      if not Game.Pars[dpar.ParNum].Enabled then continue;

      if dpar.DeltaExprFlag then
      begin
        errExpr:=Game.CheckExpressions(  dpar.Expression.Text );
        if errExpr<>'' then tstr:=tstr + 'Error in expression for p' + inttostrEC(dpar.ParNum) + ' in location ' + inttostrEC(loc.LocationNumber) + ': ' + errExpr + #10#13;
      end;
      if (Game.Pars[dpar.ParNum].ParType <> NoCriticalParType) and (dpar.CustomCriticalEvent<>nil) then
      begin
        errExpr:=Game.CheckExpressions(  dpar.CustomCriticalEvent.Text.Text );
        if errExpr<>'' then tstr:=tstr + 'Error in custom critical message for p' + inttostrEC(dpar.ParNum) + ' in location ' + inttostrEC(loc.LocationNumber) + ': ' + errExpr + #10#13;
      end;
    end;
  end;

  for i:=1 to Game.PathesValue do
  begin
    path:=Game.Pathes[i];

    errExpr:=Game.CheckExpressions(  path.LogicExpression.Text );
    if errExpr<>'' then tstr:=tstr + 'Error in logic expression for path ' + inttostrEC(path.PathNumber) + ': ' + errExpr + #10#13;

    errExpr:=Game.CheckExpressions(  path.StartPathMessage.Text );
    if errExpr<>'' then tstr:=tstr + 'Error in start message for path ' + inttostrEC(path.PathNumber) + ': ' + errExpr + #10#13;

    errExpr:=Game.CheckExpressions(  path.EndPathEvent.Text.Text );
    if errExpr<>'' then tstr:=tstr + 'Error in end message for path ' + inttostrEC(path.PathNumber) + ': ' + errExpr + #10#13;

    for j:=1 to path.DParsValue do
    begin
      dpar:=path.DPars[j];
      if not Game.Pars[dpar.ParNum].Enabled then continue;

      if dpar.DeltaExprFlag then
      begin
        errExpr:=Game.CheckExpressions(  dpar.Expression.Text );
        if errExpr<>'' then tstr:=tstr + 'Error in expression for p' + inttostrEC(dpar.ParNum) + ' in path ' + inttostrEC(path.PathNumber) + ': ' + errExpr + #10#13;
      end;
      if (Game.Pars[dpar.ParNum].ParType <> NoCriticalParType) and (dpar.CustomCriticalEvent<>nil) then
      begin
        errExpr:=Game.CheckExpressions(  dpar.CustomCriticalEvent.Text.Text );
        if errExpr<>'' then tstr:=tstr + 'Error in custom critical message for p' + inttostrEC(dpar.ParNum) + ' in path ' + inttostrEC(path.PathNumber) + ': ' + errExpr + #10#13;
      end;
    end;
  end;

  //tstr:=Game.CheckExpressions(  '{() div 10}' );

  if tstr='' then ShowMessage('No errors')
  else ShowMessage('Errors:'+ #10#13 + tstr);
end;

procedure TFormMain.ToolButton12Click(Sender: TObject);
begin
  inc(ActiveChildsCount);
  FormVersion.ShowModal;
  UpdateCaption;
  dec(ActiveChildsCount);
end;

procedure TFormMain.ToolButton15Click(Sender: TObject);//export
var s:WideString;
	  cfgfilename:WideString;
    Path:TTextField;
    f:file;
    astr:ansistring;
begin
	Path:=TTextField.Create;
  cfgfilename:=TgeDir+'\'+'path.cfg';
	if FileExists(cfgfilename) then
  begin
    AssignFile(f,cfgfilename);
    Reset(f,1);
    path.Load(@f);
    closefile(f);
    //OpenDialog.InitialDir:=trimEX(path.Text);
    SaveTextDialog.InitialDir:=trimEX(Path.Text);
  end;

  s:=trimEX(SaveDialog.FileName);
  if s <>'' then SaveTextDialog.FileName:=GetStrParEC(s,0,GetCountParEC(s,'.')-2,'.');

  //inc(ActiveChildsCount);
  if SaveTextDialog.Execute then
  begin
    s:=SaveTextDialog.filename;
    astr:=s;
    Game.ExportText(PAnsiChar(astr));
  end;
  //dec(ActiveChildsCount);
end;

procedure TFormMain.ToolButton16Click(Sender: TObject);//mass export
var txt,pathcur,pathsource,pathtarget:string;
    txt2:WideString;
    astr:ansistring;
    searchResult : TSearchRec;
    quest:TTextQuest;
begin
  pathcur:=GetCurrentDir;

  if not SelectDirectory(QuestMessages.ParPath_Get('FormMain.ChooseSourceForExport'),''{GetCurrentDir},pathsource) then exit;
  if not SelectDirectory(QuestMessages.ParPath_Get('FormMain.ChooseTargetForExport'),''{GetCurrentDir},pathtarget) then exit;

  SetCurrentDir(pathsource);
  if FindFirst('*.qmm', faAnyFile, searchResult) = 0 then
  begin
    repeat
      txt:=searchResult.Name;
      quest:=TTextQuest.Create;
      astr:=txt;
      quest.Load(PChar(astr));

      txt2:=GetStrParEC(txt,0,GetCountParEC(txt,'.')-2,'.')+'.txt';
      astr:=txt2;

      SetCurrentDir(pathtarget);

      quest.ExportText(PAnsiChar(astr));

      SetCurrentDir(pathsource);
      quest.Free;

    until FindNext(searchResult) <> 0;
    FindClose(searchResult);
  end;
  SetCurrentDir(pathcur);
end;

procedure TFormMain.ToolButton17Click(Sender: TObject);//import
var s:WideString;
	  cfgfilename:WideString;
    Path:TTextField;
    f:file;
    astr:ansistring;
begin
	Path:=TTextField.Create;
  cfgfilename:=TgeDir+'\'+'path.cfg';
	if FileExists(cfgfilename) then
  begin
    AssignFile(f,cfgfilename);
    Reset(f,1);
    path.Load(@f);
    closefile(f);
    OpenTextDialog.InitialDir:=trimEX(Path.Text);
  end;

  s:=trimEX(SaveDialog.FileName);
  if s <>'' then OpenTextDialog.FileName:=GetStrParEC(s,0,GetCountParEC(s,'.')-2,'.');

  //inc(ActiveChildsCount);
  if OpenTextDialog.Execute then
  begin
    s:=OpenTextDialog.filename;
    astr:=s;
    Game.ImportText(PAnsiChar(astr));
  end;
  //dec(ActiveChildsCount);
end;

procedure TFormMain.ToolButton18Click(Sender: TObject);//mass import
var txt,txt2,pathcur,pathsource,pathtarget:string;
    astr:ansistring;
    searchResult : TSearchRec;
    quest:TTextQuest;
begin
  pathcur:=GetCurrentDir;
  if not SelectDirectory(QuestMessages.ParPath_Get('FormMain.ChooseSourceForImport'),''{GetCurrentDir},pathsource) then exit;
  if not SelectDirectory(QuestMessages.ParPath_Get('FormMain.ChooseTargetForImport'),''{GetCurrentDir},pathtarget) then exit;

  SetCurrentDir(pathsource);
  if FindFirst('*.qmm', faAnyFile, searchResult) = 0 then
  begin
    repeat

      txt:=searchResult.Name;
      txt2:=GetStrParEC(txt,0,GetCountParEC(txt,'.')-2,'.')+'.txt';

      if FileExists(txt2) then
      begin
        quest:=TTextQuest.Create;
        astr:=txt;
        quest.Load(PChar(astr));
        astr:=txt2;
        quest.ImportText(PAnsiChar(astr));
        SetCurrentDir(pathtarget);
        astr:=txt;
        quest.Save_5_0_2(PChar(astr));
        quest.Free;
        SetCurrentDir(pathsource);
      end;

    until FindNext(searchResult) <> 0;

    FindClose(searchResult);
  end;
  SetCurrentDir(pathcur);
end;

procedure TFormMain.ToolButton20Click(Sender: TObject);  //quest scheme
var s:WideString;
	  cfgfilename:WideString;
    Path:TTextField;
    f:file;
    astr:ansistring;
begin
	Path:=TTextField.Create;
  cfgfilename:=TgeDir+'\'+'path.cfg';
	if FileExists(cfgfilename) then
  begin
    AssignFile(f,cfgfilename);
    Reset(f,1);
    path.Load(@f);
    closefile(f);
    //OpenDialog.InitialDir:=trimEX(path.Text);
    SaveDialog1.InitialDir:=trimEX(Path.Text);
  end;

  s:=trimEX(SaveDialog.FileName);
  if s <>'' then SaveDialog1.FileName:=GetStrParEC(s,0,GetCountParEC(s,'.')-2,'.')+'_scheme';

  if SaveDialog1.Execute then
  begin
    s:=SaveDialog1.filename;
    astr:=s;
    Game.ExportScheme(PAnsiChar(astr));
  end;
end;

end.
