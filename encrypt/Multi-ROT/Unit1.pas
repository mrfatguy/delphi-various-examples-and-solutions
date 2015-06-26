unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TMainForm = class(TForm)
    b: TButton;
    m: TMemo;
    e: TEdit;
    procedure bClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.bClick(Sender: TObject);
var
        b, a: Integer;
        t, s: String;
        charNum: Word;
begin
        m.Clear;
        s := e.Text;

        for a := 0 to 25 do
        begin
                t := '';

                for b := 1 to Length(s) do
                begin
                        charNum := Ord(s[b]);
                        inc(charNum, a);
                        t := t + Chr(charNum);
                end;

                m.Lines.Add(Trim(t));
        end;

        m.Lines.Add(StringOfChar('-', 25));

        for a := 25 downto 0 do
        begin
                t := '';

                for b := 1 to Length(s) do
                begin
                        charNum := Ord(s[b]);
                        dec(charNum, a);
                        t := t + Chr(charNum);
                end;

                m.Lines.Add(Trim(t));
        end;

        m.Text := Trim(m.Text);
end;

end.
