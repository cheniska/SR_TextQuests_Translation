program TGE;

uses
  Forms,
  SysUtils,
  Dialogs,
  LocationEditForm in 'Forms\LocationEditForm.pas',
  MainForm in 'Forms\MainForm.pas',
  PathEditForm in 'Forms\PathEditForm.pas',
  MainPropertiesEdit in 'Forms\MainPropertiesEdit.pas',
  PlayForm in 'Forms\PlayForm.pas',
  ColorOptionsForm in 'Forms\ColorOptionsForm.pas',
  SearchForm in 'Forms\SearchForm.pas',
  EC_BlockPar in 'EC\EC_BlockPar.pas',
  EC_Buf in 'EC\EC_Buf.pas',
  EC_File in 'EC\EC_File.pas',
  EC_Mem in 'EC\EC_Mem.pas',
  EC_Str in 'EC\EC_Str.pas',
  EC_Struct in 'EC\EC_Struct.pas',
  MessageText in 'Classes\MessageText.pas',
  TextQuest in 'Classes\TextQuest.pas',
  CalcParseClass in 'Classes\CalcParseClass.pas',
  CPDiapClass in 'Classes\CPDiapClass.pas',
  CPVarClass in 'Classes\CPVarClass.pas',
  LocationClass in 'Classes\LocationClass.pas',
  ParameterClass in 'Classes\ParameterClass.pas',
  ParameterDeltaClass in 'Classes\ParameterDeltaClass.pas',
  ParViewStringClass in 'Classes\ParViewStringClass.pas',
  PathClass in 'Classes\PathClass.pas',
  TextFieldClass in 'Classes\TextFieldClass.pas',
  ValueListClass in 'Classes\ValueListClass.pas',
  EventClass in 'Classes\EventClass.pas',
  ParamEdit in 'Forms\ParamEdit.pas',
  SequenceClass in 'Classes\SequenceClass.pas',
  TextQuestInterface in 'Classes\TextQuestInterface.pas',
  ClipboardFixer in 'Forms\ClipboardFixer.pas',
  VersionForm in 'Forms\VersionForm.pas';

{$R *.RES}

var s:string;
    i:integer;

begin
  Application.Initialize;

  s:=ParamStr(0);
  for i:=Length(s) downto 1 do
    if s[i]='\' then
    begin
      SetLength(s,i-1);
      SetCurrentDir(s);
      break;
    end;

  MessageText.QuestMessages:=TQuestMessages.Create;
  MessageText.QuestMessages.LoadFromFile('messages_cfg.txt');
  Application.Title := 'TGE';
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormLocationEdit, FormLocationEdit);
  Application.CreateForm(TFormPathEdit, FormPathEdit);
  Application.CreateForm(TFormPropertiesEdit, FormPropertiesEdit);
  Application.CreateForm(TFormPlay, FormPlay);
  Application.CreateForm(TFormColorOptions, FormColorOptions);
  Application.CreateForm(TFormLPSearch, FormLPSearch);
  Application.CreateForm(TFormParamEdit, FormParamEdit);
  Application.CreateForm(TFormVersion, FormVersion);
  FormLPSearch.Hide;


  if ParamCount>0 then FormMain.LoadFromFile(ParamStr(1));

  Application.Run;
end.

