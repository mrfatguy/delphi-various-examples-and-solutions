{______________________________________________________________________________

                     (c) 1998 Marcin Wieczorek ( T-1000 )
                         email:wieczor@polbox.com
 ______________________________________________________________________________}

unit UClientNetForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, StdCtrls;

type
  TClientNetForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Timer1: TTimer;
    ProgressBar1: TProgressBar;
    Button1: TButton;
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
  ClientNetForm: TClientNetForm;

implementation

uses UOptionsForm, UMainForm;

{$R *.DFM}

procedure TClientNetForm.FormShow(Sender: TObject);
begin
 Label2.Caption:=OptionsForm.Edit1.Text+':'+IntToStr(OptionsForm.SpinEdit1.Value);
 ProgressBar1.Max:=OptionsForm.SpinEdit2.Value;
 Seconds:=0;
 ProgressBar1.Position:=Seconds;
 Timer1.Enabled:=True;
end;

procedure TClientNetForm.Timer1Timer(Sender: TObject);
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

procedure TClientNetForm.Button1Click(Sender: TObject);
begin
 MainForm.DisconnectOponent;
 Close;
end;

procedure TClientNetForm.FormHide(Sender: TObject);
begin
 Timer1.Enabled:=False;
end;

end.
