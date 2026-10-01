unit ClipboardFixer;

interface

uses Windows,Forms,Classes,Menus;

procedure CreateOwnClipboard(form:TForm; var pmenu:TPopupMenu);
procedure ProcessControl(el:TComponent);

procedure ClipboardCopy(const Text: String);
function  ClipboardPaste:string;

implementation

uses Clipbrd,Messages,SysUtils,StdCtrls,ExtCtrls,ComCtrls,Dialogs,MessageText;

procedure ClipboardCopy(const Text: String);
var Len, wLen: Integer;
    hClip: THandle;
    pwStr: PWideChar;
begin
  with Clipboard do
  begin
    Open;
    try
      if (Win32Platform = VER_PLATFORM_WIN32_NT) then
      begin
        Len := Length(Text) + 1;
        wLen := Len shl 1;
        hClip := GlobalAlloc(GMEM_MOVEABLE, wLen);
        try
          pwStr := PWideChar(GlobalLock(hClip));
          MultiByteToWideChar(CP_ACP, MB_PRECOMPOSED, PChar(Text), Len, pwStr, wLen);
          GlobalUnlock(hClip);
          SetAsHandle(CF_UNICODETEXT, hClip);
        except
          GlobalFree(hClip);
          raise;
        end;
        
      end else
        SetTextBuf(PChar(Text));
    finally
      Close;
    end;
  end;
end;

function  ClipboardPaste:string;
var Len, wLen: Integer;
    hClip: THandle;
    pwStr: PWideChar;
begin
  Result := '';
  with Clipboard do
  try
    Open;
    if HasFormat(CF_TEXT) or HasFormat(CF_UNICODETEXT) then
    begin
      if (Win32Platform = VER_PLATFORM_WIN32_NT) then
      begin
        hClip := GetAsHandle(CF_UNICODETEXT);
        pwStr := GlobalLock(hClip);
        wlen := GlobalSize(hClip);
        try
          Len := (wLen div 2) - 1;
          SetLength(Result, Len);
          WideCharToMultiByte(CP_ACP, 0, pwStr, wlen, PChar(Result), Len, nil, nil);
        finally
          GlobalUnlock(hClip);
        end;

      end else begin
        hClip := GetAsHandle(CF_TEXT);
        Len := GlobalSize(hClip);
        SetLength(Result, Len);
        SetLength(Result, GetTextBuf(PChar(Result), Len));

      end;
    end;
  finally
    Close;
  end;
end;


function NewMemoProc(wnd:HWND; uMsg:UINT; wParam:WPARAM; lParam:LPARAM):integer; stdcall;
begin
  case uMsg of
  WM_COPY:
    begin
      uMsg:=0;
    end;
  WM_CUT:
    begin
      SendMessage(wnd,EM_REPLACESEL,1,cardinal(pchar('')));
      uMsg:=0;
    end;
  WM_PASTE:
    begin
      uMsg:=0;
    end;
  end;
  Result:=CallWindowProc(Pointer(GetWindowLong(wnd,GWL_USERDATA)), wnd,uMsg,wParam,lParam);
end;

procedure ProcessControl(el:TComponent);
var h: hwnd;
    //c: TComboBoxInfo;
begin
    if el is TEdit then h:= TEdit(el).Handle
    //else if el is TRichEdit then h:= TRichEdit(el).Handle
    else if el is TLabeledEdit then h:= TLabeledEdit(el).Handle
    else if el is TMemo then h:= TMemo(el).Handle
    {else if el is TComboBox then
    begin
      c.cbSize:= SizeOf(TCOMBOBOXINFO);
      GetComboBoxInfo(TComboBox(el).Handle,c);
      h:= c.hwndItem;
    end}
    else exit;

    SetWindowLong(h,GWL_USERDATA,SetWindowLong(h,GWL_WNDPROC, LPARAM(@NewMemoProc)));

end;

type
  TDummyForm = class(TForm)
  procedure HandlePopupItem(Sender: TObject);
  procedure OnMenuPopup(Sender: TObject);
end;
var dummyForm:TDummyForm = nil;
const cntMenuItems = 6;
const menuItems : array[1..cntMenuItems] of WideString = ('Undo','Copy','Cut','Paste','SelectAll','Color');
const menuKeys  : array[1..cntMenuItems] of Char = ('Z','C','X','V','A','r');
const editKeys  : array[1..cntMenuItems] of boolean = (true,true,true,true,true,false);

procedure TDummyForm.OnMenuPopup(Sender:TObject);
var obj:TComponent;
    i:integer;
begin
  obj:=TPopupMenu(Sender).PopupComponent;
  for i:=1 to cntMenuItems do
  begin
    if editKeys[i] then continue;
    TPopupMenu(Sender).Items[i-1].Visible :=(obj is TMemo) or (obj is TRichEdit) or ((obj.Owner<>nil) and (obj.Owner is TScrollBox));
  end;
end;

procedure TDummyForm.HandlePopupItem(Sender:TObject);
var i:integer;
    key:Word;
    obj:TComponent;
    h: hwnd;
    s:string;

    function AddColorTag(txt:string):string;
    begin
      Result:='<clr>' +  txt + '<clrEnd>';
    end;

begin
  obj:=TPopupMenu(TMenuItem(Sender).GetParentMenu).PopupComponent;
  i:=TMenuItem(Sender).Tag;

  if obj is TEdit then h:= TEdit(obj).Handle
  else if obj is TRichEdit then h:= TRichEdit(obj).Handle
  else if obj is TLabeledEdit then h:= TLabeledEdit(obj).Handle
  else if obj is TMemo then h:= TMemo(obj).Handle
  else exit;

  if i=1 then //undo
  begin
    TCustomEdit(obj).Undo;
    {if obj is TEdit then TEdit(obj).Undo
    else if obj is TRichEdit then TRichEdit(obj).Undo
    else if obj is TLabeledEdit then TLabeledEdit(obj).Undo
    else if obj is TMemo then TMemo(obj).Undo;}
    exit;
  end;



  if i=6 then //clr
  begin
    s:=AddColorTag(TCustomEdit(obj).SelText);
    SendMessage (h, EM_REPLACESEL, 1, cardinal(@s [1]));

    {if obj is TEdit then TEdit(obj).SelText:=AddColorTag(TEdit(obj).SelText)
    else if obj is TRichEdit then TRichEdit(obj).SelText:=AddColorTag(TEdit(obj).SelText)
    else if obj is TLabeledEdit then TLabeledEdit(obj).SelText:=AddColorTag(TEdit(obj).SelText)
    else if obj is TMemo then TMemo(obj).SelText:=AddColorTag(TEdit(obj).SelText); }
    exit;
  end;

  key:=Ord(menuKeys[i]);
  if obj is TEdit then TEdit(obj).OnKeyDown(obj, key, [ssCtrl])
  else if obj is TRichEdit then
  begin
    if Key = ord('V') then
     begin
       s:=ClipboardPaste;
       SendMessage (h, EM_REPLACESEL, 1, cardinal(@s [1]));
     end;
     if (Key = ord('C')) or (Key = ord('X')) then ClipboardCopy(TRichEdit(obj).SelText);
     //if Key = ord('X') then SendMessage(h,EM_REPLACESEL,1,cardinal(pchar('')));
     if Key = ord('A') then TRichEdit(obj).SelectAll;
  end
  else if obj is TLabeledEdit then TLabeledEdit(obj).OnKeyDown(obj, key, [ssCtrl])
  else if obj is TMemo then TMemo(obj).OnKeyDown(obj, key, [ssCtrl]);
  //else if obj is TEdit then TEdit(obj).OnKeyDown(obj, key, [ssCtrl]);

  if i=3 then //cut
  begin
    TCustomEdit(obj).ClearSelection;
    {if obj is TEdit then TEdit(obj).ClearSelection
    else if obj is TRichEdit then TRichEdit(obj).ClearSelection
    else if obj is TLabeledEdit then TLabeledEdit(obj).ClearSelection
    else if obj is TMemo then TMemo(obj).ClearSelection;}
    exit;
  end;
end;


procedure CreateOwnClipboard(form:TForm; var pmenu:TPopupMenu);
var i: integer;
    Item:TMenuItem;
begin
  pmenu:=TPopupMenu.Create(form);
  pmenu.OnPopup:=dummyForm.OnMenuPopup;
  for i := 1 to cntMenuItems do
  begin
    Item := TMenuItem.Create(pmenu);
    Item.Caption := QuestMessages.ParPath_Get('PopupMenu.'+menuItems[i]);
    Item.OnClick := dummyForm.HandlePopupItem;
    Item.Tag:=i;
    pmenu.Items.Add(Item);
  end;
  with form do for i:=0 to componentCount - 1 do
  begin
    if Components[i] is TEdit then TEdit(Components[i]).PopupMenu:=pmenu
    //else if Components[i] is TRichEdit then TRichEdit(Components[i]).PopupMenu:=pmenu
    else if Components[i] is TLabeledEdit then TLabeledEdit(Components[i]).PopupMenu:=pmenu
    else if Components[i] is TMemo then TMemo(Components[i]).PopupMenu:=pmenu
    //else if Components[i] is TComboBox then TComboBox(Components[i]).PopupMenu:=pmenu
    else continue;
    ProcessControl(Components[i]);
  end;

end;

end.
