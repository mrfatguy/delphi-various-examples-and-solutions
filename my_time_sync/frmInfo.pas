unit frmInfo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, ShellAPI, TFlatHintUnit;

type
  TInfoForm = class(TForm)
    imgLogo: TImage;
    lblURL: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    imgInscription: TImage;
    procedure GoToURL(Sender: TObject);
    procedure CloseWindow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InfoForm: TInfoForm;

implementation

{$R *.DFM}

procedure TInfoForm.GoToURL(Sender: TObject);
begin
        ShellExecute(Handle,'open','http://www.trejderowski.pl/','','',SW_SHOW);
end;

procedure TInfoForm.CloseWindow(Sender: TObject);
begin
        Close;
end;

procedure TInfoForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        if Key=27 then Close;
end;

end.
