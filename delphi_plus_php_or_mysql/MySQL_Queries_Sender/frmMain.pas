unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons;

type
  TMainForm = class(TForm)
    LabelHost: TLabel;
    LabelUser: TLabel;
    LabelPass: TLabel;
    LabelPort: TLabel;
    LabelTime: TLabel;
    Label1: TLabel;
    Label19: TLabel;
    MySQLHost: TEdit;
    MySQLUser: TEdit;
    MySQLPass: TEdit;
    MySQLPort: TEdit;
    MySQLTime: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    MySQLDatabase: TEdit;
    btnClose: TButton;
    procedure btnCloseClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses frmLog;

{$R *.DFM}

procedure TMainForm.btnCloseClick(Sender: TObject);
begin
        Close;
end;

end.
