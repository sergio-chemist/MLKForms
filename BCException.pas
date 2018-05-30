unit BCException;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ActnList, Clipbrd, System.Actions;

type
  EBCException = class(Exception)
  private
    FBriefMessage: AnsiString;
  public
    property BriefMessage: AnsiString read FBriefMessage;
    constructor Create(const Msg, BriefMsg: string);
  end;

  TBCExceptionDlg = class(TForm)
    ImageError: TImage;
    MemoBrief: TMemo;
    ButtonOK: TButton;
    ButtonDetails: TButton;
    MemoDetails: TMemo;
    BevelDetail: TBevel;
    alException: TActionList;
    acCancel: TAction;
    acCopy: TAction;
    procedure FormShow(Sender: TObject);
    procedure ButtonDetailsClick(Sender: TObject);
    procedure acOKExecute(Sender: TObject);
    procedure acCopyExecute(Sender: TObject);
    procedure acCopyUpdate(Sender: TObject);
    procedure MemoDetailsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MemoBriefClick(Sender: TObject);
    procedure ButtonOKExit(Sender: TObject);
  private
    FShowDetails: boolean;
  protected
    m_e: Exception;
    procedure SetShowDetails(aShowDetails: boolean); virtual;
  public
    class procedure ShowException(E: Exception);
    property ShowDetails: boolean read FShowDetails write SetShowDetails;
  end;

var
  BCExceptionDlg: TBCExceptionDlg;

implementation



{$R *.dfm}

constructor EBCException.Create(const Msg, BriefMsg: string);
begin
    inherited Create(Msg);
    FBriefMessage := BriefMsg;
end;

class procedure TBCExceptionDlg.ShowException(E: Exception);
begin
    BCExceptionDlg := TBCExceptionDlg.Create(Application);
    try
        BCExceptionDlg.m_e := E;
        BCExceptionDlg.ShowDetails := false;
        BCExceptionDlg.ShowModal;
    finally
        BCExceptionDlg.Free;
    end;
end;

procedure TBCExceptionDlg.FormShow(Sender: TObject);
begin
    MemoDetails.Text := StringReplace(m_e.Message, #$A, #13#10, [rfReplaceAll]);
    if MemoDetails.Lines.Count > 6 then
      MemoDetails.ScrollBars := ssVertical;
    ShowDetails := false;

    if m_e.InheritsFrom(EBCException) then
        MemoBrief.Text := (m_e as EBCException).BriefMessage
    else
        MemoBrief.Text := m_e.Message;

    if MemoBrief.Text = '' then MemoBrief.Text := 'UNKNOWN_ERROR';
end;

procedure TBCExceptionDlg.SetShowDetails(aShowDetails: boolean);
begin
    FShowDetails := aShowDetails;
    if ShowDetails then begin
        Height := Height + 114; // 265;
        ButtonDetails.Caption := '<< Кратко';
    end else begin
        Height := ButtonOK.Top + ButtonOK.Height + 30;// BevelDetail.Top; //151;
        ButtonDetails.Caption := 'Подробно >>';
    end;
end;

procedure TBCExceptionDlg.ButtonDetailsClick(Sender: TObject);
begin
    ShowDetails := not ShowDetails;
end;

procedure TBCExceptionDlg.acOKExecute(Sender: TObject);
begin
  ModalResult := mrOK;
  Close;
end;

procedure TBCExceptionDlg.acCopyExecute(Sender: TObject);
begin
  If ShowDetails then
    Clipboard.AsText := MemoDetails.Text
  else
    Clipboard.AsText := MemoBrief.Text;
end;

procedure TBCExceptionDlg.acCopyUpdate(Sender: TObject);
begin
  (Sender As TAction).Enabled := NOT (MemoBrief.Focused or MemoDetails.Focused);
end;

procedure TBCExceptionDlg.MemoDetailsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  HideCaret (TWinControl (Sender).Handle);
  If ((Key = VK_INSERT) OR (Key = ord('c')) OR (Key = ord('C'))) OR
     ((ssCtrl in Shift) OR (ssLeft in Shift)) then
    key := key
  else
  begin
    if Key <> 0 then ButtonOK.SetFocus;
    key := 0;
  end;
end;

procedure TBCExceptionDlg.MemoBriefClick(Sender: TObject);
begin
  PostMessage((Sender As TMemo).Handle, WM_KEYDOWN, 0, 0);
end;

procedure TBCExceptionDlg.ButtonOKExit(Sender: TObject);
begin
if Not (ssLeft in KeyboardStateToShiftState) then
  FindNextControl(TWinControl(Sender),True,True,False).SetFocus;
end;

end.

