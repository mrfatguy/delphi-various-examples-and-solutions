unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  TMainForm = class(TForm)
    Notebook: TNotebook;
    Label1: TLabel;
    Label2: TLabel;
    eName: TEdit;
    Label3: TLabel;
    eEmail: TEdit;
    Label4: TLabel;
    ePhone: TEdit;
    Label5: TLabel;
    btnOK: TButton;
    btnCancel: TButton;
    Image1: TImage;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblClientIdent: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    btnEnterNewData: TButton;
    btnRetry: TButton;
    btnCancelProcess: TButton;
    procedure SendForm;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelProcessClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnRetryClick(Sender: TObject);
    procedure btnEnterNewDataClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

uses Inet;

procedure TMainForm.SendForm;
var
	sHost, sDir, sName, sEmail, sPhone, sQuery, sReturn: String;
begin
	if eName.Text='' then
	begin
		ShowMessage('Proszê podaæ imiê i nazwisko!');
		eName.SetFocus;
		exit;
	end;
	if eEmail.Text='' then
	begin
		ShowMessage('Proszê podaæ adres e-mail!');
		eEmail.SetFocus;
		exit;
	end;
	if ePhone.Text='' then
	begin
		ShowMessage('Proszê podaæ telefon kontaktowy!');
		ePhone.SetFocus;
		exit;
	end;

	if not Connected then
	begin
		ShowMessage('Brak po³¹czenia z Internetem!');
		exit;
	end;

	Notebook.PageIndex:=1;
	Application.ProcessMessages;

	sHost:='localhost'; //Server Address
	sDir:='/kurs/projekt_06/add_user.php'; //Path to Script
	sName:=eName.Text;
	sEmail:=eEmail.Text;
	sPhone:=ePhone.Text;

	sQuery:=sDir+'?name='+sName+'&email='+sEmail+'&phone='+sPhone;

	sReturn:=SendData(sHost, '', sQuery, '');

	if (sReturn <> 'error') and (sReturn <> '') then
	begin
		lblClientIdent.Caption:=sReturn;
		Notebook.PageIndex:=2;
	end
	else Notebook.PageIndex:=3;
end;

procedure TMainForm.btnOKClick(Sender: TObject);
begin
	SendForm();
end;

procedure TMainForm.btnCancelProcessClick(Sender: TObject);
begin
	Application.Terminate;
end;

procedure TMainForm.btnCancelClick(Sender: TObject);
begin
	Application.Terminate;
end;

procedure TMainForm.btnRetryClick(Sender: TObject);
begin
	SendForm();
end;

procedure TMainForm.btnEnterNewDataClick(Sender: TObject);
begin
	Notebook.PageIndex:=0;
	eName.SetFocus;
end;

end.
