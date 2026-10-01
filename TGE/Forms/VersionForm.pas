unit VersionForm;

interface

uses
  Classes, Controls, Forms, StdCtrls, ExtCtrls, ComCtrls;

type
  TFormVersion = class(TForm)
    UpDown1: TUpDown;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    UpDown2: TUpDown;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Label3: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormVersion: TFormVersion;

implementation

uses MainForm,MessageText,EC_Str,SysUtils;

{$R *.dfm}

procedure TFormVersion.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormVersion.Button1Click(Sender: TObject);
var i:integer;
    flag:boolean;
begin
  i:=strtointEC(Edit1.Text);
  if i<1 then i:=1;
  FormMain.Game.QuestMajorVersion:=i;
  flag:=(FormMain.Game.QuestMajorVersion<>i);
  i:=strtointEC(Edit2.Text);
  if i<0 then i:=0;
  flag:=flag or (FormMain.Game.QuestMinorVersion<>i);
  FormMain.Game.QuestMinorVersion:=i;
  FormMain.Game.QuestComment.Text:=Memo1.Text;
  if flag then FormMain.LastFileDate:=DateToStr(date);
  Close;
end;

procedure TFormVersion.FormShow(Sender: TObject);
begin
  Edit1.Text:=inttostrEC(FormMain.Game.QuestMajorVersion);
  Edit2.Text:=inttostrEC(FormMain.Game.QuestMinorVersion);
  Memo1.Text:=FormMain.Game.QuestComment.Text;
end;

procedure TFormVersion.FormCreate(Sender: TObject);
begin
  Caption:=QuestMessages.ParPath_Get('FormVersion.Caption');
  Label1.Caption:=QuestMessages.ParPath_Get('FormVersion.MajorVersion');
  Label2.Caption:=QuestMessages.ParPath_Get('FormVersion.MinorVersion');
  Label3.Caption:=QuestMessages.ParPath_Get('FormVersion.Comment');
  Button1.Caption:=QuestMessages.ParPath_Get('FormVersion.Ok');
  Button2.Caption:=QuestMessages.ParPath_Get('FormVersion.Cancel');
end;

end.
