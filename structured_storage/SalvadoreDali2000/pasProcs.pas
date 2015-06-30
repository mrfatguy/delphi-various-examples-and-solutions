unit pasProcs;

interface

uses Windows;

   function MyInputDialog(Caption, Text, Default: String; IsPassword: Boolean): String;
   function RecalculateImageSize(CurrentW, CurrentH, DesiredW, DesiredH: Integer): TPoint;

implementation

uses frmMyInputDialog;

function MyInputDialog(Caption, Text, Default: String; IsPassword: Boolean): String;
begin
	Result:='$#CANCEL%#$';
	if IsPassword then
	begin
		InputDialog.eText.PasswordChar:='*';
		InputDialog.imgMain.Picture.Bitmap:=InputDialog.imgSecurity.Picture.Bitmap;
	end
	else
	begin
		InputDialog.eText.PasswordChar:=#0;
		InputDialog.imgMain.Picture.Bitmap:=InputDialog.imgQuestion.Picture.Bitmap;
	end;
	InputDialog.Caption:=Caption;
	InputDialog.lText.Caption:=Text;
	InputDialog.eText.Text:=Default;
	if InputDialog.ShowModal=2 then exit;
	Result:=InputDialog.eText.Text;
end;

function RecalculateImageSize(CurrentW, CurrentH, DesiredW, DesiredH: Integer): TPoint;
begin
	if (CurrentW=0) or (CurrentH=0) then
	begin
		Result.X:=0;
		Result.Y:=0;
		exit;
	end;

	if CurrentW>CurrentH then
	begin
		Result.X:=DesiredW;
		Result.Y:=Trunc(CurrentH / (CurrentW / DesiredW));
	end
	else
	begin
		Result.X:=Trunc(CurrentW / (CurrentH / DesiredH));
		Result.Y:=DesiredH;
	end;
end;

end.
