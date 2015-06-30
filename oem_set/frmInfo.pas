unit frmInfo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, ShellAPI, TFlatHintUnit, GIFImage;

type
  TInfo = class(TForm)
    Panel1: TPanel;
    Label13: TLabel;
    Label11: TLabel;
    Image3: TImage;
    Image1: TImage;
    Shape1: TShape;
    Label1: TLabel;
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
  Info: TInfo;

implementation

{$R *.DFM}

procedure TInfo.GoToURL(Sender: TObject);
begin
        ShellExecute(Handle,'open','http://www.trejderowski.com/','','',SW_SHOW);
end;

procedure TInfo.CloseWindow(Sender: TObject);
begin
        Close;
end;

procedure TInfo.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        if Key=27 then Close;
end;

end.
