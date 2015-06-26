{
    OpenOffice.org Dictionary Installer - about box

    Last updated: 22 May 2002
    Copyright (C) 2002 Lee Corbin / OpenOffice.org
    lee@lcdweb.co.uk

    This program is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
}

unit about;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ShellApi;

type
  TAboutForm = class(TForm)
    SuiteLabel: TLabel;
    ProgramLabel: TLabel;
    VersionLabel: TLabel;
    CreditLabel: TLabel;
    HomepageLabel: TLabel;
    CloseButton: TBitBtn;
    Label1: TLabel;
    EmailLabel: TLabel;
    procedure CloseButtonClick(Sender: TObject);
    procedure HomepageLabelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EmailLabelClick(Sender: TObject);
  private
  public
  end;

    {Even uglier hack. This allows us to change the protected font
    property of some controls. Used in SetCharSet() }
    TAboutFooClass = class(TControl);

var
  AboutForm: TAboutForm;

implementation

uses Unit1;

{$R *.dfm}

procedure TAboutForm.CloseButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TAboutForm.HomepageLabelClick(Sender: TObject);
begin
    // Go to the program home page
    ShellExecute(Application.Handle, 'open', PChar(PROG_URL), nil, nil, 0);
end;

procedure TAboutForm.FormShow(Sender: TObject);
var
  i: Integer;
begin
    for i := ComponentCount - 1 downto 0 do
        if Components[i] is TControl then
            TAboutFooClass(Components[i]).Font.Charset := ProgramCharSet;
end;

procedure TAboutForm.EmailLabelClick(Sender: TObject);
begin
    // Hard coded for now
    ShellExecute(Application.Handle, 'open', 'mailto:leecorbin@openoffice.org', nil, nil, 0)
end;

end.
