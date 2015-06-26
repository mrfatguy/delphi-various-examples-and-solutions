{______________________________________________________________________________

                     (c) 1998 Marcin Wieczorek ( T-1000 )
                         email:wieczor@polbox.com
 ______________________________________________________________________________}

unit UServerNetForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls;

type
  TServerNetForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Seconds:Integer;
  end;

var
  ServerNetForm: TServerNetForm;

implementation

uses UOptionsForm, UMainForm;

{$R *.DFM}

procedure TServerNetForm.FormShow(Sender: TObject);
begin
 Label2.Caption:=MainForm.ServerSocket1.Socket.LocalAddress+':'+IntToStr(OptionsForm.SpinEdit1.Value);
 ProgressBar1.Max:=OptionsForm.SpinEdit2.Value;
 Seconds:=0;
 ProgressBar1.Position:=Seconds;
 Timer1.Enabled:=True;
end;

procedure TServerNetForm.Timer1Timer(Sender: TObject);
begin
 Inc(Seconds);
 ProgressBar1.Position:=Seconds;
 if ProgressBar1.Position=ProgressBar1.Max then
 begin
  MainForm.DisconnectOponent;
  Close;
 end;
 if MainForm.Connected then Close;
end;

procedure TServerNetForm.Button1Click(Sender: TObject);
begin
 MainForm.DisconnectOponent;
 Close;
end;

procedure TServerNetForm.FormHide(Sender: TObject);
begin
 Timer1.Enabled:=False;
end;

end.
