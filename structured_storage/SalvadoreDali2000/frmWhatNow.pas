unit frmWhatNow;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TWhatNowForm = class(TForm)
    lblSourceSize: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblAlbumSize: TLabel;
    lblPhotoCount: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblTime: TLabel;
    rgDecision: TRadioGroup;
    btnOK: TButton;
    sDialog: TSaveDialog;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WhatNowForm: TWhatNowForm;

implementation

uses frmNewEdit;

{$R *.DFM}

procedure TWhatNowForm.btnOKClick(Sender: TObject);
var
	fSrc, fDest: String;
begin
	case rgDecision.ItemIndex of
	0:
		begin
			WhatNowForm.Close;
			NewEditForm.Close;
		end;
	1:
		begin
			if sDialog.Execute then
			begin
				fSrc:=ExtractFilePath(Application.ExeName)+'temp.maf';
				fDest:=sDialog.FileName;
				if FileExists(fSrc) then
				begin
					CopyFile(PChar(fSrc),PChar(fDest),False);
					DeleteFile(fSrc)
				end
				else Application.MessageBox(PChar('Utworzony plik tymczasowy albumu:'+chr(13)+fSrc+chr(13)+''+chr(13)+'nie istnieje lub jest niedostêpny.'),'B³¹d!',MB_OK+MB_ICONERROR+MB_DEFBUTTON1); 
			end;
			WhatNowForm.Close;
			NewEditForm.Close;
		end;
	2:
		begin
                	WhatNowForm.Close;
		end;
	end;
end;

end.
