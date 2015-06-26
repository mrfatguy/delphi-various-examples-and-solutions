{______________________________________________________________________________

                     (c) 1998 Marcin Wieczorek ( T-1000 )
                         email:wieczor@polbox.com
 ______________________________________________________________________________}

unit UOptionsForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Spin, StdCtrls, ExtCtrls, ComCtrls;

type
  TOptionsForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    Button2: TButton;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Label4: TLabel;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    Edit1: TEdit;
    RadioGroup3: TRadioGroup;
    Label5: TLabel;
    SpinEdit1: TSpinEdit;
    CheckBox1: TCheckBox;
    ColorDialog1: TColorDialog;
    TabSheet4: TTabSheet;
    Memo1: TMemo;
    Button3: TButton;
    Button4: TButton;
    Label6: TLabel;
    SpinEdit2: TSpinEdit;
    CheckBox2: TCheckBox;
    RadioGroup4: TRadioGroup;
    RadioGroup5: TRadioGroup;
    RadioGroup6: TRadioGroup;
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioGroup6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Temp:Boolean;
  end;

var
  OptionsForm: TOptionsForm;

implementation

uses UMainForm;

{$R *.DFM}

function ShellExecuteA(H:THandle;A,B,C,D:PChar;E:Integer):Integer;stdcall;external 'SHELL32.DLL';

procedure TOptionsForm.Button3Click(Sender: TObject);
begin
 ShellExecuteA(Handle,'open','http://www.kki.net.pl/t1000','','',sw_ShowNormal);
end;

procedure TOptionsForm.Button4Click(Sender: TObject);
begin
 ShellExecuteA(Handle,'open','http://kki.net.pl/qrczak/','','',sw_ShowNormal);
end;

procedure TOptionsForm.RadioGroup1Click(Sender: TObject);
begin
 if (RadioGroup1.ItemIndex=2) and (RadioGroup2.ItemIndex=2)then
  RadioGroup2.ItemIndex:=1;
end;

procedure TOptionsForm.RadioGroup2Click(Sender: TObject);
begin
 if (RadioGroup1.ItemIndex=2) and (RadioGroup2.ItemIndex=2)then
  RadioGroup1.ItemIndex:=1;
end;

procedure TOptionsForm.FormHide(Sender: TObject);
var S1,S2:String;
begin
 MainForm.NetGame:=(RadioGroup1.ItemIndex=2)or(RadioGroup2.ItemIndex=2);
 MainForm.InProgress:=Temp;
 with RadioGroup2 do
  if ItemIndex=1 then S1:=RadioGroup5.Items[RadioGroup5.ItemIndex]
  else S1:=Items[ItemIndex];
 with RadioGroup1 do
  if ItemIndex=1 then S2:=RadioGroup4.Items[RadioGroup4.ItemIndex]
  else S2:=Items[ItemIndex];
 MainForm.Label9.Caption:=S1+' vs '+S2;
end;


procedure TOptionsForm.FormShow(Sender: TObject);
begin
 Temp:=MainForm.InProgress;
 MainForm.InProgress:=False;
end;

procedure TOptionsForm.RadioGroup6Click(Sender: TObject);
var H,C:THandle;
begin
 H:=GetCurrentProcess;
 C:=Idle_Priority_Class;
 case RadioGroup6.ItemIndex of
  0:C:=Realtime_Priority_Class;
  1:C:=High_Priority_Class;
  2:C:=Normal_Priority_Class;
  3:C:=Idle_Priority_Class;
 end;
 SetPriorityClass(H,C);
end;

end.
