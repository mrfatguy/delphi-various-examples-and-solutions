// tabs = 2
// -----------------------------------------------------------------------------------------------
//
//                      MySQL Client API for Delphi 4 and later - Test Suite
//
//                      Copyright © 1999, 2000 Medienagentur Fichtner & Meyer
//                                  Written by Matthias Fichtner
//
// -----------------------------------------------------------------------------------------------
//
//                       Please see mysql_test.dpr for detailed information.
//
// -----------------------------------------------------------------------------------------------
//                       Please send questions, bug reports and suggestions
//                      regarding this code to: mfichtner@fichtner-meyer.com
// -----------------------------------------------------------------------------------------------
//                        This code is provided "as is" without express or
//                     implied warranty of any kind. Use it at your own risk.
// -----------------------------------------------------------------------------------------------

unit mysql_test_dialog;

// -----------------------------------------------------------------------------------------------
INTERFACE
// -----------------------------------------------------------------------------------------------

uses
	Windows, SysUtils, Forms, Classes, Controls, StdCtrls;

type
	TDialog = class(TForm)
		LabelHost: TLabel;
		EditHost: TEdit;
		LabelPort: TLabel;
		EditPort: TEdit;
		LabelUser: TLabel;
		EditUser: TEdit;
		LabelPass: TLabel;
		EditPass: TEdit;
		LabelTime: TLabel;
		EditTime: TEdit;
		LabelSecs: TLabel;
		CheckComp: TCheckBox;
		CheckDebg: TCheckBox;
		CheckShut: TCheckBox;
		ButtonOK: TButton;
		ButtonCancel: TButton;
		procedure FormCreate(Sender: TObject);
	end;

var
	Dialog: TDialog;

// -----------------------------------------------------------------------------------------------
IMPLEMENTATION
// -----------------------------------------------------------------------------------------------

{$R *.DFM}

uses
	mysql, mysql_test_main;

procedure TDialog.FormCreate(Sender: TObject);
begin
	Caption := Main.Caption;
	EditHost.MaxLength := HOSTNAME_LENGTH;
	EditUser.MaxLength := USERNAME_LENGTH;
	EditPass.MaxLength := USERNAME_LENGTH;
	EditHost.Text := LOCAL_HOST;
	EditPort.Text := intToStr(MYSQL_PORT);
end;

end.

