unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;


const

  MAIN_FORM_CLASS = 'TfrmMain';

  { UM stands for User Message }
  UM_APP_ID_CHECK                = WM_APP + 101;
  UM_RESTORE_APPLICATION         = WM_APP + 102;
  UM_PREVIOUS_INST_PARAMS        = WM_APP + 103;

  { a user defined unique app id }
  APP_ID                         = 123456;


  
type
  TfrmMain = class(TForm)
    edtParams: TEdit;
    btnClear: TButton;
    procedure btnClearClick(Sender: TObject);
  private
    { Private declarations }
    procedure UMAppIDCheck(var Message : TMessage); message UM_APP_ID_CHECK;
    procedure UMRestoreApplication(var Message : TMessage); message UM_RESTORE_APPLICATION;
    procedure UMPreviousInstParams(var Message : TMessage); message UM_PREVIOUS_INST_PARAMS;
  public
    { Public declarations }
    procedure HandleParams(S : string);
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.DFM}






{----------------------------------------------------------------------------------}
procedure TfrmMain.UMAppIDCheck(var Message: TMessage);
begin
  Message.Result := APP_ID;
end;
{----------------------------------------------------------------------------------}
procedure TfrmMain.UMRestoreApplication(var Message: TMessage);
begin
  if IsIconic(Application.Handle) then Application.Restore else Application.BringToFront;
end;
{----------------------------------------------------------------------------------}
procedure TfrmMain.UMPreviousInstParams(var Message: TMessage);
var
 Len : integer;
 S   : string;
begin
  SetLength(S, MAX_PATH);
  Len := GlobalGetAtomName(Message.wParam, PChar(S), MAX_PATH);
  if Len = 0
  then RaiseLastWin32Error
  else
    begin
      SetLength(S, Len);
      HandleParams(S);
    end;
end;
{----------------------------------------------------------------------------------}
procedure TfrmMain.HandleParams(S: string);
begin
  edtParams.Text := S;
end;
{----------------------------------------------------------------------------------}
procedure TfrmMain.btnClearClick(Sender: TObject);
begin
  edtParams.Text := '';
end;

end.
