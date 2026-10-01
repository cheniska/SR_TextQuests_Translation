unit ParamEdit;

interface

uses
  Controls, Classes, Forms, StdCtrls, Buttons;

type
  TFormParamEdit = class(TForm)
    ScrollBox1: TScrollBox;
    SpeedButton1: TSpeedButton;

    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    MaxParams:integer;
    ParamLabels: array of TLabel;
    ParamEditBoxes: array of TEdit;
    ParamLabels2: array of TLabel;
  end;

var
  FormParamEdit: TFormParamEdit;

implementation

uses PlayForm,TextQuest,ParameterClass,EC_Str;

{$R *.dfm}

procedure TFormParamEdit.SpeedButton1Click(Sender: TObject);
var i,cnt,val:integer;
begin
  Close;
  cnt:=0;
  for i:=1 to FormPlay.PlayGame.ParsValue do
  begin
    if not FormPlay.PlayGame.Pars[i].Enabled then continue;
    inc(cnt);
    try
      val:=StrToIntFullEC(ParamEditBoxes[cnt].Text);
      if val<FormPlay.PlayGame.Pars[i].min then val:=FormPlay.PlayGame.Pars[i].min;
      if val>FormPlay.PlayGame.Pars[i].max then val:=FormPlay.PlayGame.Pars[i].max;
      FormPlay.PlayGame.Pars[i].value:=val;
    finally
    end;
  end;
end;

procedure TFormParamEdit.FormCreate(Sender: TObject);
begin
  ParamLabels:=nil;
  ParamEditBoxes:=nil;
  ParamLabels2:=nil;
  MaxParams:=0;

  //Caption:='ParamEdit';
end;

procedure TFormParamEdit.FormShow(Sender: TObject);
var i,cnt,sm:integer;
    lb:TLabel;
    ed:TEdit;
    sz:integer;
begin
  cnt:=FormPlay.PlayGame.ParsValue;
  sm:=2;
  while cnt>9 do
  begin
    cnt:=cnt div 10;
    inc(sm);
  end;
  sz:=6;

  for i:=1 to MaxParams do
  begin
    ParamLabels[i].Free;
    ParamEditBoxes[i].Free;
    ParamLabels2[i].Free;
  end;
  ParamLabels:=nil;
  ParamEditBoxes:=nil;
  ParamLabels2:=nil;
  MaxParams:=0;



  cnt:=0;
  for i:=1 to FormPlay.PlayGame.ParsValue do
  begin
    if not FormPlay.PlayGame.Pars[i].Enabled then continue;
    inc(cnt);
    if cnt>MaxParams then
    begin
      inc(MaxParams);

      SetLength(ParamLabels,MaxParams+1);
      lb:=TLabel.Create(ScrollBox1);
      lb.Parent:=ScrollBox1;
      ParamLabels[MaxParams]:=lb;

      with lb do
      begin
        AutoSize:=false;
        Caption:='';
        //Tag:=MaxAnswer;
        WordWrap:=false;

        Left:=10;
        Top:=-10+cnt*20;

        Width:=sm*sz;
        Height:=16;

        //Font.Color:=clBlack;
        Font.Style:=[];
        
      end;

      SetLength(ParamEditBoxes,MaxParams+1);
      ed:=TEdit.Create(ScrollBox1);
      ed.Parent:=ScrollBox1;
      ParamEditBoxes[MaxParams]:=ed;

      with ed do
      begin
        AutoSize:=false;
        //Caption:='';
        //Tag:=MaxAnswer;
        //WordWrap:=false;

        Left:=40+(sm-2)*sz;
        Top:=-10+cnt*20;

        Width:=80;
        Height:=16;

        //Font.Color:=clBlack;
        Font.Style:=[];
      end;

      SetLength(ParamLabels2,MaxParams+1);
      lb:=TLabel.Create(ScrollBox1);
      lb.Parent:=ScrollBox1;
      ParamLabels2[MaxParams]:=lb;

      with lb do
      begin
        AutoSize:=false;
        Caption:='';
        //Tag:=MaxAnswer;
        WordWrap:=false;

        Left:=130+(sm-2)*sz;
        Top:=-10+cnt*20;

        Width:={200}ScrollBox1.Width-Left-20;
        Height:=16;

        //Font.Color:=clBlack;
        Font.Style:=[];
      end;


    end;
    with ParamLabels[cnt] do
    begin
      Caption:='p'+IntToStrEC(i);
      Visible:=true;
    end;
    with ParamEditBoxes[cnt] do
    begin
      Text:=IntToStrEC(FormPlay.PlayGame.Pars[i].value);
      Visible:=true;
    end;
    with ParamLabels2[cnt] do
    begin
      Caption:=trimEX(FormPlay.PlayGame.Pars[i].Name.Text)+
               ' ['+IntToStrEC(FormPlay.PlayGame.Pars[i].min)+'..'+IntToStrEC(FormPlay.PlayGame.Pars[i].max)+']';
      Visible:=true;
    end;
  end;

  for i:=cnt+1 to MaxParams do
  begin
    ParamLabels[i].Visible:=false;
    ParamEditBoxes[i].Visible:=false;
    ParamLabels2[i].Visible:=false;
  end;

end;

procedure TFormParamEdit.FormResize(Sender: TObject);
var
  w, h, i: integer;
begin
  w:=Width;
  h:=Height;
  if (w < 300) then w:=300;
  if (h < 300) then h:=300;

  SpeedButton1.Left:=(w - SpeedButton1.Width) div 2;
  SpeedButton1.Top:=h-SpeedButton1.Height - 60;

  ScrollBox1.Height:=SpeedButton1.Top - 25 - 25;
  ScrollBox1.Width:=w-2*ScrollBox1.Left;

  Width:=w;
  Height:=h;

  for i:=1 to MaxParams do ParamLabels2[i].Width:=ScrollBox1.Width-ParamLabels2[i].Left-20;
end;

end.
