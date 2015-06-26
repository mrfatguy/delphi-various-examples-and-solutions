unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ShellAPI;

type
  TMainForm = class(TForm)
    btnStart: TButton;
    mMain: TMemo;
    lblLink: TLinkLabel;
    lblCount: TLabel;
    eVovels: TEdit;
    eNonVovels: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnStartClick(Sender: TObject);
    procedure lblLinkLinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.btnStartClick(Sender: TObject);
var
        a, b: Integer;
        VOVELS, NONVOVLES, sVov, sNon, sNon2, sTmp: String;
begin
        Screen.Cursor := crHourglass;

        VOVELS := eVovels.Text;
        NONVOVLES := eNonVovels.Text;

        if (VOVELS = '') then VOVELS := 'oea';
        if (NONVOVLES = '') then NONVOVLES := 'bdfgmnrwz';

        mMain.Clear();

        for a := 1 to Length(VOVELS) do
        begin
                sVov := VOVELS[a];

                for b := 1 to Length(NONVOVLES) do
                begin
                        sNon := NONVOVLES[b];
                        sTmp := sNon + sVov + sVov + sNon + 'le.com';

                        if mMain.Lines.IndexOf(sTmp) < 0 then mMain.Lines.Add(sTmp);

                        sNon2 := NONVOVLES[Random(Length(NONVOVLES)) + 1];
                        sTmp := sNon + sVov + sVov + sNon2 + 'le.com';

                        if mMain.Lines.IndexOf(sTmp) < 0 then mMain.Lines.Add(sTmp);
                end;
        end;

        lblCount.Caption := 'List contains ' + IntToStr(mMain.Lines.Count) + ' items.';

        Screen.Cursor := crDefault;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
        Randomize();
end;

procedure TMainForm.lblLinkLinkClick(Sender: TObject; const Link: string;
  LinkType: TSysLinkType);
begin
        ShellExecute(Handle, 'open', PChar(Link), '', '', SW_SHOW);
end;

end.
