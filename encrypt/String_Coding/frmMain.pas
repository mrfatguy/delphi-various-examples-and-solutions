unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TMainForm = class(TForm)
    Label1: TLabel;
    mText: TMemo;
    mCoded: TMemo;
    Label3: TLabel;
    btnCode: TButton;
    btnExit: TButton;
    mDecoded: TMemo;
    Label2: TLabel;
    ePass: TEdit;
    Label4: TLabel;
    function CodeString(Text: String; Password: String; Coding: Boolean): String;

    procedure CheckIfCanCode(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnCodeClick(Sender: TObject);
    procedure SelectAllOnEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

function TMainForm.CodeString(Text: String; Password: String; Coding: Boolean): String;
var
        i, len_pass: Integer;
        tmp_str: String;
        byte_in, byte_out, byte_pass: Byte;
begin
        len_pass := Length(Password);

        for i := 1 to Length(Text) do
        begin
                byte_in := Ord(Text[i]);
	        byte_pass := Ord(Password[i mod len_pass]);
	        if Coding then
	                byte_out := (byte_in + byte_pass) mod 256
	        else
                        byte_out := (256 + (byte_in - byte_pass)) mod 256;

                tmp_str:= tmp_str + Chr(byte_out);
        end;

        Result := tmp_str;
end;


procedure TMainForm.CheckIfCanCode(Sender: TObject);
begin
        btnCode.Enabled := (Length(ePass.Text) > 0) and (Length(mText.Text) > 0);
end;

procedure TMainForm.btnExitClick(Sender: TObject);
begin
        Application.Terminate;
end;

procedure TMainForm.btnCodeClick(Sender: TObject);
begin
        mCoded.Clear;
        mCoded.Text := CodeString(mText.Text, ePass.Text, True);

        mDecoded.Clear;
        mDecoded.Text := CodeString(mCoded.Text, ePass.Text, False);
end;

procedure TMainForm.SelectAllOnEnter(Sender: TObject);
begin
        (Sender as TMemo).SelectAll;
end;

end.
