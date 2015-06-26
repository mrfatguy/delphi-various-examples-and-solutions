unit pasProcs;

interface

uses
        SysUtils;

   function MyInputDialog(Caption, Text, Default: String; IsPassword: Boolean): String;

implementation

uses frmMyInputDialog;

function MyInputDialog(Caption, Text, Default: String; IsPassword: Boolean): String;
begin
        Result:='$#%CANCEL%#$';
        if IsPassword then InputDialogForm.eText.PasswordChar:='*' else InputDialogForm.eText.PasswordChar:=#0;
        InputDialogForm.Caption:=Caption;
        InputDialogForm.lText.Caption:=Text;
        InputDialogForm.eText.Text:=Default;
        if InputDialogForm.ShowModal=2 then exit;
        Result:=InputDialogForm.eText.Text;
end;

end.
