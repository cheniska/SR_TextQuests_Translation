unit ColorOptionsForm;

interface

uses
  Windows, Dialogs, ExtCtrls, StdCtrls, Spin, Controls, Classes, Forms, Graphics;

type
  TFormColorOptions = class(TForm)
    B1: TButton;
    B2: TButton;
    B3: TButton;
    B6: TButton;
    B5: TButton;
    B4: TButton;
    ColorDialog1: TColorDialog;
    CancelButton: TButton;
    OkButton: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    DrawPathTypeRG: TRadioGroup;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    ParNameHelpPanelRG: TRadioGroup;
    CheckBox2: TCheckBox;
    CheckBox1: TCheckBox;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure B1Click(Sender: TObject);
    procedure B2Click(Sender: TObject);
    procedure B3Click(Sender: TObject);
    procedure B4Click(Sender: TObject);
    procedure B5Click(Sender: TObject);
    procedure B6Click(Sender: TObject);
    procedure B7Click(Sender: TObject);

    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure DrawPathTypeRGClick(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
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
    HighlightExt:TColor; //highlight loc 7
    HighlightInt:TColor;//no use  8
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

    SPN:integer;

    is_ok_pressed:boolean;
  end;

var
  FormColorOptions: TFormColorOptions;

implementation

{$R *.DFM}

uses MainForm,MessageText;

procedure TFormColorOptions.CancelButtonClick(Sender: TObject);
begin
  is_ok_pressed:=false;
  Close;
end;

procedure TFormColorOptions.OkButtonClick(Sender: TObject);
begin
  is_ok_pressed:=true;
  Close;
end;

procedure TFormColorOptions.FormCreate(Sender: TObject);
begin
  is_ok_pressed:=true;

  Caption:=QuestMessages.ParPath_Get('FormColorOptions.Caption');
  B1.Caption:=QuestMessages.ParPath_Get('FormColorOptions.PathWithDescriptionStart');
  B2.Caption:=QuestMessages.ParPath_Get('FormColorOptions.PathWithDescriptionEnd');
  Button3.Caption:=QuestMessages.ParPath_Get('FormColorOptions.PathNoDescriptionStart');
  Button4.Caption:=QuestMessages.ParPath_Get('FormColorOptions.PathNoDescriptionEnd');
  Button20.Caption:=QuestMessages.ParPath_Get('FormColorOptions.PathVariantWithDescriptionStart');
  Button19.Caption:=QuestMessages.ParPath_Get('FormColorOptions.PathVariantWithDescriptionEnd');
  Button15.Caption:=QuestMessages.ParPath_Get('FormColorOptions.PathVariantNoDescriptionStart');
  Button14.Caption:=QuestMessages.ParPath_Get('FormColorOptions.PathVariantNoDescriptionEnd');
  Button18.Caption:=QuestMessages.ParPath_Get('FormColorOptions.PathVoidStart');
  Button16.Caption:=QuestMessages.ParPath_Get('FormColorOptions.PathVoidEnd');
  B3.Caption:=QuestMessages.ParPath_Get('FormColorOptions.Arrow');
  B4.Caption:=QuestMessages.ParPath_Get('FormColorOptions.LocationStart');
  B5.Caption:=QuestMessages.ParPath_Get('FormColorOptions.LocationWin');
  B6.Caption:=QuestMessages.ParPath_Get('FormColorOptions.LocationNormal');
  Button2.Caption:=QuestMessages.ParPath_Get('FormColorOptions.LocationFail');
  Button7.Caption:=QuestMessages.ParPath_Get('FormColorOptions.HighlightExt'); //ext
  Button6.Caption:=QuestMessages.ParPath_Get('FormColorOptions.Background');
  Button8.Caption:=QuestMessages.ParPath_Get('FormColorOptions.HighlightInt');   //int
  Button10.Caption:=QuestMessages.ParPath_Get('FormColorOptions.PathStatisticsBackground');
  Button11.Caption:=QuestMessages.ParPath_Get('FormColorOptions.LocationStatisticsBackground');
  Button12.Caption:=QuestMessages.ParPath_Get('FormColorOptions.UnlimitedPassabilityPath');
  Button13.Caption:=QuestMessages.ParPath_Get('FormColorOptions.LimitedPassabilityPath');
  Button17.Caption:=QuestMessages.ParPath_Get('FormColorOptions.ChooseFont');
  OkButton.Caption:=QuestMessages.ParPath_Get('FormColorOptions.Done');
  Button1.Caption:=QuestMessages.ParPath_Get('FormColorOptions.Reset');
  CancelButton.Caption:=QuestMessages.ParPath_Get('FormColorOptions.Cancel');

  DrawPathTypeRG.Caption:=QuestMessages.ParPath_Get('FormColorOptions.PathColoring');
  DrawPathTypeRG.Items[0]:=QuestMessages.ParPath_Get('FormColorOptions.PathColoringOption1');
  DrawPathTypeRG.Items[1]:=QuestMessages.ParPath_Get('FormColorOptions.PathColoringOption2');

  ParNameHelpPanelRG.Caption:=QuestMessages.ParPath_Get('FormColorOptions.ParamNaming');
  ParNameHelpPanelRG.Items[0]:=QuestMessages.ParPath_Get('FormColorOptions.ParamNamingOption1');
  ParNameHelpPanelRG.Items[1]:=QuestMessages.ParPath_Get('FormColorOptions.ParamNamingOption2');
  ParNameHelpPanelRG.Items[2]:=QuestMessages.ParPath_Get('FormColorOptions.ParamNamingOption3');

  CheckBox2.Caption:=QuestMessages.ParPath_Get('FormColorOptions.PassabilityAutocorrection');
  CheckBox1.Caption:=QuestMessages.ParPath_Get('FormColorOptions.MinorVersionAutoIncrement');
end;

procedure TFormColorOptions.FormPaint(Sender: TObject);
var rect:Trect;
begin
  rect.Top:=18;
  rect.Left:=170;
  rect.Right:=250;
  rect.Bottom:=36;

  Canvas.brush.Color:=LineFromColor;
  Canvas.FillRect(rect);

  rect.Top:=rect.Top + 40;
  rect.Bottom:=rect.Bottom + 40;
  Canvas.brush.Color:=LineToColor;
  Canvas.FillRect(rect);

  rect.Top:=rect.Top + 40;
  rect.Bottom:=rect.Bottom + 40;
  Canvas.brush.Color:=VoidLineFromColor;
  Canvas.FillRect(rect);

  rect.Top:=rect.Top + 40;
  rect.Bottom:=rect.Bottom + 40;
  Canvas.brush.Color:=VoidLineToColor;
  Canvas.FillRect(rect);

  rect.Top:=rect.Top + 40;
  rect.Bottom:=rect.Bottom + 40;
  Canvas.brush.Color:=SameQDescrStartColor;
  Canvas.FillRect(rect);

  rect.Top:=rect.Top + 40;
  rect.Bottom:=rect.Bottom + 40;
  Canvas.brush.Color:=SameQDescrEndColor;
  Canvas.FillRect(rect);

  rect.Top:=rect.Top + 40;
  rect.Bottom:=rect.Bottom + 40;
  Canvas.brush.Color:=SameQNoDescrStartColor;
  Canvas.FillRect(rect);

  rect.Top:=rect.Top + 40;
  rect.Bottom:=rect.Bottom + 40;
  Canvas.brush.Color:=SameQNoDescrEndColor;
  Canvas.FillRect(rect);

  rect.Top:=rect.Top + 40;
  rect.Bottom:=rect.Bottom + 40;
  Canvas.brush.Color:=VoidObjectStartColor;
  Canvas.FillRect(rect);

  rect.Top:=rect.Top + 40;
  rect.Bottom:=rect.Bottom + 40;
  Canvas.brush.Color:=VoidObjectColor;
  Canvas.FillRect(rect);

  rect.Top:=rect.Top + 40;
  rect.Bottom:=rect.Bottom + 40;
  Canvas.brush.Color:=PointerColor;
  Canvas.FillRect(rect);

  rect.Top:=18;
  rect.Left:=rect.Left + 272;
  rect.Right:=rect.Right + 272;
  rect.Bottom:=36;

  rect.Top:=rect.Top;
  rect.Bottom:=rect.Bottom;
  Canvas.brush.Color:=StartLocationColor;
  Canvas.FillRect(rect);

  rect.Top:=rect.Top + 40;
  rect.Bottom:=rect.Bottom + 40;
  Canvas.brush.Color:=EndLocationColor;
  Canvas.FillRect(rect);

  rect.Top:=rect.Top + 40;
  rect.Bottom:=rect.Bottom + 40;
  Canvas.brush.Color:=DefaultLocationColor;
  Canvas.FillRect(rect);


  rect.Top:=rect.Top+40;
  rect.Bottom:=rect.Bottom+40;
  Canvas.brush.Color:=FailLocationColor+40;
  Canvas.FillRect(rect);

  rect.Top:=rect.Top + 40;
  rect.Bottom:=rect.Bottom + 40;
  Canvas.brush.Color:=BackGroundColor;
  Canvas.FillRect(rect);

  rect.Top:=rect.Top + 40;
  rect.Bottom:=rect.Bottom + 40;
  Canvas.brush.Color:=PathHelpPanelColor;
  Canvas.FillRect(rect);

  rect.Top:=rect.Top + 40;
  rect.Bottom:=rect.Bottom + 40;
  Canvas.brush.Color:=LocationHelpPanelColor;
  Canvas.FillRect(rect);

  rect.Top:=rect.Top + 40;
  rect.Bottom:=rect.Bottom + 40;
  Canvas.brush.Color:=AbsPathColor;
  Canvas.FillRect(rect);

  rect.Top:=rect.Top + 40;
  rect.Bottom:=rect.Bottom + 40;
  Canvas.brush.Color:=NotAbsPathColor;
  Canvas.FillRect(rect);

  rect.Top:=rect.Top + 40;
  rect.Bottom:=rect.Bottom + 40;
  Canvas.brush.Color:=HighlightExt;
  Canvas.FillRect(rect);

  rect.Top:=rect.Top+40;
  rect.Bottom:=rect.Bottom+40;
  Canvas.brush.Color:=HighlightInt;
  Canvas.FillRect(rect);

  CheckBox2.Checked:=PassabilityAutocorrection;
  CheckBox1.Checked:=MinorVersionAutoIncrement;
end;

procedure TFormColorOptions.B1Click(Sender: TObject);
begin
  if ColorDialog1.Execute then LineFromColor:=ColorDialog1.Color;
  repaint;
end;

procedure TFormColorOptions.B2Click(Sender: TObject);
begin
  if ColorDialog1.Execute then LineToColor:=ColorDialog1.Color;
  repaint;
end;

procedure TFormColorOptions.B3Click(Sender: TObject);
begin
  if ColorDialog1.Execute then PointerColor:=ColorDialog1.Color;
  repaint;
end;

procedure TFormColorOptions.B4Click(Sender: TObject);
begin
  if ColorDialog1.Execute then StartLocationColor:=ColorDialog1.Color;
  repaint;
end;

procedure TFormColorOptions.B5Click(Sender: TObject);
begin
  if ColorDialog1.Execute then EndLocationColor:=ColorDialog1.Color;
  repaint;
end;

procedure TFormColorOptions.B6Click(Sender: TObject);
begin
  if ColorDialog1.Execute then DefaultLocationColor:=ColorDialog1.Color;
  repaint;
end;

procedure TFormColorOptions.B7Click(Sender: TObject);
begin
  if ColorDialog1.Execute then HighlightExt:=ColorDialog1.Color;
  repaint;
end;

procedure TFormColorOptions.Button1Click(Sender: TObject);
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
  BackGroundColor:=TColor($00aaaaaa);
  HighlightExt:=TColor($00000000);//TColor($00EB57FB);
  HighlightInt:=TColor($004080FF);
  PathHelpPanelColor:=TColor($0098E2E7);//TColor($00B8F1F0);
  LocationHelpPanelColor:=TColor($0098E2E7);
  AbsPathColor:=TColor($00ff0000);
  NotAbsPathColor:=TColor($000000ff);
	DrawPathType:=0;
  DrawPathTypeRG.ItemIndex:=0;
  ParNameHelpPanelRG.ItemIndex:=2;

  SameQNoDescrStartColor:=TColor($0096c8f5);
  SameQNoDescrEndColor:=TColor($00000080);
  SameQDescrStartColor:=TColor($00ffffff);
  SameQDescrEndColor:=TColor($00000080);
  VoidObjectColor:=TColor($00004000);
  VoidObjectStartColor:=TColor($00FFFFFF);

  PassabilityAutocorrection:=false;
  MinorVersionAutoIncrement:=false;
  
  SPN:=8;

  repaint;
end;

procedure TFormColorOptions.Button2Click(Sender: TObject);
begin
  if ColorDialog1.Execute then FailLocationColor:=ColorDialog1.Color;
  repaint;
end;

procedure TFormColorOptions.Button3Click(Sender: TObject);
begin
  if ColorDialog1.Execute then VoidLineFromColor:=ColorDialog1.Color;
  repaint;
end;

procedure TFormColorOptions.Button4Click(Sender: TObject);
begin
  if ColorDialog1.Execute then VoidLineToColor:=ColorDialog1.Color;
  repaint;
end;

procedure TFormColorOptions.Button6Click(Sender: TObject);
begin
  if ColorDialog1.Execute then BackGroundColor:=ColorDialog1.Color;
  repaint;
end;

procedure TFormColorOptions.Button8Click(Sender: TObject);
begin
  if ColorDialog1.Execute then HighlightInt:=ColorDialog1.Color;
  repaint;
end;

procedure TFormColorOptions.Button10Click(Sender: TObject);
begin
  if ColorDialog1.Execute then PathHelpPanelColor:=ColorDialog1.Color;
  repaint;
end;

procedure TFormColorOptions.Button11Click(Sender: TObject);
begin
  if ColorDialog1.Execute then locationHelpPanelColor:=ColorDialog1.Color;
  repaint;
end;

procedure TFormColorOptions.DrawPathTypeRGClick(Sender: TObject);
begin
  DrawPathType:=DrawPathTypeRG.ItemIndex;
end;

procedure TFormColorOptions.Button12Click(Sender: TObject);
begin
  if ColorDialog1.Execute then AbsPathColor:=ColorDialog1.Color;
  repaint;
end;

procedure TFormColorOptions.Button13Click(Sender: TObject);
begin
  if ColorDialog1.Execute then NotAbsPathColor:=ColorDialog1.Color;
  repaint;
end;

procedure TFormColorOptions.FormShow(Sender: TObject);
begin
  DrawPathTypeRG.ItemIndex:=DrawPathType;
end;

procedure TFormColorOptions.Button15Click(Sender: TObject);
begin
  if ColorDialog1.Execute then SameQNoDescrStartColor:=ColorDialog1.Color;
  repaint;
end;

procedure TFormColorOptions.Button14Click(Sender: TObject);
begin
  if ColorDialog1.Execute then SameQNoDescrEndColor:=ColorDialog1.Color;
  repaint;
end;

procedure TFormColorOptions.Button16Click(Sender: TObject);
begin
  if ColorDialog1.Execute then VoidObjectColor:=ColorDialog1.Color;
  repaint;
end;

procedure TFormColorOptions.Button17Click(Sender: TObject);
begin
  FormMain.ChooseFont;
end;

procedure TFormColorOptions.Button18Click(Sender: TObject);
begin
  if ColorDialog1.Execute then VoidObjectStartColor:=ColorDialog1.Color;
  repaint;
end;

procedure TFormColorOptions.Button20Click(Sender: TObject);
begin
  if ColorDialog1.Execute then SameQDescrStartColor:=ColorDialog1.Color;
  repaint;
end;

procedure TFormColorOptions.Button19Click(Sender: TObject);
begin
  if ColorDialog1.Execute then SameQDescrEndColor:=ColorDialog1.Color;
  repaint;
end;

procedure TFormColorOptions.CheckBox2Click(Sender: TObject);
begin
  PassabilityAutocorrection:=CheckBox2.Checked;
  repaint;
end;

procedure TFormColorOptions.CheckBox1Click(Sender: TObject);
begin
  MinorVersionAutoIncrement:=CheckBox1.Checked;
  repaint;
end;

end.
