unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TMainForm = class(TForm)
    Label1: TLabel;
    mHTML: TMemo;
    mText: TMemo;
    Label3: TLabel;
    btnStrip: TButton;
    btnExit: TButton;
    function RemoveHTML(Source: String): String;

    procedure CheckIfCanCode(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnStripClick(Sender: TObject);
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

function TMainForm.RemoveHTML(Source: String): String;
var
        i: Word;
        Tag: Shortint;
begin
        Result := '';
        Tag := 0;

        for i := 1 to Length(Source) do
        begin
                if Source[i] = '<' then Inc(Tag);

                if Tag = 0 then Result := Result + Source[i];

                if Source[i] = '>' then Dec(Tag);
        end;
end;

procedure TMainForm.CheckIfCanCode(Sender: TObject);
begin
        btnStrip.Enabled := (Length(mHTML.Text) > 0);
end;

procedure TMainForm.btnExitClick(Sender: TObject);
begin
        Application.Terminate;
end;

procedure TMainForm.btnStripClick(Sender: TObject);
begin
        mText.Clear;
        mText.Text := RemoveHTML(mHTML.Text);;
end;

procedure TMainForm.SelectAllOnEnter(Sender: TObject);
begin
        (Sender as TMemo).SelectAll;
end;

end.
