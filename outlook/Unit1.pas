unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, ToolWin;

type
  TForm1 = class(TForm)
    pnlOutLookFrame: TPanel;
    pnlOutLookContainer: TPanel;
    tlbOutLook1: TToolBar;
    btnOutLook1: TToolButton;
    pnlOutLook1: TPanel;
    tlbOutLook2: TToolBar;
    btnOutLook2: TToolButton;
    pnlOutLook2: TPanel;
    procedure OutLookButtonClick(Sender: TObject);
    procedure ToolBarResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.OutLookButtonClick(Sender: TObject);
var
	AlignTo: TAlign;
  ShowPanel: Boolean;
  i, iLastControl: Integer;
begin
  ShowPanel := False;
  AlignTo := alTop;

	for i := 0 to (pnlOutLookContainer.ControlCount - 1) do
	begin

  	if (pnlOutLookContainer.Controls[i] is TToolBar) then
    begin
     	with pnlOutLookContainer.Controls[i] as TToolBar do
        Align := AlignTo;
			if (pnlOutLookContainer.Controls[i] as TToolBar) = (Sender as TToolButton).Parent then
      begin
      	ShowPanel := True;
        AlignTo := alClient;
      end;
    end
    else
	  	if (pnlOutLookContainer.Controls[i] is TPanel) then
      	with pnlOutLookContainer.Controls[i] as TPanel do
        begin
          Visible := ShowPanel;
          Align := AlignTo;
          if ShowPanel then
          begin
					  ShowPanel := False;
					  AlignTo := alBottom;
            iLastControl := i + 1;
            Break;
          end;
        end;

	end;

	for i := (pnlOutLookContainer.ControlCount - 1) downto iLastControl do
	begin

  	if (pnlOutLookContainer.Controls[i] is TToolBar) then
    begin
     	with pnlOutLookContainer.Controls[i] as TToolBar do
        Align := AlignTo;
    end
    else
	  	if (pnlOutLookContainer.Controls[i] is TPanel) then
      	with pnlOutLookContainer.Controls[i] as TPanel do
        begin
          Visible := ShowPanel;
          Align := AlignTo;
        end;

	end;
end;

procedure TForm1.ToolBarResize(Sender: TObject);
begin
  with Sender as TToolBar do
  	ButtonWidth := Width;
end;










end.
